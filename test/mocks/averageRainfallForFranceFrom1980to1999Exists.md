## Interaction 0: GET /climateweb/rest/v1/country/annualavg/pr/1980/1999/fra.xml

### Request headers recorded for playback:

```
user-agent: Dart/2.8 (dart:io)
accept-encoding: gzip
content-length: 0
host: localhost:61417
```

### Request body recorded for playback ():

```

```

### Response headers recorded for playback:

```
set-cookie: AWSALB=hxf3zJtBXghMkjLKpk7C5XhcV85KLKCPEuIVEan+nXGvERjBYkwv/Y5s0mFic0nGTkGHqqxYB72G6oSBwOC34la13+ka1GqFNS3c4XuH5sHnf2C8A1wY6OH8l7T1; Expires=Mon, 02 Mar 2020 19:00:34 GMT; Path=/,AWSALBCORS=hxf3zJtBXghMkjLKpk7C5XhcV85KLKCPEuIVEan+nXGvERjBYkwv/Y5s0mFic0nGTkGHqqxYB72G6oSBwOC34la13+ka1GqFNS3c4XuH5sHnf2C8A1wY6OH8l7T1; Expires=Mon, 02 Mar 2020 19:00:34 GMT; Path=/; SameSite=None; Secure,TS01c35ec3=010640bd98fb211f64344ab200394c443caa526ba537054e086402a5bb13980aaa41fc9de36ed7bc75e620b7a76bc846ec29dcfdf7; Path=/,climatedataapi.cookie=2615193866.33060.0000; path=/; Httponly,climatedataapi_ext.cookie=2543955978.20480.0000; path=/; Httponly,TS0137860d=017189f9477c125f7fff9f5b7842cf11b4e0fa566f10191fe9b6f6cea67f3fde6c8d33559dc32bd839b4a17dc3fefa4177f718ec754e6e8a31d274585209e2d352d55b03985f8211adeb268abf9e8a4b06faed94d6eb0bde55d452cbcb0caf9ba35419dafeded92b16af70ad1f919145ca018fe1785f91c4ecb1ec238655ee744ecf2e07c3; Path=/
cache-control: no-cache,no-store
transfer-encoding: chunked
date: Mon, 24 Feb 2020 19:00:34 GMT
access-control-allow-origin: *
secure: true
strict-transport-security: max-age=0,max-age=31536000; includeSubDomains
content-type: application/xml
pragma: no-cache
x-xss-protection: 1; mode=block,1; mode=block
access-control-allow-headers: X-Requested-With
access-control-allow-methods: GET
x-frame-options: DENY,deny
x-content-type-options: nosniff,nosniff
content-security-policy: default-src 'self'
httponly: true
```

### Response body recorded for playback (200: application/xml):

```
<list>
  <domain.web.AnnualGcmDatum>
    <gcm>bccr_bcm2_0</gcm>
    <variable>pr</variable>
    <fromYear>1980</fromYear>
    <toYear>1999</toYear>
    <annualData>
      <double>1077.8620827419693</double>
    </annualData>
  </domain.web.AnnualGcmDatum>
  <domain.web.AnnualGcmDatum>
    <gcm>cccma_cgcm3_1</gcm>
    <variable>pr</variable>
    <fromYear>1980</fromYear>
    <toYear>1999</toYear>
    <annualData>
      <double>745.3185434053028</double>
    </annualData>
  </domain.web.AnnualGcmDatum>
  <domain.web.AnnualGcmDatum>
    <gcm>cnrm_cm3</gcm>
    <variable>pr</variable>
    <fromYear>1980</fromYear>
    <toYear>1999</toYear>
    <annualData>
      <double>1063.867595326212</double>
    </annualData>
  </domain.web.AnnualGcmDatum>
  <domain.web.AnnualGcmDatum>
    <gcm>csiro_mk3_5</gcm>
    <variable>pr</variable>
    <fromYear>1980</fromYear>
    <toYear>1999</toYear>
    <annualData>
      <double>1007.0295299183938</double>
    </annualData>
  </domain.web.AnnualGcmDatum>
  <domain.web.AnnualGcmDatum>
    <gcm>gfdl_cm2_0</gcm>
    <variable>pr</variable>
    <fromYear>1980</fromYear>
    <toYear>1999</toYear>
    <annualData>
      <double>1061.3426458178785</double>
    </annualData>
  </domain.web.AnnualGcmDatum>
  <domain.web.AnnualGcmDatum>
    <gcm>gfdl_cm2_1</gcm>
    <variable>pr</variable>
    <fromYear>1980</fromYear>
    <toYear>1999</toYear>
    <annualData>
      <double>1004.4105613005454</double>
    </annualData>
  </domain.web.AnnualGcmDatum>
  <domain.web.AnnualGcmDatum>
    <gcm>ingv_echam4</gcm>
    <variable>pr</variable>
    <fromYear>1980</fromYear>
    <toYear>1999</toYear>
    <annualData>
      <double>750.6408894859092</double>
    </annualData>
  </domain.web.AnnualGcmDatum>
  <domain.web.AnnualGcmDatum>
    <gcm>inmcm3_0</gcm>
    <variable>pr</variable>
    <fromYear>1980</fromYear>
    <toYear>1999</toYear>
    <annualData>
      <double>967.5554180724546</double>
    </annualData>
  </domain.web.AnnualGcmDatum>
  <domain.web.AnnualGcmDatum>
    <gcm>ipsl_cm4</gcm>
    <variable>pr</variable>
    <fromYear>1980</fromYear>
    <toYear>1999</toYear>
    <annualData>
      <double>873.0839862248788</double>
    </annualData>
  </domain.web.AnnualGcmDatum>
  <domain.web.AnnualGcmDatum>
    <gcm>miroc3_2_medres</gcm>
    <variable>pr</variable>
    <fromYear>1980</fromYear>
    <toYear>1999</toYear>
    <annualData>
      <double>903.9068381571817</double>
    </annualData>
  </domain.web.AnnualGcmDatum>
  <domain.web.AnnualGcmDatum>
    <gcm>miub_echo_g</gcm>
    <variable>pr</variable>
    <fromYear>1980</fromYear>
    <toYear>1999</toYear>
    <annualData>
      <double>911.8733705463638</double>
    </annualData>
  </domain.web.AnnualGcmDatum>
  <domain.web.AnnualGcmDatum>
    <gcm>mpi_echam5</gcm>
    <variable>pr</variable>
    <fromYear>1980</fromYear>
    <toYear>1999</toYear>
    <annualData>
      <double>807.6978963218183</double>
    </annualData>
  </domain.web.AnnualGcmDatum>
  <domain.web.AnnualGcmDatum>
    <gcm>mri_cgcm2_3_2a</gcm>
    <variable>pr</variable>
    <fromYear>1980</fromYear>
    <toYear>1999</toYear>
    <annualData>
      <double>643.4242285526061</double>
    </annualData>
  </domain.web.AnnualGcmDatum>
  <domain.web.AnnualGcmDatum>
    <gcm>ukmo_hadcm3</gcm>
    <variable>pr</variable>
    <fromYear>1980</fromYear>
    <toYear>1999</toYear>
    <annualData>
      <double>911.9471435543941</double>
    </annualData>
  </domain.web.AnnualGcmDatum>
  <domain.web.AnnualGcmDatum>
    <gcm>ukmo_hadgem1</gcm>
    <variable>pr</variable>
    <fromYear>1980</fromYear>
    <toYear>1999</toYear>
    <annualData>
      <double>977.019703258182</double>
    </annualData>
  </domain.web.AnnualGcmDatum>
</list>
```
