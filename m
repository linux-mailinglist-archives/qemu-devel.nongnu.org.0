Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5F42D6CD1
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 02:04:05 +0100 (CET)
Received: from localhost ([::1]:58926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knWqp-0004D1-Re
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 20:04:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knWpN-0003k8-3u; Thu, 10 Dec 2020 20:02:34 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:47191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knWp9-0007cT-7k; Thu, 10 Dec 2020 20:02:32 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CsXYx27x0z9sWV; Fri, 11 Dec 2020 12:02:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607648533;
 bh=ONKd0dOBQA5kfVe7pK4Ti5t+03OtwW2npcp/3Ox9+Mc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oE7tkwh008KTFYTvZuwHNSJ3zcWv2EOr7LVaJCAa0mbooovEA0eT0bWa9bD5eg2E4
 PREPc4N+iupSrpF7rnNQUJhDPyTwfDZ3qwLw1iOKQK/VkckK/iauENxgeurf7JSsnf
 Rb8o8FnZL34tY0x5HYujelXzvav0e3CSzVNOptw8=
Date: Fri, 11 Dec 2020 11:21:05 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 0/1] spapr.c: set a 'kvm-type' default value instead
 of relying on NULL
Message-ID: <20201211002105.GA4874@yekko.fritz.box>
References: <20201210145517.1532269-1-danielhb413@gmail.com>
 <6d8cac99-68e1-61bf-e270-b0287b8d48fa@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline
In-Reply-To: <6d8cac99-68e1-61bf-e270-b0287b8d48fa@redhat.com>
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2020 at 05:51:41PM +0100, Paolo Bonzini wrote:
> On 10/12/20 15:55, Daniel Henrique Barboza wrote:
> > changes from v2, all proposed by Greg:
> > * Handle 'NULL' value as default mode fallback in spapr_kvm_type()
> > * Do not allow for 'AUTO' to be a valid mode in spapr_kvm_type()
> > * Initialize 'spapr->kvm_type' in spapr_instance_init() like Paolo
> >    proposed. This will spare us from changing spapr_get_kvm_type()
> >    altogether.
> > v2 link: https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg02623=
=2Ehtml
> >=20
> >=20
> > This patch addresses an issue that happens with the pseries machine aft=
er
> > testing Paolo's patch [1]:
> >=20
> > $ sudo ./ppc64-softmmu/qemu-system-ppc64 -nographic -nodefaults -machin=
e pseries --enable-kvm
> > qemu-system-ppc64: Unknown kvm-type specified ''
> >=20
> > The reason lies on how qemu_opt_get() and object_property_get_str() wor=
ks
> > when there is no 'kvm-type' specified. We were conting on receiving NULL
> > for kvm-type, but the latter will use a blank string "". Instead on rel=
ying
> > on NULL, let's expose the already existing 'auto' kvm-type mode to the =
users
> > and use that as default.
> >=20
> > [1] https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg00471.html
> >=20
> > Daniel Henrique Barboza (1):
> >    spapr.c: set a 'kvm-type' default value instead of relying on NULL
> >=20
> >   hw/ppc/spapr.c | 21 +++++++++++++++++----
> >   1 file changed, 17 insertions(+), 4 deletions(-)
> >=20
>=20
> Will queue, thanks!

I've also put it into my ppc-for-6.0 tree, which I plan to send a PR
for shortly.  I guess it should be an easy conflict to resolve, so I
don't think that will be a problem.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/Su28ACgkQbDjKyiDZ
s5IuXhAA46OjcbAwMbEgeDqsi/XtVe8cCbsdyCxqJLE4pcQbQ3TMZrt1TBBv+I3F
rjhfXt+lyQGdB4LV5Qjm6FRE/C/szseir4Ebw1jvkk6Ia0zaPvzF/8U0C69ye3v/
ijziIWiU8y31EL48Kgn70ZYMl1rMhXUZLeq2CigUELuE0V99hIhzE7t+SNAgzv3f
womCyuVFE7hnQmT6BQaXlXDKEPlvyeDXwCo1SsburOPWmMXsrydbiW8nRT+bnIML
1zKWiDjZbTSZG16LDXKvHL+9EVwqBikJUQT8fVzPYMSlabEcz2zD7G9iviOn14Bb
Lr0sPWCfod2D3V5jnNkKsqt4kxg8ZxU+TUOaLvo/jhBXdoMDt9nfk/NiwTH55TdP
iGUABQgIqE/q5zRpohFzSG/8DaCxGaU2Tz0PdpvjL+RmOJYDgIoPASSuqm/wNcTH
ixW5wjan1pgJDSp/yOiGuH/nPboHybQ6jkfHj2TnSDZNGqj9nyulJeeQqEScCdPJ
XxbOvF7elZKzRrYxfG3gAM8+im4nitM5w9Oco6B/Rv8NcXGCz9QhzLdA2dSF6LSQ
ntE8e4sVHAXAR7S8Ye9MFgeNEh5NfO9DHO8x7dl/83CPbsGZLUCa7V6dSWz1DbUn
ucrotnG+B1g9cREE4ohqfKzHxAKbmkG0tKH4KfvCbVUrldiijr4=
=k875
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--

