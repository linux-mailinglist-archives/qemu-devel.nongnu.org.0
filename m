Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E91156398
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Feb 2020 10:27:33 +0100 (CET)
Received: from localhost ([::1]:39240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j0MOi-00079A-Q8
	for lists+qemu-devel@lfdr.de; Sat, 08 Feb 2020 04:27:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60332)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j0MNC-0005Sc-6s
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 04:26:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j0MN9-0000Sv-TF
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 04:25:58 -0500
Received: from ozlabs.org ([203.11.71.1]:35955)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j0MN7-0000AE-BV; Sat, 08 Feb 2020 04:25:54 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48F6Gd2fCfz9sRh; Sat,  8 Feb 2020 20:25:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1581153945;
 bh=5xxaktpo1rJpclXYu3ZvBHDFKAf/k0l1WOc9wOM3EcI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X7hCuQ1eUx26mNVKXvg0NPzOY2hJ4Fr5Yih1tdJyLjrq4pK3zRS8z0Um63WFbHXdr
 YJ73HTodR3TnnE+xeJy7qAOmcNSoRcW9+KVgz0QIy3tB2vqU9YX5MuiFe9CiZPPw+k
 G88vqqN6Wmr90Zk1WftSdQ/Nxn28ex709wp7QDxQ=
Date: Sat, 8 Feb 2020 20:24:33 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 2/3] hw: Make MachineClass::is_default a boolean type
Message-ID: <20200208092433.GC219689@umbus.fritz.box>
References: <20200207161948.15972-1-philmd@redhat.com>
 <20200207161948.15972-3-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WfZ7S8PLGjBY9Voh"
Content-Disposition: inline
In-Reply-To: <20200207161948.15972-3-philmd@redhat.com>
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
Cc: Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Jia Liu <proljc@gmail.com>, qemu-trivial@nongnu.org,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Magnus Damm <magnus.damm@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Richard Henderson <rth@twiddle.net>,
 qemu-riscv@nongnu.org, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--WfZ7S8PLGjBY9Voh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07, 2020 at 05:19:47PM +0100, Philippe Mathieu-Daud=E9 wrote:
> There's no good reason for it to be type int, change it to bool.
>=20
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

