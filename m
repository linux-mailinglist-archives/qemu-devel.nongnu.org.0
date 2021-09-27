Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CFB4195EF
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 16:07:04 +0200 (CEST)
Received: from localhost ([::1]:52266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUrHb-00016z-9G
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 10:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mUr4O-0003ej-A5; Mon, 27 Sep 2021 09:53:25 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:60454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mUr4I-0000jK-L3; Mon, 27 Sep 2021 09:53:22 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18RDX06D032543; 
 Mon, 27 Sep 2021 13:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=3HFBiKvAkvSPtlDwub+iokIY8WsC3O29+8hXTxCMe+E=;
 b=zfkhXYX5QkRC3xplODovn6RJEHHPTIVNbayT2uQqaPh5B6GfPP41Jn10HauSV50wCoku
 nAv5ZL1P8czWS112DcuPfqZO7/5JbbmxtAAZIXOpnUu0XRGgMBz0OAmspHiNM9T+s4n9
 QG7TiVYWRUddtQ5c8IeSw/7WxLWFCILRLKMyOkp/8DE3xQCsLq74Vsli85CeKv3o4zI0
 itNTRiqBXKvyKvPYPUG2b8752r3rCWak2B4is5jpsSA9nyGti42ETftkc0yYVIlYm3us
 pHGp3Jyw9oGfDKltzRI9hZ/II8yoTqSUB1POBntTxP7XCllp8F7Ji33/zNYQrxOAqPUa Xg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bbexcr6kp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Sep 2021 13:53:08 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18RDp8rm072103;
 Mon, 27 Sep 2021 13:53:07 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by aserp3020.oracle.com with ESMTP id 3b9x50dvhn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Sep 2021 13:53:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPvEirktxZd+vOuOR9kcbaqF5e4N/Y02wQrZaJP3ZornRpOtXrsq5mCzYOK4N1ep3fGl/MFmHvfBnP3qGtczclC+Ooltwwk+xCM8EmNA1Uf5+flETK6eMuACL+6RTBhXHIBxw7hBVKhIGXJDlY2dZrWbZdUWMyraKp0pLrtFw0L8c1RC7UoQ7Z7u8mYhmI4ZIsarni90cXDZOFar7HwQNypWoQIlInQUynG17HVx7Bf9UYMByLdo8/67TSbCdm3Ui5VLVi5kA0mC/nB7/haGyGZAr37BueDbyJlirq6QbLXnLT9yhgwAyQ7GPWdZsnYecGT3Q4IVwWS+Y9LYtX4SPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=3HFBiKvAkvSPtlDwub+iokIY8WsC3O29+8hXTxCMe+E=;
 b=hrHjeeOfWhhxvHYalu5LL+yVlGLZOgpaAZwyYaIQ4VsTp0Lc7RSH60AKw42u5yppbHjZ5UAVrmxUJGe8VOIofUpYd9p6ruvayNUzbiRYt2sAUJphMAJAaKoHGQiwHtq217GFIf9Q+lI2W5a7O0tNWOdkCIwkXvtxzXtM4Bs+x03jGDxNIIkbjhAf+EYUm7kfsuXnOq/Fm2d5mBlvcUAoF/o4krYryWPFVBjO6VqS7pXzrTjZKA7mQdtHr0HMJo0pbjEHM3QvVd9dEAnnuWwoC/ZonWpOTQ0KxNzOA/sEqbnxCAYycg2MaySotz2hscqF0AyyzGCt0QvFWPPdkG+A0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HFBiKvAkvSPtlDwub+iokIY8WsC3O29+8hXTxCMe+E=;
 b=VvpcsJvPjcrGx8FeHyMxpViBiuMVV+BOnsfrnGjbQ5mFnjRUAFwbyR6sviPbURr5GIbrbnYmLnWdRDZVRIHZ5ap/2gbJhk25qz3uY41oka/GGQ6Yrg63XHCYK23SP+ddA1oOIsJLz5tPDw5Fni87AfuMGsaOWP+SfWBwxCWHbIc=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB5106.namprd10.prod.outlook.com (2603:10b6:208:30c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Mon, 27 Sep
 2021 13:53:05 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::756a:e7ee:b7ae:c92]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::756a:e7ee:b7ae:c92%6]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 13:53:05 +0000
