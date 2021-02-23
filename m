Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2551F32323B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 21:41:55 +0100 (CET)
Received: from localhost ([::1]:58864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEeVF-0008J8-MH
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 15:41:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lEeTe-0007ej-DJ
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 15:40:14 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:23991)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lEeTa-00015T-QU
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 15:40:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1614112810; x=1645648810;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hsNjEJczdSpuH+jSUng0m0KNamhjXJW/xmO7uBHGCTc=;
 b=vW+XUAWNFrM93T3wkC4w8fag4X2TKcyrxQGMni4XZtZUlQoKtb286IsD
 6eFJhVGD2hA+wL9CILwHrhonPVP70XA5ZhbHBUqYIVuARqMN17CyNIsUt
 2/4wjGYybcCl8naoYy3TWzYU7GQWmjaSq7hBMAgGTGQh3XN/o90ayxGXR k=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 23 Feb 2021 12:40:06 -0800
X-QCInternal: smtphost
Received: from nasanexm03a.na.qualcomm.com ([10.85.0.103])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 23 Feb 2021 12:40:05 -0800
Received: from nasanexm03h.na.qualcomm.com (10.85.0.50) by
 nasanexm03a.na.qualcomm.com (10.85.0.103) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Feb 2021 12:40:05 -0800
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03h.na.qualcomm.com (10.85.0.50) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Tue, 23 Feb 2021 12:40:04 -0800
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BY5PR02MB6660.namprd02.prod.outlook.com (2603:10b6:a03:212::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.30; Tue, 23 Feb
 2021 20:40:03 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6%4]) with mapi id 15.20.3868.031; Tue, 23 Feb 2021
 20:40:03 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH] target/hexagon/opcodes: Add missing varargs cleanup
