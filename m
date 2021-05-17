Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8645F382301
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 05:14:08 +0200 (CEST)
Received: from localhost ([::1]:56898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liThn-0001DV-CJ
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 23:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1liTfs-0000Io-JA; Sun, 16 May 2021 23:12:08 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:41305 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1liTfp-0005c3-Qo; Sun, 16 May 2021 23:12:08 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fk40z3SsMz9sSn; Mon, 17 May 2021 13:11:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621221107;
 bh=OXfwjnR7pRT6hdT/QsqvHQnEcrEUrAWnbZ7I+Zm4ipg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fC0HbNjz2jlnyt954XX4u+Yrezf//QgpPFnMzk4buy4uNs1r3DYL96s8e10AxQVhX
 YmjNC2A82Mci8yHoUPfTkVBuVXmC2cn+yskOyOdFUBgLkYBLB7UcrU7D3DzDy1UDcM
 6YjQ+ZqrEHf+lB/5g1p/gWi5vdKsQg2+hPINBq8g=
Date: Mon, 17 May 2021 13:11:37 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v3 2/9] device_tree: Add qemu_fdt_add_path
Message-ID: <YKHe6SQzmfHzGqW6@yekko>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
 <20210516102900.28036-3-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8lCm3QYpvXGStkbA"
Content-Disposition: inline
In-Reply-To: <20210516102900.28036-3-wangyanan55@huawei.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com, qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--8lCm3QYpvXGStkbA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 16, 2021 at 06:28:53PM +0800, Yanan Wang wrote:
> From: Andrew Jones <drjones@redhat.com>
>=20
> qemu_fdt_add_path() works like qemu_fdt_add_subnode(), except it
> also adds all missing subnodes from the given path. We'll use it
> in a coming patch where we will add cpu-map to the device tree.
>=20
> And we also tweak an error message of qemu_fdt_add_subnode().
>=20
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Wonder if I should integrate a function like this into libfdt.

> ---
>  include/sysemu/device_tree.h |  1 +
>  softmmu/device_tree.c        | 44 ++++++++++++++++++++++++++++++++++--
>  2 files changed, 43 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index 8a2fe55622..ef060a9759 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -121,6 +121,7 @@ uint32_t qemu_fdt_get_phandle(void *fdt, const char *=
path);
>  uint32_t qemu_fdt_alloc_phandle(void *fdt);
>  int qemu_fdt_nop_node(void *fdt, const char *node_path);
>  int qemu_fdt_add_subnode(void *fdt, const char *name);
> +int qemu_fdt_add_path(void *fdt, const char *path);
> =20
>  #define qemu_fdt_setprop_cells(fdt, node_path, property, ...)           =
      \
>      do {                                                                =
      \
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index b621f63fba..3965c834ca 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -540,8 +540,8 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
> =20
>      retval =3D fdt_add_subnode(fdt, parent, basename);
>      if (retval < 0) {
> -        error_report("FDT: Failed to create subnode %s: %s", name,
> -                     fdt_strerror(retval));
> +        error_report("%s: Failed to create subnode %s: %s",
> +                     __func__, name, fdt_strerror(retval));
>          exit(1);
>      }
> =20
> @@ -549,6 +549,46 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
>      return retval;
>  }
> =20
> +/*
> + * qemu_fdt_add_path: Like qemu_fdt_add_subnode(), but will add
> + * all missing subnodes from the given path.
> + */
> +int qemu_fdt_add_path(void *fdt, const char *path)
> +{
> +    const char *name;
> +    const char *p =3D path;
> +    int namelen, retval;
> +    int parent =3D 0;
> +
> +    if (path[0] !=3D '/') {
> +        return -1;
> +    }
> +
> +    while (p) {
> +        name =3D p + 1;
> +        p =3D strchr(name, '/');
> +        namelen =3D p !=3D NULL ? p - name : strlen(name);
> +
> +        retval =3D fdt_subnode_offset_namelen(fdt, parent, name, namelen=
);
> +        if (retval < 0 && retval !=3D -FDT_ERR_NOTFOUND) {
> +            error_report("%s: Unexpected error in finding subnode %.*s: =
%s",
> +                         __func__, namelen, name, fdt_strerror(retval));
> +            exit(1);
> +        } else if (retval =3D=3D -FDT_ERR_NOTFOUND) {
> +            retval =3D fdt_add_subnode_namelen(fdt, parent, name, namele=
n);
> +            if (retval < 0) {
> +                error_report("%s: Failed to create subnode %.*s: %s",
> +                             __func__, namelen, name, fdt_strerror(retva=
l));
> +                exit(1);
> +            }
> +        }
> +
> +        parent =3D retval;
> +    }
> +
> +    return retval;
> +}
> +
>  void qemu_fdt_dumpdtb(void *fdt, int size)
>  {
>      const char *dumpdtb =3D current_machine->dumpdtb;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8lCm3QYpvXGStkbA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCh3uYACgkQbDjKyiDZ
s5IDvxAAji31FUmz47osKu46BFvA9qdd4FvzOSBXlYa7cJhbTTQNK0MPzRFBxAd0
jInU/KwNf0CibVwCqqBldzk+7SIeVKIn7wxlU8XQk4ECtI1IgzIiasZ2PsuKBgNU
hCDk9otNEYd8lhjU59GBiV0SUiYeMk64EVkGkqYLf7eiBEE3VIcDd3V2V0el7Te5
C4u9gqnIK/YS+8SbIkii/tab3RWtCLOMNHXRBVXbkUCSq3++Uty1D78ArQMTD6XF
5y4tHGSNdYLge/i2+GJTwqbNpeqobwiVma2G7qzFuDr/u0qYY2nTJV1xkrdwT2E0
KSP/Li9DtMk8q0D2qF6S5/EUtePZGGNuS8t4zbI71lM9EJiDv8VKmZLVTFyK7LtX
HV4zjfEyOe1dSCOV7VW2H/xcVnlR4/iKt2x6kJbic9BlrSg2jaRhZvMlK2WpWEWT
BJS9RT7zL3a7htTGdyb5CjDv6HUo2U24402JgdCoSGp9wxS0/idasLLo7IMXIVzY
CU1+Q4TK9xoTS3RVyHaDImEzga1akdWwce/UaZfpQjZjy/xBTnkKY80Sl2lcReML
CWJvb4PaN8vr1sHwZ4PQXhVI1zXK1q1XrfIeZGM+cLUWzs3EwhBL67WYG/IYVZ+f
jm/rXlKoxd730Dlw1/WghdztaCkcGqzV9rf3s4zJmfhQWmZno/I=
=Dwqo
-----END PGP SIGNATURE-----

--8lCm3QYpvXGStkbA--

