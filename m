Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6835A302E36
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 22:45:41 +0100 (CET)
Received: from localhost ([::1]:56450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l49g4-0006Uz-0W
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 16:45:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1l49em-00065H-5e
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 16:44:20 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:62842)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1l49ej-0004Yl-FZ
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 16:44:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1611611057; x=1643147057;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=11ZgMtwMtHFf8RpSDZLJqami50RoQl/tT1tU1c7bhCM=;
 b=pqelI4pFW8KgQeQ0+gbmipiI8WegQPm9AGP5tYA6kdxPA3UYfgJv6ju9
 o67XQWRAVsSpU2ga2JBDsnRoBVRCy4ahqJ4WWavVTSkAMvzYvnANWIlr+
 016Nv11q/WGnxGbwlUTtNVWU7Spk5W1qJ6k8q3kIDOhRxUiSfFIvMJ6Kp g=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 25 Jan 2021 13:44:13 -0800
X-QCInternal: smtphost
Received: from nasanexm03a.na.qualcomm.com ([10.85.0.103])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 25 Jan 2021 13:44:10 -0800
Received: from nasanexm03b.na.qualcomm.com (10.85.0.98) by
 nasanexm03a.na.qualcomm.com (10.85.0.103) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 Jan 2021 13:43:20 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03b.na.qualcomm.com (10.85.0.98) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Mon, 25 Jan 2021 13:43:20 -0800
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BY5PR02MB6963.namprd02.prod.outlook.com (2603:10b6:a03:236::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Mon, 25 Jan
 2021 21:43:19 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::41f5:1c20:959e:559e]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::41f5:1c20:959e:559e%7]) with mapi id 15.20.3784.019; Mon, 25 Jan 2021
 21:43:19 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH v7 15/35] Hexagon (target/hexagon/arch.[ch]) utility
 functions
Thread-Topic: [PATCH v7 15/35] Hexagon (target/hexagon/arch.[ch]) utility
 functions
Thread-Index: AQHW7tx4h/5dl60vZUyjfMKcSizWA6oz9aQAgAA+qdCABFyGAIAAVVTw
Date: Mon, 25 Jan 2021 21:43:19 +0000
Message-ID: <BYAPR02MB48864B99522406E29055A665DEBD9@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
 <1611113349-24906-16-git-send-email-tsimpson@quicinc.com>
 <8e41b920-e7de-a7da-bba1-f8a649006955@amsat.org>
 <BYAPR02MB4886B63FA0C74ACAE6275F6ADEA09@BYAPR02MB4886.namprd02.prod.outlook.com>
 <2a41dce6-7b6e-8764-3c8f-1439079f1982@amsat.org>
