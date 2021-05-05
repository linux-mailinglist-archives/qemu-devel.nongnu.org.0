Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 913413734CC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 07:51:58 +0200 (CEST)
Received: from localhost ([::1]:50336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leARx-0001UP-De
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 01:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1leAQL-0000jw-KV; Wed, 05 May 2021 01:50:18 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:59435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1leAQI-0006vj-Mc; Wed, 05 May 2021 01:50:17 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZm5B69Bkz9sSs; Wed,  5 May 2021 15:50:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620193806;
 bh=jAq2zp64SpSpSQIJ9hH4zcxC45A+W8IurEZSogi4rZ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bZaKyABkAzh1nM2PMmki+jRk2F8+vHNI3sTFPw24vUHB0YllaUGvxWFk/rQH1AtFz
 9CpBsDTfxaXLXmisuOopU3ylByG86Ue2Qf5j4OosVxET6RQukLx2GurPtgAPftjrA5
 gVEUK4HCbM3kBuW/e/RJCZ5YG05XWggv9eMpbx+Q=
Date: Wed, 5 May 2021 15:50:02 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH v5 3/3] ppc: Enable 2nd DAWR support on p10
Message-ID: <YJIyCnVYohsdKLvf@yekko>
References: <20210412114433.129702-1-ravi.bangoria@linux.ibm.com>
 <20210412114433.129702-4-ravi.bangoria@linux.ibm.com>
 <YH0M1YdINJqbdqP+@yekko.fritz.box>
 <ca21d852-4b54-01d3-baab-cc8d0d50e505@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rihsVy5hImpJBoPR"
Content-Disposition: inline
In-Reply-To: <ca21d852-4b54-01d3-baab-cc8d0d50e505@linux.ibm.com>
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
Cc: qemu-ppc@nongnu.org, mikey@neuling.org, kvm@vger.kernel.org, mst@redhat.com,
 mpe@ellerman.id.au, cohuck@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
 paulus@samba.org, clg@kaod.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--rihsVy5hImpJBoPR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 21, 2021 at 11:50:40AM +0530, Ravi Bangoria wrote:
> Hi David,
>=20
> On 4/19/21 10:23 AM, David Gibson wrote:
> > On Mon, Apr 12, 2021 at 05:14:33PM +0530, Ravi Bangoria wrote:
> > > As per the PAPR, bit 0 of byte 64 in pa-features property indicates
> > > availability of 2nd DAWR registers. i.e. If this bit is set, 2nd
> > > DAWR is present, otherwise not. Use KVM_CAP_PPC_DAWR1 capability to
> > > find whether kvm supports 2nd DAWR or not. If it's supported, allow
> > > user to set the pa-feature bit in guest DT using cap-dawr1 machine
> > > capability. Though, watchpoint on powerpc TCG guest is not supported
> > > and thus 2nd DAWR is not enabled for TCG mode.
> > >=20
> > > Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> > > Reviewed-by: Greg Kurz <groug@kaod.org>
> >=20
> > So, I'm actually not sure if using an spapr capability is what we want
> > to do here.  The problem is that presumably the idea is to at some
> > point make the DAWR1 capability default to on (on POWER10, at least).
> > But at that point you'll no longer to be able to start TCG guests
> > without explicitly disabling it.  That's technically correct, since we
> > don't implement DAWR1 in TCG, but then we also don't implement DAWR0
> > and we let that slide... which I think is probably going to cause less
> > irritation on balance.
>=20
> Ok. Probably something like this is what you want?
>=20
> Power10 behavior:
>   - KVM does not support DAWR1: Boot the guest without DAWR1
>     support (No warnings). Error out only if user tries with
>     cap-dawr1=3Don.
>   - KVM supports DAWR1: Boot the guest with DAWR1 support, unless
>     user specifies cap-dawr1=3Doff.
>   - TCG guest: Ignore cap-dawr1 i.e. boot as if there is only
>     DAWR0 (Should be fixed in future while adding PowerPC watch-
>     point support in TCG mode)
>=20
> Power10 predecessor behavior:
>   - KVM guest: Boot the guest without DAWR1 support. Error out
>     if user tries with cap-dawr1=3Don.
>   - TCG guest: Ignore cap-dawr1 i.e. boot as if there is only
>     DAWR0 (Should be fixed in future while adding PowerPC watch-
>     point support in TCG mode)

