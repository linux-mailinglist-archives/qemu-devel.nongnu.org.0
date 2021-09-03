Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A52640096F
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 05:28:45 +0200 (CEST)
Received: from localhost ([::1]:47762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMMMG-0000v0-4a
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 23:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mMMGk-0006Kc-GZ; Fri, 03 Sep 2021 23:23:02 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:35283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mMMGh-0005EC-6V; Fri, 03 Sep 2021 23:23:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630725765;
 bh=4H3eQ3QsA05/VW7kGkCpNxug8epEW37imp3Hj13ukA0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FhKBtH09mz70UpeBBQN1+nw0AkeP2Z7ZfguDZhFy+fXhUB93xK0BBaLDHnG+tah+Z
 oY61PGYG7PqAiiZjPDD1zSCBoefNvzdGgGHNE8EbWB2Pwhq3DGTECIbY9rzGEtOeX2
 8xjKK2rV7xNBW5LiVqh5EADK6/XaYMdqvUNmbe5E=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H1g2s4S8bz9sVq; Sat,  4 Sep 2021 13:22:45 +1000 (AEST)
Date: Fri, 3 Sep 2021 21:45:05 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 16/28] hw/ppc/spapr_pci: Replace g_memdup() by
 g_memdup2_qemu()
Message-ID: <YTIKwQAIfb35upnI@yekko>
References: <20210903110702.588291-1-philmd@redhat.com>
 <20210903110702.588291-17-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="467AKG5kT2VkpE+f"
Content-Disposition: inline
In-Reply-To: <20210903110702.588291-17-philmd@redhat.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Zhang Chen <chen.zhang@intel.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Stefan Weil <sw@weilnetz.de>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Laurent Vivier <laurent@vivier.eu>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--467AKG5kT2VkpE+f
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 03, 2021 at 01:06:50PM +0200, Philippe Mathieu-Daud=E9 wrote:
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
> Replace g_memdup() by the safer g_memdup2_qemu() wrapper.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>


Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr_pci.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 7430bd63142..79c0e8d4f98 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -2201,10 +2201,10 @@ static int spapr_pci_post_load(void *opaque, int =
version_id)
>      int i;
> =20
>      for (i =3D 0; i < sphb->msi_devs_num; ++i) {
> -        key =3D g_memdup(&sphb->msi_devs[i].key,
> -                       sizeof(sphb->msi_devs[i].key));
> -        value =3D g_memdup(&sphb->msi_devs[i].value,
> -                         sizeof(sphb->msi_devs[i].value));
> +        key =3D g_memdup2_qemu(&sphb->msi_devs[i].key,
> +                             sizeof(sphb->msi_devs[i].key));
> +        value =3D g_memdup2_qemu(&sphb->msi_devs[i].value,
> +                               sizeof(sphb->msi_devs[i].value));
>          g_hash_table_insert(sphb->msi, key, value);
>      }
>      g_free(sphb->msi_devs);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--467AKG5kT2VkpE+f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEyCr4ACgkQbDjKyiDZ
s5JQMw/9EgSrnPgRxc/R/Ui5DGXjZmF6ieBr0Sb+CICEvlJ0c0wOsuBLwkRfg2kN
OLr/Mj6S4Klz91l4pGDCJBkqsivYnCLg8rMoCISZu/o30Y6bH4r1jx6qfySVadzn
GpgRhEMqBTMBnhBqXslGjecD886ICIGxmZhYTN0RQjD2RPTfwlk7fesfUQKuh4O/
wjpfLY94qUnO6nqo2lsR8N3k082bsUO1EniGpZ1xAk4i06NlLSaukLJ3AR+4YrJ0
c7d58BZA3i2RZFDnFYuQU7vYoS5Amop9wVgCOTcLGwwo7NChLY73G/RZnUNTbdz/
tVz8gEiRCkiotfF4r4dRwycDKzjm07h0uXvCFYSwzDGhKt7AitioLXi0HKp/e/OV
Jci9uYLHgjCRRPYzzb5ly9YW9Laa0HECAYCc5WHoOCigEquEKXvWKQJdQd1PQ/Xx
OUaLzfGnCB+WEzJho3BnLaD7KkEMlg6hk6zKF0l+WcS/Tl/pUQKM2k96dU6QlWtV
kpMVMDJfoQDb7Og9QZZ0yxd28sYNObIfzUkfsIV4klpEToEtyUZC+JL+CQN3XDbK
94bDR4KvU2ziw8LeDsxoi0UxcvZjOqtRbNLnI3wS4oOAdif6iDVnWzfbU902AWI0
ojeJ7aZC98t3T0hVtyyC3B5aB6ADWKaIkizvmFtqz+hjCa/l/Lw=
=3mpO
-----END PGP SIGNATURE-----

--467AKG5kT2VkpE+f--

