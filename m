Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E33D53CCCB6
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 05:48:01 +0200 (CEST)
Received: from localhost ([::1]:51046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5KG8-0007yT-Su
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 23:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m5KD9-0005wJ-E9
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 23:44:55 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:45553 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m5KD7-0000HB-Ae
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 23:44:55 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GSnm256x3z9sRR; Mon, 19 Jul 2021 13:44:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626666290;
 bh=Are7vYY/R79xzWE/MUf+7xIHb6QD/PjSvwniBFZ8MAo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HVipZirbC7zNYkxm5bY62A5zKQLICP7kwzkG835z1lm6ZajLMUF4uiicFWuN8ZolN
 wT+CirHmYOuejyzps5KIwfpmjcCXhrNFGSQKBOgT9yqZF1Vbi0iq65lp3dX2P2Xfjv
 t3g0L7DiNViP+H+laOb+wVZEwo13g5lTkZMrV3BY=
Date: Mon, 19 Jul 2021 13:38:54 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v2 06/11] hw: Add compat machines for 6.2
Message-ID: <YPTzzvL0hTfKgEkT@yekko>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-7-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DlU4KoAmEnJS1toN"
Content-Disposition: inline
In-Reply-To: <20210719032043.25416-7-wangyanan55@huawei.com>
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


