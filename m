Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 988983D9A1D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 02:34:43 +0200 (CEST)
Received: from localhost ([::1]:55236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8u0Y-00006C-3H
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 20:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m8tvX-0007Wg-Re
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:29:32 -0400
Received: from ozlabs.org ([203.11.71.1]:34613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m8tvT-00072s-QK
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:29:31 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GZrxp4CFKz9sWS; Thu, 29 Jul 2021 10:29:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1627518558;
 bh=5TyN8VQ+7wdbRwKIa22GQQWvvPTVSXMpXnbKJDYrmSU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c5YWG3L7tuf29vhGCO9jW05vL534HhDI2PxJ9bnZK4yGkIMbtiCb6Vl3sGjZL571h
 jKLa5gZ1Q20WJGuxMGqNlws4Rmm4V1A44E3nNGMSDf5L7JlK/Igp4WGBh3fthEWcNg
 hn2NcYIK0stAgKUY8Ijsw7fkdN0tPbdfuJuBR5yw=
Date: Wed, 28 Jul 2021 15:09:48 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v3 11/11] machine: Move smp_prefer_sockets to
 struct SMPCompatProps
Message-ID: <YQDmnHRQ6pj6RXSh@yekko>
References: <20210728034848.75228-1-wangyanan55@huawei.com>
 <20210728034848.75228-12-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jwt81z39sMSnEyl7"
Content-Disposition: inline
In-Reply-To: <20210728034848.75228-12-wangyanan55@huawei.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
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
 Cornelia Huck <cohuck@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>,
 wanghaibin.wang@huawei.com, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--jwt81z39sMSnEyl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 28, 2021 at 11:48:48AM +0800, Yanan Wang wrote:
> Now we have a common structure SMPCompatProps used to store information
> about SMP compatibility stuff, so we can also move smp_prefer_sockets
> there for cleaner code.
>=20
> No functional change intended.
>=20
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/arm/virt.c              | 2 +-
>  hw/core/machine.c          | 2 +-
>  hw/i386/pc_piix.c          | 2 +-
>  hw/i386/pc_q35.c           | 2 +-
>  hw/ppc/spapr.c             | 2 +-
>  hw/s390x/s390-virtio-ccw.c | 2 +-
>  include/hw/boards.h        | 3 ++-
>  7 files changed, 8 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 7babea40dc..ae029680da 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2797,7 +2797,7 @@ static void virt_machine_6_1_options(MachineClass *=
mc)
>  {
>      virt_machine_6_2_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
> -    mc->smp_prefer_sockets =3D true;
> +    mc->smp_props.prefer_sockets =3D true;
>  }
>  DEFINE_VIRT_MACHINE(6, 1)
> =20
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 8f84e38e2e..61d1f643f4 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -834,7 +834,7 @@ static void smp_parse(MachineState *ms, SMPConfigurat=
ion *config, Error **errp)
>      } else {
>          maxcpus =3D maxcpus > 0 ? maxcpus : cpus;
> =20
> -        if (mc->smp_prefer_sockets) {
> +        if (mc->smp_props.prefer_sockets) {
>              /* prefer sockets over cores over threads before 6.2 */
>              if (sockets =3D=3D 0) {
>                  cores =3D cores > 0 ? cores : 1;
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 9b811fc6ca..a60ebfc2c1 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -432,7 +432,7 @@ static void pc_i440fx_6_1_machine_options(MachineClas=
s *m)
>      m->is_default =3D false;
>      compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
>      compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
> -    m->smp_prefer_sockets =3D true;
> +    m->smp_props.prefer_sockets =3D true;
>  }
> =20
>  DEFINE_I440FX_MACHINE(v6_1, "pc-i440fx-6.1", NULL,
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 88efb7fde4..4b622ffb82 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -372,7 +372,7 @@ static void pc_q35_6_1_machine_options(MachineClass *=
m)
>      m->alias =3D NULL;
>      compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
>      compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
> -    m->smp_prefer_sockets =3D true;
> +    m->smp_props.prefer_sockets =3D true;
>  }
> =20
>  DEFINE_Q35_MACHINE(v6_1, "pc-q35-6.1", NULL,
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index a481fade51..efdea43c0d 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4702,7 +4702,7 @@ static void spapr_machine_6_1_class_options(Machine=
Class *mc)
>  {
>      spapr_machine_6_2_class_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
> -    mc->smp_prefer_sockets =3D true;
> +    mc->smp_props.prefer_sockets =3D true;
>  }
> =20
>  DEFINE_SPAPR_MACHINE(6_1, "6.1", false);
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index b40e647883..5bdef9b4d7 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -809,7 +809,7 @@ static void ccw_machine_6_1_class_options(MachineClas=
s *mc)
>  {
>      ccw_machine_6_2_class_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
> -    mc->smp_prefer_sockets =3D true;
> +    mc->smp_props.prefer_sockets =3D true;
>  }
>  DEFINE_CCW_MACHINE(6_1, "6.1", false);
> =20
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 72123f594d..23671a0f8f 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -110,9 +110,11 @@ typedef struct {
> =20
>  /**
>   * SMPCompatProps:
> + * @prefer_sockets - whether sockets is preferred over cores in smp pars=
ing
>   * @dies_supported - whether dies is supported by the machine
>   */
>  typedef struct {
> +    bool prefer_sockets;
>      bool dies_supported;
>  } SMPCompatProps;
> =20
> @@ -250,7 +252,6 @@ struct MachineClass {
>      bool nvdimm_supported;
>      bool numa_mem_supported;
>      bool auto_enable_numa;
> -    bool smp_prefer_sockets;
>      SMPCompatProps smp_props;
>      const char *default_ram_id;
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--jwt81z39sMSnEyl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEA5poACgkQbDjKyiDZ
s5JCUA/+Ovq2+GITpFr2ONpL3fWYA3YAx9j/gyHVKdvV5C5CP384bdw4+gGb3jrx
+IonD3clWu3PdjuTQG0IHlgDup6jHbPju6ZKHziUfTLsZLiZWBVwmsml9p+vOnjs
OzLgxXhM7FFB2OVNPvxkjKaN0ayCcYWZO3WlfBUZc5xqeCNETp4GBIFH7msHGo2V
+TnNjfDgWmfxWoiNsZG6xX0VVZheoWhrl751uCNGdAUdtrmn5f6ovkIFvNdrajic
T0tRz6hXJ4AM3BJiVY1WR3hd7b9+o3r8dL3Ae6yvvrpKC7xOxQP5yt4983+FqWmV
goRTEelw7RN++IJiLUXvtrEuWFU2irzxhky4Ix7T5WyqM3PU1nTTcrojyR848tXW
fKIuE2rY40ScAxLR80rpHVnQw5o+8C8eb630cp6+gsc1O1zVO/ejF+iTjnDtIZno
1wGxbRmMKy4iahJitWiIEmq740b3p+41ddiAfs7xgoBSEWTXT2S5mhXLj9lI+Pqy
jHYTmZZFGjOR2Ex4p6EfHzvM1HTSEdcqbodgLKYddPqZNwSVRmqAZRHHUwczUYYo
exNULNYZ6miWX9Uh/g5ghcleXSOe7d+EqZ1pJNDyf+u4usYNE5DlNfHHt64Abg8C
n0+aIOZA1BlOru/sphiD3MYqQ+zlbE1S1IN+xHt7523zKe5kJO8=
=nZzk
-----END PGP SIGNATURE-----

--jwt81z39sMSnEyl7--

