Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9BD437FC9
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 23:07:43 +0200 (CEST)
Received: from localhost ([::1]:51710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me1lL-0006th-Ll
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 17:07:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1me1iR-0005QB-IJ
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 17:04:39 -0400
Received: from mail-sn1anam02on2134.outbound.protection.outlook.com
 ([40.107.96.134]:9343 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1me1iO-0001jT-Kx
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 17:04:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUN5qPW2tdFHSnN/HdaZCBTS+GM2rFHkvdsb1K3A7tguRGQzR+JS/jN6oaVqMBmvek7o7hNTIF0JEzguMWolQyTQLWn+o1TNrdKTgx7TW1gmiIL5pCJExUzrEPW9E5LxifnwV/R9TYzUKaiGMNHBlYfSipMzie4UGYX5PZr/CRpzi0c7dnmnK+S0aM1I7YrBnHy5HvONhzn9mZ6EQfS+hsjLafvFSXIh1mQTw7BSFMA+CcCdBTWZEIY4YHCbl2htbtfMKaFWv932WRtvzIdJZK8J8HvrmGSVSKXfOJFch1GEDzaTcgmKT1GOW9pTHu1V5TOktXxz9eKJggLeXgO9FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YoJMbzxeP9E2FkyHE1TEGpYwTcTSjBhmc6/5okkAFaU=;
 b=YowIcwMrXHsglHtgNE3aqkZ1RwIOYYBGF/6Vju62PiI2UwovPV9wIM4C9eyBP3aK21Zz1mbt54rr77jTPPV7QTUymu5mo3xtBYZogifvdUGW0iVEq+ANgY4r5uWRmVrVC0u8E8V0v1KvRg2jWPOguvloVzQQ1rwYTY9+C0Yr2szmCAfHugM+cim59bxbr9d9eTaM+7cI/xekn3QLkgcg/M4ZfRNaMoBRdo+o8ZVpNCZbnA+0ZxOQRU+tne9U5sQkK+2UxJsz+qQ5TxVWRUY2uYg6N02+4iklplhM1a0EUGbt2r8Je+LNCav8wQTr+FRkRurxeDtSqzLxbFqG5jG+ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YoJMbzxeP9E2FkyHE1TEGpYwTcTSjBhmc6/5okkAFaU=;
 b=DmGJtgqVo6WSGwF5/KzcVIb8oTF21zo0BnfVGu/yxc84Ywzssti7/yiPbboFjYxMExI1LUeUyaAcHldME+NrFhZYbxG0Ct1vghl0A5hl0Zi2v6zAOnRSgJSTN205BYI96XB/4H3fppj+GsGr4liXwWq8l1TYks7t2yaR0iuY5HM+/SjYM1s3K1q7RxY3iFHe4Jl5jKht+aeFFL3y1ZU44+2ZibBFrz9v8eHdGmIVhKDhp5Gctkzs0p4bghR4WoR9h9n7Xk0DaWLE3fBylcKvve4s0fD3VJsepQ5oOFT0dVswhkx3G25xR4j+fgGf7YMjPwSMvgAJ13p2Top8LtVAAg==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CPXPR80MB5173.lamprd80.prod.outlook.com (2603:10d6:103:5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 21:04:32 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 21:04:32 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 31/48] tcg/optimize: Split out fold_xx_to_x
Thread-Topic: [PATCH v3 31/48] tcg/optimize: Split out fold_xx_to_x
Thread-Index: AQHXxr93+EcuptODzUCBwrcaQtmF8qvfgz9Q
Date: Fri, 22 Oct 2021 21:04:32 +0000
Message-ID: <CPXPR80MB522447F6E39F4E2B3647FAE7DA809@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-32-richard.henderson@linaro.org>
In-Reply-To: <20211021210539.825582-32-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69009981-7f85-4375-bf84-08d9959f8bc6
x-ms-traffictypediagnostic: CPXPR80MB5173:
x-microsoft-antispam-prvs: <CPXPR80MB51730E070C32939FA4D9CDCADA809@CPXPR80MB5173.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ta/ZDq1tXSBo7n8Gk2IeUC2oJHGLt5TLBCuiRl/B4TbMh/cq3VWkHwvKJLyilhqeSnyQwOJ3S23P2FR4rwdhgTCWvq1vR4AOJx+a02Knq1Rgg2oGg2dsSF09yPdTnDUa1xJYIqFbJj0c4JnzgvS5i7+MfZbif6rX5KANxfPWCLFlC51IIRHkuBSNHK/qZ8nx2/gp1ZOfgtIb5eSB6EHhJFqKdCw/I7yXvzF7l+MHCiyY5NMY7tHfYkpXLoM96WC3QfVkyI7Q9Tbughn9jcrbchaUDeSi/XE2lfTuRWKEhGICLbwd9yMBwL+sNT3/7K0wRsft41QNLseehMOZQZvuro+mIvERgY6FCHSOHQFiPc07kZ/r4i0J9k1HCOklM1abJHKlC2f7J4zMjhCZsas/xHQRfsjmQmctlEcFixD2hOmT68icThG+C3lkQlOVgvFvIy6M2bQRmGfN5jf6sCgLW2wFV1EKHbUHkVeFCMwthUZ1IXxzxfn1e5DudRmr1r9mBCm6vKu31GR5fGqjTKpPKnW1vQDF4voIe+O6WnMR08VKBFDB6oSv1T0j0Tv4xBysOUin3npWwiog77kU9X3bx08OkCNPWrJng0fjbhnBdT/ZO9tScezx82Q21DcGVnlN4UTHa/UDWSvuQOMVqd66QhHRYNKA3u9w5XblClrXT5+ymvDlD6t/SBnTEYJ4aX3AJq3T7zHPj0zj7Hj2lEeYnRF0sTjdxM4hkcC7DQLn0LkTJTXjpHk/9mlG83NcQoLTH0gweaBMFRnvcpiBlSwu7/5x0W2oLu3HFhN1NkUePEo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(66446008)(66476007)(76116006)(64756008)(6506007)(2906002)(66946007)(8936002)(4326008)(52536014)(55016002)(8676002)(26005)(316002)(5660300002)(54906003)(71200400001)(110136005)(7696005)(9686003)(508600001)(186003)(83380400001)(38100700002)(86362001)(4744005)(33656002)(122000001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eFlqeVJsaHlmS3hocWJlNDhoNnU3My84WGJXdHBmTDljelBrZ1Y2RTJSRW1Z?=
 =?utf-8?B?ZGNYdkkxWWxMcG5walQ5WDFvZ240OWh4R1lQdlZkaDAxa1M1WXRRSlhZM21F?=
 =?utf-8?B?SC9hM2U2Y0xTTnBZOEY1eG5RZjRYQk5iYWJyakhDa3oxQnc2K2ZLTjZWbUkz?=
 =?utf-8?B?b21qU3VoNmNGQXE3bDhiNC9sWEZWd1dSZGVjNUJrSzEyaG1ray9VS1pJQ2g3?=
 =?utf-8?B?c2ZiL2haZ3dHYTJqUU5FalBOQ1NPQmg4VmhNbEszeEpzbGtFazRlSFNkSllM?=
 =?utf-8?B?Slg2KzVNV2c0NDBocTRkeGhZN3V5WVV0WHdYbVZQVVIxbnJidElmT1FyWmV0?=
 =?utf-8?B?TmhXZEp2eUY5bUZUbFFJTG1WY0oxRGUvRXNnSG1VRklBL1duYzJYbXZWWFVl?=
 =?utf-8?B?eTZ0cUt1SlE0dlBBMjZBcWxPQUZGc1lrdWNWN0VyMldxY2Qva2plcUR2VFFV?=
 =?utf-8?B?bVRJSEQ0UVA0QmtzdTQ0NVdwaWNnTmNQRUlncGhNQTlBY2VxRHlPZ3d1WEF2?=
 =?utf-8?B?UE9oNENIdDdqU0hUNHZ4MmptY0hySUF5anU4VjNzY1JxMm8yNkhScEdJeTdI?=
 =?utf-8?B?WjBKMmRjQXc2dVNkU1FmVFBYNzBvOVlJUEdNSEN5VU9uRjd4ZndrQ1Z1Tndx?=
 =?utf-8?B?NWoyZzNXc1pJdjMrZEtSUmt2SXQxQ2FhMlREZ3BScTVRT2VtbmlFbWhCb1Zv?=
 =?utf-8?B?QWM3QittVHpRTFRLYndQNDF4WTlTOTlvaEpOcVlwY2c2U2VVQnlybUhFYW8r?=
 =?utf-8?B?R3Y1bTg3Q1NMd09CanI0WXZUbzVJV0Z3bWVEY3o2eGE3dWxqL0NEM25iK3VY?=
 =?utf-8?B?cCtFOGFSa2VNWUpadWM4V3RtdmlEeFZWbUhlb2ptOFRsRGlVZVNreTZwdktk?=
 =?utf-8?B?Yk5vRzlPZi9IRlN4TUxEeGJQaDQ2dkdCcmt1Z1B5WUowQndUY0l5c2YrSUUx?=
 =?utf-8?B?aXg2V0xlbmJmcGt0S0E5V3cyUmtOTHI1WHk0TlVLSXE4RUJKZlp5ZDFhUmZC?=
 =?utf-8?B?OFFlSjIzU05Sd2QrczJFR1lRQnA0b1dhTGp1Y1dFU2tGeHRHblNFVG1UQU91?=
 =?utf-8?B?K29nMStwOVZLZUthVHVid1VzWTJvZDBJY2Zad0htR0cxcVltcTFhTVBCZzRD?=
 =?utf-8?B?WU44T0ZZM3ZzWFloQXRLZkVyNGJGR0N0TjJzRzFFRmRIZnM5ZGJkSHBVZTRB?=
 =?utf-8?B?L0Z2SFRCZzRRSmFqS043S1NkV3Q2cDFrOW9SREo5UDZvQXNKOWNPbkdvRkxU?=
 =?utf-8?B?SW9QQUdNeUg5RHI3MjIrQTZaOTUrNG1GRm01RW1jcG81ZDFqeDdqTWM1ZnNv?=
 =?utf-8?B?ZEtOTXl6d054SFpUWVFmbGgwdHlqL0VCVkJsS1Bjei84MDRLWmpRYU4ra1cz?=
 =?utf-8?B?ZWVhVDFaRmhmM1ZtbGpSVWJBbDE5QlUxUVg0cWdsTHAyay91YWxFMVIwRSs2?=
 =?utf-8?B?aFQ3b0owRXUzTzlaQzM5KzFsV282bkMwS1FwbnFnZURZMkFNSjFsdnhiYXhX?=
 =?utf-8?B?QWcwYnBMN3BOSktxRlNWQ2cvakZMU0FZaU9tZnRSM3hhanJoMlVEUHdoMHMv?=
 =?utf-8?B?a0t0UG1PVzFQQnlzTC9wTzJZRHZPRUcwOENKd0dMMm1TZmpnOXlCcE9QT1Y2?=
 =?utf-8?B?Y2VtOVVRVTlqRWpCR2daZXBSU0Q3aldiSXdDS2ZoMEJhL1NFQWZYM3dkOWJo?=
 =?utf-8?B?L2NoOWdQYVZuRVNJNHJIV2J4R1F1dnlXdnFZZWRFZ1ZEOTMyVFVTclpWMTJO?=
 =?utf-8?B?T0oxNkxNWFdDakxPYVBRSWRYeW1scG1VSjBYZ05YWlpHUkVZeStQNDQxTHFN?=
 =?utf-8?B?NGtVL0FqUnRzWlpXNGNLSVlhd2tKRFgzVEhCRkI5RTdLYkFLVUZKTnJ2ZkNB?=
 =?utf-8?B?OVkvT3o0cjV1QzNtSUVFRG9UeVNRSnN2TlEvZlR2RDFWUjRQZHA0YW1XRVBw?=
 =?utf-8?Q?TXtDkSN3gB8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69009981-7f85-4375-bf84-08d9959f8bc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 21:04:32.5973 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPXPR80MB5173
Received-SPF: pass client-ip=40.107.96.134;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
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
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
IFB1bGwgdGhlICJvcCByLCBhLCBhID0+IG1vdiByLCBhIiBvcHRpbWl6YXRpb24gaW50byBhIGZ1
bmN0aW9uLCBhbmQgdXNlIGl0IGluIHRoZQ0KPiBvdXRlciBvcGNvZGUgZm9sZCBmdW5jdGlvbnMu
DQo+IA0KPiBSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0
Lm9yZz4NCj4gU2lnbmVkLW9mZi1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVy
c29uQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgdGNnL29wdGltaXplLmMgfCAzOSArKysrKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNl
cnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkNCg0KUmV2aWV3ZWQtYnk6IEx1aXMgUGlyZXMgPGx1
aXMucGlyZXNAZWxkb3JhZG8ub3JnLmJyPg0KDQotLQ0KTHVpcyBQaXJlcw0KSW5zdGl0dXRvIGRl
IFBlc3F1aXNhcyBFTERPUkFETw0KQXZpc28gTGVnYWwgLSBEaXNjbGFpbWVyIDxodHRwczovL3d3
dy5lbGRvcmFkby5vcmcuYnIvZGlzY2xhaW1lci5odG1sPg0K

