Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8754D3FD17D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:50:21 +0200 (CEST)
Received: from localhost ([::1]:46818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLGKS-0002rb-Ey
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:50:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mLG44-0001KA-4U; Tue, 31 Aug 2021 22:33:25 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:36397 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mLG3x-0005Kl-NB; Tue, 31 Aug 2021 22:33:23 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Gzp4s6tD4z9sRf; Wed,  1 Sep 2021 12:33:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630463581;
 bh=S7ZqpZ3bNxHoe2X47zaK/1FtgiXF30StOKhuskmEYjY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pDegpLkllNGMOldAOrmTyGr7UA6kdCLiFI0SV3WOKTPZMiQI0LyhleQPPOKRYbGTA
 9nJHwIY2fW7YcFef0pGZAJERaChnGfeDzoqwtGX6VRQRSlABBnIK3jjFrbzputFZ6E
 1dxa7vxJtRNDs/fHkHkn6FKfkmbib/4VpczjuTPI=
Date: Tue, 31 Aug 2021 19:56:22 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: QEMU-KVM offers OPAL firmware interface? OpenBSD guest support?
Message-ID: <YS38xhiy3MTYphxC@yekko>
References: <20210827180259.3720d58d@bahia.lan>
 <56141ff67838992a@bloch.sibelius.xs4all.nl>
 <20210827190053.6c68def5@bahia.lan>
 <25bfa81c-9498-4e82-a848-1fbb1c188ff1@kaod.org>
 <561422a20e4f9ae2@bloch.sibelius.xs4all.nl>
 <51bff28d-4779-b023-fee6-b3e9196b7ec5@kaod.org>
 <3QoYEEZauH3xXwC2NcJFnrHe4IaWwu2fqEvtR6tR3RHsY_b0bsyz0oQdcI0b1zdwnXbXhl6bCtaUiyWQjbYgnx5U-Ov_Lm3tMGdMkTwZC88=@protonmail.com>
 <YSyBUSxBiH+UYE/Y@yekko> <20210830160431.GC61714@kunlun.suse.cz>
 <f437e50a-b9de-9599-e6de-bc84c8a14eb7@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TxwSWzRRe30QXNsW"
Content-Disposition: inline
In-Reply-To: <f437e50a-b9de-9599-e6de-bc84c8a14eb7@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pjp@centroid.eu, gardask@gmail.com, rgcinjp@disroot.org,
 "ppc@openbsd.org" <ppc@openbsd.org>, daniel@pocock.pro,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 kite@centroid.eu, Joseph <joseph.mayer@protonmail.com>,
 siliconbadger@protonmail.com, qemu-ppc@nongnu.org,
 Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>,
 Mark Kettenis <mark.kettenis@xs4all.nl>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--TxwSWzRRe30QXNsW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 31, 2021 at 09:42:05AM +0200, C=E9dric Le Goater wrote:
> On 8/30/21 6:04 PM, Michal Such=E1nek wrote:
> > On Mon, Aug 30, 2021 at 04:57:21PM +1000, David Gibson wrote:
> >> On Sun, Aug 29, 2021 at 04:09:54AM +0000, Joseph wrote:
> >>> Hi Mark, C=E9dric, Greg at the openbsd-ppc ML,
> >=20
> >>
> >> So.. if you want to run OpenBSD on POWER10 you will definitely need
> >> PAPR support, because POWER10 won't support bare metal OS access at
> >> all (it will be back to PowerVM always, like POWER5..POWER7).
> >=20
> > Hello,
> >=20
> > what is stopping powernv support other than lack of firmware support?
>=20
> Yes. that's the main issue. OpenPOWER firmware should be available
> for people to use on P10 but it won't have any support AFAIK. We just=20
> published skiboot as part of it.

Thanks for your reply.  I realized that my reply misunderstood the
question, sorry about that.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--TxwSWzRRe30QXNsW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEt/MQACgkQbDjKyiDZ
s5JXUhAA49cvTzrScFkTxI5Inok9e35XoptGBbY85lbBXkRhGb2TNX4GXv+MzG/Y
EmSLGBey2Ols71D3hLp33o1JQAAwYxn54KKec9e8JMPrR74pmfWF9/m/sN7P20QE
WuN9gEg/j0xUtgtp0ZLwGCbH2TxhSkHzU3dlZSn5puIS3BxquP2/nQrLlro8Wh6V
hSd47F9u4M8Mvwuetd7SiNjTIAIKJJEWhs7Xn8oyL5M5+uEsR282BAwzCb7tWU7D
cGDE/5Xrbg0FemAfUN8GKejHQC9EVOiqrB0IZPrbMqSkLGmk6K87Nzq/bOkYZtPk
40nTCAeUczrHCOS1Cd8Y0kYhLKDMKvyN8IvzQoOmt2l0DTHrLPigfrD4CmzkKogZ
+tGmTxmtp6iU0ffiHSE1NZDDnWwxJmkGddzKVYsA38TZGhGMYT5yhpQS7XuJ667Z
6kQ4/7oWXqnOjYF93ww8K4DmybbkdU0Gbm5BjZtuVd5UAJrSSkTxUZV4/StRBbOJ
B6Trxm+dc9/QM4BrtDLlvbObBy+udZ0CNpvEBFS6CqedMVAg3mBjNh02APGvnYcK
8EcpcEBoWnM0sAPx/LhYUAuAqK5OaeqyyShnezm9TagIu4iIF23RyJ4fUXCFahW/
DaG3N+IP6uXaZHxaXxJimovAEunV9vqX4ook9GEcAL2kw0bBIRE=
=C58+
-----END PGP SIGNATURE-----

--TxwSWzRRe30QXNsW--

