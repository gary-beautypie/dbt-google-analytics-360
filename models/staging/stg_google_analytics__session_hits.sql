WITH base AS (
  SELECT
    *
  FROM
    {{ source('GOOGLE_ANALYTICS', 'SESSION_HITS') }}
),
final AS (
  SELECT
    VISITID             AS VISIT_ID,
    FULLVISITORID       AS FULL_VISITOR_ID,
    VISITSTARTTIME      AS VISIT_START_TIME,
    HITNUMBER           AS HIT_NUMBER,
    APPINFO             AS APP_INFO,
    CONTENTGROUP        AS CONTENT_GROUP,
    CONTENTINFO         AS CONTENT_INFO,
    CUSTOMDIMENSIONS    AS CUSTOM_DIMENSIONS,
    CUSTOMMETRICS       AS CUSTOM_METRICS,
    CUSTOMVARIABLES     AS CUSTOM_VARIABLES,
    DATASOURCE          AS DATA_SOURCE,
    ECOMMERCEACTION     AS ECOMMERCE_ACTION,
    EVENTINFO           AS EVENT_INFO,
    EXCEPTIONINFO       AS EXCEPTION_INFO,
    EXPERIMENT,
    HOUR,
    ISENTRANCE          AS IS_ENTRANCE,
    ISEXIT              AS IS_EXIT,
    ISINTERACTION       AS IS_INTERACTION,
    ISSECURE            AS IS_SECURE,
    ITEM,
    LATENCYTRACKING     AS LATENCY_TRACKING,
    MINUTE,
    PAGE,
    PRODUCT,
    PROMOTION,
    PROMOTIONACTIONINFO AS PROMOTION_ACTION_INFO,
    PUBLISHER,
    REFERER,
    REFUND,
    SOCIAL,
    SOURCEPROPERTYINFO  AS SOURCE_PROPERTY_INFO,
    TIME,
    TRANSACTION,
    TYPE
  FROM
    base
)
SELECT
  *
FROM
  final