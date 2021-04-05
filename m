Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 338FE35490D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 01:06:11 +0200 (CEST)
Received: from localhost ([::1]:43242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTYIL-0002hs-LH
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 19:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lTYGF-0001tm-GY
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 19:04:00 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:46543)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lTYGC-0008Ql-Um
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 19:03:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617663836; x=1649199836;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bKaeOi+7xvWdnvHnbCiC1iYG9qujjz9f2341y7c+kwU=;
 b=JZduUTf2yUHAZ+kTb6XgQCCI5hFwY8y0dqwVd6bWQsz2uJ6/dFie4lf4
 Jf5IC63hBzT9ywVfLGVnupGJDAr/jqucHDfNrolgydaqTnrxi3LJ+pX17
 SUnNMERUm6OR1ohCNlcpR0VUPvmOHN8haWWWD2vSOTM9KBR5Zh3Z+ESaU 8=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 05 Apr 2021 16:03:51 -0700
X-QCInternal: smtphost
Received: from nasanexm03c.na.qualcomm.com ([10.85.0.106])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 05 Apr 2021 16:03:51 -0700
Received: from nasanexm03a.na.qualcomm.com (10.85.0.103) by
 nasanexm03c.na.qualcomm.com (10.85.0.106) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Apr 2021 16:03:50 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03a.na.qualcomm.com (10.85.0.103) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Mon, 5 Apr 2021 16:03:50 -0700
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB5319.namprd02.prod.outlook.com (2603:10b6:a03:67::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Mon, 5 Apr
 2021 23:03:49 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608%6]) with mapi id 15.20.3999.032; Mon, 5 Apr 2021
 23:03:49 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH v8 26/35] Hexagon (target/hexagon) TCG generation
Thread-Topic: [PATCH v8 26/35] Hexagon (target/hexagon) TCG generation
Thread-Index: AQHW/d3cMUb/GhKg1U2DIZ/7+BgFyKpTrq6AgFM0xYA=
Date: Mon, 5 Apr 2021 23:03:49 +0000
Message-ID: <BYAPR02MB4886B81512579C4A88AA99D0DE779@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-27-git-send-email-tsimpson@quicinc.com>
 <13a3eb3b-49e8-f62e-5222-e787911b69f8@amsat.org>
