Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0833CCCB5
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 05:48:00 +0200 (CEST)
Received: from localhost ([::1]:50942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5KG7-0007uJ-4B
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 23:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m5KD9-0005wB-8o
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 23:44:55 -0400
Received: from ozlabs.org ([203.11.71.1]:58093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m5KD7-0000H9-1X
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 23:44:55 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GSnm25bjVz9sCD; Mon, 19 Jul 2021 13:44:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626666290;
 bh=gpKGku1dtape9fRpOpMFhhIYezpGdhjy2BT2CoJ/R3s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mT8RvRB+MaRX8vWLcF841hjr4SWyDiNEHtGqxc4ImBXlYTqlC3F83wwVTEpH8h3PW
 WEx3ZX17bcLua2Uu2B7rbZTKyhVF0bvzYhcUd0Xh5RoeJetJRBzQh5aLx/1IPM1gkL
 UhR7B+W7X9ZBgqEEg2/JKIUkEeJlfYyDgFFCM8lg=
Date: Mon, 19 Jul 2021 13:40:09 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v2 07/11] machine: Prefer cores over sockets in
 smp parsing since 6.2
Message-ID: <YPT0GcmYohAxJ3da@yekko>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-8-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="F+2hZbNZex+P8F1T"
Content-Disposition: inline
In-Reply-To: <20210719032043.25416-8-wangyanan55@huawei.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--F+2hZbNZex+P8F1T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2021 at 11:20:39AM +0800, Yanan Wang wrote:
> In the real SMP hardware topology world, it's much more likely that
> we have high cores-per-socket counts and few sockets totally. While
> the current preference of sockets over cores in smp parsing results
> in a virtual cpu topology with low cores-per-sockets counts and a
> large number of sockets, which is just contrary to the real world.
>=20
> Given that it is better to make the virtual cpu topology be more
> reflective of the real world and also for the sake of compatibility,
> we start to prefer cores over sockets over threads in smp parsing
> since machine type 6.2 for different arches.
>=20
> In this patch, a boolean "smp_prefer_sockets" is added, and we only
> enable the old preference on older machines and enable the new one
> since type 6.2 for all arches by using the machine compat mechanism.
>=20
> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>

ppc parts

Acked-by: David Gibson <david@gibson.dropbear.id.au>

Note that for the pseries machine types, being paravirtual, there is
essentially no guest visible difference between "cores" and "sockets.

> ---
>  hw/arm/virt.c              |  1 +
>  hw/core/machine.c          | 59 +++++++++++++++++++++++++++++---------
>  hw/i386/pc_piix.c          |  1 +
>  hw/i386/pc_q35.c           |  1 +
>  hw/ppc/spapr.c             |  1 +
>  hw/s390x/s390-virtio-ccw.c |  1 +
>  include/hw/boards.h        |  1 +
>  qemu-options.hx            |  4 ++-
>  8 files changed, 55 insertions(+), 14 deletions(-)
>=20
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 01165f7f53..7babea40dc 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2797,6 +2797,7 @@ static void virt_machine_6_1_options(MachineClass *=
mc)
>  {
>      virt_machine_6_2_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
> +    mc->smp_prefer_sockets =3D true;
>  }
>  DEFINE_VIRT_MACHINE(6, 1)
> =20
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 63439c4a6d..c074425015 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -744,6 +744,22 @@ void machine_set_cpu_numa_node(MachineState *machine,
>      }
>  }
> =20
> +/*
> + * smp_parse - Generic function used to parse the given SMP configuration
> + *
> + * The topology parameters must be specified equal to or great than one
> + * or just omitted, explicit configuration like "cpus=3D0" is not allowe=
d.
> + * The omitted parameters will be calculated based on the provided ones.
> + *
> + * maxcpus will default to the value of cpus if omitted and will be used
> + * to compute the missing sockets/cores/threads. cpus will be calculated
> + * from the computed parametrs if omitted.
> + *
> + * In calculation of omitted arch-netural sockets/cores/threads, we pref=
er
> + * sockets over cores over threads before 6.2, while prefer cores over
> + * sockets over threads since 6.2 on. The arch-specific dies will direct=
ly
> + * default to 1 if omitted.
> + */
>  static void smp_parse(MachineState *ms, SMPConfiguration *config, Error =
**errp)
>  {
>      MachineClass *mc =3D MACHINE_GET_CLASS(ms);
> @@ -772,19 +788,36 @@ static void smp_parse(MachineState *ms, SMPConfigur=
ation *config, Error **errp)
> =20
>      maxcpus =3D maxcpus > 0 ? maxcpus : cpus;
> =20
> -    /* compute missing values, prefer sockets over cores over threads */
> -    if (sockets =3D=3D 0) {
> -        cores =3D cores > 0 ? cores : 1;
> -        threads =3D threads > 0 ? threads : 1;
> -        sockets =3D maxcpus / (dies * cores * threads);
> -        sockets =3D sockets > 0 ? sockets : 1;
> -    } else if (cores =3D=3D 0) {
> -        threads =3D threads > 0 ? threads : 1;
> -        cores =3D maxcpus / (sockets * dies * threads);
> -        cores =3D cores > 0 ? cores : 1;
> -    } else if (threads =3D=3D 0) {
> -        threads =3D maxcpus / (sockets * dies * cores);
> -        threads =3D threads > 0 ? threads : 1;
> +    /* prefer sockets over cores over threads before 6.2 */
> +    if (mc->smp_prefer_sockets) {
> +        if (sockets =3D=3D 0) {
> +            cores =3D cores > 0 ? cores : 1;
> +            threads =3D threads > 0 ? threads : 1;
> +            sockets =3D maxcpus / (dies * cores * threads);
> +            sockets =3D sockets > 0 ? sockets : 1;
> +        } else if (cores =3D=3D 0) {
> +            threads =3D threads > 0 ? threads : 1;
> +            cores =3D maxcpus / (sockets * dies * threads);
> +            cores =3D cores > 0 ? cores : 1;
> +        } else if (threads =3D=3D 0) {
> +            threads =3D maxcpus / (sockets * dies * cores);
> +            threads =3D threads > 0 ? threads : 1;
> +        }
> +    /* prefer cores over sockets over threads since 6.2 */
> +    } else {
> +        if (cores =3D=3D 0) {
> +            sockets =3D sockets > 0 ? sockets : 1;
> +            threads =3D threads > 0 ? threads : 1;
> +            cores =3D maxcpus / (sockets * dies * threads);
> +            cores =3D cores > 0 ? cores : 1;
> +        } else if (sockets =3D=3D 0) {
> +            threads =3D threads > 0 ? threads : 1;
> +            sockets =3D maxcpus / (dies * cores * threads);
> +            sockets =3D sockets > 0 ? sockets : 1;
> +        } else if (threads =3D=3D 0) {
> +            threads =3D maxcpus / (sockets * dies * cores);
> +            threads =3D threads > 0 ? threads : 1;
> +        }
>      }
> =20
>      /* use the computed parameters to calculate the omitted cpus */
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index fd5c2277f2..9b811fc6ca 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -432,6 +432,7 @@ static void pc_i440fx_6_1_machine_options(MachineClas=
s *m)
>      m->is_default =3D false;
>      compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
>      compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
> +    m->smp_prefer_sockets =3D true;
>  }
> =20
>  DEFINE_I440FX_MACHINE(v6_1, "pc-i440fx-6.1", NULL,
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index b45903b15e..88efb7fde4 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -372,6 +372,7 @@ static void pc_q35_6_1_machine_options(MachineClass *=
m)
>      m->alias =3D NULL;
>      compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
>      compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
> +    m->smp_prefer_sockets =3D true;
>  }
> =20
>  DEFINE_Q35_MACHINE(v6_1, "pc-q35-6.1", NULL,
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index d39fd4e644..a481fade51 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4702,6 +4702,7 @@ static void spapr_machine_6_1_class_options(Machine=
Class *mc)
>  {
>      spapr_machine_6_2_class_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
> +    mc->smp_prefer_sockets =3D true;
>  }
> =20
>  DEFINE_SPAPR_MACHINE(6_1, "6.1", false);
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 4d25278cf2..b40e647883 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -809,6 +809,7 @@ static void ccw_machine_6_1_class_options(MachineClas=
s *mc)
>  {
>      ccw_machine_6_2_class_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
> +    mc->smp_prefer_sockets =3D true;
>  }
>  DEFINE_CCW_MACHINE(6_1, "6.1", false);
> =20
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 2832f0f8aa..8df885c9d2 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -247,6 +247,7 @@ struct MachineClass {
>      bool nvdimm_supported;
>      bool numa_mem_supported;
>      bool smp_dies_supported;
> +    bool smp_prefer_sockets;
>      bool auto_enable_numa;
>      const char *default_ram_id;
> =20
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 0c9ddc0274..6ef57e838c 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -227,7 +227,9 @@ SRST
>      from those which are given. Historically preference was given to the
>      coarsest topology parameters when computing missing values (ie socke=
ts
>      preferred over cores, which were preferred over threads), however, t=
his
> -    behaviour is considered liable to change.
> +    behaviour is considered liable to change. The historical preference =
of
> +    sockets over cores over threads works before 6.2, and a new preferen=
ce
> +    of cores over sockets over threads starts to work since 6.2 on.
>  ERST
> =20
>  DEF("numa", HAS_ARG, QEMU_OPTION_numa,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--F+2hZbNZex+P8F1T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD09BkACgkQbDjKyiDZ
s5J7FQ/+KdaBjKEqXlIvr2znz9trwIvu01y/eAJP65v+TXQlhcteiAUcNk995D5L
f3fcbn33DgLy5NLfCYAPn0GbbJcwA+IgVJ4zGEDOtaFa3z1a5FLat3ZesBp832tF
xjRR56IpRpyp3+zNfPeQUjOpIEFjRrFeduVmQDBT8fcAFfidFKnuuYC2FRlsMSO7
GUx82s+KtlUdrhXGIIoknS+BQ3KOgEa1OxZqSCTnlrlIjM8qbK0jrHw8jbu/1XAa
XAA9D/bMk3Io14tqHxGvF/OiheqDnWSB/g3zPXwOOq35PbUn0f0A4vQNbsSnO6ks
T3ODZ8zUiPmAiA45aNSGInyOaDFYjB6IXxPRPAErii/oYd1YHLIMXBLPhP2k9i8f
mXjypaWnWu6OQyQYGBUh+pe5BjXZD0ubEvIggGZDk3FhdZexQKQSF7zl42AQQshr
iFY8+IpUr+9x6MppbqlGevV+w6z2y94t3ituw7tM6EMboixquPv9TUdXeZ3Tqlby
mkRDA5vl6oM73hbe5iExkPhzdQ7nO7R/0HKT5I1nsArkxt4Tf2MHKmVmhlNTrbto
sG/77BL+bp5FfqoivhDF3l7nluNzo0u163IpLqU5O+fNvRkd5RgkpDtzaa19ow2o
jHcNhXkgDOe8p3pqd836vaJcVsupfh3rQN9ufdOWWpJHzf6LEUM=
=KjgN
-----END PGP SIGNATURE-----

--F+2hZbNZex+P8F1T--

