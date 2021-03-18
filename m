Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7A833FDF0
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 04:58:54 +0100 (CET)
Received: from localhost ([::1]:58666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMjoD-0005R3-2o
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 23:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lMjmj-0004cv-LI
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 23:57:21 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:44872)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lMjmh-0000Nv-EM
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 23:57:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1616039839; x=1647575839;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s2wH3t9cbuFMQsZ0faic6XIduN8FZkIW6c64euW82yE=;
 b=pzUYQ4dKNzWgLCJvHVKc1IReAEphyQ5z9bnV/UUSFfT/KLL0QTNfsGw2
 5LVvoY1zARnlePff/sYDMY8JZsoPRFYQA1jcyfEk1vaFK6Jfo4UvdTyIc
 QIMQYgG8zmA4hckk7/MRGluy1dPEAflSlF1OgemiEGaHSn5C5G+BDrUks k=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 17 Mar 2021 20:57:16 -0700
X-QCInternal: smtphost
Received: from nasanexm03c.na.qualcomm.com ([10.85.0.106])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 17 Mar 2021 20:57:16 -0700
Received: from nasanexm03g.na.qualcomm.com (10.85.0.49) by
 nasanexm03c.na.qualcomm.com (10.85.0.106) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Mar 2021 20:57:15 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03g.na.qualcomm.com (10.85.0.49) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Wed, 17 Mar 2021 20:57:15 -0700
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB4454.namprd02.prod.outlook.com (2603:10b6:a03:5f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 03:57:14 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6%4]) with mapi id 15.20.3933.032; Thu, 18 Mar 2021
 03:57:14 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v8 17/35] Hexagon (target/hexagon/fma_emu.[ch]) utility
 functions
Thread-Topic: [PATCH v8 17/35] Hexagon (target/hexagon/fma_emu.[ch]) utility
 functions
Thread-Index: AQHW/d3JA2mZC7HMjEG+YDqSt7jZy6pYUrKAgDDr58A=
Date: Thu, 18 Mar 2021 03:57:14 +0000
Message-ID: <BYAPR02MB4886AB012781593E9881448DDE699@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-18-git-send-email-tsimpson@quicinc.com>
 <cd233aee-e185-e9e5-2ad0-0493c93f1ad5@linaro.org>
