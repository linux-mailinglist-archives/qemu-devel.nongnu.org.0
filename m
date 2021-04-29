Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B55336E47B
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 07:26:44 +0200 (CEST)
Received: from localhost ([::1]:43952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbzCE-0000f4-2b
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 01:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lbzAp-0000Dk-Ke
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 01:25:15 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:5303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lbzAm-0003Px-Pb
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 01:25:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1619673912; x=1620278712;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3MONBBu5Bfa2VE3ppwGlhaRm52WoWrmnBFmjwO/3kgU=;
 b=uqGAd01YFlz6BkoYt8e7Ucv7R0DnV8Ivt2Z/hx+sdO0wVaAs2lILP42Q
 0KPA95OvbML5b1th0sLxLoqR7aubRQUWCzgaBdK+/b6YAY2zXtTnY1PRJ
 ob5d1j3sXdx5UsCCI2a3IWAJar23QWhUQEK3ksg3vxF6TefcCQLqh8o7M I=;
IronPort-SDR: IBBKYk4bHTnvHx6NuUykz80lXhR7uN+VHsLFpx/AUJlO6sn3UW2kiN8zaa1idss6h2QwQRMYRC
 6xTXOymC74HKTxjCs6WKjUVQfGrIY6dC08uoeJz8AZ4DApC2uIDSlbDaKulhI37Wj6TbG1UVal
 nQk6rIWi8qX55lB9yGEiJkr6n3dUyX4WuTCdaUw2qPXxKDztgbOeBDuTf1dZODMacugFAJfR3g
 AW9TnhP4abHmGUvTjKf6143/xhYLvgpsbmqZlo+LvZtzap191Uzic8B9nF84AGmSggFraQ5eRm
 SOM=
X-IronPort-RemoteIP: 104.47.55.103
X-IronPort-MID: 31976
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
Received: from mail-mw2nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.103])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 05:25:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEGYUAKuniNuHcpntvC58oAe+OdGd//UAfn+mPj1rrR8Jj65cX0AjGGEzEzi8aAiPvgpAn4P/YOwC8lecx9j2dsGoEWLhuaoWn3JpG0CaQxmJ3LGMGr1NrKA6sdPmI8kO+cgNa+dngi5GWZruUOjOkv7S4Pi54KT/BmlcNDkjTxXHJu3H0bypdf0s2ehUMMQLL/ywLuK/5ZhuiiXaEPNfE5KLfSNmwBlssxmBEbTwNqwrc8EVy+iCtXLeZ2gqGrbu7a+on+6r7FtckFtUHH9Q3pVw6ZEq5Aty/z/2HA5XKEucfEKzxdqLQexAbfbVNgM4hFvDoUjGRi6a8vhKUFsFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3MONBBu5Bfa2VE3ppwGlhaRm52WoWrmnBFmjwO/3kgU=;
 b=GEKe3WJSHkaidN8T1xDDRc3zeyrtrYpVz84xUkPlWq20Bbn6btPGQvXBuF7CPXZtJuaTctBqP8l75op4MFcLsLc6r3Dji9KUcgzWCZNmp0Msz16dSaQbOR9NLfjOSohhARNvEkPe3yMI3g7/0vyUiBuF3TAu7Fp+JDxB/FEN2GCEczyOJki6mR4S8ZeYOtearcGksRVAdmUdy9edrRZActBjX+eY0cUpEmL9xdSa4XWTSg3bwTDC9zkz0ArlG/Zyp9rgXN4G9Hyof5kKePGapNMeFqm9sUZD0C0q2JuAOqLdqZ+NO6GKHJ+5ZZ9OmN9c0ciNM2eiwSZC4GSg14wklw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by SJ0PR02MB7264.namprd02.prod.outlook.com (2603:10b6:a03:291::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 29 Apr
 2021 05:25:09 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608%6]) with mapi id 15.20.4065.027; Thu, 29 Apr 2021
 05:25:09 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH] Hexagon (target/hexagon) remove unused functions
