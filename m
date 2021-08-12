Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1713E9C06
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 03:44:59 +0200 (CEST)
Received: from localhost ([::1]:48828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDzmE-0000Ym-8d
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 21:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDzjZ-00085h-5o; Wed, 11 Aug 2021 21:42:13 -0400
Received: from ozlabs.org ([203.11.71.1]:47751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDzjW-0000xr-If; Wed, 11 Aug 2021 21:42:12 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GlTvK1m1Sz9t4b; Thu, 12 Aug 2021 11:42:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628732525;
 bh=5+m1ZhXnKqqLTa4q1SmFi4faEe8PphuyhU9hdy3+orw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GlA1kQVoHcaYvqZPS83Sh7J3+Ou4/bxcOf4RpLQ9fBmIvnUdRvtkCa/CY6b3sOhL2
 lpV+d04EUd73t8URkBD9XM6U7iyye64rgfgRA85YTRjvW8lFFP6oKfsBcl5BzKNH7D
 cDhr6Tlfu35fpVJQQ1nOSMtoff13IauPUOrCuC84=
Date: Thu, 12 Aug 2021 11:24:27 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [RFC PATCH v0 1/2] spapr: Add H_REG_SNS hcall
Message-ID: <YRR4S1caLNrwNjBL@yekko>
References: <20210805073228.502292-1-bharata@linux.ibm.com>
 <20210805073228.502292-2-bharata@linux.ibm.com>
 <YRCl4n25l8szLQVC@yekko> <YROXtRfSAf2Gi0Yn@in.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KmmhRXhV5b+THwD5"
Content-Disposition: inline
In-Reply-To: <YROXtRfSAf2Gi0Yn@in.ibm.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: aneesh.kumar@linux.ibm.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--KmmhRXhV5b+THwD5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 11, 2021 at 02:56:13PM +0530, Bharata B Rao wrote:
> On Mon, Aug 09, 2021 at 01:49:54PM +1000, David Gibson wrote:
> > On Thu, Aug 05, 2021 at 01:02:27PM +0530, Bharata B Rao wrote:
[snip]
> > > diff --git a/linux-headers/asm-powerpc/kvm.h b/linux-headers/asm-powe=
rpc/kvm.h
> > > index 9f18fa090f..d72739126a 100644
> > > --- a/linux-headers/asm-powerpc/kvm.h
> > > +++ b/linux-headers/asm-powerpc/kvm.h
> > > @@ -470,6 +470,12 @@ struct kvm_ppc_cpu_char {
> > >  #define KVM_PPC_CPU_BEHAV_BNDS_CHK_SPEC_BAR	(1ULL << 61)
> > >  #define KVM_PPC_CPU_BEHAV_FLUSH_COUNT_CACHE	(1ull << 58)
> > > =20
> > > +/* For KVM_PPC_SET_SNS */
> > > +struct kvm_ppc_sns_reg {
> > > +	__u64 addr;
> > > +	__u64 len;
> > > +};
> > > +
> >=20
> > Updates to linux-headers/ should be done as a separate preliminary
> > patch, listing the specific kernel commit that you're updating too.
>=20
> Yes, I am aware of it. Since the kernel patches are still in RFC
> state, I noted this as a TODO in patch description :-)

Sorry, I missed that.  In general, even for draft posts, I'd suggest
doing the linux-headers/ updates as a separate patch (but you can
construct that ad-hoc).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--KmmhRXhV5b+THwD5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEUeEkACgkQbDjKyiDZ
s5ILaxAAxFiGapgpBqQlJ4EsIYq5ask5NRwvdYtSaDKqSx/9rCqWBh4gpXGxKtpt
oLXB3mnJSjcOczac5KK6MJe00FjeaBWnh555Z1p/CfGhsCoY1MnZtTpNRLYO0a2y
exCBNK1Vk3M6mTa9kZNA2sWp1xYl8cX/pxKOYV1IMZ6u/RruY7EJjbSZuoHryjA7
snXEIrheDA04AEqorrPOZ31uUAd6K7uQbZ7f72q/jrQaiHPQaWGb03+B+lE6mk4D
ltPpo9vJfnYYLAfTOoVUqToJLZ+pyi6wvp6Lbpkslm/l+h8aLWlLUjXk1lJwMr5l
Hh4NWWZIwgT8VKLlPzB2Bq5o2F+zV8+Szec/G5WgseOw3I/c0o+rYPENtjbVGDeH
SWjMqJAgT4UL11Ed2Ka+3P/Cry/Z7nTh+LBUEcnGvasyWDbyJxMiUKjOxhHmjHph
7gF68WGtNjpFQUKF+j/HOtmVHZ6fcZXHnuwVHjKhy+CDYQkxpANobqlIJUanJmAP
WQPVnXn8Ty0wkikMUhqaZaA6Tr2WJ3RbQYcR8+JfY3g1KNO/MIPV51MIMFbBmLL3
79xZw74Kc9qlzi4+4iM8U7suIIX2CwyR5WEHQvH2mhiCj5t0cqF/XDHvbPwdTAav
eA5e4ddLVh8he3lS2TA1WNkHIUIpZGfDqvEmAmi0KPF7f+D32sA=
=nWfR
-----END PGP SIGNATURE-----

--KmmhRXhV5b+THwD5--