In-Reply-To: <cd233aee-e185-e9e5-2ad0-0493c93f1ad5@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9da3515-a17a-44b4-e1ee-08d8e9c1ea87
x-ms-traffictypediagnostic: BYAPR02MB4454:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB44540C000025A63FF4DB2C95DE699@BYAPR02MB4454.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GqHJWvn7rSDCrLOof8dY2RG9zEuMl3GOw8vNQHQqVQLSc2cXd5fMcBgX4ztEwaMWYmmUFzRvHYmUNIUHDxBnZgeq+huiO77RElZj5vZ52CJtLCEztS9GTTjcmx1JLY53Epe40N83MUwY+qutixfYZEx4VXfkx+VV9FlHH3/5f9Ax4dJzBdSrKeUW0VsHI0Tag3GuMprSjb//DWXE3fGxGxhbS00K6wmL8ecx54tSJ5AMR/BtgFPksVGAbzXetfp8EcsYsPxRFbjuM7XgCtV+gU/j3sL2DmxZ6xCv+Z7Hkt76x7l4Brf3gWs8XTCOEKYx4Vh/8NeJE6bpZRsYbp99R6JvkJHnC45qpGey4a4FEKE7lk+0yA1A+N+JliiswUfLgFNRCA1b05TeCkm+UGHI2dX4QpQnYNO9GMNONUzI+d/l7i/vVvXJ0nzxb01vPHUU3wy+3c6NSD6SRuZSMnj0hyvWhkmqrWOmpNTCzcTz5tc+0QJhOC6pO05qTUDR29Kxp1/mqTi2e9Mi3f6xqoXKeCiA5OF6BMp3NDqjt6ZaOGVdS9eTY9SXn1w/r69IhDrAsa3FXQP68Pkro/6Rui+ngKONZZmieQWMuIY4DLpN4VuqhLG5jykuMz3SYGD3xWAX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(4326008)(107886003)(33656002)(71200400001)(8676002)(26005)(8936002)(186003)(9686003)(5660300002)(66446008)(66556008)(66946007)(55016002)(52536014)(7696005)(2906002)(76116006)(6506007)(66476007)(478600001)(316002)(38100700001)(86362001)(54906003)(110136005)(83380400001)(53546011)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?WHNyQis5S1luSWhmSGxXNThOa0Y0YUFoSk83OU9IcFBtbms1VkhLeHBQL3Yx?=
 =?utf-8?B?VlcrRHliTjVzRFBYc3p3bGdML2FPRHUvR0pCbzZ1WTAvQ0c4d2gzNm9xSm9R?=
 =?utf-8?B?T3lhRGZBUjF0dU5BZlRWUHFEU05LYUV6cnBmTWR1c3pnM0NqME1WdkhYK2VZ?=
 =?utf-8?B?NmtVUUZNQzh1Y0NZS3pNMC9MaVZPVk8ydElXLzhWc0ZMUnhEa2hBNlpkbFEv?=
 =?utf-8?B?S2s5aldOdmZ5ZHY5WTRuVTIwMVVob1V5b1U5eS80dWpGWkd3bHpCR3cyS1dW?=
 =?utf-8?B?a1c1WGtIQ1VZanBKVVBvR2ErK3l0WDh2Y2VIc2dBbjJEbE0zZHV6c01VVWwr?=
 =?utf-8?B?dFNlZHovT1d4L3Q2dG5yOEUvTmVCM2lwSFpwOUw0WjZ4amE2SExtMm5xcVRK?=
 =?utf-8?B?OVg1aVA5ZXNYaDNsSk1FWXVmcVhtaE5EN3Vrb2ZRSnU1cGJxRFlsSzg0OW9a?=
 =?utf-8?B?RDFTd3M5ZVZ3aklldGV0QUVUSk1SdG1DNXRURFhNcWU2dzM0NjVkYlRFRWJH?=
 =?utf-8?B?MStoV2FHL1RqbGhxazJzTlZmL0N6TXhtZWg1dlA2VDdsc0ZUN1FYS0h6bDIr?=
 =?utf-8?B?S05Fa0NIazdsK1c4QURmVjNTdStDa3hOTUp6c25mekMrK2lRQXdJeVNMTXBQ?=
 =?utf-8?B?TG1odUlOTEh5VzRwRkpJNExTZ2hVa2F6ekRzaUdoQ1p0Y1lUa3gwYk9SOUs1?=
 =?utf-8?B?UnQ0MGhiQWI2RkhVcUlsTUkxb3J1bjYzOHVJWlpUM2E3c2FxWnpNS2swOWVu?=
 =?utf-8?B?R25ISmIwcHozakpUYitpVnV1dVZVL3QwZnNuVnBhL2ZVcHVHYzR3MEw2c2VC?=
 =?utf-8?B?OG9mZ1FzYTQ3NlRkRk5ma3huekM4YysxQXdBY245R0Q1TFArd2ZvU2tGcHoz?=
 =?utf-8?B?MUhVWm5ub3Vjb00wbFh5N3kvVDhuNjMyaktLaWVWdEFzMlRJTEx6dzU5MjVC?=
 =?utf-8?B?MzJlc3RlbkV6SWNtMW4rNGp2M1FFRmRtVkc3YzN4eTk5NVkxcHE0WGdmSEhP?=
 =?utf-8?B?OTRTelRWN0NpbFdnZXdlQlBSbUhTY2lkUzljLzhNU3lTa00vNnZGeGovRlN6?=
 =?utf-8?B?d3FrM3JzM3UzNmFaSHhXTjZLKzBvU29sRm9lTlgyaG52VzBwbkhyelc1YkY2?=
 =?utf-8?B?NmNrTkI5NFJiNCtPemJ5NzMyaTd5b2h2OUw4NUF0cFZJUnlVc3pQUWtLTFM5?=
 =?utf-8?B?K3AwYkRCVVZLcU9JbXRlcWt5cjVDV3puc2tScmU5SEVmazhUNTZqZlNZN1Vu?=
 =?utf-8?B?Q1hHOHhnTVRvbitKWHcwbmUxOXRhd2x3TVNzYlppUCtSNkdsRllYZThFZVl6?=
 =?utf-8?B?QU0ramdpWUZPbkxpeGkxLzBZb0ZRTVFBSDQ3Nkc1d3ltQW5DQVFORjJ5OFZs?=
 =?utf-8?B?M1JtTWREeHpJeGZpQWpEUzdMTWEzS0VlSE1ZQTlHK3d3ZnV6dzJic0R4Nzd6?=
 =?utf-8?B?SU9RZTg3OVpsRWljT0J0WFc2RW1Gd2lZaGxISVdUQ0Y4RWhWNCtIV3B3UnZS?=
 =?utf-8?B?U2o1RTd4L0JSaGQreTN2OWtGS09wUXFZWGUwb3MwK1lLOGRaM2RSWmU5ODhr?=
 =?utf-8?B?aklIanQ4a0wwZkQzWlBwNXBvajFtQm9FNUNZZGY3YitBN0dzRlRocEh0b3pJ?=
 =?utf-8?B?aXg5OERDZ3dmeGtmelVuL3hEMG9nU0twbVZ1SklDWE84ek1CY2tEQ1UxV00r?=
 =?utf-8?B?T0xTdEFLZHV0SG9zZVhZZDRuVUdBbDl6cHY1Um1wSGhsR1JlaUk4OXo0SUpN?=
 =?utf-8?Q?3rxYAq4uUfCnR83GMS4PrPXCicCJFxBL5ChfjZw?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itFlEvvMNMYa8q7dxadjhv0PkvAST7dEguICJ6eEFquPQOX22+axGPTbVOOA89rZqYJIGv8L4afPKqBwKQAXsOyrg0hhguLPieyHm11OiEU2yw/ezwgVaO8HavLL57UxilNi7mNnPYqIh/sB9TYY8qW4CTu6pqAOzqfBNyPVJjqwawM2QHJgDwOE+u15mDWlyFrn1EJSXyLTRUbEDXlj9Ac+85fsetE2CmFWmyIQgXf5T/SGG3HAQPJ9edUeUtoqohZ7T77w+1TC/bUY5CEB/9rTvnhl7Cwke4/uhI8S5QsWnTEO2IOC9laVg3MDe6L2Xb0lcq03haetQbzEfXR0JA==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plzW1QzFiKgIBFSTud65G8Z4rfrqtmlmdGRY5nUYfag=;
 b=B28SImEnDj6SbUGecS++yVkJRR89srUQeXlFMNzXwtIw7cY/VjyosEY1jdlQ5lzWBVCvHQZkGMhHZNQldxfj1nFw5yxaBCLITqLcWi0ff6cBvrtxyNuQIm5ktR6ZJqjqvhXjUXn3xRWYAKIfR6TKwcmVhvGP8bTP8h0DiU9v5opwg1Ol59D7d0ijGQLfUWoAlCaeqauItJjV8w9PQY3OrsscMAgUrW7q8T3t9nJDER31jIkhmnX4sUNEYQ9nF22OaFRpGLQ3B9zxIlXG6mZe1/CyeLEHACtszG51H9bzM1OYMZd6mVK8TOqwMZWu8U8GcS/K/vxgkdKtk678SuIDLA==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: f9da3515-a17a-44b4-e1ee-08d8e9c1ea87
