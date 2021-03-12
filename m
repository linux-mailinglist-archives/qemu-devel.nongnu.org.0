Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 026B83388AE
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:30:44 +0100 (CET)
Received: from localhost ([::1]:54094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKe83-0004XF-1h
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:30:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lKbF4-0005FI-6s
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:25:47 -0500
Received: from esa18.fujitsucc.c3s2.iphmx.com ([216.71.158.38]:39390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lKbF0-0002rA-Uk
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:25:45 -0500
IronPort-SDR: zwjv92ubuxYtUf1xtA+0g/4a2YkSvDHabwJQQ+t6t9k+LuoyfhwrG7rFhus64/522hAt2zFHqe
 a7308XIasY6H16/ZwdFbNlDd2/HYiQZthAEYVQKfNn7OAqgLo4XN6imJnNSrZIuAY/6lekBbUu
 iNLfKZCHuYVL4O9HYn+Q3cz0E9R+dxzGEQnZBoMOdhRmUpanFQPb0CwSTCdwj2QQIrTZB+sMPN
 M/684Mq2u7mKkarbWKy8eWqCNjb/IPSyqZTsSsztf0r4Bi1tPpX+Yasr6nx7hzfMpLO3IvBf1n
 sko=
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="28080096"
X-IronPort-AV: E=Sophos;i="5.81,242,1610377200"; d="scan'208";a="28080096"
Received: from mail-ty1jpn01lp2059.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.59])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 15:25:37 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBdjngWt/dZp24blNqzwXAnQn9bupkn6CA/tASVS95tdBsDEqKnKwf35C0DAD3DkXFldxSZF8VrZukyMjHbG7SMmv844QkbpEOmc/BWSyhC/HlOBhAQ7KGT5AYLZBTNbMRheaUGsuLz2BFUHA3r6574v0pMlBPo8XNXFMaY+M3f0Y5Vru9XZrRKN0XGGTBz0AonPNBFXAFK5aXBBtpikBFnlJkdVJ2b+zBy4FLvDOPGghRiSkT3Gy4hfrHuJQIYL7RyLPcEEN4AlMTKMIc7xx3sYxKmKwMViz4ezl7OPzw0/skKcZHkDiOSikEseRaoK6+C34IvjaENj1uNsuDIR6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTUY09pr/eEL6K/7GfY+IDr6xoKszkzo6SAUwh4zX5I=;
 b=NOZh0wB9Sp29rNZUUxX+dldWwgZaNupHS/oY5kBAWPlRM1FvWKB2cIt08P6G0fFsGoEMYu9tNIgkimTDCrcXZCDOEaZOQUDalUlXlfYTq1t+PytGxLDczzau8a1G8DLz7G6weY72WbQGNEF1TDbZ+GkNGGpYrngumnKtvgqA5ftqD4ECD4P3ETiNhJgoKKb+6hJhxYWZRJbb7//2SwY5duIGSIZHFsGyQt5fHhTW7iwVGHT7Nvbz+MIZSupPdI0gNPyN5wrEOY4a5SOoOqeNO81YQZi32zfSp07mUytcvVueoeLm1jXXX+9U2z3y0sKHdb66TIVN2KwY76+hBghnjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTUY09pr/eEL6K/7GfY+IDr6xoKszkzo6SAUwh4zX5I=;
 b=NjFToFzepxbZq7ZQLHv2k5jlocJygUyzlk6xhW/R3i5/ZV/caU+E4O+0PQrfN0/QWuTMKfocBUs0zYJOVzY5Qvz+ZLSogsbPyYzFEeaX2LGyWs4UAd0QMWfoTGAbg5iB+7k1iKG1yUvrOYxwpC3F5a/qVp0bbvVkyARwk0Si6qQ=
