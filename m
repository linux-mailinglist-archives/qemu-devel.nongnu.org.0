Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5F7439ECD
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 20:59:51 +0200 (CEST)
Received: from localhost ([::1]:42806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf5CI-00017t-TH
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 14:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mf59Q-0007qp-Iu; Mon, 25 Oct 2021 14:56:52 -0400
Received: from mail-sn1anam02on20708.outbound.protection.outlook.com
 ([2a01:111:f400:7ea9::708]:54404
 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mf59O-000893-Os; Mon, 25 Oct 2021 14:56:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BboLlYryzoe3tdgwWbhm5W9z0AHiegS5JYEB91gVMJ9Pp63CnlTQpTk/UHyR8dVApRzY8oQG745ve3CRxQPWESQ0dITlbzSUbiIcS/zoIBarD0tRpul7M9GftkO1PCQHxbT0rytR34nZ8MN3F5OQBBA6wBw+xmOyo7jyqGWD7GafaOGdIzwlegR8YjiGfkZXjIwDYt29B3C7oGymob0+oEhsfylFMbCjZCchJd8ifP6urBEQQA8he0xvkUUb8fiLDX6LTfJlC96QVBl6oHtYxa1rSnWebC8M0wdVOyoqs/0SoJ/F5mmGwFcKScYRohff3RTVgLV9A4pojC305/IeWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pI/8uH31/HHMwbQNTmFyQ0eh0L4aRLC+bxIvk9gBDOM=;
 b=OmQUYBTF3psQjHCWAmVNXImKU8M1kPL2KcmH6+s3/AAMgBkNi50j/LOEi52i32jUvo9IMGjJcXVkOpVtNOj9sppKYlNf3sPqKEyRuvxSqKG9pV1Ebu8F0oBEZwCLYCY30vg0wZsyLF8dP4US8qIMi5BHD69hj9A9QTy7qklXVP2fhMDlxkN51r2EJXi4bp9fkJxDn3IpdShKyFuT0SvnlG9V0vwMs1F+phgkUvScf6Bwyti1XmNTI7o7JEbHB2KKKmFQPggAm3kj9u6cXS1rGcTmV3i9KogQyedN13/0ktpxG+89i1cermZA0atBiRkntKUCotIWa2946rDcFNpx5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pI/8uH31/HHMwbQNTmFyQ0eh0L4aRLC+bxIvk9gBDOM=;
 b=PtBi7mhOsB2qoOILidcw6dM23ZihYRTHeN9y9IRzPqFULwi8irZwoKHblg0yUIen5QR9F/5l9oiHqRd/8C5uDxEaRXCpvA/HTPATdKoGYyGUzc2z1UgYjUW9kLhBRW3gROmkDKDgsEKU2NPBa8PM4WT2/dKvuzCCD+UbuGgChIBJxyGJdk7yVOqIcgcjqk63ruto9Ai9n107GeM2gQFqTNdNE2Q54WzGt/RXWRijrQamx1Ad4+xSw1CKtbzEuRpQv3wFnYQTT62ZzDrrjOuVWzQAXHegk4WlsM9IECvfslipt7xee1TDkudk+e2dKs+5ZS0vQfty0G9UzEKwK9Wi0Q==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB4467.lamprd80.prod.outlook.com (2603:10d6:102:48::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Mon, 25 Oct
 2021 18:51:45 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 18:51:45 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
Subject: RE: [PATCH v3 07/22] host-utils: add 128-bit quotient support to
 divu128/divs128
Thread-Topic: [PATCH v3 07/22] host-utils: add 128-bit quotient support to
 divu128/divs128
Thread-Index: AQHXpjbHe7rvMsEf0Eq6oAAWTrT25KveNPiAgAYc0UA=
Date: Mon, 25 Oct 2021 18:51:45 +0000
Message-ID: <CPXPR80MB52245C4D2FDFBC5A7611B27DDA839@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
 <20210910112624.72748-8-luis.pires@eldorado.org.br>
 <c95f226d-9a6f-17f8-b4b0-983e628dad55@linaro.org>
In-Reply-To: <c95f226d-9a6f-17f8-b4b0-983e628dad55@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5043dfc-d669-4987-6af9-08d997e87e37
x-ms-traffictypediagnostic: CP2PR80MB4467:
x-microsoft-antispam-prvs: <CP2PR80MB44675D43694B3FFAA12FAA0EDA839@CP2PR80MB4467.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qf1K8iBJLol8jy0yAox7iK+wFHY2ITiT7HkAQDQUrEKX7cnvzzRXl6YXkZn5g6gjHumLms7THkw78el6+/cGUr9rlrP8OyJRMPz0+l7YHsG+/zjR0BrfAGGgZ7jh68FmXXzLJUvWSoC7yuJ4ow85nKdo/SbfBafkYO06cCq1lP5s61PlzGxjVULAstA58GJpR5RgwfTGYAiM8e4kFMerH/56tiMBtIunux2Mf5Ga3xU8FvukMfrReMd7HNI8LSytUV8gos8OHJI1fmmMcH0NfvPrgl6YLgpAJXbQTTALG3pOQwXDGIE6Fwr59OZuIVWXR/hCmiDyva2o5tQJDgH3nIedQZyMuM6dp6hYrKglRsm0CYftoJ/tuGtbQhE821lLYLW8CoWRvA1wZ2r79KQqmv+Yzc8mlrHSuLqaql5LgHjfhrknPrX/+Rstn/RTWjiP+jZM8SSfyHp+FU+7opDzCXlAGN4tMy2WkpSrtVK6dbsjMd5ms2dDu/d/Bv2NADVxB0nZh47k3Z4ZBzfRfbL7eMLPvUSFt4NQHfYvPciYmxUukhGd55MtDF+efv1PE5zuit/MorE+9vDyHwdl+fwQnZbpKhc+B9vUfDIbzuwjVRaoMJx0PbriSVualhO8D3ZfVG5M8URuP0mKPlv00ZenrKALS2hJIRHBpl5Skvsiuavhh0icN2gduqRu2Tlhr8jY7tdyEszaKwUexE8L+zxX7iMX+Vu450tF4sKjQHbLH7vtfNAK+zZy0fvhtsXS2ynqgq1tWZFzoD4Ky2REYR0WN3a5bg9fHdxnQVAo0LtOR20=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(66946007)(66556008)(4326008)(7696005)(33656002)(2906002)(8676002)(66476007)(122000001)(5660300002)(52536014)(55016002)(64756008)(186003)(508600001)(66446008)(86362001)(26005)(8936002)(38070700005)(9686003)(76116006)(110136005)(54906003)(71200400001)(4744005)(316002)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MkhVRWlXUnpVRnRoa3hYcnVwd0F0M282TjFrMnBJdlN6T1RBamZ3NDdURkVK?=
 =?utf-8?B?bWVKeWVzeFBZdTRHY3E0WUhlK0gxOHNES0tQL01WZGE2VXZjNEpkTU1ZZzRi?=
 =?utf-8?B?TnpoQnM2dWoraUtKeHFWcHRSQ25KQUpCaUR5K0dZRVRUbjcxaHpQc3RpckdY?=
 =?utf-8?B?SmJOaTRPTjlEWkVlZFFVZmlyeVdnby9udDJ4S2NBL1F3cGM1Smk3ZUJHd2lZ?=
 =?utf-8?B?dnQ5NzZBb2Y3cktrdFJpUmM4L2FPcUI4S3RGWmI4MGZNcDZEb1k0U0xQSndK?=
 =?utf-8?B?SUxaYStHb1kzWUxxMTBWNXQ2OVRkSk5vY1l1RmJBWi9jU01YdTFjQkMyRDlu?=
 =?utf-8?B?TUZSRkoxZ0ozRHpYMG9JYUdoWldaOEp2OFEvaE5jRURub3pSZ0l5a1U2d1dN?=
 =?utf-8?B?Rzh1eXBzczFlOGFaN0F6ZGw0S2prSDErNy9FalpmUXVlQ1RsWC9jRS9yRFhu?=
 =?utf-8?B?bjAxcXBEVk5hb3ZqS3prcGMzTHhMcHZ1R05WTDBnQnV1WU5PeTl4YVVMdVc1?=
 =?utf-8?B?S1p1eEZpQmRqNC9LWlQ2S05kYkFSWEh0VGQ5UmlQTDl1LzVRTytjRVlnQ2kw?=
 =?utf-8?B?ZGhuWTBsSWxhQVprQmlLb0xZM1E2UHFwS2pjZnlwRlpQMFh2RTB6RzRncjcw?=
 =?utf-8?B?aHVPY082ZmpDdWg5SEFIV21ZU25ZMlRNSmV1bU9Ib241WEtZK21KOGJ5bzgy?=
 =?utf-8?B?Tm5ZazJ1T0o2UGpQNGlUOWNudTFPT3c2ZGg4enBkVTVSN21FMjhQaWhWWDBi?=
 =?utf-8?B?anh4V1lZMTBVK09XdlVuVi9XY0cybTAwaS93eVpDbFY1MXRVRWh3REVUODdY?=
 =?utf-8?B?d081bVEycjZrNyt4SVRMemd5Z3VyMFVxMDZXK3ZMbU5jQ3R4OEtzeG5wdHFR?=
 =?utf-8?B?citNNlVHSTNFN2hTakF6bjZ4Uk1ad3RUMmFLdHhrQ1VZbjVqNjhtaTR0cndL?=
 =?utf-8?B?RGh4MXFQdWF2WHlkSVJxYURYMjl3M29FbmxPTVFQU1I3ZGRuN0h3bDFUclN0?=
 =?utf-8?B?STU5Q3Q0UXpVQ28vMi9VVDNKZWRxZzh5S3AzbXVlVzlhck1QSkdBVkxkOFhq?=
 =?utf-8?B?WmFxOEFDSGx1aFduM3k0U3Q3TDdkRGxUUUhNWlVkZ2ZtYWExRFNoOWNXRlhU?=
 =?utf-8?B?S0tEcWRyblBaVkZGZEYzV09SWHVCZVQ3bUN4WlBiYUd5eGEvcUYveTNRZitM?=
 =?utf-8?B?RVVKbU5zSDlIRnVuQUJrQzRJdjlDRUtwY0daUVZoQkVJR2lQdlZDWkJ6d0hq?=
 =?utf-8?B?VUNPVWd5Z2xaVlB2VnFCZW5PZGE1TS9CNE1vNndtT0FzdStqTGVuUDg5ZXVF?=
 =?utf-8?B?cGsyRkZjQXhLeHJvS2lGc1c0cWdwMDJvUnhmSVZqR0h5azlJanMvU2pLK2N5?=
 =?utf-8?B?TlJSWU1Md0tpSXNkUTFCUlgyd1lXT1BCdlR0cDhQcFVmWW9yZDVyK3AwaDZ0?=
 =?utf-8?B?MzhiSVo2Q0NvYzExTnV1cVZZL3BwVnZ6SFllVWhsQ3JIOEYwa1BVaG5qMmFW?=
 =?utf-8?B?YjBpbGRjQkdZUlJZeGpvVkFjbjgvYkl3MHpLV3VRcUdFVnA0cXFGZzJYT29p?=
 =?utf-8?B?a2NIWVZDbG12WWNjM2VBN3hZMXR0a2Znd0JNL2tuZU51ODN6QUk3di9udWlp?=
 =?utf-8?B?alExcFJCaHEvRzdjTDhIbHlDdnMvUm1POVpPVWk0cHZ4R1RyYjl2T0x4RTRB?=
 =?utf-8?B?NnhmckRPWG80MWtnbVd1ejNtSWhRWXc2dlROaEJ2aUZycmlYQTNYUHZiU3Er?=
 =?utf-8?B?QmNPNG8xcEJmY3ZsQ0diOFBwc3drQ3JTSlpqYVpQOXBoZmpZd2hjMVI1ckVT?=
 =?utf-8?B?YUozNzdNeXk0elRCQlpNT0pKZWtiZ1V3dS9GT1dTdVVZUldYMVlkdkU0NE1q?=
 =?utf-8?B?bTcrRUtCeW1kL0hHeS9YYitqSGRnNUxtWHNlV2RDOCtZS0JCT3ZFUkZJRUla?=
 =?utf-8?B?Z25rOUZNNkdONVU2L0NWUDBlM1l0UXAxMzk1alRhL0k3TTB5RHRTbmdWRi81?=
 =?utf-8?B?MURjUVFKQ3BXWHpTS1h3cXlxZUFuVXFobGtad2VvQkV2TGZvYmVqVVZKQ2xl?=
 =?utf-8?B?SjVRUkZRSzJuZ25FQ0RvZStLdTZCcmVRSG43Y0NiMXNnSFhuY2w2MzRvb1VS?=
 =?utf-8?B?akVIVXRMNWovMENnUzhkclJtNXQ5RytYbXZNU0FVZWNYTmg5VHRIWTBUeC9o?=
 =?utf-8?B?UUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5043dfc-d669-4987-6af9-08d997e87e37
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2021 18:51:45.4334 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E5XdYnSSselIYWfFgff+ApK1qd1giExGp3TiOqIw06sL2VTSPofaISTXK4xHFSrVgjQ6xh8lTjNLLk5YSiRZQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4467
Received-SPF: pass client-ip=2a01:111:f400:7ea9::708;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: "groug@kaod.org" <groug@kaod.org>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
ID4gQSBuZXcgYXJndW1lbnQsIHByZW0sIHdhcyBhZGRlZCB0byBkaXZ1MTI4L2RpdnMxMjggdG8g
cmVjZWl2ZSB0aGUNCj4gPiByZW1haW5kZXIsIGZyZWVpbmcgdXAgcGhpZ2ggdG8gcmVjZWl2ZSB0
aGUgaGlnaCA2NCBiaXRzIG9mIHRoZQ0KPiA+IHF1b3RpZW50Lg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogTHVpcyBQaXJlcyA8bHVpcy5waXJlc0BlbGRvcmFkby5vcmcuYnI+DQo+IA0KPiBXaHkg
bm90IHJldHVybiB0aGUgcmVtYWluZGVyPyAgVGhhdCB3b3VsZCBhdm9pZCB0aGUgbmVlZCBmb3Ig
YW4gZXh0cmENCj4gYXJndW1lbnQsIGFuZCB0aGUgbmVlZCBmb3IgYSBjb25kaXRpb25hbCB2cyBw
cmVtIGluc2lkZSB0aGUgZGl2aXNpb24gZnVuY3Rpb25zLg0KDQpObyBnb29kIHJlYXNvbiwgaW4g
ZmFjdC4gOikNCkkndmUgY2hhbmdlZCB0aGF0IGZvciB0aGUgbmV4dCB2ZXJzaW9uIG9mIHRoZSBw
YXRjaCBzZXJpZXMuIFRoYW5rcyENCg0KLS0NCkx1aXMgUGlyZXMNCkluc3RpdHV0byBkZSBQZXNx
dWlzYXMgRUxET1JBRE8NCkF2aXNvIExlZ2FsIC0gRGlzY2xhaW1lciA8aHR0cHM6Ly93d3cuZWxk
b3JhZG8ub3JnLmJyL2Rpc2NsYWltZXIuaHRtbD4NCg==

