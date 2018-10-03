CREATE OR REPLACE PROCEDURE test_orasp_1 (
    p_ref_cursor   OUT SYS_REFCURSOR,
    p_var_in       IN VARCHAR
)
    AS
BEGIN
    OPEN p_ref_cursor FOR
        SELECT 'you passed-in: ' || p_var_in as out_var
          FROM dual;
END test_orasp_1;
/


-- | dbxquery connection=splunk_test_db12 procedure="{call test_orasp_1(?,?) }" params="Hello World"
