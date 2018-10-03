CREATE OR REPLACE PROCEDURE test_orasp_2 (
    ref_cursor   OUT SYS_REFCURSOR,
    id           IN VARCHAR
)
AS
BEGIN
    -- Do other stuff here
    OPEN ref_cursor FOR
        SELECT *
          FROM soe.customers
         WHERE customer_id = id;
END test_orasp_2;
/

-- | dbxquery connection=splunk_test_db12 procedure="{call test_orasp_2(?,?) }" params="50864"

-- | makeresults count=1
-- | eval cust_id="50864"
-- | map search="| dbxquery connection=splunk_test_db12 procedure=\"{call test_orasp_2(?,?) }\" params=\"$cust_id$\" "
