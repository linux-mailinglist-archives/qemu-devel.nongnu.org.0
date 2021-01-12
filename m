Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 908FD2F3791
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:48:10 +0100 (CET)
Received: from localhost ([::1]:44530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNm5-0007Wo-JV
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:48:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1kzN89-0001VW-Rm
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:06:54 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:32368)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1kzN84-0001Rl-Ur
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:06:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1610471208; x=1642007208;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tNl6xiK2E8Nufr/58UtjlE9s6aRvujkXrdJOe0yTcF0=;
 b=Lj6JBtlWASk0KIourYNDd0KGOeTcd3hbDYqViM+cGzTEo/h/ZUzYp+yD
 1e0uPFB/Z9G9y7fEJo8cZPbxVr2r7LwRcGxbxEwTaX5n3bOWZ2dmH5vBC
 Scjk2fgNd8tiXO/FnbqaXsSvjLvVyaWmdq7ejtYtVXhPZJDoXCkeQJSR+ k=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 12 Jan 2021 09:06:47 -0800
X-QCInternal: smtphost
Received: from nasanexm03f.na.qualcomm.com ([10.85.0.47])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 12 Jan 2021 09:06:46 -0800
Received: from nasanexm03c.na.qualcomm.com (10.85.0.106) by
 nasanexm03f.na.qualcomm.com (10.85.0.47) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Jan 2021 09:06:46 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03c.na.qualcomm.com (10.85.0.106) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Tue, 12 Jan 2021 09:06:46 -0800
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BY5PR02MB6660.namprd02.prod.outlook.com (2603:10b6:a03:212::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 12 Jan
 2021 17:06:44 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::41f5:1c20:959e:559e]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::41f5:1c20:959e:559e%6]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 17:06:44 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Subject: RE: [PATCH v6 31/35] Hexagon (tests/tcg/hexagon) TCG tests
Thread-Topic: [PATCH v6 31/35] Hexagon (tests/tcg/hexagon) TCG tests
Thread-Index: AQHW5XboPOCq/43GDkOqf8/nY8fQ2Koj6y6AgABRtBA=
Date: Tue, 12 Jan 2021 17:06:44 +0000
Message-ID: <BYAPR02MB4886FF9652752D179113FF8FDEAA0@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1610080146-14968-1-git-send-email-tsimpson@quicinc.com>
 <1610080146-14968-32-git-send-email-tsimpson@quicinc.com>
 <87y2gymk2f.fsf@linaro.org>
