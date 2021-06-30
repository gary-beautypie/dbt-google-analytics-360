WITH session_hits AS (
  SELECT
    *
  FROM
    {{ ref('stg_google_analytics__session_hits') }}
),
final AS (
  SELECT
    VISIT_ID,
    FULL_VISITOR_ID,
    VISIT_START_TIME,
    HIT_NUMBER,
    HIT_TYPE,
    TIME                                            AS SECONDS_SINCE_SESSION_START,
    HOUR,
    MINUTE,
    IS_INTERACTION,
    IS_ENTRANCE,
    IS_EXIT,
    DATA_SOURCE,
    EXPERIMENT,
    PRODUCT,
    APP_INFO,
    CONTENT_GROUP,
    CONTENT_INFO,
    ECOMMERCE_ACTION['action_type']::STRING         AS ECOMMERCE_ACTION_TYPE,
    ECOMMERCE_ACTION['step']::STRING                AS ECOMMERCE_ACTION_STEP,
    EVENT_INFO['eventAction']::STRING               AS EVENT_ACTION,
    EVENT_INFO['eventCategory']::STRING             AS EVENT_CATEGORY,
    EVENT_INFO['eventLabel']::STRING                AS EVENT_LABEL,
    EVENT_INFO['eventValue']::STRING                AS EVENT_VALUE,
    PAGE['hostname']::STRING                        AS PAGE_HOSTNAME,
    PAGE['pagePath']::STRING                        AS PAGE_URL_PATH,
    PAGE['pagePathLevel1']::STRING                  AS PAGE_URL_PATH_LEVEL_1,
    PAGE['pagePathLevel2']::STRING                  AS PAGE_URL_PATH_LEVEL_2,
    PAGE['pagePathLevel3']::STRING                  AS PAGE_URL_PATH_LEVEL_3,
    PAGE['pagePathLevel4']::STRING                  AS PAGE_URL_PATH_LEVEL_4,
    PAGE['pageTitle']::STRING                       AS PAGE_TITLE,
    PAGE['searchCategory']::STRING                  AS SEARCH_CATEGORY_FOR_PAGE,
    PAGE['searchKeyword']::STRING                   AS SEARCH_TERM_FOR_PAGE,
    TRANSACTION['transactionId']::NUMBER            AS TRANSACTION_ID,
    LATENCY_TRACKING['pageLoadTime']::INT           AS PAGE_LOAD_TIME,
    LATENCY_TRACKING['serverResponseTime']::INT     AS SERVER_RESPONSE_TIME,
    LATENCY_TRACKING['domContentLoadedTime']::INT   AS DOM_CONTENT_LOADED_TIME
  FROM
    session_hits
)
SELECT
  *
FROM
  final
