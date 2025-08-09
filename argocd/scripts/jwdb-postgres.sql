--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1.pgdg110+1)
-- Dumped by pg_dump version 14.2

-- Started on 2022-03-23 18:44:56 +08

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
--SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

--CREATE SCHEMA public;


--
-- TOC entry 4748 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

--COMMENT ON SCHEMA public IS 'standard public schema';


--SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 19929)
-- Name: app_app; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE app_app (
    appid character varying(510) NOT NULL,
    appversion bigint NOT NULL,
    name character varying(510) DEFAULT NULL::character varying,
    published boolean,
    datecreated timestamp with time zone,
    datemodified timestamp with time zone,
    license text,
    description text,
    meta text
);


--
-- TOC entry 210 (class 1259 OID 19935)
-- Name: app_builder; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE app_builder (
    appid character varying(255) NOT NULL,
    appversion bigint NOT NULL,
    id character varying(255) NOT NULL,
    name character varying(255),
    type character varying(255),
    datecreated timestamp without time zone,
    datemodified timestamp without time zone,
    json text,
    description text
);


--
-- TOC entry 211 (class 1259 OID 19940)
-- Name: app_datalist; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE app_datalist (
    appid character varying(510) NOT NULL,
    appversion bigint NOT NULL,
    id character varying(510) NOT NULL,
    name character varying(510) DEFAULT NULL::character varying,
    description text,
    json text,
    datecreated timestamp with time zone,
    datemodified timestamp with time zone
);


--
-- TOC entry 212 (class 1259 OID 19946)
-- Name: app_env_variable; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE app_env_variable (
    appid character varying(510) NOT NULL,
    appversion bigint NOT NULL,
    id character varying(510) NOT NULL,
    value text,
    remarks text
);


--
-- TOC entry 213 (class 1259 OID 19951)
-- Name: app_fd; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE app_fd (
    id character varying(510) NOT NULL,
    datecreated timestamp with time zone,
    datemodified timestamp with time zone
);


--
-- TOC entry 214 (class 1259 OID 19956)
-- Name: app_fd_appcenter; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE app_fd_appcenter (
    id character varying(255) NOT NULL,
    datecreated timestamp without time zone,
    datemodified timestamp without time zone,
    createdby character varying(255),
    createdbyname character varying(255),
    modifiedby character varying(255),
    modifiedbyname character varying(255)
);


--
-- TOC entry 215 (class 1259 OID 19961)
-- Name: app_form; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE app_form (
    appid character varying(510) NOT NULL,
    appversion bigint NOT NULL,
    formid character varying(510) NOT NULL,
    name character varying(510) DEFAULT NULL::character varying,
    datecreated timestamp with time zone,
    datemodified timestamp with time zone,
    tablename character varying(510) DEFAULT NULL::character varying,
    json text,
    description text
);


--
-- TOC entry 216 (class 1259 OID 19968)
-- Name: app_form_data_audit_trail; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE app_form_data_audit_trail (
    id character varying(255) NOT NULL,
    appid character varying(255),
    appversion character varying(255),
    formid character varying(255),
    tablename character varying(255),
    username character varying(255),
    action character varying(255),
    data text,
    datetime timestamp without time zone
);


--
-- TOC entry 217 (class 1259 OID 19973)
-- Name: app_message; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE app_message (
    appid character varying(510) NOT NULL,
    appversion bigint NOT NULL,
    ouid character varying(510) NOT NULL,
    messagekey character varying(510) DEFAULT NULL::character varying,
    locale character varying(510) DEFAULT NULL::character varying,
    message text
);


--
-- TOC entry 218 (class 1259 OID 19980)
-- Name: app_package; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE app_package (
    packageid character varying(510) NOT NULL,
    packageversion bigint NOT NULL,
    name character varying(510) DEFAULT NULL::character varying,
    datecreated timestamp with time zone,
    datemodified timestamp with time zone,
    appid character varying(510) DEFAULT NULL::character varying,
    appversion bigint
);


--
-- TOC entry 219 (class 1259 OID 19987)
-- Name: app_package_activity_form; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE app_package_activity_form (
    processdefid character varying(510) NOT NULL,
    activitydefid character varying(510) NOT NULL,
    packageid character varying(510) NOT NULL,
    packageversion bigint NOT NULL,
    ouid character varying(510) DEFAULT NULL::character varying,
    type character varying(510) DEFAULT NULL::character varying,
    formid character varying(510) DEFAULT NULL::character varying,
    formurl character varying(510) DEFAULT NULL::character varying,
    formiframestyle character varying(510) DEFAULT NULL::character varying,
    autocontinue boolean,
    disablesaveasdraft boolean
);


--
-- TOC entry 220 (class 1259 OID 19997)
-- Name: app_package_activity_plugin; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE app_package_activity_plugin (
    processdefid character varying(510) NOT NULL,
    activitydefid character varying(510) NOT NULL,
    packageid character varying(510) NOT NULL,
    packageversion bigint NOT NULL,
    ouid character varying(510) DEFAULT NULL::character varying,
    pluginname character varying(510) DEFAULT NULL::character varying,
    pluginproperties text
);


--
-- TOC entry 221 (class 1259 OID 20004)
-- Name: app_package_participant; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE app_package_participant (
    processdefid character varying(510) NOT NULL,
    participantid character varying(510) NOT NULL,
    packageid character varying(510) NOT NULL,
    packageversion bigint NOT NULL,
    ouid character varying(510) DEFAULT NULL::character varying,
    type character varying(510) DEFAULT NULL::character varying,
    value text,
    pluginproperties text
);


--
-- TOC entry 222 (class 1259 OID 20011)
-- Name: app_plugin_default; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE app_plugin_default (
    appid character varying(510) NOT NULL,
    appversion bigint NOT NULL,
    id character varying(510) NOT NULL,
    pluginname character varying(510) DEFAULT NULL::character varying,
    plugindescription text,
    pluginproperties text
);


--
-- TOC entry 223 (class 1259 OID 20017)
-- Name: app_report_activity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE app_report_activity (
    uuid character varying(510) NOT NULL,
    activitydefid character varying(510) DEFAULT NULL::character varying,
    activityname character varying(510) DEFAULT NULL::character varying,
    processuid character varying(510) DEFAULT NULL::character varying
);


--
-- TOC entry 224 (class 1259 OID 20025)
-- Name: app_report_activity_instance; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE app_report_activity_instance (
    instanceid character varying(510) NOT NULL,
    performer character varying(510) DEFAULT NULL::character varying,
    state character varying(510) DEFAULT NULL::character varying,
    status character varying(510) DEFAULT NULL::character varying,
    nameofaccepteduser character varying(510) DEFAULT NULL::character varying,
    assignmentusers text,
    due timestamp with time zone,
    createdtime timestamp with time zone,
    startedtime timestamp with time zone,
    finishtime timestamp with time zone,
    delay bigint,
    timeconsumingfromcreatedtime bigint,
    timeconsumingfromstartedtime bigint,
    activityuid character varying(510) DEFAULT NULL::character varying,
    processinstanceid character varying(510) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 20036)
-- Name: app_report_app; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE app_report_app (
    uuid character varying(510) NOT NULL,
    appid character varying(510) DEFAULT NULL::character varying,
    appversion character varying(510) DEFAULT NULL::character varying,
    appname character varying(510) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 20044)
-- Name: app_report_package; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE app_report_package (
    uuid character varying(510) NOT NULL,
    packageid character varying(510) DEFAULT NULL::character varying,
    packagename character varying(510) DEFAULT NULL::character varying,
    packageversion character varying(510) DEFAULT NULL::character varying,
    appuid character varying(510) DEFAULT NULL::character varying
);


--
-- TOC entry 227 (class 1259 OID 20053)
-- Name: app_report_process; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE app_report_process (
    uuid character varying(510) NOT NULL,
    processdefid character varying(510) DEFAULT NULL::character varying,
    processname character varying(510) DEFAULT NULL::character varying,
    packageuid character varying(510) DEFAULT NULL::character varying
);


--
-- TOC entry 228 (class 1259 OID 20061)
-- Name: app_report_process_instance; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE app_report_process_instance (
    instanceid character varying(510) NOT NULL,
    requester character varying(510) DEFAULT NULL::character varying,
    state character varying(510) DEFAULT NULL::character varying,
    due timestamp with time zone,
    startedtime timestamp with time zone,
    finishtime timestamp with time zone,
    delay bigint,
    timeconsumingfromstartedtime bigint,
    processuid character varying(510) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 20069)
-- Name: app_resource; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE app_resource (
    appid character varying(255) NOT NULL,
    appversion bigint NOT NULL,
    id character varying(255) NOT NULL,
    filesize bigint,
    permissionclass character varying(255),
    permissionproperties text
);


--
-- TOC entry 230 (class 1259 OID 20074)
-- Name: app_userview; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE app_userview (
    appid character varying(510) NOT NULL,
    appversion bigint NOT NULL,
    id character varying(510) NOT NULL,
    name character varying(510) DEFAULT NULL::character varying,
    description text,
    json text,
    datecreated timestamp with time zone,
    datemodified timestamp with time zone
);


--
-- TOC entry 231 (class 1259 OID 20080)
-- Name: dir_department; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dir_department (
    id character varying(510) NOT NULL,
    name character varying(510) DEFAULT NULL::character varying,
    description character varying(510) DEFAULT NULL::character varying,
    organizationid character varying(510) DEFAULT NULL::character varying,
    hod character varying(510) DEFAULT NULL::character varying,
    parentid character varying(510) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 20090)
-- Name: dir_employment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dir_employment (
    id character varying(510) NOT NULL,
    userid character varying(510) DEFAULT NULL::character varying,
    startdate date,
    enddate date,
    employeecode character varying(510) DEFAULT NULL::character varying,
    role character varying(510) DEFAULT NULL::character varying,
    gradeid character varying(510) DEFAULT NULL::character varying,
    departmentid character varying(510) DEFAULT NULL::character varying,
    organizationid character varying(510) DEFAULT NULL::character varying
);


--
-- TOC entry 233 (class 1259 OID 20101)
-- Name: dir_employment_report_to; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dir_employment_report_to (
    employmentid character varying(510) NOT NULL,
    reporttoid character varying(510) NOT NULL,
    id character varying(510) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 20107)
-- Name: dir_grade; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dir_grade (
    id character varying(510) NOT NULL,
    name character varying(510) DEFAULT NULL::character varying,
    description character varying(510) DEFAULT NULL::character varying,
    organizationid character varying(510) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 20115)
-- Name: dir_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dir_group (
    id character varying(510) NOT NULL,
    name character varying(510) DEFAULT NULL::character varying,
    description character varying(510) DEFAULT NULL::character varying,
    organizationid character varying(510) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 20123)
-- Name: dir_organization; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dir_organization (
    id character varying(510) NOT NULL,
    name character varying(510) DEFAULT NULL::character varying,
    description character varying(510) DEFAULT NULL::character varying,
    parentid character varying(510) DEFAULT NULL::character varying
);


--
-- TOC entry 237 (class 1259 OID 20131)
-- Name: dir_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dir_role (
    id character varying(510) NOT NULL,
    name character varying(510) DEFAULT NULL::character varying,
    description character varying(510) DEFAULT NULL::character varying
);


--
-- TOC entry 238 (class 1259 OID 20138)
-- Name: dir_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dir_user (
    id character varying(510) NOT NULL,
    username character varying(510) DEFAULT NULL::character varying,
    password character varying(510) DEFAULT NULL::character varying,
    firstname character varying(510) DEFAULT NULL::character varying,
    lastname character varying(510) DEFAULT NULL::character varying,
    email character varying(510) DEFAULT NULL::character varying,
    active integer,
    timezone character varying(510) DEFAULT NULL::character varying,
    locale character varying(510) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 20150)
-- Name: dir_user_extra; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dir_user_extra (
    username character varying(510) NOT NULL,
    algorithm character varying(510) DEFAULT NULL::character varying,
    loginattempt integer,
    failedloginattempt integer,
    lastlogedindate timestamp with time zone,
    lockoutdate timestamp with time zone,
    lastpasswordchangedate timestamp with time zone,
    requiredpasswordchange boolean,
    nopasswordexpiration boolean
);


--
-- TOC entry 240 (class 1259 OID 20156)
-- Name: dir_user_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dir_user_group (
    groupid character varying(510) NOT NULL,
    userid character varying(510) NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 20161)
-- Name: dir_user_meta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dir_user_meta (
    username character varying(255) NOT NULL,
    meta_key character varying(255) NOT NULL,
    meta_value text
);


--
-- TOC entry 242 (class 1259 OID 20166)
-- Name: dir_user_password_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dir_user_password_history (
    id character varying(510) NOT NULL,
    username character varying(510) DEFAULT NULL::character varying,
    salt character varying(510) DEFAULT NULL::character varying,
    password character varying(510) DEFAULT NULL::character varying,
    updateddate timestamp with time zone
);


--
-- TOC entry 243 (class 1259 OID 20174)
-- Name: dir_user_replacement; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dir_user_replacement (
    id character varying(255) NOT NULL,
    username character varying(255),
    replacementuser character varying(255),
    appid character varying(255),
    processids character varying(255),
    startdate timestamp without time zone,
    enddate timestamp without time zone
);


--
-- TOC entry 244 (class 1259 OID 20179)
-- Name: dir_user_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dir_user_role (
    roleid character varying(510) NOT NULL,
    userid character varying(510) NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 20184)
-- Name: objectid; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE objectid (
    nextoid numeric(19,0) NOT NULL
);

