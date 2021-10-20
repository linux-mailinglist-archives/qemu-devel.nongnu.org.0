Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7D9435629
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 00:54:08 +0200 (CEST)
Received: from localhost ([::1]:39590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdKTG-0008Ms-Uu
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 18:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3t-0002tK-1N
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:53 -0400
Received: from mail-dm3nam07on2096.outbound.protection.outlook.com
 ([40.107.95.96]:15009 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3r-0006yZ-Gw
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+WVuwIcBM3Dy1X7xCF9H1tqOhDmjnsFXecH8MUo4Y0+e8k8GHklzooyEPcYOoTXjxnQ71P39i00+dV0ipXmwbTP4RY1p9RRsDdA5kXyOB7GirsoeVtrbs0ZG9JLI5KptiYzkcPn7YQm/bNhU388+na+/3x5XKCfeR6TaTNgp549jxOu5qLMOnkj/XEuswmLTyHz/7NVXvZEENJpsPWZB58bApGYMJ3u+ot+mFK7KlpIG0mQwI4YCJTrzwYEdmQWrjNFvSeDC8lcKu171Wdp9J2q5VdgOhMcvff6MWyfPCJiSkeccgW3882AaFBAbFJnlk0tyCstxmteyy8bg3H55g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDf0onqURY/9JhDr2tgB23i/7U9f04Octyad74cMFCM=;
 b=ScrvGXm/gB3T+kZjiW/MbtPQajo5mXzZTXCJykHHnNmLuqT0B2pF75angG+WPivkSdGey9ycx42LycZZYFzhAYHDLYP/UyabbZmqEbJh/JGeXYZMooKAhGjqKuB81uG2sDDFPPcT0fCxSiyNGc3dHq5JkXn8A57mEas8QAa3klP5xFw2QMyUQZV4+pt8K/5KJ8c9v6J1gFncSS45+U4Vdvfq6THuBxL7juJ+W6jM0JkVxsv5yMlN6BxjpBTY4vrMFC1b900hQAA5BZMf82TMaFPBDaAYkTDlCeSM/Q/N+5ihgEvMsL69vvCLPXM5BvQg9yETLEFsqzdnrpKch0UeUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDf0onqURY/9JhDr2tgB23i/7U9f04Octyad74cMFCM=;
 b=sv1qA4W8tVirA8GEgWDl97c2YLiAkV3Dbf7pYfMOjXOrpnuLqDM7keH8Rkrp1MUCWAnQ+FnCIxrO41O0GFRsHdYrqUm1vziT5h0rSqiHuMvus5s95KC4RLZF+qcVQdwZk7AuFOcTX56M3/2BZcP8l8In17ZTMLm1M6NaFxBWntyT+x/cjdN/BfZsKgytcMOJui6PvXbLfVUPNzjBdmBbBSITliXXoZJyTLikUEfKWpGV1GJkxRz1k35YZmWY80jYxq8czxluhO9vQjTCGsNnXWCrDrbhaC/7i840KXLz9bX4hMrDJwCprdSCqTl7752qfTFn/g/QD6O5LPyOYKOhBw==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP0PR80MB5315.lamprd80.prod.outlook.com (2603:10d6:103:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Wed, 20 Oct
 2021 22:27:44 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4608.019; Wed, 20 Oct 2021
 22:27:44 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 18/48] tcg/optimize: Split out fold_brcond
Thread-Topic: [PATCH v2 18/48] tcg/optimize: Split out fold_brcond
Thread-Index: AQHXu7d1RwhMGo/ZRkiXdEy+lsgzW6vcinWg
Date: Wed, 20 Oct 2021 22:27:44 +0000
Message-ID: <CPXPR80MB5224DA72233792096BCFAED3DABE9@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-19-richard.henderson@linaro.org>
In-Reply-To: <20211007195456.1168070-19-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cda950a5-7be2-41d5-df40-08d99418d649
x-ms-traffictypediagnostic: CP0PR80MB5315:
x-microsoft-antispam-prvs: <CP0PR80MB5315E5228939F5DF98E8A71FDABE9@CP0PR80MB5315.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:400;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3Zs+7hlB4rEBjkmBjbPRB5vJfqaf801UvkCahy3muD52JmJs0TyaBPD40CmBPOBdsylg/jOZUFWJHYkQ75BRhL86nudIOzQX3TyqkszKw1iCRq6hBP6btEL+MfNbAVO/BwV7SqkgryRSKUTAqi1xbU1P0fshlAuhvTPKg1Nz0dr822+a8tY+LMRFC1WXnlB5OsjNZOyZu5wZfmXBkA/DUmyyeu+h8NaMgfPlC3+mz01idqPIauKqi2WtQcjzxBuGEiOQiRd6Yk9NkiJhSyLBmfIfBJcJIG46njbdW9YzSU6X9YLEX7dCRV6EuV7bksfXHiy+CAUqfXnEFFXM+rcB7EXnL0XF+ZZqVJiY491XnGqmGgw/XGBZCOtr9AUHYkg6SPMCsQOUBdnuD0Pbg0Uyk3Z7+AAZ/wLbqJxcxg+dQb6XKWODfIqXWbhoJoVlCt4QL2AmPEQWBUgv+hlSI3sojawI/NSoJVz7/oaBwjV1Sx9wwvhqarsCzS2KX73lYpD7+t7D1ks3lgq1NSnexuEyRssTec4qk/vQi9+RVpgu5V2Q7Bc8filpygzBER7i+KnZK2gUvmPrdRMecWyUbG54Iunn02LL36XokmKU4ccUULbimLN+bm3xiUO0/nQ2+t3kLoZMehyeb37fUsBPsPOi86dsv/jPubdTd3QkKUmCGKpUPROA4YIUrTLJO9BPWYdEE9Ejr/cRoJ+QnIOd2vseqbfl/u6zL0Jbvgk148NHG9y9S+oDmKdYGfDyv3VpgFb6Jbq5od5IiSScVVYfMeBggVQ1CxNfJ/67qU+KR8l0vnM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(8676002)(86362001)(7696005)(71200400001)(2906002)(5660300002)(8936002)(38070700005)(38100700002)(83380400001)(52536014)(26005)(316002)(33656002)(508600001)(186003)(9686003)(66946007)(122000001)(66556008)(55016002)(558084003)(76116006)(110136005)(66476007)(64756008)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aCOeCKVa8ywZ3FXCovnH1TtQ4HsHnBphHZ28ZI0lPHnPqR8VjrF2Qe4d2Zsd?=
 =?us-ascii?Q?mzCY02WQyPoQXK2LHEwC9Kn6wPcCkLdNdmrA4hS9ym/zNOzFUBTvZaZa1dWl?=
 =?us-ascii?Q?f4w8F3EU7qe88IPWGiyJdm5P5b7TU7TTk7LGPF8bMH3VdTILEqAfio7sfwIu?=
 =?us-ascii?Q?jSkqC93L/JI30UdHMqje2PaOxG3H6jkpDU86aHsQnijAxHMQWrSnh58zmFbf?=
 =?us-ascii?Q?QSgFNYMMaOtBdLa5KV0L4zCgPxAJ3KCCcPMrGjbdr1YQTqAWSbe4WfMJ0PgF?=
 =?us-ascii?Q?FNdgqoGc9aPmuVFbqJIZY5gJqYvrBTngmw6mKnf9m2tSOxACWliyxbxv0hN/?=
 =?us-ascii?Q?IALzsENqpgDj9wib/lJJOiFKBdVotcxcXUXLUTAY3B9wYY70mbfzAAjELzBj?=
 =?us-ascii?Q?8NzHQAPr9zdbL7sJ11YQ/dDsTBltP11sJcAUpQkz0eKkyzMW+34Y0G86zFDr?=
 =?us-ascii?Q?aaG5lGphY0yDIHYG6yXDkiviRNOJOu+O/VbEg8s1vU9hRkx/D6plMmQJXIEL?=
 =?us-ascii?Q?EwITrJxprj1gEan6Sjma8bCKIkRRXduQJt6GOCqEctcT8FWfQORUtssCEpVh?=
 =?us-ascii?Q?EvVAnOZLbf/tdZfOhd52uiN6HJRE/CDUsZg5fvhn2PUzb8lC5UTVCTYfY3zI?=
 =?us-ascii?Q?VQiuMiFvrYSqkpn0AFxwiGCvLhI6psXTchnHh5aUjk9WbFX1LfA0nlI8mfqH?=
 =?us-ascii?Q?zG4QZGaA1x+/AumrfSpNl/wlpz4aivUfV8x/x9PxQJyMLETmiNkCuIsX0DLq?=
 =?us-ascii?Q?F2YNe+o5AZwX9ECxfZqHBo8wy7mF7fseM/fuUOnKdFYSbnY/Sfb+rQZ74FSJ?=
 =?us-ascii?Q?flclHSjXVb5hYeEaZU3bzUjtFiZZPhUCYe5UfUyoMucf5Xn8jnBcgT1yQVgb?=
 =?us-ascii?Q?c1rNpwgI9U2yMEYIRZy8PrVQI/AU0T0d/VGWDya54AmGJ7R+TrN1xu8Jal5V?=
 =?us-ascii?Q?hy+TiPKBhylBADIg+lASKT3acU4gRvxsIAR7yUu9S8no3ICGTD3PuK8AF1iZ?=
 =?us-ascii?Q?/CEp8kAmYE51sq7QbOTRqHpwsQFG58tLRU45en0w7P0mbNJGjjww/Up1W6l9?=
 =?us-ascii?Q?JMTdgX8P5zy2W2/cb7t2z+eiw8H/gWt0M/Ak92IVSzG1q/4hzvBjzynweHgh?=
 =?us-ascii?Q?R3pedypdC+GqIBtohbL6J+jFjuftrnKAPq9mJAKffNcGWgQHi3GSsDGuLh3J?=
 =?us-ascii?Q?LXHYmkQX73+lb4R1QiTHQHHdsJ7lBe3L874nb2YCOoQ9X7azN+7T6f5zcfDU?=
 =?us-ascii?Q?tcftjc17uZRjlFAzGtElORCQ7w8BsWzVV/VYqOcUvh9QchuGXEOQ1xhkQW9J?=
 =?us-ascii?Q?JJU1A7BvFFkWrkXu8nUermL4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cda950a5-7be2-41d5-df40-08d99418d649
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 22:27:44.3288 (UTC)
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 33 +++++++++++++++++++--------------
>  1 file changed, 19 insertions(+), 14 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