In-Reply-To: <13a3eb3b-49e8-f62e-5222-e787911b69f8@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [2603:8080:2704:8f00:b0ec:f6d4:b80d:779d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ae7cdea-90c0-4dee-5a1a-08d8f88712d3
x-ms-traffictypediagnostic: BYAPR02MB5319:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB5319E74C1EA3B712566C8381DE779@BYAPR02MB5319.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:147;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RGwwHWEEoktg/QS/Pf8z6GN1v8Y8MUXCpCc40vVBRexef5GxNnce8jDUytk1LW3j7EW0Y+3EyhiydHArC40DitIyUYdsZPxX0ovQqxSa2xed3x8/4JmBXcQ0y3VDBndrlIP3Wz8GAtw0Qh9hG4XtDYzT/u5EasFjF9v1C2catx83Kxih/bI0MdltIkjbswR4KQtZLYLYh4DwMmIbIhIIu+J512BaCc4iAzZMztMelX/nu/mJZ5CEyjtUbVjTwQIJLUxgDLk/0LQ8ZQbDx7V0haIHNGOEy7NOT/LgxSEmVOOJ4hGyQWFYJUNIJKWX7ZI9cqp6g1F31Zw3uFhWALFLHwfL3aZ39AIGJZirhj97cuQ6Etu9+QhqxTWbffAziV8+EzziygHtgQUVUHS0KKaWGnORuEb7BbhIdDigwZcYLiN+1TNDYd8wqlpZEjCvWMF8c93GJ8CfdZw3K1Wl+skk8IgQ9BlDXgv9uvFg1HaO2C64rnhC4K/R1HNF0DmZoSzQ45bNdvkMbe67zllK703smCqPr6E3cbw4Nn0FuhXOHtsIgXbEupXdmPDudUg8ljVMuDpr9bDiq569PEvJXe/5X4LurxUccB6Za1NDiNIoCa2OpUmlipn4P/fRWcgM34dqzVb9I5PYkuyxcSUfZKt7WbTDGUGWEPD+NUKdfTwB6hw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(71200400001)(6506007)(53546011)(478600001)(83380400001)(110136005)(316002)(54906003)(66476007)(64756008)(9686003)(86362001)(7696005)(52536014)(5660300002)(76116006)(66946007)(33656002)(66446008)(66556008)(38100700001)(2906002)(8936002)(107886003)(4326008)(186003)(8676002)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?KzhLbFpNZFdCUE1LTlVSZ2JyeVlEUkhjc09oVDlNZUthVXBQbU02aGZPZE03?=
 =?utf-8?B?WDExYjBUak1jbElKbzkvWTkvcWRPdTl6elJJMFFEcmNndjI2ZnVvcG0xUG5N?=
 =?utf-8?B?YkgrKytrb1ltcEY3dnZnU0ZuU2FJZkZpQXltWXZuWEkzRVdkbCs0THFONWVG?=
 =?utf-8?B?aG5JMnE0bU5KeFJWYSt6OVNxaVhsS1ZwdThIZDZxM1h0bmtUT3JtYUJlN1lV?=
 =?utf-8?B?WnpSak9iZzFwUE1abFVaamRkNUN2QkFSWmtKR00rbGh3QW5tRTY1aG1QeXNo?=
 =?utf-8?B?UUJSb0pveC85b2lva3QzcHVPaGhvYXpvUDJsQVpPQ0NtSnFHdSt1THIwWlhk?=
 =?utf-8?B?Z2hmVDRPTEtNZDRweHBqTU1SYVo4R29wR2c3SUdLM3ljR1FiSlNqVzdhUThW?=
 =?utf-8?B?K09wL0JGTDZlU3NTckVKbURQSnJBWnA5L0xxTWtkTE9IVzIzNHQ0UEE3alFK?=
 =?utf-8?B?N2U2bGVYRzM2VmRySFhRRmpGbFMxSmdEUGxXK0JLcTBBdTQrWlFlbDdzN2ND?=
 =?utf-8?B?MldFSzZhbHRTT2ZUK1d1Q2g5TGN6ZThkekVvRlBOUUN6dTUzZUV2SGwrcXo4?=
 =?utf-8?B?Rk01eE9tWUFoK3JxUW4rN2FJM01LWnpmTlJPM2VxUFNBRlhvZnl2ZnQ2M3o2?=
 =?utf-8?B?TlQrNnl0M0hKQmdoWENCYndpVnM2QnQ0Wms3QXc2R2VScHRXOCtoTlNmazAr?=
 =?utf-8?B?MVcxbnZsL2ZZVmxCTElMZTJoQzVSSDVqSlF5VUVpVmtIVEU1eVhhWW1QU0ha?=
 =?utf-8?B?MGFaejczSUZQWHJLVzR6OEN4MmMyWkZIRUhEQUdaMWtNb2cvUWdlUGRrUXN6?=
 =?utf-8?B?ekRPSG5PYUpLZHBtRVN3cWJwSXAwTkVxckEzajVYK1V6Y2h6UFEySlJqWDBt?=
 =?utf-8?B?eENOK1BFbTVmS0NEN2luMytlRmZoUGVSV0RRandCM21uamQxck45cjJQM2w4?=
 =?utf-8?B?bURlaDRwVTh1L1dmdXdmS0JZQitOcmMzOVVnSERvSEFOV1BoUGVueW9Neisy?=
 =?utf-8?B?VTM0T0xVdWNyMEpvL09DdXRyM1d4czNUVmFOSDUwQzBvSDFyajdqSHBMZDhh?=
 =?utf-8?B?Mms0M1Y4SWJLSmEvYlRSM2VNV1ZvQzR1djcwMzFWa2RITFpBYWY0VDVMVlFx?=
 =?utf-8?B?N2RvcFZ3aDRxQzYrSjFtWmRDeWZ4NldVMG8xM0VvbDU4eG5QejJRU2YvbTBm?=
 =?utf-8?B?cnVVM2dQNGY3L01vTno0Rnp3RFY0a3VXOCtwM21MZmRWUGMxRldPTjBGWjNR?=
 =?utf-8?B?dldrdDRMY3RxaVNvYUlTOTJuY2hQejZzVnVrdzQya3AvOHR5bGkwWHBFU2k3?=
 =?utf-8?B?VExoZjdpQ1lUWms5Z25aZW12ZDZLNEtVTHFoMm1kTitwU0VxNnRFU1pQMEJP?=
 =?utf-8?B?M2kwS0lTL0Nob1dZM091TU1xWHdvNHZCWTM3N1B6U1hQNTd2Qzc3NHpGWlJm?=
 =?utf-8?B?NjBxZHpFWElmL1NzOTRTMEVmMGpTcXBwTW5tWnZUOGVFWnJSUXdEeHdoZUxH?=
 =?utf-8?B?ZG5PU1J6bnVsdVJCK2I5bDlpcmRoekt1bXZMRGxOU1VTZnd0RzVYaDVOOVhr?=
 =?utf-8?B?VFlyckxnSEkwNmRnb2hyM3d5S2NoZmpGKzF3OG9EYzJyL0dJSlp3M2dBVUd4?=
 =?utf-8?B?OUYvSU9ld0h4VU1sbWVqMzJ6WTFlUk50UlJDK2FmaXByd1BkbWQ3NmM0QnJn?=
 =?utf-8?B?QitXbFptbWhlcUhlbUp1OVBub2R6Rmc0cncxYlFTQStpRUZnbGRFbm5QZXAv?=
 =?utf-8?B?c1lKTmNnN3dzYWV3TC9lRU5VYjRKSTZCZnhpZk9xU094ZDJMdmpaak5oSk02?=
 =?utf-8?B?QU51Z2tReUJSM3RWVnBsTEhqT2hVK2RtQ3o4MHBQOWRFSEg2TWF5TEVtN1lR?=
 =?utf-8?Q?hI81bOvUSjXk0?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOEiqsJOtPXPUdblnVN02w7llBCUPjrVopNQtEtPFlrAVl1yW5FWIEcBBJhEDehh4vGHFBNZnRLjgU2PokKt2qgOdDyyH8fq23aajFIynODiADFOh+wpFoNx5mgRIPbB0YQBa9FzudaM5LP62NTGZCK3cKxRVe3GoJx/kCko8IWynQa6k5VA+7sVf4HiLCAzLF1bTVxKE4OZ3+IafIZJS0ajPrZ/CWPW1kFQ6jaiiSzQoXy6/cVpK5hCBxokW6laVqIDD3rKtUFJb7paTUgCs0VmTVjBwwsdgORHWOAIRMnbNbbvu8/h19/kGdnE3cn53EvKFfKnqW5QwGRXJTpFCA==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7/2q75KRjbvWos8iscDlbBtSHPxigsgQ4zdp7YwA8s=;
 b=cdsk6JEr/IHkJyrDZXcP9A8cbN3tloyNrbdfeFjzS99Iv2wiQU5sdUdE6Nkpo2nUdiDYNHGxm0hU8RToiqUTmut3PFgj+O7MGlg5UcgRmtCUO6a0Wyecklr486nx1WvXZ3TKmmAQzEN0KkTxliV8Plijnm9+hp5ApYnC0CZaSaQmLmSBGZfdWPgcvc3ZDgZuDXmkREpsuEFII2PLfsqsDEL4bp652iN3zkFcTFWhM57BQSiq6+K0dfJqe0g9bNZD/QpbLRRzOCEOS+mKQLXRhOHct16ZoF56Fp1wPB/7aiufyGstREAhMo/W/aIdCv3TO2qanRpPIcgP71dQGLhwfA==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 4ae7cdea-90c0-4dee-5a1a-08d8f88712d3
x-ms-exchange-crosstenant-originalarrivaltime: 05 Apr 2021 23:03:49.1490 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: j9zKFa7Y8kP867LLFTJcLvu7QfLuHKAtblL3LLUeWqSwSMMUmdAffnZssnXKt/2KeHpEzDCafc4j88woedrrjQ==
x-ms-exchange-transport-crosstenantheadersstamped: BYAPR02MB5319
x-originatororg: quicinc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.39; envelope-from=tsimpson@quicinc.com;
 helo=alexa-out-sd-02.qualcomm.com
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
T2YgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kNCj4gU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDEx
LCAyMDIxIDY6MjMgUE0NCj4gVG86IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNv
bT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogcmljaGFyZC5oZW5kZXJzb25AbGluYXJv
Lm9yZzsgYWxleC5iZW5uZWVAbGluYXJvLm9yZzsNCj4gbGF1cmVudEB2aXZpZXIuZXU7IGFsZUBy
ZXYubmc7IEJyaWFuIENhaW4gPGJjYWluQHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHY4IDI2LzM1XSBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgVENHIGdlbmVyYXRpb24NCj4N
Cj4gSGkgVGF5bG9yLA0KPg0KPiBPbiAyLzgvMjEgNjo0NiBBTSwgVGF5bG9yIFNpbXBzb24gd3Jv
dGU6DQo+ID4gSW5jbHVkZSB0aGUgZ2VuZXJhdGVkIGZpbGVzIGFuZCBzZXQgdXAgdGhlIGRhdGEg
c3RydWN0dXJlcw0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1w
c29uQHF1aWNpbmMuY29tPg0KPiA+IC0tLQ0KPiA+ICB0YXJnZXQvaGV4YWdvbi9nZW5wdHIuaCB8
ICAyNSArKysrDQo+ID4gIHRhcmdldC9oZXhhZ29uL2dlbnB0ci5jIHwgMzMxDQo+ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAyIGZpbGVzIGNo
YW5nZWQsIDM1NiBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0YXJnZXQv
aGV4YWdvbi9nZW5wdHIuaA0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdGFyZ2V0L2hleGFnb24v
Z2VucHRyLmMNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyBi
L3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBp
bmRleCAwMDAwMDAwLi43NDgxZjRjDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL3Rhcmdl
dC9oZXhhZ29uL2dlbnB0ci5jDQo+ID4gQEAgLTAsMCArMSwzMzEgQEANCj4gPiArDQo+ID4gKyNk
ZWZpbmUgUUVNVV9HRU5FUkFURQ0KPg0KPiBNYXliZSBtb3ZlIHRoaXMgLi4uDQo+DQo+ID4gKyNp
bmNsdWRlICJxZW11L29zZGVwLmgiDQo+ID4gKyNpbmNsdWRlICJxZW11L2xvZy5oIg0KPiA+ICsj
aW5jbHVkZSAiY3B1LmgiDQo+ID4gKyNpbmNsdWRlICJpbnRlcm5hbC5oIg0KPiA+ICsjaW5jbHVk
ZSAidGNnL3RjZy1vcC5oIg0KPiA+ICsjaW5jbHVkZSAiaW5zbi5oIg0KPiA+ICsjaW5jbHVkZSAi
b3Bjb2Rlcy5oIg0KPiA+ICsjaW5jbHVkZSAidHJhbnNsYXRlLmgiDQo+DQo+IC4uLiBoZXJlIHdp
dGggYSBjb21tZW50Og0KPg0KPiAjZGVmaW5lIFFFTVVfR0VORVJBVEUgLyogVXNlZCBpbnRlcm5h
bGx5IGJ5IG1hY3Jvcy5oICovDQo+DQo+ID4gKyNpbmNsdWRlICJtYWNyb3MuaCINCj4NCj4gYW5k
IHVuZGVmPw0KPg0KPiAjdW5kZWYgUUVNVV9HRU5FUkFURQ0KDQpPSw0KDQo+ID4gKyNpbmNsdWRl
ICJnZW5fdGNnLmgiDQo+ID4gKw0KPiA+ICtzdGF0aWMgaW5saW5lIFRDR3YgZ2VuX3JlYWRfcHJl
ZyhUQ0d2IHByZWQsIHVpbnQ4X3QgbnVtKQ0KPiA+ICt7DQo+ID4gKyAgICB0Y2dfZ2VuX21vdl90
bChwcmVkLCBoZXhfcHJlZFtudW1dKTsNCj4gPiArICAgIHJldHVybiBwcmVkOw0KPiA+ICt9DQo+
ID4gKw0KPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgZ2VuX2xvZ19wcmVkaWNhdGVkX3JlZ193cml0
ZShpbnQgcm51bSwgVENHdiB2YWwsIGludA0KPiBzbG90KQ0KPiA+ICt7DQo+ID4gKyAgICBUQ0d2
IG9uZSA9IHRjZ19jb25zdF90bCgxKTsNCj4gPiArICAgIFRDR3YgemVybyA9IHRjZ19jb25zdF90
bCgwKTsNCj4gPiArICAgIFRDR3Ygc2xvdF9tYXNrID0gdGNnX3RlbXBfbmV3KCk7DQo+ID4gKw0K
PiA+ICsgICAgdGNnX2dlbl9hbmRpX3RsKHNsb3RfbWFzaywgaGV4X3Nsb3RfY2FuY2VsbGVkLCAx
IDw8IHNsb3QpOw0KPiA+ICsgICAgdGNnX2dlbl9tb3Zjb25kX3RsKFRDR19DT05EX0VRLCBoZXhf
bmV3X3ZhbHVlW3JudW1dLA0KPiBzbG90X21hc2ssIHplcm8sDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHZhbCwgaGV4X25ld192YWx1ZVtybnVtXSk7DQo+ID4gKyNpZiBIRVhfREVC
VUcNCj4NCj4gQ2FuIHlvdSBkZWNsYXJlIGFuICdib29sIGhleGFnb25fZGVidWdfZW5hYmxlZCh2
b2lkKTsnIGV2ZW50dWFsbHkNCj4gaW5saW5lZCwgc28gd2UgY2FuIGdldCB0aGlzIGNvZGUgY29t
cGlsZWQgKHRvIGF2b2lkIGJpdHJvdGluZykgdXNpbmcNCj4NCj4gICBpZiAoaGV4YWdvbl9kZWJ1
Z19lbmFibGVkKCkpIHsNCj4NCj4gPiArICAgIC8qIERvIHRoaXMgc28gSEVMUEVSKGRlYnVnX2Nv
bW1pdF9lbmQpIHdpbGwga25vdyAqLw0KPiA+ICsgICAgdGNnX2dlbl9tb3Zjb25kX3RsKFRDR19D
T05EX0VRLCBoZXhfcmVnX3dyaXR0ZW5bcm51bV0sDQo+IHNsb3RfbWFzaywgemVybywNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBvbmUsIGhleF9yZWdfd3JpdHRlbltybnVtXSk7DQo+DQo+
ICAgfQ0KPg0KPiA+ICsjZW5kaWYNCg0KRG8gd2UgcmVhbGx5IG5lZWQgYSBmdW5jdGlvbj8gIFdo
eSBub3QgY2hhbmdlDQoNCiNpZiBIRVhfREVCVUcNCiAgICAuLi4NCiNlbmRpZg0KDQp0bw0KDQpp
ZiAoSEVYX0RFQlVHKSB7DQogICAgLi4uDQp9DQoNCg0KVGhhbmtzLA0KVGF5bG9yDQoNCg==

