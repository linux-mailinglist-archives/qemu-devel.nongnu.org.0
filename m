Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79062361906
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 06:55:00 +0200 (CEST)
Received: from localhost ([::1]:36578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXGVP-0000MX-Jw
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 00:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lXGTH-00075i-FT; Fri, 16 Apr 2021 00:52:47 -0400
Received: from ozlabs.org ([203.11.71.1]:40335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lXGTE-0003se-Vi; Fri, 16 Apr 2021 00:52:47 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FM3jg0kvZz9sV5; Fri, 16 Apr 2021 14:52:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618548759;
 bh=xzDjLcE+Vp35WNszZszf3jflZGkgZOi88sfHa2aTpkY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l7iXB19ZTtOdUk+xJxfb2pIE+wJ3Atb1DGTYPd9PF+RRceaEH4G3YB9QaKrmljAcV
 SUV91KS2tJ3eY4MIcny8dzTgBgBMUsOD+G1mzfKFb19J2zAVLxjoFj44/cao/v+4Ry
 LZ8Y3b7REOWOiqbWTXhOiHxPMKxTiDdubUo3DTcg=
Date: Fri, 16 Apr 2021 14:52:31 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v2 1/6] device_tree: Add qemu_fdt_add_path
Message-ID: <YHkYD+cCl9/GCxwJ@yekko.fritz.box>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-2-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bpxvPzcUlgYJX94H"
Content-Disposition: inline
In-Reply-To: <20210413080745.33004-2-wangyanan55@huawei.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 prime.zeng@hisilicon.com, yangyicong@huawei.com, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--bpxvPzcUlgYJX94H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 13, 2021 at 04:07:40PM +0800, Yanan Wang wrote:
> From: Andrew Jones <drjones@redhat.com>
>=20
> qemu_fdt_add_path() works like qemu_fdt_add_subnode(), except
> it also adds any missing subnodes in the path. We also tweak
> an error message of qemu_fdt_add_subnode().
>=20
> We'll make use of this new function in a coming patch.
>=20
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  include/sysemu/device_tree.h |  1 +
>  softmmu/device_tree.c        | 45 ++++++++++++++++++++++++++++++++++--
>  2 files changed, 44 insertions(+), 2 deletions(-)
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
> index 2691c58cf6..8592c7aa1b 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -541,8 +541,8 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
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
> @@ -550,6 +550,47 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
>      return retval;
>  }
> =20
> +/*
> + * Like qemu_fdt_add_subnode(), but will add all missing
> + * subnodes in the path.
> + */
> +int qemu_fdt_add_path(void *fdt, const char *path)
> +{
> +    char *dupname, *basename, *p;
> +    int parent, retval =3D -1;
> +
> +    if (path[0] !=3D '/') {
> +        return retval;
> +    }
> +
> +    parent =3D fdt_path_offset(fdt, "/");

Getting the offset for "/" is never needed - it's always 0.

> +    p =3D dupname =3D g_strdup(path);

You shouldn't need the strdup(), see below.

> +
> +    while (p) {
> +        *p =3D '/';
> +        basename =3D p + 1;
> +        p =3D strchr(p + 1, '/');
> +        if (p) {
> +            *p =3D '\0';
> +        }
> +        retval =3D fdt_path_offset(fdt, dupname);

The fdt_path_offset_namelen() function exists *exactly* so that you
can look up partial parths without having to mangle your input
string.  Just set the namelen right, and it will ignore anything to
the right of that.

> +        if (retval < 0 && retval !=3D -FDT_ERR_NOTFOUND) {
> +            error_report("%s: Invalid path %s: %s",
> +                         __func__, path, fdt_strerror(retval));

If you're getting an error other than FDT_ERR_NOTFOUND here, chances
are it's not an invalid path, but a corrupted fdt blob or something
else.

> +            exit(1);
> +        } else if (retval =3D=3D -FDT_ERR_NOTFOUND) {
> +            retval =3D fdt_add_subnode(fdt, parent, basename);
> +            if (retval < 0) {
> +                break;
> +            }
> +        }
> +        parent =3D retval;
> +    }
> +
> +    g_free(dupname);
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

--bpxvPzcUlgYJX94H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB5GA0ACgkQbDjKyiDZ
s5LXeg//WsVtzYGhSyod/Dl72fGuT/4ta3YGMnJvZNPTAyywNIVuHjw15N5P9Zc1
FWlUAy4ZmvrPV9KwECvcCQe1cXErjIjRsEn86kqt1o++v01I9UU+56hmkufNGSeB
7SEqkPoJDcfht+H2SSfk6SppzLG1sGo4pr3E7liLTPWNhP1oVwDSqRhvpXR6tUN7
CXdPehhcbLSS+K/vii0atlrCWnrOu9TjR+HBJ/5ACFJOLiAOqMifvkxhxkY6GpNw
zM16XayBu5+09L3QPPVfid4xbSqPFjgmCzlCBddkzxalDUcjuON+WQxf+sSMljKq
mIGUw7OcVbfRlS82NxcZxZ/VBxIs7lEfp+LIyoaUyI/RKWXzPBG0oa91ybzvDktE
VSN74anWHnNMujCPfCI+MBl2nQLf8A49rTySpusagnON503jsY63I3CW3QQns6W9
fS45CWb25UtHmBp4t+V7B3CjcJ40NPko0mLPcw6s81iIGVPzaxodrb2kg/2bP4yO
TDHQfZzy9aYCqmIfXxMu3qKeOP/LMMGRLFZf/lTzal1YnmNTCqHEqWIUKwoCugg5
ro5nh/kUf4H5YcUQFc4F47X5Jitgl5jBZVpaY44Ql/TKFviih0Qqj/50+QHqZsNE
BU9qU9WWfDAyS4NXSzCKRes2eFbReROhcCMnCOS6pV9tbpBdYrQ=
=FoGC
-----END PGP SIGNATURE-----

--bpxvPzcUlgYJX94H--

