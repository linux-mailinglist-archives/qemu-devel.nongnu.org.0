Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A20437FE6
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 23:20:49 +0200 (CEST)
Received: from localhost ([::1]:34864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me1y4-000734-FF
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 17:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1me1vI-0005tf-ER
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 17:17:56 -0400
Received: from mail-eopbgr820124.outbound.protection.outlook.com
 ([40.107.82.124]:10944 helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1me1vF-0001ac-Pn
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 17:17:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jIbJkYTseo5mYXgB/jRLJBHMzn3Fsf3RB8PsHlbTHBrMPt4qXB6qmmOVGvxS6tIKbZzxy7NJM7X5WMAJdzTFiOGl5eI+tlpyUmgH3StsEDtudj+0jV98vuyUwm4BCAg4EbmQKDhad1zEnPbFBBObnaQIvmOr/d7X816GXjYABvgbrAcCn1yLpzMhlvPGfNGypGy2LKryIKvPgxblljJJCoL6XgcakzVY5QGKfpmvAM2Iw/YqByoNU7Dpp/jEBN0qxK7SsdGnaZ4+BhPWwqbF99sWs2kB4z0CBzoYHrxoowFbgIYlqBOa6v9nBawCVqvszYf1tINHhMol54gsKo4Rew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L55i4VGUPAQBP3JZ9vnUbixr7jHhqIaecV/Ir3NxcK8=;
 b=jjBGEJCJESPTBV1B+C4AUpfxGwa7Tm7QHRRMeafDlButYBSXiS2RJmXgC2fxV580fSRjGN/ywZaMAiyzJei/Rhq3G/E4xH9rIXYL6QXb9eQvPLZA4F6+xuxdA/Cy+AcSOecV1B6ZC2OExgyFWze73UY1QSBZDt5G6vNNBzIxxEh+CM4RCQ5cPcHZz14t5M6go6GurDVFkZLnGabHsS6pVSZWt0RJDzLe3A8D1WUnGzQuqU3iZbfXyVEFbA4DsuszN5Dn9hGOgcEUphgKrkorERXS/IxaSw1cOU6PyvDTYauk03qUO2RsmpCnvzRKi1th0f0T+F+EMvyXAyQ9trdS5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L55i4VGUPAQBP3JZ9vnUbixr7jHhqIaecV/Ir3NxcK8=;
 b=hNdKvSwiYIzRdKBe7xYKQg2bXe2Go0MeA2BVy1INJLUhO/JTyQHwnLecStemEUMPr19TkJxr/EbJMQVvAHsXI5hJTdRx/jpjPB361ksY+T1QJOHbf/2V44vQG+Rv6IJ5B+2YcEIOdm7iXAJREZdyysVcfkdN+4e6QqBTxv2mSWL+kSoPIfGracRsx0MyWNJXrD9t3CmMZFLRSJCov3AJmge0gSdLSmA00hYY2Z1lqNsxD3nNBsa98DtvLlkkIFa0lDedogjTxMEAxxS0yQRPfquWuRjp5ioWZVQ8avZ3Y93nV0jMWgxS4elaXeGowhmRGozG8yuegcCDDvrZktDB2w==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB4049.lamprd80.prod.outlook.com (2603:10d6:102:3c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Fri, 22 Oct
 2021 21:17:48 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 21:17:48 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 32/48] tcg/optimize: Split out fold_xi_to_i
Thread-Topic: [PATCH v3 32/48] tcg/optimize: Split out fold_xi_to_i
Thread-Index: AQHXxr93J7yZ7shTnkGuqPjX7LAyF6vfhsog
Date: Fri, 22 Oct 2021 21:17:48 +0000
Message-ID: <CPXPR80MB5224BC3439B90A86D150B445DA809@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-33-richard.henderson@linaro.org>
In-Reply-To: <20211021210539.825582-33-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fff08e2c-78f1-431d-9faf-08d995a16601
x-ms-traffictypediagnostic: CP2PR80MB4049:
x-microsoft-antispam-prvs: <CP2PR80MB40493830C65F0CA906BC4B37DA809@CP2PR80MB4049.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jQcy7I4bmGSECelH7GrDRbWo/H6wROPwTiohTRb0zRgbR6f0Z2UumWt+rGMVC2yolJIKD3cMR8IWrCmfXKg0w8SzRC6Pz41ErFe7hQrZ/ZdJ7HOhTycA/ofKkZIDWuEexqmRc5TILVnXHAQfVhLoF1tsFtk2+jAWTjn3mNqe4PVZw9qDIf670WMNRLR55mZS6Uc01roBIaTMXHnpPSW3nUkFeRGkdyUet5VF7GUkGxY+iE2O2uo6qlsgk0wHKpw1w90Ogkl+NTtYhcH0H3bwpDckK4q95semcxCqPDkl1IXBrXns/+rJEsMoFxGXRjgDjuCHhECjopnGlmcPxhCZtVytNXiP/8S0t9mvdyBLGOUKrwW86+eeCCu8ZyxfNi9HCn4ECUoTajvg8TPGITnKNg2QOT+e7w8dXzUxe1FJOIdzi+PA6QeGsYPkhD7mcFXfLM5BRtCTOUWmr7isQDY4Uscd1ljvhjvm9Z5AoFg2jQnsrNP8GvZYSIf3uwelQWwc9opysQBqJrFdbNFDJG0R2FVikr5UHHuh0+Ql0EWv2gKJAwW2/mAM3hRe0lW1/Zr8dys/DvhiMLkE+ZZ+zxQ6QYFk86X145k69aWFmuOKSPpWOb8Vz9P9i7+5WFXKOb0apA0oEF0rBjHXf4lo2TAIR6fTqGMNMGWfzh41yonBxcDnF/y5EMQNR3fTxcJASCLRMQlVk6AyI2CEWZPYO+K44+TxbmgRmqVubwNzlHwag7GDkTnRTc10mt3ZWQKxveW3wG2XFUnpn2CGi5n3Jp9AjATC2xz7Sf3mmRTX21sngkQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(64756008)(66476007)(9686003)(66946007)(66446008)(26005)(66556008)(508600001)(4326008)(4744005)(83380400001)(5660300002)(8936002)(33656002)(54906003)(6506007)(2906002)(316002)(110136005)(38070700005)(52536014)(71200400001)(38100700002)(76116006)(86362001)(186003)(7696005)(8676002)(55016002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SE92TE0rODl6OWo0eXJmV1pVSi9OM0J1NEN4WmhTUVhKTUUxQnVib29QSXFB?=
 =?utf-8?B?S2k1NVlUd2NVZnd1eWNONGNKUVdHZVZxV0M5RTR4blBtaHVLaVFFSS9YQjVx?=
 =?utf-8?B?WlBYeGV0cUJrY2l5SGYxWGVDYTZ3amtibnB4Rk53RkM5eDM3R21LbHJKMWV4?=
 =?utf-8?B?YWFEQVVTMGs3T1dWVlpjQmcrSkZKQ2hXSFE2TG5mWVY4THlWM0J1Wi9iblov?=
 =?utf-8?B?aFVFWnVGamxHWXFqbWdPTlpJaG9BK0J5aXpVQWN5UFJzTVArUkpPeUlEQVZy?=
 =?utf-8?B?WHM1YjlUWFVDRGMvYkFnOFJ5WWxrSUxWOXJCQThxOWFKakVlVHI2ZUVhanN2?=
 =?utf-8?B?RWVKWk1rRGFtZnFEYnFGeDRTNTE0RC8rQ3AwVDdXbi9zNWRqR3JVclZoMTJh?=
 =?utf-8?B?TlFJbWFMWGtzUXBwU2puM3NkWWZQdU5McHRScDJGV0NhMXBVY3V5NkNzU21j?=
 =?utf-8?B?Q3lFMzlJcmpYVGovSkJzejhsYmxjam5YTCtMQU5qb1hzV1dBWnF0UTJlYXZl?=
 =?utf-8?B?OGFEd3QxN21qd09CUzZ0STZHdER6YnlodUJoRHN3SElVdmxrd2pTQUZZT2tX?=
 =?utf-8?B?cU43eWhhdThIeVB1b2J6Q2xYSFc3YjFqdU1NOXdpbGdNYTdmWmVUd1RrNFNJ?=
 =?utf-8?B?M2tEY3g1dDhWTkJJMVFjT0tXOXdwRzNMSXZaVDhnMTVwZVkxYW5CUS8vTlhN?=
 =?utf-8?B?MDEzcWxwc01EbEhMNGorMnA5VUs3bW9lRDdyS3lSQ1lTbmxza1NvTURwaDc5?=
 =?utf-8?B?V1ZuWWhnM1VjL2xBNU1RUFN3MzRPRFBGNEFZOUxHcFlMRlFqWUhRMXJ6K2ht?=
 =?utf-8?B?TW1seTBzTHRObEVYWk9qV2N5MkN1dE9YMlNpTHJUKy8vd05GbGNrckM0U0M0?=
 =?utf-8?B?bWF4T2E3UHNka2pJTkVoOWlHOHVvK25waksrRmVuUEN3ZXhrdUJxUzZGY1ZG?=
 =?utf-8?B?Q1RIcHQzaEh0b2l2UURpTkpwd0VyZHZweEFyL3FTcjE3bkxwbFltWnlBRlhx?=
 =?utf-8?B?N213SkNiSjJyclg4bVhyenJKU0NxNnh4aVNOMmg1SzZidEVHWk4xRjZ3Q1VI?=
 =?utf-8?B?ZjhoMUJzcFMvMnI4Q004U2VRd0dqc3pvM0pPZmpnVzUvVldSbGc1U1ZNQzJI?=
 =?utf-8?B?MWo5ek5RcXovZEMrV01DTVFkTHRIdTcrZmNsY25KakNzNGo5UU9BN0tlc1BG?=
 =?utf-8?B?YkZaMjRBRkFYK2szOER0OVJqUjArdDQvN0hvMGhwTVBORnhoaXpNMmZleHZW?=
 =?utf-8?B?QzVhK1NUUjNwM1h4RGNCenV1L0pOdHZsaVFna0dHNFFxQ1UyUzRHWFdIMGow?=
 =?utf-8?B?MlVSTXNVV2FOOVBqdkc0STQvVHdDQjJ1Qjh6VFluMjh3QmRjNFY4cVRTbDZF?=
 =?utf-8?B?aTFuQ2pLbzMweUpUWGZRakpjNzFpTFhXRWlNYkRyc1R1RkNSZ1p1UytFMVgx?=
 =?utf-8?B?QVc3WXBNTEc4bkg1NmIyYlhmWjJLRXE4dDNKcVc4Q05aOU1jMlREc2poUSs1?=
 =?utf-8?B?Tmx5YVJJSVNYRzJSRWFOZVYxam5yUnJaVTVzOTM2RndHYmhjaUFZWEZWTFp0?=
 =?utf-8?B?b3d4VU1kUFFvTUx5Qzd5dVVTbUpaRzRXSG9wK3VjbkZ2YThlZ0w1YU91eDd6?=
 =?utf-8?B?RnNET1V3ZDNTbDh6WnBOMVNxSkxWTURIdURDSm5aMTZqRHVYRUM4eU5Nb1VU?=
 =?utf-8?B?NEkyeThQTTRzTEsyNFJmZjV3Mkg2WFJqbXdsZTB2WmlvY2Y1aGVUd3dteTdx?=
 =?utf-8?B?SlI3aTNsbXdNUDVoTW5Yb1NhZnpEaUpwSk1VVDNzcFVCRXY0SVgxa3h2WVJu?=
 =?utf-8?B?Z2VhQlV0UUNPU1oyLy9kd0lZanZtam5ZWkk4UXJPWWVwYStPVnlEd3JqNFo1?=
 =?utf-8?B?dEMzTzJoREdvcTgwSWZWYTMrK1pRNDRXRmpXTWVqUVJJLzAwdCtjK296WmxH?=
 =?utf-8?Q?Aa/zPjhFgD0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fff08e2c-78f1-431d-9faf-08d995a16601
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 21:17:48.1992 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4049
Received-SPF: pass client-ip=40.107.82.124;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-SN1-obe.outbound.protection.outlook.com
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
IFB1bGwgdGhlICJvcCByLCBhLCAwID0+IG1vdmkgciwgMCIgb3B0aW1pemF0aW9uIGludG8gYSBm
dW5jdGlvbiwgYW5kIHVzZSBpdCBpbiB0aGUNCj4gb3V0ZXIgb3Bjb2RlIGZvbGQgZnVuY3Rpb25z
Lg0KPiANCj4gUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNh
dC5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRl
cnNvbkBsaW5hcm8ub3JnPg0KPiAtLS0NCj4gIHRjZy9vcHRpbWl6ZS5jIHwgMzIgKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25z
KCspLCAxNyBkZWxldGlvbnMoLSkNCg0KUmV2aWV3ZWQtYnk6IEx1aXMgUGlyZXMgPGx1aXMucGly
ZXNAZWxkb3JhZG8ub3JnLmJyPg0KDQotLQ0KTHVpcyBQaXJlcw0KSW5zdGl0dXRvIGRlIFBlc3F1
aXNhcyBFTERPUkFETw0KQXZpc28gTGVnYWwgLSBEaXNjbGFpbWVyIDxodHRwczovL3d3dy5lbGRv
cmFkby5vcmcuYnIvZGlzY2xhaW1lci5odG1sPg0K

