Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B1B3A1878
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:04:18 +0200 (CEST)
Received: from localhost ([::1]:47998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzkf-0004Kd-7k
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:04:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqze3-0004UK-TF
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:57:27 -0400
Received: from mail-eopbgr800127.outbound.protection.outlook.com
 ([40.107.80.127]:51110 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqze2-0004Em-5c
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:57:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2oHNhLp/B8O2IEzpelfaaqklQHtPO/X9yhovXMqY91gvVc7sb73Y+YugtYIZHdRNUoyAd02wZ6pzxo3iOaM9aHv6QIoxagZffmBTNSUF1iwLq6O5Q+lz99Z4tT534oLuGTFN0cRxPt5rl2j8E7/aODC4RpBPwJsEVnopQgui9J4RfKF1j9dv67Kp3xcMWXhfSe+ZaRi73Re3f0rRJg2WhYRYGXnSAMl/byrMgPKveW0XyZpAYkcuYUmMZYfJzhUIOn31HWGzhfIIxRCyFZKT+lHZE4JlaBiNuyBtvVi1y3INRMApnciYYeuu3SLZ0gxLJjBw9QKReQh70tWmrkXSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QanJ0NE7ZUTVamMqrduZOiVOdKDBv7V6wJCLKkx+ZQU=;
 b=RW2ErMGOsQCf3YZyW92RIUBJBf7rf3CzYSOnf4vVGOsjYijPjzBgCTBosoFZ2U1kbs0Tls7BEcgB1kjhbAAKByUmSgqnIOSbeiD5llKTIabWFqYS1PmQVL1PEYMX/shCDX8tYeFlf7t73obiv6YtQ8Qo0r8NPTpMINuY3kTkMPKtOA9yunWsaa7VcKPZ6qwN6/hW4qnlEt5GiNttdpgbUQu46EN8dKpumFLHvgB8NQ9ru/+m3Fl0NsFdAJTeV7mCiIlToNzWK+w4ggB64+Q4ZOxBnPMKHGsUb1wHCKfWIcHbFqP7L3CeTrVNr9la9W7sXSxreWN6iWHOrdtXfpTfKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QanJ0NE7ZUTVamMqrduZOiVOdKDBv7V6wJCLKkx+ZQU=;
 b=uVLiYhPEhLQMM07o8gAEjMe41JuolqJFKdHy97PwskHluzrDI6WTMtIAJUxQ7+1bLAMHhtgkicehQmmSk7++mLxknarbP4fsbmqPdGJ/XhGU4Kv91vlFKY1QCS3AshtOLhtjgVkC/eAE8Q3bZbpx8Ca5DdlaVnr6yPKcPp/LBbFTMcqiub+9Jsu2osaa6CK8tknAjKJyZvvRjhjQnpd73uo+CM3NQL8h/NyFw2nGkr92vQ1Pu/hmLNUKLCe8wwXz4ah3tMbwb+1BvcjIbV0kjTfXn/MVA05nlOY5yHXRvbAKZXNM8JtwwvEz+e1RWVxObqVCbgyzC9IuDbFceqFyOQ==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB1905.lamprd80.prod.outlook.com (2603:10d6:101:6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Wed, 9 Jun
 2021 14:57:23 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 14:57:23 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 05/28] tcg: Split out tcg_region_initial_alloc
Thread-Topic: [PATCH v3 05/28] tcg: Split out tcg_region_initial_alloc
Thread-Index: AQHXP6mYMrEGrumuSkGKRhpEizjY8KsL+mRQ
Date: Wed, 9 Jun 2021 14:57:23 +0000
Message-ID: <CP2PR80MB3668D6C2CADE62C9B91869BCDA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-6-richard.henderson@linaro.org>
In-Reply-To: <20210502231844.1977630-6-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.102.146.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dd520ec6-bb78-471c-0f39-08d92b56e3c6
x-ms-traffictypediagnostic: CP2PR80MB1905:
x-microsoft-antispam-prvs: <CP2PR80MB1905A6CBA44C820974C8604ADA369@CP2PR80MB1905.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:626;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9fCOXT8wpNfq5DofpJfmmO+NJIEy12i+ct6MxfFDGm79eElhxvf21YsuKW1ZAJ4gDv65WBD+RxaOf3Fs7xswx7QSkt4dJgVx3cqufcx8N3miMZhi9GmsW9nqISZXEAkf3CQfo+n7tXK/uAcOldYB9aaflW82zL+2mU7DR8Rmrpttu+e5SmTyvE1IEzQaY34Te/eUr80N4Qo0B/MJKmv31zK5gURMdoDOfR/HNHGFT3SoKpnpuJKqFsBv+aS/1sfy7vGqq0nadEbM47beLwHLikzNBlMzMYVVbQvzJTt5xpIMWGBr1Una7Zvr6Xk0sYhYOvVLY1muZ2dsYI1WL7cF1rb1V2/9HvJc/CPvpgXW60acs4BpM9szXINf6gW+XqFMfdxvnX8rVxBjAjVX26EpfywJ4X4baYTGgNxCDQQy+XFqBQScVwtgCQqprCFQYTlMvAsPPQFJN7d4NgPmtTAkYHTzfK58UQbdlWNBRa9IPjeRbo3pRmC850B1pEsDnKbryc8jqiI1mpsCaj/ws8tXMJIS3UBBQZbz6bAwiGGWVQgARH5JhVfK1HTAMk49MppNKiwhA1Y7Y0/KFdVmKdaRK3wefmARpUCDJLgm8vgbKddI5Z9mnXgSwRLgn1K9w0hvae4AY3b5k0bEwfy6YfrRuAPvRoaPpEMcdVxWZw48J4m7/P9Fk4aMZVRWXW8CxXAaxyHVTf6AvFlUZqlWA9uLo/PrtHirlbuvpAkTyx6dUH8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(396003)(366004)(376002)(39840400004)(33656002)(66946007)(6506007)(86362001)(186003)(110136005)(316002)(76116006)(4744005)(66556008)(9686003)(38100700002)(7696005)(55016002)(26005)(8676002)(8936002)(83380400001)(52536014)(64756008)(478600001)(122000001)(66476007)(2906002)(71200400001)(5660300002)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?e2msD6hHL76H4QQWS953DxLZHI8Uq3auMT/Az1JtTzC/0epJNy7s+yPYZT/7?=
 =?us-ascii?Q?lQ28OVYN9NsT5o97FuK3hUXpeT1ViOEg982z9tfCW83rXBoTqiFxLTedGIPt?=
 =?us-ascii?Q?/Yd29/BdWc56PmoXLsf3FQk+/vUme1CwKRRp1NuUs/gnDKTEci29jo1iuslG?=
 =?us-ascii?Q?nRy0JaOT07v6JPZHLjQpyezUdsdMlb3RE9KtRB/zfa6kCMu6Xux1MNbGf4e5?=
 =?us-ascii?Q?TvVDy7rmAcADdMTNsCb8HxS4kURE0A+DH1NZsStsUvtHmlIddiDPLVb6s+sN?=
 =?us-ascii?Q?GCveMbxdplEGQuUk8TCZ4kYb94oelk9eYrVpM9QpN1G0F57o5BlcSJ3W7lty?=
 =?us-ascii?Q?XUh+i9sTSiCdERetSo+BP3u17I39rGF+Q+2BHdXsbBTgozVrxtM08vw5KGPK?=
 =?us-ascii?Q?ZxNHUMQS20mfVtDC4dljJuHmC4nmp1U5XzlLXUk16prjZ5/ndBiE/CQ6YOaO?=
 =?us-ascii?Q?Qc2m75uNVPHDNJWDlmyHCkYxhmsvSHqPciQ9WVgCBfTZ46rnpu2VhfWBrTAU?=
 =?us-ascii?Q?PgHX+vbl1P9qr3a7NtAIIzcyjGhrA0ExNiMtIW9Quu4C+NFgsz/wsn92ItXV?=
 =?us-ascii?Q?lVfT306QEhwb467D/9M+M3Qql2b8xzjCUeQJahVu0t5vDAFmbnDpAPZ6JPAS?=
 =?us-ascii?Q?4BoXwW8FT0C2LtL/EA5CX3rRh5LghhvSOffZC5ymplYGWwG9QGvC+xwi7pIu?=
 =?us-ascii?Q?/GQmusqqyCsVqvYthYiTVavrgjTWlKcAT5vVZ33J0rdSW8Q1W7xTHq0EUO7Y?=
 =?us-ascii?Q?mG3ClIzOB5y2xBd2r7RwUv/mZCTIcEsBYnNbFFdIWLVS/DVOXxciErNQ/6ml?=
 =?us-ascii?Q?itKNDb+Kqjv2rQ6UxCrrIG9TQeQKERQQAvWyYHNk8McTnCG9ixuZQTlrBlGC?=
 =?us-ascii?Q?Ka3ydFbmgBMyqkR1rnsY0P0S+eqlfq/7jxByYAa2R0iJXuj8OIioSIOioNPs?=
 =?us-ascii?Q?RWjNl+JjcCgbNjo0ic+AKKqhV/aRdeTXESgOH/KHhsYXzYWSDdyfij//b1dL?=
 =?us-ascii?Q?DiUpr+n6CIaISei9R8+5n2d9UN/F3fWNqKnX+abtSvtRy5OgK5wo/ot/SU9V?=
 =?us-ascii?Q?wEK/SIymUNFcToFk8QB07q8+F6pA8loqDwXS+x9bP7ukMtyL1iNm29pK+nzB?=
 =?us-ascii?Q?EPboeOz3zE9g4nf89BrLXOxCR89MzvtcDeoGvl648XKdCzLtVwrbZF5KvLQE?=
 =?us-ascii?Q?UuIKj63S5dCPkPWHj70S8jiFuTXunefxLDSIcseE5SPztv2k/A45y27gEGZK?=
 =?us-ascii?Q?DoPolixKPmd7Q/S3XJaBhQF5F9fFjnFXcLtCqd/Gi+zS+5VYxJOtkQv7140E?=
 =?us-ascii?Q?DicECAW2Mxvv+i5pm8b6Cwnv?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd520ec6-bb78-471c-0f39-08d92b56e3c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 14:57:23.6126 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tWcU8H/hBTuHtVWAbfxsI3o2EiGd4BzT7sLqoeeMwdzuMkuJygK8jAof+FbLLKp6AR8ePI8EKIKIIUub3bcsuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB1905
Received-SPF: pass client-ip=40.107.80.127;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-DM3-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> This has only one user, and currently needs an ifdef, but will make more =
sense
> after some code motion.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

