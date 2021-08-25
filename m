Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3383F6E3D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 06:21:57 +0200 (CEST)
Received: from localhost ([::1]:47478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIkQB-0004V3-36
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 00:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkGf-0000i4-1H; Wed, 25 Aug 2021 00:12:01 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:47491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkGd-0007UK-1c; Wed, 25 Aug 2021 00:12:00 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GvXbv0ZKZz9t25; Wed, 25 Aug 2021 14:11:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629864699;
 bh=UGpGElX14iG3C+xyTzHaz/Q3HV0XZ2hAPoijIn4n1kA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WEEEY+4ByYdr133lZR2kVtUSgDop3uIYf0EHrZ42ZIiO9PxxJLfN1bT0ykm7NfZNB
 +idpN5oZRWAaKQcB+XgOA7tuEaeP1qq6G/Wj10adkxodOblMoqVkmmAe5lqfPbUJe+
 SqrmOVjJvzU3LrVf05kAPeAyxQYmEcuX1ZZsyAA8=
Date: Wed, 25 Aug 2021 13:50:32 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v7 4/7] qapi/qdev.json: fix DEVICE_DELETED parameters doc
Message-ID: <YSW+CG1N7KMUpUJ3@yekko>
References: <20210825004835.472919-1-danielhb413@gmail.com>
 <20210825004835.472919-5-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9n4odXFesCDo7jkP"
Content-Disposition: inline
In-Reply-To: <20210825004835.472919-5-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: armbru@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--9n4odXFesCDo7jkP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2021 at 09:48:32PM -0300, Daniel Henrique Barboza wrote:
> Clarify that @device is optional and that 'path' is the device
> path from QOM.
>=20
> This change follows Markus' suggestion verbatim, provided in full
> context here:
>=20
> https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg01891.html
>=20
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  qapi/qdev.json | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/qapi/qdev.json b/qapi/qdev.json
> index b83178220b..0e9cb2ae88 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -108,9 +108,9 @@
>  # At this point, it's safe to reuse the specified device ID. Device remo=
val can
>  # be initiated by the guest or by HMP/QMP commands.
>  #
> -# @device: device name
> +# @device: the device's ID if it has one
>  #
> -# @path: device path
> +# @path: the device's QOM path
>  #
>  # Since: 1.5
>  #

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9n4odXFesCDo7jkP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmElvggACgkQbDjKyiDZ
s5LKyQ/9FHK9TZxb42pnb0RZMnERBrHkQ7R4Xgw/Z892LKJEtDAbkFl667IrY8eZ
55pb2v/DphePz3KYSq8ZMevYVTRX5N6gUEGcPW/ZpWGkG3MqguHAixe0L0NHH5Pi
relEDICjRDOKTdjxwxlbUjzsQR9gh1321uGVjEJqXNIcLXg6CSE98lwQ3l1Z8Dq/
K0mM6DiCgek3zTE8Lej7BJTUQZ79+wWShAY+CynJeq+Zll+XklvzjGXTodryVsuz
R1tt3tMkhwEpeJziibEGhYYQ/+pgHg4+lZ19DB/q7Y4HCEqxCqsQqpYKHEGP2LYt
Dj13L376jg5Lb0v5q/2TBW5JpYZcGj6rz59x7A6xQ+jD0LAzuXVrVMqkcJn7ZVE1
fjlEokzsrVGaVCqsiJmHDvU8ZDRBgVLWjbJsTY3vw6HIKywcqI5zgmN4YL+yMwB7
4iKG6uhqSZUA5rt8FIb1I6qKD4Ashjqh16l76qVukh4qQp806iWmReBx7Zy/MUT6
kW4+d29H6nuHjNwMRMdTi4K9FFF9JQ9PNA6oueYyA//JbHMJgbRp2ASWUbe3Ado3
Ot2vWUwha6ayjXS7E2g5Ul97fphYQOD8JIhZxB7DzdxrAWJq1LBLO8FWoAO4FNRY
Lb6dRKW7zLvx6SD1+hsh5OHwjRVuOMjXJgPHD6fNfVHFW9k3a88=
=9ApN
-----END PGP SIGNATURE-----

--9n4odXFesCDo7jkP--

