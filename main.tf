;;
;; tf-sqlite
;;

/test sqlite_executable := "sqlite3"
/def sqlite_rawQuery = \
    /let _file=%{1}%;\
    /let _query=%{-1}%;\
;    /echo Querying: %{_file}%;\
;    /echo SQL: %{_query}%;\
    /let _r=$(/quote -S -decho !%{sqlite_executable} %{_file} "%{_query}")%;\
;    /echo Result: '%{_r}'%;\
    /return _r

/def sqlite_escapeSql = \
    /let _val=%{*}%;\
    /test _val := replace("'", "''", _val)%;\
    /test _val := replace('"', "\\\"", _val)%;\
    /test _val := replace("\\n", "' || char(10) ||  '", _val)%;\
    /result _val