Thread-Topic: [PATCH] Hexagon (target/hexagon) remove unused functions
Thread-Index: AQHXPKhUmKF0DyPwhkuJkCllb1AZfKrK7KaAgAAA5yA=
Date: Thu, 29 Apr 2021 05:25:09 +0000
Message-ID: <BYAPR02MB48864126BD643582D282DDC9DE5F9@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1619667142-29636-1-git-send-email-tsimpson@quicinc.com>
 <204e8759-7fda-4e2c-6f30-466272432c78@amsat.org>
In-Reply-To: <204e8759-7fda-4e2c-6f30-466272432c78@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a095f197-3a9b-462e-d43f-08d90acf27d5
x-ms-traffictypediagnostic: SJ0PR02MB7264:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR02MB7264B3B2D9A8D888F5877CABDE5F9@SJ0PR02MB7264.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qPg+xQAg7FXgB5jQCRmoKIzJOUgqEx02v3ZSrz68uqLCMIWeHuBPeXsj/lp7xW4+ySHnSp3+RjrmK64qf72awU94I3AgpKKoF9YPYUh2UQuR7DKGpkb+5Stgw/I5cD1t+jy4i3djD24OgqC+BqsxGBrX2Vn1LFFp94A20jLYmnMPmXPAb2ftMndZI6Hec7c4miUobkaaYiifoVvR7dzME7mszgrmO7KEhQALllf1jYYFalyC9UkM++pfpmHIxvW7K5grYfehkc/iBH9xw2Wj+toFDyy5KzK8XMfjED7RbUlpkvjE3xkslcugOtTafU0ZyHtpHPcOccYkyC3Q3b5m0gNUbcr3IgblNtpXFUV8A4zw+FizUYcJkuubChJodv9KJOIkhdNHRX8HRG2eI4tkcG767smHmIg2km3vWN5ETQj6+FACMpCxthpQ+V3TybSRG5mN3oCmS+mCb00v2dZZ5isdShwjjLouF6tSHxcFfQmlfDc9Hn4Lzmx42mtEBQuLmPIn80U+bRxvA3CsCnMsMxhqbHWSo6Uiqr+tjRE5iNkRdByKh4XiIiIpsC9PrM5qBWY92/JQFaCnqvcIouNCDI7KK8gMo6Uun/hO94LUTpCe/ZZP6holhqnjfAsod1+DgC88NSFehf1FrAwpKHf+OXtoAB4xokcBICMgtpTU65y7Wi16zH7f/m78Nj8vphMv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(346002)(39860400002)(376002)(55016002)(316002)(110136005)(5660300002)(38100700002)(71200400001)(66476007)(6506007)(52536014)(83380400001)(107886003)(122000001)(9686003)(54906003)(2906002)(4326008)(186003)(33656002)(8936002)(66556008)(64756008)(966005)(26005)(8676002)(66946007)(53546011)(76116006)(66446008)(478600001)(7696005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?cWo3aFhyN0FaZ2RSSkhXR3d4Wk1YOGU5dlFHVlZiRUVTWEdFcDlPUXdTb0hI?=
 =?utf-8?B?WWg0Z0R0ckZVYzQ1enpXWXJiVHpYbjZqOGxMTTJLcnprL2xkQnJrMVFicTBC?=
 =?utf-8?B?MmJVb09kS3A3RlVOLzJVV1FZcFA5QVMwcytJZU1sWWhFWTdZa1VKaGZuUkEy?=
 =?utf-8?B?MjZGVEloWFZ1b1hMSjhIUmhrbkM1Nll6ZFVlR3ZCSXFZamZUMEVXd3ZvbVVF?=
 =?utf-8?B?SU1lNHJiN0pjL0RnN2s1M2VYbVp5b1g5K0FCSFArOFpBT0pySGtjakwvV3By?=
 =?utf-8?B?U2NsN3gyS2R4VlZhay9UU2ZWOTg3VDBHdjZJMWtzN2srQ2d1WVIrTFYzeExV?=
 =?utf-8?B?TzBzMDlvRnJOWW5VVTJpcG40c1lUZVk3cnVidExzM1c2OUtGWFNwT3Nxc3lG?=
 =?utf-8?B?T2E1WHgvR0dlNTR5VzVvVDI4QUZESmczb2dxQ1hTMnpDU1JBbVJIUWpqYUF2?=
 =?utf-8?B?N0d6amZBRGhGTmtZZEo4TmdLUXprUmNJQWlzR2t5allGRWhmamMyR3UwZ1RX?=
 =?utf-8?B?eklRY1I4WTc3alBTZUd5djdOR3U1MGZSUjRUbVIzSVBvVFd6TWlhcGxGNmIx?=
 =?utf-8?B?QzhQWXpYaUFqcy91eGFUQkY2L2tZMHdxckxzNUY0WC9nUXBqZXdpTjlGUEhY?=
 =?utf-8?B?WERjVTlTV0N0WWtNSy9JeWRUak1uV2tydXU3UEE5NE53ay9OaTVYZGlFRXpT?=
 =?utf-8?B?aEZQL1ZlaS9wdzdOQmUrcVhXRHFPMytQTmlnSERKdjZhOVZNMnRGQnFNeU5C?=
 =?utf-8?B?SU9oaWtBTkh2cFBuemtjWTc0OUpabkNSMWdNS1d5NnJ2UEIyN3p3T3B6SEtq?=
 =?utf-8?B?UmVaNnN0VTlvMDhlK2Q2WjlkdzNFbUlSWTcvbDBkNlFKWXVnVmJqb1k2alEv?=
 =?utf-8?B?NHJiWE1wUUJ2ZmEzUDNLa2ZJZktYUlZnL0c4aDVXMklvSlo4T2lER3FyMUNr?=
 =?utf-8?B?ZEZjMkV5RUhLVS9jeHVVUXdMMkFXZTZkbnk3d25qYVQrMzJJRkxtWW5qOGRt?=
 =?utf-8?B?d2RzTmpYbk94Z1NhU05iR0JrUk1Edlp5VzJoNS8rdUVvSWp1Z1IvQm1RVVBX?=
 =?utf-8?B?RDNYcVpxQklDSDdzSHlwZlloN3BFU1pwbkh1b2xKeHp0cFdpdlVtbVRQTDdV?=
 =?utf-8?B?dXQxV2toelpsdVhFVDQ1c1Qrb0RLKzRadFFyV3Bta0RSTTJJQnpmeEdRZDlk?=
 =?utf-8?B?TWVLNnBCbTR1ckQ4RjUvaXQzamhLelJqdkxmbWhNOEtmcWx1ZkQzRjFhL05Q?=
 =?utf-8?B?NFN2RWdXMUd1ZHFWb2J2eHYwUmttN0s2bVljeFh2ZG9HOENkR3A5QldyRjJp?=
 =?utf-8?B?OUhraUhUSWVZYVMwRUppSmlhanNiVnRxMERQMGNxS2NqU1dhSzIvSHM4OG5m?=
 =?utf-8?B?WFdjcDZ1eXB1L1hIaTVFZlJ2QUlPWEl6VVNQRndhYVBUTkMzWHFvQ0plWUZk?=
 =?utf-8?B?LzJrcVpPM0pBQUcydzM2cVRLQmNoYWtFVVhYdUUyckR4bUMzem1kUERxN3FV?=
 =?utf-8?B?QVpmT0RoWTdiako1bTNaNG9zTWt5V1VxN2M4WEF5SDFqUC9rOXNwenZSZmk0?=
 =?utf-8?B?Z1g1SWxBVGhCb2VxNE80Y0JCK1lFc2M2OXVLUGl6bWJHTHRkeWluaCt6WTJu?=
 =?utf-8?B?M1FIUXJTYm1GdGJmZFZiOCtzeE9FM0Qxai9qdTVMQ1AvSU1CdXNVWkpwVlps?=
 =?utf-8?B?ZGtlVnN1M21vZG01a0htOEluVExUZS8yNXQwc0tSa3dHcnFKSUw4UWx6NmI4?=
 =?utf-8?Q?YXeG2th3dfh9PMQs7HEcV3nYEUFJT6faMsq1jdM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a095f197-3a9b-462e-d43f-08d90acf27d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2021 05:25:09.1019 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rqvK/RvZU/gK7YjAt3GLbh0/TtIu4C7yybJkjj9OqwOX5iEeJeeLI+xIAT/oj5i0BDT4uTSr6P/DCFtL04Daog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7264
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxpcHBlLm1hdGhpZXUuZGF1ZGVAZ21haWwuY29tPiBPbg0KPiBCZWhhbGYg
T2YgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kNCj4gU2VudDogV2VkbmVzZGF5LCBBcHJpbCAyOCwg
MjAyMSAxMTo0OSBQTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29t
PjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiByaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8u
b3JnOyBhbGVAcmV2Lm5nOyBCcmlhbiBDYWluDQo+IDxiY2FpbkBxdWljaW5jLmNvbT4NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSF0gSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIHJlbW92ZSB1bnVzZWQg
ZnVuY3Rpb25zDQo+IA0KPiBIaSBUYXlsb3IsDQo+IA0KPiBPbiA0LzI5LzIxIDU6MzIgQU0sIFRh
eWxvciBTaW1wc29uIHdyb3RlOg0KPiA+IFJlbW92ZSBnZW5fcmVhZF9yZWcgYW5kIGdlbl9zZXRf
Ynl0ZQ0KPiA+DQo+ID4gUmVwb3J0ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhl
bmRlcnNvbkBsaW5hcm8ub3JnPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFRheWxvciBTaW1wc29uIDx0
c2ltcHNvbkBxdWljaW5jLmNvbT4NCj4gPiAtLS0NCj4gDQo+IFRvIGhlbHAgZ2l0LXRvb2xzIChh
bmQgcmV2aWV3ZXJzKSwgcGxlYXNlIHVzZSB0aGUgJ0Jhc2VkLW9uJyB0YWcNCj4gdGhlIG5leHQg
dGltZSB5b3Ugc2VuZCBhIHBhdGNoIGRlcGVuZGluZyBvbiBhbm90aGVyIG9uZToNCj4gQmFzZWQt
b246IDwxNjE3OTMwNDc0LTMxOTc5LTEtZ2l0LXNlbmQtZW1haWwtdHNpbXBzb25AcXVpY2luYy5j
b20+DQo+IA0KPiA+ICB0YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyB8IDExIC0tLS0tLS0tLS0tDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jDQo+ID4g
aW5kZXggNTVjN2NkOC4uZjkzZjg5NSAxMDA2NDQNCj4gPiAtLS0gYS90YXJnZXQvaGV4YWdvbi9n
ZW5wdHIuYw0KPiA+ICsrKyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jDQo+ID4gQEAgLTI4LDEy
ICsyOCw2IEBADQo+ID4gICN1bmRlZiBRRU1VX0dFTkVSQVRFDQo+ID4gICNpbmNsdWRlICJnZW5f
dGNnLmgiDQo+ID4NCj4gPiAtc3RhdGljIGlubGluZSBUQ0d2IGdlbl9yZWFkX3JlZyhUQ0d2IHJl
c3VsdCwgaW50IG51bSkNCj4gPiAtew0KPiA+IC0gICAgdGNnX2dlbl9tb3ZfdGwocmVzdWx0LCBo
ZXhfZ3ByW251bV0pOw0KPiA+IC0gICAgcmV0dXJuIHJlc3VsdDsNCj4gPiAtfQ0KPiANCj4gQnV0
IHdoYXQgYWJvdXQ6DQo+IA0KPiB0YXJnZXQvaGV4YWdvbi9tYWNyb3MuaDoyNjojZGVmaW5lIFJF
QURfUkVHKGRlc3QsIE5VTSkNCj4gZ2VuX3JlYWRfcmVnKGRlc3QsIE5VTSkNCg0KSSBzaG91bGQg
cmVtb3ZlIHRoaXMgdG8gYXZvaWQgY29uZnVzaW9uLg0KDQo+IHRhcmdldC9oZXhhZ29uL21hY3Jv
cy5oOjI5OiNkZWZpbmUgUkVBRF9SRUcoTlVNKQ0KPiAoZW52LT5ncHJbKE5VTSldKQ0KPiB0YXJn
ZXQvaGV4YWdvbi9tYWNyb3MuaDozNjA6I2RlZmluZSBmUkVBRF9MUigpDQo+IChSRUFEX1JFRyhI
RVhfUkVHX0xSKSkNCj4gdGFyZ2V0L2hleGFnb24vbWFjcm9zLmg6MzY2OiNkZWZpbmUgZlJFQURf
U1AoKQ0KPiAoUkVBRF9SRUcoSEVYX1JFR19TUCkpDQo+IHRhcmdldC9oZXhhZ29uL21hY3Jvcy5o
OjM2NzojZGVmaW5lIGZSRUFEX0xDMA0KPiAoUkVBRF9SRUcoSEVYX1JFR19MQzApKQ0KPiB0YXJn
ZXQvaGV4YWdvbi9tYWNyb3MuaDozNjg6I2RlZmluZSBmUkVBRF9MQzENCj4gKFJFQURfUkVHKEhF
WF9SRUdfTEMxKSkNCj4gdGFyZ2V0L2hleGFnb24vbWFjcm9zLmg6MzY5OiNkZWZpbmUgZlJFQURf
U0EwDQo+IChSRUFEX1JFRyhIRVhfUkVHX1NBMCkpDQo+IHRhcmdldC9oZXhhZ29uL21hY3Jvcy5o
OjM3MDojZGVmaW5lIGZSRUFEX1NBMQ0KPiAoUkVBRF9SRUcoSEVYX1JFR19TQTEpKQ0KPiB0YXJn
ZXQvaGV4YWdvbi9tYWNyb3MuaDozNzE6I2RlZmluZSBmUkVBRF9GUCgpDQo+IChSRUFEX1JFRyhI
RVhfUkVHX0ZQKSkNCj4gdGFyZ2V0L2hleGFnb24vbWFjcm9zLmg6Mzc1OiAgICAoaW5zbi0+ZXh0
ZW5zaW9uX3ZhbGlkID8gMCA6DQo+IFJFQURfUkVHKEhFWF9SRUdfR1ApKQ0KPiB0YXJnZXQvaGV4
YWdvbi9tYWNyb3MuaDozNzc6I2RlZmluZSBmUkVBRF9HUCgpDQo+IFJFQURfUkVHKEhFWF9SRUdf
R1ApDQo+IHRhcmdldC9oZXhhZ29uL21hY3Jvcy5oOjM3OTojZGVmaW5lIGZSRUFEX1BDKCkNCj4g
KFJFQURfUkVHKEhFWF9SRUdfUEMpKQ0KPiB0YXJnZXQvaGV4YWdvbi9tYWNyb3MuaDo1Nzc6I2Rl
ZmluZSBmR0VUX0ZSQU1FS0VZKCkNCj4gUkVBRF9SRUcoSEVYX1JFR19GUkFNRUtFWSkNCg0KVGhl
c2UgYXJlIG5vdCBndWFyZGVkIGJ5IFFFTVVfR0VORVJBVEUsIHNvIHRoZXkgYXJlIG5lZWRlZCBh
bmQgcmVmZXJlbmNlIHRoZSBvdGhlciB2ZXJzaW9uIG9mIFJFQURfUkVHDQoNCj4gYW5kOg0KPiAN
Cj4gdGFyZ2V0L2hleGFnb24vZ2VucHRyLmM6Mzc6c3RhdGljIGlubGluZSBUQ0d2IGdlbl9yZWFk
X3ByZWcoVENHdiBwcmVkLA0KPiB1aW50OF90IG51bSkNCj4gdGFyZ2V0L2hleGFnb24vbWFjcm9z
Lmg6Mjc6I2RlZmluZSBSRUFEX1BSRUcoZGVzdCwgTlVNKQ0KPiBnZW5fcmVhZF9wcmVnKGRlc3Qs
IChOVU0pKQ0KDQpUaGlzIGlzIG5lZWRlZC4gIEl0IHJlYWRzIGEgcHJlZGljYXRlIHJlZ2lzdGVy
LiAgVGhlIGdlbl9yZWFkX3JlZyBmdW5jdGlvbnMgcmVhZHMgYSBnZW5lcmFsIHB1cnBvc2UgcmVn
aXN0ZXIuDQoNCj4gSSdkIHJhdGhlciBzZW5kIGEgIiFmaXh1cCBIZXhhZ29uICh0YXJnZXQvaGV4
YWdvbikgY2lyY3VsYXIgYWRkcmVzc2luZyINCj4gcGF0Y2ggKHNvIFJpY2hhcmQgc3F1YXNoZXMg
aXQgdGhlcmUpIHdpdGg6DQoNClJpY2hhcmQgc2FpZCBoZSBjb3VsZCBjaGVycnkgcGljayBhIHNp
bmdsZSBwYXRjaC4NCmh0dHBzOi8vbGlzdHMuZ251Lm9yZy9hcmNoaXZlL2h0bWwvcWVtdS1kZXZl
bC8yMDIxLTA0L21zZzA1OTY4Lmh0bWwNCg0KPiANCj4gLS0gPjggLS0NCj4gZGlmZiAtLWdpdCBh
L3RhcmdldC9oZXhhZ29uL21hY3Jvcy5oIGIvdGFyZ2V0L2hleGFnb24vbWFjcm9zLmgNCj4gaW5k
ZXggYjcyNmMzYjc5MTcuLmJmMGU1YWU5MmJiIDEwMDY0NA0KPiAtLS0gYS90YXJnZXQvaGV4YWdv
bi9tYWNyb3MuaA0KPiArKysgYi90YXJnZXQvaGV4YWdvbi9tYWNyb3MuaA0KPiBAQCAtMjIsMTYg
KzIyLDExIEBADQo+ICAjaW5jbHVkZSAiaGV4X3JlZ3MuaCINCj4gICNpbmNsdWRlICJyZWdfZmll
bGRzLmgiDQo+IA0KPiAtI2lmZGVmIFFFTVVfR0VORVJBVEUNCj4gLSNkZWZpbmUgUkVBRF9SRUco
ZGVzdCwgTlVNKSAgICAgICAgICAgICAgZ2VuX3JlYWRfcmVnKGRlc3QsIE5VTSkNCj4gLSNkZWZp
bmUgUkVBRF9QUkVHKGRlc3QsIE5VTSkgICAgICAgICAgICAgZ2VuX3JlYWRfcHJlZyhkZXN0LCAo
TlVNKSkNCj4gLSNlbHNlDQo+ICAjZGVmaW5lIFJFQURfUkVHKE5VTSkgICAgICAgICAgICAgICAg
ICAgIChlbnYtPmdwclsoTlVNKV0pDQo+ICAjZGVmaW5lIFJFQURfUFJFRyhOVU0pICAgICAgICAg
ICAgICAgICAgIChlbnYtPnByZWRbTlVNXSkNCj4gDQo+ICAjZGVmaW5lIFdSSVRFX1JSRUcoTlVN
LCBWQUwpICAgICAgICAgICAgIGxvZ19yZWdfd3JpdGUoZW52LCBOVU0sIFZBTCwgc2xvdCkNCj4g
ICNkZWZpbmUgV1JJVEVfUFJFRyhOVU0sIFZBTCkgICAgICAgICAgICAgbG9nX3ByZWRfd3JpdGUo
ZW52LCBOVU0sIFZBTCkNCj4gLSNlbmRpZg0KPiANCj4gICNkZWZpbmUgUENBTElHTiA0DQo+ICAj
ZGVmaW5lIFBDQUxJR05fTUFTSyAoUENBTElHTiAtIDEpDQo+IGRpZmYgLS1naXQgYS90YXJnZXQv
aGV4YWdvbi9nZW5wdHIuYyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jDQo+IGluZGV4IDU1Yzdj
ZDg2YTRlLi40MmYyNWY2ZjQ2MiAxMDA2NDQNCj4gLS0tIGEvdGFyZ2V0L2hleGFnb24vZ2VucHRy
LmMNCj4gKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMNCj4gQEAgLTI4LDE4ICsyOCw2IEBA
DQo+ICAjdW5kZWYgUUVNVV9HRU5FUkFURQ0KPiAgI2luY2x1ZGUgImdlbl90Y2cuaCINCj4gDQo+
IC1zdGF0aWMgaW5saW5lIFRDR3YgZ2VuX3JlYWRfcmVnKFRDR3YgcmVzdWx0LCBpbnQgbnVtKQ0K
PiAtew0KPiAtICAgIHRjZ19nZW5fbW92X3RsKHJlc3VsdCwgaGV4X2dwcltudW1dKTsNCj4gLSAg
ICByZXR1cm4gcmVzdWx0Ow0KPiAtfQ0KPiAtDQo+IC1zdGF0aWMgaW5saW5lIFRDR3YgZ2VuX3Jl
YWRfcHJlZyhUQ0d2IHByZWQsIHVpbnQ4X3QgbnVtKQ0KPiAtew0KPiAtICAgIHRjZ19nZW5fbW92
X3RsKHByZWQsIGhleF9wcmVkW251bV0pOw0KPiAtICAgIHJldHVybiBwcmVkOw0KPiAtfQ0KPiAt
DQo+ICBzdGF0aWMgaW5saW5lIHZvaWQgZ2VuX2xvZ19wcmVkaWNhdGVkX3JlZ193cml0ZShpbnQg
cm51bSwgVENHdiB2YWwsIGludA0KPiBzbG90KQ0KPiAgew0KPiAgICAgIFRDR3YgemVybyA9IHRj
Z19jb25zdF90bCgwKTsNCj4gQEAgLTMxOSwxMSArMzA3LDYgQEAgc3RhdGljIGlubGluZSB2b2lk
IGdlbl9zZXRfaGFsZl9pNjQoaW50IE4sIFRDR3ZfaTY0DQo+IHJlc3VsdCwgVENHdiBzcmMpDQo+
ICAgICAgdGNnX3RlbXBfZnJlZV9pNjQoc3JjNjQpOw0KPiAgfQ0KPiANCj4gLXN0YXRpYyBpbmxp
bmUgdm9pZCBnZW5fc2V0X2J5dGUoaW50IE4sIFRDR3YgcmVzdWx0LCBUQ0d2IHNyYykNCj4gLXsN
Cj4gLSAgICB0Y2dfZ2VuX2RlcG9zaXRfdGwocmVzdWx0LCByZXN1bHQsIHNyYywgTiAqIDgsIDgp
Ow0KPiAtfQ0KPiAtDQo+ICBzdGF0aWMgdm9pZCBnZW5fc2V0X2J5dGVfaTY0KGludCBOLCBUQ0d2
X2k2NCByZXN1bHQsIFRDR3Ygc3JjKQ0KPiAgew0KPiAgICAgIFRDR3ZfaTY0IHNyYzY0ID0gdGNn
X3RlbXBfbmV3X2k2NCgpOw0KPiAtLS0NCj4gDQo+IE5COiB1bnRlc3RlZCA6KQ0KPiANCj4gUmVn
YXJkcywNCj4gDQo+IFBoaWwuDQo=