Thread-Topic: [PATCH] target/hexagon/opcodes: Add missing varargs cleanup
Thread-Index: AQHXCdTi8SEbsPziPk2FgoBSWlDsA6pmKiuw
Date: Tue, 23 Feb 2021 20:40:03 +0000
Message-ID: <BYAPR02MB488661AEC5F0358B5BB714A6DE809@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210223111253.2831285-1-f4bug@amsat.org>
In-Reply-To: <20210223111253.2831285-1-f4bug@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a86dc46-18f5-4ccc-4244-08d8d83b329d
x-ms-traffictypediagnostic: BY5PR02MB6660:
x-microsoft-antispam-prvs: <BY5PR02MB6660C23C5B07ACF04A2009CBDE809@BY5PR02MB6660.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qHxpnSFyxDlyP2SX9esEM9EgpzPZr+9hXOmb9+Cea62I/dRg7gj+ZU7hBJxpj64whEwZmZ8+ILSwdiCpQR712nYj+Q8y8neSuDWX21Pj+PrGNKAoNdnAVuKxpukKFG/xLt9D8pf72CuSiPAqoKpAHf9AdqbPD5OLEdimIxjB4V6y8IT8SBE8rL2eEuVYG6IMSWs4sZv56F4VCos2zkYc9rZfYLryeXyC5tDmya/vVDft3/2xBOZfOMArrCHrgqed3LbnUzVz9xcW2vErIczL8LFC4+uVNQvMyvvKBLPWNOONUsLNM8qHVTv3skch6tGs9UIjIAODw83kwBw3M97RT3taD4FTJsOl+dimdLHq4wl3fGC0/x7hFP/xwkP3rgi8gG1og8bcyBKmx6IE4JdTbT7aORq7DfY1zPP3gsDyhtsK8mFYgmCJyiZTWcQaLb0trIwp0nLuy7Z6KL2bzTiXJfNcSD2zvtjv+6RK4vfPbJw/5CD/e97q4wvL8PvYDIf6pWXYrEjYwO5Cg6bNbk2HtA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(346002)(39860400002)(376002)(186003)(33656002)(66556008)(316002)(2906002)(5660300002)(478600001)(110136005)(52536014)(4326008)(66446008)(55016002)(71200400001)(6506007)(8676002)(64756008)(7696005)(76116006)(66476007)(66946007)(8936002)(83380400001)(53546011)(86362001)(26005)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?TmxIQ2ZMVmpiai9rNHJabU9Ec2Z6Yzl1RW1udzFGY2VObzRVV0w5UkZaMEF0?=
 =?utf-8?B?Z2ZHcUFmQS9Gd0daQ3FHNjlGbnVTN1o4ODVJUW16dFBZcEhDYmNOWWhtSUtY?=
 =?utf-8?B?NmJxM2ZBTjJkMkczSDZvVXF5Vk1iZDc2UW5DRHFSOFA2Y0xieUt5OXFubEds?=
 =?utf-8?B?cHJYc3lVNDdMUllaOXFUSE1QNTlkV0pkQUVBWWlyS0JuZVFqOE9DWHJra2tX?=
 =?utf-8?B?bjBVQW0vaGJMekhVK3pUc2dlWi9pR3B2a3BUd3czR1l2Z0tKeXRHVmVKYmZY?=
 =?utf-8?B?bkkzL0ZmNndvMVRFd0RyMEdTeWRIM2d0WkFld2FxTkpUVHlnVWJtemg4TlhR?=
 =?utf-8?B?MU94TUdUaGk4ZzdGQ0VFTXRhUTB2VHAwejBNUExnRTU3eWtLbWlPRFl6Y3ll?=
 =?utf-8?B?ZGp1UTNYREo4M2tBSmtLSkY2aEx1Vld0RFo5UmpEdUhrSU1SYzJvVWc1WDR3?=
 =?utf-8?B?SU5veUx1STluL3lPcmRoN3cyelhWVmdXWkVORWZpLzZ2TzZHSW8rcEV6OThD?=
 =?utf-8?B?WTlPc3RDZFVlTzhNMFJaNXhEV2VpMHJMWE4zN2pad1dlK1hTUVVVT0dWWEoy?=
 =?utf-8?B?Rlp5YmpJZXhEbk5RNS9rZFdrWEsxaXNweFY1VlliWkZmY09qQnZ4cVJPMVIv?=
 =?utf-8?B?YnJHNUhYQ0Q3Zk1uMndzNGpXOExZM0hBUXhJcXhkQll2aU16ZzRXYXlYVHZa?=
 =?utf-8?B?M2JhbGhJZEZMSFlRUFh3OGVUU1Ezdks5cFBrcnplUWlXRkpOT0ZXS1ppczF5?=
 =?utf-8?B?LzFpQUhIZTcrVkx2MFJiaDhadjU1bngvRGNCbFZjbDhFZVplbE50RWRmUitU?=
 =?utf-8?B?eUpSeEx4d0tKRzhzY1l3MGcrZjVxOTdqd0NrdjhYSi8rUm5EUzZHZ2JzaHBa?=
 =?utf-8?B?Z2tUSmtwUmU0aFZVdUFYL1VKK0VPYkRIOTU5VFUyRnNnNllNUU5TaUtqQ284?=
 =?utf-8?B?QWRXUmhvSCtYUTVydWtGTG0rNFU2Rk12aEpoTSt1VitMczhpSnRRZ2hhbllC?=
 =?utf-8?B?SWduajdNcUVxckdEajlsaXpVVlNxV3gzRTdlT2VncXlocU9KeEhUVVNPdW0v?=
 =?utf-8?B?Qmc5ZmRjaWxPVEl3UnhaR0NmZGl2NlYxZzRXQVNxcU5xWDl4cU5XSFhSQVRW?=
 =?utf-8?B?ME56Qy9OS3RoUlFqdWJsVVZqLzVXOHNwTGVoRHlCNnBBQnZKVkJGUnp1OGFs?=
 =?utf-8?B?VFlnZG5GSnNtQUVoY3BJZlY2cU5ReGQvdklrVjBhN0EyYXJHeldjUVNYS0JI?=
 =?utf-8?B?MjNVenEveFNvUFR2Wk1XdkhaRHc3VEhscDl1MDhGRzVlejBlY1l2anhaM1hB?=
 =?utf-8?B?eEc0emRGeFc5NkV3b0o2K2xPRnBJRlV6OXZ2eC8vY1FBMjh0L3lLZFlLNG9S?=
 =?utf-8?B?cWhGY09WWXN4VTEwRzAxZVZkZWo5UDJoaEpueGszWjB6WXVjeFRrK1hWVm1B?=
 =?utf-8?B?V2pZbHVJUjFZVDhCN2prcld3V3JJV29OR1hUVFlnSysxMTAySDdHL2dSemRD?=
 =?utf-8?B?VGtKMThsL3F4ZGlyY21HOVNhZVNzTFhjMEE5UlhYK2RyYmpTdmtDT2Ivbnhs?=
 =?utf-8?B?OE4rTVpCaGx2ckxYbHl2cGdWMDVwejlMOTQ3eWU5ZWg1ZFFSR3VZWmpEWGNN?=
 =?utf-8?B?bVYrZlIrdDZlZ1FtWWVvS0xKMzF6UU43NW9ubmgvL3UyaUlzS3FQdDcvZ1Zz?=
 =?utf-8?B?Q2ZWSDhEQStYblJKRWN4SC9kWFdCbGs5a1lpK3A2eUpGeFBnVTN0QUptU1Ez?=
 =?utf-8?Q?nAoBPEXE9yDv3F/FdqegdgWgkl771wDoWnY7yqH?=
