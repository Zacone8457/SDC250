prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_default_workspace_id=>133666900775467683934
);
end;
/
-- Oracle APEX 24.2.13 SQL Script Export file
-- Exported 15:37 Wednesday February 11, 2026 by: ZACONE8457@STUDENTS.ECPI.EDU
-- Scripts included:
--      ZACONE8457@STUDENTS.ECPI.EDU
--      ZACONE8457@STUDENTS.ECPI.EDU
 
begin wwv_flow.g_user := nvl(wwv_flow.g_user,'ZACONE8457@STUDENTS.ECPI.EDU'); end;
/
prompt --application/sql/scripts
prompt ...exporting script file
--
begin
    wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
    wwv_flow_imp.g_varchar2_table(1) := '435245415445205441424C45204C5F454D504C4F59454553323936372041530D0A53454C454354202A2046524F4D204C5F454D504C4F594545530D0A2D2D446F206E6F74206E65656420494E5345525420494E544F';
end;
/
 
declare
  l_name   varchar2(255);
begin
  l_name   := '136776723597675571394/2.9 6-7';
  wwv_imp_workspace.import_script(
    p_name          => l_name,
    p_varchar2_table=> wwv_flow_imp.g_varchar2_table,
    p_pathid=> null,
    p_filename=> '2.9 6-7',
    p_title=> '2.9 6-7',
    p_mime_type=> 'text/plain',
    p_dad_charset=> '',
    p_deleted_as_of=> to_date('00010101000000','YYYYMMDDHH24MISS'),
    p_content_type=> 'BLOB',
    p_language=> '',
    p_description=> '',
    p_file_type=> 'SCRIPT',
    p_file_charset=> 'utf-8');
end;
/
begin
    wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
    wwv_flow_imp.g_varchar2_table(1) := '414C544552205441424C4520736563303631315F6465706172746D656E74730D0A414444206D616E61676572205641524348415228313030290D0A41444420616E6E75616C5F627564676574204E554D42455228372C32293B0D0A';
end;
/
 
declare
  l_name   varchar2(255);
begin
  l_name   := '136780233650292681967/2.9 6-11';
  wwv_imp_workspace.import_script(
    p_name          => l_name,
    p_varchar2_table=> wwv_flow_imp.g_varchar2_table,
    p_pathid=> null,
    p_filename=> '2.9 6-11',
    p_title=> '2.9 6-11',
    p_mime_type=> 'text/plain',
    p_dad_charset=> '',
    p_deleted_as_of=> to_date('00010101000000','YYYYMMDDHH24MISS'),
    p_content_type=> 'BLOB',
    p_language=> '',
    p_description=> '',
    p_file_type=> 'SCRIPT',
    p_file_charset=> 'utf-8');
end;
/
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
--commit;
end;
/
set verify on feedback on define on
prompt  ...done
