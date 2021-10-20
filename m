Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D46D1435627
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 00:51:11 +0200 (CEST)
Received: from localhost ([::1]:33600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdKQQ-000457-RU
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 18:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK7i-0007SI-Pd
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:31:52 -0400
Received: from mail-bn3nam01on0710.outbound.protection.outlook.com
 ([2a01:111:f400:fe41::710]:21728
 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK7g-0005a7-Tq
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:31:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jp0yvVhAYseKNDqkJJtZsZ3LeGsdYFm48getHvYactCIQcLe2Nz+ZG5EJCFumHli5u5KJMz5ob6il6bkD+lZbAdxdRDVg4rimOggyrQOPeO5+If5WlBuEAtPnBYHDi6E1VwMj45ZPdk8TsjTWRPtr2iKp5RHWIxiwnRDOUq2VpPwSanwy61ymYtgtnzmF4S4MHnhfH30R7v0pdmSSE3HXF7OxR5y6qNZKb3uwttXyhWvYsEsjYZTZuS8rwv+FQRhjZWMaY3HzuFRupEBRP0iJAJbn1AwmNqcxE18YGCyeG+zNzFvE8VPZyiHa+yx2UzR1VPSrxI1892sEGQK//Tm+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZoQwh1C2gvp/KZ868ckMVqogxqT6PPJy60xGmsZPYM=;
 b=ZQIrmf52pdvgku3i8NzudNMAlQrK/9Ag9HgSaQGIMcPVJOLdE3u8POGXPCgMzaSPIMjMsT3jiz+AOmDavrrYSJvfA3n4Cb62xH/ruRXSjoX2ai7nqqSvBljSiRE3p256eAhl6JTc3QAjd3m4esSmqyl3U9rpfl0gjaUPxR08xF81kwe6Wt0vC8OoXkvX2iMBLYsrARqlzxrGhc/1D697u/MYpP3L3LBoo2d5R2Y2eFCpIDmAmDyx40iN4ZAjXYORiSzodfzb9JGiD60OvO1DZZ6Dxvxzgnct967zTxbKHIXEephXOWC+t2GOEUDHJQ/u0NCtbJx0btzoviQTOgwmGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZoQwh1C2gvp/KZ868ckMVqogxqT6PPJy60xGmsZPYM=;
 b=iLgTE5pwT+B+SevNj+hqX18aQlap1Bw052REWcjjWnpAjrSUfxmOB5TL416PaCs5Bxql3xwszB+VfhLOoLd+l0/RBPsr48WOphamQbdwqGfpKNZeYWTjpOJBGnGOeEv+WaJiJFAPxShzs2G/4HiW7BsFbmcUzZTwkWH79Y7iuLZLOE8RVqf49dDN2dbl6//UiMoPpFtlOXDRDT5YVNM8ZIztP9OSQmKI9P+HL1CqUGnB1UmwiOkcqIJltJZCmqOGMExf/y3Y5qwmHtCjN7c9soD2rwIrrxaHBu7kDyHJeEk5DCeCdtDesS96WGP0McUcmQdScQ8yrnhohfk0p1M/kQ==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB4482.lamprd80.prod.outlook.com (2603:10d6:102:49::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 22:26:44 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4608.019; Wed, 20 Oct 2021
 22:26:42 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 01/48] tcg/optimize: Rename "mask" to "z_mask"
Thread-Topic: [PATCH v2 01/48] tcg/optimize: Rename "mask" to "z_mask"
Thread-Index: AQHXu7XBXmp5Qt2/WkG+lmLXFW2Ivavcg7JQ
Date: Wed, 20 Oct 2021 22:26:41 +0000
Message-ID: <CPXPR80MB5224F0E9A037EED261BF142BDABE9@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-2-richard.henderson@linaro.org>
In-Reply-To: <20211007195456.1168070-2-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e68d1cb-74c6-4d84-82c6-08d99418b125
x-ms-traffictypediagnostic: CP2PR80MB4482:
x-microsoft-antispam-prvs: <CP2PR80MB448221E9DD20E54A3396BC5DDABE9@CP2PR80MB4482.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5BpfDZWgYm9DPPyd9dAUSAYUNfbkqjyGYCzXfQu72HJBydXts4SbBH1j8e0UfIVzEc2YM2Ubzq995IYSTmBys9g0bDhVWGr2qzaCmlQxbXl6gLxtKqTm5zoAC0s5RGrVCELu1WxwfF7AyE5wmjqU6gccoetqN8xFKO1TURsE7MHhQ52kB/NPkbkEB78/BcKwG8GlHN5mIM/iu/Cs5JuVAsYb/fg9Nd8UXM8adrsHyPpXSVOa0DelpoZ+KOygyY/7QOG6mtA2NRAvt2gxo6IVAjlX2N4IFC9wThEmvmnLlGuc8OQrfjOiEiyGGoT90n+U3AAQw8r5ahFwwg9mFNPogr5lOqTKH3i7NMun5rm+j323qRRBk3dk8rjfm7QvA48qDV5qYsg8DSiWnpR/SPYcqM+rn34XfdRaIOUK8Qllj9gLPRL0uakIhXZ3j2GC0JYLQumyqractCjWqHkPOQytuEqDXQibolU0opF+xtM3BMGgXQ10yVaS8j9qmhgjV/8z/4bgpYs1XZ3P6VywrBVwROcxMAn+SD4eK+23+TXMi9Vk1Q+gcemdm/6U6U0Aoc98ZTMpjexHQo80usBapFzcOLuiqSBZgw6n9XoDwXY33fnoSqsksZcwbAq+DGaxvsLiyZYXReZwB3qoAOzTfU504f+TJ6ypCJ0BFcer9VOQYbFc5F5jfZI16C0nQGqMsbSLrQ4avionVIfBR8ZRe0rCBYwI9SspC5uaGBJe8pC+/f0FGFvZUkp9wqA7PJsMqYramz6DtPPrkILDbJ2sjSMxP1mCn4tWZr9QU7FE4xAqEFM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(66476007)(64756008)(110136005)(52536014)(122000001)(33656002)(316002)(26005)(2906002)(83380400001)(508600001)(76116006)(86362001)(9686003)(55016002)(7696005)(38100700002)(66556008)(66446008)(8676002)(6506007)(4744005)(66946007)(186003)(4326008)(71200400001)(5660300002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzB4QjNhM3lMcTdERmUva0owNjhydndERTFYRk01UkRqUFBCUUZkZkZsU2Yv?=
 =?utf-8?B?ZGdNTHV3d1NhcW5ESXpaYzhCMjJlUU8vOEhId0FUaEM1bUwyNjNCSTZpekll?=
 =?utf-8?B?NW1xNUxWbUhIMjMyMnRiNUlkZmliR0xoTjZORm1ZY3dkMUI5VnEzQVNZbnNB?=
 =?utf-8?B?anJ6Uzh0dzQxVFY3TDQ5ZEtEd1hkcjZZOC9rN1pLT0RGK2JvaGtPekU1c05S?=
 =?utf-8?B?cmpFL3o2YytQNDJyeFhEa0hGWmxncFpHWGMrZC85VlIrMWZSZnBaZVZUZmQy?=
 =?utf-8?B?VjN2THJBZTRnZER1Zzd0blp6NkhmWHVBbmxEVG5scGg3V1BYbmkyY00reCtn?=
 =?utf-8?B?bUpkMnY0clV4cXB5UFBHQ2R2RnZ0ekYxNlVONDIwc1dSeE5zRHdtU21lYTEy?=
 =?utf-8?B?TXdvWGx2NHZlTXU2YzcyNkp4RGNFU05VbEpnSjNSTEhZN2FQeVl2VXlOcmxj?=
 =?utf-8?B?UEJ6ZXpOY3BmNHZJRTJYN1ROQmRmcmxrVytTZ04ycjlvalBDczRJbVg4ZWdV?=
 =?utf-8?B?U3hCQ1NyUXJrOGIvdGdVeEVuZkpTQ0VPZEhnY0RwdC9Zd2orZzFLMExXRE1W?=
 =?utf-8?B?SThrN1diUndLNE1mMWVPQVE0eWNwZ2ZLbUxBR29VUGpTbmhucW1QTFlETkhw?=
 =?utf-8?B?cmtHSnlRcFJuWVlxWU5DT2FOajc5czlzKzROWU5RbDhhZ21Cam84T3d4RU1M?=
 =?utf-8?B?TC84TDBNMEx2RjZJcVd2OWZCV1JPM3owclBUb0RWWm1oK21GcUZaVlNWMkNw?=
 =?utf-8?B?QisrWDYvU3dDNDZuaDVVRHRnL2ExcGxrdWhaL25ucnVyVFJ6NkxCMnZOeWtk?=
 =?utf-8?B?ckgwbFR4MnlBblhuanUrdDNYN2dXcXVRRFI1UlZJZ2tTZG55eElwaFZ3NFNt?=
 =?utf-8?B?M3BZTEN2cDcvOElwRnN1SksyZW93RWQydEhwMXJ2N29zcWoyNzRyU0VEQThO?=
 =?utf-8?B?ekRjSHY1YnJ2MjQvbE82SVVkVXRaNk9URkZTK1Z0MENmcTVnenRqcVl6SXVM?=
 =?utf-8?B?Ynp0K0htYlpTZGx3VC9YcnB0a2lIYjlPYnZGcEo0NWhUM0hDV3FyQnZrNXpq?=
 =?utf-8?B?bGhTU2xoZzYyWis3T0MwWFlOa1Z0cks2SXZnMkhaSFhnRWVLUElHNzJEU0Zs?=
 =?utf-8?B?REJlNzRoQUhrb2RtSVBieVB2ZXNSNEpWbkpualN6Ylp5QUl4di8rZlQ1cnJu?=
 =?utf-8?B?QnZzT0diSnh5SGdKMUhsVHhldFhqNzRQT040OVlJcnlLNU1hclRxelB2WUt0?=
 =?utf-8?B?SFYxMWZHRi9LeFh4a0U4MTRkSG54c1JkTXNyUk0wTitWNm5HUzl3U2VhWUk2?=
 =?utf-8?B?TmhYbFM4Y3BRVDhCZ0E2ZHdKWG42YUhYUVpmMlp6ZXl2L2xyN3dHNHVzRHNR?=
 =?utf-8?B?YmlOZU1VWmJJQlE1RUpqOS84SklnamUrVHJGdHdTajZVbENTQzBYWXlUZUR3?=
 =?utf-8?B?aHN2czhiR2F3T0pqemVPZ0ltSndLQUdDUkI2dGxVZDRlZm9naUFIalhlZEJ5?=
 =?utf-8?B?M3lnU0xWdjhmeHB0alJBc2hYalBwRitXek5abkRDMFRuT0wxL2tLYVdsNGwz?=
 =?utf-8?B?TUVvVGhkZ25BdVRFVEhlZGJRd1pxNndqUGtCaFBpWHFTRDFCTFVLUmhuK0RT?=
 =?utf-8?B?cjAwVHhBSFdKdUJ4YkUzN0ZjcXVtV0tMQVV2V0ZXTDB4djJPaWtoWVVLbUJD?=
 =?utf-8?B?OFJ3djc5Y21NRFYzTFYxd1B6VXV1UUo1UlZIcmp2MFZoaEhsZHF1dm1CRURZ?=
 =?utf-8?Q?eYQF8ed0a/2WPGygrjtRUy2AIAPqkPlZ6yfTUJ3?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e68d1cb-74c6-4d84-82c6-08d99418b125
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 22:26:42.0398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4482
Received-SPF: pass client-ip=2a01:111:f400:fe41::710;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-BN3-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1,
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
Cc: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
IFByZXBhcmUgZm9yIHRyYWNraW5nIGRpZmZlcmVudCBtYXNrcyBieSByZW5hbWluZyB0aGlzIG9u
ZS4NCj4gDQo+IFJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdAYW1z
YXQub3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5k
ZXJzb25AbGluYXJvLm9yZz4NCj4gLS0tDQo+ICB0Y2cvb3B0aW1pemUuYyB8IDE0MiArKysrKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hh
bmdlZCwgNzIgaW5zZXJ0aW9ucygrKSwgNzAgZGVsZXRpb25zKC0pDQoNClJldmlld2VkLWJ5OiBM
dWlzIFBpcmVzIDxsdWlzLnBpcmVzQGVsZG9yYWRvLm9yZy5icj4NCg0KLS0NCkx1aXMgUGlyZXMN
Ckluc3RpdHV0byBkZSBQZXNxdWlzYXMgRUxET1JBRE8NCkF2aXNvIExlZ2FsIC0gRGlzY2xhaW1l
ciA8aHR0cHM6Ly93d3cuZWxkb3JhZG8ub3JnLmJyL2Rpc2NsYWltZXIuaHRtbD4NCg==