x-ms-exchange-transport-forked: True
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=atrrNQ+CSvDtdwBObtBHYoXM6OAO2uDlw3cQk5oZC/gheus+sI58ffh+9V2Dc6kAFkc2YlAAqg3n6bZaXvLFJ7xpNNE/wvzq34K7J3XfZx9VH3jU/TY40bJQs/HeZrOuJaS++XFnaPvDHSWtsy5Bv7zL7lHjZE0kOqcYvNqiON+923OKKdS5i9QEQQKKRDTViNlARvhaXlokGapVawuWS4UwG2YVWhD4UlFX9u9YPuU4R8p2DeXrFPj9bd9jqnrzRyFaaczRor3WWDdHn+5R4fykePDFuo4wwuGLSMMWdysptoS6Tr8HXe1m39KhepXtEHqKuI9n7ELbfCyRCCI7pw==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UPxFUXVZtEbFKvvz/7p8oXQn+MnbLe5vzoifectFVGY=;
 b=IWP4BayyN2MMXpPBin59FRXod3GqXOckBYwB1MFdMnV/Xc/KCJmuWHYidImTxE6KEtszpnZSL4y6VhlDV+JXK40D+9fxL3qjulBIXTDNe8UoqyGbR9hSYPEFMUJNPRJnzGuTL8kY2hjIYviFC3MwXO3JmxmisSiwVcTVOq2W1FURlyY5/IxMW6rBMsxxboA1OYKoAhpFkhbYbQTivnPwcQFhrtwr0Fj8ai+qAmsjmrfAFBa8+tPX5MtJu5rba9fFsbQOIWZ0akrmCyMnaQOFyCf/YP2Y1FXW3VtFbDoj/JBLxqA1XB4bks8k46JfUrmebzSIPkfLZHPsR1M3HIYA+A==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 3a86dc46-18f5-4ccc-4244-08d8d83b329d
x-ms-exchange-crosstenant-originalarrivaltime: 23 Feb 2021 20:40:03.5193 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: PurYHQpVDeaa9uK/1vxxf0wTgUYQXjPNHm3/Ga1VHDGAAECJBtpcrEvLJpaCIuc3+fByEJwVFbZK73skuu6G8Q==
x-ms-exchange-transport-crosstenantheadersstamped: BY5PR02MB6660
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxpcHBlLm1hdGhpZXUuZGF1ZGVAZ21haWwuY29tPiBPbg0KPiBCZWhhbGYg
T2YgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kNCj4gU2VudDogVHVlc2RheSwgRmVicnVhcnkgMjMs
IDIwMjEgNToxMyBBTQ0KPiBUbzogcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBSaWNoYXJk
IEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz47IFRheWxvciBTaW1wc29u
DQo+IDx0c2ltcHNvbkBxdWljaW5jLmNvbT47IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1
Z0BhbXNhdC5vcmc+DQo+IFN1YmplY3Q6IFtQQVRDSF0gdGFyZ2V0L2hleGFnb24vb3Bjb2Rlczog
QWRkIG1pc3NpbmcgdmFyYXJncyBjbGVhbnVwDQo+DQo+IEZpeCBhIHRyaXZpYWwgaW5jb3JyZWN0
IHVzYWdlIG9mIHZhcmlhYmxlIGFyZ3VtZW50IG1hY3JvcyBkZXRlY3RlZA0KPiBieSBDb3Zlcml0
eSAobWlzc2luZ192YV9lbmQ6IHZhX2VuZCB3YXMgbm90IGNhbGxlZCBmb3IgYXApLg0KPg0KPiBG
aXhlczogQ292ZXJpdHkgQ0lEIDE0NDY3MjAgKFZBUkFSR1MpDQo+IEZpeGVzOiBlM2MwMGMyZWQ3
NSAoIkhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBvcGNvZGUgZGF0YSBzdHJ1Y3R1cmVzIikNCj4g
U2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4N
Cj4gLS0tDQo+ICB0YXJnZXQvaGV4YWdvbi9vcGNvZGVzLmMgfCAxICsNCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vb3Bj
b2Rlcy5jIGIvdGFyZ2V0L2hleGFnb24vb3Bjb2Rlcy5jDQo+IGluZGV4IDRlZWY1ZmM0MGY2Li4z
NWQ3OTBjZGQ1YiAxMDA2NDQNCj4gLS0tIGEvdGFyZ2V0L2hleGFnb24vb3Bjb2Rlcy5jDQo+ICsr
KyBiL3RhcmdldC9oZXhhZ29uL29wY29kZXMuYw0KPiBAQCAtODIsNiArODIsNyBAQCBzdGF0aWMg
dm9pZCBpbml0X2F0dHJpYnMoaW50IHRhZywgLi4uKQ0KPiAgICAgIHdoaWxlICgoYXR0ciA9IHZh
X2FyZyhhcCwgaW50KSkgIT0gMCkgew0KPiAgICAgICAgICBzZXRfYml0KGF0dHIsIG9wY29kZV9h
dHRyaWJzW3RhZ10pOw0KPiAgICAgIH0NCj4gKyAgICB2YV9lbmQoYXApOw0KPiAgfQ0KPg0KDQpS
ZXZpZXdlZC1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPg0KVGVzdGVk
LWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+DQoNCg==

