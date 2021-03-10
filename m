Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DE433421D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 16:52:32 +0100 (CET)
Received: from localhost ([::1]:56868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK18R-0002Kf-Cr
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 10:52:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lK14Q-00084n-R4
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:48:22 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:36790)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lK14O-0005Om-7s
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:48:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1615391300; x=1646927300;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WCu0pFSfnwpWtABDKtHrQXDezPsFjlu+MPVnMJQbhAg=;
 b=TiwTrMeWA56WCFxpIINby/nnSnt++A/dxAm1yY2UOv4cfWKQyf2atccQ
 VTYPWhPtfuFJM0OsZ0O9uDre0Llo281Qcnl/WO7+22AL2R2BTb2DTYyNH
 bmyRl0wSZSDQwjTHo5MX49K7JSpomqltZuIF3CkxYU3fLdn34KatG0v+5 Q=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 10 Mar 2021 07:48:17 -0800
X-QCInternal: smtphost
Received: from nasanexm03b.na.qualcomm.com ([10.85.0.98])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 10 Mar 2021 07:48:17 -0800
Received: from nasanexm03a.na.qualcomm.com (10.85.0.103) by
 nasanexm03b.na.qualcomm.com (10.85.0.98) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Mar 2021 07:48:16 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03a.na.qualcomm.com (10.85.0.103) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Wed, 10 Mar 2021 07:48:16 -0800
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by SJ0PR02MB7312.namprd02.prod.outlook.com (2603:10b6:a03:29b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.29; Wed, 10 Mar
 2021 15:48:14 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6%4]) with mapi id 15.20.3912.030; Wed, 10 Mar 2021
 15:48:14 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, Alessandro Di Federico
 <ale.qemu@rev.ng>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 02/10] target/hexagon: import README for idef-parser
Thread-Topic: [PATCH v2 02/10] target/hexagon: import README for idef-parser
Thread-Index: AQHXC4mjuaOWuxsbB0iWwss/LlfwH6ppUFqAgBQhwzA=
Date: Wed, 10 Mar 2021 15:48:14 +0000
Message-ID: <BYAPR02MB48867812389A9AE6031D7215DE919@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210225151856.3284701-1-ale.qemu@rev.ng>
 <20210225151856.3284701-3-ale.qemu@rev.ng>
 <3b3c6088-0ff2-beeb-e9fe-29c2dec012ca@linaro.org>
