Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C3C3A18E7
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:14:37 +0200 (CEST)
Received: from localhost ([::1]:45496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzue-0004vx-BY
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzf2-00069D-0G
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:58:29 -0400
Received: from mail-eopbgr800120.outbound.protection.outlook.com
 ([40.107.80.120]:28138 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzex-0004z9-87
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:58:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBr2nOtBdtMuevyA8cJmaH2qLjClZdJ4gJJDDn8i3qwhvXsRhDV7+JLtmLXdwoMX1miKJ8PPLm0Hhx7OXit9sJGVur0BhG6PO9pLsjR29z70h2y2MwPB2cX9Ajtns4cyLEfByaudGOjMnVBPiChFrsRcx3dJJwu/rtx/V6GMlrKwtCUsMarXhgeEwph7Xi6x9WY8baEhaipvZmKXRfICuL1WR3QkDi5g/bPuJxHAwTXUHwPCWIU6GLqVi60wdar0PHqGYL3Xj0Iv4hy2X2HcIDwbpnNlbfYa7B/zOt5v/XwCML7C4AEt8bL/zk61R7hhLWqTh20KR0T9iD+i69pGxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pP4wrnRjzZO6FCIP7rRBzHwzqiX1nn83TtN7iieYnd0=;
 b=G+nd+7jSSWOl1BI+xdRGLKlJdv25jT41ZPW3dvA9ZGcSOLGFxy9KCMnDl9uNxohSMozTUHrWwEEcHwf3lP53OKE1qIw5BOx9xx3xZi0mRBRo8KBuzJ8bQTTi0mrHHc5z/Gz3T+mAC6aEgCYlKGZfuXc4TtQ3vm5H33NLOghNPKVvbq1IfyUpN4kocDmYrCjWGtUJP2fNFSJVUhFJ4dnQH+tiKoyfHrYRVZcao4d5HNO0ugSAxUWqVDF0EwsWbgK8uZ1UgWp8VudkseG3WKH9Kq2Ysk0/8hX5jvg3/VvXVBpRy0VV8eaNraVuIOYGTWvhJS5TyUykRG6K6G5GR2V5Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pP4wrnRjzZO6FCIP7rRBzHwzqiX1nn83TtN7iieYnd0=;
 b=j76XesInU/3c9fDkKEr278ZKWJDKPQHGbcfAZbZ2N8ZQBlEcRFmIY/eBwXuPg8ZjCpmFGBGVX7cpaSPi2jDxwZBXeqC4vHvK+g+l8+LqTmyt/+P2/UCPCWSjRVDe3aRwz2cD7zHWMJuLjorVurinc8xqnOqIY1fxHVzTyd8j+lD1j6jauNIntdPwEVYStEeaAIWd4dJg9Vw3LxkhojU7uD0Aa07MtGVXl4YoYofCCj9Fa7p56TkBSGRSN6JoqytvVmRH4pD45S+sO+6SrZ8cLfwZ/RSGC6/hhyEnGXxbD+CpFVdobv89/oCwaHLJ0qZblDh6Cp5G7O4A4dJeVc+S4w==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB0017.lamprd80.prod.outlook.com (2603:10d6:102:1d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 14:58:20 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 14:58:20 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 14/28] tcg: Introduce tcg_max_ctxs
Thread-Topic: [PATCH v3 14/28] tcg: Introduce tcg_max_ctxs
Thread-Index: AQHXP6qmS8BwYVgj30+JgfbY98WhsqsL+/gw
Date: Wed, 9 Jun 2021 14:58:19 +0000
Message-ID: <CP2PR80MB366854E6C208C1C1240A92B1DA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-15-richard.henderson@linaro.org>
In-Reply-To: <20210502231844.1977630-15-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.102.146.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1162f4a9-ed48-413c-3ee9-08d92b570546
x-ms-traffictypediagnostic: CP2PR80MB0017:
x-microsoft-antispam-prvs: <CP2PR80MB0017F8CBA436689FF4B39592DA369@CP2PR80MB0017.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sknYqSfvVl/YqvDKIViyQRIoXtoEVbPZkUFvi2sbkdXMqPZ7h7mKcTFLBr5sOlBxfhH2nblpeexImCy7YrvjaK4xKDwZ6yx+LRNpH+G+2fbhi9lOdo5MLNA7B0c8c2euCkZACe5Q0hZENP386zWKw9fmS0vHjk8S6qNF5oX0EuXwInO6zX7RQHrP218E976bBEvDeVDVrMDq0HmW0R49yrfW6HXG6MG+8Miy0Ghs1nPn4GjkjI3GoVve6HqIWYcFWu8LlSK6wP6rxG44lQPEKIVYRZT6BqVSIDOIT+f0ntO1CgwvAcrCjqiYw8vs/1R7dJ8B13eSGF+gZ4LdJvh28Qzgvm9PmxZqjLkRPUdLeuPRoscvpM1F5IsVAhSf5pZffZCqw0LpbO1XA2grJHRz0YrWsD3dkFQoPmVJaJf04Nq+Tpx5tu91AX3nbiyMCxqtLFyuYcQ3K2lnqsf39jerPwu5gYhz1lX1bRk+TwaatEqbDz3d6MdavrCPy4utJuqF0WJZEEbSjfw6VfLW2MKCEYcOiH/4/i2dSljjnWWtn63q67ak2W/HyWXyruI3D7XUT3+/4g3YVFISk37P/UbRkqknBbucOhjBoXDnf0gNHeduhYqVOg6X4b12LkMlNh0axqsZj4/ihkyZgdbVu7pKPsRxje7QCpxjUp6AsN6ODdZoO/n8qQFhpIWpGKyldKyS0UNHLbZju+W3Co6I5uBqOtb6vVIqMLU1lveYhcj580Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(396003)(346002)(136003)(376002)(366004)(122000001)(86362001)(2906002)(26005)(8936002)(55016002)(4744005)(5660300002)(7696005)(33656002)(83380400001)(316002)(186003)(66946007)(66446008)(8676002)(110136005)(64756008)(66556008)(76116006)(66476007)(478600001)(52536014)(4326008)(71200400001)(9686003)(6506007)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?RzgzUTVyczVLMFF6ODQ0L0pXS0lNL3pQdFplWDlndFExVE5tWEdzYk1FWHBz?=
 =?utf-8?B?Y1VNS2hySWtDTm1SUTZlTWJNeTY0dWw1MVZsUnJpWnFkNEtpRFJYZHVjWklm?=
 =?utf-8?B?eFNDMHQ0ZVZ1UnNhcEgrV2NLaHVIOHpUTXVWYnlscTIrSjFpMVJxdFVPdlZp?=
 =?utf-8?B?QUhuMWJqM3NXRTBjdWFMdU5neFF5UzlaYXg4aUFtLzlmYzZCaUpkY3N4cXFV?=
 =?utf-8?B?QTc1bnVQVEwyVDJIZU9TNm01N0IreTNoL29yTVZ1ejBnWTY1WUViUytzZHFz?=
 =?utf-8?B?LzhZZG9XbjRaMU1lZEFiSDZHeXhpMDhGd3phVnNhYnN0V1dpZ1ovYnZsbEMx?=
 =?utf-8?B?eTIyeDVUdkFBT2lIc21UY2JNNXFOQU5CRXdYUDRMOUJObzcwVHRMOWdXR2lN?=
 =?utf-8?B?U0M0eHdKbDljdVltanV5RTN3ZlJnaThnd0NRc2xOVVRrUWdRMzdPRW5sUUxT?=
 =?utf-8?B?dEJuclJ0OU1Ec1lzR3pUcHpkRUM2WllrSVFjZlNnYmZWUENyUDdXN3l5QlI5?=
 =?utf-8?B?UnFaQUpzY2ZWY0dpTkVSaU1SQnJoYlp0d3AzY0JyUTlvVEhnSjVQT0lVUERX?=
 =?utf-8?B?bTFqT01vQlVtQm00NlZBSWU5Vlc4VXdlYjcyc0J6L0Q2bDVmOGxScFA2czRT?=
 =?utf-8?B?aXcwSm0xVHJhY2tLNjNRbitNcUJzaHdPY2E2bi9McHlGZjI4RytEYXFjcDBt?=
 =?utf-8?B?VXViMUFCUnJHSkxsVXFnWGxNR2JsL3FENEhNdjVGdGc0U0VwRGN6YVZhRk5h?=
 =?utf-8?B?bWpXY1BjRnYzaURPVzJBd1FEc0lXMSt0cmxvbzdhWDFCcCtnbk1raDlZOXFj?=
 =?utf-8?B?czRjREdOd3pzY2k3N1FVSGM5T1pCR1pYa0kwSnRIS3VBOFd4aVRBbmJnZ09v?=
 =?utf-8?B?aWU3MFVac2RnQUdmUVFORVAwd2prbDQrNkpOSDU5cGIwd1ZGWmdLR2loZjBx?=
 =?utf-8?B?Z1BtS3ZrOGRHTmx1NmpoUWdCTmVVcU1jQTRmeGlMWHBFWW5rYkFOY0NROWZE?=
 =?utf-8?B?dEpxQm1pMkhHTUNJVXd2bDRZK2czR014Y2EvVDd1ZVpHUWpCS3l4bXlDa1hO?=
 =?utf-8?B?bERiRkhNUnJXSktTNkRjY1M1amJCdmRMdmNPTUt4d0l0MWVFQW5VS013NjQ4?=
 =?utf-8?B?LzNkcHVaZXNIWjFYNE1Nd3B3Q2xRd0hxYjJ1amhaamsxSlhZbTZMOFowVVJZ?=
 =?utf-8?B?YlBuajU1MlFlSVJpanphblhKQmZpeFBlZ1piRmFUSWxKWlNqVG1kRlZBUnN3?=
 =?utf-8?B?YlU2WVNFU3h4TXZsYytOL1ZMS0NKL2tkbHdIbkZ1R1RKS3lTbEpJUisyc2NE?=
 =?utf-8?B?YS9LSHhoS05DUGFxVWt2NHNLb2lCNE1sbVRzM25YYkRaQUcxcGUwbVI0cmo5?=
 =?utf-8?B?em9GSi9pU2tUOGVzMlQrdTA4NU5hS2JaVTUvV08xeGNwNEtza3pIaUdaaVI3?=
 =?utf-8?B?WDd6enppVm1obWFIVS9MMTcwd1hJSy90a3JhZ0RpbGlxR3ZtdHM3VU1FVEd3?=
 =?utf-8?B?QmwwbC90VU1JTmZCZkxBcnhWK3JnTUhyRHRDQ3JnaU95d2ZhUFo2d1R5dHIy?=
 =?utf-8?B?ZjluZVN1a05kb1ZrdWYzMjYyWHNJWk5MUkkzRGRZbWtPaktaYWJZZC83TmNz?=
 =?utf-8?B?VXFNalBiY01CY2ZwVzRBSEhOcHoxRHd3NS81RjJBWThlR1hUQ2xySVlOS25J?=
 =?utf-8?B?emEzSW1XRmhaa3RLSy9MSyt4QjNOTHZkN0V3SExMNzhTYXBPY1d4SndNMnNK?=
 =?utf-8?Q?ZKu8AMssxKgzmNqNmCoDHLfYFQ5sSZ8cMEpJJcd?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1162f4a9-ed48-413c-3ee9-08d92b570546
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 14:58:19.8155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LZVscynWRyEunBfzkkIMjwKrIIKJcaecX8kxbomsAs/NyN27wyG+Mp4wN1X3ystJYl4YbS+pfjKt7SfKkw3MBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB0017
Received-SPF: pass client-ip=40.107.80.120;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-DM3-obe.outbound.protection.outlook.com
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
Cc: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
IEZpbmlzaCB0aGUgZGl2b3JjZSBvZiB0Y2cvIGZyb20gaHcvLCBhbmQgZG8gbm90IHRha2UgdGhl
IG1heCBjcHUgdmFsdWUgZnJvbQ0KPiBNYWNoaW5lU3RhdGU7IGp1c3QgcmVtZW1iZXIgd2hhdCB3
ZSB3ZXJlIHBhc3NlZCBpbiB0Y2dfaW5pdC4NCj4gDQo+IFJldmlld2VkLWJ5OiBQaGlsaXBwZSBN
YXRoaWV1LURhdWTDqSA8ZjRidWdAYW1zYXQub3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJk
IEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4NCj4gLS0tDQo+ICB0Y2cv
aW50ZXJuYWwuaCB8ICAzICsrLQ0KPiAgdGNnL3JlZ2lvbi5jICAgfCAgNiArKystLS0NCj4gIHRj
Zy90Y2cuYyAgICAgIHwgMjMgKysrKysrKysrKy0tLS0tLS0tLS0tLS0NCj4gIDMgZmlsZXMgY2hh
bmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pDQoNClJldmlld2VkLWJ5OiBM
dWlzIFBpcmVzIDxsdWlzLnBpcmVzQGVsZG9yYWRvLm9yZy5icj4NCg0KLS0NCkx1aXMgUGlyZXMN
Ckluc3RpdHV0byBkZSBQZXNxdWlzYXMgRUxET1JBRE8NCkF2aXNvIExlZ2FsIC0gRGlzY2xhaW1l
ciA8aHR0cHM6Ly93d3cuZWxkb3JhZG8ub3JnLmJyL2Rpc2NsYWltZXIuaHRtbD4NCg==

