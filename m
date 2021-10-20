Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B947A4355F1
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 00:35:43 +0200 (CEST)
Received: from localhost ([::1]:34634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdKBS-0002Ll-KM
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 18:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3f-0002Rd-KE
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:39 -0400
Received: from mail-eopbgr740135.outbound.protection.outlook.com
 ([40.107.74.135]:53168 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3e-0006qY-3w
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fupNvn7Ix0Xya61qKUrXqrVqEcJAEFDKxFGlnjCPv+rtwb1fhND4WrVSHUtRiAKbi+fElo1N2j5MPjm32gjETRBlRlx5LD/TT6Z7ZdcoN6wCy5kCSVb6IMnLwmoO4JJFS0LKogdrz+GsaXlujBXgFqLlFVAqNlfT345CJ9SIsN1w2Tg6oWA/X4YSeaXPtr/5ZQfglYNTG/LZI1NeWfe6PWLlXiwsTlgNuVmzIEBdrRof4eumOfwWJ2rcWeY1gVcBBUpQpwmq9jQPzEO/mtbjRA6UsNXhKGHdXVe1amPCVMWRs5ERGnD8bxz/HI3ddhPMNnc0951A+RdH6Pt9B710nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y098jx6eTUZJfs4xXodAmu4lX9UTNwMnH0ZtWCglwuw=;
 b=VTYAlbSkdvGz7ujLK6RpBHHh0Pu9aABJ5+Jbetjdcz+YRPSjGQKLPza3UthQGTGLXEgUpfqSXkwwfEs0Ws16t1A1/z09C5eNRwXdthdS1PzJ80LasXokCCQtq/ct3TXZo/c7QG31WQFbpUq1mS7WOQIa3IvezTLI7xAFU3Uhive/mXym5hsqYkhf7o6dktNrBZI5S0WAjhms3Pyxnkl4AhxvvJ0Ft1yOjIzOmDIxznote7nOvyBqoggj9AxCytkBChGvSgyzoIDDuRcnYOPK3WO/xruG1U7ROsT2BHFASOLIA12RrK2p7JMYZFTkwmtgTFUqxPe1TvzTiJyS5OIqZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y098jx6eTUZJfs4xXodAmu4lX9UTNwMnH0ZtWCglwuw=;
 b=SbSvLJM6kXNkbiH6B/V+YXCL4sMDXaGRRgo4aW8rxBLosK4N2NzMZAloAByqHztvrm6byJGVVFF1YePPIwkfl+eDaschqHKkcHW2oQqjyvCZRvjVtLMzAGYJWanTuRTxSOd49oFnhkmLBWSBQl2tehE2gjQXYDehU4Ko8CTSnzBAWiGgeo8wLXRRL1/MXVCKEk1TLP1dsWEO/mPSPA2ot6JCnmOMLFMKtUgiWYTs/akFoDTuhcnag/GkXxXcpXxhUbIhjg22VJtWFOidKx1jeUF/rro5BadaWwwpdEm/ZtcWew5JKbJWRHu/yBDrC6MfSK6ixMr2HGQAMynQDeV3XA==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB4482.lamprd80.prod.outlook.com (2603:10d6:102:49::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 22:27:21 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4608.019; Wed, 20 Oct 2021
 22:27:21 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 10/48] tcg/optimize: Change fail return for
 do_constant_folding_cond*
Thread-Topic: [PATCH v2 10/48] tcg/optimize: Change fail return for
 do_constant_folding_cond*
Thread-Index: AQHXu7Wea3Vd1QE480qVzwWwKpIZdavchoIg
Date: Wed, 20 Oct 2021 22:27:20 +0000
Message-ID: <CPXPR80MB5224B6854C1D6AB82C82BD60DABE9@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-11-richard.henderson@linaro.org>
In-Reply-To: <20211007195456.1168070-11-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae3f507c-e1c6-4b16-ab75-08d99418c849
x-ms-traffictypediagnostic: CP2PR80MB4482:
x-microsoft-antispam-prvs: <CP2PR80MB4482F66D11042DDE087684E9DABE9@CP2PR80MB4482.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v7IFm/XJ/oq2JhLNN6+AdkJClmKR050ce7JweTNaW+3Fw+yjax0Ua9rfRWZZ42oo2CmpU5WhWIhBnb38I09DT1CA5h/mNMfoCdn8MLgIDZSQAhh3+7Lx9FCMDtqvpq/EKkfK+SrKVi2qDDxRUSXtlNxyT6rb+h1V+z8cgKsXn+OJKNsfbw2ItXMDPj//EBI65dDUOIVDdkCTxMWnNzVN2xnK902PT9oC+mHf57VLC3zdf9xSdeXeTl2A7eVuXOm8ihTAD5UyryctybCTp3fttupwcELMC/6/nbW6LGe3zcVkrxJUULMUxoBnrwW/wVELvdk74kEXRhAfesYm8AaN1lKKcvVWKtO2XzMq9S9CotaJKCLStdcxVigiaXOHfwFFi/kRRpdSSsj07Uq8e3bpHrrhPJRbVw/FffGQIVnx6XUPSW/UkFdYa51FRkKM9cD6XcS/4IEhDIFqvxEF7wt9oQNVFBYUPcDCszPOKnnfA//1iDboNEQiaEjf1CcfU21M6fsoDth+GFLMvdaHMmqhpcDYSNXFYMDTePpIEbt6BRn5H77BWWxkezO3R4qZjIEvQDZbe2Q/9xSnCBTxCUuDUZn5Q6KqLWEHry0Aa1+DbD9ki3kWvd7PoBKTISZRpJhJ3zsRnl6jtwMeG4EMl1bRSvAq9MbCc/vCmG/ybxK4j0NW6j8TSYKdodajjj1F4ECoiEnmRt7U568bpfdTH1jPrLqtlD62MUcn8oIomh6/KpzAslat0GPy+8mDagXk2kRW+3DqrWYD/x0on809p7WxnmFXN6xFHf2yQPTv/5oKkw8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(66476007)(64756008)(110136005)(52536014)(122000001)(33656002)(316002)(26005)(2906002)(83380400001)(508600001)(76116006)(86362001)(9686003)(55016002)(7696005)(38100700002)(66556008)(66446008)(8676002)(6506007)(4744005)(66946007)(186003)(71200400001)(5660300002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pmDnaZvyXg6bggM+G4R4RosFmUPJpND7Z+NShP/+aVC2cmeoy96kuP9ShKEQ?=
 =?us-ascii?Q?Ff9T4ejCeL2qw9/xZDo2QUuQLV1hqCY2mEUGeM6ban0cufu/18OW4gz2Cu7A?=
 =?us-ascii?Q?xLNXD/tdaDTnEwLWgqeIw/sU8r6o49J4AE6vNTmw+H/jARDcUZo/q+3FoB1M?=
 =?us-ascii?Q?/04Y1uoUiKeaEv5AXWaYnwO9ncJer+A4loMaqNfmaUre+C7ACg1xtBKGTrcD?=
 =?us-ascii?Q?2Y7Z0ylgWGdBJLqix32mBXl3EL9W6BSFhVumbOeurUD+Heq5RepNmyV0kRh4?=
 =?us-ascii?Q?jfblDsMs3tPg28cfXckZRaicBzu1gFpvOmBM/vfLKy8SyLAYnXwz/nk+cUek?=
 =?us-ascii?Q?IkzBGNHWA9fSsaN1850Ild0cIKRAlrVyIEZvi7zZhd8e+fcKmw766DWhyq5r?=
 =?us-ascii?Q?JpY7xDkbAP6jYH8iNA5JbGyutTJkT0ZYpVBFTEj3XboQqfXGJVkfj+SCnHpW?=
 =?us-ascii?Q?GYbaphofytQLPva/+wBP+eDqvVQxM0+RsDbQgvacmJZl4r3sVkPlUEehwd+u?=
 =?us-ascii?Q?2dqk6cxFPw4mVB4dRWBh6Tode4Y7W/Shd7kzfj+N/xt1mb/MVPS99r3ism54?=
 =?us-ascii?Q?ahnFebEcvkb0PCJR8mynJTk/8EmdURllAnS8JlSWkf+gWMz5g/TpAL0OaU+d?=
 =?us-ascii?Q?QtgzDNcbVa8dHSK3SZOFP5LG80sbF9UX2fqY7w69jRVOdZp2UhX601pgeEyb?=
 =?us-ascii?Q?KJZqKx7I5hYLkC5kPgH+DiloQSWfluLx15GFWHAnevzGyQVNBbwEKOp/r2yl?=
 =?us-ascii?Q?VWHzMhri69h5LsvI5CKQEqbpPYUhycyGVNOMNZDA297Iev/bPgc7AH7wpsd/?=
 =?us-ascii?Q?WyksPQBxGn2z7ZiFLV+PTD1XO9nc0TxqI0NbVEDNrkqyBrU8oAPnOqJ/4IXn?=
 =?us-ascii?Q?tEnUZJwzFSb24NXHw/BJPgPvZ/SWdz9tngc1szlz9VDyPJjXaXyu2MskZEZG?=
 =?us-ascii?Q?mIQLy/lbfaD1jAOw0kCxe03oX3gpZ/ibxjc6dIF6K9AvvoN8CmuidGSYohAg?=
 =?us-ascii?Q?YhIWBhMm7n4ImcOVWH0evhwFzo3XXj3ax7DRo+x4QysZmKrEALHfQaiNfbLS?=
 =?us-ascii?Q?9Mu/E0j4uNBCerccyyxFU350mx4uVRSXJfzgavv3hDI52QDsiyy65v73eKJT?=
 =?us-ascii?Q?GF3khr6qKdyghSyB1d5G2uaD648mLA0+0WkTG8OmrkJXPyFcjd2IDGaJkAeU?=
 =?us-ascii?Q?s0luzRGHbdEJljppgN7EKpDwa0FIb7pvWYyu5e0qcSfwE7DH8CinxFKeoV+V?=
 =?us-ascii?Q?tvCNfwelgM3ED4g/OH690M91/5Mx1aUYrrEDkVjSWmSg4THeecaHkvDX4izJ?=
 =?us-ascii?Q?+xnDSvWjzVXUDawZybfn3u9u?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae3f507c-e1c6-4b16-ab75-08d99418c849
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 22:27:20.8473 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4482
Received-SPF: pass client-ip=40.107.74.135;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-BN3-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> Return -1 instead of 2 for failure.
> This us to use comparisons against 0 for all cases.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 145 +++++++++++++++++++++++++------------------------
>  1 file changed, 74 insertions(+), 71 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