From: Jag Raman <jag.raman@oracle.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH] hw/remote/proxy: Categorize Wireless devices as 'Network'
 ones
Thread-Topic: [PATCH] hw/remote/proxy: Categorize Wireless devices as
 'Network' ones
Thread-Index: AQHXsxPR4kgS2zcc20+QEyCy+iTKdau359WA
Date: Mon, 27 Sep 2021 13:53:05 +0000
Message-ID: <B18831A8-384F-473E-A6FB-D0CE7D720BDC@oracle.com>
References: <20210926201926.1690896-1-f4bug@amsat.org>
In-Reply-To: <20210926201926.1690896-1-f4bug@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44506f5e-34c3-4607-67fa-08d981be21a9
x-ms-traffictypediagnostic: BLAPR10MB5106:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BLAPR10MB510649C12B01B68EDC9E2AFA90A79@BLAPR10MB5106.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:541;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4vmdy5OovGf+B1L8ZvoaV++FOayXHEmi6n/8h601sDzGTlC6cvYzSUMdPI6gbJ3JymosDhNFl0Ieq+HyHZLJuFrfL5uILGJHwJQDbAu6VLsMDz44PiR/qt37rk4121UmiVY25IpoqmliZiIDgWEF/bNPNQ1VY6n/v/sKV95ZnySfhJMNWF+2a/S7q1X1JBvdHOJGF3z2sv6keG6fhaeMc9w1oSk+LNQ9JcVB9Ll8ypy3Q9F+F0ukmohjvzDE3Vf+ZzTVsRWAawM8IfwWAeSKUSmY6xEoedoyVySBgV8jzFn73p6wT/CcCdhH/s+eF/V3oKparuNsTIvMjAjjyyRYYa/Ib0FuOFfjBr11qXPZgG0lITgyq3eq4Zf9HlrKk5zPeCrVRxkc8+034emk5ILPivgEHTbbn9M4xNcZHyWilsHVvV2ojc+a+f3EGtUxj0daeJ/CVn9lnSi527DJzYtYrGQbEUYDokt++qzVMmmcMuf3OiF88FvygGCpALRZ2Kt9yD691Hyt/UKrA7ItJLexHL6pTgj1LL9L4u0TBq0a2zZJckIrs/0ouIIIQLqN98qXoRbVjoN+J6NTo9nS6hvg5pZ8wfFFGWHrt0hCAUPHxOMvnlm3+GEY5NN44O+T1G2OtIfLoExg4rMAnoWKr1bNZP66LyoCCFyvnPy/fBmws7m0v5cdjukoymQAmA7orR6G6jGyqt49v5zRqXjjs802ROBnxPyMSPuIXbtWmFdnn4h/Bl4qX/TqovaePnCjntzM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(44832011)(53546011)(4326008)(54906003)(508600001)(71200400001)(36756003)(64756008)(66556008)(86362001)(66446008)(2616005)(66946007)(6916009)(33656002)(2906002)(66476007)(91956017)(76116006)(107886003)(8936002)(6512007)(38070700005)(5660300002)(316002)(122000001)(8676002)(4744005)(6506007)(6486002)(38100700002)(186003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmZIZi9xZ3EzbmtMTmFqaFpHR203bWliZVhtdFBpd25oQmRQVmdvTWpYYWsr?=
 =?utf-8?B?S3dsaXJJQmlSNXRLZmQ3YmxSYUsrR3Y1U0MzVElTL1BhVFFmNk9aK003blpo?=
 =?utf-8?B?ekZnRHpEMm5vWUR5b1lFN0ZIN014Uy8zMXprUU92YmVZd0VXUHRodHo1RUJL?=
 =?utf-8?B?R0V6UVVZZ28renlEaFJxQTE0eDhQRlFCWlZOOFEyWGtTYmxWZ3FSYWZ0a05l?=
 =?utf-8?B?MDNFY01mNm9GaEJuV3JhZSt5a3g1d3dyWkxFWWpsZ0cwbm5XWHZMRHBxb25O?=
 =?utf-8?B?Zm9RV29LQUxGUklUNDZ5RUpKNjU0WnU2YlVsZzdzUzBKbGxXN1FpTXpNeUNN?=
 =?utf-8?B?QVAvN0EwMkg5a1FqczNqcVltQmlnMHlsUVRPSE0rRlZXbC9abCtMbzF1bFFs?=
 =?utf-8?B?cmFGeGZaQ0NoYjd3U1NLTUN6c3FhZCtIZURIZnRpUlF3K0w0WnNyZlB2WlNC?=
 =?utf-8?B?SmVnMGpaWkdrU2hpRVA4eGk4OWZMRjNqeitvRjE4Y1dWZW9WRjBkTU1aakpx?=
 =?utf-8?B?VnRWSU1zaTc0Q09aNkxhbjJETXlLcVlPWFg5U2JtR1hGSkJzL3IycExhMWN6?=
 =?utf-8?B?eVVma1N1NWY0OVVxVll4YXhNcXJnVnBqdVlsZ2JZMVVQZzRTbjF2Skk0S0F1?=
 =?utf-8?B?c3hscWd0VHdXVkhObmh4NXBHazJJdHRQM3Yycy91ejZsc1diWll0VFArV2ps?=
 =?utf-8?B?aGswTEYvMlltODZ6Nnk1UnQ1c0orTFBUTVNJN1JldGg1LzZ2YXBXWGlHQ3V5?=
 =?utf-8?B?Y2FBR3hRMnNOMFdvYnJXS2xLakJmY3JXMUdOSjVVajlRRUU1UHVzSWtjNHN6?=
 =?utf-8?B?b3NVZVpxL280cFI2Qjc4RlE4Z09obzBCc2toVHFPVkpSdUZ4eXdPUXFrZEpF?=
 =?utf-8?B?WFA1QVVEU256ZURqcjNOanJWb096RWFleW43SnFPb1lOdjk0T1orY2Q1ZWtz?=
 =?utf-8?B?WS92a0VvQ3p2b3BEeUVOQS9KOU1MNWg0dUNoNFRwQVNMc0J3eXZFNy9TZ0Rq?=
 =?utf-8?B?TG1lVUJISGUwbWpsbnd1L1IzbVoyeGQxS0thVE5GbHJzZnNKb09iWXFsVE9N?=
 =?utf-8?B?QWtmNGJwVzBGdnJ6Ly9JZnJVL3IyYUdPQ0g5V0VPYkhlVWRocXB0cUVoa2kz?=
 =?utf-8?B?WjNNSlE3dlNZUFBwSEdoWHpSdXZNNGpDeEs3NnI2WVVlKzV1VFZaQWc0Q1pY?=
 =?utf-8?B?QlZObUc3WXQ5UUI0WDl1eTAweXdkUHBlYkpmWkV3RVoxUzdZZloxa0p1NGlF?=
 =?utf-8?B?WGJ6c3BvNlV1MDk0U1NBNSs0T2NqR1ZSb3NnQ3hWRW1rOTNmditFWk5PWUpO?=
 =?utf-8?B?Tzg1VWlEbWZHc0ZZblI0KzBabkpRZEhxTG9EM21mUUhJZjh3a3FVeGRORCtK?=
 =?utf-8?B?bkZ2MXlERUlrRmJjOXY0Y0gwUmUyV29CQzJNSVBBT1kwZk0zMExxd3NqdVFo?=
 =?utf-8?B?bHp6SC8wTjBTVzVIc2JrcVF0elgxNHJqall3OVlWTCt5cW16U0lZaC9XdzRp?=
 =?utf-8?B?KyttTkpXMlZwVHUwU2VwNnBua1JtaUJGWElnWmdXWmwvd0FoQWhwUU5VbTVl?=
 =?utf-8?B?eCtaQ09CZE1tRXJlY01zSWVzVkRrZUdCRE1kbWNUcmlVdVhUK3JlNkUzdzVV?=
 =?utf-8?B?aDVaYlNNcVB5U3RWOHQrTDdNa3QxeHlIUkFqQW9SUWxhVHlIWHBzYWJBblJv?=
 =?utf-8?B?TFZ5ckpGQ1k1SHRsR0NXdW9mOGpvdmJjYWdTb2l3WjR6UnY5anlhZWsydk9W?=
 =?utf-8?B?bC9RRGFjVDBWSFh3eWVxb1ZseHgwazVmcHI0RFptb1U0OWRocks5S1Rwa0Zn?=
 =?utf-8?Q?RND80Icvm5V1ktXiiGhv0GTJ3EzZ4w8DkCYag=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A2454DA14BD622449377178B52C84C12@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44506f5e-34c3-4607-67fa-08d981be21a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2021 13:53:05.7056 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WIONecrsF1Y955UeXIxyCXwXhdLN5/CNoNP35+0K61RpINJOllVCFtfqqbX8kCqU76BY1dlKXnBIg3+c5k8aBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5106
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10120
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2109270095
X-Proofpoint-ORIG-GUID: rlQXxVJS9iEJCX5eNjO1cEFOCVvkVyrF
X-Proofpoint-GUID: rlQXxVJS9iEJCX5eNjO1cEFOCVvkVyrF
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 John Johnson <john.g.johnson@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gU2VwIDI2LCAyMDIxLCBhdCA0OjE5IFBNLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSA8ZjRidWdAYW1zYXQub3JnPiB3cm90ZToNCj4gDQo+IFFFTVUgZG9lc24ndCBkaXN0aW5jdCBu
ZXR3b3JrIGRldmljZXMgcGVyIGxpbmsgbGF5ZXIgKEV0aGVybmV0LA0KPiBXaS1GaSwgQ0FOLCAu
Li4pLiBDYXRlZ29yaXplIFBDSSBXaXJlbGVzcyBjYXJkcyBhcyBOZXR3b3JrDQo+IGRldmljZXMu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdAYW1z
YXQub3JnPg0KDQpSZXZpZXdlZC1ieTogSmFnYW5uYXRoYW4gUmFtYW4gPGphZy5yYW1hbkBvcmFj
bGUuY29tPg0KDQo+IC0tLQ0KPiBody9yZW1vdGUvcHJveHkuYyB8IDEgKw0KPiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9ody9yZW1vdGUvcHJveHku
YyBiL2h3L3JlbW90ZS9wcm94eS5jDQo+IGluZGV4IDQ5OWY1NDBjOTQ3Li5iYWQxNjQyOTlkZCAx
MDA2NDQNCj4gLS0tIGEvaHcvcmVtb3RlL3Byb3h5LmMNCj4gKysrIGIvaHcvcmVtb3RlL3Byb3h5
LmMNCj4gQEAgLTMyNCw2ICszMjQsNyBAQCBzdGF0aWMgdm9pZCBwcm9iZV9wY2lfaW5mbyhQQ0lE
ZXZpY2UgKmRldiwgRXJyb3IgKiplcnJwKQ0KPiAgICAgICAgIHNldF9iaXQoREVWSUNFX0NBVEVH
T1JZX1NUT1JBR0UsIGRjLT5jYXRlZ29yaWVzKTsNCj4gICAgICAgICBicmVhazsNCj4gICAgIGNh
c2UgUENJX0JBU0VfQ0xBU1NfTkVUV09SSzoNCj4gKyAgICBjYXNlIFBDSV9CQVNFX0NMQVNTX1dJ
UkVMRVNTOg0KPiAgICAgICAgIHNldF9iaXQoREVWSUNFX0NBVEVHT1JZX05FVFdPUkssIGRjLT5j
YXRlZ29yaWVzKTsNCj4gICAgICAgICBicmVhazsNCj4gICAgIGNhc2UgUENJX0JBU0VfQ0xBU1Nf
SU5QVVQ6DQo+IC0tIA0KPiAyLjMxLjENCj4gDQoNCg==

