Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F0943D344
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 22:53:46 +0200 (CEST)
Received: from localhost ([::1]:56674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfpvd-0006aM-1v
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 16:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfpln-0006KW-RH
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 16:43:35 -0400
Received: from mail-eopbgr790138.outbound.protection.outlook.com
 ([40.107.79.138]:41760 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfpll-0000QL-DJ
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 16:43:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+/q9UEcU4JjUtdTG2k8arPgz1jIDEiEILbVQBww3yf6IuJLxbz8GkdRhx5Gt57bnljEmOwfmUyLtIVZnVh83f8An2tvslAT9BrVwCJOOBHfh1s74AzlOUF+VhVTbLV6o0f4xzQJB2MCeD2buU7H9fbVhIUv5AItj9BCnByL0aVdbwA0DA00JNexm8en43EUExfxzTl3jZ+Ze5ngBO2y7paIUiPJ31LBzqiMGE8acFYDhIDcMUcM22w0z2kabHwmrEBqUJ2phX+TAKeV0gal7kcLUI9Fix0QM3jG27RuHvq52/tBiKQQfEpbiUFmPDiT7JsL72yfbNzQdTbOsBx9uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QVhz9z/5B+5/bbe5+gv3whcExt/x7K6fEdew7+AFsY=;
 b=lRaVSjdXHb5EZ7p9cY/13XNLZiXO5oE0MBa/4DuRMF4eZIEBjk0X+nymMjhe6VbtB2yecoiacNZ6B5aRZXPukVeufNh7kUB+1/StbcseLTncDT3arwZw050xGzstq3eTWKwyD30jkEVzK52jmdPY3lOyx38/dCqlWCQOOhYzHP+s1aM+gs1kVJ8wjzq6Z8AL42qtbfqftzhcweygY9oaVGjl/JEPvnCjLb9pld50Zr/hBHzvkss0iwckRVP/mvvsqzsz33XrDvYp3Hfh1rDr5Hdakz04+5bjghBufkwd0VWg95yqMY6YEXlwcsbaAfBNDvsQpnijdekvLww9+UIuZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QVhz9z/5B+5/bbe5+gv3whcExt/x7K6fEdew7+AFsY=;
 b=ezFTnrNqx0wKhSXhOsWYwzk121KlrizbTPitQWeuP0rCKHpu0COvN+orjn6zrTp9kpQ/p0ig87BXTlsoaIYI3x0DIMEz6B+3xKxDFwQgSuE1NgcLBi71z2lswBvQB3+UAj2VhOpIxhHtdC8IYGwIta+e12Nca7mUUYp01qDBZ4zjcI4Io8AW1O6byPZJ6dayg5MyvglW0oKuyFEU2p+d3Sq6NwOUeU5fQ+0SsGA+IB18VQvE62frp+VVnT29ICKheyF0WQlYTpKGe6cF9ffaWc8Is4AjbU5UFqVky2Zk+VQW5IIISfkbVjHce52S/oCSShR7Iu+bOowuVb1XL6o3yA==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB5538.lamprd80.prod.outlook.com (2603:10d6:102:10::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 20:43:30 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 20:43:30 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v4 49/51] tcg/optimize: Propagate sign info for setcond
Thread-Topic: [PATCH v4 49/51] tcg/optimize: Propagate sign info for setcond
Thread-Index: AQHXyr8ZcuT82ekka0Kg5/oLny1OKqvnUQaw
Date: Wed, 27 Oct 2021 20:43:30 +0000
Message-ID: <CPXPR80MB5224AA11AFC89F562ADEBDB0DA859@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
 <20211026230943.1225890-50-richard.henderson@linaro.org>
In-Reply-To: <20211026230943.1225890-50-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 570ef86c-e60d-40d4-8e11-08d9998a6fc1
x-ms-traffictypediagnostic: CP2PR80MB5538:
x-microsoft-antispam-prvs: <CP2PR80MB5538DB704099DE9948DD8C32DA859@CP2PR80MB5538.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 04qOJHFMM6jin/jrY9ow767L2LUv6tV6TXQUj5WNp3IqsI9JrN0pI4Mx4H7FM3V7iUmtdkChnY2uek8giwvRsN7alHn17Xm0dpxF2TyForbUpcFhnq/91TngnYG1ooEfFSY6ZrYcN078rOVDzne0imldN4BoiNo4iQeKq0KMRqpqqZDvJwvkTSbeFxdbsYt3ZuL+3n885lbM3c7A+pR+Cx7Xm5YcWsidI/l6FniqUnQl89zIU/jH3a0YXAwpDlpsXGL8RtxQAbkyLmSDOGlqF0gJrJF7jATPixgwBqGhlb+OqH+ZuJBI218i2zkHjXxuJBlrUKcNtSkO5WtEzbId43/ZEH5htV75mQc+NWAX3EdnRCAPHCDSImVTrGJzTBdXsiLbMFbM+7ZJXtUTWyR+EDJqEbhAL533x6IQHjpnOaeW+xDRWW9eMxSLYHZMWvIhvvJtg3twca8nFrWyLmmm1Ox6MVX5kkW2A6/O1OjB6ZF/SjLCsbpyH+b4m5vr/W4UWxQ0TIWnfoflbcfTsRsEaDDDmQaR3sH8cOFW5dAbDkaCK60yY9xCbZWwjy3t7k7qAIt441FbXnuVcpWW64TBWI0VX57tnUzNODecp73Kt5qt0NKP93tq+6NHtIYnfiwSNA+LaBO0LY5daJZLMk5mroTxbdCi0rHOiwTKKL5VBHQbIvcacCOAlC9213LlMGLQHL2VCjchqpTRIPQnFsg2NyYgjxv8NdWVJqx7jA5x0KZoICGUn3u0xcQZrPvCUDcYRpUN9spPdLDS9PVZTj3wIARLcX8gC2pn22eKbqg2JBM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(55016002)(7696005)(6506007)(8676002)(54906003)(9686003)(5660300002)(8936002)(316002)(26005)(110136005)(4744005)(71200400001)(186003)(4326008)(2906002)(76116006)(66946007)(66476007)(66556008)(64756008)(66446008)(52536014)(508600001)(38070700005)(38100700002)(122000001)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0tHeEtiMVZxcnd5MkhPa3FqNk8zaHBQRVZLOFNuZzBQRHF1U0lOdDlQdE9S?=
 =?utf-8?B?dFA0eTBYb0I5Mnd1SnNTekR1SDBhOEI0UkNsS05ZNnNCZ1ZKVlFGakpQQzRG?=
 =?utf-8?B?YjRpRGlIckZxaW91Yy92ZEFOODRONzRreklEeWVHNkE1YldZcm5xRkQ0ODV1?=
 =?utf-8?B?LzlleVdhUG5JZ1Yvc2cvdnhMb3YzVy94UkpVMTlpWnUyZVVKTmxtcjJ1aWda?=
 =?utf-8?B?SEp2bWVhUFkwRFRoLzdkeW00U2lMNWpndTVRTkpQUjloeUd4cmswdWhjSnJL?=
 =?utf-8?B?dERFbU0rQ2dzY1V3S0hzYW80WkFJeDBWM0thN005QW5hdVhQMi9kQkxEMklQ?=
 =?utf-8?B?RjhVZnAybzNlazQ3cEJZcUdxV1NkQzdhQ251RFlXWHVOcDBmVURnN0JURzA4?=
 =?utf-8?B?b0F2OTE2eDJYKzh6V1NQYm1WdzJlbkhERVlMZkQveG94UFYxNGVBZmlyVElu?=
 =?utf-8?B?YzAyVEc0Z3NqS1Y1L0RpZTluZ1h0MzZ6Y3pCdVlvNVYzanpETlM3Zi9vY0pE?=
 =?utf-8?B?a0czTlRxWTNLZXFPTHRpTXI3WFdXZjZ5Q3dZT3hCSWJnVjM2elFxbEFVYVJY?=
 =?utf-8?B?NmlBVm40cXVxWXp5ZU9TTDV0dGJUaGF1TkJxb08vdXN5Y0h0K0duU3M3Z05v?=
 =?utf-8?B?U2ZTcFdvdis4NjNFazhEK3Noc1p4RDlOWFc1RGR2RUl6ZXhJUFhtNFZQWU0y?=
 =?utf-8?B?UlU0Tmw2bGVteDc1NmxlTkdBVVVGY3RvRTJaWExDS01BTHNhTHF3Tm9wYk9Z?=
 =?utf-8?B?Qkl1a04zWmtFVUxEaVhuN1hzWWZFZ2tzc3daZHh1cStuMjJkaU5aMllKZ2tz?=
 =?utf-8?B?b2NLNzkvOFBhVkZ3bXl1bm9ZNDBwTnVOWUw4b0VzTE94TFhYZStYb0hoSCtT?=
 =?utf-8?B?dlFUaEIyczVwUThkSGNoaVcyNGIxUmhMV0JIRm00N2NDL0dmT0JmTUNVaGx2?=
 =?utf-8?B?Zy9VZGVKd0JVaWFnTjJFSXRlczAxVWRPcFl4cE1vZ3RMd0tFdzBHQ21RMy9C?=
 =?utf-8?B?aU44bXNSSFZZOWpCY0l5eHY2Sm5obk9ZbUNMLzQ5Wjd3WnFRNVc2UHo1T05Q?=
 =?utf-8?B?ZjNWcXRxa0RxUnpNMG8vcmdBK2ZDRmVxQy8vbWZEdHJIdnhqY0hyQUkySTlK?=
 =?utf-8?B?Ri91L2lQMWh0Mm1oTHBnS05Ob081WXdPSEJyeW5BelprQ2pGUm5pVHNHRVQ0?=
 =?utf-8?B?YW9YMUQ0dDR6V1N3ek52OUszcXhKSERpYjBDOTdmbXRUOTM1cnFZczhyN3Bo?=
 =?utf-8?B?OVhGM1NBOXgyMmRMUHFiaVVsZTFNdkJtSkUvQjNMakRhamdGZjl1cWhqMERL?=
 =?utf-8?B?K1RLdnVBTmNiUDg3ckh3ZmdDTXVZL0IwSGNwMXhUN3FZcE84ejB2Z0V3SmF0?=
 =?utf-8?B?Qlp1Mmd6WmFKRHNKcURlc2lKcUtXVjRiYlZWLzl2R3dvL0lCbnI2c21WNzMz?=
 =?utf-8?B?cXJmYkVtVklSQVRYcXhRMWhBSGVNMHFaVS9BTUxCVFhCcWN0L21uTHMxSkQy?=
 =?utf-8?B?dzYySzR6Rm10NmViWHBuOWZERHd6em9NNVdOMGxPZCtsTWRTQ1psZlJWYU1K?=
 =?utf-8?B?SHVPNG9vU1dWSW42NHQ1UHprS0IwVGI0bFhIZ3ZQU2NLNTRaRHZpVE9IUVRJ?=
 =?utf-8?B?UlFYOFR2VXNnREdwYVRmcmxPVGFYUE1tZW1vOWZPK2ZFeWh0bHFYWHNvZ2pN?=
 =?utf-8?B?VXFvQUJITThaamhacWJOSlNkOEx2YlBkTklxQ1NOUURMOURyd3RFTldjZEp0?=
 =?utf-8?B?NHlrRVVMN1huUFY5dmhtVFlQdFhEMnJJcEdWTnN0c1JFRmdXTzl5ZTE4M3Mx?=
 =?utf-8?B?VEhFSXVIRjZXeHhQb05RaExLYkloTjhtRHdhRjEvQWh4Y3dlVFFtK0hOVVFF?=
 =?utf-8?B?ZVd6dEM1eDRjc0RJQks0QytCdmVNUkZqOS9oY012eUx1SkFJNDlpSXZULzN2?=
 =?utf-8?B?bGFqRFR6czZ0YS9tM0N6cU5PVkRsT1B4bHUyNDBpWkQ1NGpRUEtISnRydTAy?=
 =?utf-8?B?N2YvWGRDQUY2cVN5UlNjS2tOejVRMURELzROZUsxaUZhS242bTVTeEVQNlp3?=
 =?utf-8?B?K2ZVTFZHQ21idGM4ajRtd1lpZEtTaGRKWEUyUEVjRHN1TUM2V2djWkFWZXNq?=
 =?utf-8?B?dFgyMTZTM29sTnFlTDNaOVNOejJ5MnZLeVoraFN5cEg2ZStBbVBVd1l5Rklx?=
 =?utf-8?Q?0YIkBaNs43U3b978tvicxRA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 570ef86c-e60d-40d4-8e11-08d9998a6fc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 20:43:30.7039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LT9YS7i7EBkLeU65YWtc4+GbfLhTUKyQoQ50tZ6UaHbFVrTMr5igyD3/nIr2UaJ7zILCUdPGU0Nfe+D3YicXTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB5538
Received-SPF: pass client-ip=40.107.79.138;
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
IFRoZSByZXN1bHQgaXMgZWl0aGVyIDAgb3IgMSwgd2hpY2ggbWVhbnMgdGhhdCB3ZSBoYXZlIGEg
MiBiaXQgc2lnbmVkIHJlc3VsdCwgYW5kDQo+IHRodXMgNjIgYml0cyBvZiBzaWduLg0KPiBGb3Ig
Y2xhcml0eSwgdXNlIHRoZSBzbWFza19mcm9tX3ptYXNrIGZ1bmN0aW9uLg0KPiANCj4gUmV2aWV3
ZWQtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4NCj4gU2lnbmVkLW9m
Zi1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
IC0tLQ0KPiAgdGNnL29wdGltaXplLmMgfCAyICsrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspDQoNClJldmlld2VkLWJ5OiBMdWlzIFBpcmVzIDxsdWlzLnBpcmVzQGVsZG9yYWRv
Lm9yZy5icj4NCg0KLS0NCkx1aXMgUGlyZXMNCkluc3RpdHV0byBkZSBQZXNxdWlzYXMgRUxET1JB
RE8NCkF2aXNvIExlZ2FsIC0gRGlzY2xhaW1lciA8aHR0cHM6Ly93d3cuZWxkb3JhZG8ub3JnLmJy
L2Rpc2NsYWltZXIuaHRtbD4NCg==

