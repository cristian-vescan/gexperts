{.GXFormatter.config=twm}
/// <summary> implements some utility functions for converting TDateTime to and from strings
///           in ISO 6801 format (note that these functions do not implement the complete
///           standard but only the extended form without omitting date parts). </summary>
unit u_dzDateUtils;

{$I dzlibjedi.inc}

interface

uses
  SysUtils,
  u_dzTranslator,
  u_dzTypes;

type
  EdzDateUtilsException = class(EdzException)
  end;

type
  ///<summary> Similar to the DayMonday etc. constants in DateUtils, but starting
  ///           with Monday rather than Sunday and also as a typesafe enum </summary>
  TDayOfWeekEnum = (dowMonday, dowTuesday, dowWednesday, dowThursday, dowFriday, dowSaturday, dowSunday);
  ///<summary> subtype for month numbers </summary>
  TMonthNumbers = 1..12;
  //<summary> subtype for day numbers </summary>
  TDayOfMonthNumbers = 1..31;

const
  dowWeekend = [dowSaturday, dowSunday];
  dowWorkday = [dowMonday..dowFriday];

///<summary> Same as SysUtils.GetDayOfTheWeek, but returns a TDayOfWeekEnum rather
///          than a word value </summary>
function GetDayOfTheWeek(_Date: TDateTime): TDayOfWeekEnum;

///<summary> returns the localized string for the day of the week </summary>
function DayOfWeek2Str(_Dow: TDayOfWeekEnum): string;

///</summary> returns the localized string for the month </summary>
function Month2Str(_Month: TMonthNumbers): string;

/// <summary>
/// Converts a TDateTime value to a string in ISO 8601 format
/// @param dt is the TDateTime value to convert
/// @param IncludeTime is a boolean that determines whether the time should be
///                    included, defaults to false
/// @returns a string with the date (and optionally the time) in the format
///          'yyyy-mm-dd hh:mm:ss'
/// </summary>
function DateTime2Iso(_dt: TDateTime; _IncludeTime: Boolean = False): string; inline;
function Date2Iso(_Date: TDateTime): string; inline;