Received: from TY2PR01MB2571.jpnprd01.prod.outlook.com (2603:1096:404:6b::12)
 by TYCPR01MB6368.jpnprd01.prod.outlook.com (2603:1096:400:99::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.18; Fri, 12 Mar
 2021 06:25:34 +0000
Received: from TY2PR01MB2571.jpnprd01.prod.outlook.com
 ([fe80::d9a8:f990:73a0:c21a]) by TY2PR01MB2571.jpnprd01.prod.outlook.com
 ([fe80::d9a8:f990:73a0:c21a%3]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 06:25:34 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: leirao <lei.rao@intel.com>, "chen.zhang@intel.com" <chen.zhang@intel.com>, 
 "jasowang@redhat.com" <jasowang@redhat.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "lukasstraub2@web.de"
 <lukasstraub2@web.de>
Subject: Re: [PATCH v2 02/10] Fix the qemu crash when guest shutdown during
 checkpoint
Thread-Topic: [PATCH v2 02/10] Fix the qemu crash when guest shutdown during
 checkpoint
Thread-Index: AQHXFwA71jnIiK86h0W874t+20KhSqp/4vwA
Date: Fri, 12 Mar 2021 06:25:34 +0000
Message-ID: <d14dfaf7-8f77-7917-775f-5e85973ea9f5@fujitsu.com>
References: <1615525383-59071-1-git-send-email-lei.rao@intel.com>
 <1615525383-59071-3-git-send-email-lei.rao@intel.com>
In-Reply-To: <1615525383-59071-3-git-send-email-lei.rao@intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3716a6b8-9a94-4536-56ea-08d8e51fa4f0
x-ms-traffictypediagnostic: TYCPR01MB6368:
x-microsoft-antispam-prvs: <TYCPR01MB6368212A2CCCB8099DDA9F67A56F9@TYCPR01MB6368.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:626;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pMg0foRWoHzluKCdyQj9FKNyKtCASsjnFyd21lQGjpb9dPU5x9PPk2ceCweuy/i+S04S3FtN02K8TEFlMNwoBEOhTh+nkAen2kii2oEvD5QT3/5H8rIszdXlIQyCe7Cx2cLJxtWruAXG48drh17xgsMCHMXr91674xi7ynIZBq4aBiCgcKh2xdPdS/85XvaPxDNkKXs1GDywTkxq16B1fYNVVaQTojVfo/F9yOAzgeazVzgjApe320/y4ZAWgcz2Q11E7UDPQlhiwreLGet4P4odekUW6sHXa6nYMnjVKTHHIdRwRLhmRXPx59GG3/dFZeohV7YPZy39l5/fWL6+MBpdmHHQTXIEUCI9dpWNXplu0ez1C7SY9heNtUgKNZGluHUFaWPbAGS7jGBX3pA+I27SW9LG5ZGDMsPxgcp9ZjWOTZ4lV6hiAHOuDWX8FOabFG6yx2GVGAuswu5pAzviPoF3D0kSIldXpuK2oFDl3HjfbaAzS9z6BGTn1jW9d3lCHMtadWG1QhFwvS1CZ3mlyUaKax/Fya0MTwmWbjOyIubrCNwWD/4Rik1mgFzl3hWWS94aiM8MpqjvU3AvPrEBpQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR01MB2571.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(85182001)(31686004)(8676002)(6486002)(6506007)(186003)(4744005)(31696002)(53546011)(2906002)(83380400001)(6512007)(64756008)(66556008)(2616005)(91956017)(66476007)(71200400001)(66946007)(66446008)(316002)(26005)(76116006)(4326008)(110136005)(36756003)(478600001)(86362001)(5660300002)(8936002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?QkdMc2Z6a1d5TW8xOHlXRVBCbnc4Sml0ajQ0b1VDb2ZtdjJDWWN6a3JLcVo5?=
 =?gb2312?B?WGNWdkFvazBPaThkQ3VERzBWMjdJSWlKbzRubHpsRlNJRmw1dlVTZHVVK2l2?=
 =?gb2312?B?VFFoVjgyTjdTOU1zMk9QbStHYVY5amY3L2l3NHExTnNaYUpmQkFDZUd2Um53?=
 =?gb2312?B?U1E4NUZCMEV2NmlQenNhS1hBM1dKYW9ZcFM5RldDeXlabG1jWElralNmeWNu?=
 =?gb2312?B?YXlMTXJwUWV2aThJU2w5Nmt2ZVNMYjQyaXdWaFZQU0FNUXZmSmo2eTF4Q2x2?=
 =?gb2312?B?V2d2bEFpdXhJVWpKRlQyOWh5NDdLMG1rVFVsdmhreTErclU5MlZPVitzVEp6?=
 =?gb2312?B?a3lwcEFDRCswRWpTQnpSOXZZK1dtODIrVEttTnAxeU1TamhORTVlV1ZoY0or?=
 =?gb2312?B?OVNCVE55NDR5UzVuVkxMMHNQcHQ4c2VZVzEyL3RHb3g3c1FnTmVpRUpFRndi?=
 =?gb2312?B?UWQ5K1VlVHM3RWt5aVAyeit6Sm1JY1pkR21aWkZrVWNKbHlla3pKd2FORFFL?=
 =?gb2312?B?cWlRQnQyS1hBL01hMUhNWFl5MlBlUEsrZmsxK2hRRlhVREZvc29HREdtb25y?=
 =?gb2312?B?NEtZWVkxK09JRVArMGxUcU4wVXR6WVBmdnYvamlYeVRYU3RpbGhQYWMzTURK?=
 =?gb2312?B?anJnUSt0KzF2Ymg1cWUrK2VFWkZuTHE0b0R5RHh5UXZWWkZEcFNzR0J2dkN2?=
 =?gb2312?B?L2dTeldJbmQ4QjErQ1crNFNrTXlib3M0cWNzZmZaY2ZZYWJzWVpJRTNPd2Zi?=
 =?gb2312?B?QUFYOE90bS9rVDloWVFCYk1DL09PUDFiOGord0tCODg5bWRrOTY4QmJHWVBn?=
 =?gb2312?B?OE53c2g2WnM3N0kyK3dTaUJHMzcycHhwc3ZiWXYya3hPVFh4S3MwRTNKMWpM?=
 =?gb2312?B?S0hwcXo2MU1NSEJ0M2kwT3VQY0hmQ2VYcnBDejl6Z0ZxRGVVL2hTL0JpWGpX?=
 =?gb2312?B?SGk4NzcxbU9aeTREcFN4TTkxcDloeUZsdHRpTnZnOHc1YVVjRnFqTG5RbVF3?=
 =?gb2312?B?bVp4b2VyVzhUZjVrWmVWR0xRbzdwTklPdEtMbTdhUE5TY2pTbSt2MWUrdXZz?=
 =?gb2312?B?MUJuL0VWSmhGY1A3aUszZy9BTThadis0M0RTZkJGUk40ZEdvS2hrRnBITExp?=
 =?gb2312?B?OHp1Q0wweXVHSHFUZ1dTQWh1em5SMWlsWUsySDNsRDNWVURhSHZzM1NoNWdH?=
 =?gb2312?B?VHI5MFNOL1ViZ2NhMXBmNnhYVEZHU29qdU1hdS9EUk95bHQ0a2F1aFJkV25U?=
 =?gb2312?B?Wm11WGdad1VWaXZRbU9PUUttUGpPdTljT3FSMnN3NGM0SmpRTTlaMlRHa1lj?=
 =?gb2312?B?TGtIY3kyMFhuWXA5TzVEV3BwV2tqOVFESDBXYmt3R0RRb3NsMk1QdHJLUmZa?=
 =?gb2312?B?SXY3Mk9POWhYZ0dlVkJMSmpQUk96bWdDUkpZWVhWSVBQa0hYOGJlblZGbE1q?=
 =?gb2312?B?STlZSDVrT05MZFlnZmpjbzdIQWFWUFZhTktyUkl2dElFUVE2U0xQTEJRMUhl?=
 =?gb2312?B?bHVDc0FxYzlUbTRiMVNUSVlydFVMTHBlZnJ6MlJuUi9qZnhlRDNYUnVRV2d5?=
 =?gb2312?B?QzFXYWxjenVmY2ZxbDRmRm9IdFFvUmJIK3RhdWNoaFVrcSt6dEZDYy9WL3NP?=
 =?gb2312?B?c0YweUVIc0hiRUVqZW85R2xFWTRqY3BsRkRTbG4zOWE1L3dIRmNLcHRvbHYr?=
 =?gb2312?B?b2ozUllBbUl0cGdlMlpTc0V3RmR0L3AwOS9KTlJCV2JsZVR0cXRkMzBhL0Jw?=
 =?gb2312?Q?UfKCOcvsF/6fetogx0yCn8/K2JqGFOzy7XV+ORU?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="gb2312"
Content-ID: <4FB5AF8A6D97D641AC7403C8CD1D1E92@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB2571.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3716a6b8-9a94-4536-56ea-08d8e51fa4f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 06:25:34.6076 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i4i9Eul7K3u9fKAhbwBApVwDIJpOXD2ROfFqyHH7nGLFoJeLbEzW+kM8ZsaUHiTckq7Z2nK1+Km+BW+4UBmYiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6368
Received-SPF: pass client-ip=216.71.158.38; envelope-from=lizhijian@fujitsu.com;
 helo=esa18.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 12 Mar 2021 04:24:37 -0500
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCk9uIDMvMTIvMjEgMTowMiBQTSwgbGVpcmFvIHdyb3RlOg0KPiBGcm9tOiAiUmFvLCBMZWki
IDxsZWkucmFvQGludGVsLmNvbT4NCj4NCj4gVGhpcyBwYXRjaCBmaXhlcyB0aGUgZm9sbG93aW5n
Og0KPiAgICAgIHFlbXUtc3lzdGVtLXg4Nl82NDogaW52YWxpZCBydW5zdGF0ZSB0cmFuc2l0aW9u
OiAnY29sbycgLT4nc2h1dGRvd24nDQo+ICAgICAgQWJvcnRlZCAoY29yZSBkdW1wZWQpDQo+DQo+
IFNpZ25lZC1vZmYtYnk6IExlaSBSYW8gPGxlaS5yYW9AaW50ZWwuY29tPg0KUmV2aWV3ZWQtYnk6
IExpIFpoaWppYW4gPGxpemhpamlhbkBmdWppdHN1LmNvbT4NCg0KPiAtLS0NCj4gICBzb2Z0bW11
L3J1bnN0YXRlLmMgfCAxICsNCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4N
Cj4gZGlmZiAtLWdpdCBhL3NvZnRtbXUvcnVuc3RhdGUuYyBiL3NvZnRtbXUvcnVuc3RhdGUuYw0K
PiBpbmRleCAyODc0NDE3Li44ODRmOGZhIDEwMDY0NA0KPiAtLS0gYS9zb2Z0bW11L3J1bnN0YXRl
LmMNCj4gKysrIGIvc29mdG1tdS9ydW5zdGF0ZS5jDQo+IEBAIC0xMjYsNiArMTI2LDcgQEAgc3Rh
dGljIGNvbnN0IFJ1blN0YXRlVHJhbnNpdGlvbiBydW5zdGF0ZV90cmFuc2l0aW9uc19kZWZbXSA9
IHsNCj4gICAgICAgeyBSVU5fU1RBVEVfUkVTVE9SRV9WTSwgUlVOX1NUQVRFX1BSRUxBVU5DSCB9
LA0KPiAgIA0KPiAgICAgICB7IFJVTl9TVEFURV9DT0xPLCBSVU5fU1RBVEVfUlVOTklORyB9LA0K
PiArICAgIHsgUlVOX1NUQVRFX0NPTE8sIFJVTl9TVEFURV9TSFVURE9XTn0sDQo+ICAgDQo+ICAg
ICAgIHsgUlVOX1NUQVRFX1JVTk5JTkcsIFJVTl9TVEFURV9ERUJVRyB9LA0KPiAgICAgICB7IFJV
Tl9TVEFURV9SVU5OSU5HLCBSVU5fU1RBVEVfSU5URVJOQUxfRVJST1IgfSwNCg==