--
-- TOC entry 246 (class 1259 OID 20187)
-- Name: shkactivities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkactivities (
    id character varying(200) NOT NULL,
    activitysetdefinitionid character varying(180) DEFAULT NULL::character varying,
    activitydefinitionid character varying(180) NOT NULL,
    process numeric(19,0) NOT NULL,
    theresource numeric(19,0) DEFAULT NULL::numeric,
    pdefname character varying(400) NOT NULL,
    processid character varying(400) NOT NULL,
    resourceid character varying(200) DEFAULT NULL::character varying,
    state numeric(19,0) NOT NULL,
    blockactivityid character varying(200) DEFAULT NULL::character varying,
    performer character varying(200) DEFAULT NULL::character varying,
    isperformerasynchronous boolean,
    priority integer,
    name character varying(508) DEFAULT NULL::character varying,
    activated bigint NOT NULL,
    activatedtzo bigint NOT NULL,
    accepted bigint,
    acceptedtzo bigint,
    laststatetime bigint NOT NULL,
    laststatetimetzo bigint NOT NULL,
    limittime bigint NOT NULL,
    limittimetzo bigint NOT NULL,
    description character varying(508) DEFAULT NULL::character varying,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 247 (class 1259 OID 20199)
-- Name: shkactivitydata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkactivitydata (
    activity numeric(19,0) NOT NULL,
    variabledefinitionid character varying(200) NOT NULL,
    variabletype integer NOT NULL,
    variablevalue bytea,
    variablevaluexml text,
    variablevaluevchar character varying(8000) DEFAULT NULL::character varying,
    variablevaluedbl double precision,
    variablevaluelong bigint,
    variablevaluedate timestamp with time zone,
    variablevaluebool boolean,
    isresult boolean NOT NULL,
    ordno integer NOT NULL,
    cnt numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 248 (class 1259 OID 20205)
-- Name: shkactivitydatablobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkactivitydatablobs (
    activitydatawob numeric(19,0) NOT NULL,
    variablevalue bytea,
    ordno integer NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 20210)
-- Name: shkactivitydatawob; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkactivitydatawob (
    activity numeric(19,0) NOT NULL,
    variabledefinitionid character varying(200) NOT NULL,
    variabletype integer NOT NULL,
    variablevaluexml text,
    variablevaluevchar character varying(8000) DEFAULT NULL::character varying,
    variablevaluedbl double precision,
    variablevaluelong bigint,
    variablevaluedate timestamp with time zone,
    variablevaluebool boolean,
    isresult boolean NOT NULL,
    ordno integer NOT NULL,
    cnt numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 250 (class 1259 OID 20216)
-- Name: shkactivitystateeventaudits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkactivitystateeventaudits (
    keyvalue character varying(60) NOT NULL,
    name character varying(100) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 251 (class 1259 OID 20219)
-- Name: shkactivitystates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkactivitystates (
    keyvalue character varying(60) NOT NULL,
    name character varying(100) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 20222)
-- Name: shkandjointable; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkandjointable (
    process numeric(19,0) NOT NULL,
    blockactivity numeric(19,0) DEFAULT NULL::numeric,
    activitydefinitionid character varying(180) NOT NULL,
    activity numeric(19,0) NOT NULL,
    cnt numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 253 (class 1259 OID 20226)
-- Name: shkassignmenteventaudits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkassignmenteventaudits (
    recordedtime bigint NOT NULL,
    recordedtimetzo bigint NOT NULL,
    theusername character varying(200) NOT NULL,
    thetype numeric(19,0) NOT NULL,
    activityid character varying(200) NOT NULL,
    activityname character varying(508) DEFAULT NULL::character varying,
    processid character varying(200) NOT NULL,
    processname character varying(508) DEFAULT NULL::character varying,
    processfactoryname character varying(400) NOT NULL,
    processfactoryversion character varying(40) NOT NULL,
    activitydefinitionid character varying(180) NOT NULL,
    activitydefinitionname character varying(180) DEFAULT NULL::character varying,
    activitydefinitiontype integer NOT NULL,
    processdefinitionid character varying(180) NOT NULL,
    processdefinitionname character varying(180) DEFAULT NULL::character varying,
    packageid character varying(180) NOT NULL,
    oldresourceusername character varying(200) DEFAULT NULL::character varying,
    oldresourcename character varying(200) DEFAULT NULL::character varying,
    newresourceusername character varying(200) NOT NULL,
    newresourcename character varying(200) DEFAULT NULL::character varying,
    isaccepted boolean NOT NULL,
    cnt numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 254 (class 1259 OID 20238)
-- Name: shkassignmentstable; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkassignmentstable (
    activity numeric(19,0) NOT NULL,
    theresource numeric(19,0) NOT NULL,
    activityid character varying(200) NOT NULL,
    activityprocessid character varying(200) NOT NULL,
    activityprocessdefname character varying(400) NOT NULL,
    resourceid character varying(200) NOT NULL,
    isaccepted boolean NOT NULL,
    isvalid boolean NOT NULL,
    cnt numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 255 (class 1259 OID 20243)
-- Name: shkcounters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkcounters (
    name character varying(200) NOT NULL,
    the_number numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 20246)
-- Name: shkcreateprocesseventaudits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkcreateprocesseventaudits (
    recordedtime bigint NOT NULL,
    recordedtimetzo bigint NOT NULL,
    theusername character varying(200) NOT NULL,
    thetype numeric(19,0) NOT NULL,
    processid character varying(200) NOT NULL,
    processname character varying(508) DEFAULT NULL::character varying,
    processfactoryname character varying(400) NOT NULL,
    processfactoryversion character varying(40) NOT NULL,
    processdefinitionid character varying(180) NOT NULL,
    processdefinitionname character varying(180) DEFAULT NULL::character varying,
    packageid character varying(180) NOT NULL,
    pactivityid character varying(200) DEFAULT NULL::character varying,
    pprocessid character varying(200) DEFAULT NULL::character varying,
    pprocessname character varying(508) DEFAULT NULL::character varying,
    pprocessfactoryname character varying(400) DEFAULT NULL::character varying,
    pprocessfactoryversion character varying(40) DEFAULT NULL::character varying,
    pactivitydefinitionid character varying(180) DEFAULT NULL::character varying,
    pactivitydefinitionname character varying(180) DEFAULT NULL::character varying,
    pprocessdefinitionid character varying(180) DEFAULT NULL::character varying,
    pprocessdefinitionname character varying(180) DEFAULT NULL::character varying,
    ppackageid character varying(180) DEFAULT NULL::character varying,
    cnt numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 257 (class 1259 OID 20263)
-- Name: shkdataeventaudits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkdataeventaudits (
    recordedtime bigint NOT NULL,
    recordedtimetzo bigint NOT NULL,
    theusername character varying(200) NOT NULL,
    thetype numeric(19,0) NOT NULL,
    activityid character varying(200) DEFAULT NULL::character varying,
    activityname character varying(508) DEFAULT NULL::character varying,
    processid character varying(200) NOT NULL,
    processname character varying(508) DEFAULT NULL::character varying,
    processfactoryname character varying(400) NOT NULL,
    processfactoryversion character varying(40) NOT NULL,
    activitydefinitionid character varying(180) DEFAULT NULL::character varying,
    activitydefinitionname character varying(180) DEFAULT NULL::character varying,
    activitydefinitiontype integer,
    processdefinitionid character varying(180) NOT NULL,
    processdefinitionname character varying(180) DEFAULT NULL::character varying,
    packageid character varying(180) NOT NULL,
    cnt numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 258 (class 1259 OID 20274)
-- Name: shkdeadlines; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkdeadlines (
    process numeric(19,0) NOT NULL,
    activity numeric(19,0) NOT NULL,
    cnt numeric(19,0) NOT NULL,
    timelimit bigint NOT NULL,
    timelimittzo bigint NOT NULL,
    exceptionname character varying(200) NOT NULL,
    issynchronous boolean NOT NULL,
    isexecuted boolean NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 259 (class 1259 OID 20277)
-- Name: shkeventtypes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkeventtypes (
    keyvalue character varying(60) NOT NULL,
    name character varying(100) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 260 (class 1259 OID 20280)
-- Name: shkgroupgrouptable; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkgroupgrouptable (
    sub_gid numeric(19,0) NOT NULL,
    groupid numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 261 (class 1259 OID 20283)
-- Name: shkgrouptable; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkgrouptable (
    groupid character varying(200) NOT NULL,
    description character varying(508) DEFAULT NULL::character varying,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 262 (class 1259 OID 20289)
-- Name: shkgroupuser; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkgroupuser (
    username character varying(200) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 263 (class 1259 OID 20292)
-- Name: shkgroupuserpacklevelpart; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkgroupuserpacklevelpart (
    participantoid numeric(19,0) NOT NULL,
    useroid numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 264 (class 1259 OID 20295)
-- Name: shkgroupuserproclevelpart; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkgroupuserproclevelpart (
    participantoid numeric(19,0) NOT NULL,
    useroid numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 265 (class 1259 OID 20298)
-- Name: shkneweventauditdata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkneweventauditdata (
    dataeventaudit numeric(19,0) NOT NULL,
    variabledefinitionid character varying(200) NOT NULL,
    variabletype integer NOT NULL,
    variablevalue bytea,
    variablevaluexml text,
    variablevaluevchar character varying(8000) DEFAULT NULL::character varying,
    variablevaluedbl double precision,
    variablevaluelong bigint,
    variablevaluedate timestamp with time zone,
    variablevaluebool boolean,
    ordno integer NOT NULL,
    cnt numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 266 (class 1259 OID 20304)
-- Name: shkneweventauditdatablobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkneweventauditdatablobs (
    neweventauditdatawob numeric(19,0) NOT NULL,
    variablevalue bytea,
    ordno integer NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 267 (class 1259 OID 20309)
-- Name: shkneweventauditdatawob; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkneweventauditdatawob (
    dataeventaudit numeric(19,0) NOT NULL,
    variabledefinitionid character varying(200) NOT NULL,
    variabletype integer NOT NULL,
    variablevaluexml text,
    variablevaluevchar character varying(8000) DEFAULT NULL::character varying,
    variablevaluedbl double precision,
    variablevaluelong bigint,
    variablevaluedate timestamp with time zone,
    variablevaluebool boolean,
    ordno integer NOT NULL,
    cnt numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 268 (class 1259 OID 20315)
-- Name: shknextxpdlversions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shknextxpdlversions (
    xpdlid character varying(180) NOT NULL,
    nextversion character varying(40) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 269 (class 1259 OID 20318)
-- Name: shknormaluser; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shknormaluser (
    username character varying(200) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 270 (class 1259 OID 20321)
-- Name: shkoldeventauditdata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkoldeventauditdata (
    dataeventaudit numeric(19,0) NOT NULL,
    variabledefinitionid character varying(200) NOT NULL,
    variabletype integer NOT NULL,
    variablevalue bytea,
    variablevaluexml text,
    variablevaluevchar character varying(8000) DEFAULT NULL::character varying,
    variablevaluedbl double precision,
    variablevaluelong bigint,
    variablevaluedate timestamp with time zone,
    variablevaluebool boolean,
    ordno integer NOT NULL,
    cnt numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 271 (class 1259 OID 20327)
-- Name: shkoldeventauditdatablobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkoldeventauditdatablobs (
    oldeventauditdatawob numeric(19,0) NOT NULL,
    variablevalue bytea,
    ordno integer NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 272 (class 1259 OID 20332)
-- Name: shkoldeventauditdatawob; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkoldeventauditdatawob (
    dataeventaudit numeric(19,0) NOT NULL,
    variabledefinitionid character varying(200) NOT NULL,
    variabletype integer NOT NULL,
    variablevaluexml text,
    variablevaluevchar character varying(8000) DEFAULT NULL::character varying,
    variablevaluedbl double precision,
    variablevaluelong bigint,
    variablevaluedate timestamp with time zone,
    variablevaluebool boolean,
    ordno integer NOT NULL,
    cnt numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 273 (class 1259 OID 20338)
-- Name: shkpacklevelparticipant; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkpacklevelparticipant (
    participant_id character varying(180) NOT NULL,
    packageoid numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 274 (class 1259 OID 20341)
-- Name: shkpacklevelxpdlapp; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkpacklevelxpdlapp (
    application_id character varying(180) NOT NULL,
    packageoid numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 275 (class 1259 OID 20344)
-- Name: shkpacklevelxpdlapptaappdetail; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkpacklevelxpdlapptaappdetail (
    xpdl_appoid numeric(19,0) NOT NULL,
    toolagentoid numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 276 (class 1259 OID 20347)
-- Name: shkpacklevelxpdlapptaappdetusr; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkpacklevelxpdlapptaappdetusr (
    xpdl_appoid numeric(19,0) NOT NULL,
    toolagentoid numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 277 (class 1259 OID 20350)
-- Name: shkpacklevelxpdlapptaappuser; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkpacklevelxpdlapptaappuser (
    xpdl_appoid numeric(19,0) NOT NULL,
    toolagentoid numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 278 (class 1259 OID 20353)
-- Name: shkpacklevelxpdlapptoolagntapp; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkpacklevelxpdlapptoolagntapp (
    xpdl_appoid numeric(19,0) NOT NULL,
    toolagentoid numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 279 (class 1259 OID 20356)
-- Name: shkprocessdata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkprocessdata (
    process numeric(19,0) NOT NULL,
    variabledefinitionid character varying(200) NOT NULL,
    variabletype integer NOT NULL,
    variablevalue bytea,
    variablevaluexml text,
    variablevaluevchar character varying(8000) DEFAULT NULL::character varying,
    variablevaluedbl double precision,
    variablevaluelong bigint,
    variablevaluedate timestamp with time zone,
    variablevaluebool boolean,
    ordno integer NOT NULL,
    cnt numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 280 (class 1259 OID 20362)
-- Name: shkprocessdatablobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkprocessdatablobs (
    processdatawob numeric(19,0) NOT NULL,
    variablevalue bytea,
    ordno integer NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 281 (class 1259 OID 20367)
-- Name: shkprocessdatawob; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkprocessdatawob (
    process numeric(19,0) NOT NULL,
    variabledefinitionid character varying(200) NOT NULL,
    variabletype integer NOT NULL,
    variablevaluexml text,
    variablevaluevchar character varying(8000) DEFAULT NULL::character varying,
    variablevaluedbl double precision,
    variablevaluelong bigint,
    variablevaluedate timestamp with time zone,
    variablevaluebool boolean,
    ordno integer NOT NULL,
    cnt numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 282 (class 1259 OID 20373)
-- Name: shkprocessdefinitions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkprocessdefinitions (
    name character varying(400) NOT NULL,
    packageid character varying(180) NOT NULL,
    processdefinitionid character varying(180) NOT NULL,
    processdefinitioncreated bigint NOT NULL,
    processdefinitionversion character varying(40) NOT NULL,
    state integer NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 283 (class 1259 OID 20378)
-- Name: shkprocesses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkprocesses (
    syncversion bigint NOT NULL,
    id character varying(200) NOT NULL,
    processdefinition numeric(19,0) NOT NULL,
    pdefname character varying(400) NOT NULL,
    activityrequesterid character varying(200) DEFAULT NULL::character varying,
    activityrequesterprocessid character varying(200) DEFAULT NULL::character varying,
    resourcerequesterid character varying(200) NOT NULL,
    externalrequesterclassname character varying(508) DEFAULT NULL::character varying,
    state numeric(19,0) NOT NULL,
    priority integer,
    name character varying(508) DEFAULT NULL::character varying,
    created bigint NOT NULL,
    createdtzo bigint NOT NULL,
    started bigint,
    startedtzo bigint,
    laststatetime bigint NOT NULL,
    laststatetimetzo bigint NOT NULL,
    limittime bigint NOT NULL,
    limittimetzo bigint NOT NULL,
    description character varying(508) DEFAULT NULL::character varying,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 284 (class 1259 OID 20388)
-- Name: shkprocessrequesters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkprocessrequesters (
    id character varying(200) NOT NULL,
    activityrequester numeric(19,0) DEFAULT NULL::numeric,
    resourcerequester numeric(19,0) DEFAULT NULL::numeric,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 285 (class 1259 OID 20393)
-- Name: shkprocessstateeventaudits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkprocessstateeventaudits (
    keyvalue character varying(60) NOT NULL,
    name character varying(100) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 286 (class 1259 OID 20396)
-- Name: shkprocessstates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkprocessstates (
    keyvalue character varying(60) NOT NULL,
    name character varying(100) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 287 (class 1259 OID 20399)
-- Name: shkproclevelparticipant; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkproclevelparticipant (
    participant_id character varying(180) NOT NULL,
    processoid numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 288 (class 1259 OID 20402)
-- Name: shkproclevelxpdlapp; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkproclevelxpdlapp (
    application_id character varying(180) NOT NULL,
    processoid numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 289 (class 1259 OID 20405)
-- Name: shkproclevelxpdlapptaappdetail; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkproclevelxpdlapptaappdetail (
    xpdl_appoid numeric(19,0) NOT NULL,
    toolagentoid numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 290 (class 1259 OID 20408)
-- Name: shkproclevelxpdlapptaappdetusr; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkproclevelxpdlapptaappdetusr (
    xpdl_appoid numeric(19,0) NOT NULL,
    toolagentoid numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 291 (class 1259 OID 20411)
-- Name: shkproclevelxpdlapptaappuser; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkproclevelxpdlapptaappuser (
    xpdl_appoid numeric(19,0) NOT NULL,
    toolagentoid numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 292 (class 1259 OID 20414)
-- Name: shkproclevelxpdlapptoolagntapp; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkproclevelxpdlapptoolagntapp (
    xpdl_appoid numeric(19,0) NOT NULL,
    toolagentoid numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 293 (class 1259 OID 20417)
-- Name: shkresourcestable; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkresourcestable (
    username character varying(200) NOT NULL,
    name character varying(200) DEFAULT NULL::character varying,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 294 (class 1259 OID 20421)
-- Name: shkstateeventaudits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkstateeventaudits (
    recordedtime bigint NOT NULL,
    recordedtimetzo bigint NOT NULL,
    theusername character varying(200) NOT NULL,
    thetype numeric(19,0) NOT NULL,
    activityid character varying(200) DEFAULT NULL::character varying,
    activityname character varying(508) DEFAULT NULL::character varying,
    processid character varying(200) NOT NULL,
    processname character varying(508) DEFAULT NULL::character varying,
    processfactoryname character varying(400) NOT NULL,
    processfactoryversion character varying(40) NOT NULL,
    activitydefinitionid character varying(180) DEFAULT NULL::character varying,
    activitydefinitionname character varying(180) DEFAULT NULL::character varying,
    activitydefinitiontype integer,
    processdefinitionid character varying(180) NOT NULL,
    processdefinitionname character varying(180) DEFAULT NULL::character varying,
    packageid character varying(180) NOT NULL,
    oldprocessstate numeric(19,0) DEFAULT NULL::numeric,
    newprocessstate numeric(19,0) DEFAULT NULL::numeric,
    oldactivitystate numeric(19,0) DEFAULT NULL::numeric,
    newactivitystate numeric(19,0) DEFAULT NULL::numeric,
    cnt numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 295 (class 1259 OID 20436)
-- Name: shktoolagentapp; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shktoolagentapp (
    tool_agent_name character varying(500) NOT NULL,
    app_name character varying(180) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 296 (class 1259 OID 20441)
-- Name: shktoolagentappdetail; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shktoolagentappdetail (
    app_mode numeric(10,0) NOT NULL,
    toolagent_appoid numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 297 (class 1259 OID 20444)
-- Name: shktoolagentappdetailuser; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shktoolagentappdetailuser (
    toolagent_appoid numeric(19,0) NOT NULL,
    useroid numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 298 (class 1259 OID 20447)
-- Name: shktoolagentappuser; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shktoolagentappuser (
    toolagent_appoid numeric(19,0) NOT NULL,
    useroid numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 299 (class 1259 OID 20450)
-- Name: shktoolagentuser; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shktoolagentuser (
    username character varying(200) NOT NULL,
    pwd character varying(200) DEFAULT NULL::character varying,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 300 (class 1259 OID 20454)
-- Name: shkusergrouptable; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkusergrouptable (
    userid numeric(19,0) NOT NULL,
    groupid numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 301 (class 1259 OID 20457)
-- Name: shkuserpacklevelpart; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkuserpacklevelpart (
    participantoid numeric(19,0) NOT NULL,
    useroid numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 302 (class 1259 OID 20460)
-- Name: shkuserproclevelparticipant; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkuserproclevelparticipant (
    participantoid numeric(19,0) NOT NULL,
    useroid numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 303 (class 1259 OID 20463)
-- Name: shkusertable; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkusertable (
    userid character varying(200) NOT NULL,
    firstname character varying(100) DEFAULT NULL::character varying,
    lastname character varying(100) DEFAULT NULL::character varying,
    passwd character varying(100) NOT NULL,
    email character varying(508) DEFAULT NULL::character varying,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 304 (class 1259 OID 20471)
-- Name: shkxpdlapplicationpackage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkxpdlapplicationpackage (
    package_id character varying(180) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 305 (class 1259 OID 20474)
-- Name: shkxpdlapplicationprocess; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkxpdlapplicationprocess (
    process_id character varying(180) NOT NULL,
    packageoid numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 306 (class 1259 OID 20477)
-- Name: shkxpdldata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkxpdldata (
    xpdlcontent bytea,
    xpdlclasscontent bytea,
    xpdl numeric(19,0) NOT NULL,
    cnt numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 307 (class 1259 OID 20482)
-- Name: shkxpdlhistory; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkxpdlhistory (
    xpdlid character varying(180) NOT NULL,
    xpdlversion character varying(40) NOT NULL,
    xpdlclassversion bigint NOT NULL,
    xpdluploadtime timestamp with time zone NOT NULL,
    xpdlhistoryuploadtime timestamp with time zone NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 308 (class 1259 OID 20485)
-- Name: shkxpdlhistorydata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkxpdlhistorydata (
    xpdlcontent bytea NOT NULL,
    xpdlclasscontent bytea NOT NULL,
    xpdlhistory numeric(19,0) NOT NULL,
    cnt numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 309 (class 1259 OID 20490)
-- Name: shkxpdlparticipantpackage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkxpdlparticipantpackage (
    package_id character varying(180) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 310 (class 1259 OID 20493)
-- Name: shkxpdlparticipantprocess; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkxpdlparticipantprocess (
    process_id character varying(180) NOT NULL,
    packageoid numeric(19,0) NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 311 (class 1259 OID 20496)
-- Name: shkxpdlreferences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkxpdlreferences (
    referredxpdlid character varying(180) NOT NULL,
    referringxpdl numeric(19,0) NOT NULL,
    referredxpdlnumber integer NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 312 (class 1259 OID 20499)
-- Name: shkxpdls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shkxpdls (
    xpdlid character varying(180) NOT NULL,
    xpdlversion character varying(40) NOT NULL,
    xpdlclassversion bigint NOT NULL,
    xpdluploadtime timestamp with time zone NOT NULL,
    oid numeric(19,0) NOT NULL,
    version integer NOT NULL
);


--
-- TOC entry 313 (class 1259 OID 20502)
-- Name: wf_audit_trail; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wf_audit_trail (
    id character varying(510) NOT NULL,
    username character varying(510) DEFAULT NULL::character varying,
    clazz character varying(510) DEFAULT NULL::character varying,
    method character varying(510) DEFAULT NULL::character varying,
    message text,
    "timestamp" timestamp with time zone,
    appid character varying(510) DEFAULT NULL::character varying,
    appversion character varying(510) DEFAULT NULL::character varying
);


--
-- TOC entry 314 (class 1259 OID 20512)
-- Name: wf_process_link; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wf_process_link (
    processid character varying(510) NOT NULL,
    parentprocessid character varying(510) DEFAULT NULL::character varying,
    originprocessid character varying(510) DEFAULT NULL::character varying
);


--
-- TOC entry 315 (class 1259 OID 20519)
-- Name: wf_report; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wf_report (
    activityinstanceid character varying(510) NOT NULL,
    processinstanceid character varying(510) DEFAULT NULL::character varying,
    priority character varying(510) DEFAULT NULL::character varying,
    createdtime timestamp with time zone,
    startedtime timestamp with time zone,
    datelimit bigint,
    due timestamp with time zone,
    delay bigint,
    finishtime timestamp with time zone,
    timeconsumingfromdatecreated bigint,
    timeconsumingfromdatestarted bigint,
    performer character varying(510) DEFAULT NULL::character varying,
    nameofaccepteduser character varying(510) DEFAULT NULL::character varying,
    status character varying(510) DEFAULT NULL::character varying,
    state character varying(510) DEFAULT NULL::character varying,
    packageid character varying(510) DEFAULT NULL::character varying,
    processdefid character varying(510) DEFAULT NULL::character varying,
    activitydefid character varying(510) DEFAULT NULL::character varying,
    assignmentusers text,
    appid character varying(510) DEFAULT NULL::character varying,
    appversion bigint
);


--
-- TOC entry 316 (class 1259 OID 20534)
-- Name: wf_report_activity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wf_report_activity (
    activitydefid character varying(510) NOT NULL,
    activityname character varying(510) DEFAULT NULL::character varying,
    description character varying(510) DEFAULT NULL::character varying,
    priority character varying(510) DEFAULT NULL::character varying
);


--
-- TOC entry 317 (class 1259 OID 20542)
-- Name: wf_report_package; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wf_report_package (
    packageid character varying(510) NOT NULL,
    packagename character varying(510) DEFAULT NULL::character varying
);


--
-- TOC entry 318 (class 1259 OID 20548)
-- Name: wf_report_process; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wf_report_process (
    processdefid character varying(510) NOT NULL,
    processname character varying(510) DEFAULT NULL::character varying,
    version character varying(510) DEFAULT NULL::character varying
);


--
-- TOC entry 319 (class 1259 OID 20555)
-- Name: wf_resource_bundle_message; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wf_resource_bundle_message (
    id character varying(510) NOT NULL,
    messagekey character varying(510) DEFAULT NULL::character varying,
    locale character varying(510) DEFAULT NULL::character varying,
    message text
);


--
-- TOC entry 320 (class 1259 OID 20562)
-- Name: wf_setup; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE wf_setup (
    id character varying(510) NOT NULL,
    property character varying(510) DEFAULT NULL::character varying,
    value text,
    ordering integer
);


--
-- TOC entry 4620 (class 0 OID 19929)
-- Dependencies: 209
-- Data for Name: app_app; Type: TABLE DATA; Schema: public; Owner: -
--


--
-- TOC entry 4621 (class 0 OID 19935)
-- Dependencies: 210
-- Data for Name: app_builder; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4622 (class 0 OID 19940)
-- Dependencies: 211
-- Data for Name: app_datalist; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4623 (class 0 OID 19946)
-- Dependencies: 212
-- Data for Name: app_env_variable; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4624 (class 0 OID 19951)
-- Dependencies: 213
-- Data for Name: app_fd; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4625 (class 0 OID 19956)
-- Dependencies: 214
-- Data for Name: app_fd_appcenter; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4626 (class 0 OID 19961)
-- Dependencies: 215
-- Data for Name: app_form; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4627 (class 0 OID 19968)
-- Dependencies: 216
-- Data for Name: app_form_data_audit_trail; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4628 (class 0 OID 19973)
-- Dependencies: 217
-- Data for Name: app_message; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4629 (class 0 OID 19980)
-- Dependencies: 218
-- Data for Name: app_package; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4630 (class 0 OID 19987)
-- Dependencies: 219
-- Data for Name: app_package_activity_form; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4631 (class 0 OID 19997)
-- Dependencies: 220
-- Data for Name: app_package_activity_plugin; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4632 (class 0 OID 20004)
-- Dependencies: 221
-- Data for Name: app_package_participant; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4633 (class 0 OID 20011)
-- Dependencies: 222
-- Data for Name: app_plugin_default; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4634 (class 0 OID 20017)
-- Dependencies: 223
-- Data for Name: app_report_activity; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4635 (class 0 OID 20025)
-- Dependencies: 224
-- Data for Name: app_report_activity_instance; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4636 (class 0 OID 20036)
-- Dependencies: 225
-- Data for Name: app_report_app; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4637 (class 0 OID 20044)
-- Dependencies: 226
-- Data for Name: app_report_package; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4638 (class 0 OID 20053)
-- Dependencies: 227
-- Data for Name: app_report_process; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4639 (class 0 OID 20061)
-- Dependencies: 228
-- Data for Name: app_report_process_instance; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4640 (class 0 OID 20069)
-- Dependencies: 229
-- Data for Name: app_resource; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4641 (class 0 OID 20074)
-- Dependencies: 230
-- Data for Name: app_userview; Type: TABLE DATA; Schema: public; Owner: -
--


--
-- TOC entry 4642 (class 0 OID 20080)
-- Dependencies: 231
-- Data for Name: dir_department; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4643 (class 0 OID 20090)
-- Dependencies: 232
-- Data for Name: dir_employment; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4644 (class 0 OID 20101)
-- Dependencies: 233
-- Data for Name: dir_employment_report_to; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4645 (class 0 OID 20107)
-- Dependencies: 234
-- Data for Name: dir_grade; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4646 (class 0 OID 20115)
-- Dependencies: 235
-- Data for Name: dir_group; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4647 (class 0 OID 20123)
-- Dependencies: 236
-- Data for Name: dir_organization; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4648 (class 0 OID 20131)
-- Dependencies: 237
-- Data for Name: dir_role; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO dir_role VALUES ('ROLE_ADMIN', 'Admin', 'Administrator');
INSERT INTO dir_role VALUES ('ROLE_USER', 'User', 'Normal User');


--
-- TOC entry 4649 (class 0 OID 20138)
-- Dependencies: 238
-- Data for Name: dir_user; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO dir_user VALUES ('admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Admin', 'Admin', NULL, 1, '0', NULL);


--
-- TOC entry 4650 (class 0 OID 20150)
-- Dependencies: 239
-- Data for Name: dir_user_extra; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4651 (class 0 OID 20156)
-- Dependencies: 240
-- Data for Name: dir_user_group; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4652 (class 0 OID 20161)
-- Dependencies: 241
-- Data for Name: dir_user_meta; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4653 (class 0 OID 20166)
-- Dependencies: 242
-- Data for Name: dir_user_password_history; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4654 (class 0 OID 20174)
-- Dependencies: 243
-- Data for Name: dir_user_replacement; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4655 (class 0 OID 20179)
-- Dependencies: 244
-- Data for Name: dir_user_role; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO dir_user_role VALUES ('ROLE_ADMIN', 'admin');


--
-- TOC entry 4656 (class 0 OID 20184)
-- Dependencies: 245
-- Data for Name: objectid; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO objectid VALUES (1000200);

--
-- TOC entry 4657 (class 0 OID 20187)
-- Dependencies: 246
-- Data for Name: shkactivities; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4658 (class 0 OID 20199)
-- Dependencies: 247
-- Data for Name: shkactivitydata; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4659 (class 0 OID 20205)
-- Dependencies: 248
-- Data for Name: shkactivitydatablobs; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4660 (class 0 OID 20210)
-- Dependencies: 249
-- Data for Name: shkactivitydatawob; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4661 (class 0 OID 20216)
-- Dependencies: 250
-- Data for Name: shkactivitystateeventaudits; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4662 (class 0 OID 20219)
-- Dependencies: 251
-- Data for Name: shkactivitystates; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO shkactivitystates VALUES ('open.running', 'open.running', 1000001, 0);
INSERT INTO shkactivitystates VALUES ('open.not_running.not_started', 'open.not_running.not_started', 1000003, 0);
INSERT INTO shkactivitystates VALUES ('open.not_running.suspended', 'open.not_running.suspended', 1000005, 0);
INSERT INTO shkactivitystates VALUES ('closed.completed', 'closed.completed', 1000007, 0);
INSERT INTO shkactivitystates VALUES ('closed.terminated', 'closed.terminated', 1000009, 0);
INSERT INTO shkactivitystates VALUES ('closed.aborted', 'closed.aborted', 1000011, 0);


--
-- TOC entry 4663 (class 0 OID 20222)
-- Dependencies: 252
-- Data for Name: shkandjointable; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4664 (class 0 OID 20226)
-- Dependencies: 253
-- Data for Name: shkassignmenteventaudits; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4665 (class 0 OID 20238)
-- Dependencies: 254
-- Data for Name: shkassignmentstable; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4666 (class 0 OID 20243)
-- Dependencies: 255
-- Data for Name: shkcounters; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4667 (class 0 OID 20246)
-- Dependencies: 256
-- Data for Name: shkcreateprocesseventaudits; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4668 (class 0 OID 20263)
-- Dependencies: 257
-- Data for Name: shkdataeventaudits; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4669 (class 0 OID 20274)
-- Dependencies: 258
-- Data for Name: shkdeadlines; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4670 (class 0 OID 20277)
-- Dependencies: 259
-- Data for Name: shkeventtypes; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4671 (class 0 OID 20280)
-- Dependencies: 260
-- Data for Name: shkgroupgrouptable; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4672 (class 0 OID 20283)
-- Dependencies: 261
-- Data for Name: shkgrouptable; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4673 (class 0 OID 20289)
-- Dependencies: 262
-- Data for Name: shkgroupuser; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4674 (class 0 OID 20292)
-- Dependencies: 263
-- Data for Name: shkgroupuserpacklevelpart; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4675 (class 0 OID 20295)
-- Dependencies: 264
-- Data for Name: shkgroupuserproclevelpart; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4676 (class 0 OID 20298)
-- Dependencies: 265
-- Data for Name: shkneweventauditdata; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4677 (class 0 OID 20304)
-- Dependencies: 266
-- Data for Name: shkneweventauditdatablobs; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4678 (class 0 OID 20309)
-- Dependencies: 267
-- Data for Name: shkneweventauditdatawob; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4679 (class 0 OID 20315)
-- Dependencies: 268
-- Data for Name: shknextxpdlversions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4680 (class 0 OID 20318)
-- Dependencies: 269
-- Data for Name: shknormaluser; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4681 (class 0 OID 20321)
-- Dependencies: 270
-- Data for Name: shkoldeventauditdata; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4682 (class 0 OID 20327)
-- Dependencies: 271
-- Data for Name: shkoldeventauditdatablobs; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4683 (class 0 OID 20332)
-- Dependencies: 272
-- Data for Name: shkoldeventauditdatawob; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4684 (class 0 OID 20338)
-- Dependencies: 273
-- Data for Name: shkpacklevelparticipant; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4685 (class 0 OID 20341)
-- Dependencies: 274
-- Data for Name: shkpacklevelxpdlapp; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4686 (class 0 OID 20344)
-- Dependencies: 275
-- Data for Name: shkpacklevelxpdlapptaappdetail; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4687 (class 0 OID 20347)
-- Dependencies: 276
-- Data for Name: shkpacklevelxpdlapptaappdetusr; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4688 (class 0 OID 20350)
-- Dependencies: 277
-- Data for Name: shkpacklevelxpdlapptaappuser; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4689 (class 0 OID 20353)
-- Dependencies: 278
-- Data for Name: shkpacklevelxpdlapptoolagntapp; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4690 (class 0 OID 20356)
-- Dependencies: 279
-- Data for Name: shkprocessdata; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4691 (class 0 OID 20362)
-- Dependencies: 280
-- Data for Name: shkprocessdatablobs; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4692 (class 0 OID 20367)
-- Dependencies: 281
-- Data for Name: shkprocessdatawob; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4693 (class 0 OID 20373)
-- Dependencies: 282
-- Data for Name: shkprocessdefinitions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4694 (class 0 OID 20378)
-- Dependencies: 283
-- Data for Name: shkprocesses; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4695 (class 0 OID 20388)
-- Dependencies: 284
-- Data for Name: shkprocessrequesters; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4696 (class 0 OID 20393)
-- Dependencies: 285
-- Data for Name: shkprocessstateeventaudits; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4697 (class 0 OID 20396)
-- Dependencies: 286
-- Data for Name: shkprocessstates; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO shkprocessstates VALUES ('open.running', 'open.running', 1000000, 0);
INSERT INTO shkprocessstates VALUES ('open.not_running.not_started', 'open.not_running.not_started', 1000002, 0);
INSERT INTO shkprocessstates VALUES ('open.not_running.suspended', 'open.not_running.suspended', 1000004, 0);
INSERT INTO shkprocessstates VALUES ('closed.completed', 'closed.completed', 1000006, 0);
INSERT INTO shkprocessstates VALUES ('closed.terminated', 'closed.terminated', 1000008, 0);
INSERT INTO shkprocessstates VALUES ('closed.aborted', 'closed.aborted', 1000010, 0);


--
-- TOC entry 4698 (class 0 OID 20399)
-- Dependencies: 287
-- Data for Name: shkproclevelparticipant; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4699 (class 0 OID 20402)
-- Dependencies: 288
-- Data for Name: shkproclevelxpdlapp; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4700 (class 0 OID 20405)
-- Dependencies: 289
-- Data for Name: shkproclevelxpdlapptaappdetail; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4701 (class 0 OID 20408)
-- Dependencies: 290
-- Data for Name: shkproclevelxpdlapptaappdetusr; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4702 (class 0 OID 20411)
-- Dependencies: 291
-- Data for Name: shkproclevelxpdlapptaappuser; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4703 (class 0 OID 20414)
-- Dependencies: 292
-- Data for Name: shkproclevelxpdlapptoolagntapp; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4704 (class 0 OID 20417)
-- Dependencies: 293
-- Data for Name: shkresourcestable; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4705 (class 0 OID 20421)
-- Dependencies: 294
-- Data for Name: shkstateeventaudits; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4706 (class 0 OID 20436)
-- Dependencies: 295
-- Data for Name: shktoolagentapp; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4707 (class 0 OID 20441)
-- Dependencies: 296
-- Data for Name: shktoolagentappdetail; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4708 (class 0 OID 20444)
-- Dependencies: 297
-- Data for Name: shktoolagentappdetailuser; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4709 (class 0 OID 20447)
-- Dependencies: 298
-- Data for Name: shktoolagentappuser; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4710 (class 0 OID 20450)
-- Dependencies: 299
-- Data for Name: shktoolagentuser; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4711 (class 0 OID 20454)
-- Dependencies: 300
-- Data for Name: shkusergrouptable; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4712 (class 0 OID 20457)
-- Dependencies: 301
-- Data for Name: shkuserpacklevelpart; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4713 (class 0 OID 20460)
-- Dependencies: 302
-- Data for Name: shkuserproclevelparticipant; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4714 (class 0 OID 20463)
-- Dependencies: 303
-- Data for Name: shkusertable; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4715 (class 0 OID 20471)
-- Dependencies: 304
-- Data for Name: shkxpdlapplicationpackage; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4716 (class 0 OID 20474)
-- Dependencies: 305
-- Data for Name: shkxpdlapplicationprocess; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4717 (class 0 OID 20477)
-- Dependencies: 306
-- Data for Name: shkxpdldata; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4718 (class 0 OID 20482)
-- Dependencies: 307
-- Data for Name: shkxpdlhistory; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4719 (class 0 OID 20485)
-- Dependencies: 308
-- Data for Name: shkxpdlhistorydata; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4720 (class 0 OID 20490)
-- Dependencies: 309
-- Data for Name: shkxpdlparticipantpackage; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4721 (class 0 OID 20493)
-- Dependencies: 310
-- Data for Name: shkxpdlparticipantprocess; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4722 (class 0 OID 20496)
-- Dependencies: 311
-- Data for Name: shkxpdlreferences; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4723 (class 0 OID 20499)
-- Dependencies: 312
-- Data for Name: shkxpdls; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4724 (class 0 OID 20502)
-- Dependencies: 313
-- Data for Name: wf_audit_trail; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4725 (class 0 OID 20512)
-- Dependencies: 314
-- Data for Name: wf_process_link; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4726 (class 0 OID 20519)
-- Dependencies: 315
-- Data for Name: wf_report; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4727 (class 0 OID 20534)
-- Dependencies: 316
-- Data for Name: wf_report_activity; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4728 (class 0 OID 20542)
-- Dependencies: 317
-- Data for Name: wf_report_package; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4729 (class 0 OID 20548)
-- Dependencies: 318
-- Data for Name: wf_report_process; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4730 (class 0 OID 20555)
-- Dependencies: 319
-- Data for Name: wf_resource_bundle_message; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4731 (class 0 OID 20562)
-- Dependencies: 320
-- Data for Name: wf_setup; Type: TABLE DATA; Schema: public; Owner: -
--


--
-- TOC entry 3820 (class 2606 OID 20569)
-- Name: app_app app_app_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_app
    ADD CONSTRAINT app_app_pkey PRIMARY KEY (appid, appversion);


--
-- TOC entry 3823 (class 2606 OID 20571)
-- Name: app_builder app_builder_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_builder
    ADD CONSTRAINT app_builder_pkey PRIMARY KEY (appid, appversion, id);


--
-- TOC entry 3827 (class 2606 OID 20573)
-- Name: app_datalist app_datalist_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_datalist
    ADD CONSTRAINT app_datalist_pkey PRIMARY KEY (appid, appversion, id);


--
-- TOC entry 3830 (class 2606 OID 20575)
-- Name: app_env_variable app_env_variable_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_env_variable
    ADD CONSTRAINT app_env_variable_pkey PRIMARY KEY (appid, appversion, id);


--
-- TOC entry 3834 (class 2606 OID 20577)
-- Name: app_fd_appcenter app_fd_appcenter_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_fd_appcenter
    ADD CONSTRAINT app_fd_appcenter_pkey PRIMARY KEY (id);


--
-- TOC entry 3832 (class 2606 OID 20579)
-- Name: app_fd app_fd_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_fd
    ADD CONSTRAINT app_fd_pkey PRIMARY KEY (id);


--
-- TOC entry 3839 (class 2606 OID 20581)
-- Name: app_form_data_audit_trail app_form_data_audit_trail_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_form_data_audit_trail
    ADD CONSTRAINT app_form_data_audit_trail_pkey PRIMARY KEY (id);


--
-- TOC entry 3837 (class 2606 OID 20583)
-- Name: app_form app_form_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_form
    ADD CONSTRAINT app_form_pkey PRIMARY KEY (appid, appversion, formid);


--
-- TOC entry 3842 (class 2606 OID 20585)
-- Name: app_message app_message_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_message
    ADD CONSTRAINT app_message_pkey PRIMARY KEY (appid, appversion, ouid);


--
-- TOC entry 3848 (class 2606 OID 20587)
-- Name: app_package_activity_form app_package_activity_form_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_package_activity_form
    ADD CONSTRAINT app_package_activity_form_pkey PRIMARY KEY (processdefid, activitydefid, packageid, packageversion);


--
-- TOC entry 3851 (class 2606 OID 20589)
-- Name: app_package_activity_plugin app_package_activity_plugin_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_package_activity_plugin
    ADD CONSTRAINT app_package_activity_plugin_pkey PRIMARY KEY (processdefid, activitydefid, packageid, packageversion);


--
-- TOC entry 3854 (class 2606 OID 20591)
-- Name: app_package_participant app_package_participant_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_package_participant
    ADD CONSTRAINT app_package_participant_pkey PRIMARY KEY (processdefid, participantid, packageid, packageversion);


--
-- TOC entry 3845 (class 2606 OID 20593)
-- Name: app_package app_package_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_package
    ADD CONSTRAINT app_package_pkey PRIMARY KEY (packageid, packageversion);


--
-- TOC entry 3857 (class 2606 OID 20595)
-- Name: app_plugin_default app_plugin_default_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_plugin_default
    ADD CONSTRAINT app_plugin_default_pkey PRIMARY KEY (appid, appversion, id);


--
-- TOC entry 3863 (class 2606 OID 20597)
-- Name: app_report_activity_instance app_report_activity_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_report_activity_instance
    ADD CONSTRAINT app_report_activity_instance_pkey PRIMARY KEY (instanceid);


--
-- TOC entry 3859 (class 2606 OID 20599)
-- Name: app_report_activity app_report_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_report_activity
    ADD CONSTRAINT app_report_activity_pkey PRIMARY KEY (uuid);


--
-- TOC entry 3866 (class 2606 OID 20601)
-- Name: app_report_app app_report_app_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_report_app
    ADD CONSTRAINT app_report_app_pkey PRIMARY KEY (uuid);


--
-- TOC entry 3869 (class 2606 OID 20603)
-- Name: app_report_package app_report_package_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_report_package
    ADD CONSTRAINT app_report_package_pkey PRIMARY KEY (uuid);


--
-- TOC entry 3874 (class 2606 OID 20605)
-- Name: app_report_process_instance app_report_process_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_report_process_instance
    ADD CONSTRAINT app_report_process_instance_pkey PRIMARY KEY (instanceid);


--
-- TOC entry 3872 (class 2606 OID 20607)
-- Name: app_report_process app_report_process_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_report_process
    ADD CONSTRAINT app_report_process_pkey PRIMARY KEY (uuid);


--
-- TOC entry 3877 (class 2606 OID 20609)
-- Name: app_resource app_resource_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_resource
    ADD CONSTRAINT app_resource_pkey PRIMARY KEY (appid, appversion, id);


--
-- TOC entry 3880 (class 2606 OID 20611)
-- Name: app_userview app_userview_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_userview
    ADD CONSTRAINT app_userview_pkey PRIMARY KEY (appid, appversion, id);


--
-- TOC entry 3885 (class 2606 OID 20613)
-- Name: dir_department dir_department_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dir_department
    ADD CONSTRAINT dir_department_pkey PRIMARY KEY (id);


--
-- TOC entry 3890 (class 2606 OID 20615)
-- Name: dir_employment dir_employment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dir_employment
    ADD CONSTRAINT dir_employment_pkey PRIMARY KEY (id);


--
-- TOC entry 3894 (class 2606 OID 20617)
-- Name: dir_employment_report_to dir_employment_report_to_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dir_employment_report_to
    ADD CONSTRAINT dir_employment_report_to_pkey PRIMARY KEY (employmentid, reporttoid);


--
-- TOC entry 3898 (class 2606 OID 20619)
-- Name: dir_grade dir_grade_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dir_grade
    ADD CONSTRAINT dir_grade_pkey PRIMARY KEY (id);


--
-- TOC entry 3901 (class 2606 OID 20621)
-- Name: dir_group dir_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dir_group
    ADD CONSTRAINT dir_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3904 (class 2606 OID 20623)
-- Name: dir_organization dir_organization_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dir_organization
    ADD CONSTRAINT dir_organization_pkey PRIMARY KEY (id);


--
-- TOC entry 3906 (class 2606 OID 20625)
-- Name: dir_role dir_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dir_role
    ADD CONSTRAINT dir_role_pkey PRIMARY KEY (id);


--
-- TOC entry 3910 (class 2606 OID 20627)
-- Name: dir_user_extra dir_user_extra_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dir_user_extra
    ADD CONSTRAINT dir_user_extra_pkey PRIMARY KEY (username);


--
-- TOC entry 3913 (class 2606 OID 20629)
-- Name: dir_user_group dir_user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dir_user_group
    ADD CONSTRAINT dir_user_group_pkey PRIMARY KEY (userid, groupid);


--
-- TOC entry 3916 (class 2606 OID 20631)
-- Name: dir_user_meta dir_user_meta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dir_user_meta
    ADD CONSTRAINT dir_user_meta_pkey PRIMARY KEY (username, meta_key);


--
-- TOC entry 3918 (class 2606 OID 20633)
-- Name: dir_user_password_history dir_user_password_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dir_user_password_history
    ADD CONSTRAINT dir_user_password_history_pkey PRIMARY KEY (id);


--
-- TOC entry 3908 (class 2606 OID 20635)
-- Name: dir_user dir_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dir_user
    ADD CONSTRAINT dir_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3920 (class 2606 OID 20637)
-- Name: dir_user_replacement dir_user_replacement_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dir_user_replacement
    ADD CONSTRAINT dir_user_replacement_pkey PRIMARY KEY (id);


--
-- TOC entry 3922 (class 2606 OID 20639)
-- Name: dir_user_role dir_user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dir_user_role
    ADD CONSTRAINT dir_user_role_pkey PRIMARY KEY (userid, roleid);


--
-- TOC entry 3926 (class 2606 OID 20641)
-- Name: objectid objectid_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY objectid
    ADD CONSTRAINT objectid_pkey PRIMARY KEY (nextoid);

--
-- TOC entry 3928 (class 2606 OID 20643)
-- Name: shkactivities shkactivities_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkactivities
    ADD CONSTRAINT shkactivities_id_key UNIQUE (id);


--
-- TOC entry 3930 (class 2606 OID 20645)
-- Name: shkactivities shkactivities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkactivities
    ADD CONSTRAINT shkactivities_pkey PRIMARY KEY (oid);


--
-- TOC entry 3936 (class 2606 OID 20647)
-- Name: shkactivitydata shkactivitydata_activity_variabledefinitionid_ordno_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkactivitydata
    ADD CONSTRAINT shkactivitydata_activity_variabledefinitionid_ordno_key UNIQUE (activity, variabledefinitionid, ordno);


--
-- TOC entry 3938 (class 2606 OID 20649)
-- Name: shkactivitydata shkactivitydata_cnt_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkactivitydata
    ADD CONSTRAINT shkactivitydata_cnt_key UNIQUE (cnt);


--
-- TOC entry 3940 (class 2606 OID 20651)
-- Name: shkactivitydata shkactivitydata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkactivitydata
    ADD CONSTRAINT shkactivitydata_pkey PRIMARY KEY (oid);


--
-- TOC entry 3943 (class 2606 OID 20653)
-- Name: shkactivitydatablobs shkactivitydatablobs_activitydatawob_ordno_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkactivitydatablobs
    ADD CONSTRAINT shkactivitydatablobs_activitydatawob_ordno_key UNIQUE (activitydatawob, ordno);


--
-- TOC entry 3945 (class 2606 OID 20655)
-- Name: shkactivitydatablobs shkactivitydatablobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkactivitydatablobs
    ADD CONSTRAINT shkactivitydatablobs_pkey PRIMARY KEY (oid);


--
-- TOC entry 3948 (class 2606 OID 20657)
-- Name: shkactivitydatawob shkactivitydatawob_activity_variabledefinitionid_ordno_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkactivitydatawob
    ADD CONSTRAINT shkactivitydatawob_activity_variabledefinitionid_ordno_key UNIQUE (activity, variabledefinitionid, ordno);


--
-- TOC entry 3950 (class 2606 OID 20659)
-- Name: shkactivitydatawob shkactivitydatawob_cnt_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkactivitydatawob
    ADD CONSTRAINT shkactivitydatawob_cnt_key UNIQUE (cnt);


--
-- TOC entry 3952 (class 2606 OID 20661)
-- Name: shkactivitydatawob shkactivitydatawob_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkactivitydatawob
    ADD CONSTRAINT shkactivitydatawob_pkey PRIMARY KEY (oid);


--
-- TOC entry 3954 (class 2606 OID 20663)
-- Name: shkactivitystateeventaudits shkactivitystateeventaudits_keyvalue_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkactivitystateeventaudits
    ADD CONSTRAINT shkactivitystateeventaudits_keyvalue_key UNIQUE (keyvalue);


--
-- TOC entry 3956 (class 2606 OID 20665)
-- Name: shkactivitystateeventaudits shkactivitystateeventaudits_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkactivitystateeventaudits
    ADD CONSTRAINT shkactivitystateeventaudits_name_key UNIQUE (name);


--
-- TOC entry 3958 (class 2606 OID 20667)
-- Name: shkactivitystateeventaudits shkactivitystateeventaudits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkactivitystateeventaudits
    ADD CONSTRAINT shkactivitystateeventaudits_pkey PRIMARY KEY (oid);


--
-- TOC entry 3960 (class 2606 OID 20669)
-- Name: shkactivitystates shkactivitystates_keyvalue_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkactivitystates
    ADD CONSTRAINT shkactivitystates_keyvalue_key UNIQUE (keyvalue);


--
-- TOC entry 3962 (class 2606 OID 20671)
-- Name: shkactivitystates shkactivitystates_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkactivitystates
    ADD CONSTRAINT shkactivitystates_name_key UNIQUE (name);


--
-- TOC entry 3964 (class 2606 OID 20673)
-- Name: shkactivitystates shkactivitystates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkactivitystates
    ADD CONSTRAINT shkactivitystates_pkey PRIMARY KEY (oid);


--
-- TOC entry 3968 (class 2606 OID 20675)
-- Name: shkandjointable shkandjointable_cnt_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkandjointable
    ADD CONSTRAINT shkandjointable_cnt_key UNIQUE (cnt);


--
-- TOC entry 3970 (class 2606 OID 20677)
-- Name: shkandjointable shkandjointable_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkandjointable
    ADD CONSTRAINT shkandjointable_pkey PRIMARY KEY (oid);


--
-- TOC entry 3973 (class 2606 OID 20679)
-- Name: shkassignmenteventaudits shkassignmenteventaudits_cnt_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkassignmenteventaudits
    ADD CONSTRAINT shkassignmenteventaudits_cnt_key UNIQUE (cnt);


--
-- TOC entry 3975 (class 2606 OID 20681)
-- Name: shkassignmenteventaudits shkassignmenteventaudits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkassignmenteventaudits
    ADD CONSTRAINT shkassignmenteventaudits_pkey PRIMARY KEY (oid);


--
-- TOC entry 3979 (class 2606 OID 20683)
-- Name: shkassignmentstable shkassignmentstable_activity_theresource_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkassignmentstable
    ADD CONSTRAINT shkassignmentstable_activity_theresource_key UNIQUE (activity, theresource);


--
-- TOC entry 3981 (class 2606 OID 20685)
-- Name: shkassignmentstable shkassignmentstable_cnt_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkassignmentstable
    ADD CONSTRAINT shkassignmentstable_cnt_key UNIQUE (cnt);


--
-- TOC entry 3983 (class 2606 OID 20687)
-- Name: shkassignmentstable shkassignmentstable_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkassignmentstable
    ADD CONSTRAINT shkassignmentstable_pkey PRIMARY KEY (oid);


--
-- TOC entry 3986 (class 2606 OID 20689)
-- Name: shkcounters shkcounters_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkcounters
    ADD CONSTRAINT shkcounters_name_key UNIQUE (name);


--
-- TOC entry 3988 (class 2606 OID 20691)
-- Name: shkcounters shkcounters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkcounters
    ADD CONSTRAINT shkcounters_pkey PRIMARY KEY (oid);


--
-- TOC entry 3990 (class 2606 OID 20693)
-- Name: shkcreateprocesseventaudits shkcreateprocesseventaudits_cnt_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkcreateprocesseventaudits
    ADD CONSTRAINT shkcreateprocesseventaudits_cnt_key UNIQUE (cnt);


--
-- TOC entry 3992 (class 2606 OID 20695)
-- Name: shkcreateprocesseventaudits shkcreateprocesseventaudits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkcreateprocesseventaudits
    ADD CONSTRAINT shkcreateprocesseventaudits_pkey PRIMARY KEY (oid);


--
-- TOC entry 3995 (class 2606 OID 20697)
-- Name: shkdataeventaudits shkdataeventaudits_cnt_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkdataeventaudits
    ADD CONSTRAINT shkdataeventaudits_cnt_key UNIQUE (cnt);


--
-- TOC entry 3997 (class 2606 OID 20699)
-- Name: shkdataeventaudits shkdataeventaudits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkdataeventaudits
    ADD CONSTRAINT shkdataeventaudits_pkey PRIMARY KEY (oid);


--
-- TOC entry 4001 (class 2606 OID 20701)
-- Name: shkdeadlines shkdeadlines_cnt_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkdeadlines
    ADD CONSTRAINT shkdeadlines_cnt_key UNIQUE (cnt);


--
-- TOC entry 4003 (class 2606 OID 20703)
-- Name: shkdeadlines shkdeadlines_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkdeadlines
    ADD CONSTRAINT shkdeadlines_pkey PRIMARY KEY (oid);


--
-- TOC entry 4006 (class 2606 OID 20705)
-- Name: shkeventtypes shkeventtypes_keyvalue_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkeventtypes
    ADD CONSTRAINT shkeventtypes_keyvalue_key UNIQUE (keyvalue);


--
-- TOC entry 4008 (class 2606 OID 20707)
-- Name: shkeventtypes shkeventtypes_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkeventtypes
    ADD CONSTRAINT shkeventtypes_name_key UNIQUE (name);


--
-- TOC entry 4010 (class 2606 OID 20709)
-- Name: shkeventtypes shkeventtypes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkeventtypes
    ADD CONSTRAINT shkeventtypes_pkey PRIMARY KEY (oid);


--
-- TOC entry 4013 (class 2606 OID 20711)
-- Name: shkgroupgrouptable shkgroupgrouptable_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkgroupgrouptable
    ADD CONSTRAINT shkgroupgrouptable_pkey PRIMARY KEY (oid);


--
-- TOC entry 4015 (class 2606 OID 20713)
-- Name: shkgroupgrouptable shkgroupgrouptable_sub_gid_groupid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkgroupgrouptable
    ADD CONSTRAINT shkgroupgrouptable_sub_gid_groupid_key UNIQUE (sub_gid, groupid);


--
-- TOC entry 4018 (class 2606 OID 20715)
-- Name: shkgrouptable shkgrouptable_groupid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkgrouptable
    ADD CONSTRAINT shkgrouptable_groupid_key UNIQUE (groupid);


--
-- TOC entry 4020 (class 2606 OID 20717)
-- Name: shkgrouptable shkgrouptable_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkgrouptable
    ADD CONSTRAINT shkgrouptable_pkey PRIMARY KEY (oid);


--
-- TOC entry 4022 (class 2606 OID 20719)
-- Name: shkgroupuser shkgroupuser_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkgroupuser
    ADD CONSTRAINT shkgroupuser_pkey PRIMARY KEY (oid);


--
-- TOC entry 4024 (class 2606 OID 20721)
-- Name: shkgroupuser shkgroupuser_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkgroupuser
    ADD CONSTRAINT shkgroupuser_username_key UNIQUE (username);


--
-- TOC entry 4027 (class 2606 OID 20723)
-- Name: shkgroupuserpacklevelpart shkgroupuserpacklevelpart_participantoid_useroid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkgroupuserpacklevelpart
    ADD CONSTRAINT shkgroupuserpacklevelpart_participantoid_useroid_key UNIQUE (participantoid, useroid);


--
-- TOC entry 4029 (class 2606 OID 20725)
-- Name: shkgroupuserpacklevelpart shkgroupuserpacklevelpart_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkgroupuserpacklevelpart
    ADD CONSTRAINT shkgroupuserpacklevelpart_pkey PRIMARY KEY (oid);


--
-- TOC entry 4033 (class 2606 OID 20727)
-- Name: shkgroupuserproclevelpart shkgroupuserproclevelpart_participantoid_useroid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkgroupuserproclevelpart
    ADD CONSTRAINT shkgroupuserproclevelpart_participantoid_useroid_key UNIQUE (participantoid, useroid);


--
-- TOC entry 4035 (class 2606 OID 20729)
-- Name: shkgroupuserproclevelpart shkgroupuserproclevelpart_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkgroupuserproclevelpart
    ADD CONSTRAINT shkgroupuserproclevelpart_pkey PRIMARY KEY (oid);


--
-- TOC entry 4038 (class 2606 OID 20731)
-- Name: shkneweventauditdata shkneweventauditdata_cnt_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkneweventauditdata
    ADD CONSTRAINT shkneweventauditdata_cnt_key UNIQUE (cnt);


--
-- TOC entry 4041 (class 2606 OID 20733)
-- Name: shkneweventauditdata shkneweventauditdata_dataeventaudit_variabledefinitionid_or_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkneweventauditdata
    ADD CONSTRAINT shkneweventauditdata_dataeventaudit_variabledefinitionid_or_key UNIQUE (dataeventaudit, variabledefinitionid, ordno);


--
-- TOC entry 4043 (class 2606 OID 20735)
-- Name: shkneweventauditdata shkneweventauditdata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkneweventauditdata
    ADD CONSTRAINT shkneweventauditdata_pkey PRIMARY KEY (oid);


--
-- TOC entry 4046 (class 2606 OID 20737)
-- Name: shkneweventauditdatablobs shkneweventauditdatablobs_neweventauditdatawob_ordno_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkneweventauditdatablobs
    ADD CONSTRAINT shkneweventauditdatablobs_neweventauditdatawob_ordno_key UNIQUE (neweventauditdatawob, ordno);


--
-- TOC entry 4048 (class 2606 OID 20739)
-- Name: shkneweventauditdatablobs shkneweventauditdatablobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkneweventauditdatablobs
    ADD CONSTRAINT shkneweventauditdatablobs_pkey PRIMARY KEY (oid);


--
-- TOC entry 4050 (class 2606 OID 20741)
-- Name: shkneweventauditdatawob shkneweventauditdatawob_cnt_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkneweventauditdatawob
    ADD CONSTRAINT shkneweventauditdatawob_cnt_key UNIQUE (cnt);


--
-- TOC entry 4053 (class 2606 OID 20743)
-- Name: shkneweventauditdatawob shkneweventauditdatawob_dataeventaudit_variabledefinitionid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkneweventauditdatawob
    ADD CONSTRAINT shkneweventauditdatawob_dataeventaudit_variabledefinitionid_key UNIQUE (dataeventaudit, variabledefinitionid, ordno);


--
-- TOC entry 4055 (class 2606 OID 20745)
-- Name: shkneweventauditdatawob shkneweventauditdatawob_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkneweventauditdatawob
    ADD CONSTRAINT shkneweventauditdatawob_pkey PRIMARY KEY (oid);


--
-- TOC entry 4057 (class 2606 OID 20747)
-- Name: shknextxpdlversions shknextxpdlversions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shknextxpdlversions
    ADD CONSTRAINT shknextxpdlversions_pkey PRIMARY KEY (oid);


--
-- TOC entry 4059 (class 2606 OID 20749)
-- Name: shknextxpdlversions shknextxpdlversions_xpdlid_nextversion_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shknextxpdlversions
    ADD CONSTRAINT shknextxpdlversions_xpdlid_nextversion_key UNIQUE (xpdlid, nextversion);


--
-- TOC entry 4061 (class 2606 OID 20751)
-- Name: shknormaluser shknormaluser_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shknormaluser
    ADD CONSTRAINT shknormaluser_pkey PRIMARY KEY (oid);


--
-- TOC entry 4063 (class 2606 OID 20753)
-- Name: shknormaluser shknormaluser_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shknormaluser
    ADD CONSTRAINT shknormaluser_username_key UNIQUE (username);


--
-- TOC entry 4065 (class 2606 OID 20755)
-- Name: shkoldeventauditdata shkoldeventauditdata_cnt_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkoldeventauditdata
    ADD CONSTRAINT shkoldeventauditdata_cnt_key UNIQUE (cnt);


--
-- TOC entry 4068 (class 2606 OID 20757)
-- Name: shkoldeventauditdata shkoldeventauditdata_dataeventaudit_variabledefinitionid_or_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkoldeventauditdata
    ADD CONSTRAINT shkoldeventauditdata_dataeventaudit_variabledefinitionid_or_key UNIQUE (dataeventaudit, variabledefinitionid, ordno);


--
-- TOC entry 4070 (class 2606 OID 20759)
-- Name: shkoldeventauditdata shkoldeventauditdata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkoldeventauditdata
    ADD CONSTRAINT shkoldeventauditdata_pkey PRIMARY KEY (oid);


--
-- TOC entry 4073 (class 2606 OID 20761)
-- Name: shkoldeventauditdatablobs shkoldeventauditdatablobs_oldeventauditdatawob_ordno_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkoldeventauditdatablobs
    ADD CONSTRAINT shkoldeventauditdatablobs_oldeventauditdatawob_ordno_key UNIQUE (oldeventauditdatawob, ordno);


--
-- TOC entry 4075 (class 2606 OID 20763)
-- Name: shkoldeventauditdatablobs shkoldeventauditdatablobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkoldeventauditdatablobs
    ADD CONSTRAINT shkoldeventauditdatablobs_pkey PRIMARY KEY (oid);


--
-- TOC entry 4077 (class 2606 OID 20765)
-- Name: shkoldeventauditdatawob shkoldeventauditdatawob_cnt_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkoldeventauditdatawob
    ADD CONSTRAINT shkoldeventauditdatawob_cnt_key UNIQUE (cnt);


--
-- TOC entry 4080 (class 2606 OID 20767)
-- Name: shkoldeventauditdatawob shkoldeventauditdatawob_dataeventaudit_variabledefinitionid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkoldeventauditdatawob
    ADD CONSTRAINT shkoldeventauditdatawob_dataeventaudit_variabledefinitionid_key UNIQUE (dataeventaudit, variabledefinitionid, ordno);


--
-- TOC entry 4082 (class 2606 OID 20769)
-- Name: shkoldeventauditdatawob shkoldeventauditdatawob_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkoldeventauditdatawob
    ADD CONSTRAINT shkoldeventauditdatawob_pkey PRIMARY KEY (oid);


--
-- TOC entry 4085 (class 2606 OID 20771)
-- Name: shkpacklevelparticipant shkpacklevelparticipant_participant_id_packageoid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkpacklevelparticipant
    ADD CONSTRAINT shkpacklevelparticipant_participant_id_packageoid_key UNIQUE (participant_id, packageoid);


--
-- TOC entry 4087 (class 2606 OID 20773)
-- Name: shkpacklevelparticipant shkpacklevelparticipant_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkpacklevelparticipant
    ADD CONSTRAINT shkpacklevelparticipant_pkey PRIMARY KEY (oid);


--
-- TOC entry 4089 (class 2606 OID 20775)
-- Name: shkpacklevelxpdlapp shkpacklevelxpdlapp_application_id_packageoid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkpacklevelxpdlapp
    ADD CONSTRAINT shkpacklevelxpdlapp_application_id_packageoid_key UNIQUE (application_id, packageoid);


--
-- TOC entry 4092 (class 2606 OID 20777)
-- Name: shkpacklevelxpdlapp shkpacklevelxpdlapp_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkpacklevelxpdlapp
    ADD CONSTRAINT shkpacklevelxpdlapp_pkey PRIMARY KEY (oid);


--
-- TOC entry 4094 (class 2606 OID 20779)
-- Name: shkpacklevelxpdlapptaappdetail shkpacklevelxpdlapptaappdetail_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkpacklevelxpdlapptaappdetail
    ADD CONSTRAINT shkpacklevelxpdlapptaappdetail_pkey PRIMARY KEY (oid);


--
-- TOC entry 4098 (class 2606 OID 20781)
-- Name: shkpacklevelxpdlapptaappdetail shkpacklevelxpdlapptaappdetail_xpdl_appoid_toolagentoid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkpacklevelxpdlapptaappdetail
    ADD CONSTRAINT shkpacklevelxpdlapptaappdetail_xpdl_appoid_toolagentoid_key UNIQUE (xpdl_appoid, toolagentoid);


--
-- TOC entry 4100 (class 2606 OID 20783)
-- Name: shkpacklevelxpdlapptaappdetusr shkpacklevelxpdlapptaappdetusr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkpacklevelxpdlapptaappdetusr
    ADD CONSTRAINT shkpacklevelxpdlapptaappdetusr_pkey PRIMARY KEY (oid);


--
-- TOC entry 4104 (class 2606 OID 20785)
-- Name: shkpacklevelxpdlapptaappdetusr shkpacklevelxpdlapptaappdetusr_xpdl_appoid_toolagentoid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkpacklevelxpdlapptaappdetusr
    ADD CONSTRAINT shkpacklevelxpdlapptaappdetusr_xpdl_appoid_toolagentoid_key UNIQUE (xpdl_appoid, toolagentoid);


--
-- TOC entry 4106 (class 2606 OID 20787)
-- Name: shkpacklevelxpdlapptaappuser shkpacklevelxpdlapptaappuser_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkpacklevelxpdlapptaappuser
    ADD CONSTRAINT shkpacklevelxpdlapptaappuser_pkey PRIMARY KEY (oid);


--
-- TOC entry 4110 (class 2606 OID 20789)
-- Name: shkpacklevelxpdlapptaappuser shkpacklevelxpdlapptaappuser_xpdl_appoid_toolagentoid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkpacklevelxpdlapptaappuser
    ADD CONSTRAINT shkpacklevelxpdlapptaappuser_xpdl_appoid_toolagentoid_key UNIQUE (xpdl_appoid, toolagentoid);


--
-- TOC entry 4112 (class 2606 OID 20791)
-- Name: shkpacklevelxpdlapptoolagntapp shkpacklevelxpdlapptoolagntapp_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkpacklevelxpdlapptoolagntapp
    ADD CONSTRAINT shkpacklevelxpdlapptoolagntapp_pkey PRIMARY KEY (oid);


--
-- TOC entry 4116 (class 2606 OID 20793)
-- Name: shkpacklevelxpdlapptoolagntapp shkpacklevelxpdlapptoolagntapp_xpdl_appoid_toolagentoid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkpacklevelxpdlapptoolagntapp
    ADD CONSTRAINT shkpacklevelxpdlapptoolagntapp_xpdl_appoid_toolagentoid_key UNIQUE (xpdl_appoid, toolagentoid);


--
-- TOC entry 4118 (class 2606 OID 20795)
-- Name: shkprocessdata shkprocessdata_cnt_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkprocessdata
    ADD CONSTRAINT shkprocessdata_cnt_key UNIQUE (cnt);


--
-- TOC entry 4120 (class 2606 OID 20797)
-- Name: shkprocessdata shkprocessdata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkprocessdata
    ADD CONSTRAINT shkprocessdata_pkey PRIMARY KEY (oid);


--
-- TOC entry 4123 (class 2606 OID 20799)
-- Name: shkprocessdata shkprocessdata_process_variabledefinitionid_ordno_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkprocessdata
    ADD CONSTRAINT shkprocessdata_process_variabledefinitionid_ordno_key UNIQUE (process, variabledefinitionid, ordno);


--
-- TOC entry 4125 (class 2606 OID 20801)
-- Name: shkprocessdatablobs shkprocessdatablobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkprocessdatablobs
    ADD CONSTRAINT shkprocessdatablobs_pkey PRIMARY KEY (oid);


--
-- TOC entry 4128 (class 2606 OID 20803)
-- Name: shkprocessdatablobs shkprocessdatablobs_processdatawob_ordno_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkprocessdatablobs
    ADD CONSTRAINT shkprocessdatablobs_processdatawob_ordno_key UNIQUE (processdatawob, ordno);


--
-- TOC entry 4130 (class 2606 OID 20805)
-- Name: shkprocessdatawob shkprocessdatawob_cnt_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkprocessdatawob
    ADD CONSTRAINT shkprocessdatawob_cnt_key UNIQUE (cnt);


--
-- TOC entry 4132 (class 2606 OID 20807)
-- Name: shkprocessdatawob shkprocessdatawob_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkprocessdatawob
    ADD CONSTRAINT shkprocessdatawob_pkey PRIMARY KEY (oid);


--
-- TOC entry 4135 (class 2606 OID 20809)
-- Name: shkprocessdatawob shkprocessdatawob_process_variabledefinitionid_ordno_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkprocessdatawob
    ADD CONSTRAINT shkprocessdatawob_process_variabledefinitionid_ordno_key UNIQUE (process, variabledefinitionid, ordno);


--
-- TOC entry 4137 (class 2606 OID 20811)
-- Name: shkprocessdefinitions shkprocessdefinitions_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkprocessdefinitions
    ADD CONSTRAINT shkprocessdefinitions_name_key UNIQUE (name);


--
-- TOC entry 4139 (class 2606 OID 20813)
-- Name: shkprocessdefinitions shkprocessdefinitions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkprocessdefinitions
    ADD CONSTRAINT shkprocessdefinitions_pkey PRIMARY KEY (oid);


--
-- TOC entry 4141 (class 2606 OID 20815)
-- Name: shkprocesses shkprocesses_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkprocesses
    ADD CONSTRAINT shkprocesses_id_key UNIQUE (id);


--
-- TOC entry 4143 (class 2606 OID 20817)
-- Name: shkprocesses shkprocesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkprocesses
    ADD CONSTRAINT shkprocesses_pkey PRIMARY KEY (oid);


--
-- TOC entry 4148 (class 2606 OID 20819)
-- Name: shkprocessrequesters shkprocessrequesters_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkprocessrequesters
    ADD CONSTRAINT shkprocessrequesters_id_key UNIQUE (id);


--
-- TOC entry 4150 (class 2606 OID 20821)
-- Name: shkprocessrequesters shkprocessrequesters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkprocessrequesters
    ADD CONSTRAINT shkprocessrequesters_pkey PRIMARY KEY (oid);


--
-- TOC entry 4153 (class 2606 OID 20823)
-- Name: shkprocessstateeventaudits shkprocessstateeventaudits_keyvalue_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkprocessstateeventaudits
    ADD CONSTRAINT shkprocessstateeventaudits_keyvalue_key UNIQUE (keyvalue);


--
-- TOC entry 4155 (class 2606 OID 20825)
-- Name: shkprocessstateeventaudits shkprocessstateeventaudits_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkprocessstateeventaudits
    ADD CONSTRAINT shkprocessstateeventaudits_name_key UNIQUE (name);


--
-- TOC entry 4157 (class 2606 OID 20827)
-- Name: shkprocessstateeventaudits shkprocessstateeventaudits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkprocessstateeventaudits
    ADD CONSTRAINT shkprocessstateeventaudits_pkey PRIMARY KEY (oid);


--
-- TOC entry 4159 (class 2606 OID 20829)
-- Name: shkprocessstates shkprocessstates_keyvalue_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkprocessstates
    ADD CONSTRAINT shkprocessstates_keyvalue_key UNIQUE (keyvalue);


--
-- TOC entry 4161 (class 2606 OID 20831)
-- Name: shkprocessstates shkprocessstates_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkprocessstates
    ADD CONSTRAINT shkprocessstates_name_key UNIQUE (name);


--
-- TOC entry 4163 (class 2606 OID 20833)
-- Name: shkprocessstates shkprocessstates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkprocessstates
    ADD CONSTRAINT shkprocessstates_pkey PRIMARY KEY (oid);


--
-- TOC entry 4165 (class 2606 OID 20835)
-- Name: shkproclevelparticipant shkproclevelparticipant_participant_id_processoid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkproclevelparticipant
    ADD CONSTRAINT shkproclevelparticipant_participant_id_processoid_key UNIQUE (participant_id, processoid);


--
-- TOC entry 4167 (class 2606 OID 20837)
-- Name: shkproclevelparticipant shkproclevelparticipant_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkproclevelparticipant
    ADD CONSTRAINT shkproclevelparticipant_pkey PRIMARY KEY (oid);


--
-- TOC entry 4170 (class 2606 OID 20839)
-- Name: shkproclevelxpdlapp shkproclevelxpdlapp_application_id_processoid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkproclevelxpdlapp
    ADD CONSTRAINT shkproclevelxpdlapp_application_id_processoid_key UNIQUE (application_id, processoid);


--
-- TOC entry 4172 (class 2606 OID 20841)
-- Name: shkproclevelxpdlapp shkproclevelxpdlapp_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkproclevelxpdlapp
    ADD CONSTRAINT shkproclevelxpdlapp_pkey PRIMARY KEY (oid);


--
-- TOC entry 4175 (class 2606 OID 20843)
-- Name: shkproclevelxpdlapptaappdetail shkproclevelxpdlapptaappdetail_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkproclevelxpdlapptaappdetail
    ADD CONSTRAINT shkproclevelxpdlapptaappdetail_pkey PRIMARY KEY (oid);


--
-- TOC entry 4179 (class 2606 OID 20845)
-- Name: shkproclevelxpdlapptaappdetail shkproclevelxpdlapptaappdetail_xpdl_appoid_toolagentoid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkproclevelxpdlapptaappdetail
    ADD CONSTRAINT shkproclevelxpdlapptaappdetail_xpdl_appoid_toolagentoid_key UNIQUE (xpdl_appoid, toolagentoid);


--
-- TOC entry 4181 (class 2606 OID 20847)
-- Name: shkproclevelxpdlapptaappdetusr shkproclevelxpdlapptaappdetusr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkproclevelxpdlapptaappdetusr
    ADD CONSTRAINT shkproclevelxpdlapptaappdetusr_pkey PRIMARY KEY (oid);


--
-- TOC entry 4185 (class 2606 OID 20849)
-- Name: shkproclevelxpdlapptaappdetusr shkproclevelxpdlapptaappdetusr_xpdl_appoid_toolagentoid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkproclevelxpdlapptaappdetusr
    ADD CONSTRAINT shkproclevelxpdlapptaappdetusr_xpdl_appoid_toolagentoid_key UNIQUE (xpdl_appoid, toolagentoid);


--
-- TOC entry 4187 (class 2606 OID 20851)
-- Name: shkproclevelxpdlapptaappuser shkproclevelxpdlapptaappuser_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkproclevelxpdlapptaappuser
    ADD CONSTRAINT shkproclevelxpdlapptaappuser_pkey PRIMARY KEY (oid);


--
-- TOC entry 4191 (class 2606 OID 20853)
-- Name: shkproclevelxpdlapptaappuser shkproclevelxpdlapptaappuser_xpdl_appoid_toolagentoid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkproclevelxpdlapptaappuser
    ADD CONSTRAINT shkproclevelxpdlapptaappuser_xpdl_appoid_toolagentoid_key UNIQUE (xpdl_appoid, toolagentoid);


--
-- TOC entry 4193 (class 2606 OID 20855)
-- Name: shkproclevelxpdlapptoolagntapp shkproclevelxpdlapptoolagntapp_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkproclevelxpdlapptoolagntapp
    ADD CONSTRAINT shkproclevelxpdlapptoolagntapp_pkey PRIMARY KEY (oid);


--
-- TOC entry 4197 (class 2606 OID 20857)
-- Name: shkproclevelxpdlapptoolagntapp shkproclevelxpdlapptoolagntapp_xpdl_appoid_toolagentoid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkproclevelxpdlapptoolagntapp
    ADD CONSTRAINT shkproclevelxpdlapptoolagntapp_xpdl_appoid_toolagentoid_key UNIQUE (xpdl_appoid, toolagentoid);


--
-- TOC entry 4199 (class 2606 OID 20859)
-- Name: shkresourcestable shkresourcestable_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkresourcestable
    ADD CONSTRAINT shkresourcestable_pkey PRIMARY KEY (oid);


--
-- TOC entry 4201 (class 2606 OID 20861)
-- Name: shkresourcestable shkresourcestable_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkresourcestable
    ADD CONSTRAINT shkresourcestable_username_key UNIQUE (username);


--
-- TOC entry 4203 (class 2606 OID 20863)
-- Name: shkstateeventaudits shkstateeventaudits_cnt_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkstateeventaudits
    ADD CONSTRAINT shkstateeventaudits_cnt_key UNIQUE (cnt);


--
-- TOC entry 4209 (class 2606 OID 20865)
-- Name: shkstateeventaudits shkstateeventaudits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkstateeventaudits
    ADD CONSTRAINT shkstateeventaudits_pkey PRIMARY KEY (oid);


--
-- TOC entry 4212 (class 2606 OID 20867)
-- Name: shktoolagentapp shktoolagentapp_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shktoolagentapp
    ADD CONSTRAINT shktoolagentapp_pkey PRIMARY KEY (oid);


--
-- TOC entry 4214 (class 2606 OID 20869)
-- Name: shktoolagentapp shktoolagentapp_tool_agent_name_app_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shktoolagentapp
    ADD CONSTRAINT shktoolagentapp_tool_agent_name_app_name_key UNIQUE (tool_agent_name, app_name);


--
-- TOC entry 4216 (class 2606 OID 20871)
-- Name: shktoolagentappdetail shktoolagentappdetail_app_mode_toolagent_appoid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shktoolagentappdetail
    ADD CONSTRAINT shktoolagentappdetail_app_mode_toolagent_appoid_key UNIQUE (app_mode, toolagent_appoid);


--
-- TOC entry 4218 (class 2606 OID 20873)
-- Name: shktoolagentappdetail shktoolagentappdetail_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shktoolagentappdetail
    ADD CONSTRAINT shktoolagentappdetail_pkey PRIMARY KEY (oid);


--
-- TOC entry 4221 (class 2606 OID 20875)
-- Name: shktoolagentappdetailuser shktoolagentappdetailuser_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shktoolagentappdetailuser
    ADD CONSTRAINT shktoolagentappdetailuser_pkey PRIMARY KEY (oid);


--
-- TOC entry 4224 (class 2606 OID 20877)
-- Name: shktoolagentappdetailuser shktoolagentappdetailuser_toolagent_appoid_useroid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shktoolagentappdetailuser
    ADD CONSTRAINT shktoolagentappdetailuser_toolagent_appoid_useroid_key UNIQUE (toolagent_appoid, useroid);


--
-- TOC entry 4227 (class 2606 OID 20879)
-- Name: shktoolagentappuser shktoolagentappuser_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shktoolagentappuser
    ADD CONSTRAINT shktoolagentappuser_pkey PRIMARY KEY (oid);


--
-- TOC entry 4230 (class 2606 OID 20881)
-- Name: shktoolagentappuser shktoolagentappuser_toolagent_appoid_useroid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shktoolagentappuser
    ADD CONSTRAINT shktoolagentappuser_toolagent_appoid_useroid_key UNIQUE (toolagent_appoid, useroid);


--
-- TOC entry 4233 (class 2606 OID 20883)
-- Name: shktoolagentuser shktoolagentuser_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shktoolagentuser
    ADD CONSTRAINT shktoolagentuser_pkey PRIMARY KEY (oid);


--
-- TOC entry 4235 (class 2606 OID 20885)
-- Name: shktoolagentuser shktoolagentuser_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shktoolagentuser
    ADD CONSTRAINT shktoolagentuser_username_key UNIQUE (username);


--
-- TOC entry 4238 (class 2606 OID 20887)
-- Name: shkusergrouptable shkusergrouptable_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkusergrouptable
    ADD CONSTRAINT shkusergrouptable_pkey PRIMARY KEY (oid);


--
-- TOC entry 4240 (class 2606 OID 20889)
-- Name: shkusergrouptable shkusergrouptable_userid_groupid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkusergrouptable
    ADD CONSTRAINT shkusergrouptable_userid_groupid_key UNIQUE (userid, groupid);


--
-- TOC entry 4244 (class 2606 OID 20891)
-- Name: shkuserpacklevelpart shkuserpacklevelpart_participantoid_useroid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkuserpacklevelpart
    ADD CONSTRAINT shkuserpacklevelpart_participantoid_useroid_key UNIQUE (participantoid, useroid);


--
-- TOC entry 4246 (class 2606 OID 20893)
-- Name: shkuserpacklevelpart shkuserpacklevelpart_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkuserpacklevelpart
    ADD CONSTRAINT shkuserpacklevelpart_pkey PRIMARY KEY (oid);


--
-- TOC entry 4250 (class 2606 OID 20895)
-- Name: shkuserproclevelparticipant shkuserproclevelparticipant_participantoid_useroid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkuserproclevelparticipant
    ADD CONSTRAINT shkuserproclevelparticipant_participantoid_useroid_key UNIQUE (participantoid, useroid);


--
-- TOC entry 4252 (class 2606 OID 20897)
-- Name: shkuserproclevelparticipant shkuserproclevelparticipant_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkuserproclevelparticipant
    ADD CONSTRAINT shkuserproclevelparticipant_pkey PRIMARY KEY (oid);


--
-- TOC entry 4255 (class 2606 OID 20899)
-- Name: shkusertable shkusertable_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkusertable
    ADD CONSTRAINT shkusertable_pkey PRIMARY KEY (oid);


--
-- TOC entry 4257 (class 2606 OID 20901)
-- Name: shkusertable shkusertable_userid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkusertable
    ADD CONSTRAINT shkusertable_userid_key UNIQUE (userid);


--
-- TOC entry 4259 (class 2606 OID 20903)
-- Name: shkxpdlapplicationpackage shkxpdlapplicationpackage_package_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkxpdlapplicationpackage
    ADD CONSTRAINT shkxpdlapplicationpackage_package_id_key UNIQUE (package_id);


--
-- TOC entry 4261 (class 2606 OID 20905)
-- Name: shkxpdlapplicationpackage shkxpdlapplicationpackage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkxpdlapplicationpackage
    ADD CONSTRAINT shkxpdlapplicationpackage_pkey PRIMARY KEY (oid);


--
-- TOC entry 4264 (class 2606 OID 20907)
-- Name: shkxpdlapplicationprocess shkxpdlapplicationprocess_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkxpdlapplicationprocess
    ADD CONSTRAINT shkxpdlapplicationprocess_pkey PRIMARY KEY (oid);


--
-- TOC entry 4266 (class 2606 OID 20909)
-- Name: shkxpdlapplicationprocess shkxpdlapplicationprocess_process_id_packageoid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkxpdlapplicationprocess
    ADD CONSTRAINT shkxpdlapplicationprocess_process_id_packageoid_key UNIQUE (process_id, packageoid);


--
-- TOC entry 4268 (class 2606 OID 20911)
-- Name: shkxpdldata shkxpdldata_cnt_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkxpdldata
    ADD CONSTRAINT shkxpdldata_cnt_key UNIQUE (cnt);


--
-- TOC entry 4270 (class 2606 OID 20913)
-- Name: shkxpdldata shkxpdldata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkxpdldata
    ADD CONSTRAINT shkxpdldata_pkey PRIMARY KEY (oid);


--
-- TOC entry 4273 (class 2606 OID 20915)
-- Name: shkxpdldata shkxpdldata_xpdl_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkxpdldata
    ADD CONSTRAINT shkxpdldata_xpdl_key UNIQUE (xpdl);


--
-- TOC entry 4275 (class 2606 OID 20917)
-- Name: shkxpdlhistory shkxpdlhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkxpdlhistory
    ADD CONSTRAINT shkxpdlhistory_pkey PRIMARY KEY (oid);


--
-- TOC entry 4277 (class 2606 OID 20919)
-- Name: shkxpdlhistory shkxpdlhistory_xpdlid_xpdlversion_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkxpdlhistory
    ADD CONSTRAINT shkxpdlhistory_xpdlid_xpdlversion_key UNIQUE (xpdlid, xpdlversion);


--
-- TOC entry 4279 (class 2606 OID 20921)
-- Name: shkxpdlhistorydata shkxpdlhistorydata_cnt_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkxpdlhistorydata
    ADD CONSTRAINT shkxpdlhistorydata_cnt_key UNIQUE (cnt);


--
-- TOC entry 4281 (class 2606 OID 20923)
-- Name: shkxpdlhistorydata shkxpdlhistorydata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkxpdlhistorydata
    ADD CONSTRAINT shkxpdlhistorydata_pkey PRIMARY KEY (oid);


--
-- TOC entry 4284 (class 2606 OID 20925)
-- Name: shkxpdlparticipantpackage shkxpdlparticipantpackage_package_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkxpdlparticipantpackage
    ADD CONSTRAINT shkxpdlparticipantpackage_package_id_key UNIQUE (package_id);


--
-- TOC entry 4286 (class 2606 OID 20927)
-- Name: shkxpdlparticipantpackage shkxpdlparticipantpackage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkxpdlparticipantpackage
    ADD CONSTRAINT shkxpdlparticipantpackage_pkey PRIMARY KEY (oid);


--
-- TOC entry 4289 (class 2606 OID 20929)
-- Name: shkxpdlparticipantprocess shkxpdlparticipantprocess_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkxpdlparticipantprocess
    ADD CONSTRAINT shkxpdlparticipantprocess_pkey PRIMARY KEY (oid);


--
-- TOC entry 4291 (class 2606 OID 20931)
-- Name: shkxpdlparticipantprocess shkxpdlparticipantprocess_process_id_packageoid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkxpdlparticipantprocess
    ADD CONSTRAINT shkxpdlparticipantprocess_process_id_packageoid_key UNIQUE (process_id, packageoid);


--
-- TOC entry 4293 (class 2606 OID 20933)
-- Name: shkxpdlreferences shkxpdlreferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkxpdlreferences
    ADD CONSTRAINT shkxpdlreferences_pkey PRIMARY KEY (oid);


--
-- TOC entry 4295 (class 2606 OID 20935)
-- Name: shkxpdlreferences shkxpdlreferences_referredxpdlid_referringxpdl_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkxpdlreferences
    ADD CONSTRAINT shkxpdlreferences_referredxpdlid_referringxpdl_key UNIQUE (referredxpdlid, referringxpdl);


--
-- TOC entry 4298 (class 2606 OID 20937)
-- Name: shkxpdls shkxpdls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkxpdls
    ADD CONSTRAINT shkxpdls_pkey PRIMARY KEY (oid);


--
-- TOC entry 4300 (class 2606 OID 20939)
-- Name: shkxpdls shkxpdls_xpdlid_xpdlversion_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkxpdls
    ADD CONSTRAINT shkxpdls_xpdlid_xpdlversion_key UNIQUE (xpdlid, xpdlversion);


--
-- TOC entry 4302 (class 2606 OID 20941)
-- Name: wf_audit_trail wf_audit_trail_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wf_audit_trail
    ADD CONSTRAINT wf_audit_trail_pkey PRIMARY KEY (id);


--
-- TOC entry 4304 (class 2606 OID 20943)
-- Name: wf_process_link wf_process_link_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wf_process_link
    ADD CONSTRAINT wf_process_link_pkey PRIMARY KEY (processid);


--
-- TOC entry 4311 (class 2606 OID 20945)
-- Name: wf_report_activity wf_report_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wf_report_activity
    ADD CONSTRAINT wf_report_activity_pkey PRIMARY KEY (activitydefid);


--
-- TOC entry 4313 (class 2606 OID 20947)
-- Name: wf_report_package wf_report_package_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wf_report_package
    ADD CONSTRAINT wf_report_package_pkey PRIMARY KEY (packageid);


--
-- TOC entry 4308 (class 2606 OID 20949)
-- Name: wf_report wf_report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wf_report
    ADD CONSTRAINT wf_report_pkey PRIMARY KEY (activityinstanceid);


--
-- TOC entry 4315 (class 2606 OID 20951)
-- Name: wf_report_process wf_report_process_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wf_report_process
    ADD CONSTRAINT wf_report_process_pkey PRIMARY KEY (processdefid);


--
-- TOC entry 4317 (class 2606 OID 20953)
-- Name: wf_resource_bundle_message wf_resource_bundle_message_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wf_resource_bundle_message
    ADD CONSTRAINT wf_resource_bundle_message_pkey PRIMARY KEY (id);


--
-- TOC entry 4319 (class 2606 OID 20955)
-- Name: wf_setup wf_setup_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wf_setup
    ADD CONSTRAINT wf_setup_pkey PRIMARY KEY (id);


--
-- TOC entry 3825 (class 1259 OID 20956)
-- Name: app_datalist_appid_appversion_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_datalist_appid_appversion_idx ON app_datalist USING btree (appid, appversion);


--
-- TOC entry 3828 (class 1259 OID 20957)
-- Name: app_env_variable_appid_appversion_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_env_variable_appid_appversion_idx ON app_env_variable USING btree (appid, appversion);


--
-- TOC entry 3835 (class 1259 OID 20958)
-- Name: app_form_appid_appversion_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_form_appid_appversion_idx ON app_form USING btree (appid, appversion);


--
-- TOC entry 3840 (class 1259 OID 20959)
-- Name: app_message_appid_appversion_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_message_appid_appversion_idx ON app_message USING btree (appid, appversion);


--
-- TOC entry 3846 (class 1259 OID 20960)
-- Name: app_package_activity_form_packageid_packageversion_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_package_activity_form_packageid_packageversion_idx ON app_package_activity_form USING btree (packageid, packageversion);


--
-- TOC entry 3849 (class 1259 OID 20961)
-- Name: app_package_activity_plugin_packageid_packageversion_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_package_activity_plugin_packageid_packageversion_idx ON app_package_activity_plugin USING btree (packageid, packageversion);


--
-- TOC entry 3843 (class 1259 OID 20962)
-- Name: app_package_appid_appversion_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_package_appid_appversion_idx ON app_package USING btree (appid, appversion);


--
-- TOC entry 3852 (class 1259 OID 20963)
-- Name: app_package_participant_packageid_packageversion_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_package_participant_packageid_packageversion_idx ON app_package_participant USING btree (packageid, packageversion);


--
-- TOC entry 3855 (class 1259 OID 20964)
-- Name: app_plugin_default_appid_appversion_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_plugin_default_appid_appversion_idx ON app_plugin_default USING btree (appid, appversion);


--
-- TOC entry 3861 (class 1259 OID 20965)
-- Name: app_report_activity_instance_activityuid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_report_activity_instance_activityuid_idx ON app_report_activity_instance USING btree (activityuid);


--
-- TOC entry 3864 (class 1259 OID 20966)
-- Name: app_report_activity_instance_processinstanceid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_report_activity_instance_processinstanceid_idx ON app_report_activity_instance USING btree (processinstanceid);


--
-- TOC entry 3860 (class 1259 OID 20967)
-- Name: app_report_activity_processuid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_report_activity_processuid_idx ON app_report_activity USING btree (processuid);


--
-- TOC entry 3867 (class 1259 OID 20968)
-- Name: app_report_package_appuid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_report_package_appuid_idx ON app_report_package USING btree (appuid);


--
-- TOC entry 3875 (class 1259 OID 20969)
-- Name: app_report_process_instance_processuid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_report_process_instance_processuid_idx ON app_report_process_instance USING btree (processuid);


--
-- TOC entry 3870 (class 1259 OID 20970)
-- Name: app_report_process_packageuid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_report_process_packageuid_idx ON app_report_process USING btree (packageuid);


--
-- TOC entry 3878 (class 1259 OID 20971)
-- Name: app_userview_appid_appversion_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX app_userview_appid_appversion_idx ON app_userview USING btree (appid, appversion);


--
-- TOC entry 3881 (class 1259 OID 20972)
-- Name: dir_department_hod_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dir_department_hod_idx ON dir_department USING btree (hod);


--
-- TOC entry 3882 (class 1259 OID 20973)
-- Name: dir_department_organizationid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dir_department_organizationid_idx ON dir_department USING btree (organizationid);


--
-- TOC entry 3883 (class 1259 OID 20974)
-- Name: dir_department_parentid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dir_department_parentid_idx ON dir_department USING btree (parentid);


--
-- TOC entry 3886 (class 1259 OID 20975)
-- Name: dir_employment_departmentid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dir_employment_departmentid_idx ON dir_employment USING btree (departmentid);


--
-- TOC entry 3887 (class 1259 OID 20976)
-- Name: dir_employment_gradeid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dir_employment_gradeid_idx ON dir_employment USING btree (gradeid);


--
-- TOC entry 3888 (class 1259 OID 20977)
-- Name: dir_employment_organizationid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dir_employment_organizationid_idx ON dir_employment USING btree (organizationid);


--
-- TOC entry 3892 (class 1259 OID 20978)
-- Name: dir_employment_report_to_employmentid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dir_employment_report_to_employmentid_idx ON dir_employment_report_to USING btree (employmentid);


--
-- TOC entry 3895 (class 1259 OID 20979)
-- Name: dir_employment_report_to_reporttoid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dir_employment_report_to_reporttoid_idx ON dir_employment_report_to USING btree (reporttoid);


--
-- TOC entry 3891 (class 1259 OID 20980)
-- Name: dir_employment_userid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dir_employment_userid_idx ON dir_employment USING btree (userid);


--
-- TOC entry 3896 (class 1259 OID 20981)
-- Name: dir_grade_organizationid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dir_grade_organizationid_idx ON dir_grade USING btree (organizationid);


--
-- TOC entry 3899 (class 1259 OID 20982)
-- Name: dir_group_organizationid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dir_group_organizationid_idx ON dir_group USING btree (organizationid);


--
-- TOC entry 3902 (class 1259 OID 20983)
-- Name: dir_organization_parentid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dir_organization_parentid_idx ON dir_organization USING btree (parentid);


--
-- TOC entry 3911 (class 1259 OID 20984)
-- Name: dir_user_group_groupid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dir_user_group_groupid_idx ON dir_user_group USING btree (groupid);


--
-- TOC entry 3914 (class 1259 OID 20985)
-- Name: dir_user_group_userid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dir_user_group_userid_idx ON dir_user_group USING btree (userid);


--
-- TOC entry 3923 (class 1259 OID 20986)
-- Name: dir_user_role_roleid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dir_user_role_roleid_idx ON dir_user_role USING btree (roleid);


--
-- TOC entry 3924 (class 1259 OID 20987)
-- Name: dir_user_role_userid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dir_user_role_userid_idx ON dir_user_role USING btree (userid);


--
-- TOC entry 3821 (class 1259 OID 20988)
-- Name: idx_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_name ON app_app USING btree (name);

--
-- TOC entry 3824 (class 1259 OID 20989)
-- Name: idx_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_type ON app_builder USING btree (type);


--
-- TOC entry 3931 (class 1259 OID 20990)
-- Name: shkactivities_process_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkactivities_process_idx ON shkactivities USING btree (process);


--
-- TOC entry 3932 (class 1259 OID 20991)
-- Name: shkactivities_state_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkactivities_state_idx ON shkactivities USING btree (state);


--
-- TOC entry 3933 (class 1259 OID 20992)
-- Name: shkactivities_theresource_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkactivities_theresource_idx ON shkactivities USING btree (theresource);


--
-- TOC entry 3934 (class 1259 OID 20993)
-- Name: shkactivitydata_activity_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkactivitydata_activity_idx ON shkactivitydata USING btree (activity);


--
-- TOC entry 3941 (class 1259 OID 20994)
-- Name: shkactivitydatablobs_activitydatawob_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkactivitydatablobs_activitydatawob_idx ON shkactivitydatablobs USING btree (activitydatawob);


--
-- TOC entry 3946 (class 1259 OID 20995)
-- Name: shkactivitydatawob_activity_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkactivitydatawob_activity_idx ON shkactivitydatawob USING btree (activity);


--
-- TOC entry 3965 (class 1259 OID 20996)
-- Name: shkandjointable_activity_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkandjointable_activity_idx ON shkandjointable USING btree (activity);


--
-- TOC entry 3966 (class 1259 OID 20997)
-- Name: shkandjointable_blockactivity_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkandjointable_blockactivity_idx ON shkandjointable USING btree (blockactivity);


--
-- TOC entry 3971 (class 1259 OID 20998)
-- Name: shkandjointable_process_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkandjointable_process_idx ON shkandjointable USING btree (process);


--
-- TOC entry 3976 (class 1259 OID 20999)
-- Name: shkassignmenteventaudits_thetype_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkassignmenteventaudits_thetype_idx ON shkassignmenteventaudits USING btree (thetype);


--
-- TOC entry 3977 (class 1259 OID 21000)
-- Name: shkassignmentstable_activity_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkassignmentstable_activity_idx ON shkassignmentstable USING btree (activity);


--
-- TOC entry 3984 (class 1259 OID 21001)
-- Name: shkassignmentstable_theresource_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkassignmentstable_theresource_idx ON shkassignmentstable USING btree (theresource);


--
-- TOC entry 3993 (class 1259 OID 21002)
-- Name: shkcreateprocesseventaudits_thetype_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkcreateprocesseventaudits_thetype_idx ON shkcreateprocesseventaudits USING btree (thetype);


--
-- TOC entry 3998 (class 1259 OID 21003)
-- Name: shkdataeventaudits_thetype_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkdataeventaudits_thetype_idx ON shkdataeventaudits USING btree (thetype);


--
-- TOC entry 3999 (class 1259 OID 21004)
-- Name: shkdeadlines_activity_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkdeadlines_activity_idx ON shkdeadlines USING btree (activity);


--
-- TOC entry 4004 (class 1259 OID 21005)
-- Name: shkdeadlines_process_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkdeadlines_process_idx ON shkdeadlines USING btree (process);


--
-- TOC entry 4011 (class 1259 OID 21006)
-- Name: shkgroupgrouptable_groupid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkgroupgrouptable_groupid_idx ON shkgroupgrouptable USING btree (groupid);


--
-- TOC entry 4016 (class 1259 OID 21007)
-- Name: shkgroupgrouptable_sub_gid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkgroupgrouptable_sub_gid_idx ON shkgroupgrouptable USING btree (sub_gid);


--
-- TOC entry 4025 (class 1259 OID 21008)
-- Name: shkgroupuserpacklevelpart_participantoid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkgroupuserpacklevelpart_participantoid_idx ON shkgroupuserpacklevelpart USING btree (participantoid);


--
-- TOC entry 4030 (class 1259 OID 21009)
-- Name: shkgroupuserpacklevelpart_useroid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkgroupuserpacklevelpart_useroid_idx ON shkgroupuserpacklevelpart USING btree (useroid);


--
-- TOC entry 4031 (class 1259 OID 21010)
-- Name: shkgroupuserproclevelpart_participantoid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkgroupuserproclevelpart_participantoid_idx ON shkgroupuserproclevelpart USING btree (participantoid);


--
-- TOC entry 4036 (class 1259 OID 21011)
-- Name: shkgroupuserproclevelpart_useroid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkgroupuserproclevelpart_useroid_idx ON shkgroupuserproclevelpart USING btree (useroid);


--
-- TOC entry 4039 (class 1259 OID 21012)
-- Name: shkneweventauditdata_dataeventaudit_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkneweventauditdata_dataeventaudit_idx ON shkneweventauditdata USING btree (dataeventaudit);


--
-- TOC entry 4044 (class 1259 OID 21013)
-- Name: shkneweventauditdatablobs_neweventauditdatawob_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkneweventauditdatablobs_neweventauditdatawob_idx ON shkneweventauditdatablobs USING btree (neweventauditdatawob);


--
-- TOC entry 4051 (class 1259 OID 21014)
-- Name: shkneweventauditdatawob_dataeventaudit_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkneweventauditdatawob_dataeventaudit_idx ON shkneweventauditdatawob USING btree (dataeventaudit);


--
-- TOC entry 4066 (class 1259 OID 21015)
-- Name: shkoldeventauditdata_dataeventaudit_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkoldeventauditdata_dataeventaudit_idx ON shkoldeventauditdata USING btree (dataeventaudit);


--
-- TOC entry 4071 (class 1259 OID 21016)
-- Name: shkoldeventauditdatablobs_oldeventauditdatawob_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkoldeventauditdatablobs_oldeventauditdatawob_idx ON shkoldeventauditdatablobs USING btree (oldeventauditdatawob);


--
-- TOC entry 4078 (class 1259 OID 21017)
-- Name: shkoldeventauditdatawob_dataeventaudit_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkoldeventauditdatawob_dataeventaudit_idx ON shkoldeventauditdatawob USING btree (dataeventaudit);


--
-- TOC entry 4083 (class 1259 OID 21018)
-- Name: shkpacklevelparticipant_packageoid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkpacklevelparticipant_packageoid_idx ON shkpacklevelparticipant USING btree (packageoid);


--
-- TOC entry 4090 (class 1259 OID 21019)
-- Name: shkpacklevelxpdlapp_packageoid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkpacklevelxpdlapp_packageoid_idx ON shkpacklevelxpdlapp USING btree (packageoid);


--
-- TOC entry 4095 (class 1259 OID 21020)
-- Name: shkpacklevelxpdlapptaappdetail_toolagentoid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkpacklevelxpdlapptaappdetail_toolagentoid_idx ON shkpacklevelxpdlapptaappdetail USING btree (toolagentoid);


--
-- TOC entry 4096 (class 1259 OID 21021)
-- Name: shkpacklevelxpdlapptaappdetail_xpdl_appoid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkpacklevelxpdlapptaappdetail_xpdl_appoid_idx ON shkpacklevelxpdlapptaappdetail USING btree (xpdl_appoid);


--
-- TOC entry 4101 (class 1259 OID 21022)
-- Name: shkpacklevelxpdlapptaappdetusr_toolagentoid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkpacklevelxpdlapptaappdetusr_toolagentoid_idx ON shkpacklevelxpdlapptaappdetusr USING btree (toolagentoid);


--
-- TOC entry 4102 (class 1259 OID 21023)
-- Name: shkpacklevelxpdlapptaappdetusr_xpdl_appoid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkpacklevelxpdlapptaappdetusr_xpdl_appoid_idx ON shkpacklevelxpdlapptaappdetusr USING btree (xpdl_appoid);


--
-- TOC entry 4107 (class 1259 OID 21024)
-- Name: shkpacklevelxpdlapptaappuser_toolagentoid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkpacklevelxpdlapptaappuser_toolagentoid_idx ON shkpacklevelxpdlapptaappuser USING btree (toolagentoid);


--
-- TOC entry 4108 (class 1259 OID 21025)
-- Name: shkpacklevelxpdlapptaappuser_xpdl_appoid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkpacklevelxpdlapptaappuser_xpdl_appoid_idx ON shkpacklevelxpdlapptaappuser USING btree (xpdl_appoid);


--
-- TOC entry 4113 (class 1259 OID 21026)
-- Name: shkpacklevelxpdlapptoolagntapp_toolagentoid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkpacklevelxpdlapptoolagntapp_toolagentoid_idx ON shkpacklevelxpdlapptoolagntapp USING btree (toolagentoid);


--
-- TOC entry 4114 (class 1259 OID 21027)
-- Name: shkpacklevelxpdlapptoolagntapp_xpdl_appoid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkpacklevelxpdlapptoolagntapp_xpdl_appoid_idx ON shkpacklevelxpdlapptoolagntapp USING btree (xpdl_appoid);


--
-- TOC entry 4121 (class 1259 OID 21028)
-- Name: shkprocessdata_process_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkprocessdata_process_idx ON shkprocessdata USING btree (process);


--
-- TOC entry 4126 (class 1259 OID 21029)
-- Name: shkprocessdatablobs_processdatawob_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkprocessdatablobs_processdatawob_idx ON shkprocessdatablobs USING btree (processdatawob);


--
-- TOC entry 4133 (class 1259 OID 21030)
-- Name: shkprocessdatawob_process_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkprocessdatawob_process_idx ON shkprocessdatawob USING btree (process);


--
-- TOC entry 4144 (class 1259 OID 21031)
-- Name: shkprocesses_processdefinition_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkprocesses_processdefinition_idx ON shkprocesses USING btree (processdefinition);


--
-- TOC entry 4145 (class 1259 OID 21032)
-- Name: shkprocesses_state_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkprocesses_state_idx ON shkprocesses USING btree (state);


--
-- TOC entry 4146 (class 1259 OID 21033)
-- Name: shkprocessrequesters_activityrequester_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkprocessrequesters_activityrequester_idx ON shkprocessrequesters USING btree (activityrequester);


--
-- TOC entry 4151 (class 1259 OID 21034)
-- Name: shkprocessrequesters_resourcerequester_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkprocessrequesters_resourcerequester_idx ON shkprocessrequesters USING btree (resourcerequester);


--
-- TOC entry 4168 (class 1259 OID 21035)
-- Name: shkproclevelparticipant_processoid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkproclevelparticipant_processoid_idx ON shkproclevelparticipant USING btree (processoid);


--
-- TOC entry 4173 (class 1259 OID 21036)
-- Name: shkproclevelxpdlapp_processoid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkproclevelxpdlapp_processoid_idx ON shkproclevelxpdlapp USING btree (processoid);


--
-- TOC entry 4176 (class 1259 OID 21037)
-- Name: shkproclevelxpdlapptaappdetail_toolagentoid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkproclevelxpdlapptaappdetail_toolagentoid_idx ON shkproclevelxpdlapptaappdetail USING btree (toolagentoid);


--
-- TOC entry 4177 (class 1259 OID 21038)
-- Name: shkproclevelxpdlapptaappdetail_xpdl_appoid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkproclevelxpdlapptaappdetail_xpdl_appoid_idx ON shkproclevelxpdlapptaappdetail USING btree (xpdl_appoid);


--
-- TOC entry 4182 (class 1259 OID 21039)
-- Name: shkproclevelxpdlapptaappdetusr_toolagentoid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkproclevelxpdlapptaappdetusr_toolagentoid_idx ON shkproclevelxpdlapptaappdetusr USING btree (toolagentoid);


--
-- TOC entry 4183 (class 1259 OID 21040)
-- Name: shkproclevelxpdlapptaappdetusr_xpdl_appoid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkproclevelxpdlapptaappdetusr_xpdl_appoid_idx ON shkproclevelxpdlapptaappdetusr USING btree (xpdl_appoid);


--
-- TOC entry 4188 (class 1259 OID 21041)
-- Name: shkproclevelxpdlapptaappuser_toolagentoid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkproclevelxpdlapptaappuser_toolagentoid_idx ON shkproclevelxpdlapptaappuser USING btree (toolagentoid);


--
-- TOC entry 4189 (class 1259 OID 21042)
-- Name: shkproclevelxpdlapptaappuser_xpdl_appoid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkproclevelxpdlapptaappuser_xpdl_appoid_idx ON shkproclevelxpdlapptaappuser USING btree (xpdl_appoid);


--
-- TOC entry 4194 (class 1259 OID 21043)
-- Name: shkproclevelxpdlapptoolagntapp_toolagentoid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkproclevelxpdlapptoolagntapp_toolagentoid_idx ON shkproclevelxpdlapptoolagntapp USING btree (toolagentoid);


--
-- TOC entry 4195 (class 1259 OID 21044)
-- Name: shkproclevelxpdlapptoolagntapp_xpdl_appoid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkproclevelxpdlapptoolagntapp_xpdl_appoid_idx ON shkproclevelxpdlapptoolagntapp USING btree (xpdl_appoid);


--
-- TOC entry 4204 (class 1259 OID 21045)
-- Name: shkstateeventaudits_newactivitystate_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkstateeventaudits_newactivitystate_idx ON shkstateeventaudits USING btree (newactivitystate);


--
-- TOC entry 4205 (class 1259 OID 21046)
-- Name: shkstateeventaudits_newprocessstate_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkstateeventaudits_newprocessstate_idx ON shkstateeventaudits USING btree (newprocessstate);


--
-- TOC entry 4206 (class 1259 OID 21047)
-- Name: shkstateeventaudits_oldactivitystate_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkstateeventaudits_oldactivitystate_idx ON shkstateeventaudits USING btree (oldactivitystate);


--
-- TOC entry 4207 (class 1259 OID 21048)
-- Name: shkstateeventaudits_oldprocessstate_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkstateeventaudits_oldprocessstate_idx ON shkstateeventaudits USING btree (oldprocessstate);


--
-- TOC entry 4210 (class 1259 OID 21049)
-- Name: shkstateeventaudits_thetype_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkstateeventaudits_thetype_idx ON shkstateeventaudits USING btree (thetype);


--
-- TOC entry 4219 (class 1259 OID 21050)
-- Name: shktoolagentappdetail_toolagent_appoid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shktoolagentappdetail_toolagent_appoid_idx ON shktoolagentappdetail USING btree (toolagent_appoid);


--
-- TOC entry 4222 (class 1259 OID 21051)
-- Name: shktoolagentappdetailuser_toolagent_appoid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shktoolagentappdetailuser_toolagent_appoid_idx ON shktoolagentappdetailuser USING btree (toolagent_appoid);


--
-- TOC entry 4225 (class 1259 OID 21052)
-- Name: shktoolagentappdetailuser_useroid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shktoolagentappdetailuser_useroid_idx ON shktoolagentappdetailuser USING btree (useroid);


--
-- TOC entry 4228 (class 1259 OID 21053)
-- Name: shktoolagentappuser_toolagent_appoid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shktoolagentappuser_toolagent_appoid_idx ON shktoolagentappuser USING btree (toolagent_appoid);


--
-- TOC entry 4231 (class 1259 OID 21054)
-- Name: shktoolagentappuser_useroid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shktoolagentappuser_useroid_idx ON shktoolagentappuser USING btree (useroid);


--
-- TOC entry 4236 (class 1259 OID 21055)
-- Name: shkusergrouptable_groupid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkusergrouptable_groupid_idx ON shkusergrouptable USING btree (groupid);


--
-- TOC entry 4241 (class 1259 OID 21056)
-- Name: shkusergrouptable_userid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkusergrouptable_userid_idx ON shkusergrouptable USING btree (userid);


--
-- TOC entry 4242 (class 1259 OID 21057)
-- Name: shkuserpacklevelpart_participantoid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkuserpacklevelpart_participantoid_idx ON shkuserpacklevelpart USING btree (participantoid);


--
-- TOC entry 4247 (class 1259 OID 21058)
-- Name: shkuserpacklevelpart_useroid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkuserpacklevelpart_useroid_idx ON shkuserpacklevelpart USING btree (useroid);


--
-- TOC entry 4248 (class 1259 OID 21059)
-- Name: shkuserproclevelparticipant_participantoid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkuserproclevelparticipant_participantoid_idx ON shkuserproclevelparticipant USING btree (participantoid);


--
-- TOC entry 4253 (class 1259 OID 21060)
-- Name: shkuserproclevelparticipant_useroid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkuserproclevelparticipant_useroid_idx ON shkuserproclevelparticipant USING btree (useroid);


--
-- TOC entry 4262 (class 1259 OID 21061)
-- Name: shkxpdlapplicationprocess_packageoid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkxpdlapplicationprocess_packageoid_idx ON shkxpdlapplicationprocess USING btree (packageoid);


--
-- TOC entry 4271 (class 1259 OID 21062)
-- Name: shkxpdldata_xpdl_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkxpdldata_xpdl_idx ON shkxpdldata USING btree (xpdl);


--
-- TOC entry 4282 (class 1259 OID 21063)
-- Name: shkxpdlhistorydata_xpdlhistory_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkxpdlhistorydata_xpdlhistory_idx ON shkxpdlhistorydata USING btree (xpdlhistory);


--
-- TOC entry 4287 (class 1259 OID 21064)
-- Name: shkxpdlparticipantprocess_packageoid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkxpdlparticipantprocess_packageoid_idx ON shkxpdlparticipantprocess USING btree (packageoid);


--
-- TOC entry 4296 (class 1259 OID 21065)
-- Name: shkxpdlreferences_referringxpdl_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shkxpdlreferences_referringxpdl_idx ON shkxpdlreferences USING btree (referringxpdl);


--
-- TOC entry 4305 (class 1259 OID 21066)
-- Name: wf_report_activitydefid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wf_report_activitydefid_idx ON wf_report USING btree (activitydefid);


--
-- TOC entry 4306 (class 1259 OID 21067)
-- Name: wf_report_packageid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wf_report_packageid_idx ON wf_report USING btree (packageid);


--
-- TOC entry 4309 (class 1259 OID 21068)
-- Name: wf_report_processdefid_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wf_report_processdefid_idx ON wf_report USING btree (processdefid);


--
-- TOC entry 4392 (class 2606 OID 21069)
-- Name: dir_user_group fk2f0367fd159b6639; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dir_user_group
    ADD CONSTRAINT fk2f0367fd159b6639 FOREIGN KEY (groupid) REFERENCES dir_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4393 (class 2606 OID 21074)
-- Name: dir_user_group fk2f0367fdce539211; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dir_user_group
    ADD CONSTRAINT fk2f0367fdce539211 FOREIGN KEY (userid) REFERENCES dir_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4377 (class 2606 OID 21079)
-- Name: app_report_process_instance fk351d7bf2918f93d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_report_process_instance
    ADD CONSTRAINT fk351d7bf2918f93d FOREIGN KEY (processuid) REFERENCES app_report_process(uuid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4365 (class 2606 OID 21084)
-- Name: app_form fk45957822462ef4c7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_form
    ADD CONSTRAINT fk45957822462ef4c7 FOREIGN KEY (appid, appversion) REFERENCES app_app(appid, appversion) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4387 (class 2606 OID 21089)
-- Name: dir_employment_report_to fk536229452787e613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dir_employment_report_to
    ADD CONSTRAINT fk536229452787e613 FOREIGN KEY (employmentid) REFERENCES dir_employment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4388 (class 2606 OID 21094)
-- Name: dir_employment_report_to fk53622945f4068416; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dir_employment_report_to
    ADD CONSTRAINT fk53622945f4068416 FOREIGN KEY (reporttoid) REFERENCES dir_employment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4391 (class 2606 OID 21099)
-- Name: dir_organization fk55a15fa5961bd498; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dir_organization
    ADD CONSTRAINT fk55a15fa5961bd498 FOREIGN KEY (parentid) REFERENCES dir_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4394 (class 2606 OID 21104)
-- Name: dir_user_role fk5c5fe738c8fe3ca7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dir_user_role
    ADD CONSTRAINT fk5c5fe738c8fe3ca7 FOREIGN KEY (roleid) REFERENCES dir_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4395 (class 2606 OID 21109)
-- Name: dir_user_role fk5c5fe738ce539211; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dir_user_role
    ADD CONSTRAINT fk5c5fe738ce539211 FOREIGN KEY (userid) REFERENCES dir_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4372 (class 2606 OID 21114)
-- Name: app_report_activity fk5e33d79c918f93d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_report_activity
    ADD CONSTRAINT fk5e33d79c918f93d FOREIGN KEY (processuid) REFERENCES app_report_process(uuid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4363 (class 2606 OID 21119)
-- Name: app_datalist fk5e9247a6462ef4c7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_datalist
    ADD CONSTRAINT fk5e9247a6462ef4c7 FOREIGN KEY (appid, appversion) REFERENCES app_app(appid, appversion) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4370 (class 2606 OID 21124)
-- Name: app_package_participant fk6d7bf59c5f255bcc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_package_participant
    ADD CONSTRAINT fk6d7bf59c5f255bcc FOREIGN KEY (packageid, packageversion) REFERENCES app_package(packageid, packageversion) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4364 (class 2606 OID 21129)
-- Name: app_env_variable fk740a62ec462ef4c7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_env_variable
    ADD CONSTRAINT fk740a62ec462ef4c7 FOREIGN KEY (appid, appversion) REFERENCES app_app(appid, appversion) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4371 (class 2606 OID 21134)
-- Name: app_plugin_default fk7a835713462ef4c7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_plugin_default
    ADD CONSTRAINT fk7a835713462ef4c7 FOREIGN KEY (appid, appversion) REFERENCES app_app(appid, appversion) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4367 (class 2606 OID 21139)
-- Name: app_package fk852ea428462ef4c7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_package
    ADD CONSTRAINT fk852ea428462ef4c7 FOREIGN KEY (appid, appversion) REFERENCES app_app(appid, appversion) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4373 (class 2606 OID 21144)
-- Name: app_report_activity_instance fk9c6abdd8b06e2043; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_report_activity_instance
    ADD CONSTRAINT fk9c6abdd8b06e2043 FOREIGN KEY (activityuid) REFERENCES app_report_activity(uuid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4374 (class 2606 OID 21149)
-- Name: app_report_activity_instance fk9c6abdd8d4610a90; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_report_activity_instance
    ADD CONSTRAINT fk9c6abdd8d4610a90 FOREIGN KEY (processinstanceid) REFERENCES app_report_process_instance(instanceid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4410 (class 2606 OID 21154)
-- Name: shkdeadlines fk_6vyqeugwr76mqc6o26ednljwq; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkdeadlines
    ADD CONSTRAINT fk_6vyqeugwr76mqc6o26ednljwq FOREIGN KEY (activity) REFERENCES shkactivities(oid);


--
-- TOC entry 4362 (class 2606 OID 21159)
-- Name: app_builder fk_idup4nrrc79iy4kc46wf5919j; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_builder
    ADD CONSTRAINT fk_idup4nrrc79iy4kc46wf5919j FOREIGN KEY (appid, appversion) REFERENCES app_app(appid, appversion);


--
-- TOC entry 4378 (class 2606 OID 21164)
-- Name: app_resource fk_nnvkg0h6yy8o3f4yjhd20ury0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_resource
    ADD CONSTRAINT fk_nnvkg0h6yy8o3f4yjhd20ury0 FOREIGN KEY (appid, appversion) REFERENCES app_app(appid, appversion);


--
-- TOC entry 4368 (class 2606 OID 21169)
-- Name: app_package_activity_form fka8d741d5f255bcc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_package_activity_form
    ADD CONSTRAINT fka8d741d5f255bcc FOREIGN KEY (packageid, packageversion) REFERENCES app_package(packageid, packageversion) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4369 (class 2606 OID 21174)
-- Name: app_package_activity_plugin fkade8644c5f255bcc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_package_activity_plugin
    ADD CONSTRAINT fkade8644c5f255bcc FOREIGN KEY (packageid, packageversion) REFERENCES app_package(packageid, packageversion) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4473 (class 2606 OID 21179)
-- Name: wf_report fkb943cca47a4e8f48; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wf_report
    ADD CONSTRAINT fkb943cca47a4e8f48 FOREIGN KEY (packageid) REFERENCES wf_report_package(packageid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4474 (class 2606 OID 21184)
-- Name: wf_report fkb943cca4a39d6461; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wf_report
    ADD CONSTRAINT fkb943cca4a39d6461 FOREIGN KEY (processdefid) REFERENCES wf_report_process(processdefid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4475 (class 2606 OID 21189)
-- Name: wf_report fkb943cca4cb863f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wf_report
    ADD CONSTRAINT fkb943cca4cb863f FOREIGN KEY (activitydefid) REFERENCES wf_report_activity(activitydefid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4389 (class 2606 OID 21194)
-- Name: dir_grade fkbc9a49a518cebae1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dir_grade
    ADD CONSTRAINT fkbc9a49a518cebae1 FOREIGN KEY (organizationid) REFERENCES dir_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4390 (class 2606 OID 21199)
-- Name: dir_group fkbc9a804d18cebae1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dir_group
    ADD CONSTRAINT fkbc9a804d18cebae1 FOREIGN KEY (organizationid) REFERENCES dir_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4375 (class 2606 OID 21204)
-- Name: app_report_package fkbd580a19e475abc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_report_package
    ADD CONSTRAINT fkbd580a19e475abc FOREIGN KEY (appuid) REFERENCES app_report_app(uuid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4383 (class 2606 OID 21209)
-- Name: dir_employment fkc6620ade14ce02e9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dir_employment
    ADD CONSTRAINT fkc6620ade14ce02e9 FOREIGN KEY (gradeid) REFERENCES dir_grade(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4384 (class 2606 OID 21214)
-- Name: dir_employment fkc6620ade18cebae1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dir_employment
    ADD CONSTRAINT fkc6620ade18cebae1 FOREIGN KEY (organizationid) REFERENCES dir_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4385 (class 2606 OID 21219)
-- Name: dir_employment fkc6620ade716ae35f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dir_employment
    ADD CONSTRAINT fkc6620ade716ae35f FOREIGN KEY (departmentid) REFERENCES dir_department(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4386 (class 2606 OID 21224)
-- Name: dir_employment fkc6620adece539211; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dir_employment
    ADD CONSTRAINT fkc6620adece539211 FOREIGN KEY (userid) REFERENCES dir_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4376 (class 2606 OID 21229)
-- Name: app_report_process fkdafff442d40695dd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_report_process
    ADD CONSTRAINT fkdafff442d40695dd FOREIGN KEY (packageuid) REFERENCES app_report_package(uuid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4379 (class 2606 OID 21234)
-- Name: app_userview fke411d54e462ef4c7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_userview
    ADD CONSTRAINT fke411d54e462ef4c7 FOREIGN KEY (appid, appversion) REFERENCES app_app(appid, appversion) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4366 (class 2606 OID 21239)
-- Name: app_message fkee346fe9462ef4c7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_message
    ADD CONSTRAINT fkee346fe9462ef4c7 FOREIGN KEY (appid, appversion) REFERENCES app_app(appid, appversion) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4380 (class 2606 OID 21244)
-- Name: dir_department fkeee8aa4418cebae1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dir_department
    ADD CONSTRAINT fkeee8aa4418cebae1 FOREIGN KEY (organizationid) REFERENCES dir_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4381 (class 2606 OID 21249)
-- Name: dir_department fkeee8aa4480db1449; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dir_department
    ADD CONSTRAINT fkeee8aa4480db1449 FOREIGN KEY (hod) REFERENCES dir_employment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4382 (class 2606 OID 21254)
-- Name: dir_department fkeee8aa44ef6bb2b7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dir_department
    ADD CONSTRAINT fkeee8aa44ef6bb2b7 FOREIGN KEY (parentid) REFERENCES dir_department(id) DEFERRABLE INITIALLY DEFERRED;
	
--
-- TOC entry 4396 (class 2606 OID 21259)
-- Name: shkactivities shkactivities_process; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkactivities
    ADD CONSTRAINT shkactivities_process FOREIGN KEY (process) REFERENCES shkprocesses(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4397 (class 2606 OID 21264)
-- Name: shkactivities shkactivities_state; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkactivities
    ADD CONSTRAINT shkactivities_state FOREIGN KEY (state) REFERENCES shkactivitystates(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4398 (class 2606 OID 21269)
-- Name: shkactivities shkactivities_theresource; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkactivities
    ADD CONSTRAINT shkactivities_theresource FOREIGN KEY (theresource) REFERENCES shkresourcestable(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4399 (class 2606 OID 21274)
-- Name: shkactivitydata shkactivitydata_activity; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkactivitydata
    ADD CONSTRAINT shkactivitydata_activity FOREIGN KEY (activity) REFERENCES shkactivities(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4400 (class 2606 OID 21279)
-- Name: shkactivitydatablobs shkactivitydatablobs_activitydatawob; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkactivitydatablobs
    ADD CONSTRAINT shkactivitydatablobs_activitydatawob FOREIGN KEY (activitydatawob) REFERENCES shkactivitydatawob(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4401 (class 2606 OID 21284)
-- Name: shkactivitydatawob shkactivitydatawob_activity; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkactivitydatawob
    ADD CONSTRAINT shkactivitydatawob_activity FOREIGN KEY (activity) REFERENCES shkactivities(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4402 (class 2606 OID 21289)
-- Name: shkandjointable shkandjointable_activity; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkandjointable
    ADD CONSTRAINT shkandjointable_activity FOREIGN KEY (activity) REFERENCES shkactivities(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4403 (class 2606 OID 21294)
-- Name: shkandjointable shkandjointable_blockactivity; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkandjointable
    ADD CONSTRAINT shkandjointable_blockactivity FOREIGN KEY (blockactivity) REFERENCES shkactivities(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4404 (class 2606 OID 21299)
-- Name: shkandjointable shkandjointable_process; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkandjointable
    ADD CONSTRAINT shkandjointable_process FOREIGN KEY (process) REFERENCES shkprocesses(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4405 (class 2606 OID 21304)
-- Name: shkassignmenteventaudits shkassignmenteventaudits_thetype; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkassignmenteventaudits
    ADD CONSTRAINT shkassignmenteventaudits_thetype FOREIGN KEY (thetype) REFERENCES shkeventtypes(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4406 (class 2606 OID 21309)
-- Name: shkassignmentstable shkassignmentstable_activity; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkassignmentstable
    ADD CONSTRAINT shkassignmentstable_activity FOREIGN KEY (activity) REFERENCES shkactivities(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4407 (class 2606 OID 21314)
-- Name: shkassignmentstable shkassignmentstable_theresource; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkassignmentstable
    ADD CONSTRAINT shkassignmentstable_theresource FOREIGN KEY (theresource) REFERENCES shkresourcestable(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4408 (class 2606 OID 21319)
-- Name: shkcreateprocesseventaudits shkcreateprocesseventaudits_thetype; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkcreateprocesseventaudits
    ADD CONSTRAINT shkcreateprocesseventaudits_thetype FOREIGN KEY (thetype) REFERENCES shkeventtypes(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4409 (class 2606 OID 21324)
-- Name: shkdataeventaudits shkdataeventaudits_thetype; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkdataeventaudits
    ADD CONSTRAINT shkdataeventaudits_thetype FOREIGN KEY (thetype) REFERENCES shkeventtypes(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4411 (class 2606 OID 21329)
-- Name: shkdeadlines shkdeadlines_activity; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkdeadlines
    ADD CONSTRAINT shkdeadlines_activity FOREIGN KEY (activity) REFERENCES shkactivities(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4412 (class 2606 OID 21334)
-- Name: shkdeadlines shkdeadlines_process; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkdeadlines
    ADD CONSTRAINT shkdeadlines_process FOREIGN KEY (process) REFERENCES shkprocesses(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4413 (class 2606 OID 21339)
-- Name: shkgroupgrouptable shkgroupgrouptable_groupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkgroupgrouptable
    ADD CONSTRAINT shkgroupgrouptable_groupid FOREIGN KEY (groupid) REFERENCES shkgrouptable(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4414 (class 2606 OID 21344)
-- Name: shkgroupgrouptable shkgroupgrouptable_sub_gid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkgroupgrouptable
    ADD CONSTRAINT shkgroupgrouptable_sub_gid FOREIGN KEY (sub_gid) REFERENCES shkgrouptable(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4415 (class 2606 OID 21349)
-- Name: shkgroupuserpacklevelpart shkgroupuserpacklevelpart_participantoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkgroupuserpacklevelpart
    ADD CONSTRAINT shkgroupuserpacklevelpart_participantoid FOREIGN KEY (participantoid) REFERENCES shkpacklevelparticipant(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4416 (class 2606 OID 21354)
-- Name: shkgroupuserpacklevelpart shkgroupuserpacklevelpart_useroid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkgroupuserpacklevelpart
    ADD CONSTRAINT shkgroupuserpacklevelpart_useroid FOREIGN KEY (useroid) REFERENCES shkgroupuser(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4417 (class 2606 OID 21359)
-- Name: shkgroupuserproclevelpart shkgroupuserproclevelpart_participantoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkgroupuserproclevelpart
    ADD CONSTRAINT shkgroupuserproclevelpart_participantoid FOREIGN KEY (participantoid) REFERENCES shkproclevelparticipant(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4418 (class 2606 OID 21364)
-- Name: shkgroupuserproclevelpart shkgroupuserproclevelpart_useroid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkgroupuserproclevelpart
    ADD CONSTRAINT shkgroupuserproclevelpart_useroid FOREIGN KEY (useroid) REFERENCES shkgroupuser(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4419 (class 2606 OID 21369)
-- Name: shkneweventauditdata shkneweventauditdata_dataeventaudit; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkneweventauditdata
    ADD CONSTRAINT shkneweventauditdata_dataeventaudit FOREIGN KEY (dataeventaudit) REFERENCES shkdataeventaudits(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4420 (class 2606 OID 21374)
-- Name: shkneweventauditdatablobs shkneweventauditdatablobs_neweventauditdatawob; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkneweventauditdatablobs
    ADD CONSTRAINT shkneweventauditdatablobs_neweventauditdatawob FOREIGN KEY (neweventauditdatawob) REFERENCES shkneweventauditdatawob(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4421 (class 2606 OID 21379)
-- Name: shkneweventauditdatawob shkneweventauditdatawob_dataeventaudit; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkneweventauditdatawob
    ADD CONSTRAINT shkneweventauditdatawob_dataeventaudit FOREIGN KEY (dataeventaudit) REFERENCES shkdataeventaudits(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4422 (class 2606 OID 21384)
-- Name: shkoldeventauditdata shkoldeventauditdata_dataeventaudit; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkoldeventauditdata
    ADD CONSTRAINT shkoldeventauditdata_dataeventaudit FOREIGN KEY (dataeventaudit) REFERENCES shkdataeventaudits(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4423 (class 2606 OID 21389)
-- Name: shkoldeventauditdatablobs shkoldeventauditdatablobs_oldeventauditdatawob; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkoldeventauditdatablobs
    ADD CONSTRAINT shkoldeventauditdatablobs_oldeventauditdatawob FOREIGN KEY (oldeventauditdatawob) REFERENCES shkoldeventauditdatawob(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4424 (class 2606 OID 21394)
-- Name: shkoldeventauditdatawob shkoldeventauditdatawob_dataeventaudit; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkoldeventauditdatawob
    ADD CONSTRAINT shkoldeventauditdatawob_dataeventaudit FOREIGN KEY (dataeventaudit) REFERENCES shkdataeventaudits(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4425 (class 2606 OID 21399)
-- Name: shkpacklevelparticipant shkpacklevelparticipant_packageoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkpacklevelparticipant
    ADD CONSTRAINT shkpacklevelparticipant_packageoid FOREIGN KEY (packageoid) REFERENCES shkxpdlparticipantpackage(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4426 (class 2606 OID 21404)
-- Name: shkpacklevelxpdlapp shkpacklevelxpdlapp_packageoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkpacklevelxpdlapp
    ADD CONSTRAINT shkpacklevelxpdlapp_packageoid FOREIGN KEY (packageoid) REFERENCES shkxpdlapplicationpackage(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4427 (class 2606 OID 21409)
-- Name: shkpacklevelxpdlapptaappdetail shkpacklevelxpdlapptaappdetail_toolagentoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkpacklevelxpdlapptaappdetail
    ADD CONSTRAINT shkpacklevelxpdlapptaappdetail_toolagentoid FOREIGN KEY (toolagentoid) REFERENCES shktoolagentappdetail(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4428 (class 2606 OID 21414)
-- Name: shkpacklevelxpdlapptaappdetail shkpacklevelxpdlapptaappdetail_xpdl_appoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkpacklevelxpdlapptaappdetail
    ADD CONSTRAINT shkpacklevelxpdlapptaappdetail_xpdl_appoid FOREIGN KEY (xpdl_appoid) REFERENCES shkpacklevelxpdlapp(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4429 (class 2606 OID 21419)
-- Name: shkpacklevelxpdlapptaappdetusr shkpacklevelxpdlapptaappdetusr_toolagentoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkpacklevelxpdlapptaappdetusr
    ADD CONSTRAINT shkpacklevelxpdlapptaappdetusr_toolagentoid FOREIGN KEY (toolagentoid) REFERENCES shktoolagentappdetailuser(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4430 (class 2606 OID 21424)
-- Name: shkpacklevelxpdlapptaappdetusr shkpacklevelxpdlapptaappdetusr_xpdl_appoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkpacklevelxpdlapptaappdetusr
    ADD CONSTRAINT shkpacklevelxpdlapptaappdetusr_xpdl_appoid FOREIGN KEY (xpdl_appoid) REFERENCES shkpacklevelxpdlapp(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4431 (class 2606 OID 21429)
-- Name: shkpacklevelxpdlapptaappuser shkpacklevelxpdlapptaappuser_toolagentoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkpacklevelxpdlapptaappuser
    ADD CONSTRAINT shkpacklevelxpdlapptaappuser_toolagentoid FOREIGN KEY (toolagentoid) REFERENCES shktoolagentappuser(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4432 (class 2606 OID 21434)
-- Name: shkpacklevelxpdlapptaappuser shkpacklevelxpdlapptaappuser_xpdl_appoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkpacklevelxpdlapptaappuser
    ADD CONSTRAINT shkpacklevelxpdlapptaappuser_xpdl_appoid FOREIGN KEY (xpdl_appoid) REFERENCES shkpacklevelxpdlapp(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4433 (class 2606 OID 21439)
-- Name: shkpacklevelxpdlapptoolagntapp shkpacklevelxpdlapptoolagntapp_toolagentoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkpacklevelxpdlapptoolagntapp
    ADD CONSTRAINT shkpacklevelxpdlapptoolagntapp_toolagentoid FOREIGN KEY (toolagentoid) REFERENCES shktoolagentapp(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4434 (class 2606 OID 21444)
-- Name: shkpacklevelxpdlapptoolagntapp shkpacklevelxpdlapptoolagntapp_xpdl_appoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkpacklevelxpdlapptoolagntapp
    ADD CONSTRAINT shkpacklevelxpdlapptoolagntapp_xpdl_appoid FOREIGN KEY (xpdl_appoid) REFERENCES shkpacklevelxpdlapp(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4435 (class 2606 OID 21449)
-- Name: shkprocessdata shkprocessdata_process; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkprocessdata
    ADD CONSTRAINT shkprocessdata_process FOREIGN KEY (process) REFERENCES shkprocesses(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4436 (class 2606 OID 21454)
-- Name: shkprocessdatablobs shkprocessdatablobs_processdatawob; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkprocessdatablobs
    ADD CONSTRAINT shkprocessdatablobs_processdatawob FOREIGN KEY (processdatawob) REFERENCES shkprocessdatawob(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4437 (class 2606 OID 21459)
-- Name: shkprocessdatawob shkprocessdatawob_process; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkprocessdatawob
    ADD CONSTRAINT shkprocessdatawob_process FOREIGN KEY (process) REFERENCES shkprocesses(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4438 (class 2606 OID 21464)
-- Name: shkprocesses shkprocesses_processdefinition; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkprocesses
    ADD CONSTRAINT shkprocesses_processdefinition FOREIGN KEY (processdefinition) REFERENCES shkprocessdefinitions(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4439 (class 2606 OID 21469)
-- Name: shkprocesses shkprocesses_state; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkprocesses
    ADD CONSTRAINT shkprocesses_state FOREIGN KEY (state) REFERENCES shkprocessstates(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4440 (class 2606 OID 21474)
-- Name: shkprocessrequesters shkprocessrequesters_activityrequester; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkprocessrequesters
    ADD CONSTRAINT shkprocessrequesters_activityrequester FOREIGN KEY (activityrequester) REFERENCES shkactivities(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4441 (class 2606 OID 21479)
-- Name: shkprocessrequesters shkprocessrequesters_resourcerequester; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkprocessrequesters
    ADD CONSTRAINT shkprocessrequesters_resourcerequester FOREIGN KEY (resourcerequester) REFERENCES shkresourcestable(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4442 (class 2606 OID 21484)
-- Name: shkproclevelparticipant shkproclevelparticipant_processoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkproclevelparticipant
    ADD CONSTRAINT shkproclevelparticipant_processoid FOREIGN KEY (processoid) REFERENCES shkxpdlparticipantprocess(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4443 (class 2606 OID 21489)
-- Name: shkproclevelxpdlapp shkproclevelxpdlapp_processoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkproclevelxpdlapp
    ADD CONSTRAINT shkproclevelxpdlapp_processoid FOREIGN KEY (processoid) REFERENCES shkxpdlapplicationprocess(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4444 (class 2606 OID 21494)
-- Name: shkproclevelxpdlapptaappdetail shkproclevelxpdlapptaappdetail_toolagentoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkproclevelxpdlapptaappdetail
    ADD CONSTRAINT shkproclevelxpdlapptaappdetail_toolagentoid FOREIGN KEY (toolagentoid) REFERENCES shktoolagentappdetail(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4445 (class 2606 OID 21499)
-- Name: shkproclevelxpdlapptaappdetail shkproclevelxpdlapptaappdetail_xpdl_appoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkproclevelxpdlapptaappdetail
    ADD CONSTRAINT shkproclevelxpdlapptaappdetail_xpdl_appoid FOREIGN KEY (xpdl_appoid) REFERENCES shkproclevelxpdlapp(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4446 (class 2606 OID 21504)
-- Name: shkproclevelxpdlapptaappdetusr shkproclevelxpdlapptaappdetusr_toolagentoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkproclevelxpdlapptaappdetusr
    ADD CONSTRAINT shkproclevelxpdlapptaappdetusr_toolagentoid FOREIGN KEY (toolagentoid) REFERENCES shktoolagentappdetailuser(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4447 (class 2606 OID 21509)
-- Name: shkproclevelxpdlapptaappdetusr shkproclevelxpdlapptaappdetusr_xpdl_appoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkproclevelxpdlapptaappdetusr
    ADD CONSTRAINT shkproclevelxpdlapptaappdetusr_xpdl_appoid FOREIGN KEY (xpdl_appoid) REFERENCES shkproclevelxpdlapp(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4448 (class 2606 OID 21514)
-- Name: shkproclevelxpdlapptaappuser shkproclevelxpdlapptaappuser_toolagentoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkproclevelxpdlapptaappuser
    ADD CONSTRAINT shkproclevelxpdlapptaappuser_toolagentoid FOREIGN KEY (toolagentoid) REFERENCES shktoolagentappuser(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4449 (class 2606 OID 21519)
-- Name: shkproclevelxpdlapptaappuser shkproclevelxpdlapptaappuser_xpdl_appoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkproclevelxpdlapptaappuser
    ADD CONSTRAINT shkproclevelxpdlapptaappuser_xpdl_appoid FOREIGN KEY (xpdl_appoid) REFERENCES shkproclevelxpdlapp(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4450 (class 2606 OID 21524)
-- Name: shkproclevelxpdlapptoolagntapp shkproclevelxpdlapptoolagntapp_toolagentoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkproclevelxpdlapptoolagntapp
    ADD CONSTRAINT shkproclevelxpdlapptoolagntapp_toolagentoid FOREIGN KEY (toolagentoid) REFERENCES shktoolagentapp(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4451 (class 2606 OID 21529)
-- Name: shkproclevelxpdlapptoolagntapp shkproclevelxpdlapptoolagntapp_xpdl_appoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkproclevelxpdlapptoolagntapp
    ADD CONSTRAINT shkproclevelxpdlapptoolagntapp_xpdl_appoid FOREIGN KEY (xpdl_appoid) REFERENCES shkproclevelxpdlapp(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4452 (class 2606 OID 21534)
-- Name: shkstateeventaudits shkstateeventaudits_newactivitystate; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkstateeventaudits
    ADD CONSTRAINT shkstateeventaudits_newactivitystate FOREIGN KEY (newactivitystate) REFERENCES shkactivitystateeventaudits(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4453 (class 2606 OID 21539)
-- Name: shkstateeventaudits shkstateeventaudits_newprocessstate; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkstateeventaudits
    ADD CONSTRAINT shkstateeventaudits_newprocessstate FOREIGN KEY (newprocessstate) REFERENCES shkprocessstateeventaudits(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4454 (class 2606 OID 21544)
-- Name: shkstateeventaudits shkstateeventaudits_oldactivitystate; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkstateeventaudits
    ADD CONSTRAINT shkstateeventaudits_oldactivitystate FOREIGN KEY (oldactivitystate) REFERENCES shkactivitystateeventaudits(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4455 (class 2606 OID 21549)
-- Name: shkstateeventaudits shkstateeventaudits_oldprocessstate; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkstateeventaudits
    ADD CONSTRAINT shkstateeventaudits_oldprocessstate FOREIGN KEY (oldprocessstate) REFERENCES shkprocessstateeventaudits(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4456 (class 2606 OID 21554)
-- Name: shkstateeventaudits shkstateeventaudits_thetype; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkstateeventaudits
    ADD CONSTRAINT shkstateeventaudits_thetype FOREIGN KEY (thetype) REFERENCES shkeventtypes(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4457 (class 2606 OID 21559)
-- Name: shktoolagentappdetail shktoolagentappdetail_toolagent_appoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shktoolagentappdetail
    ADD CONSTRAINT shktoolagentappdetail_toolagent_appoid FOREIGN KEY (toolagent_appoid) REFERENCES shktoolagentapp(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4458 (class 2606 OID 21564)
-- Name: shktoolagentappdetailuser shktoolagentappdetailuser_toolagent_appoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shktoolagentappdetailuser
    ADD CONSTRAINT shktoolagentappdetailuser_toolagent_appoid FOREIGN KEY (toolagent_appoid) REFERENCES shktoolagentappdetail(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4459 (class 2606 OID 21569)
-- Name: shktoolagentappdetailuser shktoolagentappdetailuser_useroid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shktoolagentappdetailuser
    ADD CONSTRAINT shktoolagentappdetailuser_useroid FOREIGN KEY (useroid) REFERENCES shktoolagentuser(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4460 (class 2606 OID 21574)
-- Name: shktoolagentappuser shktoolagentappuser_toolagent_appoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shktoolagentappuser
    ADD CONSTRAINT shktoolagentappuser_toolagent_appoid FOREIGN KEY (toolagent_appoid) REFERENCES shktoolagentapp(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4461 (class 2606 OID 21579)
-- Name: shktoolagentappuser shktoolagentappuser_useroid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shktoolagentappuser
    ADD CONSTRAINT shktoolagentappuser_useroid FOREIGN KEY (useroid) REFERENCES shktoolagentuser(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4462 (class 2606 OID 21584)
-- Name: shkusergrouptable shkusergrouptable_groupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkusergrouptable
    ADD CONSTRAINT shkusergrouptable_groupid FOREIGN KEY (groupid) REFERENCES shkgrouptable(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4463 (class 2606 OID 21589)
-- Name: shkusergrouptable shkusergrouptable_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkusergrouptable
    ADD CONSTRAINT shkusergrouptable_userid FOREIGN KEY (userid) REFERENCES shkusertable(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4464 (class 2606 OID 21594)
-- Name: shkuserpacklevelpart shkuserpacklevelpart_participantoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkuserpacklevelpart
    ADD CONSTRAINT shkuserpacklevelpart_participantoid FOREIGN KEY (participantoid) REFERENCES shkpacklevelparticipant(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4465 (class 2606 OID 21599)
-- Name: shkuserpacklevelpart shkuserpacklevelpart_useroid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkuserpacklevelpart
    ADD CONSTRAINT shkuserpacklevelpart_useroid FOREIGN KEY (useroid) REFERENCES shknormaluser(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4466 (class 2606 OID 21604)
-- Name: shkuserproclevelparticipant shkuserproclevelparticipant_participantoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkuserproclevelparticipant
    ADD CONSTRAINT shkuserproclevelparticipant_participantoid FOREIGN KEY (participantoid) REFERENCES shkproclevelparticipant(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4467 (class 2606 OID 21609)
-- Name: shkuserproclevelparticipant shkuserproclevelparticipant_useroid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkuserproclevelparticipant
    ADD CONSTRAINT shkuserproclevelparticipant_useroid FOREIGN KEY (useroid) REFERENCES shknormaluser(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4468 (class 2606 OID 21614)
-- Name: shkxpdlapplicationprocess shkxpdlapplicationprocess_packageoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkxpdlapplicationprocess
    ADD CONSTRAINT shkxpdlapplicationprocess_packageoid FOREIGN KEY (packageoid) REFERENCES shkxpdlapplicationpackage(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4469 (class 2606 OID 21619)
-- Name: shkxpdldata shkxpdldata_xpdl; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkxpdldata
    ADD CONSTRAINT shkxpdldata_xpdl FOREIGN KEY (xpdl) REFERENCES shkxpdls(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4470 (class 2606 OID 21624)
-- Name: shkxpdlhistorydata shkxpdlhistorydata_xpdlhistory; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkxpdlhistorydata
    ADD CONSTRAINT shkxpdlhistorydata_xpdlhistory FOREIGN KEY (xpdlhistory) REFERENCES shkxpdlhistory(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4471 (class 2606 OID 21629)
-- Name: shkxpdlparticipantprocess shkxpdlparticipantprocess_packageoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkxpdlparticipantprocess
    ADD CONSTRAINT shkxpdlparticipantprocess_packageoid FOREIGN KEY (packageoid) REFERENCES shkxpdlparticipantpackage(oid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4472 (class 2606 OID 21634)
-- Name: shkxpdlreferences shkxpdlreferences_referringxpdl; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shkxpdlreferences
    ADD CONSTRAINT shkxpdlreferences_referringxpdl FOREIGN KEY (referringxpdl) REFERENCES shkxpdls(oid) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2022-03-23 18:45:02 +08

--
-- PostgreSQL database dump complete
--

