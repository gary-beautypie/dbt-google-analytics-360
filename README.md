# DBT Google Analytics 360

DBT package for Google Analytics 360 data based on the ingestion schema from [Stitch data](https://www.stitchdata.com/docs/integrations/saas/google-analytics-360#schema).  
This package is currently intended for Snowflake use, other databases to follow.  

## Installation
1. Add the following to your `packages.yml` file  
```yml
- package: beautypie/google_analytics_360
  version: 0.1.0
```

2. By default this will look into the `google_analytics_360` schema of your profile database.  
If this is not where your data is, please add the following to your `dbt_project.yml`:
```yml
vars:
  google_analytics_database: your_google_analytics_database
  google_analytics_schema: your_google_analytics_schema
```

3. (Optional) It's possible that your ingestion is run outside of Stitch and the table
names don't match, in this case you can provide them as follows.
```yml
vars:
  google_analytics_sessions: SESSIONS
  google_analytics_hits: HITS
```

4. Run `dbt deps`
