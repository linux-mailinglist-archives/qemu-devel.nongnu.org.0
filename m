Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B38DD302FD5
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 00:11:05 +0100 (CET)
Received: from localhost ([::1]:59826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4B0h-0003aW-GZ
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 18:11:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1l4Ayz-00039m-HG
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 18:09:17 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:44939)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1l4Ayw-0006lm-3w
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 18:09:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1611616154; x=1643152154;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zIh2mHM6oK9rJm65WP/KNwj0jSWtn8Q42WIC812r5zk=;
 b=h0JmiZyNioQmbXIlhtdZW7JCvmvXM+vi4bIzKqZnpHd4enFQUExoLuDY
 4tFnk+QFwCDPPWBME28kQy5YJwaVc1TTOWDqjIULGH3hPUwKQ3h056MMN
 tqv/8Z97QHGVrbY/v/gxxCzxRNrLkc/R2ZYA+a1wRXDdtfRbHxVMCUqJz w=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 25 Jan 2021 15:09:11 -0800
X-QCInternal: smtphost
Received: from nasanexm03a.na.qualcomm.com ([10.85.0.103])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 25 Jan 2021 15:09:11 -0800
Received: from nasanexm03b.na.qualcomm.com (10.85.0.98) by
 nasanexm03a.na.qualcomm.com (10.85.0.103) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 Jan 2021 15:09:10 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03b.na.qualcomm.com (10.85.0.98) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Mon, 25 Jan 2021 15:09:10 -0800
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB4663.namprd02.prod.outlook.com (2603:10b6:a03:41::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Mon, 25 Jan
 2021 23:09:09 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::41f5:1c20:959e:559e]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::41f5:1c20:959e:559e%7]) with mapi id 15.20.3784.019; Mon, 25 Jan 2021
 23:09:09 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH v7 00/35] Hexagon patch series
Thread-Topic: [PATCH v7 00/35] Hexagon patch series
Thread-Index: AQHW7tx8e7SdAKB9DUaWUJKtAfedNKo48T2AgAAHaUA=
Date: Mon, 25 Jan 2021 23:09:09 +0000
Message-ID: <BYAPR02MB4886C64A59EAC3B164159D5BDEBD9@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
 <02e7217d-6376-b93d-842d-197d9e13fc58@amsat.org>