--DlU4KoAmEnJS1toN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2021 at 11:20:38AM +0800, Yanan Wang wrote:
> Add 6.2 machine types for arm/i440fx/q35/s390x/spapr.
>=20
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/arm/virt.c              |  9 ++++++++-
>  hw/core/machine.c          |  3 +++
>  hw/i386/pc.c               |  3 +++
>  hw/i386/pc_piix.c          | 14 +++++++++++++-
>  hw/i386/pc_q35.c           | 13 ++++++++++++-
>  hw/ppc/spapr.c             | 15 +++++++++++++--
>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>  include/hw/boards.h        |  3 +++
>  include/hw/i386/pc.h       |  3 +++
>  9 files changed, 71 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 81eda46b0b..01165f7f53 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2788,10 +2788,17 @@ static void machvirt_machine_init(void)
>  }
>  type_init(machvirt_machine_init);
> =20
> +static void virt_machine_6_2_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE_AS_LATEST(6, 2)
> +
>  static void virt_machine_6_1_options(MachineClass *mc)
>  {
> +    virt_machine_6_2_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
>  }
> -DEFINE_VIRT_MACHINE_AS_LATEST(6, 1)
> +DEFINE_VIRT_MACHINE(6, 1)
> =20
>  static void virt_machine_6_0_options(MachineClass *mc)
>  {
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 8b4d07d3fc..63439c4a6d 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -37,6 +37,9 @@
>  #include "hw/virtio/virtio.h"
>  #include "hw/virtio/virtio-pci.h"
> =20
> +GlobalProperty hw_compat_6_1[] =3D {};
> +const size_t hw_compat_6_1_len =3D G_N_ELEMENTS(hw_compat_6_1);
> +
>  GlobalProperty hw_compat_6_0[] =3D {
>      { "gpex-pcihost", "allow-unmapped-accesses", "false" },
>      { "i8042", "extended-state", "false"},
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index d94ef582b5..c6768c6ce7 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -94,6 +94,9 @@
>  #include "trace.h"
>  #include CONFIG_DEVICES
> =20
> +GlobalProperty pc_compat_6_1[] =3D {};
> +const size_t pc_compat_6_1_len =3D G_N_ELEMENTS(pc_compat_6_1);
> +
>  GlobalProperty pc_compat_6_0[] =3D {
>      { "qemu64" "-" TYPE_X86_CPU, "family", "6" },
>      { "qemu64" "-" TYPE_X86_CPU, "model", "6" },
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 30b8bd6ea9..fd5c2277f2 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -413,7 +413,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
>      machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
>  }
> =20
> -static void pc_i440fx_6_1_machine_options(MachineClass *m)
> +static void pc_i440fx_6_2_machine_options(MachineClass *m)
>  {
>      PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
>      pc_i440fx_machine_options(m);
> @@ -422,6 +422,18 @@ static void pc_i440fx_6_1_machine_options(MachineCla=
ss *m)
>      pcmc->default_cpu_version =3D 1;
>  }
> =20
> +DEFINE_I440FX_MACHINE(v6_2, "pc-i440fx-6.2", NULL,
> +                      pc_i440fx_6_2_machine_options);
> +
> +static void pc_i440fx_6_1_machine_options(MachineClass *m)
> +{
> +    pc_i440fx_6_2_machine_options(m);
> +    m->alias =3D NULL;
> +    m->is_default =3D false;
> +    compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
> +    compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
> +}
> +
>  DEFINE_I440FX_MACHINE(v6_1, "pc-i440fx-6.1", NULL,
>                        pc_i440fx_6_1_machine_options);
> =20
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 04b4a4788d..b45903b15e 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -355,7 +355,7 @@ static void pc_q35_machine_options(MachineClass *m)
>      m->max_cpus =3D 288;
>  }
> =20
> -static void pc_q35_6_1_machine_options(MachineClass *m)
> +static void pc_q35_6_2_machine_options(MachineClass *m)
>  {
>      PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
>      pc_q35_machine_options(m);
> @@ -363,6 +363,17 @@ static void pc_q35_6_1_machine_options(MachineClass =
*m)
>      pcmc->default_cpu_version =3D 1;
>  }
> =20
> +DEFINE_Q35_MACHINE(v6_2, "pc-q35-6.2", NULL,
> +                   pc_q35_6_2_machine_options);
> +
> +static void pc_q35_6_1_machine_options(MachineClass *m)
> +{
> +    pc_q35_6_2_machine_options(m);
> +    m->alias =3D NULL;
> +    compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
> +    compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
> +}
> +
>  DEFINE_Q35_MACHINE(v6_1, "pc-q35-6.1", NULL,
>                     pc_q35_6_1_machine_options);
> =20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 81699d4f8b..d39fd4e644 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4685,15 +4685,26 @@ static void spapr_machine_latest_class_options(Ma=
chineClass *mc)
>      }                                                                \
>      type_init(spapr_machine_register_##suffix)
> =20
> +/*
> + * pseries-6.2
> + */
> +static void spapr_machine_6_2_class_options(MachineClass *mc)
> +{
> +    /* Defaults for the latest behaviour inherited from the base class */
> +}
> +
> +DEFINE_SPAPR_MACHINE(6_2, "6.2", true);
> +
>  /*
>   * pseries-6.1
>   */
>  static void spapr_machine_6_1_class_options(MachineClass *mc)
>  {
> -    /* Defaults for the latest behaviour inherited from the base class */
> +    spapr_machine_6_2_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
>  }
> =20
> -DEFINE_SPAPR_MACHINE(6_1, "6.1", true);
> +DEFINE_SPAPR_MACHINE(6_1, "6.1", false);
> =20
>  /*
>   * pseries-6.0
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index e4b18aef49..4d25278cf2 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -791,14 +791,26 @@ bool css_migration_enabled(void)
>      }                                                                   =
      \
>      type_init(ccw_machine_register_##suffix)
> =20
> +static void ccw_machine_6_2_instance_options(MachineState *machine)
> +{
> +}
> +
> +static void ccw_machine_6_2_class_options(MachineClass *mc)
> +{
> +}
> +DEFINE_CCW_MACHINE(6_2, "6.2", true);
> +
>  static void ccw_machine_6_1_instance_options(MachineState *machine)
>  {
> +    ccw_machine_6_2_instance_options(machine);
>  }
> =20
>  static void ccw_machine_6_1_class_options(MachineClass *mc)
>  {
> +    ccw_machine_6_2_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
>  }
> -DEFINE_CCW_MACHINE(6_1, "6.1", true);
> +DEFINE_CCW_MACHINE(6_1, "6.1", false);
> =20
>  static void ccw_machine_6_0_instance_options(MachineState *machine)
>  {
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index b6161cee88..2832f0f8aa 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -354,6 +354,9 @@ struct MachineState {
>      } \
>      type_init(machine_initfn##_register_types)
> =20
> +extern GlobalProperty hw_compat_6_1[];
> +extern const size_t hw_compat_6_1_len;
> +
>  extern GlobalProperty hw_compat_6_0[];
>  extern const size_t hw_compat_6_0_len;
> =20
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 88dffe7517..97b4ab79b5 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -196,6 +196,9 @@ void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, s=
ize_t flash_size);
>  void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
>                         const CPUArchIdList *apic_ids, GArray *entry);
> =20
> +extern GlobalProperty pc_compat_6_1[];
> +extern const size_t pc_compat_6_1_len;
> +
>  extern GlobalProperty pc_compat_6_0[];
>  extern const size_t pc_compat_6_0_len;
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DlU4KoAmEnJS1toN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD088wACgkQbDjKyiDZ
s5LI5A/+NvBNZtzn23lmItFkvcMVHZIO1d0zDpGzLdtjAkzK2DuJVMOsNPvvfdKI
wuZy5v/4tV9U26MqYieBLkVvm+A5GywlQP7R1DO0G5Slql3fdijBQQ+oph+futMV
XCHHH/Qsj5UdTyzMb3bc6XPHLeiOpSReEgPWH1OANZuRMINK67yHQrCHggTBfyNl
Ydy08GH6UUTGw6KuRMXIQy0yBK9pefQniPachV+nXyWDO2LzPNGvJuSn6vlykXgF
JA4Gkt0tsfWqsutvDWUzxn7r1EPI0lxuT38ACphK1emcC6aCRaoOFxGBK5f6Wbof
E6XpToC3F++zKAU1Lyj+FDi51WPAnbQG+pA7Ve2i9XUHaJsidmLoqPVqmo/wbpV9
rlsnKzUkC1+tvc/yAck/bDI8LQspALmS1n3tpUd92IT0LELTBJHEe+AiPjPIIbaR
b/Y16kMioHkan4qZXP736sAqdzxhJEX+ENfUacYgCxDJhnF5BilpS3yprvaAOQyj
LD6mKFp1mPeBCZq9UejtOlls3WpjGsR2OaHFmmeYLramHvPtHEKqIcA46rE7XSlp
XCZ8xFXd404oYmDIikS/rnJRL8aj/yWxbunJBOdorlYOJ+/+92H9M9BLyX0kVNmn
quAXcMReXlwHodzIoT47JLBZX7Ma5k1fwN0DiL3ZPSGN7/Ja3bM=
=EOnZ
-----END PGP SIGNATURE-----

--DlU4KoAmEnJS1toN--

