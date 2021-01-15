Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFA02F6FE4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 02:15:14 +0100 (CET)
Received: from localhost ([::1]:59798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Dhp-0002Kp-Ue
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 20:15:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l0DaI-00041s-R1; Thu, 14 Jan 2021 20:07:26 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:44771 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l0DaC-0003QC-P8; Thu, 14 Jan 2021 20:07:24 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DH31b40z1z9sVw; Fri, 15 Jan 2021 12:07:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610672835;
 bh=SSXnBy78iKq7t0aHzKCFRMDqpJrCQdRuhjmUF+mKRfg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SQMh/F8Ol/N5UeORcSsqypBcyydSke0zOknDzWE51UyaQv4mb33ZxiarZS/cajzWP
 BykE86OX8JlmHPhAmhWZPLKsVyZvnhe/zH4QWPdfM5lS2DLwH59TCd1/4PcoU8EY9W
 4+iNhTAImMJ9TEoFzWIe6ed6pZl/BFWbWbsDEIck=
Date: Fri, 15 Jan 2021 11:42:29 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v1 1/7] spapr.h: fix trailing whitespace in phb_placement
Message-ID: <20210115004229.GQ435587@yekko.fritz.box>
References: <20210114180628.1675603-1-danielhb413@gmail.com>
 <20210114180628.1675603-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="l8yJEXo8J9fv7OFY"
Content-Disposition: inline
In-Reply-To: <20210114180628.1675603-2-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--l8yJEXo8J9fv7OFY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 03:06:22PM -0300, Daniel Henrique Barboza wrote:
> This whitespace was messing with lots of diffs if you happen
> to use an editor that eliminates trailing whitespaces on file
> save.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Applied to ppc-for-6.0, thanks.

> ---
>  include/hw/ppc/spapr.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 1cc19575f5..4d37c2a93b 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -145,7 +145,7 @@ struct SpaprMachineClass {
>      bool pre_6_0_memory_unplug;
> =20
>      bool (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
> -                          uint64_t *buid, hwaddr *pio,=20
> +                          uint64_t *buid, hwaddr *pio,
>                            hwaddr *mmio32, hwaddr *mmio64,
>                            unsigned n_dma, uint32_t *liobns, hwaddr *nv2g=
pa,
>                            hwaddr *nv2atsd, Error **errp);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--l8yJEXo8J9fv7OFY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAA5PMACgkQbDjKyiDZ
s5IDwBAAqGqdb3b/Sf9mpYaxh1kQxhPwEPf2tAc/BLadPPJivxNLMGWVizxb1N1L
42IVcbBJzFW33APh7aHifmrT9bRp0XC4NLtU/5PB2vkYsGCRL2imoUo4/f8iaW3l
+xauGgv8CTGp+UgYjGodO9xUDeEbx5rTHR9/jcT5zXEtfwdWYTcUEMUXx7L+TZLk
cf6ff4J3aumPfzZW0ApkpOgcnXdM9nmCpDeJQKMqKJZrAHkYLU1UODqm0w8Kb2i7
/H3v+nIzUKgwKEZtWUyWQnwAKbZuUAriggL811W/XkwbfDZGFxZLySj98FCD8ZZU
LID7dUAXGB2hUqls3WBbXbaoDmAu/XLlGxPtI5jMOOqH+iezjGrXPXJS5fGUC1h5
AKyWN5yZjPm8JvbuGi+4tuCq+jpCebZLdunC6OsMvIAkaFDuwCQaIFtAtd8LG0RK
sxZB3KBVZMtNokRJGLFV8vf5myPVK//ObDzs3+uytbg1c4NTopKCN556gUoKt/vh
d0LJjF6sH+/oKu+atL7dVykvLlBlYHJBqjdB6YLAkGDMMqYhPnnmDMjJmYBGO6Nk
y1oPAGb5LsRJoG6hL71woCuvtsjtm8FqyVGsvUm0zFMD9ot0Mf57i3mh4MGLHcEN
zAoChAwSuFuSnuJ2cyh8tZqoNTGdjfOxHEGRnHJ4QEUY8d4yVyI=
=w+KC
-----END PGP SIGNATURE-----

--l8yJEXo8J9fv7OFY--

