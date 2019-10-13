Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E0AD557B
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Oct 2019 11:33:16 +0200 (CEST)
Received: from localhost ([::1]:38442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJaFX-0005Pw-7m
	for lists+qemu-devel@lfdr.de; Sun, 13 Oct 2019 05:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54963)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iJaE5-0004Nx-3K
 for qemu-devel@nongnu.org; Sun, 13 Oct 2019 05:31:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iJaE3-0003gC-ST
 for qemu-devel@nongnu.org; Sun, 13 Oct 2019 05:31:45 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:36547 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iJaDz-0003b5-4v; Sun, 13 Oct 2019 05:31:41 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46rbzl3Qkvz9sP6; Sun, 13 Oct 2019 20:31:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1570959091;
 bh=zAcblpc8D9oNHNEbUfiTdWI/qxLNZyr05HMAZLFVUWY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cr6XmDtwsinvm9utixAbBZ2/ehBzPmW8jiobwysKCqvbu1TinbFzBqi2pdT1YMDHK
 5UD/AgxkABh4VHlfkMkrjARon9hhELlu5xlnnL8sJfXRwrLIS0WDbetn8rU950HYxR
 JoajNC6+uSeBXuglbAwd7Loo+EeMAjd+Y48q3b1A=
Date: Sun, 13 Oct 2019 20:27:12 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [PATCH 1/2] cpu: use ROUND_UP() to define xxx_PAGE_ALIGN
Message-ID: <20191013092712.GF4080@umbus.fritz.box>
References: <20191013021145.16011-1-richardw.yang@linux.intel.com>
 <20191013021145.16011-2-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="K/NRh952CO+2tg14"
Content-Disposition: inline
In-Reply-To: <20191013021145.16011-2-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: fam@euphon.net, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, kraxel@redhat.com, den@openvz.org,
 qemu-block@nongnu.org, quintela@redhat.com, armbru@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, marcandre.lureau@redhat.com,
 ehabkost@redhat.com, sw@weilnetz.de, dgilbert@redhat.com,
 yuval.shaia@oracle.com, alex.williamson@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, rth@twiddle.net, kwolf@redhat.com, cohuck@redhat.com,
 qemu-s390x@nongnu.org, mreitz@redhat.com, qemu-ppc@nongnu.org,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--K/NRh952CO+2tg14
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 13, 2019 at 10:11:44AM +0800, Wei Yang wrote:
> Use ROUND_UP() to define, which is a little bit easy to read.
>=20
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  include/exec/cpu-all.h | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index ad9ab85eb3..255bb186ac 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -220,7 +220,7 @@ extern int target_page_bits;
> =20
>  #define TARGET_PAGE_SIZE (1 << TARGET_PAGE_BITS)
>  #define TARGET_PAGE_MASK ~(TARGET_PAGE_SIZE - 1)
> -#define TARGET_PAGE_ALIGN(addr) (((addr) + TARGET_PAGE_SIZE - 1) & TARGE=
T_PAGE_MASK)
> +#define TARGET_PAGE_ALIGN(addr) ROUND_UP((addr), TARGET_PAGE_SIZE)
> =20
>  /* Using intptr_t ensures that qemu_*_page_mask is sign-extended even
>   * when intptr_t is 32-bit and we are aligning a long long.
> @@ -228,9 +228,8 @@ extern int target_page_bits;
>  extern uintptr_t qemu_host_page_size;
>  extern intptr_t qemu_host_page_mask;
> =20
> -#define HOST_PAGE_ALIGN(addr) (((addr) + qemu_host_page_size - 1) & qemu=
_host_page_mask)
> -#define REAL_HOST_PAGE_ALIGN(addr) (((addr) + qemu_real_host_page_size -=
 1) & \
> -                                    qemu_real_host_page_mask)
> +#define HOST_PAGE_ALIGN(addr) ROUND_UP((addr), qemu_host_page_size)
> +#define REAL_HOST_PAGE_ALIGN(addr) ROUND_UP((addr), qemu_real_host_page_=
size)
> =20
>  /* same as PROT_xxx */
>  #define PAGE_READ      0x0001

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--K/NRh952CO+2tg14
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl2i7e0ACgkQbDjKyiDZ
s5L5IRAAhKogha3/Q23X/xOOl9tAUbbi4iHveQC2aXE6LrTBuGERxq+yalBcpAl5
oIURkcHnOIuv7/gth4d6ZMqChElfX9Rgf1YxV7667X90gYqcEHB8dEfIuGBa1WvG
3CwvTlPrfzeE2Vf75gVgS6SUOormrSCigvq21TvGAQNnFV0LEUL2v1v2yewei2Sh
ssHf29dTUJUkZoBZg1v+/d3Yb4Kyflf3BaRpQpDuek91k/7h3UkyzxUQ8a7T6cBM
mT46l5ZRjk3Q4iMfmnGaYcbuaxnHChHODsCwlxiU1GWQNQsaJi7yHBRy+bnfN0VC
40XtvubdCE/1Yxt18dLC+7KQDmvM5Rue7gZIwlKwod/7N7r862HLAhYXf4QQOHKB
tbpEP9UyBTcsjkPTDcW4zZExXcjWsVd2Aye5BK3nO25qj1RxjRGpkiYaMUrmAaNr
QZORes+RxVB/0uesqp4x/WE2nNkiftzbO3UCkoo1jo7108v4/tN/QcLDZXXj3V8B
1GGyxWGRf3TRKE8Xs55jGrTB5MWnY8rgwOqY41Sfae129fsMdcsH0NTGHgSCmmXw
MiePK8a5htGyR31oQoRPnm1ss+GpsPquV6SwyoqBuAXZWefzuuUlWirVm3FoHlkk
cXMh0bkFxvPKClCdvn9oD4ivXt2NWyVf2ChVrTtXEnkblFiUXl4=
=exjc
-----END PGP SIGNATURE-----

--K/NRh952CO+2tg14--

