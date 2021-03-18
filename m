Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F73340CEA
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 19:27:05 +0100 (CET)
Received: from localhost ([::1]:51704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMxMO-00010l-C7
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 14:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lMwzR-0002AI-Vp
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 14:03:25 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:3102)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lMwzO-0006GA-2p
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 14:03:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1616090598; x=1647626598;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YpqandjTvneZGV/VEn2Jb1fZagwzh22CsacrTlkNUi0=;
 b=A3VTq2y16uWsvmg5q3gaecyvVwtoT9npXo6DtdZ4pCEO6LgBfrptEPYF
 u/qezOpX7ZDKhBNAqxE5+fQDqvDn4JE0St/yEJzzj9CY7i7key1x9uRbz
 8Fy7jFnXlUxIqMARYk8SjEz3vWfu2do5mQ7IR9C+73W3NDsElIhHoExtM c=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 18 Mar 2021 11:03:16 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 18 Mar 2021 11:03:16 -0700
Received: from nasanexm03f.na.qualcomm.com (10.85.0.47) by
 nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Mar 2021 11:03:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03f.na.qualcomm.com (10.85.0.47) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Thu, 18 Mar 2021 11:03:15 -0700
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by SJ0PR02MB7373.namprd02.prod.outlook.com (2603:10b6:a03:290::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 18:03:14 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6%4]) with mapi id 15.20.3933.033; Thu, 18 Mar 2021
 18:03:14 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v8 16/35] Hexagon (target/hexagon/conv_emu.[ch]) utility
 functions
Thread-Topic: [PATCH v8 16/35] Hexagon (target/hexagon/conv_emu.[ch]) utility
 functions
Thread-Index: AQHW/d3RWNOD5HbBV0+y+7C+tID81qpYLD8AgDEW6/CAALbMgIAACtJggAAYLwCAABiHYA==
Date: Thu, 18 Mar 2021 18:03:13 +0000
Message-ID: <BYAPR02MB4886AE3C4E1D8606ED6D350DDE699@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-17-git-send-email-tsimpson@quicinc.com>
 <f0ff8663-9ea2-e8be-9123-4afffc41bad2@linaro.org>
 <BYAPR02MB4886A70EA367526D5834F501DE699@BYAPR02MB4886.namprd02.prod.outlook.com>
 <75d9fed2-ac04-846b-1426-6cd9fe657924@linaro.org>
 <BYAPR02MB4886CE42E5E7E79CD9C5006FDE699@BYAPR02MB4886.namprd02.prod.outlook.com>
 <db5eac2a-09fc-bf74-9738-8f058c439f82@linaro.org>