/// <summary>
/// Converts the time part of a TDateTime value to a string in ISO 8601 format
/// @param dt is the TDateTime value to convert
/// @param IncludeSeconds is a boolean that determines whether the time should be
///                    included, defaults to true
/// @param IncludeMilliseconds is a boolean that determines whether the milliseconds
///                            should be incluced,
///                            only used if IncludeSeconds is true, defaults to false
/// @returns a string with the time in the format
///          'hh:mm:ss.nnn'
/// </summary>
function Time2Iso(_dt: TDateTime; _IncludeSeconds: Boolean = True;
  _IncludeMilliSeconds: Boolean = False; _Separator: Char = #0): string; inline;
/// <summary>
/// converts a string that contains a time in ISO 8601 format to a TDateTime value
/// @param s is the string to convert, it must be in the form 'hh:mm:ss' or 'hh:mm'
/// @returns a TDateTime value with the time
/// @note This does not support the special syntax for 1000th of a second generated by
///       Time2Iso, e.g. 00:00:00.999.
/// </summary>
function Iso2Time(const _s: string): TDateTime;
function TryIso2Time(const _s: string; out _Time: TDateTime): Boolean;

///<summary>
/// Assumes the format hhhh<separator>mm where separator can be #0 meaning no separator
/// Note that there can be more than two digits for the hour.
/// If no separator is used, the last two digits are assumed to be the minutes.
/// if a spearator is used, the number of digits for the minutes can be 0 or 2, so
/// TryHHmm2Hours('234h', 'h') and TryHHmm2Hours('234h00', 'h') are both valid. </summary>
function TryHHmm2Hours(const _s: string; out _Hours: Extended; const _Separator: Char = #0): Boolean;

/// <summary>
/// converts a string that contains a date in ISO 8601 format to a TDateTime value
/// @param s is the string to convert, it must be in the form 'yyyy-mm-dd' or 'yyyymmdd', it must
///          not contain a time
/// @returns a TDateTime value with the date
/// </summary>
function Iso2Date(const _s: string): TDateTime;
function TryIso2Date(const _s: string; out _Date: TDateTime): Boolean;

/// <summary>
/// converts a string that contains a date and time in ISO 8601 format to a TDateTime value
/// @param s is the string to convert, it must be in the form 'yyyy-mm-dd hh:mm[:ss]'
/// @returns a TDateTime value with the date
/// </summary>
function Iso2DateTime(const _s: string): TDateTime;
function TryIso2DateTime(const _s: string; out _DateTime: TDateTime): Boolean;

///<summary>
/// Tries to convert a date/time string to a TDateTime value.
/// Date/time formats are tried in the following order:
/// * format configured in Windows
/// * German: dd.mm.yyyy hh:mm:ss (with 24 hour format)
/// * ISO 8601: yyyy-mm-dd hh:mm:ss (with 24 hour format)
/// * not done yet: United Kingdom: dd/mm/yyyy ha/p:mm:ss (12 hour format with a(m)/p(m))
/// (I had to decide between the sane UK format or the brain dead US format, i chose the UK format.)
///  </summary>
function TryStr2DateTime(const _s: string; out _DateTime: TDateTime): Boolean;

///<summary>
/// Tries to convert a string that contains the date and time in
/// German format (dd.mm.yyyy hh:mm:ss.zzz) to a TDateTimeValue
/// @returns true, if the function succeeded, false if not </summary>
function Tryddmmyyyyhhmmss2DateTime(const _s: string; out _DateTime: TDateTime): Boolean;

function Date2ddmmyyyy(_Date: TDateTime): string;
function ddmmyyyy2Date(const _s: string): TDateTime;
function Tryddmmyyyy2Date(const _s: string; out _Date: TDateTime): Boolean;

///<summary>
/// Tries to to convert a string to a date. Date formats are tried in the following order:
/// * format configured in Windows
/// * German dd.mm.yyyy
/// * ISO 8601 (yyyy-mm-dd)
/// * United Kingdom: dd/mm/yyyy
/// (I had to decide between the sane UK format or the brain dead US format, I chose the UK format.)
///  </summary>
function TryStr2Date(const _s: string; out _dt: TDateTime): Boolean;
function Str2Date(const _s: string): TDateTime;

implementation

uses
  SysConst,
  StrUtils,
  DateUtils,
  u_dzStringUtils;

function _(const _s: string): string; inline;
begin
  Result := dzDGetText(_s, 'dzlib');
end;

function GetDayOfTheWeek(_Date: TDateTime): TDayOfWeekEnum;
var
  DayNo: Word;
begin
  // 1=Su, 2=Mo ..
  DayNo := DateUtils.DayOfTheWeek(_Date);
  Result := TDayOfWeekEnum(DayNo - DateUtils.DayMonday);
end;

function DayOfWeek2Str(_Dow: TDayOfWeekEnum): string;
begin
  case _Dow of
    dowMonday: Result := _('Monday');
    dowTuesday: Result := _('Tuesday');
    dowWednesday: Result := _('Wednesday');
    dowThursday: Result := _('Thursday');
    dowFriday: Result := _('Friday');
    dowSaturday: Result := _('Saturday');
    dowSunday: Result := _('Sunday');
  else
    // should never happen ...
    raise EdzDateUtilsException.CreateFmt(_('Invalid value for DayOfWeek: %d'), [Ord(_Dow)]);
  end;
end;

function Month2Str(_Month: TMonthNumbers): string;
begin
  case _Month of
    1: Result := _('January');
    2: Result := _('February');
    3: Result := _('March');
    4: Result := _('April');
    5: Result := _('May');
    6: Result := _('June');
    7: Result := _('July');
    8: Result := _('August');
    9: Result := _('September');
    10: Result := _('October');
    11: Result := _('November');
    12: Result := _('December');
  else
    // should never happen ...
    raise EdzDateUtilsException.CreateFmt(_('Invalid month number %d'), [_Month]);
  end;
end;

function DateTime2Iso(_dt: TDateTime; _IncludeTime: Boolean = False): string;
begin
  if _IncludeTime then
    DateTimeToString(Result, 'yyyy-mm-dd hh:nn:ss', _dt) // do not translate
  else
    DateTimeToString(Result, 'yyyy-mm-dd', _dt); // do not translate
end;

function Date2Iso(_Date: TDateTime): string; inline;
begin
  Result := DateTime2Iso(_Date, False);
end;

function Date2ddmmyyyy(_Date: TDateTime): string;
begin
  DateTimeToString(Result, 'dd.mm.yyyy', _Date); // do not translate
end;

function Tryddmmyyyy2Date(const _s: string; out _Date: TDateTime): Boolean;
var
  Settings: TFormatSettings;
begin
  Settings := GetUserDefaultLocaleSettings;
  Settings.DateSeparator := '.';
  Settings.ShortDateFormat := 'dd.mm.yyyy'; // do not translate
  Result := TryStrToDate(_s, _Date, Settings);
end;

function ddmmyyyy2Date(const _s: string): TDateTime;
var
  Settings: TFormatSettings;
begin
  Settings := GetUserDefaultLocaleSettings;
  Settings.DateSeparator := '.';
  Settings.ShortDateFormat := 'dd.mm.yyyy'; // do not translate
  Result := StrToDate(_s, Settings);
end;

function Time2Iso(_dt: TDateTime; _IncludeSeconds: Boolean = True;
  _IncludeMilliSeconds: Boolean = False; _Separator: Char = #0): string; inline;
var
  fmt: string;
  Settings: TFormatSettings;
begin
  Settings := u_dzStringUtils.GetUserDefaultLocaleSettings;
  if _Separator <> #0 then
    Settings.TimeSeparator := _Separator;
  fmt := 'hh:nn'; // do not translate
  if _IncludeSeconds then begin
    fmt := fmt + ':ss';
    if _IncludeMilliSeconds then
      fmt := fmt + '.zzz'; // do not translate
  end;
  DateTimeToString(Result, fmt, _dt, Settings);
end;

function TryHHmm2Hours(const _s: string; out _Hours: Extended; const _Separator: Char = #0): Boolean;
var
  Len: Integer;
  hh: Integer;
  mm: Integer;
begin
  Len := Length(_s);
  if _Separator = #0 then begin
    Result := TryStrToInt(LeftStr(_s, Len - 2), hh);
    if Result then
      Result := TryStrToInt(TailStr(_s, Len - 2), mm);
  end else begin
    Result := Len > 1;
    if Result then begin
      if Copy(_s, Len - 2, 1) = _Separator then begin
        Result := TryStrToInt(LeftStr(_s, Len - 3), hh);
        if Result then
          Result := TryStrToInt(TailStr(_s, Len - 1), mm);
      end else if Copy(_s, Len, 1) = _Separator then begin
        Result := TryStrToInt(LeftStr(_s, Len - 1), hh);
        mm := 0;
      end else
        Result := False;
    end;
  end;
  if Result then
    _Hours := hh + mm / 60;
end;

function TryIso2Time(const _s: string; out _Time: TDateTime): Boolean;
var
  Settings: TFormatSettings;
begin
  Settings := GetUserDefaultLocaleSettings;
  Settings.TimeSeparator := ':';
  Settings.ShortTimeFormat := 'hh:nn:ss'; // do not translate
  Result := TryStrToTime(_s, _Time, Settings);
end;

function Iso2Time(const _s: string): TDateTime;
var
  Settings: TFormatSettings;
begin
  Settings := GetUserDefaultLocaleSettings;
  Settings.TimeSeparator := ':';
  Settings.ShortTimeFormat := 'hh:nn:ss'; // do not translate
  Result := StrToTime(_s, Settings);
end;

function TryIso2Date(const _s: string; out _Date: TDateTime): Boolean;
var
  Settings: TFormatSettings;
  Year: Integer;
  Month: Integer;
  Day: Integer;
begin
  Settings := GetUserDefaultLocaleSettings;
  Settings.DateSeparator := '-';
  Settings.ShortDateFormat := 'yyyy-mm-dd'; // do not translate
  Result := TryStrToDate(_s, _Date, Settings);
  if not Result then begin
    // Delphi does not support the "basic" ISO 8601 format: yyyymmdd without dashes, so we implement
    // it here
    if not (Length(_s) = 8) or not u_dzStringUtils.ContainsOnlyCharsFrom(_s, ['0'..'9']) then
      Exit;
    Result := TryStrToInt(Copy(_s, 1, 4), Year)
      and TryStrToInt(Copy(_s, 5, 2), Month)
      and TryStrToInt(Copy(_s, 7, 2), Day);
    if Result then
      Result := TryEncodeDate(Year, Month, Day, _Date);
  end;
end;

function Iso2Date(const _s: string): TDateTime;
begin
  if not TryIso2Date(_s, Result) then
    raise EConvertError.CreateFmt(_('''%s'' is not a valid date'), [_s]);
end;

function TryIso2DateTime(const _s: string; out _DateTime: TDateTime): Boolean;
var
  Settings: TFormatSettings;
begin
  Settings := GetUserDefaultLocaleSettings;
  Settings.DateSeparator := '-';
  Settings.ShortDateFormat := 'yyyy-mm-dd'; // do not translate
  Settings.TimeSeparator := ':';
  Settings.ShortTimeFormat := 'hh:nn:ss.zzz'; // do not translate
  Result := TryStrToDateTime(_s, _DateTime, Settings);
end;

function Iso2DateTime(const _s: string): TDateTime;
var
  Settings: TFormatSettings;
begin
  Settings := GetUserDefaultLocaleSettings;
  Settings.DateSeparator := '-';
  Settings.ShortDateFormat := 'yyyy-mm-dd'; // do not translate
  Settings.TimeSeparator := ':';
  Settings.ShortTimeFormat := 'hh:nn:ss.zzz'; // do not translate
  Result := StrToDateTime(_s, Settings);
end;

function Tryddmmyyyyhhmmss2DateTime(const _s: string; out _DateTime: TDateTime): Boolean;
var
  Settings: TFormatSettings;
begin
  Settings := GetUserDefaultLocaleSettings;
  Settings.DateSeparator := '.';
  Settings.ShortDateFormat := 'dd/mm/yyyy'; // do not translate
  Settings.TimeSeparator := ':';
  Settings.ShortTimeFormat := 'hh:nn:ss.zzz'; // do not translate
  Result := TryStrToDateTime(_s, _DateTime, Settings);
end;

function TryStr2DateTime(const _s: string; out _DateTime: TDateTime): Boolean;
begin
  Result := True;
  // Try several different formats
  // format configured in Windows
  if not TryStrToDateTime(_s, _DateTime) then
    // German dd.mm.yyyy
    if not Tryddmmyyyyhhmmss2DateTime(_s, _DateTime) then
      // ISO yyyy-mm-dd
      if not TryIso2DateTime(_s, _DateTime) then begin
//        // United Kingdom: dd/mm/yyyy
//        UKSettings := GetUserDefaultLocaleSettings;
//        UKSettings.DateSeparator := '/';
//        UKSettings.ShortDateFormat := 'dd/mm/yyyy';
//        if not TryStrToDate(_s, _dt, UKSettings) then
          // nothing worked, give up
        Result := False;
      end;
end;

function TryStr2Date(const _s: string; out _dt: TDateTime): Boolean;
var
  UKSettings: TFormatSettings;
begin
  Result := True;
  // Try several different formats
  // format configured in Windows
  if not TryStrToDate(_s, _dt) then
    // German dd.mm.yyyy
    if not Tryddmmyyyy2Date(_s, _dt) then
      // ISO yyyy-mm-dd
      if not TryIso2Date(_s, _dt) then begin
        // United Kingdom: dd/mm/yyyy
        UKSettings := GetUserDefaultLocaleSettings;
        UKSettings.DateSeparator := '/';
        UKSettings.ShortDateFormat := 'dd/mm/yyyy';
        if not TryStrToDate(_s, _dt, UKSettings) then
          // nothing worked, give up
          Result := False;
      end;
end;

function Str2Date(const _s: string): TDateTime;
begin
  if not TryStr2Date(_s, Result) then
    raise EConvertError.CreateFmt(_('''%s'' is not a valid date'), [_s]);
end;

end.