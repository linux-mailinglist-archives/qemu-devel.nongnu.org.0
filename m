Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 410CA6E2363
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 14:36:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnIdK-0003eV-MU; Fri, 14 Apr 2023 08:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slankes@eonerc.rwth-aachen.de>)
 id 1pnIdA-0003Y6-NJ; Fri, 14 Apr 2023 08:34:20 -0400
Received: from mail-out-2a.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slankes@eonerc.rwth-aachen.de>)
 id 1pnId7-00014L-US; Fri, 14 Apr 2023 08:34:20 -0400
X-IPAS-Result: =?us-ascii?q?A2BXAADtRzlk/5kagoZaGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBgg+DIS2BL4RSkTOfWg8BAQEBAQEBAQEEBAFEBAEBhQYChTwnO?=
 =?us-ascii?q?BMBAgQBAQEBAwIDAQEBAQEBAwEBBgEBAQEBAQYEgR2FL0aGBAEBAQIBI1YFC?=
 =?us-ascii?q?wIBCEICAgIwJQIEDgUOgnABgjkSEa8ZgTKBAaEzEIFBgVaFdXaIeUKBSkOBP?=
 =?us-ascii?q?AwDDYJoPoRDg1w5gi4Emk8KgTR2gSAOSnKBBAIJAhFrgRAIaoF5QAINZAsOb?=
 =?us-ascii?q?4FJgU6BXAQCFDYODksDCQMHBSwdQAMLGA0WOhMsNRQgXGwtEhIFAwsVKkcEC?=
 =?us-ascii?q?DgGGzQRAggPEg8GJkQMQjczEwZcASkLDhEDTkIZbAQvWoEBBgEmJJ8Yg3bDf?=
 =?us-ascii?q?AMHgiiBVoZBgymXHQQvg2qTLZIrl3WiXRNaAYQrAgQCBAUCFoF6gX5xFGUBg?=
 =?us-ascii?q?jw/ExcCD6ILdT0CBwEKAQEDCYtFAQE?=
IronPort-Data: A9a23:lbrEjaKdR2XPVehxFE+R05QlxSXFcZb7ZxGr2PjKsXjdYENS0zxUz
 WMfCmGCMv2OMTT9eNtxbITkpEJQ7MTWytZlSgMd+CA2RRqmiyZk6fexcx2sZXPCdqUvaGo9s
 q3yv/GZdJhcokf0/0vraP67xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2LBVOCvQ/
 4KjyyHjEAX9gWUsbjtIs/vrRC5H5ZwehhtJ5jTSWtgW5Dcyp1FNZLoDKKe4KWfPQ4U8NoZWk
 M6akdlVVkuAl/scIovNfoTTKyXmcZaOVeS6sUe6boD56vR0jnFojvxrZKJ0hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0aBuoNf6zXaDXcO7iEbIUHb9kvVXF2YmIaAf4s1TBEdkz
 KlNQNwNRkjra+Oe2q2nSuR8w996acOtJpwDujRpwXfVAJ7KQ7iaGPmMvIQAmm1uwJkTRp4yZ
 OJAAdZrRA/EahtMN0w/BZU4kf2jwGPgbz0doVuepacxpWTepOB0+OS3YYGPKozSLSlTtm25o
 ljL/Tz5OFIxBN2QymWo2Gnr2fCayEsXX6pXTtVU7MVCiVme1ioZBRsQWFaTpfi/g1S5HdVFJ
 CQ84icyoLJ08UW6QtT5WzW8oXiNpBlaXMBfe8Uj5QSQj6PO5i6fAW4LSCMHb8Yp3OcvSDk3k
 1OEgd7tLTpotrKTVDSa7Lj8kN+pETIKMW8PdWofFE4PpcP8vIF2hx6JQtsL/LOJs+AZ0ArYm
 1iixBXSTZ1J1abnC43TEYj7vg+R
IronPort-HdrOrdr: A9a23:MTxf9aADjb7pQcPlHemJ55DYdb4zR+YMi2TDj3oBLiC8cqSj+P
 xG785rsyMc6QxhJU3I9urwW5VoLUmwyXcx2/h0AV7AZnibhILLFvAB0WKK+VSJcEfDH6xmpM
 JdmsNFZuEYeGIbsS+M2miF+rgbrOVvu5rY/Ns2h00dNT2D+8lbnnxE4yigYzdLeDU=
