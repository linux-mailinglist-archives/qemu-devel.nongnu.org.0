Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9B843988D
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 16:27:36 +0200 (CEST)
Received: from localhost ([::1]:38946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf0wp-0006SL-KU
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 10:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mf0rx-0002LL-15
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:22:34 -0400
Received: from mail-bn3nam01on0718.outbound.protection.outlook.com
 ([2a01:111:f400:fe41::718]:11342
 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mf0rh-0007tT-7T
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:22:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iuPqbJOerx+i6LFuGf+nXTHQb6bjTNAhry5+RWPRSiX6F1l1fK3avHg405Pbzph15XEqsZ555i7TBhv0zUevNl8AJ3hg5fG8Ei6lDHM8MTZQbJ2R+aDhxppfqv6MRuQKtxTkaG+BRfI1lSma624x059KLsE2XbSg70aHQ//VQoMVCRsYUluZNETRd7Xw+7pVRoFNIKlBTnPvovFkDICBEHjnTMD00sAJq8aoL3fxnkRg72Rzs4LHtItNTa0y5usUWPEU7zGNXSJGJIJqlDpA4AK8Ch1StMSIIO/jNUdJNpKkplIvKaXJWlnPqo7ew4XnWFyMT8ousq2exBvP491mMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbTIJjCcG/SbnoRPJxJgUBc61inQgPxwK6YS0AHWZ30=;
 b=jYs1pMDHT0hRlGyLatuwnhoRCgeDh7nmcokWaOua2jNGf2kYS573OS4rHZ4WebLaHrbis4X9U7md2ARxsM7gHrof/2mVkZSzDQiwGyCkim9m24Ed+z8xFe1vq09CUAelzXQwm+FyK8wciAY3vqP3IwQ8bchkQRaUWrsODKXzcCAyeCK0eU2z4aJshRggujCAx0u/IOXDpEcfXvo3/QLVvFjpaC13btVKfDqH1IH0z3taMM8Jy3vL78ZgVy3wW+2t42aavWR+cg9vDTgHNz+/B4beDgxuqcR/0TtOFsIprCakO691rtXL3ehNSIk9BRjYJc6XkyeZI4UU6MrC+x7dbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbTIJjCcG/SbnoRPJxJgUBc61inQgPxwK6YS0AHWZ30=;
 b=yq37w5KywEyNbOSdZY9ywSk8ArqHGD5QE88TF9OacxBIfhxB28vYrzM+qA1wg09Z8f6BxRk+agaA1ihAFhdzeTOukywEGCqreu1G/ot2+22EZwoBWJegFFII90w226AFwuaCKs/jV3jmCF/7Sp6e3P9oYHo7b/LOZ55nuREK36H1196A3nm7ZrarqyFySGy1fM9FeT2z/slZfPh8v1SBh9Mj0I48VDpWgZoF8sdD6zDLFO+smrxbZHfKrUVJKyCieOc4s3+NYDb7X2eDoGXuKUslfiVkNycd+5dkEpd6JiZmkpOQ9ZgHYI63YqwjyGK6YQMQT69u/2DPNUvMPIkzWg==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB3697.lamprd80.prod.outlook.com (2603:10d6:102:39::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Mon, 25 Oct
 2021 14:17:13 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 14:17:12 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 34/48] tcg/optimize: Split out fold_to_not
Thread-Topic: [PATCH v3 34/48] tcg/optimize: Split out fold_to_not
Thread-Index: AQHXxr95Evrp6hJNQE+Ak6rx508PcavjyK0g
Date: Mon, 25 Oct 2021 14:17:12 +0000
Message-ID: <CPXPR80MB52241B3E9288764685587103DA839@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-35-richard.henderson@linaro.org>
In-Reply-To: <20211021210539.825582-35-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1e60aef-1a13-42ac-856b-08d997c223ab
x-ms-traffictypediagnostic: CP2PR80MB3697:
x-microsoft-antispam-prvs: <CP2PR80MB3697252E0C0DC2C6541E5DE6DA839@CP2PR80MB3697.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QroeWsIQLgL8b81gFOn5iNJVTAHo9Qa8eLSSk4inLHFZq9K0Rt5TQ4tf6Eb4l/97KdywPx2fBoLZqUyj9zdpd3K8gCoLbli+Q+hgZS4FjtOD+qnrhfana7jj46s1Sac/HOwBNM+m+ESuvJnQJQi+MV07vPixxC/Ch5HC0/2eXh4MsGjHnoqcbGG1girIm5nOPVz6+3h/SUJznt9zSUMfCSFm8H1dFuYlsZsWdeNn/qR01UG9/nP1IVpuE/CiCDbY+69m6oXQxxGAoQoiFqqZsJDMFaZ5dy3ZA+ofEpVOD7o1i90c4u9FRC8wWgtDnx/sbNQtMhBy74pueI3K8hX/4XmAMJZcOD2wLwYubiFRc8l/FOPdF+cMQO0YgyUuLEF5XbOVzO72GBjbXn6zTEwT9E2sVdOfYJhwLTy8aHC9D7SnSE+f3gHKNnfBRxE4brVzEmvSSWrqsSn0cLq1xNzv39mYCp66VhjGqJG7Iqh9d1oAMcdLvvBeI0ZxouX8ZY7rY4VIAj2Hxe9/JjaCz+8V7U4hYuQsI29QG4pwXzTZ75cjk7GcJmHYPCNun/4LD4UM4D9vQEvyED5AmlCRpZwfx5pjfoeXh7WwgDBgzzqjMWswLRB/CuZLeiAspMi9cEEUMsKbtmSZ1xL1SWRiYXftPeq1PAKCFaRhOqOyQQp0LtocbBxOXTZvGfTEgD08qnQEZUiwZADsGd7WI5ewTTusbKJ9Q39pd4GsnYMF1YU1cz6zdAHWXga+r+OD068md6UeetZHqfPyLoe09mTLF7FlZhexersdDYg/iDDneso5JXk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66446008)(2906002)(52536014)(55016002)(66476007)(8936002)(66556008)(66946007)(4744005)(316002)(64756008)(76116006)(33656002)(9686003)(508600001)(5660300002)(71200400001)(186003)(122000001)(38070700005)(38100700002)(8676002)(4326008)(86362001)(83380400001)(6506007)(26005)(110136005)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VtXmGO2u3Nn73i0vYddMvPAdj5TEdtVIbAVif+eCk9LNZX2mIGbsAB9/Pc/9?=
 =?us-ascii?Q?9FtHLaFghKiZd8l5qBGlloVR/N/Alo5kXMNp2xYslxDiFRMZx98wbbDzt1RY?=
 =?us-ascii?Q?Hoe3OUIWDqFnSsO8ai4oI1f8A6M5wZDP2OeD44X3mDe1ZPcSLPPAvK2VWCVC?=
 =?us-ascii?Q?Kqtgk9GY6mKFsWsvFQMVcjxtWWkNNMtdsmmOIR0Y7QxUl5C3s3wUz6dVvlgF?=
 =?us-ascii?Q?M+CBh6bmpZTlg3i2ZlSQ7e6a39s43qPtVXssuOK6WDYqVVFEBMyyaGm9T5hG?=
 =?us-ascii?Q?zjo1Udi5zGBgfTTOzfHaLt9EwLCPaRoHnkmEgq0nMn7NFDr4n2KICDtSfESw?=
 =?us-ascii?Q?SdEuthNx2dcqbqU0tb1O3iYloaeMv7V2yS+hPnrmY6g8KC5hFqNdscmT0QAA?=
 =?us-ascii?Q?fv5l2XqKplbemGaYriEi07OQtZJi5duWLtZkLWMxUsw/oYUvjwYNEo+g49Bp?=
 =?us-ascii?Q?kq5SJFmkTleK15jdTMWiyv8aIxkK7vnq5UNwh8FTCbkcGuW+t0cFahfMAfst?=
 =?us-ascii?Q?ZVfX076XmuVjmwQau80a/NKVB7RXB8/MxMA5ezuQoQwXLeHn0iMqQ0w59ftm?=
 =?us-ascii?Q?Bcy4vWMVTcHQ0+h2HxsIKQAKXJfIa3KCowp6e+B7zIcYB2TyOqiOw8UQ2NJk?=
 =?us-ascii?Q?khR2Cvdv73DxeoxEXUjXWEKLh+2Qi/7VmucDBrxMT9RwQy1CbgiRoXUtpNoH?=
 =?us-ascii?Q?0zAfBbmJW9f8S7+2z8xWX4R0VY0Sqh6O1Y8O54rzneZH0vk6Uk1WIy7B2IuJ?=
 =?us-ascii?Q?odHvv8W+HTixP3xH/Tn0oXqHKv4urtFrUrk908HqYWGyp0xI1hky/T42lrlp?=
 =?us-ascii?Q?rq19Zr3JvlLVwjQckPInB8ASWwlL+rVUV0DJEZS33VZLn7zNw6m7SxP3OqUq?=
 =?us-ascii?Q?Z+9/h1R0vGH5JXdsKS/eOKTnojMdzl2sxdBMyIUWg7FtHhZsk63DvEG29Cpd?=
 =?us-ascii?Q?OXM8M0AOTisI0Nm763zS+LnPtFjHHG0wevbLIhRSVKWEHTdH3gdL34a0iZZR?=
 =?us-ascii?Q?P9zivycecUcSduV5fl4ajVfgwWDGXyYaqpoGsa1yc5nS1iPO+LKit324W8kI?=
 =?us-ascii?Q?oBew6pAfx49r+bd9LEEStgpFZuf1sSxDr6ITVQBf83aezadXJ/9i6iT5mbf3?=
 =?us-ascii?Q?BI5RjlScUmoTQe4RrihdBI5BG2dov9CEGawOnFSfsYoo9dGz9DNlPO++yCeP?=
 =?us-ascii?Q?xRDFwdED+MzvDgYq1dSs7ulHDwm3tAhZDOXQKu1qWKrkCpRk8Cy18ipsMq7f?=
 =?us-ascii?Q?sjyBEi0L97oe8yhIutR+ZPIWtNs6yzOGF7PMURO3H7xf6l6l8U8AQ6pQkjYf?=
 =?us-ascii?Q?qimrH6RO5lgso3TsA3MeNaYOY4RBJcAV4SvQQiyk+qTEX5O6ScDTHK9JdYeC?=
 =?us-ascii?Q?sPOKStwoz211ryuDJr0ESro+WD+Jtn57suQcAbcLjSwYpQvAkWujbAewFZM6?=
 =?us-ascii?Q?eYllZQkrE3MR/2GOYq+qw+sfJALn0TAfQGa8jOp2Hja0SYnFbPTrSDyEXoXI?=
 =?us-ascii?Q?/wd5K6nB4Rt1cjGh0cDUkjBplOLebADDWpFXBYSB+Kx+AS3we+OwEiO5e9kl?=
 =?us-ascii?Q?yteVKjBc7U+1HWnYoHvfVwVOZfnNuyHnijh6MtAf/eyD5L1ogiNTGJfcYbIW?=
 =?us-ascii?Q?4w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e60aef-1a13-42ac-856b-08d997c223ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2021 14:17:12.5200 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BCs7RuM9+Rs2jOJ9k3KIyNDnVSYJEAjAhx9PBZM/SbaF6DKxe9nem7QF7bQhVieNVYnosD0urZ1tUNz/tv4Ohg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB3697
Received-SPF: pass client-ip=2a01:111:f400:fe41::718;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-BN3-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
> Split out the conditional conversion from a more complex logical operatio=
n to a
> simple NOT.  Create a couple more helpers to make this easy for the outer=
-most
> logical operations.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 154 +++++++++++++++++++++++++++----------------------
>  1 file changed, 86 insertions(+), 68 deletions(-)

>  static bool fold_eqv(OptContext *ctx, TCGOp *op)  {
> -    return fold_const2(ctx, op);
> +    if (fold_const2(ctx, op) ||
> +        fold_xi_to_not(ctx, op, 0)) {

Should be fold_ix_to_not (not fold xi_to_not).

>  static bool fold_orc(OptContext *ctx, TCGOp *op)  {
> -    return fold_const2(ctx, op);
> +    if (fold_const2(ctx, op) ||
> +        fold_xi_to_not(ctx, op, 0)) {

Same here.

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

