WITH sessions AS (
  SELECT
    *
  FROM
    {{ ref('stg_google_analytics__sessions') }}
),
final AS (
  SELECT
    SESSION_ID,
    FULL_VISITOR_ID,
    CLIENT_ID,
    VISIT_ID,
    USER_ID,
    VISIT_NUMBER,
    VISIT_START_TIME                                                    AS SESSION_START_TIME,
    CHANNEL_GROUPING,
    TOTALS['BOUNCES']::INT                                              AS TOTAL_BOUNCES,
    IFF(TOTALS['BOUNCES']::INT > 0, TRUE, FALSE)                        AS IS_SESSION_BOUNCE,
    TOTALS['HITS']::INT                                                 AS TOTAL_HITS,
    TOTALS['PAGE_VIEWS']::INT                                           AS TOTAL_PAGE_VIEWS,
    TOTALS['SESSION_QUALITY_DIM']::INT                                  AS SESSION_QUALITY_SCORE,
    TOTALS['TIME_ON_SITE']::INT                                         AS TIME_ON_SITE,
    TOTALS['TOTAL_TRANSACTION_REVENUE']::INT                            AS TOTAL_TRANSACTION_REVENUE,
    TOTALS['TRANSACTIONS']::INT                                         AS TOTAL_TRANSACTIONS,
    TRAFFIC_SOURCE['AD_CONTENT']::STRING                                AS MARKETING_AD_CONTENT,
    TRAFFIC_SOURCE['CAMPAIGN']::STRING                                  AS MARKETING_CAMPAIGN,
    COALESCE(TRAFFIC_SOURCE['IS_TRUE_DIRECT'], FALSE)                   AS IS_TRUE_DIRECT,
    TRAFFIC_SOURCE['KEYWORD']::STRING                                   AS MARKETING_KEYWORD,
    TRAFFIC_SOURCE['MEDIUM']::STRING                                    AS MARKETING_MEDIUM,
    TRAFFIC_SOURCE['REFERRAL_PATH']::STRING                             AS REFERRAL_PATH,
    TRAFFIC_SOURCE['SOURCE']::STRING                                    AS MARKETING_SOURCE,
    DEVICE['BROWSER']::STRING                                           AS BROWSER,
    DEVICE['BROWSER_SIZE']::STRING                                      AS BROWSER_SIZE,
    DEVICE['BROWSER_VERSION']::STRING                                   AS BROWSER_VERSION,
    DEVICE['DEVICE_CATEGORY']::STRING                                   AS DEVICE_CATEGORY,
    DEVICE['FLASH_VERSION']::STRING                                     AS DEVICE_FLASH_VERSION,
    DEVICE['JAVA_ENABLED']::STRING                                      AS DEVICE_JAVA_ENABLED,
    DEVICE['LANGUAGE']::STRING                                          AS DEVICE_LANGUAGE,
    DEVICE['MOBILE_DEVICE_BRANDING']::STRING                            AS MOBILE_DEVICE_BRANDING,
    DEVICE['MOBILE_DEVICE_INFO']::STRING                                AS MOBILE_DEVICE_INFO,
    DEVICE['MOBILE_DEVICE_MARKETING_NAME']::STRING                      AS MOBILE_DEVICE_MARKETING_NAME,
    DEVICE['MOBILE_DEVICE_MODEL']::STRING                               AS MOBILE_DEVICE_MODEL,
    DEVICE['MOBILE_INPUT_SELECTOR']::STRING                             AS MOBILE_INPUT_SELECTOR,
    DEVICE['OPERATING_SYSTEM']::STRING                                  AS OPERATING_SYSTEM,
    DEVICE['OPERATING_SYSTEM_VERSION']::STRING                          AS OPERATING_SYSTEM_VERSION,
    DEVICE['SCREEN_COLORS']::STRING                                     AS SCREEN_COLORS,
    DEVICE['SCREEN_RESOLUTION']::STRING                                 AS SCREEN_RESOLUTION,
    GEO_NETWORK['CITY']::STRING                                         AS GEONETWORK_CITY,
    GEO_NETWORK['CONTINENT']::STRING                                    AS GEONETWORK_CONTINENT,
    GEO_NETWORK['COUNTRY']::STRING                                      AS GEONETWORK_COUNTRY
  FROM
    sessions
)
SELECT
  *
FROM
  final
