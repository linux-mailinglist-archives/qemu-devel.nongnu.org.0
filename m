Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D503A43989C
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 16:31:51 +0200 (CEST)
Received: from localhost ([::1]:46268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf10w-00039F-S5
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 10:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mf0vb-00079i-TZ
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:26:19 -0400
Received: from mail-eopbgr790127.outbound.protection.outlook.com
 ([40.107.79.127]:14004 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mf0vY-0002B0-SK
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:26:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oA7aAu43nmGZySmA+nBrNIXI04maVH7vFJN9ypeHeVHc0UZ8QmAq6yb81oluo1dryUubs6n3tESy1PNyKN5g/WL6BwN3U3UhuSes6cY6hpYItg36M7nBv00ditywz8FqRNaJj2DH7zJOgd+q/4JvBI9gCAIZO0pXuEQ3I4r/TI+DM8UK8VUoj3d4kMNgxoMQEg2TwXYpvdADqj2d03xBoQjn1cHVAdtEVDmHD6pyDeIdnddDxTZyNOz/fBwpskGkKS8yYmd3/lXcQoDmDNG2tG6y33u3iEkgxLnPo4PkVxZReqrZWDthAjCf3pK0WhAHrt75ho8DjxLfDMg6oMjMOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFTkHnazEfQLiPzAg7vbKd8DvFQjHKNLm6a7oOI1/zQ=;
 b=cU85IoX1FP6g/yAYm8yvUbqPKC+5WiCY4W8XeLRMxUg7IzkWcwxXns7McMKFBa5ESvn9cJpPEWiuSK5c4OtNDE65TG1rRzyutp3hvQC6WuUs6j4VQ+XBxlGsfYQB19kASi46HvuJjpEl74pVw1fj1nDYiymYlhftimRT+M/Cv0YmeB1xgI5JRQkMhmqyg9odQcIHytJn26CuABm49iXOUMcUGovYVp5vPcwutul9U92nMYPkihGomHsnvIWO7zXqc1jhNFyB/bsfKlCQwfBUtBKS110y7gffly/Bpqzums4d820SM4y7yHsxXqObcdoQkergBUc4eeJclwo9ZZv/PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFTkHnazEfQLiPzAg7vbKd8DvFQjHKNLm6a7oOI1/zQ=;
 b=FU3hVr1DkwACj4XI1ekHqFVpidYpOB/E81lx0k7fV5SzPc9I4FoUc1oisghm6GjDCdnIbPrkn6unGZ4lSeww0cZ66Z/6QhdvUvklAUirprujMmBgK9x9VVCNJUKXl4vnovserYhzMGXgRI5gi1TobZ+wWPLXft5nmMvAM3MWxlRLoUw6XSWGnzixj/wxo66Eow6TBlCGxZeS2vPfrSSwrSGlU7uwBJ4rhpKQse6strO8X9r4r6w9U92ZhHAaxFzG6GStrtDCVS+Izu4X8se2ikv8jD6+n83enURR14uSuD/0A8Y0/aquPOlxmeMubiPxmYrDNsExsT05TD8hop8TdA==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CPXPR80MB5142.lamprd80.prod.outlook.com (2603:10d6:103:c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Mon, 25 Oct
 2021 14:26:09 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 14:26:08 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 36/48] tcg/optimize: Split out fold_xi_to_x
Thread-Topic: [PATCH v3 36/48] tcg/optimize: Split out fold_xi_to_x
Thread-Index: AQHXxr96+ofi9bOL/0adPw7ec6C6J6vjyeuQ
Date: Mon, 25 Oct 2021 14:26:08 +0000
Message-ID: <CPXPR80MB522451793293BE9FDB45EF99DA839@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-37-richard.henderson@linaro.org>
In-Reply-To: <20211021210539.825582-37-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 16e5d282-b438-4d5c-7843-08d997c3634c
x-ms-traffictypediagnostic: CPXPR80MB5142:
x-microsoft-antispam-prvs: <CPXPR80MB5142418EA3973858251A8A8FDA839@CPXPR80MB5142.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: youn/6HFmpuwGeqyKnYS3WTcVwziq/4XlsC3OAh9HV1djgtJNWN743A17hemLpTd/gTTlC+KHyKdnElr+3IcCR5AvYnTfeZFuWf2/xhCgJfmcIjzuI4J1SMGqRjhF+H5PJRcAxZ8XLkf/U2KYSRxw8LHirvFqIJIMAldPQKEr2UOzmvMVuPWKOugVbK1nSA4zdS2Aj9eCONbQdEuzmtwvJw1tyHIxvPSdRLD6y9Ai2V/tfnZffLeE/GJgu9AqAA09B5DJEPVz/sb84H5JR4JYponNO635EC4fpqmfcHHKXwH47rLwxb/osZVywjMOKemAYFzt4f0jDf9XZKlRfuhdI8LIl6OUVjR6IZT5totKbKpxgnLd3ch+qEr7JQwn3jaHfqPZ+j6evuySuEuEBBv5JiR2SsFMfp6zU/ZF/LzJ6p7zZZRbKgFjh4JyY4ige2ufVMl5AA4HZtUi31UN53Oqr8ndauBp/IXnV8eQ7XyLf85garD/+EvZFIgRqVqXTY5WD9xT4laXeVLpLNR05yXffoNRzOiKLaoutpVkwMRJhyCToquJu1O1YKeLksuQAIll+BDm+mGSfBU6LT6qL3JD9Q0f2lgfv/BOwmowFu0vK3qab/9X4C++z6sVwYH/oGhNnpSZ4/QJBGGUK76wvXr14ocJFLHRtFMg7UmIXDgHXwLMrARlRpXUANVvdqDHPni/AefTDXt+AcqpYHWQGvqH/IdbYkMYKfC1o8yU3+0NifbgIOa4KV2v1EEMNbIgTg0eWh5+rqS67q/wWksiXq/dbG10xaebWeCEQHRO7+6JEo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(55016002)(9686003)(33656002)(7696005)(71200400001)(508600001)(8676002)(64756008)(8936002)(26005)(186003)(316002)(38100700002)(4326008)(76116006)(6506007)(86362001)(52536014)(122000001)(5660300002)(110136005)(2906002)(66446008)(66556008)(38070700005)(66476007)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qyYctbFJ9mDWWgEK88/cKeMTqHh1BqqLMOKxCPOIk/VEeuCe/zJQOVxR1zBV?=
 =?us-ascii?Q?zyUwdqmFGYuSw/40wjR8kOvzg8pcTBgRCVvkx6ML5iAmcxY7XQmGebZotkAU?=
 =?us-ascii?Q?HVZZAMWY12TKEbIXjxRgHOAH/gIkjGPwRttK9un+76OK5/YqiH1biTna4zAb?=
 =?us-ascii?Q?h5WQYHNrG3hBEw86n6FeACsnwlVykTldGnFZ8euzXES1YUQM6Wt5YI944SAf?=
 =?us-ascii?Q?zn7X75Mxp1+K0/ZKBO3oKLpLoYTrzk1WNT90c8Ac0pXZiPcji9S2N7pHTdbr?=
 =?us-ascii?Q?vEGsBHcMBwYySDvy1VYQqxHFI7WxGSj608ZC/42YoFsZZLkghXG0eXN7GQG0?=
 =?us-ascii?Q?Cl4dIvnSiPER3lpVXCJsPcPv9EpaEGR/DiKdrt+6ws3zfhTR48lj3F3M8cjJ?=
 =?us-ascii?Q?vBa1hk+Or9BRQZY9o6VmHY9wBtcT3gc6yN9IdNjcjHabeOni9GRdlUwBkE7p?=
 =?us-ascii?Q?pr2F9Hh5yQ079ZtSRE2Y/hN6vEeRU/5y6iTsgGljCe7ec7wYjLegDGOVOjn8?=
 =?us-ascii?Q?W/KBeNJys5e7hb6s70eFuv/1IKWD2NhrUyLb6Z7+luaQEZhJzbCGlxI43oq3?=
 =?us-ascii?Q?rpOfLkJgFGK1ICFQ5rpECCsn8QKvU8TPF58eALyGCSaxOuwA229tBYs8QGkC?=
 =?us-ascii?Q?L3EldXRs/txQ5xT3G25+E/XXi0Xci7TBmWl/dK6HhrKcivazblhkjyBUSNkk?=
 =?us-ascii?Q?UkGQCWVi0hsRwKRRlu5i0oehINkuhgLt8O5h8PRac/KD/MhcU7TqSzdVG95/?=
 =?us-ascii?Q?oZzm5o3fWdUHFLhwsN1IR2B4m9Vr7HwgJz05dheMnG1EuJtzocaAAlc5F3Fg?=
 =?us-ascii?Q?ALZIYxdCT+Otl8RRf8zhagjZsBrDo9egz8no6j0JDiSYPdFJk6f1W5/9C825?=
 =?us-ascii?Q?Px9Cp0Sv3z0Oj0XFlv94oajj+kYsg+K9Yu8qtgvX63e/b79cKbx7WP2j/Jjs?=
 =?us-ascii?Q?h8mZofmSzMXCZZvLPub3aI38QkJIzHFX5qx0fixOUNGvSPNHhZjcWIxXeSG+?=
 =?us-ascii?Q?NzNacpW1bpo3ENJcA7M3ABdnc9xew+enjBxpB6RNRiOan1Hk9kb9uJOoeeaG?=
 =?us-ascii?Q?l8YQAVXn2s9gCvmt56Ht7RKocYA1g2CV3CKLNTJSQ5zjhPzy9OXHmKhjYOEw?=
 =?us-ascii?Q?PYLbtGU9BmX4imAOhL1G8pQQg2otxzH71XweNO09iteEUljyBHiWUnh4vDGm?=
 =?us-ascii?Q?htne5ylwta00Vkl54y9xtaog4djNvnKd9zG52KpK1fpIwuKfKF3je0Ayyi/U?=
 =?us-ascii?Q?56xvxtgGz9WffRZiQ3red6NZDi5rH9caMYAhb8F6C3XA6JOR3XWsVmz89t3d?=
 =?us-ascii?Q?tvRaQwWIPAAthMRGj3BXrv0FucHQsfeiI9ZWgX/LVoQFzppvp1cE5XzMUdir?=
 =?us-ascii?Q?MvgvyF9dBW0gCwdCfrG0JubNnIyqilYxcgINDuE3BqRFl+5xQuCYm477w39n?=
 =?us-ascii?Q?kJ2wSP/buH+QR6D7bhIC4/z8igKBKHYOxge6locN5pWIK1Hcf5CXpeVddmeP?=
 =?us-ascii?Q?VdIrk4co+KVntoS5zz0FlkYSVV/27m2exUwf00Bbi6/PnT2CrT5ByoZer9PK?=
 =?us-ascii?Q?9WqdcP53y0fTWJ3XUylfgZyelZk16He58+L3Le+v/f5dVaq7V5ywMcVhAD8Z?=
 =?us-ascii?Q?xQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e5d282-b438-4d5c-7843-08d997c3634c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2021 14:26:08.8559 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gvVxK2YalKdRnAh4fUqkKukdSNBzeLgC+sMoAfruhA8gaUOAZ0ifb1m/2zwszlrWKiOcQgfETpkA5h619WdxYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPXPR80MB5142
Received-SPF: pass client-ip=40.107.79.127;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> Pull the "op r, a, i =3D> mov r, a" optimization into a function, and use=
 them int the
> outer-most logical operations.

Typo: "int" -> "in".

> -        /* Simplify expression for "op r, a, const =3D> mov r, a" cases =
*/
> -        switch (opc) {
> -        CASE_OP_32_64_VEC(add):
> -        CASE_OP_32_64_VEC(sub):
> -        CASE_OP_32_64_VEC(or):
> -        CASE_OP_32_64_VEC(xor):
> -        CASE_OP_32_64_VEC(andc):
> -        CASE_OP_32_64(shl):
> -        CASE_OP_32_64(shr):
> -        CASE_OP_32_64(sar):
> -        CASE_OP_32_64(rotl):
> -        CASE_OP_32_64(rotr):
> -            if (!arg_is_const(op->args[1])
> -                && arg_is_const(op->args[2])
> -                && arg_info(op->args[2])->val =3D=3D 0) {
> -                tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[1]);
> -                continue;
> -            }
> -            break;
> -        CASE_OP_32_64_VEC(and):
> -        CASE_OP_32_64_VEC(orc):

You missed adding 'fold_xi_to_x(ctx, op, -1)' to fold_orc() in this commit.
It ended up being added in patch 42, but it should be here.

And should we use fold_xi_to_x() to optimize multiply and divide when i=3D=
=3D1, too?

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

