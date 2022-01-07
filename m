Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D624877DE
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 13:58:30 +0100 (CET)
Received: from localhost ([::1]:57874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5opA-0004VY-FM
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 07:58:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n5oaR-0007Xu-H8; Fri, 07 Jan 2022 07:43:16 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:35657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n5oaJ-0006iV-Lw; Fri, 07 Jan 2022 07:43:15 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JVjYZ1WQ5z4xsl; Fri,  7 Jan 2022 23:42:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1641559378;
 bh=LCL0bMUMv+sRe7PPfMCxCqr1fPz4xGWuZAmLJxbi7k8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=foCZvJsNuRCCD/MdlO5J6tWoFcVV5GhH4PRK/Wt1YfjOe31ehpHxdG9OPyzsUbarV
 L4bKeKWnctiJ3HoaHgrrxh/r/PA1931pdNvAPaLT+TquKfpy3fC/wIfKJFKS+dzukU
 MbLDkLDm+81sgYexPJQKKph3rJnBfeIhPS7nKF8U=
Date: Fri, 7 Jan 2022 23:19:03 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH qemu] spapr: Force 32bit when resetting a core
Message-ID: <Ydgvt0VwFUP0MD5h@yekko>
References: <20220107072423.2278113-1-aik@ozlabs.ru>
 <20220107125747.7ddfd3a0@bahia>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oB/IwnUxNJgkZ4nW"
Content-Disposition: inline
In-Reply-To: <20220107125747.7ddfd3a0@bahia>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--oB/IwnUxNJgkZ4nW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 07, 2022 at 12:57:47PM +0100, Greg Kurz wrote:
> On Fri, 7 Jan 2022 18:24:23 +1100
> Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>=20
> > "PowerPC Processor binding to IEEE 1275" says in
> > "8.2.1. Initial Register Values" that the initial state is defined as
> > 32bit so do it for both SLOF and VOF.
> >=20
> > This should not cause behavioral change as SLOF switches to 64bit very
> > early anyway.=20
>=20
> Only one CPU goes through SLOF. What about the other ones, including
> hot plugged CPUs ?

Those will be started by the start-cpu RTAS call which has its own
semantics.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--oB/IwnUxNJgkZ4nW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHYL7UACgkQbDjKyiDZ
s5KjwhAAtkCKnBCpltEHsdrGxCM7akwmuEpcZTO9yvKFMb3oIWkbAvxFVwR3LVpe
/99oCNccc3ZubrxpoHaHZ3ebLi0C/rCN/F0PYbX+4JxDtDgkIqpDA0C2lj2LIi92
CiyU1QhzG+3l33dZuvr/HibLj5NhnJnwBGCULxc7g35ZdrH3BwHBg1f6QNasdo3y
tAdHsqnT7+nuo8n6JB3Oryx7Hg35oqmXvYAIFVETFF9gy00G+cPAGwJ35RkgIVA9
ONOH2wxQM5MeyBdvtv/mQc5WRFo4xWhgkGkkxWNKIl/nxlE0OA5KDk5KBr9sImrU
7zT5/6bMQYkTEXHlFv+juxUm/10BTOhCl0Zm1kR4WefDL83hjhQbn4FvZ/DFRNFl
r+AGKqJMTeAATd+BTNEJXsfDSSRKc7v4eT/FPKgY6SHAdlhIdvm1whvsL1MkNDH6
a9Qw0IFsV+R6XNJvzDLC5fIVPFihG60fKAbMXo5XtuBmNV5app1ImKXvkV0tdDEM
bClk1G23AAvtYIQ0GinUmwloqtZguqD2C7psQk2jzCwuO3JFOdR5hmCfZv6Ya2++
Uu7Rsl8athEsRmqm6h1blRCoTSiy40ylqlzKTgiHVY/7r45nBULarCD/QqOD/KM1
5QvtUR9OdRHho97diIP3enH//PsD2Sl095Faydr/+NfvLCOcQwk=
=pWi3
-----END PGP SIGNATURE-----

--oB/IwnUxNJgkZ4nW--