In-Reply-To: <db5eac2a-09fc-bf74-9738-8f058c439f82@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80d972df-e96c-439e-3555-08d8ea38199f
x-ms-traffictypediagnostic: SJ0PR02MB7373:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR02MB73738AC782A99E140CEB574FDE699@SJ0PR02MB7373.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Od7Y2ER1zjXTQs5NJKf6zE2n/AdEyhJLc+9HHOvyJf5NHc1049RGAKjT4k+B8fNMr8GN4QLDsS6/S1zvlNP/11kwosJohNbeFr30WIeBloltSvCy6raVaoDShMfBnoy/SafeSD0zNG5l2qi87mmUAoOxqgh7ICq/leL/GmwOTWO9UOTQgcPRlWNb1ky7v6fW2SynAzGRK0ivrGNCR0LuE3F0rjds3nirERlWRsDYI/NzEPCoJ7TZ7A87wzeW6BrsMdWH9A0tSjYq2F0QG2QZHzQCLbTFIEfXVRitc6K292iKR+/a192+eSwVAuu8JmIKjOZ1LlmySyN9tvyjx5bSsVMnnA8zNexDGjneMfa9qpRti21Bn5RFtg8nTROGuVA+KCC/7wtJ6uSlJ7irIgSF+Qmpo1I0tQ/AaqKQxRF9hNY3FZWowa7zRMJVB4HhxWjgtkpLXuWRbfV4jcOG5i9NXZOYg2KjcEzjUoUaNbOgINnzbnhQKclwxb6k6mxm5sL0pj5v4s2FhdWYM0YBu1trw2SFF9w95W2FMpVcjr7xAbKE18YHY3JQkT/XwWRotQPi3lrwSQtmG4ZW1hRx0QUKQfYARqJSWj1Rys8ThUJfWmG13FGyKSv2ILo8E6mPV5l3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(6506007)(2906002)(52536014)(26005)(55016002)(33656002)(4326008)(9686003)(5660300002)(54906003)(86362001)(53546011)(83380400001)(110136005)(66476007)(64756008)(66446008)(66556008)(478600001)(8676002)(71200400001)(107886003)(76116006)(186003)(8936002)(66946007)(316002)(38100700001)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?azBSYXFLTklwN1Y2UjlzcGJmdnljL1FqSTBocmlsaHd0U3ZvRUlWMjVHRTNN?=
 =?utf-8?B?MWI1ZkhGSjk4ZEwyYTBmbXI4OVhKRUw3TGlGVkh3aW1OZWpBWjFoM1VBL293?=
 =?utf-8?B?NHl4cGZuRXFQQVIvMU9TUWprQXE0QjBLVW9QTXZmdjc3QXQ4NjFuUWdiUEJi?=
 =?utf-8?B?SkxnUVJoaXhsbG40NGkrV1ZwcE5RRk55QkpOZC9VT05VQVM1R0RtVjRxTllw?=
 =?utf-8?B?c0JtVHcxRGlnb3Nnd1pMQ2VSRmdFRHlDNlZsNHpmWmh3aFpwcFAwbmpqYWVk?=
 =?utf-8?B?b2E5Rmp6UW9ITHVndEdjY29tYjRQR01LQmgxa0NyMzEyS0hwNFJiN0VzQVgx?=
 =?utf-8?B?ekpzQ3VxWjRvUkh1VXVqQzRBVEI0YmZQdmhFblFTRHQ4RlNlTXNSSDhCTzE2?=
 =?utf-8?B?VXV5TmJzRzUwTTRJS0hjSy9vUmZwRXVYNHl4UEJyTjJWaFdKamtncHE4ZFdz?=
 =?utf-8?B?M0hvakV1NElMU1RYZ2NPWTFaU05kcGxaWHY5M3d2QzJlbW1mV0IvaEZDZEJz?=
 =?utf-8?B?aDNOdFZUWjliNUx4S0RESC8yT3RKQVgraGxIamJJQllGZUxDc2h5MzlrcW04?=
 =?utf-8?B?dkZocFU2aG9LRW53eDFuRUl6c05SV3cwTWw2TmI3RllQb0V1NHhodmtiYVJt?=
 =?utf-8?B?ZVRsMm5uV2tUaDM2N1NHTUV4cXhqeDZGQ2V2L0FwS3Bsa3EzUVlhWFFCUDND?=
 =?utf-8?B?TERWT1hrbE95UVI5R1dxb05DeXljS3QwcWgzLytzYWJ3N1R0eGduYUZ6eFpi?=
 =?utf-8?B?QWdSdFRvdDZ1cDhxZ1BaYnVYSzZmQ0lsbnRxSHA5am9reU1sTG1uRW5OTWEv?=
 =?utf-8?B?d2JZZk1GenBYYXdjWUlHRDZ2UkRPZmdwSzlvZDNBS2VxazNubzl4YUNEVW9u?=
 =?utf-8?B?SDcxTUx5V2Q2ZnNwdWVkZ0I2NGI2ZTdtbk9JMkx0c2djbmJSdk1hanpjVEZL?=
 =?utf-8?B?V2xNZmF6WjZqb3pSZE5oRXZLb1ZsRlpLYkF5QTI3R3hkeFNPaEliTUh1cXF6?=
 =?utf-8?B?TXg2SzBjRWhaK21NWkl6ZHhZelIzcG1qUWpwdFRncTh4czg4dzBtNVZjc1Yr?=
 =?utf-8?B?ckRRQlQyUHZVK2Rma0h1Skd1Y0xCWUg3WlNsdHdVNGhjMmt1dkwyU0xtSzFQ?=
 =?utf-8?B?ak1VNFRlWU03cTBaL1A3NGh0VFJZS2pNNDVZUldqdHhlbEFLZ3VrSXpKNVIy?=
 =?utf-8?B?U3lJaTVXMStidkdxQ0lwQi9naU9kbGoyWHVISmx1cE9OOVZTbU50RWxUZVFy?=
 =?utf-8?B?RTZLN3lJQ2V4c1BEdG9pdStqaENTQXFPaWRyeW91dXQzNXZzbTVQbFRTajNR?=
 =?utf-8?B?ZlhCQ2dsYjdCaDh4K0VaZ3c4TDFQVHIvWEZlVWhsTDRlMkRNam9XRjFqSVg1?=
 =?utf-8?B?SkgzZmw3cFJoZDdQUUhCZVFBUFBNRGNTSEpqd2ZXL2NmTE03NjdOVnZHSmx3?=
 =?utf-8?B?Y0RYTGVKTWlDUkVIQUJXRjVoRm85eERVYTRKVG8wRUJLd295QzkrM09KSS9p?=
 =?utf-8?B?VTRXaWM3dktNeng4TDhRVC9kY1Frbnc3cVZ3WUk2MVpxWUhIdFlNOGRSeVl2?=
 =?utf-8?B?UjhBcm1IbFBNeHN0aE1VYkx6dXNsYmJhejc5SzZwUy9WVlZZdzdtOWtrR1dM?=
 =?utf-8?B?R2RudlovL0UzdkYyck84b0QxZGVmZ1d0c3hqRVBac3JJQjRwZHJ0SDlRc2ho?=
 =?utf-8?B?VWM2dEhERm01aGhRR1ZrNWluTlFRenVsb2l4SXluazBpS0xnSHZqQU42Y1Qz?=
 =?utf-8?Q?vK6hWZxSuRcfGPT7C7PudRFoxV4GW0IXnDp3JZu?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uot3LxjDEueY3Eqnf6ES9hqfhOW2GYDH3RHgxSrAhJtWhb6NO8tcBZCKHbhhq5klsQlCRyNruAgYUvmvUHDTmMTxU6YslRqeS9PPHQo6CeGAa7TRAjXrIDTczyz2Tryl4f26Cn/3AALoQYL5l1Va3tSBoavwTbddI7gaXkx6sgtpn+EwV9aXOtmhdY0AoCzAXaKb29XHomRO1BYKP0Q5XuDY57rPVt4cwDVRpugWELK3g3MOxAkbioFVo6J7HooErgysLw3JfjH1XdCw6qDooHAaIjytZog1IxQtTCABoRfxneieOrvBKjREk1MtxUxitzZpWU+5COd/Lh4M2s3SgA==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elK5x4Ly6sKSaICzslDweSrqcZEUOm7lDEq5RuOb6Kk=;
 b=JU6rlsZ8fjWX+L+gFyCPCbDXgdOnyLROibKrEcDnyGV12mmicoHhLrc5AnfE6SP+9/YTT4A8w0DoyXZWCO4YJU95gUr384ZcHE82g0muP6Np0HUqWhyMos4NgjJgWTE4EvslfDO4PzSEh7/Hbx47GMcTvpl2lD9TYiNJGrMLn7t17qCSrp0ipowtXHFUsfqlqKLI8qjgs1OyRqryVKUUhoum9KjTt5Mobt1mlJqeHSo1VXWgFdzGN6Ny4eAtQqGfH3+8vBGjdJMYLoKWkMyld0aTtWTChFP6zwn44iQhX4cFU7CGckH2wqXRucuVTkh4KUFFq7yBmbRcPyybBSf6PQ==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 80d972df-e96c-439e-3555-08d8ea38199f
