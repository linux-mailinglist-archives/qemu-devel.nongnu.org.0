Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97711300F80
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 23:01:40 +0100 (CET)
Received: from localhost ([::1]:53976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l34Ut-0006kU-L1
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 17:01:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1l34Sc-0006Ca-OD
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 16:59:18 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:62712)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1l34Sa-0001MT-Ci
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 16:59:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1611352756; x=1642888756;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1XpC3wQHmLiP09LtblqcHe/K++qv7Ykb5SKbXgRFfNg=;
 b=IsCKlgIvaDrFFreMMvJegz7a/khlA/A8DFkB+VEfERixAeOr6jhgWyRi
 7hlYIwKl+L2mkrJ6HujCG7eTk0N1ohuvk9OAfv7TRImxW+xJ6Mmwx16kN
 f4AUOE7163pWTfvT2ias96dVRNh4CJAN+dsuHuvvbqd7Cyj9KKRSrDm36 8=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 22 Jan 2021 13:59:14 -0800
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 22 Jan 2021 13:59:14 -0800
Received: from nasanexm03b.na.qualcomm.com (10.85.0.98) by
 nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Jan 2021 13:59:14 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03b.na.qualcomm.com (10.85.0.98) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Fri, 22 Jan 2021 13:59:13 -0800
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BY5PR02MB6755.namprd02.prod.outlook.com (2603:10b6:a03:205::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Fri, 22 Jan
 2021 21:59:13 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::41f5:1c20:959e:559e]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::41f5:1c20:959e:559e%7]) with mapi id 15.20.3784.015; Fri, 22 Jan 2021
 21:59:13 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH v7 15/35] Hexagon (target/hexagon/arch.[ch]) utility
 functions
Thread-Topic: [PATCH v7 15/35] Hexagon (target/hexagon/arch.[ch]) utility
 functions
Thread-Index: AQHW7tx4h/5dl60vZUyjfMKcSizWA6oz9aQAgAA+qdA=
Date: Fri, 22 Jan 2021 21:59:13 +0000
Message-ID: <BYAPR02MB4886B63FA0C74ACAE6275F6ADEA09@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
 <1611113349-24906-16-git-send-email-tsimpson@quicinc.com>
 <8e41b920-e7de-a7da-bba1-f8a649006955@amsat.org>