and ppc parts

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
> v4:
> - fixed incorrect changes to max_cpus (Laurent)
> - describe field
> ---
>  include/hw/boards.h                      |  4 +++-
>  hw/alpha/dp264.c                         |  2 +-
>  hw/cris/axis_dev88.c                     |  2 +-
>  hw/hppa/machine.c                        |  2 +-
>  hw/i386/pc_piix.c                        | 10 +++++-----
>  hw/lm32/lm32_boards.c                    |  2 +-
>  hw/m68k/mcf5208.c                        |  2 +-
>  hw/microblaze/petalogix_s3adsp1800_mmu.c |  2 +-
>  hw/mips/mips_malta.c                     |  2 +-
>  hw/moxie/moxiesim.c                      |  2 +-
>  hw/nios2/10m50_devboard.c                |  2 +-
>  hw/openrisc/openrisc_sim.c               |  2 +-
>  hw/ppc/mac_oldworld.c                    |  2 +-
>  hw/ppc/spapr.c                           |  2 +-
>  hw/riscv/spike.c                         |  2 +-
>  hw/s390x/s390-virtio-ccw.c               |  2 +-
>  hw/sh4/shix.c                            |  2 +-
>  hw/sparc/sun4m.c                         |  2 +-
>  hw/sparc64/sun4u.c                       |  2 +-
>  hw/unicore32/puv3.c                      |  2 +-
>  20 files changed, 26 insertions(+), 24 deletions(-)
>=20
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index fb1b43d5b9..c3523a70e8 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -107,6 +107,8 @@ typedef struct {
>   * @max_cpus: maximum number of CPUs supported. Default: 1
>   * @min_cpus: minimum number of CPUs supported. Default: 1
>   * @default_cpus: number of CPUs instantiated if none are specified. Def=
ault: 1
> + * @is_default:
> + *    If true QEMU will use this machine by default if no '-M' option is=
 given.
>   * @get_hotplug_handler: this function is called during bus-less
>   *    device hotplug. If defined it returns pointer to an instance
>   *    of HotplugHandler object, which handles hotplug operation
> @@ -200,7 +202,7 @@ struct MachineClass {
>          no_sdcard:1,
>          pci_allow_0_address:1,
>          legacy_fw_cfg_order:1;
> -    int is_default;
> +    bool is_default;
>      const char *default_machine_opts;
>      const char *default_boot_order;
>      const char *default_display;
> diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
> index a8f9a89cc4..083a198a64 100644
> --- a/hw/alpha/dp264.c
> +++ b/hw/alpha/dp264.c
> @@ -181,7 +181,7 @@ static void clipper_machine_init(MachineClass *mc)
>      mc->init =3D clipper_init;
>      mc->block_default_type =3D IF_IDE;
>      mc->max_cpus =3D 4;
> -    mc->is_default =3D 1;
> +    mc->is_default =3D true;
>      mc->default_cpu_type =3D ALPHA_CPU_TYPE_NAME("ev67");
>  }
> =20
> diff --git a/hw/cris/axis_dev88.c b/hw/cris/axis_dev88.c
> index be7760476a..de7b49188b 100644
> --- a/hw/cris/axis_dev88.c
> +++ b/hw/cris/axis_dev88.c
> @@ -349,7 +349,7 @@ static void axisdev88_machine_init(MachineClass *mc)
>  {
>      mc->desc =3D "AXIS devboard 88";
>      mc->init =3D axisdev88_init;
> -    mc->is_default =3D 1;
> +    mc->is_default =3D true;
>      mc->default_cpu_type =3D CRIS_CPU_TYPE_NAME("crisv32");
>  }
> =20
> diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
> index d8755ec422..83ae87f565 100644
> --- a/hw/hppa/machine.c
> +++ b/hw/hppa/machine.c
> @@ -295,7 +295,7 @@ static void machine_hppa_machine_init(MachineClass *m=
c)
>      mc->block_default_type =3D IF_SCSI;
>      mc->max_cpus =3D HPPA_MAX_CPUS;
>      mc->default_cpus =3D 1;
> -    mc->is_default =3D 1;
> +    mc->is_default =3D true;
>      mc->default_ram_size =3D 512 * MiB;
>      mc->default_boot_order =3D "cd";
>  }
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index fa12203079..9088db8fb6 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -423,7 +423,7 @@ static void pc_i440fx_5_0_machine_options(MachineClas=
s *m)
>      PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
>      pc_i440fx_machine_options(m);
>      m->alias =3D "pc";
> -    m->is_default =3D 1;
> +    m->is_default =3D true;
>      pcmc->default_cpu_version =3D 1;
>  }
> =20
> @@ -434,7 +434,7 @@ static void pc_i440fx_4_2_machine_options(MachineClas=
s *m)
>  {
>      pc_i440fx_5_0_machine_options(m);
>      m->alias =3D NULL;
> -    m->is_default =3D 0;
> +    m->is_default =3D false;
>      compat_props_add(m->compat_props, hw_compat_4_2, hw_compat_4_2_len);
>      compat_props_add(m->compat_props, pc_compat_4_2, pc_compat_4_2_len);
>  }
> @@ -446,7 +446,7 @@ static void pc_i440fx_4_1_machine_options(MachineClas=
s *m)
>  {
>      pc_i440fx_4_2_machine_options(m);
>      m->alias =3D NULL;
> -    m->is_default =3D 0;
> +    m->is_default =3D false;
>      compat_props_add(m->compat_props, hw_compat_4_1, hw_compat_4_1_len);
>      compat_props_add(m->compat_props, pc_compat_4_1, pc_compat_4_1_len);
>  }
> @@ -459,7 +459,7 @@ static void pc_i440fx_4_0_machine_options(MachineClas=
s *m)
>      PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
>      pc_i440fx_4_1_machine_options(m);
>      m->alias =3D NULL;
> -    m->is_default =3D 0;
> +    m->is_default =3D false;
>      pcmc->default_cpu_version =3D CPU_VERSION_LEGACY;
>      compat_props_add(m->compat_props, hw_compat_4_0, hw_compat_4_0_len);
>      compat_props_add(m->compat_props, pc_compat_4_0, pc_compat_4_0_len);
> @@ -473,7 +473,7 @@ static void pc_i440fx_3_1_machine_options(MachineClas=
s *m)
>      PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
> =20
>      pc_i440fx_4_0_machine_options(m);
> -    m->is_default =3D 0;
> +    m->is_default =3D false;
>      pcmc->do_not_add_smb_acpi =3D true;
>      m->smbus_no_migration_support =3D true;
>      m->alias =3D NULL;
> diff --git a/hw/lm32/lm32_boards.c b/hw/lm32/lm32_boards.c
> index 156b050abc..352f69532e 100644
> --- a/hw/lm32/lm32_boards.c
> +++ b/hw/lm32/lm32_boards.c
> @@ -286,7 +286,7 @@ static void lm32_evr_class_init(ObjectClass *oc, void=
 *data)