In-Reply-To: <02e7217d-6376-b93d-842d-197d9e13fc58@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [76.120.51.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7f4d8c6-bce3-4972-60d1-08d8c18638de
x-ms-traffictypediagnostic: BYAPR02MB4663:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB4663E6CED14F89024126ABE7DEBD9@BYAPR02MB4663.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JLRgtlC0tb6dBrWV6lPpygP0b5nQUA4C06vE9oV7k2bsFH4GWE+W1SZcKNccScqBPLrfyo+k7TuDCzVXGzFlLV36RYLlPpCAOhdTabQTXCygrp/fs9fTtHySWt1n+pJ1mZ2VW8+rsZ1E7CiWcdPb4OmQ3LvyS+00O33wQUeNR0w3MUpVxDYgn2OHpGGYHqAr3OYRjhfZXMvdWXe0fJ+LHeBMyk3VkLefPuA2gh3hanT/DR5XwY2IV/N0qegO4kgYkgs1b0qD+ZACfLucg4ek5TXkfgzfpkim1SL/zUG0SddurcJwAI3GlbEjaIIfJxcE+Dg7pU/yd/EFIHGAWmX4aUxoLNRBidxsLKD7zlpgcCfdRAqfEC6egd7vnojPwCJXNIAp56d4nvSL2V2CHaUCBXjFD7sUGFDp0scyXb3XYTBXBEDeDs5eYFEHpd5X/uxsGSCHlldD1gZw0Ev09TqwVg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(316002)(7696005)(52536014)(66946007)(110136005)(54906003)(55016002)(2906002)(66476007)(64756008)(8676002)(66556008)(71200400001)(9686003)(66446008)(83380400001)(5660300002)(26005)(4326008)(6506007)(76116006)(8936002)(86362001)(53546011)(186003)(33656002)(966005)(478600001)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Szh4WEppaFJzM1RCWjAvSE5ZZXFldmlWR3JhRXErY2cwc2Z1Zml6TEJIS3Ry?=
 =?utf-8?B?c3Q2akFlaVl6V0hKd0wrMFFDdjN1K0VzTGdjWWs2aC84VmF6YUUwRCtIRk9K?=
 =?utf-8?B?SDVURnk3VVFqYVJkUHNFY3Urc3F6NFpYN3BraE95TlAzaWNaMlFISG4vbUNG?=
 =?utf-8?B?VWQrTHhkTnlhbzZrOVhSNXNUYndnV3NzQlIwdzluT3JGVTV6QmtpTzhNY2Fj?=
 =?utf-8?B?M21IK2g3QXN3a2d1MnZOYWxuay9xcEpoWVFYOGlBbmlZcjR4NmZtaGZVU1ZD?=
 =?utf-8?B?Zm1xR2NLdWluYVJ0aDJSbzJ6akJCVWZhVWloZWVmY1REV1VObDFWdEpqZytl?=
 =?utf-8?B?Uld3QVowWUlOSDlXSUhFOGpNN243QU9ES2EzZ0Vaa1Q3bDN6TFR6QVVFWmN6?=
 =?utf-8?B?RUpXekVnb0NYLytaYmxwZEZNcXo1bXBGOE5qcjB1UWJPcXVLM2tHWmdFdTlE?=
 =?utf-8?B?WFdCSGJXQ2NQSEZrZnhKbGU0NVlxWThBUXdaTFdYVGJ6L1NzSjZNUmdzRUs4?=
 =?utf-8?B?Y1ZKY0NtSmhqRHE1Wm45eHRiNTFhSmNEaVRLRGszTVVld2J5V1lVbXNteU42?=
 =?utf-8?B?VTZwMU1XSmtVSmN6OXU1RTMyQXg0dTM0UUFtZ0NPaE9MOVVya0JMQjlnRm16?=
 =?utf-8?B?VlhFYmV2Rkdla2xXejNaNmk5cmYwL0xGWUlSVG44WlM4NXJXR1hqN3hHS2xT?=
 =?utf-8?B?emd0RGtsZUZnTk5qZUZ2eWZsRkhKSzlaS1Nodzl3WUh2cGpXZ1ZCakF1Qmp1?=
 =?utf-8?B?cUkxNEozVmlhR2dLM3d0REJVRkw2bnhYK212WU1wVjNNcUpHUC9HdFR1SjFC?=
 =?utf-8?B?ZTUzWXp3NnNsMHF6M1N0bFR2a0kzamFaMG9JdkFkdzRkTFBuOXBzbHJRZUI1?=
 =?utf-8?B?eEhRZ0gyM1RHQ1YxTTJvN1p5Wmk5TDkxN3Q0UU0xN0syUlpHR3R0cWE4Y3pk?=
 =?utf-8?B?cEVieTFmRURyWmx2T3FmRzZUZTY0RnpwU2NJQ09CVjF3MXh6MGFraTFXN0I3?=
 =?utf-8?B?ZE1jbVBqNGVaL05QRTV1STBBNG1YcC9mVHB6S2FoTkVnbDBZUTFnMm9ybHNv?=
 =?utf-8?B?UlNISzdXVWUrdjVmT1UzTVdWT3dMNHRrUDlNMEpGajFiTHA5S04wL1NzUDFj?=
 =?utf-8?B?VDVNeGQwL1Nta0JlNFFGTDh5VktZY2QzTTFuMzlnSHZGOEt3bDBIRkJ2Zlc0?=
 =?utf-8?B?WXRsOEt0UFBDcFk4cXBKa3h6ak56cFc4ZmtjbkY1WUhpMEVIYmU1cUI3SWFF?=
 =?utf-8?B?WEF2cDBaRVd1NVo4Yzh5dWRLVFYwWEk3UDRENVBCVTZ1MFVEMzFsVjNxVTBi?=
 =?utf-8?B?SUVHU1VKMVIxbTdIQUtTczh3ZW9tU2J4bUdwL2Z6ZHAwcUJrZmpJanlycWpZ?=
 =?utf-8?B?SFVmVnFYdnpsMVhWcDFucE1adVBzR2pDUEF3QmtObjErVVRnNkN6Nm1GaEpX?=
 =?utf-8?Q?qSNOk5+m?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcHVffD0MUcaZf1h7PbtWbX943D88yjKw/CtWWzIZvh0pr+MueJ7WXBwowwpQaMz2gfyqnibxFJ/Otur+KnYQxlhIBvQeXXIyrxmdgwbhH5cjj3IsyUJnKR4dJXZUuQuzFrrLH3odVoXbwVAn4hYgjkD0amejdx4S3+aM+rtxcydlqnKMMUdHM7IDl4WjZd405yhsactRtkSMFBSQCu53es6x26uS5FR5W+vtQoi2S5jvOA9X72+3qyyUfmHPxis1A5yzdsZBFTr8shhpV67SRHL/jUs1lz4x0vQPWNsZ0Ns5wMa3Msxjo523CRCj574NEWqTate5be3jDWPQcDWfw==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8Xm9RFVu1ZoI2ufXdlk2O07NC1pNlVrI+BLBN+YbXU=;
 b=esh5G42FfM1h+ZKw1iHmgh6MCNpFZw43+L/S6PfiHa1hjRLRs3pHSDxUJih47DidU/ID1mvG6RhWzO0qKDE6A7oW+6AaQVGchUbOweLcHPT73n7EDc6ghAY8PhHb5ugNtRMGITK6xsxk7mFR6+09AV93FkljpXHFXNF8ageXLKL0iHfxx15/5J/eD1oqBtKMaBwuiMR370+dTNR/Ya+7/HpFs0P82g/G+jiJcmSsPHmc77S2MSUodoEEJE5MQOQv+9QFi8QfY5QCKxPfiSgrlpiGdYy5KeFdFwiGIrG0nGtzeTag7r1TMZuPNMAEjdOjq4S/ePbqDtPq/8FnL26Vtw==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
dkim-signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8Xm9RFVu1ZoI2ufXdlk2O07NC1pNlVrI+BLBN+YbXU=;
 b=JqoOavpvvKLjX6PwrfUSwJqNqSeFPVwlBbw4ydSOr0VsSMUPML33YRk6pNosguOGKRPA4hN0jltXO7xXInb2D29CbFM26iAQRkslJC+ibs3XMA9IQykihO7FWoH6AyjRQODGQtw3/QeZhTr9PzH8Iz5HtuYrKYi47LJWix6cnHk=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: b7f4d8c6-bce3-4972-60d1-08d8c18638de
x-ms-exchange-crosstenant-originalarrivaltime: 25 Jan 2021 23:09:09.5502 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: PeVlwSv3JAPuePJzw3ZbUrHEW7Xg3GjdpWWJz3kpJhspzIvSDAA2PlzpAknR5OC4+dgc4oVqQJk0OyEjtwqyrg==
x-ms-exchange-transport-crosstenantheadersstamped: BYAPR02MB4663
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
T2YgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kNCj4gU2VudDogTW9uZGF5LCBKYW51YXJ5IDI1LCAy
MDIxIDQ6MTUgUE0NCj4gVG86IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT47
IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9y
ZzsgYWxleC5iZW5uZWVAbGluYXJvLm9yZzsNCj4gbGF1cmVudEB2aXZpZXIuZXU7IGFsZUByZXYu
bmc7IEJyaWFuIENhaW4gPGJjYWluQHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHY3IDAwLzM1XSBIZXhhZ29uIHBhdGNoIHNlcmllcw0KPg0KPg0KPiBIaSBUYXlsb3IsDQo+DQo+
IE9uIDEvMjAvMjEgNDoyOCBBTSwgVGF5bG9yIFNpbXBzb24gd3JvdGU6DQo+ID4gVGhpcyBzZXJp
ZXMgYWRkcyBzdXBwb3J0IGZvciB0aGUgSGV4YWdvbiBwcm9jZXNzb3Igd2l0aCBMaW51eCB1c2Vy
IHN1cHBvcnQNCj4gPg0KPiA+IFNlZSBwYXRjaCAwMi8zMyBIZXhhZ29uIFJFQURNRSBmb3IgZGV0
YWlsZWQgaW5mb3JtYXRpb24uDQo+ID4NCj4gPiBUaGlzIHNlcmllcyBhc3N1bWVzIGludDEyOF9v
cigpIGlzIGltcGxlbWVudGVkLg0KPiA+IGh0dHBzOi8vbGlzdHMubm9uZ251Lm9yZy9hcmNoaXZl
L2h0bWwvcWVtdS1kZXZlbC8yMDIwLQ0KPiAxMC9tc2cwNjAwNC5odG1sDQo+ID4NCj4gPiBUaGUg
c2VyaWVzIGlzIGFsc28gYXZhaWxhYmxlIGF0IGh0dHBzOi8vZ2l0aHViLmNvbS9xdWljL3FlbXUg
b24gYnJhbmNoDQo+ID4gc21hbGxfc2VyaWVzX3Y3Lg0KPiA+DQo+ID4NCj4gPiBPbmNlIHRoZSBz
ZXJpZXMgaXMgYXBwbGllZCwgdGhlIEhleGFnb24gcG9ydCB3aWxsIHBhc3MgIm1ha2UgY2hlY2st
dGNnIi4NCj4gPiBUaGUgc2VyaWVzIGFsc28gaW5jbHVkZXMgSGV4YWdvbi1zcGVjaWZpYyB0ZXN0
cyBpbiB0Y2cvdGVzdHMvaGV4YWdvbi4NCj4gPg0KPiA+IFRoZSBmaW5hbCBwYXRjaCBpbiB0aGUg
c2VyaWVzIGFkZCBkb2NrZXIgc3VwcG9ydC4gIFRoYW5rcyB0byBBbGVzc2FuZHJvDQo+ID4gRGkg
RmVkZXJpY28gPGFsZUByZXYubmc+IGFuZCBCcmlhbiBDYWluIDxiY2FpbkBxdWljaW5jLmNvbT4g
Zm9yIG1ha2luZw0KPiB0aGlzDQo+ID4gaGFwcGVuLiAgVGhlIGRlZmF1bHQgY29udGFpbmVyIChk
ZWJpYW4taGV4YWdvbi1jcm9zcykgdXNlcyBhIHRvb2xjaGFpbg0KPiBidWlsdA0KPiA+IGJ5IHJl
di5uZy4gIEFsdGVybmF0aXZlbHksIHRoZXJlIGlzIGEgY29udGFpbmVyIHRoYXQgd2lsbCBidWls
ZCB0aGUgdG9vbGNoYWluDQo+ID4gbG9jYWxseSAoZGViaWFuLWhleGFnb24tY3Jvc3MtYnVpbGQt
bG9jYWwpLg0KPiA+DQo+ID4gSGVyZSBhcmUgdGhlIGNvbW1hbmRzIHRvIHZlcmlmeSB0aGUgY29k
ZToNCj4gPiAgICAgbWtkaXIgYnVpbGQNCj4gPiAgICAgY2QgYnVpbGQNCj4gPiAgICAgLi4vY29u
ZmlndXJlIC0tdGFyZ2V0LWxpc3Q9aGV4YWdvbi1saW51eC11c2VyDQo+ID4gICAgIG1ha2UNCj4g
PiAgICAgbWFrZSBjaGVjay10Y2cNCj4NCj4gSSdtIGxvb2tpbmcgYXQgc3RyZXNzaW5nIGEgYml0
IG1vcmUgeW91ciB3b3JrLg0KPg0KPiBBcmUgeW91ciBIZXhhZ29uIExpbnV4IHVzZXItbGFuZCBi
aW5hcmllcyBhdmFpbGFibGUgb24gc29tZSByZXBvc2l0b3J5Pw0KPiBFdmVudHVhbGx5IGJ1c3li
b3ggYmluYXJ5IChrbm93biB0byB3b3JrIG9uIHJlYWwgaGFyZHdhcmUpIGlzIGEgZ29vZA0KPiBj
YW5kaWRhdGUuDQoNCkEgcHJlYnVpbHQgYnVzeWJveCBpc24ndCBjdXJyZW50bHkgYXZhaWxhYmxl
LCBidXQgd2UgY291bGQgcHVibGlzaCBvbmUuICBJcyB0aGVyZSBhIGNlbnRyYWwgbG9jYXRpb24g
Zm9yIHRoZSBxZW11IGNvbW11bml0eSB0byBnZXQgdGhlc2U/ICBPciBpcyBpdCBleHBlY3RlZCB0
aGF0IGVhY2ggdGFyZ2V0IGhhcyB0aGVpciBvd24/DQoNCk5vdGUgdGhhdCB0aGlzIHNlcmllcyBp
bXBsZW1lbnRzIGEgc3Vic2V0IG9mIHRoZSBpbnN0cnVjdGlvbnMuICBJIHBsYW4gdG8gc3VibWl0
IHRoZSBvdGhlcnMgb25jZSB0aGlzIHNlcmllcyBpcyBhY2NlcHRlZC4gIFNvLCBJIHdvdWxkbid0
IGJlIHN1cnByaXNlZCBpZiBidXN5Ym94IGRvZXNuJ3Qgd29yayB3aXRoIHRoaXMgc2VyaWVzLiAg
SSBrbm93IHRoYXQgaXQgd29ya3Mgd2l0aCB0aGUgZnVsbCBzZXQgb2YgaW5zdHJ1Y3Rpb25zIGlt
cGxlbWVudGVkIGF0IGh0dHBzOi8vZ2l0aHViLmNvbS9xdWljL3FlbXUuICBJbiBmYWN0LCB3ZSBk
ZW1vJ2VkIGl0IGR1cmluZyBvdXIgdGFsayBhdCB0aGUgMjAxOSBLVk0gRm9ydW0gaHR0cHM6Ly93
d3cueW91dHViZS5jb20vd2F0Y2g/dj0zRXBuVFlCT1hDSSZsaXN0PVBMVzNlcDF1Q0lSZnd3dHZV
UzFQY282WTBYLTV0eWtweUcmaW5kZXg9MzMuDQoNCg0KDQo+DQo+IEFsc28gSSBub3RpY2VkIHRo
ZXNlIHNhbXBsZSBhcHBzOg0KPiBodHRwczovL2RldmVsb3Blci5xdWFsY29tbS5jb20vc29mdHdh
cmUvaGV4YWdvbi1kc3Atc2RrL3NhbXBsZS1hcHBzDQo+DQo+IFRoZXNlIGNvdWxkIGJlIG5pY2Ug
dG8gaGF2ZSBhcyBpbnRlZ3JhdGlvbiB0ZXN0aW5nOg0KPg0KPiAtIGFwcGlfZmlyDQo+ICAgQVBQ
SS1iYXNlZCBtb2R1bGUgdGhhdCBhcHBsaWVzIGEgRklSIGZpbHRlciB0byBhdWRpbyBkYXRhDQo+
IC0gaW1hZ2UgZG93bnNjYWxlDQo+ICAgRXhhbXBsZSBzaG93aW5nIGRlZXBseSBvcHRpbWl6ZWQg
MkQgaW1hZ2UgZG93bnNjYWxpbmcgZnVuY3Rpb24NCj4gLSBjb3JuZXJBcHANCj4gICBFeGFtcGxl
IHRoYXQgZGV0ZWN0cyBjb3JuZXJzIGluIGFuIGltYWdlLCB1c2luZyBhRFNQIEZhc3RDViBwcmlt
aXRpdmVzDQoNCkFsbCBvZiB0aGUgU0RLIGV4YW1wbGVzIHJ1biBvbiBvdXIgUlRPUywgbm90IGxp
bnV4LXVzZXIuICBJIGNvdWxkIGNvbnZlcnQgc29tZSBvZiB0aGVtIHRvIHdvcmsgaW4gbGludXgt
dXNlciBtb2RlLiAgV291bGQgdGVzdHMvdGNnL2hleGFnb24gYmUgdGhlIHJpZ2h0IHBsYWNlIGZv
ciB0aGVzZT8NCg0KPiBBbnkgb3RoZXIgcmVhbC13b3JsZCBiaW5hcnkgeW91IGNvdWxkIHNoYXJl
Pw0KDQpJbiBhZGRpdGlvbiB0byBidXN5Ym94LCB3ZSBjb3VsZCBidWlsZCBvdGhlciBvcGVuIHNv
dXJjZSBwYWNrYWdlcy4gIFdvdWxkIHRoYXQgYmUgb2YgaW50ZXJlc3Q/DQoNClRoYW5rcywNClRh
eWxvcg0KDQo=

