Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C477643D330
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 22:51:45 +0200 (CEST)
Received: from localhost ([::1]:53608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfptg-0004Na-Sm
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 16:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfpm3-0006vQ-LR
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 16:43:51 -0400
Received: from mail-eopbgr790112.outbound.protection.outlook.com
 ([40.107.79.112]:10597 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfpm1-0000Ra-5p
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 16:43:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QV5nk3/8jDP/gGoCa5c5d7mMYWmlh/wryXpfznUcDmYJ1UVR7nRMjfL4KgiClgyL+wbAr0UMzZojfb92Qi7elfZdpEnLxpZYy6CtEjiC04WsBYLeel3fDbXGkpWgxkTRptshkx6Ykp/XBNu9pA5NTM+O2afsE7HZaL/ITzSI/+Gu84fPgAhDO/k6hmd2oKIas2QwDZQ+Row6GRwAoDf2EQ/C38GEiJMxfQwZNfHnDe6BJGU07Xob+1ksGoEWVVteKM4j5z2L9FdbdcZPFhmVm7XDrropdNuQiEdLcouX9vEnfXT3Zsl7eYLsBvkqzVidP+HRy5msa6BOxKS837T3BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0E6+eZ3Gjp4S1jvyGLewSn6/x2SrOZOGFZFxDD0skF0=;
 b=FdrraQYUhvSf4BOtKJFqlynZmqqoUl9hUO5/ANx8jFI/pmld5cNyL4w2tC1PoRg70XwuFKq6ZPQw1EaJJCAQ8ey1CnZPzWlw1ji/psZb5gBZel4LKGtW3d5hTIBt8jHMZP10voXpzMDZuVNoDQqDWZQcn7CH5YLhnLqihA6oGdTiY5/XryV90NfsYMR1QGyX3n/bm7PCLLv2YHCyrgAA2ZmzELluzl+GApKvG+ynCfDsedO2HtDXhp4MbMeis3Z6mgri4+qBZ6761hvi3EygvxMWKDWFH1X/YxwM4lmndRiGzuDRp0K6y3zHxWz+az3FJzLjmAKv0oBk3kDpKCP3Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0E6+eZ3Gjp4S1jvyGLewSn6/x2SrOZOGFZFxDD0skF0=;
 b=D9Hu1JgIRQICBkioLuN+8GtVxqxjtmletQU25nTEwNXIOsYQnTs0hYFr0TBFat22zFgi7maA7nAjDdec3+YwQlT1tHbhS4RyxQLYL1ck0/fYfCL7F8xdnJS6jxNV/pYIE4D35ynWCThFE2pVT6C6PGQcCGX9FJyy9JAshNSvVrEfP7adOYzWJ5hHZdiqC7q53L5d+9y2lBU/AaiKkZ7WlvljQ+WqsG4ipFFqY16rfY/k3b+kgeAxXhuchwMqyduA3wGLIecSEith8ur9KQbf9gWnGOQTIZd5JHvAud8RosPFOXGrG3Erheo/++dynt875cfkuASR2gbvdoGT8Hz76Q==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB5538.lamprd80.prod.outlook.com (2603:10d6:102:10::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 20:43:46 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 20:43:46 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v4 50/51] tcg/optimize: Propagate sign info for bit
 counting
Thread-Topic: [PATCH v4 50/51] tcg/optimize: Propagate sign info for bit
 counting
Thread-Index: AQHXyr8arvRbaox9KUa4meuYDxC07avnUR+A
Date: Wed, 27 Oct 2021 20:43:46 +0000
Message-ID: <CPXPR80MB52247CF46B9063383E0720E2DA859@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
 <20211026230943.1225890-51-richard.henderson@linaro.org>
In-Reply-To: <20211026230943.1225890-51-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5aebaf3d-2784-4005-c421-08d9998a791f
x-ms-traffictypediagnostic: CP2PR80MB5538:
x-microsoft-antispam-prvs: <CP2PR80MB5538968FC962136C62EA60EEDA859@CP2PR80MB5538.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bjW+ezcfuOdsf8VwRXtZlZiMzaWhvHzRVrhfaSZlGINXoUh3NfCMHtYlqfBYYK34+nHinxIaDpHgOYL07EK5BcSmnqjKvwOPdsQhL42IlIu8CU4tokzMUqwVdzuAp+MrBEGiQawRyxACXEPV9sSYsTJMxgUScYgk3P3zX5uP8SYETIjz3xZd6Ev7rRXQupTb3f2tF45G1OAM3FWIu8PDX2dGQam1dx9+lKGnbnKO4jrABGn+iZ+zJxLxwnxwUBU8aCG/GqQ2sAs0gmZxCRd96Qp8tMwoR6+AvalUKGostYjmSoaWv6LZkkiE9Bn3+C3RmH/KLO50zsgJcJiKAG7DSRLL3nEIWQ1WnhgJICdwHP7oCUk+livhMjNG9mg259mz94wlqXhl8D3gw3ozcDNAj8uuETPdmLYTUjz8ENDQgoxF/7vSfpI96VfXthizhsK2LM6B5X1W2BnbdUVWuroL2d1BgiGVw/v2+sv9kXNjgQQib8VgbYKn9qgQ3I6AqKYlS0YLy3LG2vyAQVO128scSSa3kw603/Im6xGDQA3PTkbeCnKgcW8IRvE4uVOTJpYtM/JZToEVsBdLsyHvVwl1uGCORvP0dg14G6uLvGUuW+l+TUwUZILunLELZiZNNG4v5OvSyqvJhOk6oP4sbeNwLUkYEHDhmrKKT6T4bVtmT2bjmVQssvtJc76ktk0nOothXCTdNytj+iRIr/zuMZW4ksCp/TKrK9znt/wuoFlsqzY1feehRU+upXuoVzIVeT2ICbAKwfYG97JG5E32unsRSX5wLIv2cVWKeCbVBOXuJdc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(55016002)(7696005)(6506007)(8676002)(54906003)(9686003)(5660300002)(8936002)(316002)(26005)(110136005)(4744005)(71200400001)(186003)(4326008)(83380400001)(2906002)(76116006)(66946007)(66476007)(66556008)(64756008)(66446008)(52536014)(508600001)(38070700005)(66574015)(38100700002)(122000001)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUFTNmowV0JXVVBscTdoU2RaWXArWWNKM1BvMWdoWWVKdHE5QmM0UGE0dlFO?=
 =?utf-8?B?YTlLRVIxekk3R09jc0dWdWtqVWNmVDR3dFM1VVYwY0g5UDZVL01sSk1FeU16?=
 =?utf-8?B?YTh2ck5zaTNLVFlScXJjSVJzd1FsYzAwdnpHcjA3blViT1ptVE5tRVFGS0Fa?=
 =?utf-8?B?Lys5TDVnOXpLcVcxZWU4eEd3QXBUTml2ZTJMaEo0empMcGRMeThnc29RMWEy?=
 =?utf-8?B?Rzdxbkt4SkpyR1I5TUY0NWljT1p0V29vMDFJRkhST2Z2M1MwQm8ybXF6aUVs?=
 =?utf-8?B?VU9ScUVRMldhKzBnN3U2U296ZVFzYjVjSXgzYkNSVW8zcndUVkRBNi93Szdm?=
 =?utf-8?B?M3VGcFRKQjZDZm1FdmhJTEtvMHNSRGNXOElnOEUxVG9Cb3dIVlA2NzFWdmJk?=
 =?utf-8?B?S2JPVlV5bzhqeGp5MTdjeE5ZNUdkc1BUMHBTRjhDMG82Q0VCVVZPclJKaUdH?=
 =?utf-8?B?Rm81cnBuNWV3a3o4djE2WFNINVdURWRjUW9KbFdvNnp2SmtNc1c5aDgxd0ts?=
 =?utf-8?B?Z0hFWElyblZZaHA5b2Eza29GV21Xb000WU9HYi85eVQ5c0syQTQvZjgvdmtr?=
 =?utf-8?B?cnI5MlN0aXc5M05XK2ZVY0YyVERTd0ZubUhJNGxGV3lXTHAvdEs2dVNSQXFk?=
 =?utf-8?B?VDdYbjJhTk43eVV3bmxYOHhmc09lc0lpQ01NK3Flc29rOGlkc0NXR2g4WXlh?=
 =?utf-8?B?a1hoTUJENlJBeXQ3cUcrb09mZFFmZUJ2R3ltZVN5US9YeVdoNzM2NCtJUWVV?=
 =?utf-8?B?S3RhMWhlbTB0NUNlK29ZMFpibWJtOWZSUTB1QmxNVnBxemxlSHBqU0lRMWhs?=
 =?utf-8?B?THZ6RlVHZDlKRlpYbUk1WHB2WmJyTytsV0h4ZVM1VnEyVnN2dER0Rjd1b3ZB?=
 =?utf-8?B?REF2OUZST3pnb0VRVTJkWldCWWRJemNCRVNJWUhrK0NNWXd0TUttQmhiM1dT?=
 =?utf-8?B?QjgyUHJFTk1TdjdWc1BNKzZLajNWczJwakNQUk9lR3BQZGs3MEFZaUN1TjRs?=
 =?utf-8?B?US8zTVhQOU5KVkJ6bmR6bjJYVHVZd2Zhd0RCZDY2Wi9oWVJ3NnN0YWpEUlB2?=
 =?utf-8?B?U0lKSFZqU0gzME9xdjN2SWdHYjY5UEpaWTI1RHJwaE96WmgxV0JaV0k0OUN0?=
 =?utf-8?B?aUl1V3NXdjkyaUN0RzBtdkJGOFI0MXBPN3p6bFF6a1hFTmZ0S2dLdVEzZlQz?=
 =?utf-8?B?WFFTVXdzeUk0WGR0ZXJ2Y0FrN3JsMXZBREtnRktBNjJtMlhWQTBoeDZ4OGpI?=
 =?utf-8?B?UHdJaEtERElJSUZOQjloU055R2JlMDM2Q1pyeDIzenFOU2drRWZ5TU9JOVBQ?=
 =?utf-8?B?aU4zc2tvMTVZdWh4UWgwOGpodk55Tk1BcU9zVVA2Z2hkWitHNThSakNMcWZC?=
 =?utf-8?B?c2ZQYlpsSHpqd3JsRXFWampSdUJKa2xVMWZqWHBUalJvUkI2OHhBNVNNTC9H?=
 =?utf-8?B?WHJRZzArQmNsZHA5OFdYMGdYdHRNTmlDNEpjYW56U3h4TzhQckhVbW5FUllL?=
 =?utf-8?B?SVVaVVV0bTVTTXlpM1pqTGlSSzg0dDhsV3NoN1FOVCtDTURpaktmRzVjK0pw?=
 =?utf-8?B?ZFgrMDE0M3BZS2xTT3RXV1V4N2c1bGtrNzkvSk1ycHA3dEhkVXM0TzUveGlu?=
 =?utf-8?B?Z2FkSFJFaDdvaXJOUFpXbFRhMk10YXVDOU4vNmthQldiUS9zTW9NRlYvUDVT?=
 =?utf-8?B?aE5XU3lzNGl1SVhrQ0xMV0NieHVKNHBxZjdzUHJoSE85SS9ZK1IybHZxRDJw?=
 =?utf-8?B?Zitaak4xdEZ0ZUVYUXVvQmt5TlRjdWlkTk81eUJndUE3eWhuQ0VUM0V4cS9x?=
 =?utf-8?B?QmlpUzRNRVVZVjZ3VVhsaTRCNVUxa0dXUWhyTlpNdHROSitieVNzd3JZZUEz?=
 =?utf-8?B?L25CN2RoNVZFZHV5RnM2MmhxTUdnTjBqZWc2QzJBYzdnaXVOU2ZtS0VHYitU?=
 =?utf-8?B?TlAxOWpuRVQrNVFiZnM2ajlwVDZRSUg4S2JzSmlLdTNKbmg4VXk3UCtnUzh0?=
 =?utf-8?B?ZFBCRXRnbTRnZUlLckplYWVBWGFvRHhNTzlFdTNYeVk4b2lOMll3TkNWbURR?=
 =?utf-8?B?VWhCdEQrekd0blNkWHc3S2lEU3hRQU55bUhwY0JEUlhaWktKQVVSSHozU0Yy?=
 =?utf-8?B?Vmw0TzBZYS9VK3JWQXllVDEzK1NpalRUdFVCVzRUMC9hMVVRMzV3ZnRJSEFI?=
 =?utf-8?Q?ouAA/cqwYy5TeFPH5kvzT1o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aebaf3d-2784-4005-c421-08d9998a791f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 20:43:46.4758 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fOYepLI6ytbrx01pjN9jeb1lIDl+xX7RQm6KuXjjOowyHYKSEAExa1GIrE8M93CReZ/JhMoNWW7ScSZXm0voRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB5538
Received-SPF: pass client-ip=40.107.79.112;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
IFRoZSByZXN1bHRzIGFyZSBnZW5lcmFsbHkgNiBiaXQgdW5zaWduZWQgdmFsdWVzLCB0aG91Z2gg
dGhlIGNvdW50IGxlYWRpbmcgYW5kDQo+IHRyYWlsaW5nIGJpdHMgbWF5IHByb2R1Y2UgYW55IHZh
bHVlIGZvciBhIHplcm8gaW5wdXQuDQo+IA0KPiBSZXZpZXdlZC1ieTogQWxleCBCZW5uw6llIDxh
bGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIEhlbmRlcnNv
biA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4NCj4gLS0tDQo+ICB0Y2cvb3B0aW1pemUu
YyB8IDMgKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQoNClJldmlld2VkLWJ5OiBMdWlzIFBpcmVzIDxsdWlzLnBpcmVzQGVsZG9yYWRvLm9yZy5i
cj4NCg0KLS0NCkx1aXMgUGlyZXMNCkluc3RpdHV0byBkZSBQZXNxdWlzYXMgRUxET1JBRE8NCkF2
aXNvIExlZ2FsIC0gRGlzY2xhaW1lciA8aHR0cHM6Ly93d3cuZWxkb3JhZG8ub3JnLmJyL2Rpc2Ns
YWltZXIuaHRtbD4NCg==