Sorry I've neglected this thread so long.  I'm afraid the logic above
won't work.  As a general rule we never want to change guest-visible
details of the platform based on KVM capabilities, because it makes a
total mess of migration across clusters.

So, if we'd introduced this along with initial POWER10 support, I
don't think we'd need a capability at all: we just present DAWR1 on
POWER10, don't otherwise.  The fact it doesn't work in TCG we just
treat as a TCG bug we'll probably never get around to fixing, just
like TCG not supporting DAWR0 is a TCG bug right now.

Since we have released versions with POWER10 support, but no DAWR1, in
theory we need a capability so new qemu with old machine types don't
gain guest visible features that the same machine types on older qemus
had.

Except.. there's a loophole we might use to sidestep that.  The
current POWER10 CPU modelled in qemu is a DD1 - which I strongly
suspect will never appear outside of IBM.  I'm pretty sure we want to
replace that with a DD2.

While the modelled CPU is DD1, I think it's pretty reasonable to say
our POWER10 support hasn't yet stabilized, and it would therefore be
ok to simply add DAWR1 on POWER10 unconditionally, as long as we do it
before we switch over to DD2.

> > I'm wondering if we're actually just better off setting the pa feature
> > just based on the guest CPU model.  TCG will be broken if you try to
> > use it, but then, it already is.  AFAIK there's no inherent reason we
> > couldn't implement DAWR support in TCG, it's just never been worth the
> > trouble.
>=20
> Correct. Probably there is no practical usecase for DAWR in TCG mode.
>=20
> Thanks,
> Ravi
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rihsVy5hImpJBoPR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCSMggACgkQbDjKyiDZ
s5KcRRAAqZ5xW57N59aAFUpH3oGVocRIH6LhTt/QLvQfQNEhPbljGk7xxkQR3uY9
WEOJcBiUw6oyB9ScN3369epif6V1L5yImaMOkC/MK2cLPb7/2gaL4z7p26Y9zcHO
jvb4aImHgO+ggoDDr7Tqv3YTVjFixmeDssXjFM7Tb2B+tMzpBMwstoEeifpDbpf7
/cUv8oz8y1L6W4jwP7OUNlsWpkIrt/fU8nLxkzYmDNdW1+y0BXLsPcShejrwD9Bt
gl217blLDNH6MWWmT0XjQnn8i6Fi3ApvgLfLSvRG7TS3+x0CPX9TKqceLgu6uj7U
LtliubKyOkCeEfaOnoq+7XnFMX9GaQehssLf2AlR1Lfqks1f/tM5BAG4L7aRJWjG
bkx9PvWoHKyIydbugmLh7XtPAC0cpL7zmPqzx+p6AbLMf3j715nZsD/QJZRbDde0
RRsyNaL1pPowlQ7Q1uG4oFryF/yBa6nOnQGdf3Uvnb+SdrWrypWzEu3DCdnSVvsL
ehU9GFgXUpC8xwrKa45BrRDGfnyh/TzipibIwTZy7IVXmBHNuByUwsBnOjwSTtZD
Q6NLtQj9FN8KsEhq1az+T/jEYiF0Eas7CYT8QLdWxbB5PdH1cFQE4xadxouWw1i6
BPmP/wiRhb8dyXywQb9WymZ2ICRwooLIjADIYzd9sehJlgimu8Q=
=Edf7
-----END PGP SIGNATURE-----

--rihsVy5hImpJBoPR--

