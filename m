Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB05533A9C2
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 04:10:15 +0100 (CET)
Received: from localhost ([::1]:51110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLdcV-0005HT-0v
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 23:10:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lLdbi-0004su-42
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 23:09:26 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:4633)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lLdbg-0005NH-An
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 23:09:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1615777764; x=1647313764;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KgjmGotcUAAvjp84d2VRz2qf92jtU8Tlf5C4TwuqvlM=;
 b=FvuWmLChAdrh39MO7CNahAZshSXCrTMNvZHKr3D1/c28Ew2sF91kEhzc
 ZMXm8W1ySZM3q1EoErp7lH1JVns6DaOPQHXhKVSVRFrK0+A0i4lZZoR+M
 Zi85dzT+KET7bzjGYGvYwryI93W9Z7E+QMkb8hzRlrZB12NtlLjK7A3u0 g=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 14 Mar 2021 20:09:22 -0700
X-QCInternal: smtphost
Received: from nasanexm03a.na.qualcomm.com ([10.85.0.103])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 14 Mar 2021 20:09:22 -0700
Received: from nasanexm03e.na.qualcomm.com (10.85.0.48) by
 nasanexm03a.na.qualcomm.com (10.85.0.103) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 14 Mar 2021 20:09:22 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Sun, 14 Mar 2021 20:09:22 -0700
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB4229.namprd02.prod.outlook.com (2603:10b6:a02:fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 03:09:20 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6%4]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 03:09:20 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v8 26/35] Hexagon (target/hexagon) TCG generation
Thread-Topic: [PATCH v8 26/35] Hexagon (target/hexagon) TCG generation
Thread-Index: AQHW/d3cMUb/GhKg1U2DIZ/7+BgFyKpYYS2AgCcvXFCAA1mTAIABqo4A
Date: Mon, 15 Mar 2021 03:09:20 +0000
Message-ID: <BYAPR02MB488645993028485AD75BC157DE6C9@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-27-git-send-email-tsimpson@quicinc.com>
 <ebb86dcd-d89b-3901-3c59-08c6bfb3ed23@linaro.org>
 <BYAPR02MB488669BE2DBB06AAACD416B3DE6D9@BYAPR02MB4886.namprd02.prod.outlook.com>
 <aeb28623-e7ac-3b35-0a0f-0a9b175e8cfb@linaro.org>
