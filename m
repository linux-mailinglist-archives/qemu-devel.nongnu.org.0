Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCCA43E986
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 22:28:05 +0200 (CEST)
Received: from localhost ([::1]:37724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgC0K-00005P-Vl
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 16:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mgBZc-0008LG-8y
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 16:00:29 -0400
Received: from mail-bn3nam01on070b.outbound.protection.outlook.com
 ([2a01:111:f400:fe41::70b]:16896
 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mgBZY-00014m-S5
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 16:00:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nqmpq8CrB5DxpSd+Q+Gi406LqamucFWnEv0wkOnrEoqGWTbTrBOAbHusD7uwsS14+SH/KKw2yijGGc4BUx5Mjz49VxY0KbQzqb6cYB50YBRN8WHsmIE3TwtWuyRURn60TapW9DV29ESW9UYt5CYscHwaenYANFd9PO/KfW7lyX+9UE16Wav5kTL/8KwpZBD1ehNLh/klYfuAW+Y5OA5oSt1vr+fzF4QPnF5G3IZp3owKP1thsyAsdsrrG5oYCESV0g2aARwMiz6WB9BE56DQ7VW3kOyqUSjidGQhNLSzYt2H0TY+HJEQk1yHdaFK7tXKjAgu3BpP9Ox6LOLxETdlQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dWzhZHb7EL2mEYOUcrVzwTG8RT8Jpnp/5AJpnaB+vM=;
 b=kyAXmpmoDzeAl7lOOj1exQG9rRTORRrR1jYkq6vDYdKMjBkdg/vr4WbxDh/RTmzcZh6E/i6T1eaCWJIfZboBioF+1BIUVMoULY7PoJkweWHHVxpmnrgRH/B32kwN38euFAv5hRL6zkgnGcbHGTSSoHbfr6yiUrZ8knvZzvXs7/Xb2Tcwl4I7JQncaDS+rSJweqigRfMxPjQRAhw/vaEsjb0Nmrcv17VOPfD0b1cyr519Gbx5GLJxkeHm5vguRqRuVg2YKN+AqzKE3RBxuh1jYZH+3NCBVTFLKNQY7+GDQEWiGvKFVJ1hcxrxsTM0MN01cp5tTRd5yYP+OKeoB/8hTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dWzhZHb7EL2mEYOUcrVzwTG8RT8Jpnp/5AJpnaB+vM=;
 b=uarqV4UhnWS3hL80UX8BpLLn1vUaOY5EpzvV3YMoJscgcI6w2TiG8j01n/lgcaRryKWO/RpLB6Cq5yPKZl+5CH+/fbSvVkyDq22uk0QASruebxHGAzRjxm9Pfi9VH6ovvFLiswYvcyBXmMDXE88dZTu+dt3fYvJjkdW+S71tVbzkjohUljIph+unvw656Qkhrrf35UVY7K2esXEumgO0DH9bN/M6+Rp9SwbeZ1G3bx7ABfMjj8EhSPSYa+uIu8QY1+Wue1is8YH2iGlePSVKBOc94tw7Sxf8b4UQ4v22kUm3FzJkgxomkYy6SulxiaSxrTuVbncMk4Z9UBJ8T+x/2w==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB3700.lamprd80.prod.outlook.com (2603:10d6:102:30::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Thu, 28 Oct
 2021 19:55:16 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 19:55:16 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH] tcg: Extend call args using the correct opcodes
Thread-Topic: [PATCH] tcg: Extend call args using the correct opcodes
Thread-Index: AQHXzCviF6AshhHKD0aravUR/u94Zqvo0xKw
Date: Thu, 28 Oct 2021 19:55:16 +0000
Message-ID: <CPXPR80MB522462766FEC3606D88E6DCADA869@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211028184440.1508585-1-richard.henderson@linaro.org>
In-Reply-To: <20211028184440.1508585-1-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1c94880-b274-4f55-be93-08d99a4cdd3d
x-ms-traffictypediagnostic: CP2PR80MB3700:
x-microsoft-antispam-prvs: <CP2PR80MB3700B1780103B635D3038AA3DA869@CP2PR80MB3700.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:462;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: noCWZR8+fiWMCmQcY33cDOeWvyPoPVmXOTt7jog4DDP5BxFGApXUzU7QPQgQo1j1DwZMJ9Dp1rQKPLQpGsVqIQCJ3LnBGgr4cryhObKECB2WiyUtXAyfIPkU82u4hhokFbbFONaKTmBKQqA2bQMO0otTECFgbXyTvybDmDzv4nGaY6P7mL7S8nsUsDpJIiMwo9e8KZvJ5McVifK231TSOeokIWUQPIET2ISDTnctz94TUbikJ+317EoJxLIwGHeOxrovYJOLjuCsIRKSTfYXsjE7XjOkCnFW0vljo3AauRnzOY7/kAYpKhZqwUK4V8NWNP0U9QgmyPZc95pAfz3vxtogPYbXX9oh9tJt0A/lEw2iIw0QVV5rIunlb0rb2PAYIN/k1/poLrwaznocuD3l38EK43I4QZ1zhXYlO1D4DdnurG6gnDJEzWnAvZgys51BL+ZtZ5SvOuBv4sQO2Q2NW3fNRcOOjzYFIy91ITjplcPzGOe/1+qzdXfBgtiyP8brNDfA2OGkcu7qpRuPsbGp97Xw5kly8wvJSKoibrKSqaQ1MX/D4UZ3ACZ8HpjXhkqVNmpxC6AN20f9lQrsA4JFK+UO9huSPFEw+50spqcN0IyYRtGLp05wWmnQEH8n1dXVq2HRlcLxVbUfltwi/qLobjmKK5IyCVr9A2CfVUK4OTQ93LX2kO7P/tzHoBbKWJDYxQKH/NDe//ZxWdHjCL6A7cwvHb3ANXYA1So2gJaHdTwYumUcy1pxmJZ7doaBuWVZBgyIwScIAOMXjV7fgx5tnyQvmWjErEADQIlQiFMQma8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(4744005)(508600001)(7696005)(2906002)(316002)(66476007)(66556008)(64756008)(26005)(66446008)(76116006)(110136005)(38100700002)(186003)(66946007)(122000001)(9686003)(71200400001)(5660300002)(52536014)(6506007)(83380400001)(55016002)(8936002)(86362001)(33656002)(54906003)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cNeqJSAfzmmLL1zl4ykxYCedqmR7RvZbdPq+I8yLd34u1v52RbTLt92T4D5i?=
 =?us-ascii?Q?2+eyBhxwmdklhmyrZ9AIyODFYbLiyR8pQoP3rai9A5FAMTOHRSzAPD5QPxYB?=
 =?us-ascii?Q?e+HiZo7fps1/ENz0rmp+Z4Mb8MQJ8rc5JVQqHCcxqkDhXe+JvZ7SZdSZNyG0?=
 =?us-ascii?Q?n9I2ybBDQ50l9lgFCgzsYAGxSyfHn523+vmLBuOSeBTsO9HFohfy3EoRyAeG?=
 =?us-ascii?Q?n88gNduAhXomtTLr9R8iVw3hprgJmr4xKuIzwFrhQiZHoMLLVDOIwmFVpTDt?=
 =?us-ascii?Q?TZhYJj0XBresG6AW7raWONehd9U8C434+i4/5QSJ3j0bSwKkfsIVwJUTtnl2?=
 =?us-ascii?Q?LWs+0otkmGPkY13Hmd6aSZUsAi4377S0q7P3aaac6duO5ZThXowzPT6DqsIp?=
 =?us-ascii?Q?Sr0zYc9IiuKAwyYeBu7r7vyE25u+uA+UJNPNpYqMQHzdh1xJZ4MEGiL/Solm?=
 =?us-ascii?Q?PO01AjtJR0klfEpy5ygDfZ2yxG1pHooClibndF7x2kxr72kg2X5nW0uJ9ZH7?=
 =?us-ascii?Q?A+Q5xi+Gld16bEQC0aqaSuXwIc1EeATuMeLSzrUfygi9rmmg0uuSjFOF0f4a?=
 =?us-ascii?Q?RMQNrozdHHICMKckd1qIrIxvrBk3J5MCQz+VprnFx7JL9COstsUPypFa2PCQ?=
 =?us-ascii?Q?TA6M8CB2zg+rJ4uAjldKxAjipo8hVUkQxihGpnwh7EY+CdhRjbCK38G/S9i6?=
 =?us-ascii?Q?rdRpJRK6kWgbEeBCV4nihzgHTXasZVV5gmB+nNWWz0bMKkgkFS3ngriu5607?=
 =?us-ascii?Q?7cB7njgN737QWpfs1ZshkRaYO7JPyEuYRLRKX2/Cn0r8cFnILH/i+SgD/1L9?=
 =?us-ascii?Q?JPNxO5LofPKMOBqIZ1BOd1tJ1W9jTssyyX7c4H8z0CUpgtezmkOwPD9TFmO/?=
 =?us-ascii?Q?ZSEVL81v8Pb8NgbplaJb0ZDxZUhNVex9TKEyaOQ1/IagKwtSQsl3oyq0kgxm?=
 =?us-ascii?Q?BD7M8scFirPI33qjljC1aSzsBwxDa5YHz3zjffjJ6Tb/a/o3ClP0R9BvyvDz?=
 =?us-ascii?Q?ZH87P7Ingvoe4daqsaifYZ56QYe6wiJIAtj9/L9SHu1MVK0b2qdV0q+mnPzX?=
 =?us-ascii?Q?4kkIkMGss7BP66cxy1fQYY4U7Pg1p5BUDTCfevCK6Yy+X1cOwcsWTO0KxXei?=
 =?us-ascii?Q?Q6bTHf1xawVfk+QrKmAPNca6bbiLXTVNz1vG9N5ReZZkfAchRtUQPQaCHLX0?=
 =?us-ascii?Q?WmGMFVsjHjHviJW6AR1UTasl7lgwOXA8dONlbdaIHuOv4GhLV+2YPXIUNI4X?=
 =?us-ascii?Q?Y8Oh7SKKQ78fYWdM5jdUCM6b6wbz/VkCK6l7O/X/Uty1ay1SHQn0KP5blLMy?=
 =?us-ascii?Q?wgLYYfzPws8EF7VAdt/okfu+1M++jXj8/V9vVcJpCcPKUbA0/u/38qSJvEor?=
 =?us-ascii?Q?xzIHc+WRP7wOWbuhdYPNdwY1rQWFUcSYYhYDd/BHcmAGfetiolUv1ed4KXfh?=
 =?us-ascii?Q?h/llRyOAUehQ3GvT1mZQrbaigz0ad/bY0BCU/L5idPLM2ScI0N5X2mlz9thP?=
 =?us-ascii?Q?dC1men373x8FehoKriss8TWyZnfbteqiIU1lJliWdHy8U4+8ypD/12xd2LGg?=
 =?us-ascii?Q?5CvoBPMHcOo4oUp0tFsJjUfWMAjXLXCHbOK6Zivy86RlR35pnEWI9OUubXWw?=
 =?us-ascii?Q?ckrn6MShm6emED+j7kWPiLM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1c94880-b274-4f55-be93-08d99a4cdd3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2021 19:55:16.7380 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SywLp8MV41yuGQhHASRva+3COOzJp4hJWTNi010dX5m7nFzWpneEj8AEGIFMXCrOVtBFPvX53t+rmeavc5g60Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB3700
Received-SPF: pass client-ip=2a01:111:f400:fe41::70b;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-BN3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> Pretending that the source is i64 when it is in fact i32 is incorrect; we=
 have type-
> changing opcodes that must be used.
> This bug trips up the subsequent change to the optimizer.
>=20
> Fixes: 4f2331e5b67a
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>=20
> This fixes a problem found in s390x host testing, and should be considere=
d patch
> 41.5/51 in
>=20
>   [PATCH v4 00/51] tcg: optimize redundant sign extensions
>=20
> just before
>=20
>   tcg/optimize: Stop forcing z_mask to "garbage" for 32-bit values
>=20
>=20
> r~
>=20
> ---
>  tcg/tcg.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

