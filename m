Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93654373485
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 07:03:09 +0200 (CEST)
Received: from localhost ([::1]:53652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le9gi-00034W-3W
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 01:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1le9eR-0001y3-JG; Wed, 05 May 2021 01:00:49 -0400
Received: from ozlabs.org ([203.11.71.1]:43983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1le9eP-0007uZ-4s; Wed, 05 May 2021 01:00:47 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZl075gMPz9sRR; Wed,  5 May 2021 15:00:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620190839;
 bh=DsPXfJAMkQAXO1VpNauxnPKLfM5l/FRRzR5DgDGotw0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UODf4gRrg0DIoo6TH28ADzchgf3SraReMSZDIq6NDKXWXxkYeouS5v18RwPzG4N/Y
 8vJ9vJiX9LRWwRsi1iqcQ7lc5k83C61hWOZYT5VvChmC/ZVMugs1kqVh0MYpohJ/GU
 o7aWHaaEoiggiS3LgqbR7TkNsLX4PGcO+T/815qw=
Date: Wed, 5 May 2021 14:58:51 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
Subject: Re: [RFC PATCH v2 2/2] hw/ppc: Moved TCG code to spapr_hcall_tcg
Message-ID: <YJImCwjXUsiKe7mi@yekko>
References: <20210430184047.81653-1-lucas.araujo@eldorado.org.br>
 <20210430184047.81653-3-lucas.araujo@eldorado.org.br>
 <YI99TaLqKsqBRRxJ@yekko>
 <58cd0298-51e2-3c4f-af15-4b09aa0b71d7@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RmbCv+cmOf26llgF"
Content-Disposition: inline
In-Reply-To: <58cd0298-51e2-3c4f-af15-4b09aa0b71d7@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: bruno.larsen@eldorado.org.br, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 farosas@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--RmbCv+cmOf26llgF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 04, 2021 at 03:14:17PM -0300, Lucas Mateus Martins Araujo e Cas=
tro wrote:
>=20
> On 03/05/2021 01:34, David Gibson wrote:
> > On Fri, Apr 30, 2021 at 03:40:47PM -0300, Lucas Mateus Castro (alqotel)=
 wrote:
> > > Moved h_enter, remove_hpte, h_remove, h_bulk_remove,h_protect and
> > > h_read to spapr_hcall_tcg.c, added h_tcg_only to be used in a !TCG
> > > environment in spapr_hcall.c and changed build options to only build
> > > spapr_hcall_tcg.c when CONFIG_TCG is enabled.
> > This looks good.  I'd suggest the name 'spapr_softmmu.c' instead,
> > which more specifically describes what's special about these
> > functions.
> >=20
> > h_resize_hpt_prepare(), h_resize_hpt_commit() and the functions they
> > depend on belong in the softmmu set as well.
>=20
> Moved these hcalls to spapr_softmmu.c as well, along with the most
> functions they depend on, but 1 function (push_sregs_to_kvm_pr) is
> also used by hcalls in spapr_hcall.c, so for now I'm just leaving it in
> spapr_hcall.c and exporting it to be used in spapr_softmmu.c.

Right.  That one's an ugly workaround for some weird KVM PR behaviour,
and we will need it in the common code.

> On a related note, from what I've seen h_resize_hpt_prepare and
> h_resize_hpt_commit are not implementede in KVM, so they're only
> called when there's softmmu so that's why they can be moved to
> spapr_softmmu.c?

Ah, sorry, I forgot how these worked.  The bulk of the logic to
implement these *is* in KVM, but KVM doesn't directly intercept them
as hcalls.  Instead the hcall is caught by qemu, but it just forwards
them back to KVM by calling an ioctl().  See the calls to
kvmppc_resize_hpt_prepare() and kvmppc_resize_hpt_commit() in
spapr_hcall.c.

[Aside: the reason for this is that they're not latency critical, and
 it's useful for qemu to be aware of and possibly filter HPT resize
 requests, but because KVM manages the HPT, qemu can't implement these
 directly for the KVM case]

So what we'll need to do for those is keep the first part if
h_resize_hpt_{prepare,commit}() in common code - that's basically just
parameter validation - up to the call to
kvmppc_resize_hpt_{prepare,commit}().

if the kvmppc_() call fails with -ENOSYS then we need to do
	if (kvm_enabled()) {
		return H_HARDWARE;
	}
	softmmu_resize_hpt_{prepare,commit}()

Where that softmmu_..() function is the remainder of the logic that's
in the current implementation.  That bit can move to the softmmu file
and can be stubbed with an assert-not-reached for the !TCG case.

In practice we should never actually hit that H_HARDWARE - we should
have failed at machine setup if we tried to enable the resize HPT
feature on a KVM that doesn't implement it.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--RmbCv+cmOf26llgF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCSJgkACgkQbDjKyiDZ
s5KKFhAAwHUfQaF3Ls9VeF9em4rQrmgFoGKgW5nT04qBdoBlw+AvdtqHLkDm8v7O
XjPcRjKiUkLHvK4u9rrMo5NuIfKqzn4QC0FwRWMAvClMK0WCk2ZFm8llSjDLSXzV
Nf1c1GdDwRJ5pYm8HhHdQG2hHErClVsvBJC7dpVa1ialj96H8CImjOoSq4O5Fkr1
BEqPxLVGoKZo9b1+OtKz8kXNsEW84zdeKB0Zjj/5NBhuNlmVjCPZPPCBkUx8f+Vg
z8TG2Gc/5pErTINBKNmTdj+4ItVoJ864cJx7IqfflJiOEVkyyfGbbVawigwcngUI
NtM865VyPH4sr+VNcoZCeUPeM9NIJoIbButC6DnNQ8nYnS4CEU48XVHiV+iyjIrR
kQ92qgJ61FTGvm9fB9R747qHOPmlokXjIRlQf7fxO86Zss7ItqWLT7Q+cFIUDLRA
M9/4qvDcQJKpqxwk92o6T6edn4AZkmFU5oL0jQrG99rTWpXYPivH4TZ7oKDiUT5T
B6wSUsW/oZgv2nlAnG06cwuPi7B2EONL0m+4NJzAGfjgAgkg2sPE7jsIeQp9QE/e
b2J7WkiS7LZmEy163miLMAK812FKX0AS2wrCR7k2g5eUzOcYPB6s8LmSB7Vd13Et
zxuM07jaelMAlehcJw14iCR3fA9aQUpz5pCPE5A58uf0eyvG9Qo=
=DyJg
-----END PGP SIGNATURE-----

--RmbCv+cmOf26llgF--