In-Reply-To: <2a41dce6-7b6e-8764-3c8f-1439079f1982@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [76.120.51.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06da541c-0f31-41f7-fd29-08d8c17a3b4b
x-ms-traffictypediagnostic: BY5PR02MB6963:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB69636FBA9DA74FBF8F783C4EDEBD9@BY5PR02MB6963.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tYqDfLtagLLjPgidCyEgcRSczfmy85gbFMOYyv7MZ0lAkjnhf+R0eA+0FIC8fSeqVuTXDjBsjuUnWEZzjB3ynFOgy3AJ314VImCdDG25UwxCiQ1hpwqbRqL+lJidEJsPE9ifzs+mDVGx0Gdw76SX5BkmyoRpUFw2rB+W1758O7g30MSjQaQ+wg7+y7iM3DnWhAMxZz+zLyQuLc9mzQzimGTEfwDPP8gFfq00fLz+3CNZ2znx1V0yaY0TpgJeV+dZM14mXWdQ3AnFAFqlNvUWNebUhwWJrtg+RMzLBBy0WsM07C05z3ZOxv1o91P7ITnPASZxXVL+S7RSQIxr3AWfjBIx54wqyasv15msy29yjgjOs94zPD+NUSYsf2kNLBawUOaOD0I3zRjLHWlVAzR6Jw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(66446008)(54906003)(64756008)(71200400001)(66946007)(66476007)(66556008)(2906002)(76116006)(52536014)(110136005)(55016002)(83380400001)(5660300002)(26005)(107886003)(316002)(8676002)(7696005)(478600001)(9686003)(86362001)(186003)(53546011)(4326008)(6506007)(8936002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?ODQwQmdqcjVsaHFzcTExbStpRHR3b3B5L2ZHYitWcHhiZmE0eUU4UWI4V0Zl?=
 =?utf-8?B?UXRXYkRETTZFQk40eEg0UlB0aVFMM0c2b1JvTHFCT1NzcEVmdDV3R2hUblA5?=
 =?utf-8?B?Q2xsa1FLZVQraDU2VkY4TlJyZGpydGVlMTN1VG5WbGhTcndyWEpaVGo2NEhs?=
 =?utf-8?B?cFFpN0xOY2x6NE0rbGlkNWpxN3dickxRVFluVWQwdWRvYnR3WXZlZ3U2cW9H?=
 =?utf-8?B?eDh3UjNRelo5dmEzR1BFK0Z0ZTFtb3BGRjQrdTVVUUpxaWpHL1hleE1sWUxB?=
 =?utf-8?B?cG9DRndVVHNMT1I5bTNYbWJZUjNvaHdhU2hFWEpwaGJmZDc2ZmcwWE5EUExu?=
 =?utf-8?B?b09YS0k3WDcxVHFnaE9KUHRPUjltNkdaakk1R1dOL25ub3Z1ZjVYYnZIOEFH?=
 =?utf-8?B?eDB4eTRaWjFpMVlQSmZ0NTkzKzRKM253TW1KSHBValV0b1lQTlJETDBTYy9v?=
 =?utf-8?B?QUhxMWIvTmZUQyt3NGl0RzdmMmFtQ2ZBTFFYSUxUVTY0Y2p2VTlWMTZNeDF4?=
 =?utf-8?B?NUdjVkppY0VIb285RE5RaUw2aktjZTVQajVXdllqaVU3OGhvZkpOWTEwbkhO?=
 =?utf-8?B?Zng3MXBSUHhtODViR1NGcGEyZVppUElzNWpnWlV2ZGxqWjJ6dE1rU3ZiSnRX?=
 =?utf-8?B?eEtMeTAzRG1qdlVMWXNOMTl1aWZrcGdRSFlzdERZUThrU3B3Zi8xZDhHajBk?=
 =?utf-8?B?b1RBaFIxY1NoUnhnVkVrMUVEWnhRWk9uOVZYMXRsL3pxRUpKYkV6UHQxbmV3?=
 =?utf-8?B?ZFZxajFNV2p2Z2NSTWt0c3NORVcwN01YZlUvbHA4RWhiT3Fqd3NMVzNOWCtm?=
 =?utf-8?B?aFlUVCtrMkVleldnWjBocDdQY1Y2bGM1WUYvY1pxTEttZjErTTV5QitZVXRY?=
 =?utf-8?B?WTVHdCtrUE9SV3d2cHRuSExBTTBXcDVNT1QydVFhRkNsVFc5Nm8yZno3dEp3?=
 =?utf-8?B?N3d3VzhYTVo2QmQ0MEE5M2ljc2xTbzVmKzQ2T0ZURGtLTGVXQmw2UWRLTnF6?=
 =?utf-8?B?VUhhUmE0UTRmMisydkVKU3BST2pFZHc0MFh6anF6ZGVnN25pRzhTMUg1TElZ?=
 =?utf-8?B?cWZGa1pPYlFsQ2M2K2VDZytjOHdmekhvQ096bE52cVF4a244eXNFUVpJZGVL?=
 =?utf-8?B?dlRxRmR1am5jZ2tHYWhlTkxkWXJhZDZUc0FrZnk2Z3d3bFJoN2o5WUFGRGZZ?=
 =?utf-8?B?LzhTcklhcU1ROWRuSjBKQlFvWkpuOGZKZ2ZkOXcrVmU2YVRtS3lEb0haVm1D?=
 =?utf-8?B?a3hSSWx3OHZPbE0xMEx0ak1HbFJBMjJLbEN4QzVuUUg1OUlaMERPTkQyd0Vi?=
 =?utf-8?B?LzJxMGNRaUhoN2pFZjVlUWc4UFBKejBob1lmaHVscCtVbW9OVXdhcStnZ1JW?=
 =?utf-8?B?V3ZvTHpRTUJRdUNiUkFWZ1dKMkNnS0dBUFo2SGc3RWNMeWw1Y25MUGFLaDFK?=
 =?utf-8?Q?KlRIcjvN?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cYaxzH2NaWtDyEQdYyR1e5+hi/FPks4WXLHXvYRk3zPyk+pKJMU7Rngpmq0kCOjxpfVaxPpcOyvESFJUynTLxXlSZjAMAavint/DPI4F3xXlrTC7Q7pMFsoptYzBXUpdaXFDWxAii9nY14pkyy6h7v1vtWPpoogTdqP+h6KRmKVeppoe0mH6nqVEVmtMTLvaeOyc0Xjgim9wP3tGX622dJiXEJpiLZkdvJrSNkdAvbYT1e3yGp6wKw13mDBZU7tWK37Lex5n3dRDuUC3QvFaeVNIMR4SB72Qhb2qdMOUO4c/9wogKnNANoI2MTcPnTJ991QzdhzSOlCG0gw5n6KFFQ==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RfqvMMct3F5Xuf8BhBf1LyxIoiVrQ9gJOSswQyMiY4=;
 b=JJAll2pOvoTFXJzBC15tdeF8p8tE3MovpLNY6TOwpzk7quL/ihLCh3nlXJLc4Ts4jk7/TZNCSanvdV3JLGwMAP57CvNKGbQOLLeUKn/KQIXWHzJ8IU9HtxBTI5kMAtiRwJhjeG+n1aeuw1JybxG7nBKleF/j4qZ/LM4Vo1a37vvvbwGs+uQaIlXEtGgWL3DLSQ2NGsSTMaFaziHWUK6NMNhQcu/1Sy5btP1Yf+OIPZa8D8tg1uuUrLeANuSWxzvqqjKnWnESyBzuQtPMtfbPM6EzO2FNNcxHSpDqp+BKLwgObQpUPfld8kj8AMfPcCWuQ7k2nORI3qqlTHuImalEkA==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
dkim-signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RfqvMMct3F5Xuf8BhBf1LyxIoiVrQ9gJOSswQyMiY4=;
 b=VYHxoeNDnyap0NZifbpPOTmlAQDMd4AiqVmqfRe00JSUw9h5shSeeTnlfLMMNAKKcXEZGu66G/DZHtGry5dL1FI9e/+jhoIvkUQSTzuThsAH7nbfwDP64Fs5lxPajEtjO+RxHvpDYSvl9mU3ItwH5kVH6yeo324zuXC8hbDXUgQ=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 06da541c-0f31-41f7-fd29-08d8c17a3b4b
x-ms-exchange-crosstenant-originalarrivaltime: 25 Jan 2021 21:43:19.6592 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: z3UjmlpmzIXqVu6K1/gJjoZgyJ9ITqYvZj0wDK+efrJ2w7dHfnHF2ABE5Nl7rPT6VgudLbuIEDQH89HeHnVxbg==
x-ms-exchange-transport-crosstenantheadersstamped: BY5PR02MB6963
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
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxpcHBlLm1hdGhpZXUuZGF1ZGVAZ21haWwuY29tPiBPbg0KPiBCZWhhbGYg
T2YgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kNCj4gU2VudDogTW9uZGF5LCBKYW51YXJ5IDI1LCAy
MDIxIDEwOjMwIEFNDQo+IFRvOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+
OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IGFsZUByZXYubmc7IGFsZXguYmVubmVlQGxp
bmFyby5vcmc7IHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc7DQo+IGxhdXJlbnRAdml2aWVy
LmV1OyBCcmlhbiBDYWluIDxiY2FpbkBxdWljaW5jLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2NyAxNS8zNV0gSGV4YWdvbiAodGFyZ2V0L2hleGFnb24vYXJjaC5bY2hdKSB1dGlsaXR5DQo+
IGZ1bmN0aW9ucw0KPg0KPiA+Pj4gZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2FyY2guYyBi
L3RhcmdldC9oZXhhZ29uL2FyY2guYw0KPiA+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPj4+
IGluZGV4IDAwMDAwMDAuLmM1OWNhZDUNCj4gPj4+IC0tLSAvZGV2L251bGwNCj4gPj4+ICsrKyBi
L3RhcmdldC9oZXhhZ29uL2FyY2guYw0KPiA+PiAuLi4NCj4gPj4NCj4gPj4+ICsjZGVmaW5lIFJB
SVNFX0ZQX0VYQ0VQVElPTiBcDQo+ID4+PiArICAgIGRvIHt9IHdoaWxlICgwKSAgICAgICAgICAg
IC8qIE5vdCBtb2RlbGxlZCBpbiBxZW11IHVzZXIgbW9kZSAqLw0KPiA+Pg0KPiA+PiBJIGRvbid0
IHVuZGVyc3RhbmQgd2h5Li4uIENhbiB5b3UgZXhwbGFpbiBwbGVhc2U/DQo+ID4NCj4gPiBPdXIg
TGludXgga2VybmVsIG9ubHkgc2V0cyB0aGUgcmVsZXZhbnQgYml0cyBpbiBVU1IgKHVzZXIgc3Rh
dHVzIHJlZ2lzdGVyKS4NCj4gVGhlIGV4Y2VwdGlvbiBpc24ndCByYWlzZWQgdG8gdXNlciBtb2Rl
Lg0KPg0KPiBIbW0gd2hpbGUgeW91IGludHJvZHVjZSB0aGUgbGludXgtdXNlciBpbXBsZW1lbnRh
dGlvbiBvZiB5b3VyIHBvcnQsDQo+IHRoaXMgZmlsZSBpcyBub3QgcmVzdHJpY3RlZCB0byB1c2Vy
IG1vZGUuIFRoaW5raW5nIGFib3V0IGF2b2lkaW5nDQo+IGhlYWQgYWNoZXMgdG8gc29tZW9uZSB3
YW50aW5nIHRvIGFkZCBzeXN0ZW0gbW9kZSBlbXVsYXRpb24gKG9yIGENCj4gQlNEIHBvcnQ/Pyks
IG1heWJlIHlvdXIgaGVscGVycyBzaG91bGQgY29uc2lkZXIgdGhhdC4NCj4gTWF5YmUgc29tZSBj
aGVhcCAjaWZkZWYncnkgQ09ORklHX1VTRVJfT05MWSB3aXRoIGEgY29tbWVudA0KPiBleHBsYWlu
aW5nDQo+IHdoeSB0aGVyZSBpcyBub3RoaW5nIHRvIGRvIGluIHVzZXIgbW9kZSwgYW5kIGdfYXNz
ZXJ0X25vdF9yZWFjaGVkKCkNCj4gZWxzZS4gTm90IHN1cmUsIGp1c3Qgd29uZGVyaW5nLi4uDQoN
ClNvcnJ5LCBJIG1pc3VuZGVyc3Rvb2QgdGhlIHF1ZXN0aW9uLiAgWW91IGFyZSBjb3JyZWN0LiAg
SXQncyBhIHBsYWNlaG9sZGVyIGZvciBmdXR1cmUgd29yayB0byBzdXBwb3J0IHN5c3RlbSBtb2Rl
LiAgSSdsbCBhZGQgdGhlICNpZmRlZiBhbmQgc29tZSBjb21tZW50cyB0byBleHBsYWluLg0KDQpU
aGFua3MsDQpUYXlsb3INCg0K

