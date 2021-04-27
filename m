Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 684D936BE0B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 05:53:53 +0200 (CEST)
Received: from localhost ([::1]:38452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbEnI-0002MD-Ff
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 23:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lbElE-000164-Ha; Mon, 26 Apr 2021 23:51:44 -0400
Received: from ozlabs.org ([203.11.71.1]:39307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lbElC-0004FH-6e; Mon, 26 Apr 2021 23:51:44 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FTnrB0kGdz9sXG; Tue, 27 Apr 2021 13:51:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1619495498;
 bh=UrsGaG/ogZlQvBHSO0AAgF8ejltsehxSVKJv8uNDlDQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L1TzWWSWCWlmQNThh+xzIiIb+8irHjFAE97azteL9YB5hvHWxJdallfn4jEZUKzSc
 GMSjy8Fx4H3zu6zEfspKw9C3tny+wwHxmfIp612vTFGKiOCHkbPikE0l9Xe76aZDfq
 K7vW7THiBuPetbgpbMETgKhQGJFb9n2ur+C/mvG0=
Date: Tue, 27 Apr 2021 13:51:07 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [RFC PATCH 2/4] hw/ppc: Add kvm-only file spapr_hcall_tcg_stub.c
Message-ID: <YIeKKza5+BZU47G9@yekko.fritz.box>
References: <20210422193131.22560-1-lucas.araujo@eldorado.org.br>
 <20210422193131.22560-3-lucas.araujo@eldorado.org.br>
 <87wnss3bc8.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5N+HuyBtPtyi+5BO"
Content-Disposition: inline
In-Reply-To: <87wnss3bc8.fsf@linux.ibm.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: bruno.larsen@eldorado.org.br,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--5N+HuyBtPtyi+5BO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2021 at 07:06:15PM -0300, Fabiano Rosas wrote:
> "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br> writes:
>=20
> > This file should be used instead of spapr_hcall.c when compiling
> > without tcg (--disable-tcg) as it does not call tcg-only functions and
> > trips fatal error when invalid functions are called
>=20
> Not calling any TCG-specific function is not an indication of the code
> being "kvm only" in this case. So I think this patch is backwards, we
> should instead aim to remove tcg-only code from spapr_hcall.c.

Right.

> > As of right now some functions are repeated here and in spapr_hcall.c,
> > as they are static, is some other method to deal with this
> > recommended?
>=20
> Yeah, you should not be repeating the functions. From previous
> discussions on this topic I understood that we'd have another
> hypercall_register_types for TCG. So we could have a spapr_hcall_tcg.c
> that contains tcg-only functions. And they would only be used in that
> file so they would continue being static.

> > Also some functions should only cause a fatal error as KVM should
> > intercept and handle their call, but as I'm not sure which ones I just
> > did this to functions that called tcg-only code.
> >
> > Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org=
=2Ebr>
> > ---
> >  hw/ppc/spapr_hcall_tcg_stub.c | 1824 +++++++++++++++++++++++++++++++++
> >  1 file changed, 1824 insertions(+)
> >  create mode 100644 hw/ppc/spapr_hcall_tcg_stub.c
> >
> > diff --git a/hw/ppc/spapr_hcall_tcg_stub.c
> > b/hw/ppc/spapr_hcall_tcg_stub.c
>=20
> Your usage of stub here is a bit confusing. Take a look at
> target/ppc/kvm-stub.c and accel/stubs/kvm-stub.c. These are files that
> are only included in the build to satisfy any references to the symbols
> they contain. The implementation is just an empty body or an error
> return. So if the feature is included, the actual foo.c will be present
> with the proper implementation; if not, we get the empty stub.
>=20
> Also, look at target/ppc/kvm.h under #ifndef CONFIG_USER_ONLY. There's
> some similar ideas there that could be of help.
>=20
> So my suggestion for this patch is take a step back and move first all
> of the TCG-only functions that are certainly not needed. We can then
> figure out what patterns we are going to use to stub them in the
> KVM-only build. After that we take a look at what's left and go from
> there.

Right.  You should be able to stub these much more simply than this.
Just a single say "h_tcg_only()" stub, then in the !TCG case you
register that instead of the real implementation with
spapr_register_hypercall().

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5N+HuyBtPtyi+5BO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCHiisACgkQbDjKyiDZ
s5KxZg//QXInLkCxJzpJv1BT4lEgZpLbFA/z70GRNwTJdwU/UTVD1SvKmxrwuqTS
ux1ZDok09g8+Tg9BYyiSpmuJec8GFtabKFeAFngSb0LuMNOdTC5GdLjc53z0YkA/
4bKgK9AYNZ8GEEuyJdnXoNr9odlVVb1J6W09E51XYlUZD3hD+5/Eq80UFAtl7WQy
sUPoI0fS2L90bunUZ3vdVLvXi7Dafl1GV7+9+TJNJszc7UamxdHn505Xm5Qkzg6q
Zm8rpckXs622i0dUGCPtDYQFxO8SYdc7lI8se7JOjBb1UwMjfeTl+a+RimpSwu/n
nGVrbw2EmPezYR8lNATU7kZomQ4A3R0jtzFH1byQYRYwyZSd9d/MMwG70gDlS3Ys
bsy5YKPdU6yhH8+4Ni3eCERiZMMsSKx7EH8BvJjQCIFnknEHEXFA3XZLbl0lnlk6
K5JLid0ouXIDRfy2W+X9j6Fi70mfBrvvVq+8OClPvjit0LULMewnLuHPvNcQOSJz
xCvZiQr1WCUclKhc/HsIRjG903QEfvdBamohhuFkJssNxdN0j8Y4kGsQcPMaYEBW
wWduy8FZyovyH0C0UPyKDfuw6b5CZBs95Lmate2zmhHjmdFwasaAjf1IbgzGI9oh
wWiywROT015Z/+oLDT69RNMGdaXcepHlGdJUYA5Ml8hnTcKV9aY=
=0Lk9
-----END PGP SIGNATURE-----

--5N+HuyBtPtyi+5BO--