> =20
>      mc->desc =3D "LatticeMico32 EVR32 eval system";
>      mc->init =3D lm32_evr_init;
> -    mc->is_default =3D 1;
> +    mc->is_default =3D true;
>      mc->default_cpu_type =3D LM32_CPU_TYPE_NAME("lm32-full");
>  }
> =20
> diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
> index a999c21982..5f8f6e4475 100644
> --- a/hw/m68k/mcf5208.c
> +++ b/hw/m68k/mcf5208.c
> @@ -352,7 +352,7 @@ static void mcf5208evb_machine_init(MachineClass *mc)
>  {
>      mc->desc =3D "MCF5208EVB";
>      mc->init =3D mcf5208evb_init;
> -    mc->is_default =3D 1;
> +    mc->is_default =3D true;
>      mc->default_cpu_type =3D M68K_CPU_TYPE_NAME("m5208");
>  }
> =20
> diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/pet=
alogix_s3adsp1800_mmu.c
> index 849bafc186..0bb6cdea8d 100644
> --- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
> +++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
> @@ -132,7 +132,7 @@ static void petalogix_s3adsp1800_machine_init(Machine=
Class *mc)
>  {
>      mc->desc =3D "PetaLogix linux refdesign for xilinx Spartan 3ADSP1800=
";
>      mc->init =3D petalogix_s3adsp1800_init;
> -    mc->is_default =3D 1;
> +    mc->is_default =3D true;
>  }
> =20
>  DEFINE_MACHINE("petalogix-s3adsp1800", petalogix_s3adsp1800_machine_init)
> diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
> index 34b76bb6a1..499eac8d33 100644
> --- a/hw/mips/mips_malta.c
> +++ b/hw/mips/mips_malta.c
> @@ -1442,7 +1442,7 @@ static void mips_malta_machine_init(MachineClass *m=
c)
>      mc->init =3D mips_malta_init;
>      mc->block_default_type =3D IF_IDE;
>      mc->max_cpus =3D 16;
> -    mc->is_default =3D 1;
> +    mc->is_default =3D true;
>  #ifdef TARGET_MIPS64
>      mc->default_cpu_type =3D MIPS_CPU_TYPE_NAME("20Kc");
>  #else
> diff --git a/hw/moxie/moxiesim.c b/hw/moxie/moxiesim.c
> index 1d06e39fcb..51a98287b5 100644
> --- a/hw/moxie/moxiesim.c
> +++ b/hw/moxie/moxiesim.c
> @@ -150,7 +150,7 @@ static void moxiesim_machine_init(MachineClass *mc)
>  {
>      mc->desc =3D "Moxie simulator platform";
>      mc->init =3D moxiesim_init;
> -    mc->is_default =3D 1;
> +    mc->is_default =3D true;
>      mc->default_cpu_type =3D MOXIE_CPU_TYPE_NAME("MoxieLite");
>  }
> =20
> diff --git a/hw/nios2/10m50_devboard.c b/hw/nios2/10m50_devboard.c
> index ad8b2fc670..33dc2bf511 100644
> --- a/hw/nios2/10m50_devboard.c
> +++ b/hw/nios2/10m50_devboard.c
> @@ -120,7 +120,7 @@ static void nios2_10m50_ghrd_machine_init(struct Mach=
ineClass *mc)
>  {
>      mc->desc =3D "Altera 10M50 GHRD Nios II design";
>      mc->init =3D nios2_10m50_ghrd_init;
> -    mc->is_default =3D 1;
> +    mc->is_default =3D true;
>  }
> =20
>  DEFINE_MACHINE("10m50-ghrd", nios2_10m50_ghrd_machine_init);
> diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
> index ad5371250f..d08ce61811 100644
> --- a/hw/openrisc/openrisc_sim.c
> +++ b/hw/openrisc/openrisc_sim.c
> @@ -176,7 +176,7 @@ static void openrisc_sim_machine_init(MachineClass *m=
c)
>      mc->desc =3D "or1k simulation";
>      mc->init =3D openrisc_sim_init;
>      mc->max_cpus =3D 2;
> -    mc->is_default =3D 1;
> +    mc->is_default =3D true;
>      mc->default_cpu_type =3D OPENRISC_CPU_TYPE_NAME("or1200");
>  }
> =20
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index 7318d7e9b4..1630663bc2 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -438,7 +438,7 @@ static void heathrow_class_init(ObjectClass *oc, void=
 *data)
