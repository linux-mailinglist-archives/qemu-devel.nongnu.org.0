Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBBA437C53
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 19:56:02 +0200 (CEST)
Received: from localhost ([::1]:55012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdylt-0006qz-JD
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 13:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdyTL-0007h3-4X
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 13:36:52 -0400
Received: from mail-eopbgr820128.outbound.protection.outlook.com
 ([40.107.82.128]:16536 helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdyTJ-0007wr-6F
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 13:36:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yj/h03CuV6CSb406XH+x7b8FHm5z3+ccA3dma3iT1nBCPktYZjuYIiUyp9f3rf/RG2Tjcs4064sWp3zCbMG9SSWO4ljlyIUm5/wCAeDA3wGmkWm6lGqozxiSMw20jRHmA0HIKwrbm12xnKXzlt51xfHT5BiR4UQQ5VkXujFdDvCF88c/FVRPAI1V+C67NfFZK5IgGQgWMPRa8MNEqAKDGnBR2B1G8Yn/EJBnyFo1NlGi6vXM7hnRL33ewBK4sxN+blS1Zlbbtaanrf9b+shAVtMJzImkOnP88wasQ2XkwcUO874GCb9vxvlJBQbgfPeZV8WT1TbZlA0U7VEY9xbtRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtPlu56IMCWu32K95e6ToMRFrdyphYlxfB8u+dBXH6U=;
 b=WsYPGfyF7jiDyIPo+Vp1clMhWonSk+tF+jvLREfoCWgKACadTp7PS/hmWAJM9QQBZs1lzfxXLlAWcivv94vAuDcEC4vp3/ZPdMYKmKFO/xJH0du50sjWH7ybsvF8CUrcWn4aiXaGm1iBDqi7HYsF4XAlVsgR1cnUiIDfof9/zWXUJ8C3BwwbDoQG5E4vtyLGB3WCatPBC+gosTpBwr08VMoadzENgNbzg8AAubZoDV/nkKtr5ONrgAI7j9DNty+Eo2CiTb2ThvTTn5miz6MVMF2QEoiAy0jciKWrkTIACS+4BwJJZJXO82okj8Cj/zAERMIZMcrTf6jbC2RWsBohYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtPlu56IMCWu32K95e6ToMRFrdyphYlxfB8u+dBXH6U=;
 b=ZSvAEJXRHNnGxtcMuE2Did/J03r69FaZer4H/impBifGKSxJRp6XvyXXQr+/hZdGwv7YAUZZt4SO83pomamstflPZMPrkdBU+/zADeKYutQGJ4woAiFjyeueFwRm+IGQpDvc9Y9XuQ8L30Zhxge0+meGpXqGWuo1f+1gjEniGQE+hi7JPIz8MEvaMHmt9ApPTK6hfaEEBUxJUPCZ8CV+6f31kviszYRngHYV0J6unSEQHC0CauYydT28wZ6y7e6hRIl0qM8ZGvdmYBCZf2CpNzsAGj10VfMoYz19qZ6aPQT09sukq0PIn+0amd5zDu2npSHnDlD8dUFIOszwZiocRQ==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB3924.lamprd80.prod.outlook.com (2603:10d6:102:38::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 17:36:46 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 17:36:46 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 28/48] tcg/optimize: Split out fold_dup, fold_dup2
Thread-Topic: [PATCH v3 28/48] tcg/optimize: Split out fold_dup, fold_dup2
Thread-Index: AQHXxr92dzFcl5OaQ0e5X4iIu5LlUavfSTHA
Date: Fri, 22 Oct 2021 17:36:46 +0000
Message-ID: <CPXPR80MB52240C18DECC2179B64A47CEDA809@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-29-richard.henderson@linaro.org>
In-Reply-To: <20211021210539.825582-29-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c1a78b2-e65d-4ece-eccd-08d995828535
x-ms-traffictypediagnostic: CP2PR80MB3924:
x-microsoft-antispam-prvs: <CP2PR80MB39243FB038D7383F9D3C16DCDA809@CP2PR80MB3924.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:400;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bly3CHA+P/wJcesqiqPAhDvQW7XFyi2tHEhDf3sTIGoh+9VIPSqkPzIAdSWSsdspuFSGp9nV3cz9ZD+EJVQ37sGnqGaptyg+FbZt6tf5m7jYGLc+/KqUqp1nAoPYmRC+KJz+15gzQ+Ft9LwkAIgsn1zg8m6dhtrp4Ws+dizC/gEVDxqMOoYbF3AcYStHKB8BiCF/T+OowB8m/mBWDKjUtFvLHMwt0YeHVYL1aEOVSVwG/ZM6zLIOvn3DTLAMSjLnxUIS5N7PyCdOB2ACmmKQ3JEG/sWCglVGeM7BWyVZvdF8/5LJQ3kPH8pOHQn6g3KpeRZeSibCOtknQY8MdiDgZ7776Ekok26aS+sibKX+eTU6+ytj+eD0mAHSvRyAOSz9Y9RTzr3tMTlriy4k4UAIfbsVoQAcXrBdsz16wFaUr11HnlEpVGYj5ucxLH/CAZAVjQqKI7Ba80G1qlqo+L0jlbjHbqWAbH7GuGv9ehVJumMbRm5RLWLDQjn+iyOH0OeEZqPUA2hcguePC9rzm769ObXdRfXnRFSX8MnxDEZwk5i+Mq7oMdt/OXcWPKdHpchiC5gY3tsaGyCipEjsqpfCmsrNTI0rXX/0nKcqQU8R+kNhVD0MelmTYcDtSajbZ3XhJUcthtZmf4W6rWXkHGG/Hdzr/5qsS+Ek+xNl1BYkWJnjYCjBod5S5TKZsHlhwD7SDlG+gUsMuCFsgiBh/Z+pY1fLIev1hyYuFVEmKeq5HY64OE74TCgc1RQgGtcRGD2VtFLrNZz6aeNvnG03ZI6UY4QDVD8DIpFc5sT6pmBMmOM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(4326008)(186003)(66476007)(52536014)(66556008)(66446008)(316002)(71200400001)(9686003)(33656002)(86362001)(83380400001)(64756008)(76116006)(55016002)(8936002)(5660300002)(2906002)(110136005)(38100700002)(66946007)(26005)(6506007)(558084003)(122000001)(508600001)(8676002)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Pe5SBQ6XyaPt7szKI7c8ptNvcDKyfUv5gmgE9d6p20K7akN2aDjo5eT1gOtw?=
 =?us-ascii?Q?77RXZctvWWiORPgHQVJUhP500bgJObymjRKGEAzpl/dE/o0m7zh6UbRINuJQ?=
 =?us-ascii?Q?//z3Qxzlrpsc/yLtqliVMVcsiCNb4zQnGXC+xGMdo7Q+sbR2tZBSi5IuXO6A?=
 =?us-ascii?Q?VkHHMbazvjsF2IDeXJkUo8y2k6NpTYaJ/B46rXJ3l8+0E8zlAwL6jo5a43M4?=
 =?us-ascii?Q?bkjvotGJ3yKXZn7PjVsP5NRSOjsn/bVt1vkdtzn0S+2RNJtbWYEeQ5F33rl6?=
 =?us-ascii?Q?5WoXJ+/Or+fNPg9aIpH6rew/7tp283ZGumtsg3X877MnaVRRcL9KYVm6Uqj8?=
 =?us-ascii?Q?5ThtuDujsk5PfYP9kaDnq2aPSJQcM1skNp/mozLT0jdA6pTbPdRuSlP3mbT5?=
 =?us-ascii?Q?r2b6RyjRIVvi//MAVwNRiuCC9JF2q9pHajwmXaDOA0QkueqtR0oGfdFOIWWO?=
 =?us-ascii?Q?6hEOT1qFXIgVwEv8docz1oKdkJzRrwe2aJ/nzXgiQ75HmUrH5dy3iHLpuABe?=
 =?us-ascii?Q?sgEc0v0Xn8O4X+LtK/7dA9i5ETppoJIwJXINCQPxXyhq2o64QZrf2ZCYtJl3?=
 =?us-ascii?Q?Ng85o4Ams9HArQlqtD75yxeNs9QLs3Jnvts4aNBI3QqtuyWH9q4WRCjFFpxZ?=
 =?us-ascii?Q?5+gv4YGJMxoev+l4KKv7dM+qC9KbPz3gq4bcRECUZHqL/yC13aHvFOF7KQa6?=
 =?us-ascii?Q?aPC4glDT92Q1Xm3iG4HDG4xAbRogVgKNzm7WPv4zF28WQ3ArVD1eSqi+MkI9?=
 =?us-ascii?Q?7K+C9P3kAP019Gz3amvjCPIoXzoNglbmMcfDyPtLmLhpCbeMFezMItqUfZFB?=
 =?us-ascii?Q?5Sv2vJdQ45uZQB11JT0ZdHszMtauhjA86w5Ah6Pd/sSRYyQ8t7QQjH0rDvEq?=
 =?us-ascii?Q?eV68UEJKqGWHHxROKDk0JHd/YqQUIvr/jh+TetMx3nBdEN3YPbkYkt37xHcQ?=
 =?us-ascii?Q?V0RWTvKC04TIoOaPad4z+X1lhJsJ9j6rOthesOctDrNkhzKP/Lw7hXt6rq9Z?=
 =?us-ascii?Q?GXosjkRhGYloFT/NPL4p/Jg3OVeWt+XEQ6oEF2Q3vzMThH4Hbzqzd4lX0OML?=
 =?us-ascii?Q?JeTem5dIpTiY9QsPkltaFio2erCDyW/80FzjSWmBLuD8mN1ZHxxcw/X1S76V?=
 =?us-ascii?Q?fS00X/AJvGtIoAdCWuGPYbJ2nLL7WVGpAtiWgeF6Zqn87JhAi7iG+PRAlus2?=
 =?us-ascii?Q?jR7p4PrViovDqK+ZUKoGgxJC23qztk5Gjv0NXYyABuJtUbLFjILJF6F7iNZR?=
 =?us-ascii?Q?jx/g+qZAnDa3yGi0OnB3OnDljNs0ZrRZiHLse2d9psIB7abY5wi+lsoCqoMJ?=
 =?us-ascii?Q?0zwYLqjbZ0IKH4EmmSueu+TvLcvliUfPBa1lh/xd7Jl2Ou7mhp6+47BZyX9Y?=
 =?us-ascii?Q?dnEdPE+aiQ8cpkoRhAHmPnqpgjGXQdg9oHRZQORuHjh4IIlm+03Bj+O9AB6y?=
 =?us-ascii?Q?sRjWE+o2uPo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c1a78b2-e65d-4ece-eccd-08d995828535
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 17:36:46.2596 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB3924
Received-SPF: pass client-ip=40.107.82.128;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-SN1-obe.outbound.protection.outlook.com
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 53 +++++++++++++++++++++++++++++---------------------
>  1 file changed, 31 insertions(+), 22 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

