Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8158E4B95C0
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 02:56:02 +0100 (CET)
Received: from localhost ([::1]:58398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKW1Z-0003o4-Dy
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 20:56:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKVeB-0002cQ-CM; Wed, 16 Feb 2022 20:31:52 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:56469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKVe6-0002QJ-3C; Wed, 16 Feb 2022 20:31:50 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jzck42GgQz4xsg; Thu, 17 Feb 2022 12:31:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1645061500;
 bh=zgp0c6UZFPt/q0YiwTSr6I0elEOep5HGpHEkrqwYA3k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I0VdBeD7LEsLEJpBFeVXiECtr0gSnmFpO9RMhEDoUwBT0OoppO4TsPMj8FxZuR5do
 fS2/o4O0bj3dl6tlEkcbHzq7vNcpBgyPLQ5IMQLzmtVkfFx8+zLTPpCLOk/l9zKsWJ
 lTLonihvKkCg8oXOJDJd04otsu4dK2tENeTZw3XQ=
Date: Thu, 17 Feb 2022 10:32:00 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 26/27] target/ppc: cpu_init: Move check_pow and QOM
 macros to a header
Message-ID: <Yg2JcI+inDKWGb8P@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-27-farosas@linux.ibm.com>
 <YgxpuvVtY3Roy9Pr@yekko> <87czjnx8od.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hS8cpMerK1O2zhbO"
Content-Disposition: inline
In-Reply-To: <87czjnx8od.fsf@linux.ibm.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--hS8cpMerK1O2zhbO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 16, 2022 at 10:06:26AM -0300, Fabiano Rosas wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
>=20
> > On Tue, Feb 15, 2022 at 06:41:47PM -0300, Fabiano Rosas wrote:
> >> These will need to be accessed from other files once we move the CPUs
> >> code to separate files.
> >>=20
> >> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> >> ---
> >>  target/ppc/cpu.h      | 57 +++++++++++++++++++++++++++++++++++++++++++
> >>  target/ppc/cpu_init.c | 55 -----------------------------------------
> >>  2 files changed, 57 insertions(+), 55 deletions(-)
> >>=20
> >> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> >> index 6a06a7f533..ba0739c43b 100644
> >> --- a/target/ppc/cpu.h
> >> +++ b/target/ppc/cpu.h
> >> @@ -2733,4 +2733,61 @@ void dump_mmu(CPUPPCState *env);
> >>  void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int=
 len);
> >>  void ppc_store_vscr(CPUPPCState *env, uint32_t vscr);
> >>  uint32_t ppc_get_vscr(CPUPPCState *env);
> >> +
> >> +/********************************************************************=
*********/
> >> +/* Power management enable checks                                    =
        */
> >> +static inline int check_pow_none(CPUPPCState *env)
> >> +{
> >> +    return 0;
> >> +}
> >> +
> >> +static inline int check_pow_nocheck(CPUPPCState *env)
> >> +{
> >> +    return 1;
> >> +}
> >> +
> >> +static inline int check_pow_hid0(CPUPPCState *env)
> >
> > I'm a little nervous about moving this to a more exposed location.  By
> > definition the HID register is implementation dependent, and we can
> > see immediately below that not all things use the same interpretation
> > of it in practice.  So at the very least it seems like it has a bad
> > name to be exposed more widely.  It also seems like it might better
> > belong next to the code for the cpus that actually use this version.
>=20
> Good point. Since these are quite simple it might be best to duplicate
> them when doing the split between the families. I'm doing the same for
> vscr_init.

Right, that sounds like a good idea to me.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--hS8cpMerK1O2zhbO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmINiWgACgkQgypY4gEw
YSIt6hAAsqZdc5WqTZfCVW5z2ajPq6qgD370TGRmktmR0r9eL/RclLUG6wTtf3qQ
8N5Kyuy+SV/z2E7Rp4dT6iPLYXqX3AlB51DYRFuoIDO7lGVjweUCUOJL6gaelHAi
bIasHyClm5dJAen++32KotqHfbtWW9RkJSBfsfxcFYL7Q3g006RptfUhsxP9IVmv
xdJ+H3zxNdt/jSnFES6l9n63Ozcs9G5yitZrZn5pUyN6DeYcvzmkAWcyF58oqix7
ZCml5bNB3QoyKFcNcltKKpWBKBwoAAfAxHtNqZX/umvnFmv+zBgtsqA3LYZBbosO
oCOFBVnXXVhsApSgroZ0Ot/ShLbs7Q0JZMUh+8E6D7SE92mDz11pty5EV6XHKvcX
z65yAJsPtl7ykfKAk0sPtpMWD8oXOyYPl8YLm84kNKrE3afPHjQwWlpsOVKW99mg
LM9RST0DtVdtpP8bkkK0jqvOgF45sXbwFYXf376Z8hqzwYQWWNteMraQNcOkBhNm
833f0y5VqL1qnxFSDa/g2abkEnfHIVILp1yypwL5o+IcSUUiBu8tfY3Z85vmWRib
fFzPL+1antWQUxQns4AcwTwhqAgxCmDpzCjAoE2hi7DnWlA0J67EGiyqRvJERgtC
eRgRLSv7X+3wUkgwSUlILll8Xm/wRp2U0Jqadp6bbVpOmHe+FJk=
=D/NZ
-----END PGP SIGNATURE-----

--hS8cpMerK1O2zhbO--

