-- hello_world.sql
-- Oracle stored procedure to greet a user in multiple languages

CREATE OR REPLACE PROCEDURE hello_world (
    p_name     IN VARCHAR2 DEFAULT 'World',
    p_language IN VARCHAR2 DEFAULT 'EN'
) AS
    v_greeting  VARCHAR2(500);
    v_timestamp VARCHAR2(30);
BEGIN
    v_timestamp := TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS');

    -- Build greeting based on language
    IF p_language = 'EN' THEN
        v_greeting := 'Hello, ' || p_name || '!';
    ELSIF p_language = 'ES' THEN
        v_greeting := 'Hola, ' || p_name || '!';
    ELSIF p_language = 'FR' THEN
        v_greeting := 'Bonjour, ' || p_name || '!';
    ELSE
        v_greeting := 'Greetings, ' || p_name || '!';
    END IF;

    DBMS_OUTPUT.PUT_LINE('=== hello_world result ===');
    DBMS_OUTPUT.PUT_LINE(v_greeting);
    DBMS_OUTPUT.PUT_LINE('Run at    : ' || v_timestamp);
    DBMS_OUTPUT.PUT_LINE('Language  : ' || p_language);
    DBMS_OUTPUT.PUT_LINE('==========================');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END hello_world;
/
