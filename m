Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 579C1303020
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 00:30:13 +0100 (CET)
Received: from localhost ([::1]:40112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4BJE-00006r-Ee
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 18:30:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1l4BHy-00087Z-Cg
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 18:28:54 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:3276)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1l4BHv-0000ZJ-VX
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 18:28:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1611617331; x=1643153331;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/j8RTSMeQGHrKbvyhJZwjZ08SkKew4PLGTW/Szvu00c=;
 b=raSNu5YDtb7uChpnkJrOhSRHxaWofbWbtuoEplz2nZc1JPSA3vbYJqvY
 JL4+x35yKtnb4ndrPHKUClWYuUUKpUHKa6l6Dv0rYoXXvh9GxvoO37a4n
 UlhWr2YwH9c/DicAewjOOuD7iycEQTkHwBj31EJHZqb69i0ie+6iCVJWq E=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 25 Jan 2021 15:28:48 -0800
X-QCInternal: smtphost
Received: from nasanexm03g.na.qualcomm.com ([10.85.0.49])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 25 Jan 2021 15:28:48 -0800
Received: from nasanexm03a.na.qualcomm.com (10.85.0.103) by
 nasanexm03g.na.qualcomm.com (10.85.0.49) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 Jan 2021 15:28:47 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03a.na.qualcomm.com (10.85.0.103) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Mon, 25 Jan 2021 15:28:47 -0800
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by SN6PR02MB4558.namprd02.prod.outlook.com (2603:10b6:805:b2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 23:28:46 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::f197:545d:3192:165e]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::f197:545d:3192:165e%6]) with mapi id 15.20.3784.017; Mon, 25 Jan 2021
 23:28:46 +0000