In-Reply-To: <aeb28623-e7ac-3b35-0a0f-0a9b175e8cfb@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac0f8ccf-0e4e-447f-4cfe-08d8e75fba2e
x-ms-traffictypediagnostic: BYAPR02MB4229:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB42292619D21C7FFEA3F71CB4DE6C9@BYAPR02MB4229.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9PUEpJtXYYT2744HKo/OcPz6Oiqmyn09QWbEl4ZXuTHKe2LFsCqyllsknDVdEr4TZmkE4UOodjLwaoCQiNcmMWKuFmRAVAuqQ9UrsXS7EbtFW+yGfSsAAsSalIF7h/HINVuXQR63OO9NtaUHi6u/l3rtxheO7gxYJAD/6WxcYI3Ac3Ih6V10Eo1lBYTGYUexmxdGScIXc4YsQu6CDApkzdUa6xwAA0UXY2rnKAv2/XPkpBTyKCbapKqXlL4WasRyLuZCEFLfNgO6QosHp5Yy5Ni+lG3trSMDEsnU4hnbjXiH1p+cSQ/p1q3gW3/Q2Qzeuka9j06n9dUULkh//94I8rLtwirQdsq53KcVsr821Vrou1CMCpVwHYZ20+o38EvIkeCV5cP3tf/A3CmALuD/j6+2SnWO/nebvJLzoAR22xBCY4mSADlv51Y5zl66k2WAB/yvGOjAZiz/9p7QIdLn9saq5zmJUsgARP346iCnZM38AAEZQXbca9LxEpJgof23rOFUTi3V3UCIKturToCSGuXYvk/cBXQcB9VrDSfRtYUKNMxSZpXPLA+E61LOJbXY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(396003)(376002)(366004)(4326008)(186003)(9686003)(26005)(86362001)(55016002)(66556008)(107886003)(66446008)(76116006)(6506007)(53546011)(66946007)(66476007)(71200400001)(316002)(5660300002)(52536014)(110136005)(2906002)(54906003)(478600001)(8676002)(8936002)(7696005)(33656002)(83380400001)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?OUxFbUluNWk5eitGQmgyNEMyNUtoamt1T1Y0dzEyV0NzeTExNDIvWWpLOU1v?=
 =?utf-8?B?UFlySUxKRkV6OWdJS29DZXdCY3lKNkc2YURCS1VrZU0wbHRObmc5RElXT2pw?=
 =?utf-8?B?K2V2QThobUpzZ2oxZ1FnUTZkbXBDTEhLOHl3MERBV0Exd2tBVEdaeExyQklp?=
 =?utf-8?B?ajgzTnRhVHBoeWcxd2xhY2VodUtpTUpEOHVCUCtmeGlWR1FDc3dlZTBnUEx1?=
 =?utf-8?B?NFIweGRMMnd3WHFscnBSZXQyVm1McG1KZGZVZU5YK0plNmJMMFdCS2dHZ2Ry?=
 =?utf-8?B?alkwUU9mK2ZnbWVlWHk1VWhLVmdFS29QejJ2Q1pqU0xxYThVQ1VFVzQzNy9I?=
 =?utf-8?B?RUdDTXUrUmplTGFXcmpHTW1QWkdoTU0vd0VJbUxJYkdHTGE3N0RHeEtEYnF5?=
 =?utf-8?B?K3hGWHRyaFJBOE5xMnFqUmZLUlBhbFpldUxueFdJUm5tNzcwczBxZUREcDZx?=
 =?utf-8?B?ZDN5SUIvMzkzanUxUDJIeUwwMTk2VXpjZ09ybU9PdlAzUFo1ME16QWFGSkR2?=
 =?utf-8?B?eTh3ZjN2TWg2QmJlZUtLd1J4Vk5pOEVjazlvTGxMRllGZmh4Q3NuN1lMc1Bp?=
 =?utf-8?B?bGthNE4wMitmM3VqMy8xSm54Ty9oZ1ZpWGRPT0c2R1EzaVR2WHp2YWoxUTYr?=
 =?utf-8?B?ZWdnUklLT0poOHVicG13S0ltUm9XRVlLcDA4SGNCMStnWURYYVB2Z2N5VXJF?=
 =?utf-8?B?S0FQenIxajlhakJ4ZUNqNmJUWjNWRnBQM2pNVm83ckZ1a3hPcXNJSEUzRUNs?=
 =?utf-8?B?LytDOG1RNnRTclNJREdXMlpmUFJ2WEdOTTF3OE5DazBwNjNJSS9ibVhOZnVM?=
 =?utf-8?B?d0FFemw4VXhHTk5qN1VzcGVFclVEQ2hLY1NVcjNUYm1lQU5EaHZBVUZzeWdC?=
 =?utf-8?B?OW93cVhjcGt6UVQ0YzFQM0E0aWF1TTVGM2p4ZGNDTFdWbm51bDJsSXFHMzBv?=
 =?utf-8?B?eWI4aEdJck5DcHJPUG02NnJtT1BpYm5JUExyWE9nb0ZyUWgrcER6RXE3TnRl?=
 =?utf-8?B?cUc1Vng1UXlUKzJuRTFaVmRqYVJCM1FTQSs1ZjVmZER0NmRzb1Q2Y0N3OFl6?=
 =?utf-8?B?WXhUa3dEd3g1K0VkVWxvVXpSUkZMbjc2Z3EyeTZ0OHkxb1B0TVpERmtuaUlw?=
 =?utf-8?B?Qm8zUTRwRTlCaVdRZ1VTOW9JNVFVSWROazk2ZUsrSU91UVdLYTVITlNyeEd4?=
 =?utf-8?B?cnY3MkNPUDYvMGwxU2FIU1M4NEs2UDFrQjF3bXRNd0JuemdiWkp2OTVUN29B?=
 =?utf-8?B?dlZZSCtMTWJ0b3hjYk85b0x0bDJUYzIyVDBqeGUwaGM1Zy8zd2w1bTJWdktG?=
 =?utf-8?B?UnZCT240VU9HODVDYjhwZEFXRDY4eDBFRXVQcFlMVHhNU2pHQVVtdEEraC9U?=
 =?utf-8?B?blRvZkpEaE1iN0RGY0lLY1dQdEZqNGdIMlpZbGlVTjVGQk1PN2tnQUxIVUJP?=
 =?utf-8?B?RjlXR0Rvd2RaMFFvbTlpY1JJTUVuUmV1WmdMVDcyb2RhcmpJV1NRSE1qTGpZ?=
 =?utf-8?B?c1MvSjN2QnRJOWYxa2RKb2tyaWM2VWc5a2xqbVZYWXIwSGFmS01pa2NITFph?=
 =?utf-8?B?dWUzanFubi8ydDVzSUJ5b284aGRUR0NiOE5mSHY4UEtBVW44bnZNNUJERlFG?=
 =?utf-8?B?emVsTXE4QWtmRVhlN3M0dXM1U0U0OUdmcFllRnpjL0xJc2gxcXhYV2FRWml2?=
 =?utf-8?B?Z01MeXNDM1dVSzA1Z0J2UGpqa3NhTk4vR0t6b2NhMjkzQk9GTCtiVllSd0FF?=
 =?utf-8?Q?EGtcjvSqPFr+7yamtTJLvvsPZZfafSsVnvQOA5c?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BBPILOSSGmxxnl8vcKojN2GEoePLyDsE8h6OEcqwrA+/RXI7a1HfHLqQrs5vh25SMho0keZ3H+E82otX4cfIB0yGpAXH2vTW4t20Mxiz6gxxta1UsNRMY21E0PeKWIHJeGNOK8hjZotgqN5eL/z6QLLkt5lgBVqjoaCrnKbgKhPK6UiLbnwLXMFHVZu76yC/KPQdDpAC9+lAlfSsha58a2sDx/qqsbLgYjOepUu7sVj0PatEW5lXt70xCAXEIxZkjY1dt8+mhU7Sp8Q3FXQMFOx3FxFnLtOgcF1pRmN0CL9i8c2uREJqIReihwgEXASoDSoW49c0YDaQn4J3+5U/Vg==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Or0h06V6UYHY1ryjegw04tABpVq0j5SU1lRTKrsdi20=;
 b=LOcTC+GOcTSd6IfYTgIZnIra0DB8pqf/xv5xTs3xULio8wGL4dLtZ6GxZz+tuvcjufsoxEBIBZfSu06zrkUo7sGtHnVSlBMfiy6aztBDWSqv5XRJJWa9jcDpzPB+ZNuQHsWyHMLXO+jEVpQVqLNLZpN4f1oRHE0q1uQrX5zWbOcvJ+T0W+V5ykTqgAXnli+quotE13BwM0dvnyuaBS0mhX1LS9Mp+PkXWir/saQ413oDxeW2gDgPK9u7/URyLVBN8Pv71/2ij2naWZHKXAsAxZf3i57mrEBbjTl7FRm2MjJVRYrwjB9x0ZZ/6+ztFjmWCaRzw/FriFdKTwLI/KijTQ==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: ac0f8ccf-0e4e-447f-4cfe-08d8e75fba2e