>      mc->block_default_type =3D IF_IDE;
>      mc->max_cpus =3D MAX_CPUS;
>  #ifndef TARGET_PPC64
> -    mc->is_default =3D 1;
> +    mc->is_default =3D true;
>  #endif
>      /* TOFIX "cad" when Mac floppy is implemented */
>      mc->default_boot_order =3D "cd";
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index c9b2e0a5e0..e3e3208cd8 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4493,7 +4493,7 @@ static const TypeInfo spapr_machine_info =3D {
>          spapr_machine_##suffix##_class_options(mc);                  \
>          if (latest) {                                                \
>              mc->alias =3D "pseries";                                   \
> -            mc->is_default =3D 1;                                      \
> +            mc->is_default =3D true;                                   \
>          }                                                            \
>      }                                                                \
>      static const TypeInfo spapr_machine_##suffix##_info =3D {          \
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 8823681783..6f03857660 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -448,7 +448,7 @@ static void spike_machine_init(MachineClass *mc)
>      mc->desc =3D "RISC-V Spike Board";
>      mc->init =3D spike_board_init;
>      mc->max_cpus =3D 1;
> -    mc->is_default =3D 1;
> +    mc->is_default =3D true;
>      mc->default_cpu_type =3D SPIKE_V1_10_0_CPU;
>  }
> =20
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index e759eb5f83..c4b291e434 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -631,7 +631,7 @@ bool css_migration_enabled(void)
>          mc->desc =3D "VirtIO-ccw based S390 machine v" verstr;          =
        \
>          if (latest) {                                                   =
      \
>              mc->alias =3D "s390-ccw-virtio";                            =
        \
> -            mc->is_default =3D 1;                                       =
        \
> +            mc->is_default =3D true;                                    =
        \
>          }                                                               =
      \
>      }                                                                   =
      \
>      static void ccw_machine_##suffix##_instance_init(Object *obj)       =
      \
