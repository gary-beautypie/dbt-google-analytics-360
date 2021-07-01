WITH session_hits AS (
  SELECT
    *
  FROM
    {{ ref('stg_google_analytics__session_hits') }}
),
final AS (
  SELECT
    SESSION_HIT_ID,
    SESSION_ID,
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
    ECOMMERCE_ACTION['action_type']::INT            AS ECOMMERCE_ACTION_TYPE,
    CASE ECOMMERCE_ACTION_TYPE
      WHEN 0 THEN 'Unknown'
      WHEN 1 THEN 'Click through of product lists'
      WHEN 2 THEN 'Product detail views'
      WHEN 3 THEN 'Add product(s) to cart'
      WHEN 4 THEN 'Remove product(s) from cart'
      WHEN 5 THEN 'Check out'
      WHEN 6 THEN 'Completed purchase'
      WHEN 7 THEN 'Refund of purchase'
      WHEN 8 THEN 'Checkout options'
      ELSE NULL
    END                                             AS ECOMMERCE_ACTION_TYPE_DESCRIPTION,
    ECOMMERCE_ACTION['step']::INT                   AS ECOMMERCE_ACTION_STEP,
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
    LATENCY_TRACKING['pageLoadTime']::INT           AS PAGE_LOAD_TIME_MILLIS,
    LATENCY_TRACKING['serverResponseTime']::INT     AS SERVER_RESPONSE_TIME_MILLIS,
    LATENCY_TRACKING['domContentLoadedTime']::INT   AS DOM_CONTENT_LOADED_TIME_MILLIS
  FROM
    session_hits
)
SELECT
  *
FROM
  final
