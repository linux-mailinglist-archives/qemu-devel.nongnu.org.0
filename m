Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F75211C526
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 06:10:51 +0100 (CET)
Received: from localhost ([::1]:54602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifGkU-0003x2-FL
	for lists+qemu-devel@lfdr.de; Thu, 12 Dec 2019 00:10:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58226)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ifGj6-0002Ya-P9
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 00:09:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ifGj5-0002T1-GY
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 00:09:24 -0500
Received: from ozlabs.org ([203.11.71.1]:48623)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ifGj4-0002Ku-Gq; Thu, 12 Dec 2019 00:09:23 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47YMJx09tWz9sPc; Thu, 12 Dec 2019 16:08:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1576127329;
 bh=rmqpWv+3oYeM5sCgfN2wcbVcEVrye/Sr6TuRmvwKTq0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ULAHlDWfRzNX+jePGkHwGw5eFJzhbeTyPGGIN8p3Y+EvTp/5bXNNz9BRr5bHx9TvI
 qCnorg03sEYOUPPa0qLIn8rEbYB2zeeWrdQ29KCBjYTvdEMhg64U8oUYhzADgJI1lS
 P6W3IlVdYU9FJde9QlsIfW5ZITWVq2CmBNSj1FOs=
Date: Thu, 12 Dec 2019 14:44:31 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH v5 1/3] linux-headers: Update kvm.h for ppc single step
 capability
Message-ID: <20191212034431.GT207300@umbus.fritz.box>
References: <20191211191013.454125-1-farosas@linux.ibm.com>
 <20191211191013.454125-2-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HtRZva1Vzv8iP5ye"
Content-Disposition: inline
In-Reply-To: <20191211191013.454125-2-farosas@linux.ibm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--HtRZva1Vzv8iP5ye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2019 at 04:10:11PM -0300, Fabiano Rosas wrote:
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Generally, imported linux header updates are done as a block, pulling
qemu up to a specified kernel commit id, rather than just grabbing
pieces for a particular feature.

There's actually already a header update to be2eca94d144 in my
ppc-for-5.0 tree.  Is that recent enough for what you need here?

> ---
>  linux-headers/linux/kvm.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index 3d9b18f7f8..488f3baf01 100644
> --- a/linux-headers/linux/kvm.h
> +++ b/linux-headers/linux/kvm.h
> @@ -1000,6 +1000,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_PMU_EVENT_FILTER 173
>  #define KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 174
>  #define KVM_CAP_HYPERV_DIRECT_TLBFLUSH 175
> +#define KVM_CAP_PPC_GUEST_DEBUG_SSTEP 176
> =20
>  #ifdef KVM_CAP_IRQ_ROUTING
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--HtRZva1Vzv8iP5ye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl3xt5wACgkQbDjKyiDZ
s5JXvg/8DuQM6/0ye5X/4RFCtYEdVa5x+oWQ4gn8Du7pRLnFTkG8+olvs/TG/Wxk
iX2tLZ+T02lTBZgWYi8cGpcdl8ClEMiZkFcRuebdBN3rESNs7hvAOqQ7WdGqITBR
8uKuOGFhsqksA+dJ0y9rVqzlA+Sup/XHU23RtU6IJKrhv4Uv7cB7s29OiA0Hhz+c
q1S5OEwlAQXUp0FhkovItn55S03nT+SZJRHti4irDyjpIS67NsbWudb/ki5cLlSU
deS614qnNbT21MDayf59CKu2ZcP+E6jbA/KeI1qAm/JZI+BXhA0sgFu5N4DFtLln
xFDOsfX96oxia1HP1pYcigFdV+7IEZrScj7JJrVbC6e22v/DxyIZMqG4CBzzlvuA
5QoBUM4a9cEOlB6nwjPcPEAS9TC/N8NnFMK/3tx6e+azrCX0Wd8v9TrQOBgMvf1b
hx9IYF6v1UTHEGBS+nXLCbvq4tExr0OqJJCftHjMxGlL3cqm2gMFHEGVfp4sbkUG
0JQcSeg5by/wlE4Kl4iZ5z699wx8eDozkj2lRZjcsprPSkstVHCWLh36mHSqkB1Q
qmZKUsqtuk+g+JnTQhctBO2J9ood1VfPB0ehegD0DanNKZX9/C1Uciwx3eUe0lb4
0IksBoQcPML5y/V//r8ERZulg8AV70m6SwwTBtsqIwgtlXMveW8=
=LjqE
-----END PGP SIGNATURE-----

--HtRZva1Vzv8iP5ye--