In-Reply-To: <87y2gymk2f.fsf@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [76.120.51.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4471d8ee-6168-40c4-68eb-08d8b71c7072
x-ms-traffictypediagnostic: BY5PR02MB6660:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB66605D15AAF0A74B5FFC4551DEAA0@BY5PR02MB6660.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OeJBN3RH2YzTjS5wgFljBi/9YoZefXp2prYwCmUYK1EAK3bog6OO0oJoEc/zV2KR7+Ksq5bwQmB+cfWQp3rMqur64S8t+yE4kIRpxK9N1gUSTRv7nIWOn17SDtSlI2eTqClwsHWWKzmueRD+tdnEHRGn3Jwi+GK0qLnx2jffw55kpEb4Q7+iRnJuEwLqvMuLRGWuLyCyQ7S3ZZdHNE6xq+8pckbFHs66SDpYTR7GQrYS+fzwvFdOLlgb/V0T7H3Rgx38Z05qjG0Iv0C9KU/kFsCNx6wNibVRj07v6UdCE8roiCAx+hWCkVK84lU8mVT3iyMdCfOE0a6fXp/gn8KWZbC03bF48SHZPWjMfhkotMLbF+1jlriiSM9uhSGNQGth
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(346002)(396003)(376002)(66574015)(86362001)(64756008)(478600001)(2906002)(5660300002)(66556008)(83380400001)(8936002)(6916009)(52536014)(55016002)(71200400001)(4326008)(53546011)(6506007)(76116006)(8676002)(9686003)(33656002)(66946007)(66446008)(186003)(316002)(7696005)(26005)(54906003)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UDFtUmozVFhuaUJiUGszZ2lKby9DWStZWEphTE9RaGtHOUF3cFg2NnJSOWd4?=
 =?utf-8?B?MkhCcy9Ic0gzai9nUllSTzdyR0RTSFQvRERBMVl1TWdpL0tGRFhxVGlHWDRj?=
 =?utf-8?B?WHRNM2VMNVkvZ3BpSW0vM0VhdjU2cDlXdVBlc1JINlFrSWV1T08zREo5VzlH?=
 =?utf-8?B?K29BREdFWTJwTVE4SE5HTnhEejBNMUNHOUsvbHhsM0lsT3h3MVdkeml6RkU3?=
 =?utf-8?B?dnJ6bjJHUC9HUTdYTjg3ZXZxdG12U214UzhqbTB3MkcrS0xyUzBkM1UwTURj?=
 =?utf-8?B?SktaT0NyOVdaZ2FCVWZhVWN5c3F6QTNoZzZEdTdlT0NoVjRYS3YreWc3ZjB4?=
 =?utf-8?B?R2ladE1NVmNWNnN4UEt6cEJIdzcwaktWRm1Ccm95M3F2RGF1VFFpRWhtT2Jx?=
 =?utf-8?B?WElJdVpWbTBnWWhMN20vOGZJekp1NWtURitXMkhkS2g5SU9PUzlwUmd0eThl?=
 =?utf-8?B?Wk01a0VpRGJNV0toN2M3NXdaZStYM213YlA0b2FJSnpVQzJCZ2xYdUNReTF5?=
 =?utf-8?B?WE55VXp2T2czdXlXWnJDcS8xdmdabFk4WlNEMXNwUlFOaGtEZHQ4dUlzSEtx?=
 =?utf-8?B?L2dIUERjWnBjNHRqT1dGYmZCVkRMdVJZb3dtTVY1WkFSWGIveC8vVEVqakg2?=
 =?utf-8?B?TW5STDNBM3hPcUVlaXdMSUhsQWZEeTA3STBlVkMxTVVvYjViUFZ2T0VNaHFo?=
 =?utf-8?B?RUdTNWQzT1NvKyt0aVErajdUQVA3UDhybmNub3pLZ1VmTHhrS0xwUHBSeHZT?=
 =?utf-8?B?VzdnMGIxWjE4WlMxRFFRVk5TTmpITW5lYlNxVVk4MWVSUS8ycHZhK2huellH?=
 =?utf-8?B?VkdLQUUzeEdvNGFFMndnQlZVbVhTWEtCQTVUOUN3NkxwMjdmTVpIUERZaWRp?=
 =?utf-8?B?Z1FuUEtkMDBzSms5bVZmMEh1blRQa2poL3YrYzNTU2NFT0hLYXBGNHYzbHQ2?=
 =?utf-8?B?cDNaeSt1eVpwekh6elJ3RGtPcnAvcEVIZ0pkVXFMSktEaE1TZDNhMTcxZHhD?=
 =?utf-8?B?SU9mNTA4OWY0bGNIZS9GbUxjR2xoYy9lOHVWaVd5ZUVTTS9XamMwNXlFK1Zv?=
 =?utf-8?B?M0ZId3lNS1BhQ3hvWE0xZ3I5L0hpZEEweUhZc1B5TmlHcGdEU2JZRGQ2bDFV?=
 =?utf-8?B?WHBWMFZza0hzbUYrTWdEeThzYWpMYlFZcTVxTEV6RklQUUJqNWhIMmhKUksy?=
 =?utf-8?B?WmNnaWFHeEdiSkpsRDVUQnRNWHh0TmdCakdERlZrZEpxbTlFN0xVZ3pNTWFL?=
 =?utf-8?B?OUdVWXcyWWZGUkRreXRqeUdMazVZNUlOVHB3bkZ1aUw0bXhweUpWZGxBa3Zx?=
 =?utf-8?Q?fD6ASx7/m30Lw=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzPoBFN5cda9BXNw1MGIMYwjhv9QjLYvnKsjts+YVJ2SLoY/2jfUXZyMef5kgvRNQnHkoH+SgVrB3E+b3d3oAoVODv4Hn6HOvOY8shz289cEO6c5C56OQx6wtV4mxqTQNKAjkQs2dqRWRN2FKbkzKA5IZy0432+5L+eqiYnYUFMc0DiP6pT0M96FVFyA0TNICSXj+qLnhX+YRSn+GlH7v7iK24m5sE/bc9VA8nQdO2rz6F4itR1UQ4oAAXhj4P1Km020OG8qwwhFULbmbxl/KFrfBuNp7AigrGUEC6lCClW0tC3/OwgGB9IboGaV68bsMcpp4QKQ0Rqt2yCahLarFQ==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fudnsv16Aw1KsEctM1bFRldHYS5HLOENmVa4/4HoC5A=;
 b=XOscppyuj7q8B060v3C1UTd5gNcT7H0luLVWOlWVrWELy4NUAhtCBMcNOGsfkjlSiksGCqj+6eToY1tCz+s+bDXKw2SFT7FBUkNxiE+6/5uaIjF1TW3/NW3Sii23OZokQ86YYJmEwg5Mm1g2DjOjZDRsswes+N4Dt63D/gUvUDPci8yTOq+yasvZHr9JpAwEx5xEIhOLlTrAuIRyiWfOuG2GNMBPdq45BXe9dGuRBManB7PpbMrMFSY1kOKsf2Nr0xMDXUOm4sG1be0jqFFAKgmgfYhxAs4KdtH8/GuMhHXOymN5miM4AIDVc5nZRuhtp/qvEzuq3bcV2504+uEFJA==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
dkim-signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fudnsv16Aw1KsEctM1bFRldHYS5HLOENmVa4/4HoC5A=;
 b=UM7QbpcGwJT5Mt/FYDsujsCPFBtZD2Yl81QCzDRUnA/4h/hjFcaBtj98Oc0V0aPCBQeCcqW01MUlaK0kARnjdfFLBxRx8xjtTNLjYvdEa24oa03D4NjKKqjSkNlSiYhs6KiIFvCUNsT+iL4u9/m63rCbnZ6LzNs6nAoGcNEfRJY=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 4471d8ee-6168-40c4-68eb-08d8b71c7072
x-ms-exchange-crosstenant-originalarrivaltime: 12 Jan 2021 17:06:44.5529 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: L3IcAOYhskZDdK+06iGkPC3apvbiUqoGosne6KenzrJJ+XfdYpH/jidZQFe6tEh/EM/9GusV9uN5h8VdVsCEcg==
x-ms-exchange-transport-crosstenantheadersstamped: BY5PR02MB6660
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleCBCZW5uw6llIDxh
bGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDEyLCAyMDIx
IDY6MDQgQU0NCj4gVG86IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4NCj4g
Q2M6IGFsZUByZXYubmc7IEJyaWFuIENhaW4gPGJjYWluQHF1aWNpbmMuY29tPjsNCj4gcmljaGFy
ZC5oZW5kZXJzb25AbGluYXJvLm9yZzsgbGF1cmVudEB2aXZpZXIuZXU7IHBoaWxtZEByZWRoYXQu
Y29tOw0KPiBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAz
MS8zNV0gSGV4YWdvbiAodGVzdHMvdGNnL2hleGFnb24pIFRDRyB0ZXN0cw0KPg0KPiBUYXlsb3Ig
U2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+IHdyaXRlczoNCj4NCj4gPiBNb2RpZnkgdGVz
dHMvdGNnL2NvbmZpZ3VyZS5zaA0KPiA+IEFkZCByZWZlcmVuY2UgZmlsZXMgdG8gdGVzdHMvdGNn
L2hleGFnb24NCj4gPiBBZGQgSGV4YWdvbi1zcGVjaWZpYyB0ZXN0cw0KPiA+DQo+ID4gU2lnbmVk
LW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPg0KPiA+IC0tLQ0K
PiA+ICB0ZXN0cy90Y2cvaGV4YWdvbi9hdG9taWNzLmMgICAgICAgIHwgMTIyICsrKysrKw0KPiA+
ICB0ZXN0cy90Y2cvaGV4YWdvbi9jbHJ0bmV3LmMgICAgICAgIHwgIDU2ICsrKw0KPiA+ICB0ZXN0
cy90Y2cvaGV4YWdvbi9kdWFsX3N0b3Jlcy5jICAgIHwgIDYwICsrKw0KPiA+ICB0ZXN0cy90Y2cv
aGV4YWdvbi9mcHN0dWZmLmMgICAgICAgIHwgMzcwICsrKysrKysrKysrKysrKysrKw0KPiA+ICB0
ZXN0cy90Y2cvaGV4YWdvbi9tZW1fbm9zaHVmLmMgICAgIHwgMzI4ICsrKysrKysrKysrKysrKysN
Cj4gPiAgdGVzdHMvdGNnL2hleGFnb24vbWlzYy5jICAgICAgICAgICB8IDM2MCArKysrKysrKysr
KysrKysrKw0KPiA+ICB0ZXN0cy90Y2cvaGV4YWdvbi9wcmVnX2FsaWFzLmMgICAgIHwgMTA2ICsr
KysrDQo+ID4gIHRlc3RzL3RjZy9oZXhhZ29uL3B0aHJlYWRfY2FuY2VsLmMgfCAgNDMgKysrDQo+
ID4gIHRlc3RzL3RjZy9jb25maWd1cmUuc2ggICAgICAgICAgICAgfCAgIDQgKy0NCj4gPiAgdGVz
dHMvdGNnL2hleGFnb24vTWFrZWZpbGUudGFyZ2V0ICB8ICA0OCArKysNCj4NCj4gQ291bGQgeW91
IHNwbGl0IHRoaXMgcGF0Y2ggdXAgcGxlYXNlLiBJIHdvdWxkIHNheToNCj4NCj4gIDE6IGNvbmZp
Z3VyZS5zaCwgTWFrZWZpbGVmaWxlLnRhcmdldCB3aXRoIG11bHRpYXJjaCB0ZXN0cyAoYW5kIGZs
b2F0DQo+ICByZWYgZmlsZXMpDQo+ICAyLiBhdG9taWNzL2xvYWRzdG9yZS9tZW0gdGVzdHMNCj4g
IDMuIGFkZGl0aW9uYWwgZnAgdGVzdHMNCg0KU3VyZS4NCg0KPiBCVFcgaXMgdGhlcmUgZW5vdWdo
IHN1cHBvcnQgZm9yIGEgYmFyZSBtZXRhbCBzeXN0ZW0gZW11bGF0aW9uIHRlc3Q/IFlvdQ0KPiB3
b3VsZCBuZWVkIGEgbWluaW1hbCBib290LlMgYW5kIGEgbGlicmFyeSBmdW5jdGlvbiBmb3Igb3V0
cHV0dGluZw0KPiBjaGFyYWN0ZXJzIHRvIHNvbWUgZGV2aWNlIGFuZCBhbiBleGl0IHdoaWNoIGNh
biBzZXQgdGhlIHJldHVybiBjb2RlLg0KDQpUaGlzIGlzIGluIHByb2dyZXNzIGJ1dCBub3QgcmVh
ZHkgZm9yIHN1Ym1pc3Npb24uICBPbmNlIHRoaXMgc2VyaWVzIGlzIG1lcmdlZCwgdGhlIHBsYW4g
aXMgdG8gaW5jcmVtZW50YWxseSBhZGQgdGhlIHJlbWFpbmluZyB1c2VyIHNwYWNlIGluc3RydWN0
aW9ucywgaW5jbHVkaW5nIEhWWCB0aGVuIGFkZCB0aGUgc3lzdGVtIG1vZGUgc3VwcG9ydC4NCg0K
PiA+ICtzdGF0aWMgdm9pZCAqZnVuYyh2b2lkICphcmcpDQo+ID4gK3sNCj4gPiArICAgIHNsZWVw
KDMpOw0KPiA+ICsgICAgcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gK2ludCBtYWluKCkN
Cj4gPiArew0KPiA+ICsgICAgaW50IGVyciA9IDA7DQo+ID4gKyAgICBwdGhyZWFkX3QgdGhyZWFk
Ow0KPiA+ICsgICAgdm9pZCAqcmVzOw0KPiA+ICsNCj4gPiArICAgIHB0aHJlYWRfY3JlYXRlKCZ0
aHJlYWQsIDAsIGZ1bmMsIE5VTEwpOw0KPiA+ICsgICAgcHRocmVhZF9jYW5jZWwodGhyZWFkKTsN
Cj4gPiArICAgIHB0aHJlYWRfam9pbih0aHJlYWQsICZyZXMpOw0KPiA+ICsgICAgaWYgKHJlcyAh
PSBQVEhSRUFEX0NBTkNFTEVEKSB7DQo+ID4gKyAgICAgICAgZXJyKys7DQo+ID4gKyAgICB9DQo+
ID4gKw0KPiA+ICsgICAgcHV0cyhlcnIgPT0gMCA/ICJQQVNTIiA6ICJGQUlMIik7DQo+ID4gKyAg
ICByZXR1cm4gZXJyID09IDAgPyAwIDogLTE7DQo+ID4gK30NCj4NCj4gVGhpcyBzZWVtcyBsaWtl
IGl0IGNvdWxkIGJlIGEgbXVsdGlhcmNoIHRlc3QgdW5sZXNzIHRoZSBvdGhyZWFkIGNhbmNlbA0K
PiBzZW1hbnRpY3MgZm9yIEhleGFnb24vTGludXggYXJlIHZlcnkgZGlmZmVyZW50Lg0KDQpZZXMs
IGl0IGNvdWxkIGJlIGEgbXVsdGlhcmNoIHRlc3QuICBJJ2xsIGNyZWF0ZSBhIHN0YW5kYWxvbmUg
cGF0Y2ggKG5vdCBwYXJ0IG9mIHRoaXMgc2VyaWVzKSB0byBhZGQgdGhpcyB0byB0ZXN0cy90Y2cv
bXVsdGlhcmNoL3Rlc3R0aHJlYWQuYy4NCg0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjaywNClRh
eWxvcg0K