x-ms-exchange-crosstenant-originalarrivaltime: 15 Mar 2021 03:09:20.2402 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: EBqemB9zyjekRaj0chj2XXsERecegBesgNqTTBj5hF7dgxe18iRLm3TSH3oEFTk2/GrBDSCNoLCKm8S/1KZC9A==
x-ms-exchange-transport-crosstenantheadersstamped: BYAPR02MB4229
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
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFNhdHVyZGF5LCBNYXJj
aCAxMywgMjAyMSA3OjQwIFBNDQo+IFRvOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2lu
Yy5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IHBoaWxtZEByZWRoYXQuY29tOyBh
bGV4LmJlbm5lZUBsaW5hcm8ub3JnOyBsYXVyZW50QHZpdmllci5ldTsNCj4gYWxlQHJldi5uZzsg
QnJpYW4gQ2FpbiA8YmNhaW5AcXVpY2luYy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjgg
MjYvMzVdIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBUQ0cgZ2VuZXJhdGlvbg0KPg0KPiA+PiBF
eGNlcHQgZm9yIEhFWF9ERUJVRywgd2h5IHdvdWxkIHdlIG5vdCBrbm93IHdoZXRoZXIgb3Igbm90
IGENCj4gcHJlZGljYXRlDQo+ID4+IGhhcyBiZWVuDQo+ID4+IHdyaXR0ZW4gdHdpY2U/ICBJdCBz
ZWVtcyBsaWtlIHdlIHNob3VsZG4ndCBuZWVkIGhleF9wcmVkX3dyaXR0ZW4gZm9yIHRoZQ0KPiA+
PiBub24tZGVidWcgY2FzZS4NCj4gPg0KPiA+IEl0J3MgbGVnYWwgdG8gd3JpdGUgdG8gYSBwcmVk
aWNhdGUgbW9yZSB0aGFuIG9uY2UgaW4gdGhlIHNhbWUgcGFja2V0Lg0KPg0KPiBJIHJlcGVhdCAt
LSB3aHkgd291bGQgeW91IG5vdCBrbm93IHRoYXQ/ICBZb3Ugc2hvdWxkIGJlIGFibGUgdG8gZXhh
bWluZSB0aGUNCj4gcGFja2V0IGFuZCBzZWUgd2hldGhlciBpdCBkb2VzIG9yIGRvZXMgbm90IHdy
aXRlIHRvIGEgcHJlZGljYXRlIHJlZ2lzdGVyDQo+IG1vcmUNCj4gdGhhbiBvbmNlLg0KPg0KPiBT
aW1wbHkgYWx3YXlzIGdlbmVyYXRpbmcgY29kZSB0aGF0IGFzc3VtZXMgaXQgaGFzIGlzIGxhenku
DQoNClNvcnJ5IG1pc3VuZGVyc3Rvb2QgdGhlIHF1ZXN0aW9uIC0geWVzLCBpdCBzaG91bGQgYmUg
cG9zc2libGUgYXQgVENHIGdlbmVyYXRpb24gdGltZSAocmF0aGVyIHRoYW4gVENHIGV4ZWN1dGlv
biB0aW1lKSB0byBkZXRlcm1pbmUgaWYgdGhlIHByZWRpY2F0ZSBoYXMgYWxyZWFkeSBiZWVuIHdy
aXR0ZW4uICBJIHdpbGwgY29kZSB0aGlzIHVwLg0KDQpUaGFua3MsDQpUYXlsb3INCg0K

