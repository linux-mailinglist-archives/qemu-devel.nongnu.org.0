Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10754661300
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 03:15:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pELBS-0008Dg-Th; Sat, 07 Jan 2023 21:13:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <taisei1212@outlook.jp>)
 id 1pELBQ-0008DS-A4
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:13:12 -0500
Received: from mail-tyzapc01olkn20800.outbound.protection.outlook.com
 ([2a01:111:f403:704b::800]
 helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <taisei1212@outlook.jp>)
 id 1pELBK-0006h4-3m
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:13:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khd4w2Dnv46z89d5gePY/v8rQBSwqXk28bxeE3P9nevkIfs3bwlMOQByDaKlidfEbZM3aZ/fj773Ed/gdepaT+Y71kKQAcSe4h6xUOtl/3jovCA7My5QTXt7WSSGVfItbx7UhJdasd3fsy+5ZZ1V24wXg8mBOTK6HTK67R3GOyMGx4gBtO8RMEKSjAeVjHV+1XkZzOO5m7Gn+EJDplJpdcp7I5gIh5pUeNhpvMeeVQb3RQxjWBLEJJZbKrGr3RpxtGXfThtdXrg68P6YcMOE+IAdxafYplRH2dKs2wKuuCntEdcq+xJZfWe+1Yow0B8fUBJM2ZUVdTn6Kv7ZFhGofg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqiw4scVSeXX+ja8CmX5l3xRnXGNKWFe5avJwNqLtYc=;
 b=kt3qcs+cL4oGMGO6NLGJza29NukiwGc5omR64fDe8RlKGZ12u3ZcBkuVzWIymhjAMeOrFQD0rS1jCIKbk39gftIgT1WUJbORelpWs5AlOED/k+yPmS2jx9V4qfPtgUbHDgTHQgNe2pZ/TwZqieZxSiAWAEIoRU8jatOcA/QibBe9M7pHSbxq4K8T4jU7O5RjFuP3qdGlftZegY5gqr+6teoV7CIsQWof17XmbyaqIr7dCI5hjFMyJkGYWIH36oHYXPhdNyenUljVuNJkpYQqjoxlGh8vSINPPSNKd1Etj+l+KsHkrFu9XrrSLfjKQ+sXZeBFGFZ3VWzTQiOR8a6hwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b0::11) by SG2PR01MB3642.apcprd01.prod.exchangelabs.com
 (2603:1096:0:12::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Sun, 8 Jan
 2023 02:07:56 +0000
Received: from TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 ([fe80::56db:1c2:8886:e624]) by
 TY0PR0101MB4285.apcprd01.prod.exchangelabs.com ([fe80::56db:1c2:8886:e624%4])
 with mapi id 15.20.5944.019; Sun, 8 Jan 2023 02:07:56 +0000
From: =?gb2312?B?0sHM2SDMq8fl?= <taisei1212@outlook.jp>
To: =?gb2312?B?QWxleCBCZW5uqKZl?= <alex.bennee@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: RE: [PATCH v2] [PING] target/i386/gdbstub: Fix a bug about order of
 FPU stack in 'g' packets.
Thread-Topic: [PATCH v2] [PING] target/i386/gdbstub: Fix a bug about order of
 FPU stack in 'g' packets.
Thread-Index: AQHZIjd0R5v304xK7kqp+n1sYp913K6SvXwAgAEJZJE=
Date: Sun, 8 Jan 2023 02:07:56 +0000
Message-ID: <TY0PR0101MB4285AC0905312A82102F3348A4F99@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
References: <TY0PR0101MB4285923FBE9AD97CE832D95BA4E59@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
 <TY0PR0101MB4285AD60FE3976F1AD5C6D02A4F89@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
 <87zgau1wgc.fsf@linaro.org>
In-Reply-To: <87zgau1wgc.fsf@linaro.org>
Accept-Language: ja-JP, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [Q470BHt4hhfoMH4NV2K/+gAdis0KMHX/]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR0101MB4285:EE_|SG2PR01MB3642:EE_
x-ms-office365-filtering-correlation-id: b718d8fa-3422-4932-2efa-08daf11d28b7
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xv/h6kJUH9qp5I60Qo4HhhwUJHh9ioCe59F6KgbU9WFjqCxl/NfSiPOHRPU0t1vesAnp2PCqTlGWAalJhkdnRCHDV/bvOkFCIrzMC1lD1xvuS4LQ5zQzDiPEdUpbw6CyIECMFOxHFFa9GSOHr8H1GLKmeyCchUWqMa54I0lJkbNv8wXEqRlhPtXnZw30+ozgc11F1e5NoBBuIRWK6GYPNlF6BfoBYUU2A0RaTmF+SQ7+45P3ziX3dfvDcerOkzaSNRT5qk8V77/GIMonHrsOy2nixFZTxwXZFDgNSkEqPoneQP7/QMqyUgEYf/e+J8X4j+cY/+Osj1RBYT28py6JRlte8yLlDMRXncX0y+P8W0nin13ZMAeuQdR2hOyuejjRnqhE5Wofwa3M9/JYCmUtex6Cld94hHwUe9gN3cIjlOatemjGCbVDbPfgHYsGIVJmQoz0eFCiQPxOJ/hs+DFRFCQ4kVRHsRUG2G8Dhz/J5Xc30/4A4LXXBzsUN8sHDwQ5fPg7mw1feNAeoMfTV3W4nlGhOS1B+7zwNCLeKnVOSTRjRbjqLs6twg5MX7ZM8xYRIoc2vPMDsFEb0hVx7NVtIB8hDB+WSKUjun/c9BVEq3Ps3huwT/SxKfir+gaJyqjSiZqwTL+c8w6/bLAf6VFa+Yp7hUpoHP0+PbkDV1I5dho=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?OE9MZ2o1YlNFTUU0S2w4TmZLamtvRmwyWTd6RmUwS0pMcTNwaUpWODJPODF1?=
 =?gb2312?B?Zktvaysvc1pqNHNEQTl3SjJ0QmpZSW1VQnQ3Z2ZuY29sMWpuaEdaTWMwdHc2?=
 =?gb2312?B?TDRVandDYVZ0QWEyNFlHdm93WHZtTDY0c2dNaXMvM003akFCeGRCUzBFcTBZ?=
 =?gb2312?B?MExsbGZVRzMreHFZZFFNbDFaazQ3TEtyd3J2eW5ldS80ejkzZXRZTHhsNW0r?=
 =?gb2312?B?QndOaW5FQmV1cWZvUHFaTGxHR3pTcDFnbldRZE9GaDZ3OHpBdzZwbHZ2NHp3?=
 =?gb2312?B?V2hmSWlFQjQ3YnliMnc0Y1pDOWZTSTI0aHdZOHJERzBHZjBmTDhmc0ljVVdp?=
 =?gb2312?B?SE1zS1dwTnRUVkZ6OGhiNHp2eXExOHZpTkdPM05maWMzdDhDSHNPalFOZ3pr?=
 =?gb2312?B?bVd5RDdFTDBGYWlHV1hOZGZDakw0K2RnT2hGU0dPN1B1QmtsVlZaNUxGaWZY?=
 =?gb2312?B?TlRmTXF0bVFPMGgyV1NCZEJHRjZMSkZWRzlvT0tpbGpBZ3d5c01HeUhPYWg5?=
 =?gb2312?B?cDJzOXFkTVdTWjdUT2FGb3N5RWRjV09MYVJOOVh3YXI2UzdydUI5Y3lnUXFT?=
 =?gb2312?B?T3R4VmVJTU4rY3Rwb25YNFBLb0VCaU9wZ25SWlJtT28rTTdQNmZ4NmFDQjlN?=
 =?gb2312?B?VDVPVzFGcGxZc29HUjU2RE1RRUNuZ0xhV2RRRjRBVThWYkFycStLcjk3U0Ir?=
 =?gb2312?B?SnlYNDhsVHplUlN1eHd5OTVPd3RiMHQ4NTNib2pxdG55RldQTTNDN3hOc2wz?=
 =?gb2312?B?ZW53cmJVLzlDem94Zmk2N1hmaklKdVEzaC9MTzZlbXNlQzFSV21CaGxiU3BH?=
 =?gb2312?B?SHF4VGRjdzNzMlE1eUJDaVBOUCtSUkRGbzNwMDRvd0gxOWY0SXM1WThWODJZ?=
 =?gb2312?B?d2ZVdHUwSzZ2Q3lhUFVFQStkNTFxWnNrRVQ3YjhEUFBYQVEzWStNM1VZaXdy?=
 =?gb2312?B?NW16RU16eUlGV3lDRktCZlFJd2QrQ3pKQnhMR1A3bEl1QnZJWlRKbFBRdGJ6?=
 =?gb2312?B?UkpYUXJZR0hJSWVqYjMxU2R6c3ZqdDRVYzFONi9teXJJeDZqMXFVTnNBTCtj?=
 =?gb2312?B?RkI1WDhpNlExQkhXY2JJSm9kMDVkaWJNdUI0NzI0K3Vja1JkMlcxenlxOEk1?=
 =?gb2312?B?WCtBYzJRVmdDR1VYdldudnIyamFQQXdiYld2bFJTWHZpZSt6dW12NWVOT0lT?=
 =?gb2312?B?ZEV5SHBrMkNacWx5U05scFZPdWYwaTFONXpia0hRdi9NT2NlUlZUYW5CNzJQ?=
 =?gb2312?B?YytKWTRJam15QlVQRXgwNzZUbU1SWjZLTDJnSFFLZ25rWVR1R05QWmNSMzJ5?=
 =?gb2312?B?bGlNaFhra2IwYlpxVkMrSE12KzNZbGJtdExVdkRwNDJ2RlBHUndxR1plaVBW?=
 =?gb2312?B?azZtdGhBWEwvYkVvTmp4WVhGLzJ2MFlHWGVoT3dEUmJOTk1ScEJQLzZSTE5z?=
 =?gb2312?B?OHI4QWw2QWw3WnFndFQ2U3BoZjRWalM1REFJdnhkUXZpVUNMRXJiZjIxQmZ5?=
 =?gb2312?B?dmxNM21WOFdDQmxwcjZTbVpNSC82bzVjcEx2ZlBTVDkrQUhNYzVSYnA1dmFC?=
 =?gb2312?B?WnBrS21td09WbVlrOVhpNFBaUWZmbFJ3ZXB4RWZob1RVMFFsZzc5WkJsY0s3?=
 =?gb2312?B?VS8rVjJxczNsb240MTQ3WDBkcHpBRTlqZ1ZGT2RWNUNubmZ0ZHVScEVhK2Zj?=
 =?gb2312?B?eCsyUWZDdDlMSUtlNUVTdEpNWU95V1hNWTFKRk9NYjFHZGZ1Q2ZQcWRvMGZ3?=
 =?gb2312?Q?SoD2YlWpwUO4Pv5uTo=3D?=
Content-Type: multipart/alternative;
 boundary="_000_TY0PR0101MB4285AC0905312A82102F3348A4F99TY0PR0101MB4285_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-d8e84.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b718d8fa-3422-4932-2efa-08daf11d28b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2023 02:07:56.5474 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR01MB3642
Received-SPF: pass client-ip=2a01:111:f403:704b::800;
 envelope-from=taisei1212@outlook.jp;
 helo=APC01-TYZ-obe.outbound.protection.outlook.com
X-Spam_score_int: 40
X-Spam_score: 4.0
X-Spam_bar: ++++
X-Spam_report: (4.0 / 5.0 requ) BAYES_00=-1.9, CHARSET_FARAWAY_HEADER=3.2,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 MIME_CHARSET_FARAWAY=2.45, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

--_000_TY0PR0101MB4285AC0905312A82102F3348A4F99TY0PR0101MB4285_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

VGhhbmsgeW91IGZvciB5b3VyIHJlcGx5Lg0KDQpNeSBmaXJzdCBwYXRjaCBpcyBhbHJlYWR5IG1l
cmdlZCBhcyBhIGNvbW1pdCA3NWFjMjMxYzY3Y2RiMTNmMDYwOTk0M2ZhYjU0OTk5NjM4NThiNTg3
IGJ5IFBhb2xvLg0KQnV0IGl0IHNlZW1zIG15IHNlY29uZCBwYXRjaCBpc24ndCBtZXJnZWQgeWV0
Lg0KSWYgUGFvbG8gb3Igc29tZW9uZSBlbHNlIHBsYW5zIHRvIG1lcmdlIGl0LCBpdCdzIG5vIHBy
b2JsZW0uDQpUaGlzIGlzIGp1c3QgYSBwaW5nIHRvIHRoZSBzZWNvbmQgcGF0Y2guIE5vdCBhIG5l
dyBmaXguDQoNCi0tLS0tIExpc3Qgb2YgbXkgcGF0Y2hlcy4gLS0tLS0NCg0KVGhlIGJlbG93IGlz
IG15IGZpcnN0IHBhdGNoIGFscmVhZHkgbWVyZ2VkIGFzIGEgY29tbWl0IDc1YWMyMzFjNjdjZGIx
M2YwNjA5OTQzZmFiNTQ5OTk2Mzg1OGI1ODcgYnkgUGFvbG8uDQpodHRwczovL3BhdGNoZXcub3Jn
L1FFTVUvVFkwUFIwMTAxTUI0Mjg1RjYzNzIwOTA3NUM5RjY1RkNEQTZBNDQ3OUBUWTBQUjAxMDFN
QjQyODUuYXBjcHJkMDEucHJvZC5leGNoYW5nZWxhYnMuY29tLw0KDQpUaGUgYmVsb3cgaXMgbXkg
c2Vjb25kIHBhdGNoLg0KaHR0cHM6Ly9wYXRjaGV3Lm9yZy9RRU1VL1RZMFBSMDEwMU1CNDI4NTU5
MjVEODQxNEU0NzczRDZGQTM2QTQxRDlAVFkwUFIwMTAxTUI0Mjg1LmFwY3ByZDAxLnByb2QuZXhj
aGFuZ2VsYWJzLmNvbS8NCg0KVGhlIGJlbG93IGlzIG15IHNlY29uZCBwYXRjaCBmaXhlZCBhY2Nv
cmRpbmcgdG8gUmljaGFyZCdzIHJldmlldy4NCmh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS9UWTBQ
UjAxMDFNQjQyODU5MjNGQkU5QUQ5N0NFODMyRDk1QkE0RTU5QFRZMFBSMDEwMU1CNDI4NS5hcGNw
cmQwMS5wcm9kLmV4Y2hhbmdlbGFicy5jb20vDQoNClRoZSBiZWxvdyBpcyBwaW5nIHRvIGZpeGVk
IHNlY29uZCBwYXRjaC4NClRoaXMgaXMganVzdCBhIHBpbmcuIE5vdCBhIG5ldyBmaXguDQpodHRw
czovL3BhdGNoZXcub3JnL1FFTVUvVFkwUFIwMTAxTUI0Mjg1QUQ2MEZFMzk3NkYxQUQ1QzZEMDJB
NEY4OUBUWTBQUjAxMDFNQjQyODUuYXBjcHJkMDEucHJvZC5leGNoYW5nZWxhYnMuY29tLw0KDQot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNClRoYW5rcy4NCg0KVGFpc2VpDQoNClNl
bnQgZnJvbSBNYWlsPGh0dHBzOi8vZ28ubWljcm9zb2Z0LmNvbS9md2xpbmsvP0xpbmtJZD01NTA5
ODY+IGZvciBXaW5kb3dzDQoNCkZyb206IEFsZXggQmVubqimZTxtYWlsdG86YWxleC5iZW5uZWVA
bGluYXJvLm9yZz4NClNlbnQ6IFNhdHVyZGF5LCBKYW51YXJ5IDcsIDIwMjMgNzoxNiBQTQ0KVG86
IFRhaXNlaUl0bzxtYWlsdG86dGFpc2VpMTIxMkBvdXRsb29rLmpwPg0KQ2M6IHFlbXUtZGV2ZWxA
bm9uZ251Lm9yZzxtYWlsdG86cWVtdS1kZXZlbEBub25nbnUub3JnPjsgcmljaGFyZC5oZW5kZXJz
b25AbGluYXJvLm9yZzxtYWlsdG86cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz47IFBhb2xv
IEJvbnppbmk8bWFpbHRvOnBib256aW5pQHJlZGhhdC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENI
IHYyXSBbUElOR10gdGFyZ2V0L2kzODYvZ2Ric3R1YjogRml4IGEgYnVnIGFib3V0IG9yZGVyIG9m
IEZQVSBzdGFjayBpbiAnZycgcGFja2V0cy4NCg0KDQpUYWlzZWlJdG8gPHRhaXNlaTEyMTJAb3V0
bG9vay5qcD4gd3JpdGVzOg0KDQo+IFRoaXMgaXMgYSBwaW5nIHRvIHRoZSBwYXRjaCBiZWxvdy4N
Cj4NCj4gaHR0cHM6Ly9wYXRjaGV3Lm9yZy9RRU1VL1RZMFBSMDEwMU1CNDI4NTU5MjVEODQxNEU0
NzczRDZGQTM2QTQxRDlAVFkwUFIwMTAxTUI0Mjg1LmFwY3ByZDAxLnByb2QuZXhjaGFuZ2VsYWJz
LmNvbS8NCj4NCj4gQmVmb3JlIHRoaXMgY29tbWl0LCB3aGVuIEdEQiBhdHRhY2hlZCBhbiBPUyB3
b3JraW5nIG9uIFFFTVUsIG9yZGVyIG9mIEZQVQ0KPiBzdGFjayByZWdpc3RlcnMgcHJpbnRlZCBi
eSBHREIgY29tbWFuZCAnaW5mbyBmbG9hdCcgd2FzIHdyb25nLiBUaGVyZSB3YXMgYQ0KPiBidWcg
Y2F1c2luZyB0aGUgcHJvYmxlbSBpbiAnZycgcGFja2V0cyBzZW50IGJ5IFFFTVUgdG8gR0RCLiBU
aGUgcGFja2V0cyBoYXZlDQo+IHZhbHVlcyBvZiByZWdpc3RlcnMgb2YgbWFjaGluZSBlbXVsYXRl
ZCBieSBRRU1VIGNvbnRhaW5pbmcgRlBVIHN0YWNrDQo+IHJlZ2lzdGVycy4gVGhlcmUgYXJlIDIg
d2F5cyB0byBzcGVjaWZ5IGEgeDg3IEZQVSBzdGFjayByZWdpc3Rlci4gVGhlIGZpcnN0DQo+IGlz
IHNwZWNpZnlpbmcgYnkgYWJzb2x1dGUgaW5kZXhlZCByZWdpc3RlciBuYW1lcyAoUjAsIC4uLiwg
UjcpLiBUaGUgc2Vjb25kDQo+IGlzIHNwZWNpZnlpbmcgYnkgc3RhY2sgdG9wIHJlbGF0aXZlIGlu
ZGV4ZWQgcmVnaXN0ZXIgbmFtZXMgKFNUMCwgLi4uLCBTVDcpLg0KPiBWYWx1ZXMgb2YgdGhlIEZQ
VSBzdGFjayByZWdpc3RlcnMgc2hvdWxkIGJlIGxvY2F0ZWQgaW4gJ2cnIHBhY2tldCBhbmQgYmUN
Cj4gb3JkZXJlZCBieSB0aGUgcmVsYXRpdmUgaW5kZXguIEJ1dCBRRU1VIGhhZCBsb2NhdGVkIHRo
ZXNlIHJlZ2lzdGVycyBvcmRlcmVkDQo+IGJ5IHRoZSBhYnNvbHV0ZSBpbmRleC4gQWZ0ZXIgdGhp
cyBjb21taXQsIHdoZW4gUUVNVSByZWFkcyByZWdpc3RlcnMgdG8gbWFrZQ0KPiBhICdnJyBwYWNr
ZXQsIFFFTVUgc3BlY2lmaWVzIEZQVSBzdGFjayByZWdpc3RlcnMgYnkgdGhlIHJlbGF0aXZlIGlu
ZGV4Lg0KPiBUaGVuLCB0aGUgcmVnaXN0ZXJzIGFyZSBvcmRlcmVkIGNvcnJlY3RseSBpbiB0aGUg
cGFja2V0LiBBcyBhIHJlc3VsdCwgR0RCLA0KPiB0aGUgcGFja2V0IHJlY2VpdmVyLCBjYW4gcHJp
bnQgRlBVIHN0YWNrIHJlZ2lzdGVycyBpbiB0aGUgY29ycmVjdCBvcmRlci4NCj4NCj4gU2lnbmVk
LW9mZi1ieTogVGFpc2VpSXRvIDx0YWlzZWkxMjEyQG91dGxvb2suanA+DQo+IC0tLQ0KPiAgdGFy
Z2V0L2kzODYvZ2Ric3R1Yi5jIHwgNCArKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS90YXJnZXQvaTM4Ni9nZGJz
dHViLmMgYi90YXJnZXQvaTM4Ni9nZGJzdHViLmMNCj4gaW5kZXggYzNhMmNmNmYyOC4uNzg2OTcx
Mjg0YSAxMDA2NDQNCj4gLS0tIGEvdGFyZ2V0L2kzODYvZ2Ric3R1Yi5jDQo+ICsrKyBiL3Rhcmdl
dC9pMzg2L2dkYnN0dWIuYw0KPiBAQCAtMTIxLDcgKzEyMSw5IEBAIGludCB4ODZfY3B1X2dkYl9y
ZWFkX3JlZ2lzdGVyKENQVVN0YXRlICpjcywgR0J5dGVBcnJheSAqbWVtX2J1ZiwgaW50IG4pDQo+
ICAgICAgICAgICAgICByZXR1cm4gZ2RiX2dldF9yZWczMihtZW1fYnVmLCBlbnYtPnJlZ3NbZ3By
X21hcDMyW25dXSk7DQo+ICAgICAgICAgIH0NCj4gICAgICB9IGVsc2UgaWYgKG4gPj0gSURYX0ZQ
X1JFR1MgJiYgbiA8IElEWF9GUF9SRUdTICsgOCkgew0KPiAtICAgICAgICBmbG9hdHg4MCAqZnAg
PSAoZmxvYXR4ODAgKikgJmVudi0+ZnByZWdzW24gLSBJRFhfRlBfUkVHU107DQo+ICsgICAgICAg
IGludCBzdF9pbmRleCA9IG4gLSBJRFhfRlBfUkVHUzsNCj4gKyAgICAgICAgaW50IHJfaW5kZXgg
PSAoc3RfaW5kZXggKyBlbnYtPmZwc3R0KSAlIDg7DQo+ICsgICAgICAgIGZsb2F0eDgwICpmcCA9
ICZlbnYtPmZwcmVnc1tyX2luZGV4XS5kOw0KPiAgICAgICAgICBpbnQgbGVuID0gZ2RiX2dldF9y
ZWc2NChtZW1fYnVmLCBjcHVfdG9fbGU2NChmcC0+bG93KSk7DQo+ICAgICAgICAgIGxlbiArPSBn
ZGJfZ2V0X3JlZzE2KG1lbV9idWYsIGNwdV90b19sZTE2KGZwLT5oaWdoKSk7DQo+ICAgICAgICAg
IHJldHVybiBsZW47DQoNCkknbSBzb3JyeSBJIHRob3VnaCBQYW9sbyBoYWQgYWxyZWFkeSBncmFi
YmVkIHRoaXMsIG9yIGlzIHRoaXMgYSBzZWNvbmQNCmZpeCB0byB0aGUgRlAgaGFuZGxpbmc/DQoN
Ci0tDQpBbGV4IEJlbm6opmUNClZpcnR1YWxpc2F0aW9uIFRlY2ggTGVhZCBAIExpbmFybw0KDQo=

--_000_TY0PR0101MB4285AC0905312A82102F3348A4F99TY0PR0101MB4285_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:"Yu Gothic";
	panose-1:2 11 4 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@Yu Gothic";
	panose-1:2 11 4 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:99.25pt 85.05pt 85.05pt 85.05pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Thank you for your reply.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">My first patch is already merged as a commit 75ac231=
c67cdb13f0609943fab5499963858b587 by Paolo.</p>
<p class=3D"MsoNormal">But it seems my second patch isn't merged yet.</p>
<p class=3D"MsoNormal">If Paolo or someone else plans to merge it, it's no =
problem.</p>
<p class=3D"MsoNormal">This is just a ping to the second patch. Not a new f=
ix.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">----- List of my patches. -----</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The below is my first patch already merged as a comm=
it 75ac231c67cdb13f0609943fab5499963858b587 by Paolo.</p>
<p class=3D"MsoNormal">https://patchew.org/QEMU/TY0PR0101MB4285F637209075C9=
F65FCDA6A4479@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com/</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The below is my second patch.</p>
<p class=3D"MsoNormal">https://patchew.org/QEMU/TY0PR0101MB42855925D8414E47=
73D6FA36A41D9@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com/</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The below is my second patch fixed according to Rich=
ard's review.</p>
<p class=3D"MsoNormal">https://patchew.org/QEMU/TY0PR0101MB4285923FBE9AD97C=
E832D95BA4E59@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com/</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The below is ping to fixed second patch.</p>
<p class=3D"MsoNormal">This is just a ping. Not a new fix.</p>
<p class=3D"MsoNormal">https://patchew.org/QEMU/TY0PR0101MB4285AD60FE3976F1=
AD5C6D02A4F89@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com/</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">-------------------------------</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Taisei</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Sent from <a href=3D"https://go.microsoft.com/fwlink=
/?LinkId=3D550986">
Mail</a> for Windows</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0in 0in 0in">
<p class=3D"MsoNormal" style=3D"border:none;padding:0in"><b>From: </b><a hr=
ef=3D"mailto:alex.bennee@linaro.org">Alex Benn=A8=A6e</a><br>
<b>Sent: </b>Saturday, January 7, 2023 7:16 PM<br>
<b>To: </b><a href=3D"mailto:taisei1212@outlook.jp">TaiseiIto</a><br>
<b>Cc: </b><a href=3D"mailto:qemu-devel@nongnu.org">qemu-devel@nongnu.org</=
a>; <a href=3D"mailto:richard.henderson@linaro.org">
richard.henderson@linaro.org</a>; <a href=3D"mailto:pbonzini@redhat.com">Pa=
olo Bonzini</a><br>
<b>Subject: </b>Re: [PATCH v2] [PING] target/i386/gdbstub: Fix a bug about =
order of FPU stack in 'g' packets.</p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><br>
TaiseiIto &lt;taisei1212@outlook.jp&gt; writes:<br>
<br>
&gt; This is a ping to the patch below.<br>
&gt;<br>
&gt; <a href=3D"https://patchew.org/QEMU/TY0PR0101MB42855925D8414E4773D6FA3=
6A41D9@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com/">
https://patchew.org/QEMU/TY0PR0101MB42855925D8414E4773D6FA36A41D9@TY0PR0101=
MB4285.apcprd01.prod.exchangelabs.com/</a><br>
&gt;<br>
&gt; Before this commit, when GDB attached an OS working on QEMU, order of =
FPU<br>
&gt; stack registers printed by GDB command 'info float' was wrong. There w=
as a<br>
&gt; bug causing the problem in 'g' packets sent by QEMU to GDB. The packet=
s have<br>
&gt; values of registers of machine emulated by QEMU containing FPU stack<b=
r>
&gt; registers. There are 2 ways to specify a x87 FPU stack register. The f=
irst<br>
&gt; is specifying by absolute indexed register names (R0, ..., R7). The se=
cond<br>
&gt; is specifying by stack top relative indexed register names (ST0, ..., =
ST7).<br>
&gt; Values of the FPU stack registers should be located in 'g' packet and =
be<br>
&gt; ordered by the relative index. But QEMU had located these registers or=
dered<br>
&gt; by the absolute index. After this commit, when QEMU reads registers to=
 make<br>
&gt; a 'g' packet, QEMU specifies FPU stack registers by the relative index=
.<br>
&gt; Then, the registers are ordered correctly in the packet. As a result, =
GDB,<br>
&gt; the packet receiver, can print FPU stack registers in the correct orde=
r.<br>
&gt;<br>
&gt; Signed-off-by: TaiseiIto &lt;taisei1212@outlook.jp&gt;<br>
&gt; ---<br>
&gt;&nbsp; target/i386/gdbstub.c | 4 +++-<br>
&gt;&nbsp; 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c<br>
&gt; index c3a2cf6f28..786971284a 100644<br>
&gt; --- a/target/i386/gdbstub.c<br>
&gt; +++ b/target/i386/gdbstub.c<br>
&gt; @@ -121,7 +121,9 @@ int x86_cpu_gdb_read_register(CPUState *cs, GByteA=
rray *mem_buf, int n)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return gdb_get_reg32(mem_buf, env-&gt;regs[gpr_map32[n]]);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (n &gt;=3D IDX_FP_REGS &amp;&a=
mp; n &lt; IDX_FP_REGS + 8) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; floatx80 *fp =3D (floatx80=
 *) &amp;env-&gt;fpregs[n - IDX_FP_REGS];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int st_index =3D n - IDX_F=
P_REGS;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r_index =3D (st_index =
+ env-&gt;fpstt) % 8;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; floatx80 *fp =3D &amp;env-=
&gt;fpregs[r_index].d;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int len =3D gdb_=
get_reg64(mem_buf, cpu_to_le64(fp-&gt;low));<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len +=3D gdb_get=
_reg16(mem_buf, cpu_to_le16(fp-&gt;high));<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return len;<br>
<br>
I'm sorry I though Paolo had already grabbed this, or is this a second<br>
fix to the FP handling?<br>
<br>
-- <br>
Alex Benn=A8=A6e<br>
Virtualisation Tech Lead @ Linaro<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_TY0PR0101MB4285AC0905312A82102F3348A4F99TY0PR0101MB4285_--

