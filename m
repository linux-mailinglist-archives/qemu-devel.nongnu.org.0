Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F254355DE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 00:30:35 +0200 (CEST)
Received: from localhost ([::1]:53954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdK6T-0004ik-Jx
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 18:30:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3P-00023E-Su
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:23 -0400
Received: from mail-eopbgr740130.outbound.protection.outlook.com
 ([40.107.74.130]:33335 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3N-0006fG-97
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqnrfCVzJ8RT0ihztH7aORXpSn0L+4IIJkPsYxdMYZQRZox5uH+IKkHmc9QU3rfz+BhP5ZeTAxZ6IlygtMuqpi6AugdSp1JAuwi425YLjVgLGk2uyfd3KJowsFHVY0PPFOQBQ0MiNtRGSYiJl5hEYzRg796kSiGZ7sPTj4+a9G0Sb1zyyvXsjyyhn0fVq3KXAcYjaVCs/pEddetQEW7LtCM33rqbhk1+bDq81exKg/hVj6OjEo0weC4okHKp18BJamZmeyzcJDoKjEQKSGOvHa51HOnwNkGJdumBFJ7eO24Kkj+Cim8l6qVYUNl70PeaVo1uk0vg/Md25InKzIkqpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aabQE7xOljrHyvJGZelxpDC9a2Qdp+032yjbSnwHELY=;
 b=PfitLR95yRoBU6ltKbe7D3GGB3uxwyvHUrk3tFuc3Vced0OpyhR4xYXbbVfN1I3CI4NJxa9oXNyp98ybOyphjk4Drs8WhS3vavYAZrXz1V1PXP+oSl9xXzOUW22n45jK8xJsuSASEWJ/jWrEuHuag4blux6YaYLHEDo1DlbjxeODLGx0SQp+EH1swi1pbBVB+NP4z2B+sRw4kKJgEthl5gO8x8mpOw4kzmaO0osQW4i9wG1JS4Qpc5vmm19tO9kWdyemU5tAf0ssvI3fU07Y/gyIFlYe0MrdfEcrfDQvTwyfkwJnfjjdJIGLKv4o8cRBMcDBPwb7lxRvRzsFEUSffQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aabQE7xOljrHyvJGZelxpDC9a2Qdp+032yjbSnwHELY=;
 b=at1tlf+vdgHjO2ytZQ9gRkql62IH4nOaF8Lu4L4KTZVNlSnMCzwhnxWjpUXceKiyfPjwDMaMhfxTj1mHUKNiqE385Adcv0IPCg+udpKojKSOhYModvIXdy2jBPgYVnSMNqgmRDvW1ld2MNvxm7lZuqLsvhBQ79IgTprbkchNxCiZSnNhI1VohLLaR74NUO6f0ETQQxOOLERmyF+SUGnxs1iYEPOfSWaLZwoSoQ7X2nLT2O0J4XrZYrtq26L2sBRl8xcrP4SVrPqiTAfe/eQCpXuKV8NDU1XKY6g6lSeYEGOhjl66biO1JIymeS1pv3Y0VeGTVx7iefLaA3A3o/g/xA==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB4482.lamprd80.prod.outlook.com (2603:10d6:102:49::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 22:26:51 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4608.019; Wed, 20 Oct 2021
 22:26:51 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 03/48] tcg/optimize: Remove do_default label
Thread-Topic: [PATCH v2 03/48] tcg/optimize: Remove do_default label
Thread-Index: AQHXu7XGFYh08C40+kiYHBBEUbEHaavchNlQ
Date: Wed, 20 Oct 2021 22:26:51 +0000
Message-ID: <CPXPR80MB5224D9166B5222BC5140CBB0DABE9@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-4-richard.henderson@linaro.org>
In-Reply-To: <20211007195456.1168070-4-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2239a29b-620d-43e4-50f6-08d99418b6b6
x-ms-traffictypediagnostic: CP2PR80MB4482:
x-microsoft-antispam-prvs: <CP2PR80MB44821345DBDFC77A39DD2883DABE9@CP2PR80MB4482.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K4TMIZjJWD9Doe8CvacuK3MqC+JuYkZYiOYDwDcyf9HY/eDSI3BjkseTaGwh/UW0/Vv7KU90qTVpHrvE0+0tPEn5FzbJo4dRtQaFLsKtLfpjVeWsXypUTdyfQGeMRQlklvYcYeDCYBA65hrmg9DTXfp8ieAFxV8IkvSqWmOuhkgj3ZsZGxcSRcQ+ZobToAh2Ggo8S9M6cdVY0x1XhtzV+5CHjMKocA1IRg+JLUtH+3moie2BFJAy2g7AL4LJQKwNpYn9gHVIt3hg7RqaTykLfL5UNS1W+1mRjMBGZ/o5CapJwDGfOIqB0PfM2h6eYNlsNYh2q1HFXojwP/R7tDGP5sMYIrOxUyX3aMUokFaWL3dzdVrvWmg7V3gimFZSRgdSqJLPn/x6bLPUgcQq+fINE6PDv3dy2l3CiXTUJkGOV/+A7tvzQxBollF+MU3JolbIh8K6wh+614w0ptK2GJkPBJ+ykfsr8YfU0GtWHe1CM+p9JLtjcAOptv+3VyKOOWX00c57ufH1v7/UUABYJqvy/RGjwKzD3nEmN2Ljt9+E84dii2DPCTYJdPoXRXOvlqzXxUkjA8/oDEV06p18fsU3WmOd6nf52Xp+uAmu2jVaYIuhpOdz+NhA0Mpn1tAY8EzT/QfxnrAm2h2YwP1Kasu9ohDzk3LokLix2pObhc5d/Wqtq24tC4s9NMB6nMQac+QqcHBv3qBiIjnAOvFX0g6mu48oZ+WbhMZ6IXBEpQsZu8bMnmUdD9TYDXIBcnnRDUvP9M5t2IPQHnzGHwNw9r8LW/4XbU143uq18eIsc1vhhoM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(66476007)(64756008)(110136005)(52536014)(122000001)(33656002)(316002)(26005)(2906002)(83380400001)(508600001)(76116006)(86362001)(9686003)(55016002)(7696005)(38100700002)(66556008)(66446008)(8676002)(6506007)(4744005)(66946007)(186003)(71200400001)(5660300002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aYa1pbCN9e6yvyqzxGxWQotSbel3+yMCpVlaRrTu/j2Sz3p8q+ZOzHAdI/bg?=
 =?us-ascii?Q?GQBx4/12KObW2jOCQjB/To6dKi7Eubntl3JaQWHT/bX7LjUOondqy/D/VS9T?=
 =?us-ascii?Q?3tu7zZwPkcHelGXaPSAVG7uUnEcfmo8I+XteujFRz5PTpj/JrLSouH0YAqqO?=
 =?us-ascii?Q?HfaE7LVtJXSpV6P6IFO727gyGoN3gV1VtHjP35IASRaZKvU0Yrjw0uVuW1q0?=
 =?us-ascii?Q?jcKokQ6nrL/CQLpnHl3B1Rq3LOHRIKG/t1bsoPex0N2sTPBdk6XHXzpMZE9B?=
 =?us-ascii?Q?gUOq1yS4/QtO7FRJSs+r6G+WIIsicqNH5zc+O7ZwLPTAe4aMAqpIm/GCpEfH?=
 =?us-ascii?Q?KtPFxkjg3DYpvkpDmD1EEwv0N1md6itohw9iXSVT7KLXtKJE5dEC0GsGqe4q?=
 =?us-ascii?Q?S00Zx3ndVVCfgW0IzhUptOBgQXwqd1EhH/ih9su6qwBecf7+tMw/EHRSWxIV?=
 =?us-ascii?Q?VGW4Ql4+j52sYkqSxCEZUlM7yj5EkaTdQ4TPR7IaD0LYGfY5SlF1wX5RQZNI?=
 =?us-ascii?Q?WePAXd5IQUZGlbrjMcu+J5F9IydU2YuCrk4+l9yXLwNWDbWzNjHggFH3ac2X?=
 =?us-ascii?Q?4IQgVp5cud7qWlTWw/yzdMIhmv1N/HpEt+g5pJIOQUq7XrAu7Vkvtwk+Fal/?=
 =?us-ascii?Q?99Nlm96/MbgU8xf7w6bvhPNfiMv/H6riHA+NNJqkdLWh6Fn//YDJ8n9S4vLZ?=
 =?us-ascii?Q?412dpIwlFrKAOYR1YOM8gGSt9g9Bf0PXzXRne8s8FPf7KrhulmMWq8jP/UNI?=
 =?us-ascii?Q?2/ztD+NixxLfJicNezK7Z3Nd1yrZmF0722y/Bx06AY8fbazWtWfrZAdHfvno?=
 =?us-ascii?Q?R4+wdUebImhu2Tj5ldfNC48Lsvk+PP+ucGG/9dcdI1MQ5N5TfTCktcNpB6xw?=
 =?us-ascii?Q?aO1BT+oPwpcEVIuOGddeHl+oBjKK1qiOl6WLpS7t3AfWWoYL2/Syqr0TUYeF?=
 =?us-ascii?Q?i8YdpJ6XYmhr4blKmu0ScmgO5g/bKPUdtCReVsO4szXu2GhjHzaGGBhlXPDC?=
 =?us-ascii?Q?wismd3WzOc3JN9hVAL/BrdoUqNvvjaHP4Nn00NuVPI8mfbz2qTNguj99X40M?=
 =?us-ascii?Q?8oE3eKEUoDHtyigG5LtTzo77GOYxw1BomUu0lqgre5zdRjFzlUR4AIkk0sHC?=
 =?us-ascii?Q?FzScWd7dyni3wU5yOXKyZTinXWwi5M1VGbJVVaj4r9VRn1/btU0u9UVBT26+?=
 =?us-ascii?Q?UH2xaU/FIyrpm0Ud1HqfGOZXPrYsBGM3w7nkNnN9vjc3R1BMR9901xgDDbhQ?=
 =?us-ascii?Q?Ap0B51h92Lyhx5Px+4dIT/PUpCS70vavhSuuXJ2JgFLieLdAQnW207ydRIfd?=
 =?us-ascii?Q?6RMcmbM4CfPvCWhbnp4xYLNl?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2239a29b-620d-43e4-50f6-08d99418b6b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 22:26:51.3544 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4482
Received-SPF: pass client-ip=40.107.74.130;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-BN3-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1,
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
> Break the final cleanup clause out of the main switch statement.  When fu=
lly
> folding an opcode to mov/movi, use "continue" to process the next opcode,=
 else
> break to fall into the final cleanup.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 190 ++++++++++++++++++++++++-------------------------
>  1 file changed, 94 insertions(+), 96 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

