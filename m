Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AEF437C2A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 19:41:59 +0200 (CEST)
Received: from localhost ([::1]:33214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdyYI-0008JD-IT
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 13:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdyRE-0004zJ-MC
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 13:34:40 -0400
Received: from mail-eopbgr820098.outbound.protection.outlook.com
 ([40.107.82.98]:22287 helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdyRC-00076s-Kr
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 13:34:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UAHg2fxmzYHBsCfazOnt/7JhG2OPj1LyJSZ2/iNXFO33+vxQU8C1MgXNFY20fmAThkf0weEpQeomgdwFxsIUzJNKTpz9SSUdcEfXoPbbPDS9m9xzurvhKOy9TlVQVB1sVMnBxC1CnqCvJRpACjFIqoyPcwfIrb6BkrEwazsT4cDG6sfAUDw2BW5cYw9a8Trl4PSuqhiGYp5jQrnuo17gq3JRlUzU9W2gTMLR3sHuVvBQ0jLzqspP11lsmu/m+CHNSRAMhlMdRVC/BSdnpIFT0r2gIK4apG2GBNHsj+cxaaVDiMjMGDB/zk3muUxuX6A9xkTqNZwayuxkht5qtBjjkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p13xXtUc5eJMVgF00ndevFVdEhxskKsbSRcKfpOslBU=;
 b=Jvi7gihytDqY7YEKeKAOQBSGmUBs/vfraoklXI86acEJfIwqlBKhYV/oL/Z9MoK9vsC4L+uEqRZ9jbxfMWhmGHn5YiZuAAV3B1iDIyyE7lmAB91iwa5THl9QVBlE0GbpSvzkjAaR5cQLiO75sD0Ipjs4p4Rfs+kVdyTbfVQ2FJlYQb92ey5wul1u/xT4rdWKtlbET30dUGVWN2v3cFtGefMy7PiYS13HxHqkHn4ktil/59Efswz0pZkfLmt2q9fIuNCBEsA9/lFbSnSRvyP15y++zbU5jSH+y5J3Wg9iwuuKGfpwEzdCaEY80qRRKcQL5krH9Y7MTIqFIs1pBRO1eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p13xXtUc5eJMVgF00ndevFVdEhxskKsbSRcKfpOslBU=;
 b=wbrpmGx9aKwqrm68Ko8x4/q0dIBjpnV5cZTcg3H2N6B+b++eRvSclmxnx8u8HuBkb03fBzQp02Lg/ijRSC3gH6xeGHw+2Pzxy1CYJQdnx5I9+quSfhXtDsQYEgq+3wURnw1guWagYr0NtptEvNtOPGnALOnPls7uV7c4M0zgNRB7n0oW/RJAj5jMYueqvaJ5bCWcSpjp1tTEaHOj+qoxgfhKIa9hBjN1fkUnjSZQF/DQn2xV9xULbX2TQ+WPqLPBcEZbgAu1dsCj1OFWxZiZnvEHWoZvfK3A6ynYxE9HH0NI1uyOtvmkxppIqiFi+MsJvguuxXoPrrl0+MdlmcfImQ==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB3924.lamprd80.prod.outlook.com (2603:10d6:102:38::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 17:34:36 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 17:34:36 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 23/48] tcg/optimize: Split out fold_extract2
Thread-Topic: [PATCH v3 23/48] tcg/optimize: Split out fold_extract2
Thread-Index: AQHXxr90Edepf//sS0Ch8wD0wXz0b6vfSJzQ
Date: Fri, 22 Oct 2021 17:34:36 +0000
Message-ID: <CPXPR80MB5224130389753BBE17037FD7DA809@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-24-richard.henderson@linaro.org>
In-Reply-To: <20211021210539.825582-24-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe3e6d0f-7d97-4209-7f4d-08d9958237f6
x-ms-traffictypediagnostic: CP2PR80MB3924:
x-microsoft-antispam-prvs: <CP2PR80MB3924199053F3CBB7CD938D6ADA809@CP2PR80MB3924.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:400;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gSQ4b77PhCbLs0MPnrplEdLOPtW/renLOzjsVjHC1E1hKhXTxQshaPb1QnVyh1n26DyXjMszy5h+zc03H+qRvnp0DLFNhVzTdkP+Az9a5Gs28w9YauLCFMmYvO05ibHofMa1mCz/IAPFFz+wSpzh9uIyMNZaIyvYSlq3agqt2rTy6rRWPPHZYmPO8M2K3hmEECsGvq3ESWJ+gp74qO7QW8rpav+XEVoFR279HXjpIaqdW7dGKl201N44LdN/EiurMOBIXtVHNRu3aOL12HciwDhc/fh6Z2zE9sq18CAfE1ighLnEwKaDWDSWJWa+l1glNUCEO+KFlMX7AFG13mzhh6xqFDvoBzwGo7Jsq0IcMEWJdm7/y0Q6X42tOC/gdpHYqbNHY3tbxfZsKZojZ7BB8re+jx0pqoFLZt0Z9hIvX9yQwIGTKZgIiKbwIchkgVKuYqYeuetTcHkPyZq6FFBAe6RnwJeinS2oS/5f786KVvXpsrDlziGUVRcm19LnCVgQzRaVZppfixKAtDJO8klgMjpDXRZJ0HZAlFvvN8gr3y4APv6kYnu+V9R3DiKpcmv2l4iGCH2Pnh4T8a3fdzwApf7ziNY6HduvATg6tO0N0fNlkGL8S8JVuWI/Z1wZapwpZc0DVP2xq9eLCCOGet3TDI8rxsE4DUDX3OVuZMQ985d2wgb73EkwsjyNmgmr4e0S1IL4w6Jm+ZDHjH8iuJfL8NAlGgezHIN/FIgoqYZ5rbOXplitK8vLcHO8eAHMuAW4z7y50W7G+mAnHtgjJRT9XTR9I0ea5E2L4FLp2gprqHY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(4326008)(186003)(66476007)(52536014)(66556008)(66446008)(316002)(71200400001)(9686003)(33656002)(86362001)(83380400001)(64756008)(76116006)(55016002)(8936002)(5660300002)(2906002)(110136005)(38100700002)(66946007)(26005)(6506007)(558084003)(122000001)(508600001)(8676002)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eB0x80rAHdener6isJupyeb+TCaDCnWgw/o3JAKcjid4pt7hqNTUtd+uDX9o?=
 =?us-ascii?Q?+pqja/YYQfjWQwtlVaVbuoQhgCQ1iAHJcVplkR89cMwVLPz0acZIpK036EdW?=
 =?us-ascii?Q?54W6kEPgE9WPyi3mOAhnZuUnTuJ5P7SiHe11e021U8G8te2CGGQIH29QW0y6?=
 =?us-ascii?Q?4+F8RXFdPzR3ALCbeV1r7VVj6f3Eb4xhWm4gSfOQ+hFYzCzBGiK+GxOnvmMi?=
 =?us-ascii?Q?sVeP8jUke2OGu+IL2o9bWoMRAxDQja/4YVXv+dDb2Li6SOvSMvTnroTTUyTW?=
 =?us-ascii?Q?Xqy2Bfqs3Yrk2GKMpw7qEkREg6GMTj8Oo6C25y99nwJkYGNe1raVSz4EQ1/3?=
 =?us-ascii?Q?Od1Ww2952arq1US91siOFqGvAZr4jUngeY9gNCkZynIUOUj0Xgv3wVVOi89q?=
 =?us-ascii?Q?o3kxE9G25/sB+MyEB30iKM22XPcsQnAs1aSxDsmMiGJVa9Mg5Me+n80ZNyYW?=
 =?us-ascii?Q?CeyzWTMgfXUtq5zYlrygAwquSxBZFqqqtX7164xgmjACWPbTdoRfwHYD3ww8?=
 =?us-ascii?Q?qwmCHrvHcRMyd9zlvgAZ/O3es5dDRwD6kaeKD/GEibW/4wpOLYKVbOV6iabP?=
 =?us-ascii?Q?Nr/WdUPfUuWD78xQZp9U0AFii8VHTmYg9/zD2jDPAPsmIoHzLWvQtCjQlFHn?=
 =?us-ascii?Q?UAVQLjoPSBJO9WWYNCX12jLs7HkrLGPB8buw9/gZqChNF1ZOcNuoqx7RK1h2?=
 =?us-ascii?Q?ledRt4T/CGV3b/aaex4mxJX4FRkOB50xaKlqDj88uvPDXgNkst7vymrnBjmX?=
 =?us-ascii?Q?eDcFfblSGxJvV5PK3zsj/D6QV11nyAP04p8BSvnTz2ORy/b6M2K7IDIGvMm0?=
 =?us-ascii?Q?yHyGhDrDJXNu2UJBn42Y8conrlTalaAuVsT118Gso7SXmjiKnjUkIw28xQiw?=
 =?us-ascii?Q?2ajQRBKVP6fHc+qeaYUL0cdXedKQvlZ6B/Wb3GJhjzv3UQobrY+XbQFAOEps?=
 =?us-ascii?Q?nZvWurlR9XECUVVAmoO/atESBWwdOyHBVx6jFoXyOh2XHDFQQfuQIlXcyyUF?=
 =?us-ascii?Q?TdRJLZKmYE1BpNyuA+LfcNQcgDyXpv/45UfogPaDD8t9q4RF8rotTj2k9F2R?=
 =?us-ascii?Q?TIU4uLBfTYvL6Jj5eIVLZwY6WSVqK+t0vUW+Rnpgsot0rfrqjHVrXfRAUEWZ?=
 =?us-ascii?Q?Hd9bDxYgEV5taUmMwtd2QTgYpu+BdV4xtZ5/8ugL0vVLsOehQFwrsPogcHNx?=
 =?us-ascii?Q?oxVGmC5afBg5dCD9fVTap9DUCMz1hpzyDQMpZmEojBK6ujrF83yipLFcWt4q?=
 =?us-ascii?Q?yD9tofsS3i+5nIQLej7XDUXpcPa2gW4qmmAOgSh91J0t59zf/pl9xjyqv/jQ?=
 =?us-ascii?Q?3TLQOe+CYU77lNIsWbvWKI63IkQtCfmaNnHfGyC4/On6bILpwd7ezmXlX5YS?=
 =?us-ascii?Q?ooVgBGwUPkHEBor2LpLl2dOX7MfXg5Y/D9VC+fXZT9rYcxQf7nGeqHn0RGoI?=
 =?us-ascii?Q?USml1IQqV0k=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3e6d0f-7d97-4209-7f4d-08d9958237f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 17:34:36.6324 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB3924
Received-SPF: pass client-ip=40.107.82.98;
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
>  tcg/optimize.c | 39 ++++++++++++++++++++++-----------------
>  1 file changed, 22 insertions(+), 17 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