> diff --git a/hw/sh4/shix.c b/hw/sh4/shix.c
> index 2fc2915428..68b14ee5e7 100644
> --- a/hw/sh4/shix.c
> +++ b/hw/sh4/shix.c
> @@ -82,7 +82,7 @@ static void shix_machine_init(MachineClass *mc)
>  {
>      mc->desc =3D "shix card";
>      mc->init =3D shix_init;
> -    mc->is_default =3D 1;
> +    mc->is_default =3D true;
>      mc->default_cpu_type =3D TYPE_SH7750R_CPU;
>  }
> =20
> diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
> index 25e96db5ca..d6c9772f95 100644
> --- a/hw/sparc/sun4m.c
> +++ b/hw/sparc/sun4m.c
> @@ -1411,7 +1411,7 @@ static void ss5_class_init(ObjectClass *oc, void *d=
ata)
>      mc->desc =3D "Sun4m platform, SPARCstation 5";
>      mc->init =3D ss5_init;
>      mc->block_default_type =3D IF_SCSI;
> -    mc->is_default =3D 1;
> +    mc->is_default =3D true;
>      mc->default_boot_order =3D "c";
>      mc->default_cpu_type =3D SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
>      mc->default_display =3D "tcx";
> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
> index b7ac42f7a5..d33e84f831 100644
> --- a/hw/sparc64/sun4u.c
> +++ b/hw/sparc64/sun4u.c
> @@ -816,7 +816,7 @@ static void sun4u_class_init(ObjectClass *oc, void *d=
ata)
>      mc->init =3D sun4u_init;
>      mc->block_default_type =3D IF_IDE;
>      mc->max_cpus =3D 1; /* XXX for now */
> -    mc->is_default =3D 1;
> +    mc->is_default =3D true;
>      mc->default_boot_order =3D "c";
>      mc->default_cpu_type =3D SPARC_CPU_TYPE_NAME("TI-UltraSparc-IIi");
>      mc->ignore_boot_device_suffixes =3D true;
> diff --git a/hw/unicore32/puv3.c b/hw/unicore32/puv3.c
> index 7e933de228..7f9c0238fe 100644
> --- a/hw/unicore32/puv3.c
> +++ b/hw/unicore32/puv3.c
> @@ -140,7 +140,7 @@ static void puv3_machine_init(MachineClass *mc)
>  {
>      mc->desc =3D "PKUnity Version-3 based on UniCore32";
>      mc->init =3D puv3_init;
> -    mc->is_default =3D 1;
> +    mc->is_default =3D true;
>      mc->default_cpu_type =3D UNICORE32_CPU_TYPE_NAME("UniCore-II");
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--WfZ7S8PLGjBY9Voh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4+flEACgkQbDjKyiDZ
s5IUhQ/9Fbjjih2H/bdHDRoUfBtsHBy3aiUyzXLunHjwi/pafy/v/HJ3fNyqsMBl
JW4nqa1mQXpH6EL6cwiltoBkU0BT5mKU3zNpu/3Zqx+BmxsUzkOAXebWPBhPq4LM
bZN61ZDjP7KZKyQfXSD4Oq4/rni/6kGpbFgTrENV7lqGXt0O0m6wy/5EMkrA2WMp
SZ/9X2kbw8J7S4U9IePF9auJ4HloavGrRiv+u1N1WCLMX+Mxpu2rVD4OzK+ZA+td
7zIp+BEk8hwUDU8AErrKQzqxV4gSpYtXAgQ0U3oYx3IPun391Lcvzs34FUGAfkhw
LkCYJbhlarucrfAchQrXCWdZ4DXiO6ZGB5xZUwGnle9Hjw7WoB4N+1SYRmkMeE8y
GFCrxTP6fwImiWaaObdINF8OCfnB2ELGymM2z+wqxNndKF5HxqJIoNrPkVJaGHMc
z44YcproNbvWb/ovsRuWoi7VHJsNHHQuoKcYiUWXfy9y3VD9oSNkAIcU0/ZY7Y0Y
9XCJtMo0Y43dqhPeLphCJXUxjBT63DTq4DZmDtGGDKn7JM0S71d2jwmyNogQAtPy
PS8TaKb5lohIXl+NPqeMnrdgu9h5qK6OWxIwPiZKAF7FqnipjGe2ljScqOn8xAcG
0Z7Toa67QcIgqWARnC0aetc1RSZks1rmRw9HmpDrnxzHPEZAFSo=
=sHbV
-----END PGP SIGNATURE-----

--WfZ7S8PLGjBY9Voh--

