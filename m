Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 067C1435611
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 00:46:41 +0200 (CEST)
Received: from localhost ([::1]:54796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdKM4-0007hh-2U
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 18:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3q-0002pR-W3
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:51 -0400
Received: from mail-dm3nam07on2096.outbound.protection.outlook.com
 ([40.107.95.96]:15009 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3p-0006yZ-BI
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jT6iWkr4oFrZvjwJJMhUCOxLNAfSr/WZwl2urbv7OF/kex/b71olEFmOlK93L8IhKtTAqS5kB/59V2djGnsBwTfwfPIN3x2r0KhOeB8v1216ADdtbb/it/l2yF1R76DepxktInx6D+JTtRJOjMFOGlMfigk2eeDveGDXinRc10NCfdMxJb7rYNBm9LNAhj7exSHagScRvAHkIbeFw/a/AH7U2SKIh4CiOg9ybGGCXZ3MNHXEkL6QpVNCe+aZwguB6ENEi0qq2ZItDWWqXUwxqepbBfL6RRadGt8UhCO+aBn8PJIrY/GTEYue9c1wb3j4x9NdueoR9aPSKJ4e3ivniw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGKovymvsOJ87qtCo/6NzBGT9ccEvUSEeQFinm8whOk=;
 b=HdK/1AAXy0zfARutaOcA0H/0NQNOyMazo8IbuFbliu4+ZT/IHNvD9pI9BnrziD3wQG/NJUQt1JSImGLUhfKQWc9eshqmdI5sxMW15GhRR2FVKYw1GX98/pnR00OYtFHt/QL2P4Oe7ji4FO5Aq0g3R/Z5DsvKEDAA1nXFrYMXfu5Z7FJlfY3ZCDC8yaTv/px4rIaLpx/AfwoCWquVhoCCn71bqRSP4nyy7jc06WPLPY9J+j+TxyCL9B2KYep5rg9A+scX8uAp5iL9ELXWoF7lmjvaZYYQJIA16YerQwED5Oo9p7MrJ3zwQFgx683VrIWonX+DO75QcsgbfZiaECQoww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGKovymvsOJ87qtCo/6NzBGT9ccEvUSEeQFinm8whOk=;
 b=FePfEu7SHyjEnx3S6r2tCvEysKqx5qIK/A7MDUPCwB2gxcrFRSDvAPwfXkUo+FxAvjYDNy4r5VFxUgYRLpwdLofS5aP3QdeoUyY1pE2VMNBMIZdBVQfhngkVfDZZ9F7wkIZF2GxJnKNCWI6rFopRG2V83R/NZJKz45hDMd2S8UgKymXSoUeZSIrA/wJ6fAfoU+RKfpejn7l+rpM0YhFH7+YODsYiLXkQPaqcdpP7R5va53bqpIvkiJGpJfgAzzeD53ESYLsRTH1pJTvV3A7ILFZ9/fLL1ffbSf65KNt0dpypxkO+IIsHacsJLyIYQZSm2wQ6ZGDN4zqjXKKpcWutPg==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP0PR80MB5315.lamprd80.prod.outlook.com (2603:10d6:103:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Wed, 20 Oct
 2021 22:27:42 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4608.019; Wed, 20 Oct 2021
 22:27:42 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 17/48] tcg/optimize: Split out fold_brcond2
Thread-Topic: [PATCH v2 17/48] tcg/optimize: Split out fold_brcond2
Thread-Index: AQHXu7V3QiaWniWB/U2Frb4I6NLCOqvciY5A
Date: Wed, 20 Oct 2021 22:27:42 +0000
Message-ID: <CPXPR80MB52245558D605EAE1AD3421FFDABE9@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-18-richard.henderson@linaro.org>
In-Reply-To: <20211007195456.1168070-18-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4265a5e6-1ca0-4191-c5bf-08d99418d512
x-ms-traffictypediagnostic: CP0PR80MB5315:
x-microsoft-antispam-prvs: <CP0PR80MB5315B43B117DE679ADA4A8CADABE9@CP0PR80MB5315.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +CFqjyTH7mnXJAPr9eNyBYvZG98HkBwIw2mn2iCtmfWAD466ySbxeKMBSwMArosGbqApmIvDoPITdZXYZz7V2XygglLu+ZzVEkLRfYum2JRa4vIfuYesYQ/yAb8XR6vtRTaSSmvsUif+xHPp129ASKcwKJdHrC2PmRGD7XJk+/lX/p9MlYI9LhsfL1tcgi9ITl9Ltdi/U46nQBwl7zOqJzJMBC6Br4Xr6BGP/g6oHZ4kDyhDxiK44zfgn3JLQOaW2VEUPZ/1rQ/HvsH8rRpdweTEAlLCAeZh3LbyIRzhAg6TC44sBFSJRGtz0t0no0CBgCGqrOXieN8r4mjLh8qHOUTmz4UkqsdGAHh2Q72UGP/ZJMzaaZ0xgEAGQirySHcko8LTYRxnh2GIp+YEc45FkgZ7rOeYM9+F7sH04+2w4PV3A6Y5RMa0MB2IoqY/Dqksk3EVymeIhc5A3fHp6Lc5KcvhmDxD4tOeDwI2iM18FSSNdzqKnxxQ7kRQMLmvB8QugkfeD3g1rzET4tWBDU+gx/VZNPHLELtlBpooHPrbTdFfSOqcGF8F9Bloi9lZZlTOOhd1TM/dmSNKFdLW74kmOT66xkhtlksxeFoEWXDwoRTPOWWEDgHQKgFpIRCtM714j5y2+x7VtU+UisTbxw+t+c1mdkCUa5rmipkAW0gE9lb+HojRKBPJQkAaWH1CZ0hhrdopxeJUcbrg+SJh3Y1139xhHOYmCu4iZ8wnXaOFJwcyWn1y1tmXsnAm6lg1VC5+CckXpmK78QXMAghj8717eUx8bwzs7hFb9aFFMl0VElk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(8676002)(86362001)(7696005)(71200400001)(2906002)(5660300002)(8936002)(38070700005)(38100700002)(4744005)(83380400001)(52536014)(26005)(316002)(33656002)(508600001)(186003)(9686003)(66946007)(122000001)(66556008)(55016002)(76116006)(110136005)(66476007)(64756008)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JAFZH+qUJptt2T7fYJyCftt3DFLjgAolhKhQDyoHaveWQFVvG5Qs04DehhAR?=
 =?us-ascii?Q?mDNlyOVYdGUDn9CuGIzKlcIgUmGU5tla7Vlv/mHfcQYMhfgrniA1L+2bHzxb?=
 =?us-ascii?Q?OCUlEQo/zyQJFbB15vF2xkXdnqxNt0YpZsRMK6lDIirSdTjaRHuEuTRnAa4g?=
 =?us-ascii?Q?fQSlpUreqjDw8rP7kdONc6/xg/7D7do7luATPi77tna0VKlDvKUKt/7pQSZ2?=
 =?us-ascii?Q?6NC3goG4fz5iVR4dHSIbijq2icKxMvsQv835ZAIPsJzFSwqdDTMc5CxIj5ER?=
 =?us-ascii?Q?ncISfBma+47KhKELpVaz+ucU8iR1BcLU5uRgvD+hfjkKN9JJ6uSz2DZIVDKw?=
 =?us-ascii?Q?r/lQdU9mlZ29eoo6hHT7up+NlGogbqXT85gI3l+n17bfQ7FC7mFzvMHDPh5q?=
 =?us-ascii?Q?Zq/2k39uGWhYgJrtDxeDGFkgKMEhTmIrVJJ8e1BW5MxEZ+PerImeLp77sfqi?=
 =?us-ascii?Q?/d349yRBU3+53gQFhoUJFL9qqIWgkpQkpeqkstFYb+xmWOKlgrXt+KFmpcd4?=
 =?us-ascii?Q?SXdCB+QhHTnVStpzA5NsOeWad36+TbOZjaL2EWmWjpWDWI4jgUdgXEU0e9rE?=
 =?us-ascii?Q?Yz9s78H4+s+XsBVZHgJHlL0O4tJuOt7qBh75H61vnuNoFqeYO2CmbDJsGMCf?=
 =?us-ascii?Q?OJ8JFL7z+1Lz2TZEXGVf2tnzfiUp/T+/8FW79QN4YmlpHEWpBL9GbIWpShRm?=
 =?us-ascii?Q?QHeX9UTTOoS5Fobl0C24LsscFxYNvu3m1KO/oLxweiMnqXGhFkg2VhoVQ/cg?=
 =?us-ascii?Q?6BBKxm5JTbMDy4fhmNfpZnu9oIRsXpqfPiXuww1q2/LmRNfFrf9v6fP/aHuZ?=
 =?us-ascii?Q?Exy3BMhReLyNnYMOPAJ6Ja/L/gV54OXcL1ZeRtkrB8t6sWcI+0qilSiJwUGX?=
 =?us-ascii?Q?l6Ljr6hb5NhUl+6lZ+U8renBk/GtfvOaqdWCKL3KowFOqYC9SCARc0r3Zga5?=
 =?us-ascii?Q?FQcujJ+8bYcIQHU2PInwijsrrjZ6J8o1xmeZhX/1AFfs6Ev93JM4HIyecreU?=
 =?us-ascii?Q?2Y2XX7vX/zizOHKk4Ne8/aoON7bVRYEQDOByJYU534/sghohJpFpSXd5feW+?=
 =?us-ascii?Q?axDvxc6B9b3KpwaMXXbP5zYr3tcnEnWtv//1c31XiHfFdxAYkjnx7kGHN/my?=
 =?us-ascii?Q?Z4wWVL1bFU5Qm/wGCbO8sxYKmbjQdsbNYP6bvEnl0ivdKc2oghlQrADdDnFB?=
 =?us-ascii?Q?gjyMwKGrpcIyHP6U09SIsTO3v8hNB4pTyYEDay/zynCNE8ZBHErt1QAIJ9nm?=
 =?us-ascii?Q?JPSLLx86nHR834EUE4Xb52xnzdT7GN3d/hi4z1uZIixypKbpjY23Q253nIw2?=
 =?us-ascii?Q?sa2e84KXIc/y3po0VXHJgZy4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4265a5e6-1ca0-4191-c5bf-08d99418d512
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 22:27:42.3289 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP0PR80MB5315
Received-SPF: pass client-ip=40.107.95.96;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_40=-0.001, DKIM_SIGNED=0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> Reduce some code duplication by folding the NE and EQ cases.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 161 +++++++++++++++++++++++++------------------------
>  1 file changed, 83 insertions(+), 78 deletions(-)

> +    case TCG_COND_NE:
> +        inv =3D 1;
> +        QEMU_FALLTHROUGH;
> +    case TCG_COND_EQ:
> +        /*
> +         * Simplify EQ/NE comparisons where one of the pairs
> +         * can be simplified.
> +         */
> +        i =3D do_constant_folding_cond(INDEX_op_brcond_i32, op->args[0],
> +                                     op->args[2], cond);
> +        switch (i ^ inv) {
> +        case 0:
> +            goto do_brcond_false;

I believe this should go to do_brcond_true when cond=3D=3DTCG_COND_NE.

> +        i =3D do_constant_folding_cond(INDEX_op_brcond_i32, op->args[1],
> +                                     op->args[3], cond);
> +        switch (i ^ inv) {
> +        case 0:
> +            goto do_brcond_false;

Same here.

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

