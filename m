Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 213D83A184E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:00:12 +0200 (CEST)
Received: from localhost ([::1]:39612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzgJ-0006xN-U9
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 10:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzdq-000428-5C
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:57:14 -0400
Received: from mail-eopbgr800130.outbound.protection.outlook.com
 ([40.107.80.130]:19025 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzdo-00042c-Gd
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:57:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5nu4B1nHnK3ctJOGC5EC4ly3ukju61QvXAamlQtiYr9tL3QHsqA7xgXPGpaioHHwP9knI5WJ3GxlK1/FJYstlipcGqOt5FD1tsPJbtoFwXiSzpZy8KG/oHIdGZB9JnZCIUyJGLXHv+5i/J+NSTXypXSC2YXZ0hhbObTvsk9/F7+Cw8pRFkYY7Kd0QZQ7ggPwIH3WSCNbEz4tEuXoYRNB+T72gURPoSZO1pZne7c2Y1/6uUvmiGieCX060b82Yd1B2iK31926cINyzxo5YOqf8drUNB9KtV6kTiqMyfPnbBmj2oDO6Ub39E1GneLkyOlvqFG+JvYKAYYU08t2V5Jnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+rkji6G10W/xcrowCW9rdWvNa5S5jikiSBYdxGNne8=;
 b=QiErjAX2JwQ5Ve3e+Q8IpJbd8NiSgZxRcGFq81IXLVY9z2Lv7upDMqdFGwZ9SxeKUd1jBzr9oa5f7asErtYqs8a1c9scp6rdDrF9knCjTYvZ6HyO/Hfifwq3b9vVByAgYiieiTFqB9A1n0mF5sag1+3CVGSZpaoaIf55l9keje/UT7/2X3Ih7a08e+wtpGJJrAw0UzKg8qjGiU8XNykGpNCRdpPJ1hCLZd+3Emot7qtzclpIukcTxA85Bs2OfuAYRLXpmSn4wrea3c9GDgJz5ZHFko2ZnR9A6MucfKGpFs7Uex+6PGvwOoWIj8acU5ynfIGlIgy63s0zz/rvJRq30g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+rkji6G10W/xcrowCW9rdWvNa5S5jikiSBYdxGNne8=;
 b=YrppqjOk6Qq5wb69GHih+dBopLdACGidmtPuz/tMG/2FBNP0yGSz1yAD4BEnS08AI/EgnMyTZUDWcAZaCYV0FEDz3oWadSNRX883DXAj/thHUayMf3mUXT6FpHgHpud/dC7U2v5YveT5kOzRdn7qgbAI8F0NzXn7rMKBSq4qFbBouplnlWQdoMeU1hfuotlXR3axfHReNYDTuoZG+2d0xbjw2pHXsYjK3RJn1vhvYP2uMAuVNB7yWTrGIJvFZGljzlD/WWEJMYSctSWzE5Sz5uM9OKcb7lR0iZ2W5AxqwDS8dRE5Gvjvv8EUAKDukQPTAGqozgTLCA3WbONTmcVuQA==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB1905.lamprd80.prod.outlook.com (2603:10d6:101:6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Wed, 9 Jun
 2021 14:57:10 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 14:57:10 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 03/28] tcg: Re-order tcg_region_init vs
 tcg_prologue_init
Thread-Topic: [PATCH v3 03/28] tcg: Re-order tcg_region_init vs
 tcg_prologue_init
Thread-Index: AQHXP6mX2HTqEKikw0aFubtkUIs2nasL93iA
Date: Wed, 9 Jun 2021 14:57:10 +0000
Message-ID: <CP2PR80MB3668F5C4DA315CE541974796DA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-4-richard.henderson@linaro.org>
In-Reply-To: <20210502231844.1977630-4-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.102.146.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff91a53c-0af4-4c0d-04e9-08d92b56dbd2
x-ms-traffictypediagnostic: CP2PR80MB1905:
x-microsoft-antispam-prvs: <CP2PR80MB1905C4116F04ACC64F03A01ADA369@CP2PR80MB1905.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1060;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2xEIABxQSDHcBeSAvOTHbjgrS+he6jelC2RZdVA0urxDkgbJIF3jorZjn3J/5LGDySpqS7R8jdpkWfcbsZeBkpL7wRr50La9uMGfv9fsjDhL9ecQdenDxHTgz8HpmCwzoERj/hJ8bKZDHiEuCAgX1UIu2FrkjjRwN084RLchxrRFWx7iO4TAZ4GmJ2El9TUTKxGAT2oO7smIN+09Z13fcKBsrwa/MoQeGDugUwlgyDM0xV+DXpgbzyzEWCRZUMQ9oRrRwQP7dkyvv7b24TB7rV3uQHkptgmYhp84x95OThDePjdbCMRzS4+zuNkEg+cTJre/WJTMFLgnz6ZTQUwEIcez4QHxKsKp5s5gqx4Xrrr0g4tlKX7NZX7iBOUoG0XcfAI/QYFHkIwbnx73HYj5qjTOXtMw/Y5WZtz4LPrslIN1XYLioBNQdHD7G3zdQAaRP9FYGsFYEoBOxlAwoqo2KBLOh/NconImiIHn5AuWrrtJn8O7Wpjjb/ZTVkVt7OOWEo1XFkXYFspLO1z9kdvwWvPDbV6V4FSDNAm0sGU0PUo+IClmUAUFRlr/wgsBFnvM636eUjgg5JSSSUan+IS3/AmJHWibycvG2k6L0La+RBxwrEQu5hkFh53StAzjyN/UJwkf0bqALlZFD7Tc7PVDJqxgMWr9Xdv7mODQf1N3aGMsKy9QV62BC02ITIb6oPCKCpRGjyAQD3zT5XOOXFG4HkpsVk04GVQaIwBne6oIv7VZnq7c7j6rNs6R0qUnn62gLMF87jh2dG1MRIbADX5S0A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(396003)(366004)(376002)(39840400004)(33656002)(66946007)(6506007)(86362001)(186003)(110136005)(316002)(76116006)(4744005)(66556008)(9686003)(38100700002)(7696005)(55016002)(26005)(8676002)(8936002)(83380400001)(52536014)(64756008)(478600001)(122000001)(66476007)(2906002)(71200400001)(5660300002)(66446008)(169823001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?me1fY1y6GzKINJBEASC3oCiZda/3DqNXp8/4U89zhOvF0bVlw5e09qCbiKEK?=
 =?us-ascii?Q?51W69zc1gOopIrI0kvcE+fPCBEF+PN2vEi3rWGPxyXfm/b6nreJq0cSHu5JN?=
 =?us-ascii?Q?ycVngG7xGTwk2no50D4ArCYYRxFVLi6TvJufOq7lagccKsCP3aTC6J1Q14vS?=
 =?us-ascii?Q?XEEXcJGgOjDJ9JgOm9jnj4SRcqvUQ9txa2FDIg7OEifEYcGH7gNYx4D9hVaH?=
 =?us-ascii?Q?11W5mA4W2oGbnfjvmfyJZXoaJck0VM/XpdtlGNo17m0uGL/+jDK1KGo0qCoZ?=
 =?us-ascii?Q?hKO0u8JWEqoqzO3YnW0i1+wqH84VamxL/FMHYYPKuBEv4ES1VpkvWpikG9rc?=
 =?us-ascii?Q?wiAN7TX8AghwtY2cRAgNd75R1JUK5R/OqKyhbPMB4M8ACJUe3X97gENni53A?=
 =?us-ascii?Q?W6h0CApJZ3MmYscoc2PNwLETRi2dCM/MwvTwpeZsDmSLHhp0yiIGrFLRzwxs?=
 =?us-ascii?Q?yuFbTMQcMpBrlWZad2MijeHnr35pMQlVReLA2nNk291iXCTW6UiSSTnqV1TC?=
 =?us-ascii?Q?blTfJk9d2wuYKI1+akNBHBo7BHyjHEbLODd4Xl6DIoMp2+PLxp8pMmLiDjSQ?=
 =?us-ascii?Q?4AjPoGi+GatYF1CZSbUrrQCNLr5+ZHhjlVfQMVRwVHz1Ls4yT3jiJ3WLxzRr?=
 =?us-ascii?Q?l7aMVxEobB1tQd/VliVu+VGSxCJx5BXPMf0ObzFqPirwvWaWkEheoaugH6Dq?=
 =?us-ascii?Q?jBkgp7+iEnutU3D6AQ1CduGaDSLjfrHxfIPU/1Xt1Wx8eFLABKk76BXELKpa?=
 =?us-ascii?Q?FpHbGJbOIr4/zW//L/woHdeNC/wq4J+VhKt5s3+UhAOChUC5/DI83UJGoeS1?=
 =?us-ascii?Q?jxoBPmGEvlvXEyqlAzIEt3DQDHOaETi3DZAQMGAUNT/+TKmzHdUPD4Q03sZu?=
 =?us-ascii?Q?Cg2A2QBXwnputo6APCNV3H1JI12rhajnEfZnvbqwQhs0uBKBYUYp4fPBDi8s?=
 =?us-ascii?Q?rRwJEKjN4bd2C28N7k5qBESWlY6HomiMST4pqp06aYveZnwxh3Uvg4mTM9kf?=
 =?us-ascii?Q?KzvnSQCRf31bnFmu+xLuLYwFWNHrfTnQxfWczOYG6saWZr7qninLahGlBuTr?=
 =?us-ascii?Q?HaAau27+T9LMSD7W3RUusaZq3X1DHSJFzKKD7tHa5RXNxT5tQwnwFOppBHf1?=
 =?us-ascii?Q?fVae/WLysPrCpZqW2uGm2Gb1dAG6CNAWHuLaRryINIe20LJbOm5zov37rvtp?=
 =?us-ascii?Q?eRmpXkvrvcLE/EQXQxJNE8f22izwQsOTFdT1ayuhzW7VDDjwuM69OTj98IwK?=
 =?us-ascii?Q?pz4TR/1lFYr7AoU0rKKaKfk3pGpDsihWJlTOovxNP62TauSAfexui69/uedi?=
 =?us-ascii?Q?i6rkqJ3QyMvn9Z0XZF1ankGr?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff91a53c-0af4-4c0d-04e9-08d92b56dbd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 14:57:10.3102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bqnl4Ak7HRhy4to3CEuBz7fuO21FoJvDeKhN6IZMGCbCMQPqV1FoQ2lME5YVbmpMY+mYycNAt7uyaL9hZhnp4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB1905
Received-SPF: pass client-ip=40.107.80.130;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> Instead of delaying tcg_region_init until after tcg_prologue_init is comp=
lete, do
> tcg_region_init first and let tcg_prologue_init shrink the first region b=
y the size
> of the generated prologue.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/tcg-all.c       | 11 ---------
>  accel/tcg/translate-all.c |  3 +++
>  bsd-user/main.c           |  1 -
>  linux-user/main.c         |  1 -
>  tcg/tcg.c                 | 52 ++++++++++++++-------------------------
>  5 files changed, 22 insertions(+), 46 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