In-Reply-To: <3b3c6088-0ff2-beeb-e9fe-29c2dec012ca@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [2603:8080:2704:8f00:41ab:71e7:1683:3739]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b71c815-e979-4d70-660e-08d8e3dbea79
x-ms-traffictypediagnostic: SJ0PR02MB7312:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR02MB7312F69B084938E56FF45899DE919@SJ0PR02MB7312.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NNmSrmvO+p3wRDfAIj8HDbP9pPztYoQHGiOCMEdZoCd3NN/fssXVfuuFMAyky1qxp9U8ZW0sVnA0ndZCZlkyDmE+HAuNBjDp9fQcxulbYusW30jjDnydD1pTezVgnv7Kp4Iv+YAEMy8wKbsBSuFuIO8cSSLtR4shmbuo7JJu5lNqEmI0kbLY8lJST7AgkwaociFi7n1Y2rmEflruXUJeJqgcqWdkxl0Upt1Y81R5nKQM8JVpJ2iuxJilHsWz4tjnVmuO2D11XDHDQESKQspuDncfUxRlquZ8gGBT7kDHzbkVg9DEOhd5ZGvSEqcgFz8kBXocZu9ATLfcTUuhVzc3QGO0PAHQNqUTfpqzR/JI78aiz97b3IsKYu4mrDSvWRJIDrbQfdMoBN1KBTfTwkthhIht/W4nmwctPEIzndj+i9mBR2EnumtUSoc4wBxDluluisGIm9EsG+L4LaD8nF5PpuQRwh/XCb1HvCxSomHd4VEjSPIrTq7CEEQFn/AnZ+THjoEJLJOGMS3TnyI4VBFxHQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(66556008)(6506007)(76116006)(4326008)(2906002)(54906003)(71200400001)(7696005)(53546011)(86362001)(66476007)(186003)(5660300002)(83380400001)(66446008)(8676002)(64756008)(33656002)(316002)(55016002)(110136005)(478600001)(52536014)(9686003)(8936002)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Y1dwczRoRXRWMzgvTHZPcEVGZjB1WHhJTndqRUttMGxlYklQMnMxZEpaencx?=
 =?utf-8?B?Z0Z0U09RQmtIdkdnQWZaMlE0bWhYRFpsVVJ3RFB4MU1ldGUzMGNHemVFR1kv?=
 =?utf-8?B?N3hxTXdjaVl3ZGJwR3Ivd3FwOXlyMnFpQk1SdWxSeTZ4V3NyK01INnVCVmov?=
 =?utf-8?B?L3RkUU9uUjZpKyt2ZXpMK0NTalRwOWpPRzA3QUd3aUV6SWx5dHlyNlNSZTlJ?=
 =?utf-8?B?aXlRY1d1c0N0RlVqMitZODJVNFRqSjFUSndEbHdCa1ZYdjdWa01zaUl1Qm8r?=
 =?utf-8?B?eE1WRm8zdzhPalBWUGJHU3BBbDhFclpXTzQxcjF3N3pxV0xuWE5Yd1NRbnNS?=
 =?utf-8?B?RmtlRloyczNiOTRYdWxqakNhMFJwVVFaYjhYaXJHb0x6UDVMTm9sNU4vcito?=
 =?utf-8?B?WTBuZkZtT0x1UmhNdDZBdTU0bkRNc1lEZUJWbGVZb0YrdENLUlhLb2JTUUJF?=
 =?utf-8?B?NHlOWkNtcklERmgzT1RzN0l3UXdrQlVMWW1LNC9JU1QrR0VTbXhPaERtSEtW?=
 =?utf-8?B?QnVsUzUvMFBkeGxnOGFyb0cyWEFZQm9ML0lmSDR3Vm1TY2tmeC92RDQ1SVo3?=
 =?utf-8?B?blQ3T1hjL3JTMmNnaElUUEMvSUljZ3NHcHk2a0ZQZXZrSVhWZVZHZkFtVGM0?=
 =?utf-8?B?Ulo0RnM5bHhPN05Ha01OVlIxUXBWY2sxd0ozL1VvNzV0Mi8yTWt2UTMvcVJn?=
 =?utf-8?B?aWNlU2NWcUlLbnZ6QlpaeWtmUnlTRm80NGFFZjVoWlplQjMvWDhTeU5YbXFy?=
 =?utf-8?B?SzAyOWM0RXZpZWV2Vi8yVk5RSkdqbk43SGIrcnJ1WjRXVkRmQkxqTzBLckZG?=
 =?utf-8?B?OFFRTzFHQkNZbTdpamFQUG45Qlp5T25lVTlUajZEcEt2aVJyUkFyYXRCL3Nx?=
 =?utf-8?B?Z0VpcU0yMmxLYnE2d0NRWGxHck5XVDVpRU4yeUxNcXNhbHVsTVhMY2ROcE13?=
 =?utf-8?B?dWo2cUErMXRyaG1VV0xZK1A4eWhCRU9UWm5EYVJHMFN2dHdxVXNlVGsyVlE0?=
 =?utf-8?B?TlFzM3YrOHZGemxqWVlZL3pHaTJzeTZVUVBOWllIN08zUjhHWmhtNEJDUmtT?=
 =?utf-8?B?VjRaRVFCcy9rbDhDcHhLZWh2K09RNUtTbVNoWFkrU0hOZFhraXBHcXNYeThm?=
 =?utf-8?B?bWNHL0JLNkhoZWl5VHprTkdkWlcwbU5HMmNuU0pRbEFubm5KVGw2SnFQSlBL?=
 =?utf-8?B?dkswVFp3OU5sUVFaOU52cmkrSUhveW9XWFhjVkRXNXVRL3hPK0pjbjV4ZzRv?=
 =?utf-8?B?SGF4ZEZaSUFLcnlGL3gyQ0JMUG9ERWY0ZGFLMGgraUlQaTdwZkU0cnUyOUtY?=
 =?utf-8?B?VDRoNVZ0SHZCTXhMZ2kxTEFRUXlsZDBQd0ZiblU3NnRaejdYYUlrcGsrMDVM?=
 =?utf-8?B?YllYY3gyaGJiSCswOUFEL2NUQ094QWdBbjg5cS9RdXBpZkNYL3RLUWZ3SFlC?=
 =?utf-8?B?d1NhVkNCU2RYbCtBaldLUFh0cWUxNTdBVElKRTVlSUhjNm13U0RZN2R0Rzk5?=
 =?utf-8?B?MEVtblhZc0VSV29vNUlLZ09yRDJJTTRqck5sTlVxWm5MN0M1VzkwcFp2UkJx?=
 =?utf-8?B?eEI0cmRlNVp2OGMzUVZEWW00M2k2WnBZd2NlaE9iZ0poVCtQVkdrS1MvWU1T?=
 =?utf-8?B?c1B0MENqZS9BRWhUWDN4VnBNYTYwUTk4Y1VkZ2NmcEQ4VWRuK0FSaFBVOGIy?=
 =?utf-8?B?YkxpNXRCR3M1TERzSXA5ZTRka1VHS2xXdDFjUENzSkJ1UHEzeFNIQTlIVWlq?=
 =?utf-8?B?TmRIYklrRmNqYkdZZWJCb2ZLNkFXbmMrTS94L0oxbFN2U0dZTUx3SjFKZmxQ?=
 =?utf-8?B?QmNoYnVOaEF4ZFNuNDcyMkVIc0FFbFQ2NVVUYWErTzVKdXdvWGdadWZRYVdl?=
 =?utf-8?Q?knemQ1C0XhaW1?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NG1sS94auxTx7N7an5JL4h7hL42Kdhz4gfW2pWijeUug+WNqoioZDPKEumM3q2gUi7I3Sak2Bjuq+qH8BNtrv/v+ygRmADkLmatqYxhiiCz+mt7Usmx/BVs4v58JDI2qiqbOVir/EiJRIaeop1NZgu6lPdzKm3a9QdVggT1WEXv6AKw4qvdUdekeqoA/ErmqLnYB4B1B6kh6PWavrnnffM7FO88NVE5eNRWFfNJXvQ9gQ3mvKiMXoLpTKHkTOfy+mABZJ5ZdLVhm8H7MkJf+SBPSmuR0itEsM8auPZb5beu+fMAaMwn5GJklcUJJqM44UJT9wKM4HJ21AlvPcAboKw==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmMfR9OdQ5n550oAPuhXNgm7Sh17ykdcwgE+B8zOBZE=;
 b=btNZgfAgXjEvKBwLHGnwKBX+1CAn//aQQwYOYAoAX2j6PO0eWUGXNtHDajdjJEFPwbsFeffUIVygvKaqOnWnzxQLPsTA630NWON92W8ofsnYH7OnwdHfvukk7RMd3GEiX5copJ89MjqZUZL6mxGbZGkHHHSXiiX9Vy12TqgtShjfRBWc4xiFK34w3PuNxoQhhutr8+Jq2ZwhRYdLArQR4mAY3M40fnI5MJRzQ3HBLqLpObysv3zw1vRIcL8SFqWjkXe6GvOpgSufUphP7/J17BkFATSblJkFAYfy/Tg87YCQXFQaNtgrUwH/ldXxvS7FseSnGutXy/6ifUmeAA03mA==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 8b71c815-e979-4d70-660e-08d8e3dbea79
