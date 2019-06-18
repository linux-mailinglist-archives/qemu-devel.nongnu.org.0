Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B0649C34
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 10:41:56 +0200 (CEST)
Received: from localhost ([::1]:54806 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hd9gi-0001He-05
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 04:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42511)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hd9ex-0000Vm-IX
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 04:40:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hd9ew-0006IP-B7
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 04:40:07 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:51579)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hd9es-0005tj-GM; Tue, 18 Jun 2019 04:40:04 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45ShNB72nCz9s4V; Tue, 18 Jun 2019 18:39:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1560847195;
 bh=n0Kl5qdVJyaTJ/S87xL96aTsb5NnFtHSDx/7R325WfI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EcMn52karq6ER4SWlHrGhlMXtb9BUtqzK4UdIfzgm4kLzPz32Z2eYfhte0XbZVCFQ
 xJKC9WnhINlipN1RogUysC0gZdDc/tVlbZ90q0lta7VeE8xmN2yhYqu4UTQyNiao1G
 ccV5ZlguCzVA/MMLgWeu28fCu8sa5BYaGDHHLFSI=
Date: Tue, 18 Jun 2019 18:08:12 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Message-ID: <20190618080812.GA3673@umbus.BigPond>
References: <20190615081252.28602-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline
In-Reply-To: <20190615081252.28602-1-clg@kaod.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-devel] [PATCH] target/ppc: fix compile error in
 kvmppc_define_rtas_kernel_token()
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 15, 2019 at 10:12:52AM +0200, C=C3=A9dric Le Goater wrote:
> gcc9 reports :
>=20
> In file included from /usr/include/string.h:494,
>                  from ./include/qemu/osdep.h:101,
>                  from ./target/ppc/kvm.c:17:
> In function =E2=80=98strncpy=E2=80=99,
>     inlined from =E2=80=98kvmppc_define_rtas_kernel_token=E2=80=99 at ./t=
arget/ppc/kvm.c:2648:5:
> /usr/include/bits/string_fortified.h:106:10: error: =E2=80=98__builtin_st=
rncpy=E2=80=99 specified bound 120 equals destination size [-Werror=3Dstrin=
gop-truncation]
>   106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (__=
dest));
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Applied to ppc-for-4.1, thanks.

> ---
>  target/ppc/kvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index d4107dd70d21..9edf4abeaae7 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -2645,7 +2645,7 @@ int kvmppc_define_rtas_kernel_token(uint32_t token,=
 const char *function)
>          return -ENOENT;
>      }
> =20
> -    strncpy(args.name, function, sizeof(args.name));
> +    strncpy(args.name, function, sizeof(args.name) - 1);
> =20
>      return kvm_vm_ioctl(kvm_state, KVM_PPC_RTAS_DEFINE_TOKEN, &args);
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl0Im+oACgkQbDjKyiDZ
s5K29RAAxbtmUSs8FMZm3mg5ezN+n9iRMvFe5nZEdWL9dsHXYwiT6pFHs7tfopsr
DwLRU789E6YDiFl7V+Bv2iJmXM13eeDzhBnoW5oLSUy3u0IAh8IosER8nW8vSOf8
PlhH3X/wYXssXX88IBZVuinsTI455Pi9QnuvcBVHnWDgcIAOODlEC3uMKA4EzlhO
3/2K5sWuW2yuo5LYJmA02UlEWu0uxBKj9tc4uJdWxu8+8JyeSljx+JrbUfUJYgA1
8v023HSzSR6V8e8QRjjMisntwjdFpjH9I24oyScXvBb7QvdgTZz6mIS1l8dwyk/A
zsFmkI7QJ8Gl0uOZTKH/UyyEN+ZpWMajoFkHZMlSnzW//Ja3DuZGPNBVSXnO6UA1
u+4le7UxktPBY9nfA2EMr1+mzvuzdflxsfwvE/Z4f2xdFfa6A5T1pJa0kLOEojiT
dSYSWOjs1k9DktOPDtbZvcS3MbCk3O6mnOwcpB+7zn6MVgte/EaiLUvR/6Vz2kIK
hY3rschkalePlJX24yUv7U8N7z5Wyo5BKo5Unk3rjFpsW2Ks74nTQ1WPoDmCmxC8
H9oDLuy6jzwY99V3EIiblJx99T6rGYM5FzB0YRyQ0xMXJrSMtkRl3stqiU8n3wz9
P+Ocj41XkYgMjyzDN4DH0CyiUm1ru227Et4z4YIac9VfJ52vSWQ=
=7P6P
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--