x-ms-exchange-crosstenant-originalarrivaltime: 18 Mar 2021 18:03:14.0428 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: +Lqg9+0TrVQ08d6CbEcU2sNXCctgRYddwI7Sok31JsqeIHRK3/ip5tBadwy21qfB0I9gwraQktztEI587K17Lg==
x-ms-exchange-transport-crosstenantheadersstamped: SJ0PR02MB7373
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
 "philmd@redhat.com" <philmd@redhat.com>,
 "laurent@vivier.eu" <laurent@vivier.eu>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXJj
aCAxOCwgMjAyMSAxMDozNiBBTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNp
bmMuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBwaGlsbWRAcmVkaGF0LmNvbTsg
YWxleC5iZW5uZWVAbGluYXJvLm9yZzsgbGF1cmVudEB2aXZpZXIuZXU7DQo+IGFsZUByZXYubmc7
IEJyaWFuIENhaW4gPGJjYWluQHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY4
IDE2LzM1XSBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbi9jb252X2VtdS5bY2hdKQ0KPiB1dGlsaXR5
IGZ1bmN0aW9ucw0KPg0KPiBPbiAzLzE4LzIxIDg6MTEgQU0sIFRheWxvciBTaW1wc29uIHdyb3Rl
Og0KPiA+IEFjdHVhbGx5LCBzb2Z0ZmxvYXQgcmFpc2VzIGluZXhhY3QgaW5zdGVhZCBvZiBpbnZh
bGlkLiAgSXMgdGhlcmUgYSB3YXkgdG8NCj4gb3ZlcnJpZGU/DQo+DQo+IE5vdCB0cnVlOg0KPg0K
PiAgICAgIHN3aXRjaCAocC5jbHMpIHsNCj4gICAgICBjYXNlIGZsb2F0X2NsYXNzX3NuYW46DQo+
ICAgICAgY2FzZSBmbG9hdF9jbGFzc19xbmFuOg0KPiAgICAgICAgICBzLT5mbG9hdF9leGNlcHRp
b25fZmxhZ3MgPSBvcmlnX2ZsYWdzIHwgZmxvYXRfZmxhZ19pbnZhbGlkOw0KPiAgICAgICAgICBy
ZXR1cm4gbWF4Ow0KDQpTb3JyeSwgSSB3YXMgbWlzdGFrZW4uICBUaGUgZGlmZmVyZW5jZSBpcyBp
biB0aGUgbmVnYXRpdmUgY2FzZS4NCiAgICB9IGVsc2UgaWYgKGZsb2F0MzJfaXNfbmVnKFJzVikp
IHsNCiAgICAgICAgZmxvYXRfcmFpc2UoZmxvYXRfZmxhZ19pbnZhbGlkLCAmZW52LT5mcF9zdGF0
dXMpOw0KICAgICAgICBSZGRWID0gMDsNCg0KRm9yIG1hbnkgY2FzZXMsIHRoaXMgaXMgd2hhdCBz
b2Z0ZmxvYXQgZG9lcy4gIFRoZSBkaWZmZXJlbmNlIGNvbWVzICB3aGVuIHZhbHVlIGlzIGJvdGgg
bmVnYXRpdmUgYW5kIG5lYXIgemVybyAoZXhwb25lbnQgaXMgbmVnYXRpdmUpLiAgU29mdGZsb2F0
IGNoZWNrcyB0aGUgZXhwb25lbnQgYmVmb3JlIGNoZWNraW5nIHRoZSBzaWduLiAgcm91bmRfdG9f
aW50IGRvZXMgdGhpcyBmaXJzdA0KICAgICAgICBpZiAoYS5leHAgPCAwKSB7DQogICAgICAgICAg
ICBib29sIG9uZTsNCiAgICAgICAgICAgIC8qIGFsbCBmcmFjdGlvbmFsICovDQogICAgICAgICAg
ICBzLT5mbG9hdF9leGNlcHRpb25fZmxhZ3MgfD0gZmxvYXRfZmxhZ19pbmV4YWN0Ow0KVGhlbiBp
dCBzZXRzDQogICAgIGEuY2xzID0gZmxvYXRfY2xhc3NfemVybzsNClNvIHJvdW5kX3RvX3VpbnRf
YW5kX3BhY2sgZG9lcyB0aGlzDQogICAgY2FzZSBmbG9hdF9jbGFzc196ZXJvOg0KICAgICAgICBy
ZXR1cm4gMDsNCg0KDQpIZXJlJ3MgYW4gZXhhbXBsZSBmcm9tIGZsb2F0X2NvbnZzDQogICAgZnJv
bSBzaW5nbGU6IGYzMigtMHgxLjMxZjc1MDAwMDAwMDAwMDAwMDAwcC00MDoweGFiOThmYmE4KQ0K
U29mdGZsb2F0OnRvIHVpbnQ2NDogMCAoSU5FWEFDVCApDQpIZXhhZ29uOnRvIHVpbnQ2NDogMCAo
SU5WQUxJRCkNCg0KDQpTbywganVzdCBsb29raW5nIGF0IHRoZSBmbG9hdF9jb252cyB0ZXN0cyB0
aGUgSGV4YWdvbiB2ZXJzaW9uIG9mIGYzMi0+dWludDY0IHdvdWxkIGJlDQogICAgaWYgKGZsb2F0
MzJfaXNfbmVnKFJzVikgJiYgIWZsb2F0MzJfaXNfYW55X25hbihSc1YpKSB7DQogICAgICAgIGZs
b2F0X3JhaXNlKGZsb2F0X2ZsYWdfaW52YWxpZCwgJmVudi0+ZnBfc3RhdHVzKTsNCiAgICAgICAg
UmRkViA9IDA7DQogICAgfSBlbHNlIHsNCiAgICAgICAgUmRkViA9IGZsb2F0MzJfdG9fdWludDY0
X3JvdW5kX3RvX3plcm8oUnNWLCAmZW52LT5mcF9zdGF0dXMpOw0KICAgIH0NCg0KDQpUaGFua3Ms
DQpUYXlsb3INCg==