X-Talos-CUID: 9a23:ufFNPGEx+y0H0S1lqmIg/0A3F9F0ckTG62fMDkigIkJsbpesHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3A34xBSQz7ENY92r0DsiKBb4obrfSaqI+PDHoAk80?=
 =?us-ascii?q?GgYqvBS1/OGiwpi/wHZByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.99,195,1677538800"; 
 d="p7s'?scan'208";a="42932880"
Received: from rwthex-s1-b.rwth-ad.de ([134.130.26.153])
 by mail-in-2a.itc.rwth-aachen.de with ESMTP; 14 Apr 2023 14:34:03 +0200
Received: from rwthex-s1-a.rwth-ad.de (2a00:8a60:1:e500::26:152) by
 rwthex-s1-b.rwth-ad.de (2a00:8a60:1:e500::26:153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 14 Apr 2023 14:34:03 +0200
Received: from rwthex-s1-a.rwth-ad.de ([fe80::4e4b:1686:d8fa:8990]) by
 rwthex-s1-a.rwth-ad.de ([fe80::4e4b:1686:d8fa:8990%3]) with mapi id
 15.02.1118.026; Fri, 14 Apr 2023 14:34:03 +0200
From: "Lankes, Stefan" <slankes@eonerc.rwth-aachen.de>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
CC: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [RFC 1/1] add support of `--initrd` for ELF-ARM kernels
Thread-Topic: [RFC 1/1] add support of `--initrd` for ELF-ARM kernels
Thread-Index: AQHZbqOz3m2A2WZ4VE2Qebwb1TRCdq8qXrwAgAA9MgA=
Date: Fri, 14 Apr 2023 12:34:03 +0000
Message-ID: <04307039-7B61-4FDA-B82A-C83E2B0A9CF9@eonerc.rwth-aachen.de>
References: <20230414073432.36000-1-slankes@eonerc.rwth-aachen.de>
 <20230414073432.36000-2-slankes@eonerc.rwth-aachen.de>
 <87v8hyc03a.fsf@linaro.org>
In-Reply-To: <87v8hyc03a.fsf@linaro.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
x-originating-ip: [2a0a:a540:ee49:0:3149:9e0e:b13a:2fda]
Content-Type: multipart/signed;
 boundary="Apple-Mail=_F9105841-E05A-4771-8314-803A923E1F04";
 protocol="application/pkcs7-signature"; micalg=sha-256
MIME-Version: 1.0
Received-SPF: pass client-ip=2a00:8a60:1:e501::5:45;
 envelope-from=slankes@eonerc.rwth-aachen.de;
 helo=mail-out-2a.itc.rwth-aachen.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--Apple-Mail=_F9105841-E05A-4771-8314-803A923E1F04
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> Am 14.04.2023 um 10:54 schrieb Alex Benn=C3=A9e =
<alex.bennee@linaro.org>:
>=20

Hello Alex,

>=20
> Where are these DTB nodes documented?

Yes, it is currently missing.

>=20
> Also could you not achieve the same thing using the guest-loader which
> uses the multiboot spec and sets:
>=20
>        const char *compat[2] =3D { "multiboot,module", =
"multiboot,ramdisk" };
>        if (qemu_fdt_setprop_string_array(fdt, node, "compatible",
>                                          (char **) &compat,
>                                          ARRAY_SIZE(compat)) < 0) {
>            error_setg(errp, "couldn't set %s/compatible", node);
>            return;
>        }
>=20

Thanks for the hint. I will check it.

Cheers

Stefan


--Apple-Mail=_F9105841-E05A-4771-8314-803A923E1F04
Content-Disposition: attachment; filename="smime.p7s"
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCEb4w
ggUSMIID+qADAgECAgkA4wvV+K8l2YEwDQYJKoZIhvcNAQELBQAwgYIxCzAJBgNVBAYTAkRFMSsw
KQYDVQQKDCJULVN5c3RlbXMgRW50ZXJwcmlzZSBTZXJ2aWNlcyBHbWJIMR8wHQYDVQQLDBZULVN5
c3RlbXMgVHJ1c3QgQ2VudGVyMSUwIwYDVQQDDBxULVRlbGVTZWMgR2xvYmFsUm9vdCBDbGFzcyAy
MB4XDTE2MDIyMjEzMzgyMloXDTMxMDIyMjIzNTk1OVowgZUxCzAJBgNVBAYTAkRFMUUwQwYDVQQK
EzxWZXJlaW4genVyIEZvZXJkZXJ1bmcgZWluZXMgRGV1dHNjaGVuIEZvcnNjaHVuZ3NuZXR6ZXMg
ZS4gVi4xEDAOBgNVBAsTB0RGTi1QS0kxLTArBgNVBAMTJERGTi1WZXJlaW4gQ2VydGlmaWNhdGlv
biBBdXRob3JpdHkgMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMtg1/9moUHN0vqH
l4pzq5lN6mc5WqFggEcVToyVsuXPztNXS43O+FZsFVV2B+pG/cgDRWM+cNSrVICxI5y+NyipCf8F
XRgPxJiZN7Mg9mZ4F4fCnQ7MSjLnFp2uDo0peQcAIFTcFV9Kltd4tjTTwXS1nem/wHdN6r1ZB+Ba
L2w8pQDcNb1lDY9/Mm3yWmpLYgHurDg0WUU2SQXaeMpqbVvAgWsRzNI8qIv4cRrKO+KA3Ra0Z3qL
NupOkSk9s1FcragMvp0049ENF4N1xDkesJQLEvHVaY4l9Lg9K7/AjsMeO6W/VRCrKq4Xl14zzsjz
9AkH4wKGMUZrAcUQDBHHWekCAwEAAaOCAXQwggFwMA4GA1UdDwEB/wQEAwIBBjAdBgNVHQ4EFgQU
k+PYMiba1fFKpZFK4OpL4qIMz+EwHwYDVR0jBBgwFoAUv1kgNgB5oKAia4zV8mHSuCzLgkowEgYD
VR0TAQH/BAgwBgEB/wIBAjAzBgNVHSAELDAqMA8GDSsGAQQBga0hgiwBAQQwDQYLKwYBBAGBrSGC
LB4wCAYGZ4EMAQICMEwGA1UdHwRFMEMwQaA/oD2GO2h0dHA6Ly9wa2kwMzM2LnRlbGVzZWMuZGUv
cmwvVGVsZVNlY19HbG9iYWxSb290X0NsYXNzXzIuY3JsMIGGBggrBgEFBQcBAQR6MHgwLAYIKwYB
BQUHMAGGIGh0dHA6Ly9vY3NwMDMzNi50ZWxlc2VjLmRlL29jc3ByMEgGCCsGAQUFBzAChjxodHRw
Oi8vcGtpMDMzNi50ZWxlc2VjLmRlL2NydC9UZWxlU2VjX0dsb2JhbFJvb3RfQ2xhc3NfMi5jZXIw
DQYJKoZIhvcNAQELBQADggEBAIcL/z4Cm2XIVi3WO5qYi3FP2ropqiH5Ri71sqQPrhE4eTizDnS6
dl2e6BiClmLbTDPo3flq3zK9LExHYFV/53RrtCyD2HlrtrdNUAtmB7Xts5et6u5/MOaZ/SLick0+
hFvu+c+Z6n/XUjkurJgARH5pO7917tALOxrN5fcPImxHhPalR6D90Bo0fa3SPXez7vTXTf/D6OWS
T1k+kEcQSrCFWMBvf/iu7QhCnh7U3xQuTY+8npTD5+32GPg8SecmqKc22CzeIs2LgtjZeOJVEqM7
h0S2EQvVDFKvaYwPBt/QolOLV5h7z/0HJPT8vcP9SpIClxvyt7bPZYoaorVyGTkwggWsMIIElKAD
AgECAgcbY7rQHiw9MA0GCSqGSIb3DQEBCwUAMIGVMQswCQYDVQQGEwJERTFFMEMGA1UEChM8VmVy
ZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRzY2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYu
MRAwDgYDVQQLEwdERk4tUEtJMS0wKwYDVQQDEyRERk4tVmVyZWluIENlcnRpZmljYXRpb24gQXV0
aG9yaXR5IDIwHhcNMTYwNTI0MTEzODQwWhcNMzEwMjIyMjM1OTU5WjCBjTELMAkGA1UEBhMCREUx
RTBDBgNVBAoMPFZlcmVpbiB6dXIgRm9lcmRlcnVuZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2NodW5n
c25ldHplcyBlLiBWLjEQMA4GA1UECwwHREZOLVBLSTElMCMGA1UEAwwcREZOLVZlcmVpbiBHbG9i
YWwgSXNzdWluZyBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJ07eRxH3h+Gy8Zp
1xCeOdfZojDbchwFfylfS2jxrRnWTOFrG7ELf6Gr4HuLi9gtzm6IOhDuV+UefwRRNuu6cG1joL6W
LkDh0YNMZj0cZGnlm6Stcq5oOVGHecwX064vXWNxSzl660Knl5BpBb+Q/6RAcL0D57+eGIgfn5mI
TQ5HjUhfZZkQ0tkqSe3BuS0dnxLLFdM/fx5ULzquk1enfnjK1UriGuXtQX1TX8izKvWKMKztFwUk
P7agCwf9TRqaA1KgNpzeJIdl5Of6x5ZzJBTN0OgbaJ4YWa52fvfRCng8h0uwN89Tyjo4EPPLR22M
ZD08WkVKusqAfLjz56dMTM0CAwEAAaOCAgUwggIBMBIGA1UdEwEB/wQIMAYBAf8CAQEwDgYDVR0P
AQH/BAQDAgEGMCkGA1UdIAQiMCAwDQYLKwYBBAGBrSGCLB4wDwYNKwYBBAGBrSGCLAEBBDAdBgNV
HQ4EFgQUazqYi/nyU4na4K2yMh4JH+iqO3QwHwYDVR0jBBgwFoAUk+PYMiba1fFKpZFK4OpL4qIM
z+EwgY8GA1UdHwSBhzCBhDBAoD6gPIY6aHR0cDovL2NkcDEucGNhLmRmbi5kZS9nbG9iYWwtcm9v
dC1nMi1jYS9wdWIvY3JsL2NhY3JsLmNybDBAoD6gPIY6aHR0cDovL2NkcDIucGNhLmRmbi5kZS9n
bG9iYWwtcm9vdC1nMi1jYS9wdWIvY3JsL2NhY3JsLmNybDCB3QYIKwYBBQUHAQEEgdAwgc0wMwYI
KwYBBQUHMAGGJ2h0dHA6Ly9vY3NwLnBjYS5kZm4uZGUvT0NTUC1TZXJ2ZXIvT0NTUDBKBggrBgEF
BQcwAoY+aHR0cDovL2NkcDEucGNhLmRmbi5kZS9nbG9iYWwtcm9vdC1nMi1jYS9wdWIvY2FjZXJ0
L2NhY2VydC5jcnQwSgYIKwYBBQUHMAKGPmh0dHA6Ly9jZHAyLnBjYS5kZm4uZGUvZ2xvYmFsLXJv
b3QtZzItY2EvcHViL2NhY2VydC9jYWNlcnQuY3J0MA0GCSqGSIb3DQEBCwUAA4IBAQCBeEWkTqR/
DlXwCbFqPnjMaDWpHPOVnj/z+N9rOHeJLI21rT7H8pTNoAauusyosa0zCLYkhmI2THhuUPDVbmCN
T1IxQ5dGdfBi5G5mUcFCMWdQ5UnnOR7Ln8qGSN4IFP8VSytmm6A4nwDO/afr0X9XLchMX9wQEZc+
lgQCXISoKTlslPwQkgZ7nu7YRrQbtQMMONncsKk/cQYLsgMHM8KNSGMlJTx6e1du94oFOO+4oK4v
9NsH1VuEGMGpuEvObJAaguS5Pfp38dIfMwK/U+d2+dwmJUFvL6Yb+qQTkPp8ftkLYF3sv8pBoGH7
EUkp2KgtdRXYShjqFu9VNCIaE40GMIIG9DCCBdygAwIBAgIMJtuc71fMFTgq63BmMA0GCSqGSIb3
DQEBCwUAMIGNMQswCQYDVQQGEwJERTFFMEMGA1UECgw8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVp
bmVzIERldXRzY2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLDAdERk4tUEtJMSUw
IwYDVQQDDBxERk4tVmVyZWluIEdsb2JhbCBJc3N1aW5nIENBMB4XDTIyMDYyOTA5NDYxMFoXDTI1
MDYyODA5NDYxMFowgYcxCzAJBgNVBAYTAkRFMRQwEgYDVQQKDAtSV1RIIEFhY2hlbjEkMCIGA1UE
CwwbRS5PTiBFbmVyZ3kgUmVzZWFyY2ggQ2VudGVyMQ8wDQYDVQQEDAZMYW5rZXMxDzANBgNVBCoM
BlN0ZWZhbjEaMBgGA1UEAwwRRHIuIFN0ZWZhbiBMYW5rZXMwggIiMA0GCSqGSIb3DQEBAQUAA4IC
DwAwggIKAoICAQDELT+xcia5CINQCt9AeV2kmqU+umAVAMlKWAk10M3FCrVFL5GdPv9ff+nEnIC1
XhShlClvO8vkYbSa2YHJ+BMtxT3VKAmgrKjGfYvM5FLHKGml+XIff8JmPyBBBaCUtwFT2soneaXl
pxqJjWsMUhOgOc+7FzSf2NsiArU6VLnyxoyPBGs5TrlOnuriWAuZI/KVy4kNYCMC6DuJrxpVstzW
u5zYLFKsoYEKMQaZlhXfOFEVaZihXajSupDW4HCsAt5TPFp0y8SThSLDtp+Xp+bXAn+zkXurAOYs
c0p/Im3vJQQpC4KvQo0WvF4+SLWi18d0UII2pai8RoVx3Prd2d9Ip7kKrBlgvTT5rXJ+nvqTvBYy
hJX96Y+O32euwzrH5UFuLHZ7BkWjKIB1TnXHNLY/NOUA5s9tQMnE9qw8cuBasBiCU8DSdI32bPKs
jLaU1YdPldVlAskIOArjRz5vLnorRpFNB/T4s1FZcVjs5Ykziu3CYs12ARYq2gO3AS1YqCaPwp2I
KRpIad0ihxcw4zuv2JeUpjwCHvCuvk6/K0qp1tc+RQWHC9DDz9MTsmJfZRt4a+2tPL0lA5tl7vLv
idUwDOKFXsv2FpGE2d0hCl5L8uJ9fvlTuZPzbcVc7MXFbMXerVKtOU4dDHqs1r6/q0Iv7/38cq1G
ADBIbV5DkeItcwIDAQABo4ICVjCCAlIwPgYDVR0gBDcwNTAPBg0rBgEEAYGtIYIsAQEEMBAGDisG
AQQBga0hgiwBAQQKMBAGDisGAQQBga0hgiwCAQQKMAkGA1UdEwQCMAAwDgYDVR0PAQH/BAQDAgXg
MB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDAdBgNVHQ4EFgQU6V1A8ndjcL/OIc6B2JvW
0c8Gv78wHwYDVR0jBBgwFoAUazqYi/nyU4na4K2yMh4JH+iqO3QwKAYDVR0RBCEwH4Edc2xhbmtl
c0Blb25lcmMucnd0aC1hYWNoZW4uZGUwgY0GA1UdHwSBhTCBgjA/oD2gO4Y5aHR0cDovL2NkcDEu
cGNhLmRmbi5kZS9kZm4tY2EtZ2xvYmFsLWcyL3B1Yi9jcmwvY2FjcmwuY3JsMD+gPaA7hjlodHRw
Oi8vY2RwMi5wY2EuZGZuLmRlL2Rmbi1jYS1nbG9iYWwtZzIvcHViL2NybC9jYWNybC5jcmwwgdsG
CCsGAQUFBwEBBIHOMIHLMDMGCCsGAQUFBzABhidodHRwOi8vb2NzcC5wY2EuZGZuLmRlL09DU1At
U2VydmVyL09DU1AwSQYIKwYBBQUHMAKGPWh0dHA6Ly9jZHAxLnBjYS5kZm4uZGUvZGZuLWNhLWds
b2JhbC1nMi9wdWIvY2FjZXJ0L2NhY2VydC5jcnQwSQYIKwYBBQUHMAKGPWh0dHA6Ly9jZHAyLnBj
YS5kZm4uZGUvZGZuLWNhLWdsb2JhbC1nMi9wdWIvY2FjZXJ0L2NhY2VydC5jcnQwDQYJKoZIhvcN
AQELBQADggEBABu58LP/WzZyCyLR24hBYF2mJQYe8nvr2NEsT9Fvb033Jt1+kF+puRbI/pFVGqrF
NQtsuBuGytbSR06xoy1bdGKYSp+qRf2YbpGQekl51paYOhFof4NDj4o1mQZmtUjW4I/WeY5USLL9
DNdWiiNsNaFh+LRB0qdM8uEkwOhweLtlRu8Lbn94nEcNp7DBtBnxhJtzGR0NiomWbSC3VrWuLgFn
GO+//EthAj48rWSdKJ3/yfWr+TJsRmdboZXg1bsoCgnJiZ4EPFjgvoYNTJp6Dv0YNR8yHFo4e/hF
FVzCfsMerI9ODESp885W0fWiStFF0154TVWrnRohKg8Imj2jy+cxggSdMIIEmQIBATCBnjCBjTEL
MAkGA1UEBhMCREUxRTBDBgNVBAoMPFZlcmVpbiB6dXIgRm9lcmRlcnVuZyBlaW5lcyBEZXV0c2No
ZW4gRm9yc2NodW5nc25ldHplcyBlLiBWLjEQMA4GA1UECwwHREZOLVBLSTElMCMGA1UEAwwcREZO
LVZlcmVpbiBHbG9iYWwgSXNzdWluZyBDQQIMJtuc71fMFTgq63BmMA0GCWCGSAFlAwQCAQUAoIIB
zzAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMzA0MTQxMjMzNTJa
MC8GCSqGSIb3DQEJBDEiBCB49cAlgy6I0EaG2OTC+nov3SDih6DAwIAQu51PQBpHLjCBrwYJKwYB
BAGCNxAEMYGhMIGeMIGNMQswCQYDVQQGEwJERTFFMEMGA1UECgw8VmVyZWluIHp1ciBGb2VyZGVy
dW5nIGVpbmVzIERldXRzY2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLDAdERk4t
UEtJMSUwIwYDVQQDDBxERk4tVmVyZWluIEdsb2JhbCBJc3N1aW5nIENBAgwm25zvV8wVOCrrcGYw
gbEGCyqGSIb3DQEJEAILMYGhoIGeMIGNMQswCQYDVQQGEwJERTFFMEMGA1UECgw8VmVyZWluIHp1
ciBGb2VyZGVydW5nIGVpbmVzIERldXRzY2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYD
VQQLDAdERk4tUEtJMSUwIwYDVQQDDBxERk4tVmVyZWluIEdsb2JhbCBJc3N1aW5nIENBAgwm25zv
V8wVOCrrcGYwDQYJKoZIhvcNAQELBQAEggIANL0CHAFJE9MSA4IoZjE6Nxfk1156L3bwQJWzOPrF
XSNjjI8WmVXJ7TYp7ucpQBjt62S8yMpbYW+iKm6MyJP+ImlSidRB4IhBpVpcXiw2EvPYNtZJCj/z
Q+z7Xf1tuS22rOWazh7wHJM9J+rTNOm/Ewy2n36FAIA0iCt9j63oNTBY3pX2CwbJysRdovxKYC2w
q9+ToKu6X0jFsUzuPWy42i8s5lSLH/wNNr1S5syXd7LPY7ZSOm+8av7Td/fIkpLsPM+8eUNqYx3h
x3lQvCDlM4jEqnOSg2ifYHs6l759Qd8YBJb5bEdJpe1/sJztmQOX7S/rTgtcRuvGhQvPJ751Mq8a
4wrpXl9quM42CfifKYwm65agoZF8e05xZzK/LE/t9M+QQhYOFkFSnVQyLQec8tE/hYnxFQV5sWNt
F9Stwk6bVXlx2hB8p9EMUY1jWLCI45DbGfpAp/JHMZ3g0lTmjpe1TM17LnQIBmyUMIF1vwP+2VDc
xd7BxPCQXJhTtMFe66nvHxtXMlH3inL7uXD+A6OOucMhP0n4FX3lsILvUtgds4HJxtlreKPKkM7V
Zg2nEVFgngGyxIdurIf6fZh44nwh7AMf7IRwuPBS3aSNUQAOPDMP4Q4updvczynb8gp4e1aBHcBB
SJG4mq6ah6jtgoWagSzn3HOhmaxPMPUXlyUAAAAAAAA=

--Apple-Mail=_F9105841-E05A-4771-8314-803A923E1F04--