From: Brian Cain <bcain@quicinc.com>
To: Taylor Simpson <tsimpson@quicinc.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH v7 00/35] Hexagon patch series
Thread-Topic: [PATCH v7 00/35] Hexagon patch series
Thread-Index: AQHW828XyftQN75TcUylZvvcPhlgEKo4+/OQ
Date: Mon, 25 Jan 2021 23:28:46 +0000
Message-ID: <SN6PR02MB4205631BE926DC85052330E9B8BD9@SN6PR02MB4205.namprd02.prod.outlook.com>
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
 <02e7217d-6376-b93d-842d-197d9e13fc58@amsat.org>
 <BYAPR02MB4886C64A59EAC3B164159D5BDEBD9@BYAPR02MB4886.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB4886C64A59EAC3B164159D5BDEBD9@BYAPR02MB4886.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: quicinc.com; dkim=none (message not signed)
 header.d=none;quicinc.com; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [199.106.103.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2052f414-501f-4950-8e37-08d8c188f689
x-ms-traffictypediagnostic: SN6PR02MB4558:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR02MB4558B53E28D1E050EC756820B8BD9@SN6PR02MB4558.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2e+RMGU7qI7EX2zuFtguyt5OoI+ciO2bPt5a4PKD5QVy5cJY0rP8GuaK0oF6R/qJXqsZ/kDJONr0C4xMsiMVidqto9JG1+ScAWX0mXG+R4cQBXSvH0JFbIGYdLZ4VpzfhOPCiq5Ezj62do7DjafuU7xRMGi1BBQksDfOVwBbl6PRNPpgXL2DD5ZwFLylnRxxIFchHRnZusVYO4QsnzmgAYvzO5gxUgvPew9jr4EXo/iCC+9g4C3CVnbg9d5yT0Rk2Om5xpdReRDzl/MObqSH1Mkg6ozl98sDWpei/2NkD+dwInLas8HfRypFM3hbWrIQndRleaZ+T7VoaHBK3oRGT9xV7u8xrO8amnBNKzqrP8Lpa5+R3WiQ/40xZw5b4h7+NNzsauhmiLeW0W4PyKuwdilhxjDvDKlGVqV7L49npkMUchoVDe/OrYp+xeXa8IO2M9vra3klCvG1gHZ0K6QQUUZNAazsxJHMQ4wHJHi0sApcRzH2Me/pt2phypiZEyZF83YldgcrJgj1JiTd92rphA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4205.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(66476007)(66556008)(66946007)(64756008)(66446008)(2906002)(54906003)(86362001)(83380400001)(55016002)(71200400001)(8676002)(186003)(52536014)(53546011)(33656002)(26005)(5660300002)(6506007)(4326008)(478600001)(316002)(8936002)(76116006)(9686003)(110136005)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?ckpzeDJzR2p4cDRRQjZVWEUrZWZ1QklJcDRpOGV6M1ZsR3RVckdyZVcxUDNu?=
 =?utf-8?B?azEwQXhONmE5bFZrZ1pXYU0xbHNyTUxkVnEzV0ZvMTArMlE1cFpmZFJQUkZx?=
 =?utf-8?B?SUgwMTIrQ0d1VHFacVE5STlhdkNndmYvdW9kZ2h6RjVrcVViQUhLd283Mktk?=
 =?utf-8?B?VFV2VGoyOFU0TS9ha0tCTmp0VnpKbzBoMzJNNkhMY3VPVG5OTEovYW9ka1RR?=
 =?utf-8?B?alZpclhCYnFLOGRLcXpyVDNSRlRmQjJ3Q05qckwxRjlHWWl0QW5Vd0hvVWZT?=
 =?utf-8?B?aW90bXRzSlo4TmxPM1lvT1hJMzEyMk05U25iN3Z1REhMQnVUZ1pjNEYvTVpy?=
 =?utf-8?B?T1JMSHE1TjZkMmZ2Y2ozVGdjb29MQm4vRUNYZnU2RTlKSE9kQjZOOGZyT1JG?=
 =?utf-8?B?NjI1dWRWRmlmNXNCQkNrVTNSVEZVNk5DMjJwRjdrOFMvZE1jRFFIK1ltRlda?=
 =?utf-8?B?M09sWVVseVQ2QVphK2NZS20rR3ZGRDFKSnU1bU56NDIwMnordHRwRGpLV3Rt?=
 =?utf-8?B?Q1BsRmloMDF2K1F0SHdUV0hub0UySDlkaEJnSlBpQ1k2OFMydG1xbkJ2di9k?=
 =?utf-8?B?b2gyTFNrYlF0dTZWbjhydHlQOTFrY2lESFl2emEwOEpJbkRKVElRK3F6S2N1?=
 =?utf-8?B?aHZOZ2UrQjFvSy8rVDFLeXVVamZiSDVhVFdDdjNHenBiMGJvWGtkdWl6OFZr?=
 =?utf-8?B?N1Nlc2lhV2toeEpuaXlaQ21vTzVOdDVmeTFkWGxacHJQWWpxUnRwM0lYL2hm?=
 =?utf-8?B?WE9NNnRnS0JQOUMwQzcvRERTb0ROMFZZMVZuU3lGUTdnR0tlZ1BVOEN3K3NX?=
 =?utf-8?B?eWFSSFBmTlZ3dTR3VkU0ZHFoSnl6R2IzMHIwb0RUcDRFMTJGcmJNSUhPK3RG?=
 =?utf-8?B?eVN0REFDNy8rWllONWt5U1hiWVhsbnMwVndaNGw2WkdrSjlMVWEvWE40WCtR?=
 =?utf-8?B?aElPSFR2NjYvYzBLWVJZOXdSczFFNDZOMWdwdFE0azFYYWhGMXhpZ1luTHZj?=
 =?utf-8?B?L1ZNT295Yzl6dFdhWlF4YXk0Qkkya0IrdFNhd0xKUzBmTEF5bHFSaWs4K3Av?=
 =?utf-8?B?S2NPZ3M1U3BOWFVrUlJPREc3c1Z4cE5zWXNaaEM3dmpkbU9BYmRndGJ0aXdn?=
 =?utf-8?B?MzdLZXBqbjZhRXFPSjQwNDYxMit4SURzV01QQ2dQMWdleS9hUG16VzI5UUoz?=
 =?utf-8?B?YmVHSVExcE5UU3lqSmtzMWhSVzJoRzhSZDN2SXdFbGMxTDF2NnFseXgxUXZO?=
 =?utf-8?B?ZnlEUTgzSTlOZzhCUTYzM29GcnFkVFUrSEk5azIzUTM2QjVCbGhpWXp5UjRJ?=
 =?utf-8?B?OE9NRTVnaGZQVEczTHNwU3IzSGJUODJ0dHdNVVFNTDcxRHB6NVFLRi8xM1F4?=
 =?utf-8?B?UTF4Z01UNjJCeWpRUFRsUVllQ3h6cFRJWnZPNUdnOS91T2hZcFdkRjIvTGhX?=
 =?utf-8?Q?IC2ZLFPT?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFZSJiM2XdO6JeMoCnX/lNOHRDJ/RHecOpUCBlEztm9LRiytrExr6WFlszMh8FX62R1JR7YNPp+N3whVOwUi+WCgGe94zYn0XYSObJyWXc/5OCHRYLsY/LRh2B6/tEHIpaFrXWcuLs7VCsOD5z5RxCL0T/6/WOJ7yA9GLspjvGWF+ps9k1QW/pE8JqoPjl1TyjunP55iVOn4gFeVg4061qesADc36xkWhXXL/r9inS877gFGdDor+WDo//2O7JGnoncLVDZKh0slDIFnsqvV2be7YO4xlcCFnABcjYin5aPHHKROEFYwbzSuJ1S3sNsJzA9B1foE88aJQvLEyb61vg==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhSZ+pxRbJVybnzdZWgEBza3r9H1g2hRrt4Ljx9B+tw=;
 b=AiUh/xSajV8MhOtGWY+4lTOxQH2aArLwfCVKF+A8bWiuSy6XTjyr+6mzQe6rGU2CJyQPqJ1xCRoP54g3pOVKAK7MPxJYJIMTmivcP1dlO7O3449GcLAAUaPLM26tny8yB1ow4qwWRRifbDAQo+hGMx7/BWrJkSH65IWtpC0kohryvjPSPG8ThcUIR6Qw+yS9eSPvuDrEBwy1/njv2oxyE5D86QYjBj0ibcX10nZnjFMQMAhgy3iymAZ2zQDy2Tzxh5e/rULoEFaG1oKnpQOIeNcBG6MWWzSSk22TNqELhM2mLS6s2v1CHGvG3CjJXx+Q9io14NFnxez+qlLb5ulG8A==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
dkim-signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhSZ+pxRbJVybnzdZWgEBza3r9H1g2hRrt4Ljx9B+tw=;
 b=WkTHzUao2OwnnHBrxKN+aaKd8av+Ua6ico1iPF2tgZVeHI5qzGr7udYivdt7zVC+wBuFF+Fs6A39tEaNDH68+7w41vnZRY7eXQFSDIObchiC9CVQGLzAyHpjzNPCzLQsSwiQ2zWy+/lfTNO2xczTdfMhhKjTsH8Tu9ablMch/ZA=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: SN6PR02MB4205.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 2052f414-501f-4950-8e37-08d8c188f689
x-ms-exchange-crosstenant-originalarrivaltime: 25 Jan 2021 23:28:46.7918 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: TTH6EA5NCQ4KUy07O2oWI9NX0qbAl6uHn39Xk9eVJq/O4YiuvqUdz3FZpATneOlPEFx+NGh8teU+Q6njLa9nHQ==
x-ms-exchange-transport-crosstenantheadersstamped: SN6PR02MB4558
x-originatororg: quicinc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.39; envelope-from=bcain@quicinc.com;
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
 "laurent@vivier.eu" <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUYXlsb3IgU2ltcHNvbiA8dHNp
bXBzb25AcXVpY2luYy5jb20+DQo+IFNlbnQ6IE1vbmRheSwgSmFudWFyeSAyNSwgMjAyMSA1OjA5
IFBNDQo+IFRvOiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdAYW1zYXQub3JnPjsgcWVt
dS1kZXZlbEBub25nbnUub3JnDQo+IENjOiByaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnOyBh
bGV4LmJlbm5lZUBsaW5hcm8ub3JnOw0KPiBsYXVyZW50QHZpdmllci5ldTsgYWxlQHJldi5uZzsg
QnJpYW4gQ2FpbiA8YmNhaW5AcXVpY2luYy5jb20+DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjcg
MDAvMzVdIEhleGFnb24gcGF0Y2ggc2VyaWVzDQo+DQo+DQo+DQo+ID4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbGlwcGUu
bWF0aGlldS5kYXVkZUBnbWFpbC5jb20+IE9uDQo+ID4gQmVoYWxmIE9mIFBoaWxpcHBlIE1hdGhp
ZXUtRGF1ZMOpDQo+ID4gU2VudDogTW9uZGF5LCBKYW51YXJ5IDI1LCAyMDIxIDQ6MTUgUE0NCj4g
PiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPjsgcWVtdS1kZXZlbEBu
b25nbnUub3JnDQo+ID4gQ2M6IHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc7IGFsZXguYmVu
bmVlQGxpbmFyby5vcmc7DQo+ID4gbGF1cmVudEB2aXZpZXIuZXU7IGFsZUByZXYubmc7IEJyaWFu
IENhaW4gPGJjYWluQHF1aWNpbmMuY29tPg0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjcgMDAv
MzVdIEhleGFnb24gcGF0Y2ggc2VyaWVzDQo+ID4NCj4gPg0KPiA+IEhpIFRheWxvciwNCj4gPg0K
Li4uDQo+ID4NCj4gPiBJJ20gbG9va2luZyBhdCBzdHJlc3NpbmcgYSBiaXQgbW9yZSB5b3VyIHdv
cmsuDQouLi4NCj4gPiBBbnkgb3RoZXIgcmVhbC13b3JsZCBiaW5hcnkgeW91IGNvdWxkIHNoYXJl
Pw0KPg0KPiBJbiBhZGRpdGlvbiB0byBidXN5Ym94LCB3ZSBjb3VsZCBidWlsZCBvdGhlciBvcGVu
IHNvdXJjZSBwYWNrYWdlcy4gIFdvdWxkDQo+IHRoYXQgYmUgb2YgaW50ZXJlc3Q/DQoNClRheWxv
ciAtLSBJIGhhdmUgYmVlbiBydW5uaW5nIG5pZ2h0bHkgYnVpbGRzIG9mIHRoZSBjcm9zcyB0b29s
Y2hhaW4gd2hpY2ggaW5jbHVkZSBidXN5Ym94IGFuZCBQeXRob24gKENQeXRob24pIGFzIHRlc3Qg
Y2FzZXMuICBXZSBjb3VsZCBwdXQgb25lIHRob3NlIGJpbmFyaWVzIHNvbWV3aGVyZS4NCg==

