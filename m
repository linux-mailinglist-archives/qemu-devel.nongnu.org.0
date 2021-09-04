Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 936594009DF
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 07:47:34 +0200 (CEST)
Received: from localhost ([::1]:57068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMOWb-00083O-HH
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 01:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mMOM4-0000Hx-6y; Sat, 04 Sep 2021 01:36:40 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:36469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mMOM1-0000Xh-F2; Sat, 04 Sep 2021 01:36:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630733791;
 bh=b8GPa793HERvIHCyvlk/12UCg5YhByIk5mVGZuLF3sQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LHKek/mygRyt4s24Y0qV7/H061t6m7+6mYapj9niHVq7JY2ojeWk2Hzvyuzc9bwNf
 nmAog/NZRJu2hBXM6Dyu059XRQm4zZziPztLFEMmdnO/1dpIhQo0Hi63pm127aHRz4
 h1/Qk6Z8kkz8z4GX435VYmjsOALCyQnmqOs3JTQA=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H1k1C6THvz9sVq; Sat,  4 Sep 2021 15:36:31 +1000 (AEST)
Date: Sat, 4 Sep 2021 13:38:58 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 26/28] target/ppc: Replace g_memdup() by g_memdup2()
Message-ID: <YTLqUuBIxiR3i8cy@yekko>
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-27-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ob9WBRFeUsoNiH0e"
Content-Disposition: inline
In-Reply-To: <20210903174510.751630-27-philmd@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ob9WBRFeUsoNiH0e
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 03, 2021 at 07:45:08PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-mem=
dup2-now/5538
>=20
>   The old API took the size of the memory to duplicate as a guint,
>   whereas most memory functions take memory sizes as a gsize. This
>   made it easy to accidentally pass a gsize to g_memdup(). For large
>   values, that would lead to a silent truncation of the size from 64
>   to 32 bits, and result in a heap area being returned which is
>   significantly smaller than what the caller expects. This can likely
>   be exploited in various modules to cause a heap buffer overflow.
>=20
> Replace g_memdup() by the safer g_memdup2() wrapper.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/mmu-hash64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
> index 19832c4b46f..bc6f8748acb 100644
> --- a/target/ppc/mmu-hash64.c
> +++ b/target/ppc/mmu-hash64.c
> @@ -1122,7 +1122,7 @@ void ppc_hash64_init(PowerPCCPU *cpu)
>          return;
>      }
> =20
> -    cpu->hash64_opts =3D g_memdup(pcc->hash64_opts, sizeof(*cpu->hash64_=
opts));
> +    cpu->hash64_opts =3D g_memdup2(pcc->hash64_opts, sizeof(*cpu->hash64=
_opts));
>  }
> =20
>  void ppc_hash64_finalize(PowerPCCPU *cpu)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ob9WBRFeUsoNiH0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEy6lIACgkQbDjKyiDZ
s5LsSQ/+JGfVEGFpFsxv2JGweo6VeaL7sWpvURLQ6ka79BwX72635jgsNsnCPPRL
m2rc7dUHV8+yY+j1JVtDCHWjFiPbMS6Z6dvtbb7XxLiRr7I8PstXjW0u/ntTwXXw
qYsdpiG6UovB/z3vKapZcjjGx8zH8KWg0mblVull7pF+XszljV/Tr5dWY/+Ty6X8
e9MH0fwkUMzGn9xTpCzAY7OpgB8NTjkXAmcUjrBoF6QsWuvHrjEVrKWh8qn80RU0
DFiO+juUwWNYCOp7Fst74QnpQhHNqombifg7eDZvkVjkBFcrvROCVC+sSQp4j4iD
0dHqgSzKCfUxORACVQOsXjvuxtv8AxByi7x2CUG9lFYc1Z094NxtzCU90AsqfVXX
0qA6pbBAAGuTckGQqNcB2ajaMRNZIUr4Nlmed8p/TCIvDKgplQ7G1z5gaxs6Ph+k
eHJvvBjN2ghG19LgHwLkXWEKQ2jJpPDSqDq0flQvxeCvlmTmPlM+zDuPKAMmVPqc
MMJOe+vsYddCu/qYEydHetG/l7+etilrSgafAmOMlcKn8/EijXj6aa0ksoS5nbe8
ajFS8RXEJqHwZ+WHiyY2/+PNqWZ9ZIFpq7KUX8VG4wBJ2XWXeeqHHvzCYNMIKE/i
oiEl9LWYFFtaX3JZCI8wrKdkFCz5zbUFDLIgoJ0NZgZXtyK8IZI=
=cExo
-----END PGP SIGNATURE-----

--ob9WBRFeUsoNiH0e--