x-ms-exchange-crosstenant-originalarrivaltime: 10 Mar 2021 15:48:14.3123 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: YnhDkcCmgDfmc5eK6/cSlWMCEsD47d56H3RVLdp/nAdRelIdh4yXGLKP+Qdy8TxmyJkzCtLiM35JAfocenqQAg==
x-ms-exchange-transport-crosstenantheadersstamped: SJ0PR02MB7312
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
Cc: "babush@rev.ng" <babush@rev.ng>, Brian Cain <bcain@quicinc.com>,
 Alessandro Di Federico <ale@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBGZWJy
dWFyeSAyNSwgMjAyMSAyOjIxIFBNDQo+IFRvOiBBbGVzc2FuZHJvIERpIEZlZGVyaWNvIDxhbGUu
cWVtdUByZXYubmc+OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IFRheWxvciBTaW1wc29u
IDx0c2ltcHNvbkBxdWljaW5jLmNvbT47IEJyaWFuIENhaW4NCj4gPGJjYWluQHF1aWNpbmMuY29t
PjsgYmFidXNoQHJldi5uZzsgbml6em9AcmV2Lm5nOyBwaGlsbWRAcmVkaGF0LmNvbTsNCj4gQWxl
c3NhbmRybyBEaSBGZWRlcmljbyA8YWxlQHJldi5uZz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
MiAwMi8xMF0gdGFyZ2V0L2hleGFnb246IGltcG9ydCBSRUFETUUgZm9yIGlkZWYtDQo+IHBhcnNl
cg0KPg0KPiBPbiAyLzI1LzIxIDc6MTggQU0sIEFsZXNzYW5kcm8gRGkgRmVkZXJpY28gd3JvdGU6
DQo+ID4gK05vdyBsZXQncyBoYXZlIGEgcXVpY2sgbG9vayBhdCB0aGUgZ2VuZXJhdGVkIGNvZGUs
IGxpbmUgYnkgbGluZS4NCj4gPiArDQo+ID4gKzo6DQo+ID4gKw0KPiA+ICsgICB0Y2dfZ2VuX21v
dmlfaTMyKFJkViwgMCk7DQo+ID4gKw0KPiA+ICtUaGlzIGNvZGUgc3RhcnRzIGJ5IGluaXRpYWxp
emluZyBgYFJkVmBgLCBzaW5jZSByZWFkaW5nIGZyb20gdGhhdCByZWdpc3Rlcg0KPiA+ICt3aXRo
b3V0IGluaXRpYWxpemF0aW9uIHdpbGwgY2F1c2UgYSBzZWdtZW50YXRpb24gZmF1bHQgYnkgUUVN
VS4gIFRoaXMgaXMNCj4gZW1pdHRlZA0KPiA+ICtiZWNhdXNlIGEgZGVjbGFyYXRpb24gb2YgdGhl
IGBgUmRWYGAgcmVnaXN0ZXIgd2FzIHBhcnNlZCwgYnV0IG5vIHJlYWRpbmcgb2YNCj4gdGhlDQo+
ID4gK2BgUmRWYGAgcmVnaXN0ZXIgd2FzIGZvdW5kLg0KPg0KPiBUaGlzIGlzIG9kZCwgYXMgaXMg
dGhlIGRlc2NyaXB0aW9uIG9mIHdoeS4gIFllcywgaWYgUmRWIGlzIHJlYWQgd2l0aG91dA0KPiBp
bml0aWFsaXphdGlvbiwgVENHIG1pZGRsZS1lbmQgd2lsbCBhYm9ydCAoYXQgbGVhc3Qgd2l0aCAt
LWVuYWJsZS1kZWJ1Zy10Y2cNCj4gZW5hYmxpbmcgdGhlIGFzc2VydGlvbnMpLiAgQnV0IHlvdSd2
ZSBqdXN0IHNhaWQgdGhhdCAibm8gcmVhZGluZyIgd2FzIGZvdW5kLg0KPiBTbyB3aHkgZGlkIHlv
dSBwZXJmb3JtIHRoaXMgZHVtbXkgaW5pdGlhbGl6YXRpb24sIHdoaWNoIHdpbGwgYmUgZWxpbWlu
YXRlZA0KPiBsYXRlcj8NCg0KV2hpY2ggaW5zdHJ1Y3Rpb25zIHJlcXVpcmUgdGhpcz8gIFRoZXJl
IG11c3QgYmUgYW4gYXR0cmlidXRlIHRoYXQgd2UgY291bGQgY2hlY2sgdG8gc2VlIGlmIGl0IGlz
IG5lZWRlZCBiZWZvcmUgZW1pdHRpbmcgdGhlIFRDRy4NCg0KVGF5bG9yDQoNCg==