In-Reply-To: <8e41b920-e7de-a7da-bba1-f8a649006955@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [76.120.51.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0acedc2a-67cd-4f91-9781-08d8bf20f450
x-ms-traffictypediagnostic: BY5PR02MB6755:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB6755D3C7F12C3011E99AAEEDDEA09@BY5PR02MB6755.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TJt7+MHy1MxpkwCUFVbvsdprI6jX1a+ENrscaLC0T8fpPl/B7sZtjv02xDUBhP18xLyxuOL4hZk4bEgOCyqtRw0Rw++S3lkoDv88j6gkO/4tsNon+xY8ix2eai52NGvQU/6Rlb1bM5TKAU0pR+iuYvaEhOPPRAMk5stI7FWw73WwNeWF2IHcJCInSDUENG02pcIXSCgiXDKMIazyL2cXKWloGFc88gQFt0nmYHoHwk9pU9VnRR9ya9+CLLsdE1I3JRHjtJT2nHwtZ1zJVMUD/cUZUbmsJy7u9PZYRYwhGJhrL8wRWVmvT6uGYi6ilnj38bPmRnt2AA8hmnHpRbO7Ue9CQP93Bdec6cKVgs9/zDRBZBJnDrAIAYFefahzbVTOy2oIQWy6tFulfzPXt1uioA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(66446008)(107886003)(52536014)(4326008)(83380400001)(66556008)(66946007)(8676002)(64756008)(5660300002)(9686003)(55016002)(76116006)(71200400001)(66476007)(478600001)(53546011)(316002)(8936002)(186003)(2906002)(110136005)(86362001)(6506007)(33656002)(26005)(7696005)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Mm1NYVNNbjB0eWl0eUtNVXJJd01yanpJR3dRSWN4MmYxR3N3bEd4Mjl2ZTg0?=
 =?utf-8?B?dWR4S2g3WWVubDhnM3hDakVrQjJEMlB4QW43RU1QcURrQ2oxcDJseFQzYWJZ?=
 =?utf-8?B?RzdaNU5zYkFmelNlNHlpaElnd1FLeUd2eXlsTC9BZ0ZFb0E0WUlxRVByaGQz?=
 =?utf-8?B?eGNMK1Y2TENkV050Z0szb3dQVFl5djVzajZUczZmYU5qbjVYRVdQRHVtV2I5?=
 =?utf-8?B?V2ZJZ2dSRDE1K1pMa3BHS2l3emVHVGwrUGlLcER5MmpqYjJUbXQ0ZEo0aWpy?=
 =?utf-8?B?VlVMemswaGhpSS9mdWdiTHZyS3hLcjBMUU84UjVrZ3BRMTJZQ3dvSFpJcUpU?=
 =?utf-8?B?THhGb3poMVFvNVQ1Tmt5OTlaZHVEY3BBVDhvUFN5dmsyUUtZNElFWU1mUk95?=
 =?utf-8?B?aXorcUZud2xWZjkreDUyT08rc3libitvM1NuSXhybkxlTU15dUdvaUtTRFdQ?=
 =?utf-8?B?anY3cXlXbGJpVmQ3SUcxMjE2ZFJpdnFMc2NuRythbXRYbVNUNUUxWGVlRnJt?=
 =?utf-8?B?SEZ4dXR2NXlXUDU2elYwQkxZem5rRnNGS1NVZ25UTG5IcjE1elpzL3JGS01l?=
 =?utf-8?B?VUNpVG1uMGtYZHJML1NZNW1TUzc5OW9qYmxuTjd6cHBvTGhGUDFuZW82Zlpr?=
 =?utf-8?B?bHF5Qm9rZkFLYSt6SlJVSWtJVkhhcTNzSFRGciszdVluOGNzMWxEUEJDQ0pi?=
 =?utf-8?B?OFNURms2SXBuVUw4RHdId2NEbDg2bG9LQ3pFSVdMN1RLd2JjSlpsMUZsNHNk?=
 =?utf-8?B?KzJEcU0xYXpEM0R2azNxa1paRXNuOSt4R2RaYUhpbXdOY2tuaXMwK0JybWJo?=
 =?utf-8?B?WVlQZ2MwSElMRWZzRWV5NXIyN2xuZGNJZ0NCYVI1UUxSU2JqdTF0SkxjQXZS?=
 =?utf-8?B?UzZqSUUwNzhyZkRpZXNuMDdGMi9lOWRFYUFReEg4YjdwZzJ0T0VsUm9vbk1h?=
 =?utf-8?B?RVFlTFVGS1NuMlVBQ1VQSEFGbGx6Q3FJTVlGZjVlRWNVSlYvdkwwakZOaTU1?=
 =?utf-8?B?bjlhZ0dncFVuNytuNStmV29NZTJJMDgvVlptb0svcVoxZnFlaWw5RVhJQW0v?=
 =?utf-8?B?QVljdG8yanFSaE1HWW5uMHo3OU1ZYUlhY1BFbkw5NFBVdmx4eUJQV1A4Ykhy?=
 =?utf-8?B?eDV2VUlXZU4zdXhqZFpHbFFxZVdhSHArdHh6QmhiZHk0VzRyc0hpem5KQlEy?=
 =?utf-8?B?L3B5SGtpMUkxa2FpY1hhUEpLSGpNbTRJa01QSTg1QkY3WTQ2NW9xajhoc2V5?=
 =?utf-8?B?ZUo4VFlNR3RTR085RFpQZHFQelIwaUVKUk85ZThJL2liQlRQcWZSZk42UHJQ?=
 =?utf-8?Q?mUWC2IwKGY1w8=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FgFvv11+0mH/yyuDtHglK/uOZ+m6X6j7d98nTTDc1/zkupVImLEWi7Jo+GG3gaGDUqjp/blng757SEkYsOPl/D0hUf69deiTvH7fZPPCqmu3icn8hXAaYdNLvcmgokhRv+bJc/leep/GfsZIPfv7bwVjPvrQ4PaZMLir+4f6GMnij5ihepCaSGA45BG0xn6+RUJXvS7X8OQq0zq9NdwTqMab6BjjRAJKEeGMxfymHEUIAhCEL851ovF4JqGJF6utPHIPf3hPkMs2muSRWZsHcLRyDZISvrS5rOXxHFAkoSqWsN44lv/LQtTn/6a8Lg2Gnj1pQY4vkBZwfr6a7HD16g==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHSAf1mcpdRkYc9pXHMyn2rVxjthS0dTWCrsL+Z+2hM=;
 b=B4eYdx83cxQreIuMWoRW22Igizjpm61HW76goBElKNKeOfKtbnzp7gkivJ0mR9gVjL/dYNxhOYDdSQKHdnqwkuxgjJc3J5osCpfCG/ANW/hmMCdDNNuJrEE64LyQZvhS+K6gQM9bxWeoWJerLIEksQWF6HibknbfXMQcOVkuL7dmYXs1YOi2MJDdp5czs3dwzum7ACIqtZFmaiC5zE1ToWWt+1nAigJJyM74nBhI/Fn1c1p8PjYytMKslG8OsdxIqvq04WFyF4vztmEO1cFJBkHquXjv9r4H2SPGDiF2ZnP3qXyzMaTrbr3TYpymeDaqf8cDB2d8l+dgsJCGwzqv3w==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
dkim-signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHSAf1mcpdRkYc9pXHMyn2rVxjthS0dTWCrsL+Z+2hM=;
 b=dNBraaWRSu4xE6WkedpOADeKPTpjlqzAQcxku5lTUMHzd31aFLDhenTce0YvTTgqSwV1Z4tbzr0ZrbKbj6xg+g8S2g0wy5KPU0StfkSrX4PPcBO0hgcMFtKX5F88eF+H7bH0YntbtSWeQHi+4P7YOBj0b/6MWnqfCapKgPuNJHY=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 0acedc2a-67cd-4f91-9781-08d8bf20f450
x-ms-exchange-crosstenant-originalarrivaltime: 22 Jan 2021 21:59:13.0636 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: L0YStrSOXE0I32Hz33thptAEDgHbTDw4maWR4njF3AY+4oOuESxT5qt6MB0P6PFfg3lN1KNI6Of3tO1HFb8Wbg==
x-ms-exchange-transport-crosstenantheadersstamped: BY5PR02MB6755
x-originatororg: quicinc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.38; envelope-from=tsimpson@quicinc.com;
 helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "ale@rev.ng" <ale@rev.ng>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxpcHBlLm1hdGhpZXUuZGF1ZGVAZ21haWwuY29tPiBPbg0KPiBCZWhhbGYg
T2YgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kNCj4gU2VudDogRnJpZGF5LCBKYW51YXJ5IDIyLCAy
MDIxIDEyOjA5IFBNDQo+IFRvOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+
OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5v
cmc7IGFsZXguYmVubmVlQGxpbmFyby5vcmc7DQo+IGxhdXJlbnRAdml2aWVyLmV1OyBhbGVAcmV2
Lm5nOyBCcmlhbiBDYWluIDxiY2FpbkBxdWljaW5jLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2NyAxNS8zNV0gSGV4YWdvbiAodGFyZ2V0L2hleGFnb24vYXJjaC5bY2hdKSB1dGlsaXR5DQo+
IGZ1bmN0aW9ucw0KPg0KPiBIaSBUYXlsb3IsDQo+DQo+IE9uIDEvMjAvMjEgNDoyOCBBTSwgVGF5
bG9yIFNpbXBzb24gd3JvdGU6DQo+ID4gU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRz
aW1wc29uQHF1aWNpbmMuY29tPg0KPiA+IC0tLQ0KPiA+ICB0YXJnZXQvaGV4YWdvbi9hcmNoLmgg
fCAgMzUgKysrKysrDQo+ID4gIHRhcmdldC9oZXhhZ29uL2FyY2guYyB8IDI5NA0KPiArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAyIGZpbGVz
IGNoYW5nZWQsIDMyOSBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0YXJn
ZXQvaGV4YWdvbi9hcmNoLmgNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRhcmdldC9oZXhhZ29u
L2FyY2guYw0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2FyY2guaCBiL3Rh
cmdldC9oZXhhZ29uL2FyY2guaA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXgg
MDAwMDAwMC4uYTgzNzRhMw0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi90YXJnZXQvaGV4
YWdvbi9hcmNoLmgNCj4NCj4gTWF5YmUgcmVuYW1lICJhcmNoX3V0aWxzLltjaF0iPw0KDQpBbnkg
cGFydGljdWxhciByZWFzb24/DQoNCj4NCj4gPiArZXh0ZXJuIGludCBhcmNoX3NmX2ludnNxcnRf
Y29tbW9uKGZsb2F0MzIgKlJzLCBmbG9hdDMyICpSZCwgaW50ICphZGp1c3QsDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmbG9hdF9zdGF0dXMgKmZwX3N0YXR1cyk7DQo+
DQo+IChBZ2Fpbiwgbm8gbmVlZCBmb3IgJ2V4dGVybicpLg0KDQpPSywgSSB3aWxsIGNoYW5nZSB0
aGVzZS4NCg0KPiA+IGRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9hcmNoLmMgYi90YXJnZXQv
aGV4YWdvbi9hcmNoLmMNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAw
MDAuLmM1OWNhZDUNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvdGFyZ2V0L2hleGFnb24v
YXJjaC5jDQo+IC4uLg0KPg0KPiA+ICsjZGVmaW5lIFJBSVNFX0ZQX0VYQ0VQVElPTiBcDQo+ID4g
KyAgICBkbyB7fSB3aGlsZSAoMCkgICAgICAgICAgICAvKiBOb3QgbW9kZWxsZWQgaW4gcWVtdSB1
c2VyIG1vZGUgKi8NCj4NCj4gSSBkb24ndCB1bmRlcnN0YW5kIHdoeS4uLiBDYW4geW91IGV4cGxh
aW4gcGxlYXNlPw0KDQpPdXIgTGludXgga2VybmVsIG9ubHkgc2V0cyB0aGUgcmVsZXZhbnQgYml0
cyBpbiBVU1IgKHVzZXIgc3RhdHVzIHJlZ2lzdGVyKS4gIFRoZSBleGNlcHRpb24gaXNuJ3QgcmFp
c2VkIHRvIHVzZXIgbW9kZS4NCg0K