x-ms-exchange-crosstenant-originalarrivaltime: 18 Mar 2021 03:57:14.3430 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: OHDf5/rkdfyeMPiyA2Axe1D9Ze+adSZIB3pIzcWbshatsKFYU2pnt3o1iZ7PBlB9LPWchX6MOuiXxyUP4GlDwA==
x-ms-exchange-transport-crosstenantheadersstamped: BYAPR02MB4454
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
 "philmd@redhat.com" <philmd@redhat.com>,
 "laurent@vivier.eu" <laurent@vivier.eu>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFN1bmRheSwgRmVicnVh
cnkgMTQsIDIwMjEgNToxNSBQTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNp
bmMuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBwaGlsbWRAcmVkaGF0LmNvbTsg
YWxleC5iZW5uZWVAbGluYXJvLm9yZzsgbGF1cmVudEB2aXZpZXIuZXU7DQo+IGFsZUByZXYubmc7
IEJyaWFuIENhaW4gPGJjYWluQHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY4
IDE3LzM1XSBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbi9mbWFfZW11LltjaF0pDQo+IHV0aWxpdHkg
ZnVuY3Rpb25zDQo+DQo+IE9uIDIvNy8yMSA5OjQ2IFBNLCBUYXlsb3IgU2ltcHNvbiB3cm90ZToN
Cj4NCj4gUmVkdW5kYW50IHdpdGggc29mdGZsb2F0LiAgSXMgdGhlIGRlZmF1bHQgbmFuIHJlYWxs
eSAtMT8gIEkgc3VwcG9zZSB0aGVuIHRoYXQNCj4gaGV4YWdvbiBkb2VzIG5vdCBkaXN0aW5ndWlz
aCBRTmFOIGZyb20gU05hTj8NCj4NCj4gWW91J2xsIHdhbnQgdG8gcGF0Y2ggZnB1L3NvZnRmbG9h
dC1zcGVjaWFsaXplLmMuaW5jIGZvciBib3RoIG9mIHRoZXNlIGNob2ljZXM6DQo+IG5vX3NpZ25h
bGluZ19uYW5zIGFuZCBwYXJ0c19kZWZhdWx0X25hbi4NCg0KWWVzLCB0aGUgZGVmYXVsdCBpcyBy
ZWFsbHkgLTEuICBXZSBkbyBkaXN0aW5ndWlzaCBTTmFOIC0gd2hlbiBhIFNOYU4gaXMgZmVkIHRv
IGFuIGFyaXRobWV0aWMgb3BlcmF0aW9uLCBpdCByYWlzZXMgdGhlIGludmFsaWQgZmxhZyBhbmQg
YSBRTmFOIGlzIHJldHVybmVkLg0KDQpTbywgaXQgbG9va3MgbGlrZSBJJ2xsIG5lZWQgdG8gcGF0
Y2ggcGFydHNfZGVmYXVsdF9uYW4gYW5kIHBhcnRzX3NpbGVuY2VfbmFuIGFzIHdlbGwgYXMgc2V0
IGRlZmF1bHRfbmFuX21vZGUgdG8gMS4NCg0KDQo+IFRoaXMgaXMgZHVwbGljYXRpbmcgY29kZSBm
cm9tIGluY2x1ZGUvZnB1L3NvZnRmbG9hdC1tYWNyb3MuaCwgZXhjZXB0IGZvciB0aGUNCj4gd3Jh
cHBpbmcgdG8gSW50MTI4LiAgVGhhdCBzYWlkLCBJIGRvbid0IHRoaW5rIHlvdSBzaG91bGQgYWN0
dWFsbHkgbmVlZCB0aGlzLA0KPiBvciwgZnJhbmtseSwgdGhlIHZhc3QgbWFqb3JpdHkgb2YgdGhl
IHJlc3Qgb2YgeW91ciBmcCBjb2RlLg0KDQpPSywgSSB3aWxsIGxvb2sgaW50byB0aGlzLg0KDQoN
ClRoYW5rcywNClRheWxvcg0K

