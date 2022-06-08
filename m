Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBEE543928
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 18:35:53 +0200 (CEST)
Received: from localhost ([::1]:48242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyyet-0003Dt-BP
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 12:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nyyYn-0008NZ-St
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 12:29:33 -0400
Received: from mail-mw2nam04on20725.outbound.protection.outlook.com
 ([2a01:111:f400:7e8c::725]:58785
 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nyyYj-0004qa-5T
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 12:29:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BW2vWZ+94z0Ae5W/ev/17zwBGzgbXJi+WdnN9dJxnM9FeFqz4WBlXkrMzuisVcpHx0csd7GAp+p9XSn/M7vUhJfz4tJjZFYF7ijPzj/ApkDEP3vNUv80miC60yDlqIQtAk0FcFOX/HdZ6eTKOG1WTMiFZXTgiT1QHukneh8cf7WHNC9eSzuR9k38SqG0yYo1ZLTWm12txcDBOqB/YA7JHAwZQoLuRUYrGE/vQHQvMHIFbUn6hAdxbqwEGs8/So/Ho2CVQsdUh8RFdJt/Pq07JJhXS1NBwzSQI9BuNH8iA3e5dRGw8VuaBr9cjqHWhRvvLC8UhtqFhCNkgLl/d6t65w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xzTRrio0tnHmGJO9rD/JIMS/2W+FuQ8y6bZK3OQO3A=;
 b=h7V/rF3Q4nFaRSld2Gok/rW24oWbHcqjcOZDjdfu71K8eEEzChrEwuCpkqCtU6DuHv2Z+iqGPiV5CxSM4D/WkXOUQwPmUVWpfcuPmCm0SVkwSJsvWmfuEoAKacnYQlNUFbWgykV55D7LxcjG7eGlL5jv06RWUTxuQbEuZi3j+wjQPo3tK3fsgoGIC75hJoB4V0GKZDVH7skqrye2LWgHikY2+BdLH2MkKnJa3jsNANQu1jR73ZvVinjyJOp9Mw436aM02UUUZd9xmCs0eoVKbppOwIXn+KJtfJz2xloI3fT/wdBsFWT/wMkvlHxaDx/dpi4XBtxjLQV/FW2m5hPTrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xzTRrio0tnHmGJO9rD/JIMS/2W+FuQ8y6bZK3OQO3A=;
 b=LuVvhiNubGsxm6siXZqEdY9i42+mYDTlgDKtkXt2INKrVxvRpZ4aWeK4/hmGSS8kfbzFNsVCzlXgs0s1XIzseLFFhucBL0MG0Q5xfzDEpli0vONeNzqrZ2niyMwINOHYLZMlja/ialqkoysdVfQxCj6LiutYEfSVWfzwnXCUIv5xFS8a8Hzw1XM/iVr+nQlXraIQAhqUS4JzqR4Izj+0qt3Not6U8gyxahWSpUSGs8NeoZDTUEfu8BO0o3KuHTo99cF/knyfFkTol9VhEng2VyHyvr9cEDC2qyjAWJ7mnEoAmlQxEOmrtF9uWYfpTC/rE+UES4QafYyWNmRpGXqCzg==
Received: from CP2PR80MB3969.lamprd80.prod.outlook.com (2603:10d6:102:3d::17)
 by FR1PR80MB5896.lamprd80.prod.outlook.com (2603:10d6:201:a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Wed, 8 Jun
 2022 16:29:24 +0000
Received: from CP2PR80MB3969.lamprd80.prod.outlook.com
 ([fe80::fc59:c02f:9409:5a07]) by CP2PR80MB3969.lamprd80.prod.outlook.com
 ([fe80::fc59:c02f:9409:5a07%4]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 16:29:24 +0000
From: Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>
To: Paolo Bonzini <pbonzini@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH] configure: update list of preserved environment variables
Thread-Topic: [PATCH] configure: update list of preserved environment variables
Thread-Index: AQHYel97JS3O1Xr6TkyKGu4vtYiCS61FtROA
Date: Wed, 8 Jun 2022 16:29:24 +0000
Message-ID: <68cd68b9-7f25-1de0-7c53-6eec9ecbcd11@eldorado.org.br>
References: <20220607104908.1263321-1-pbonzini@redhat.com>
In-Reply-To: <20220607104908.1263321-1-pbonzini@redhat.com>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eldorado.org.br;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a2a0330c-9c5a-40eb-5516-08da496c0cae
x-ms-traffictypediagnostic: FR1PR80MB5896:EE_
x-microsoft-antispam-prvs: <FR1PR80MB589608C76DFBAC80F91E3849A1A49@FR1PR80MB5896.lamprd80.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s5ijd1IAFZ7C9/onkVqb5qD94NlK54MM7vW+eoAPv7T2VxVceuyrdnuJrGeYNIlEKmYRfJ3QO8mJSDkz7J2vt5Y/PQUZOQo/88hrkkFgghWvCi79M6klsUHlQ1hOhv1rYU0zOhFcYHn+3vWLawk+AKuEcokUPXC9NRrSfytTPodSnCSU16u3jEh4FB0Y6mKgWmUw7WgD/RZPojayP9QGFEpOaenKygcpyXgPYiVWl2v57uNM44UzhRyoTt/awq7eJ90cXyJ9kVBFxlqARNPtuAfMY8vKK/+UBl11f5fjWs/m0Zcbxdp/SclaF14lgQgyKxIpvyHZ6lIexsvJ4LOAM5Lni1aAjd9EhbDlGgKZAQA46wjsEVosghCfpi2kwZjUpWkGiAGVzTjO8/2kzn14CyEzP1w8/vQhODAuBzRB8J+pqPo7wJXiLMwQBBBf3o4F+JR9uJyeUwjbbe1NN019QlvpBGu8yGyx6dN00GRF18aXVZXEVdU6V270+SPPHSRV5oX8v8D1sgV/e3ndNBhWYHpgJDhiJuYBO5TfqvDKOyAwaGDcFaYUGvhcMf1BkOoC/pOQvoDM4ofKlRAjHWdFioRGgrsjUG/BS54dYZ63kGOCfsVA3qKl3QuK+X+TvM7Sf/Fqjl0GF8D7ZlaxxMK/qK4p/EHAn4KtAsoEQupb4nhO2ki5TBBm5C1K2+mhUayuRO1ycNuBx83si8NFDR/dpTcR4vPKGniq59kdfbEgQ7o8CwaGqF5Z1BG1Duzv7CVV4gCe4tJP1sscNvDCwgGn6u8aMEiWMm5rlEygAGT7hZEtY6sU9mE/lQwmnzDNBRsKAg8vGv2Q31U+MpjORDH9XTYWKkWA7h9b1cw0JE6Y3uOSvMliJj4wmVbhmDLiFKRRE/+xozbKRTFfzh7cansXEQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3969.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(316002)(8676002)(66446008)(38070700005)(71200400001)(122000001)(31696002)(2906002)(86362001)(5660300002)(66946007)(76116006)(110136005)(66556008)(6512007)(66476007)(26005)(8936002)(6486002)(186003)(508600001)(64756008)(53546011)(2616005)(38100700002)(83380400001)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0xKbVM3REZTbjlKandEcmxRREY0MGNTaUN2VXhsVVo2anZubWhXRjRLNnRR?=
 =?utf-8?B?YUNWVFZldmo3L3ZBMmo2T2ZqVWJ2TEZSUkJDWE5IVEE2Y3hYemp1VjVGVG5l?=
 =?utf-8?B?T2N5Ymp4b0k1anRvSGhGZWdBRWpmb3NvbDZmazNmYzdrRG5Gdm1GOFcvSk5G?=
 =?utf-8?B?bGMwbnN3cy9rbUJGVkU2L1pOTkk3emM5VytQMWNrYlpqVFlVTm5FRmFPV2h4?=
 =?utf-8?B?c3Y3eFViYzNzdUV4bmRETDhnMzFMRlJqOGNleHB0em56cURvWHlhSFJJa01G?=
 =?utf-8?B?ODJKZ1RHTkExcHAvbHI3LzRQTWpFaWRXa0dhMDdGZDdZTkhySzZXUGpTSXJq?=
 =?utf-8?B?WUFOU0ZuTGJnRjRuTnRUUldxRDA1dlhOR3VNVVdVNm0xanR4cHBZdjRpZHBF?=
 =?utf-8?B?NmRaMGlWL2JEQVV3WEQzbEYvc0hxblRaMUNRZHMwaEVDVVV4VkxHcjZtZlMz?=
 =?utf-8?B?L2JXTDlGSUUyRHVycGZqZkFTOXA5UDZBNmo3WmtIS0RRb1EybTMzcndtUGto?=
 =?utf-8?B?b2pudDJiUVV6Yit1eTM1ekVJRDdHcVBJR3R0ak41T1hhamU2WlkxYi9hcjM2?=
 =?utf-8?B?VTBCVXAzNFVBYWkzZnZKbXpHdXlKek1vSnJKeG5qNnVHMHB1blZEUzRjWFRo?=
 =?utf-8?B?VkxtY01qcU5BckgvOTlTOFBoRit2SUdCZEdVU1VZU0xkTTRkY0hXWVRaWHc2?=
 =?utf-8?B?ZVAvZDNLZ1IxeHh1aTJxdVVUYnFsWUZOUW81SnpxTFVFbSttSDNNMUNXUU5I?=
 =?utf-8?B?YnpRZVVlb0ZKdUMyeHJ0Z1BBNUVPb20vVkZwQldyU3o2ZndYcm1qdFdnUVlL?=
 =?utf-8?B?dTNaUTd0VzhNTFN3ajFFTEkwYU9yaXNzakdGYXhCVDlqVWV2WjRrY2VYU3JX?=
 =?utf-8?B?UHd4UjJrY1RjWWswN0NackdvdCthMi8zYStkME5PdzlBN2pwVnFtYUNEYm9Z?=
 =?utf-8?B?Vkw1cy9BZHhnQjJpSGdVd0g2RXFPNWh3MmkwbTJ1UFZKUm1aYlk5L2hEYW1B?=
 =?utf-8?B?dm1YenFPMk5sZmg2aW9nZDJiK3BkbHkwQlNrL2tvcWdPN1U3Yy9hQVliem51?=
 =?utf-8?B?eGRDZVBLZVBSdU5yV0FLYjZCOHVrT28zNHM2cS9FWVJPVGxQUWhrU0hCdWNo?=
 =?utf-8?B?a2RzQ25Da0VERGlCMGZvUjBneWxrYXBOSWVtQUxWNytvUU91d1MzK2w2Q21j?=
 =?utf-8?B?bVFrRjJ3U3g2K1cxUzRIU0dyd0orWU9ienRhSSt3NlVJaHNzcHZmRkFlMnlk?=
 =?utf-8?B?eWtwMEdyWC9ZS0VrVG5WaFhsQnhzN0NhQ3FyWlVqbzdmREZPM3ZyaEZVL3Bp?=
 =?utf-8?B?OVorM2lvRWRjZEd5NFFuZ3VzU3pobE53QzFOblFaS2RZVWxsOWp5RlR6Y1Ni?=
 =?utf-8?B?VDRYMGVJMjljSHNaUWd2Lzd6Ty9JWUQvK1drdkM4dnlmdGxINE56V3J5ODVJ?=
 =?utf-8?B?SXhaMkZnYWI1Z1YwT2RlNndCTnY0SlBERDcvR0pZOXFZNHFQa0FrMVJkWmpI?=
 =?utf-8?B?VVNrZTk4L2wvVjlxTVN5TXN1ZFl2NlJWYUNqZmJYR2k3aFRyM0lOR3NseTRm?=
 =?utf-8?B?bmhjTzR4R2doRGwxOEphSU5ncjJ5bDV4SndyMHFoWTRtN1RZQ3IxVmgrOWhr?=
 =?utf-8?B?S0doUldlYXdUUmt4a29kR05kbmRaSE5VaFFCRWJOSHE1Yjc5Z2o4b3dCUm5S?=
 =?utf-8?B?eU85bmJFV0ZUUGMvWUJudEpoM1h4b1JsMWNCTVJPRDQ2MkF3NDJ1bGdrdk9s?=
 =?utf-8?B?L1llOWFHa0phS0IrV05DdWs2OVp2Skk0OHhnR0NxTFBRcXIxMVdpZ09KNDlI?=
 =?utf-8?B?ZFBla203YzlUb25EUlltczBwSDl3bHZ3M1FyR0hLZXdjTHZVTmpCWlppODRX?=
 =?utf-8?B?Sml0NnN0V0ROalVOR3c4Q0kwWjRZbGlWeTRLcXdnSDRPZXJlRk9ZdGQwWUxj?=
 =?utf-8?B?QUpMM2V5UnFYRjk5VGpQRVBSdHlwN3pqTzZlZmE3NFYzWmw3N3ozS3Q5d2hX?=
 =?utf-8?B?T1BZYm5HZXNobzEvUk5IQ3pBaEE3Q1M1YzhmR3luL0V3dFhFMXF1d3FHb0hO?=
 =?utf-8?B?UWNwVmNYbHJmUEJoZXNPbmhkMWNJL0RBeHp1cXllSUU5UytzaFlBeTEwRUpS?=
 =?utf-8?B?Tm16SDRGdUNFODZWZVBOR05yV2tHY3dVTURFZXc3SThqMDdwVWppQVZGSEtZ?=
 =?utf-8?B?K0NjdGM3Tko4dnNvVGRPZzkrZmtvdDR2L1Yya1ptWXo2cUdyM0V4SCt1K1ha?=
 =?utf-8?B?NXlJZFAzZUloU2tvdU9TamZnaHI0SEl6MnVJVSswQk9GVHJVR0Y3UWp6VGRm?=
 =?utf-8?B?bTZuaXVtSUJHMWpGb3lreU0rZHV5ZHRrbUdUUlVza0xhckF0K1puUVhmbWJn?=
 =?utf-8?Q?CUjzbnXn30MBtLkHiHMAtPfPt/76K+8h0n7bN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C43BB25BD2D5C14596194FD04AACBA32@lamprd80.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3969.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a0330c-9c5a-40eb-5516-08da496c0cae
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2022 16:29:24.4237 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5vIBlaaDOGLvPyGLTKI7+ODBE4HueClnXyX3c2zfLphhwY9p5nWyoHyCui7FBFWbWVEcxI9Hofa3HOSRv9vrcFQ4D3aFHI+mc/l+XP0+S90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR1PR80MB5896
Received-SPF: pass client-ip=2a01:111:f400:7e8c::725;
 envelope-from=matheus.ferst@eldorado.org.br;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMDcvMDYvMjAyMiAwNzo0OSwgUGFvbG8gQm9uemluaSB3cm90ZToNCj4gSU5TVEFMTCBhbmQg
TElCVE9PTCBhcmUgbm90IHVzZWQgYW55bW9yZSwgYnV0IE9CSkNGTEFHUyBpcyBuZXcgYW5kDQo+
IHdhcyBub3QgbGlzdGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGFvbG8gQm9uemluaSA8cGJv
bnppbmlAcmVkaGF0LmNvbT4NCj4gLS0tDQo+ICAgY29uZmlndXJlIHwgMyArLS0NCj4gICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvY29uZmlndXJlIGIvY29uZmlndXJlDQo+IGluZGV4IGYzNTg0N2MzY2QuLmNlODE0MTk2
MjkgMTAwNzU1DQo+IC0tLSBhL2NvbmZpZ3VyZQ0KPiArKysgYi9jb25maWd1cmUNCj4gQEAgLTI3
MzcsMTMgKzI3MzcsMTIgQEAgcHJlc2VydmVfZW52IENDDQo+ICAgcHJlc2VydmVfZW52IENGTEFH
Uw0KPiAgIHByZXNlcnZlX2VudiBDWFgNCj4gICBwcmVzZXJ2ZV9lbnYgQ1hYRkxBR1MNCj4gLXBy
ZXNlcnZlX2VudiBJTlNUQUxMDQo+ICAgcHJlc2VydmVfZW52IExEDQo+ICAgcHJlc2VydmVfZW52
IExERkxBR1MNCj4gICBwcmVzZXJ2ZV9lbnYgTERfTElCUkFSWV9QQVRIDQo+IC1wcmVzZXJ2ZV9l
bnYgTElCVE9PTA0KPiAgIHByZXNlcnZlX2VudiBNQUtFDQo+ICAgcHJlc2VydmVfZW52IE5NDQo+
ICtwcmVzZXJ2ZV9lbnYgT0JKQ0ZMQUdTDQo+ICAgcHJlc2VydmVfZW52IE9CSkNPUFkNCj4gICBw
cmVzZXJ2ZV9lbnYgUEFUSA0KPiAgIHByZXNlcnZlX2VudiBQS0dfQ09ORklHDQo+IC0tDQo+IDIu
MzYuMQ0KPiANCj4gDQoNClJldmlld2VkLWJ5OiBNYXRoZXVzIEZlcnN0IDxtYXRoZXVzLmZlcnN0
QGVsZG9yYWRvLm9yZy5icj4NCg0KSSB3b25kZXIgaWYgdGhlcmUgYXJlIG1vcmUgdW51c2VkIHZh
cmlhYmxlcywgZS5nLiwgV0lORFJFUyBhbmQgDQpTREwyX0NPTkZJRyBoYXZlIHNvbWUgcmVmZXJl
bmNlcyBidXQgaXQgc2VlbXMgdGhhdCB0aGV5IGFyZSBvbmx5IHNhdmVkIA0KYW5kIG5ldmVyIHVz
ZWQuDQoNCi0tIA0KTWF0aGV1cyBLLiBGZXJzdA0KSW5zdGl0dXRvIGRlIFBlc3F1aXNhcyBFTERP
UkFETyA8aHR0cDovL3d3dy5lbGRvcmFkby5vcmcuYnIvPg0KQW5hbGlzdGEgZGUgU29mdHdhcmUN
CkF2aXNvIExlZ2FsIC0gRGlzY2xhaW1lciA8aHR0cHM6Ly93d3cuZWxkb3JhZG8ub3JnLmJyL2Rp
c2NsYWltZXIuaHRtbD4=

