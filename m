Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDB61CCF0B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 03:12:35 +0200 (CEST)
Received: from localhost ([::1]:56474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jXwzg-0007Qw-Ny
	for lists+qemu-devel@lfdr.de; Sun, 10 May 2020 21:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1jXwyp-0006v2-8n
 for qemu-devel@nongnu.org; Sun, 10 May 2020 21:11:39 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:41606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1jXwym-00063M-Q3
 for qemu-devel@nongnu.org; Sun, 10 May 2020 21:11:39 -0400
Received: by mail-lf1-x144.google.com with SMTP id a9so6041305lfb.8
 for <qemu-devel@nongnu.org>; Sun, 10 May 2020 18:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BuNz/c0y9FfVdNW0TKmj801N0LkACqUHYlO6f3XI+z0=;
 b=INc76/f9K30xv1iCcfCKzlv5XAe/nk1J01xxi44c66AueTamYikOpbf6nm4YLQrfcV
 vH52ZoPuH03UBx+bqmPF2BpzZU2c9KfdzfHLrgHKt+MkNV3dXoK0dZxqJQrRo6rnJGsM
 zM+mVilf0vPDjLfoAT2i3WAUn8cbrt+u9v5n6697c+JQOOv6O1USMExJ5zTcUBOWslxC
 xGYWL888g64mfN2uTxEMqushgQ+oIewGec8t2UK4VCS3x4HzH0MKC/HP0VxsBVm9uWzB
 fjVtnJYXuLf3k2NqvWFWV5vQ2roIdme2A7trddAHcpbslTwrfblUolX33Kl3cL8iOZSB
 NC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BuNz/c0y9FfVdNW0TKmj801N0LkACqUHYlO6f3XI+z0=;
 b=KShnJ+AHahriBp1kSH1pRdrXIK7JDkJO/WP4weNyppfJybIOtmMhHGTc4NNuOY/DwX
 V2S4/J/4r5LJXzAzMRILc5Bdfx4QcoSwvBaqfhFI6gf80iy72CCXpQ4iiAsnJ0kDOia9
 +eww39gmqKGL2QFdd5WfPZRCuAFic/76gDHcVPCVx9g0N/PtwlnYZhPqW3ZryYr2tCfc
 pWiSzAF62mnhe3s/BbTH2c3EbTFed9dl0Hac/yxVMgMVUww4eH2UaRSr6RXOOSlN5eMK
 qGOlag1EJG+fLfQ6Eo+cg0FJLYvgumHEjhIk/hXedvxqwz6pUzcSIRBMq1G2POyPBpZ/
 /IWw==
X-Gm-Message-State: AOAM533C5kwgUX0w0DLbvB6E9zx+yNJ7/HfZn2oQly2yq13rjoC29m2x
 5vEkcKw9Js6A+GxeY/j2MoLsHLwRE/nYZKx+1oI=
X-Google-Smtp-Source: ABdhPJyqs7pFrmspfLmmunkQFoLkS72ulHoM62Cr+a4Ut5trny08RWkyPV4xCz3sCjniDJghBlSoFuP5+i6f/SHSLOA=
X-Received: by 2002:ac2:4436:: with SMTP id w22mr9021206lfl.55.1589159494893; 
 Sun, 10 May 2020 18:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200510210128.18343-1-f4bug@amsat.org>
 <20200510210128.18343-5-f4bug@amsat.org>
In-Reply-To: <20200510210128.18343-5-f4bug@amsat.org>
From: chen huacai <zltjiangshi@gmail.com>
Date: Mon, 11 May 2020 09:19:16 +0800
Message-ID: <CABDp7VoD-ieFO+ijrKyCpKWQkLknD3Z+CzmvrkLPfmY7pedOzA@mail.gmail.com>
Subject: Re: [PATCH 04/12] hw/mips/fuloong2e: Fix typo in Fuloong machine name
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::144;
 envelope-from=zltjiangshi@gmail.com; helo=mail-lf1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Huacai Chen <chenhuacai@gmail.com>, qemu-level <qemu-devel@nongnu.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, Huacai Chen <chenhc@lemote.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Philippe,

On Mon, May 11, 2020 at 5:06 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> We always miswrote the Fuloong machine... Fix its name.
> Add an machine alias to the previous name for backward
> compatibility.
>
> Suggested-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  docs/system/target-mips.rst              |  2 +-
>  default-configs/mips64el-softmmu.mak     |  2 +-
>  hw/isa/vt82c686.c                        |  2 +-
>  hw/mips/{mips_fulong2e.c =3D> fuloong2e.c} | 46 ++++++++++++------------
Use mips_fuloong2e.c instead of fuloong2e.c? Other machine file names
also have a "mips_" prefix.

Huacai
>  hw/pci-host/bonito.c                     |  8 ++---
>  tests/qtest/endianness-test.c            |  2 +-
>  MAINTAINERS                              |  4 +--
>  hw/mips/Kconfig                          |  2 +-
>  hw/mips/Makefile.objs                    |  2 +-
>  9 files changed, 36 insertions(+), 34 deletions(-)
>  rename hw/mips/{mips_fulong2e.c =3D> fuloong2e.c} (91%)
>
> diff --git a/docs/system/target-mips.rst b/docs/system/target-mips.rst
> index 2736fd0509..cd2a931edf 100644
> --- a/docs/system/target-mips.rst
> +++ b/docs/system/target-mips.rst
> @@ -74,7 +74,7 @@ The MIPS Magnum R4000 emulation supports:
>
>  -  G364 framebuffer
>
> -The Fulong 2E emulation supports:
> +The Fuloong 2E emulation supports:
>
>  -  Loongson 2E CPU
>
> diff --git a/default-configs/mips64el-softmmu.mak b/default-configs/mips6=
4el-softmmu.mak
> index 8b0c9b1e15..9f8a3ef156 100644
> --- a/default-configs/mips64el-softmmu.mak
> +++ b/default-configs/mips64el-softmmu.mak
> @@ -2,7 +2,7 @@
>
>  include mips-softmmu-common.mak
>  CONFIG_IDE_VIA=3Dy
> -CONFIG_FULONG=3Dy
> +CONFIG_FULOONG=3Dy
>  CONFIG_ATI_VGA=3Dy
>  CONFIG_RTL8139_PCI=3Dy
>  CONFIG_JAZZ=3Dy
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index d9b51fce8d..fac4e56b7d 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -503,7 +503,7 @@ static void via_class_init(ObjectClass *klass, void *=
data)
>      dc->vmsd =3D &vmstate_via;
>      /*
>       * Reason: part of VIA VT82C686 southbridge, needs to be wired up,
> -     * e.g. by mips_fulong2e_init()
> +     * e.g. by mips_fuloong2e_init()
>       */
>      dc->user_creatable =3D false;
>  }
> diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/fuloong2e.c
> similarity index 91%
> rename from hw/mips/mips_fulong2e.c
> rename to hw/mips/fuloong2e.c
> index 4e1a3646af..624c46a4fd 100644
> --- a/hw/mips/mips_fulong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -1,5 +1,5 @@
>  /*
> - * QEMU fulong 2e mini pc support
> + * QEMU fuloong 2e mini pc support
>   *
>   * Copyright (c) 2008 yajin (yajin@vm-kernel.org)
>   * Copyright (c) 2009 chenming (chenming@rdc.faw.com.cn)
> @@ -11,8 +11,8 @@
>   */
>
>  /*
> - * Fulong 2e mini pc is based on ICT/ST Loongson 2e CPU (MIPS III like, =
800MHz)
> - * http://www.linux-mips.org/wiki/Fulong
> + * Fuloong 2e mini pc is based on ICT/ST Loongson 2e CPU (MIPS III like,=
 800MHz)
> + * https://www.linux-mips.org/wiki/Fuloong_2E
>   *
>   * Loongson 2e user manual:
>   * http://www.loongsondeveloper.com/doc/Loongson2EUserGuide.pdf
> @@ -46,13 +46,13 @@
>  #include "sysemu/reset.h"
>  #include "qemu/error-report.h"
>
> -#define DEBUG_FULONG2E_INIT
> +#define DEBUG_FULOONG2E_INIT
>
>  #define ENVP_ADDR               0x80002000l
>  #define ENVP_NB_ENTRIES         16
>  #define ENVP_ENTRY_SIZE         256
>
> -/* fulong 2e has a 512k flash: Winbond W39L040AP70Z */
> +/* Fuloong 2e has a 512k flash: Winbond W39L040AP70Z */
>  #define BIOS_SIZE               (512 * KiB)
>  #define MAX_IDE_BUS             2
>
> @@ -69,12 +69,12 @@
>   * 2, use "Bonito2edev" to replace "dir_corresponding_to_your_target_har=
dware"
>   * in the "Compile Guide".
>   */
> -#define FULONG_BIOSNAME "pmon_2e.bin"
> +#define FULOONG_BIOSNAME "pmon_2e.bin"
>
> -/* PCI SLOT in fulong 2e */
> -#define FULONG2E_VIA_SLOT        5
> -#define FULONG2E_ATI_SLOT        6
> -#define FULONG2E_RTL8139_SLOT    7
> +/* PCI SLOT in Fuloong 2e */
> +#define FULOONG2E_VIA_SLOT        5
> +#define FULOONG2E_ATI_SLOT        6
> +#define FULOONG2E_RTL8139_SLOT    7
>
>  static struct _loaderparams {
>      int ram_size;
> @@ -279,7 +279,7 @@ static void network_init(PCIBus *pci_bus)
>          const char *default_devaddr =3D NULL;
>
>          if (i =3D=3D 0 && (!nd->model || strcmp(nd->model, "rtl8139") =
=3D=3D 0)) {
> -            /* The fulong board has a RTL8139 card using PCI SLOT 7 */
> +            /* The Fuloong board has a RTL8139 card using PCI SLOT 7 */
>              default_devaddr =3D "07";
>          }
>
> @@ -287,7 +287,7 @@ static void network_init(PCIBus *pci_bus)
>      }
>  }
>
> -static void mips_fulong2e_init(MachineState *machine)
> +static void mips_fuloong2e_init(MachineState *machine)
>  {
>      const char *kernel_filename =3D machine->kernel_filename;
>      const char *kernel_cmdline =3D machine->kernel_cmdline;
> @@ -316,11 +316,12 @@ static void mips_fulong2e_init(MachineState *machin=
e)
>          error_report("Invalid RAM size, should be 256MB");
>          exit(EXIT_FAILURE);
>      }
> -    memory_region_add_subregion(address_space_mem, 0, machine->ram);
>
> -    /* Boot ROM */
> -    memory_region_init_rom(bios, NULL, "fulong2e.bios", BIOS_SIZE,
> +    /* allocate RAM */
> +    memory_region_init_rom(bios, NULL, "fuloong2e.bios", BIOS_SIZE,
>                             &error_fatal);
> +
> +    memory_region_add_subregion(address_space_mem, 0, machine->ram);
>      memory_region_add_subregion(address_space_mem, 0x1fc00000LL, bios);
>
>      /*
> @@ -337,7 +338,7 @@ static void mips_fulong2e_init(MachineState *machine)
>          write_bootloader(env, memory_region_get_ram_ptr(bios), kernel_en=
try);
>      } else {
>          if (bios_name =3D=3D NULL) {
> -                bios_name =3D FULONG_BIOSNAME;
> +                bios_name =3D FULOONG_BIOSNAME;
>          }
>          filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
>          if (filename) {
> @@ -363,7 +364,7 @@ static void mips_fulong2e_init(MachineState *machine)
>      pci_bus =3D bonito_init((qemu_irq *)&(env->irq[2]));
>
>      /* South bridge -> IP5 */
> -    vt82c686b_southbridge_init(pci_bus, FULONG2E_VIA_SLOT, env->irq[5],
> +    vt82c686b_southbridge_init(pci_bus, FULOONG2E_VIA_SLOT, env->irq[5],
>                                 &smbus, &isa_bus);
>
>      /* GPU */
> @@ -384,14 +385,15 @@ static void mips_fulong2e_init(MachineState *machin=
e)
>      network_init(pci_bus);
>  }
>
> -static void mips_fulong2e_machine_init(MachineClass *mc)
> +static void mips_fuloong2e_machine_init(MachineClass *mc)
>  {
> -    mc->desc =3D "Fulong 2e mini pc";
> -    mc->init =3D mips_fulong2e_init;
> +    mc->desc =3D "Fuloong 2e mini pc";
> +    mc->alias =3D "fulong2e";             /* Incorrect name used up to Q=
EMU 4.2 */
> +    mc->init =3D mips_fuloong2e_init;
>      mc->block_default_type =3D IF_IDE;
>      mc->default_cpu_type =3D MIPS_CPU_TYPE_NAME("Loongson-2E");
>      mc->default_ram_size =3D 256 * MiB;
> -    mc->default_ram_id =3D "fulong2e.ram";
> +    mc->default_ram_id =3D "fuloong2e.ram";
>  }
>
> -DEFINE_MACHINE("fulong2e", mips_fulong2e_machine_init)
> +DEFINE_MACHINE("fuloong2e", mips_fuloong2e_machine_init)
> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
> index cc6545c8a8..b9bfe3c417 100644
> --- a/hw/pci-host/bonito.c
> +++ b/hw/pci-host/bonito.c
> @@ -11,7 +11,7 @@
>   */
>
>  /*
> - * fulong 2e mini pc has a bonito north bridge.
> + * fuloong 2e mini pc has a bonito north bridge.
>   */
>
>  /*
> @@ -559,11 +559,11 @@ static int pci_bonito_map_irq(PCIDevice *pci_dev, i=
nt irq_num)
>      slot =3D (pci_dev->devfn >> 3);
>
>      switch (slot) {
> -    case 5:   /* FULONG2E_VIA_SLOT, SouthBridge, IDE, USB, ACPI, AC97, M=
C97 */
> +    case 5:   /* FULOONG2E_VIA_SLOT, SouthBridge, IDE, USB, ACPI, AC97, =
MC97 */
>          return irq_num % 4 + BONITO_IRQ_BASE;
> -    case 6:   /* FULONG2E_ATI_SLOT, VGA */
> +    case 6:   /* FULOONG2E_ATI_SLOT, VGA */
>          return 4 + BONITO_IRQ_BASE;
> -    case 7:   /* FULONG2E_RTL_SLOT, RTL8139 */
> +    case 7:   /* FULOONG2E_RTL_SLOT, RTL8139 */
>          return 5 + BONITO_IRQ_BASE;
>      case 8 ... 12: /* PCI slot 1 to 4 */
>          return (slot - 8 + irq_num) + 6 + BONITO_IRQ_BASE;
> diff --git a/tests/qtest/endianness-test.c b/tests/qtest/endianness-test.=
c
> index 2798802c63..cc088ac01a 100644
> --- a/tests/qtest/endianness-test.c
> +++ b/tests/qtest/endianness-test.c
> @@ -33,7 +33,7 @@ static const TestCase test_cases[] =3D {
>      { "mips64", "pica61", 0x90000000, .bswap =3D true },
>      { "mips64", "mips", 0x14000000, .bswap =3D true },
>      { "mips64", "malta", 0x10000000, .bswap =3D true },
> -    { "mips64el", "fulong2e", 0x1fd00000 },
> +    { "mips64el", "fuloong2e", 0x1fd00000 },
>      { "ppc", "g3beige", 0xfe000000, .bswap =3D true, .superio =3D "i8237=
8" },
>      { "ppc", "40p", 0x80000000, .bswap =3D true },
>      { "ppc", "bamboo", 0xe8000000, .bswap =3D true, .superio =3D "i82378=
" },
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aa5c54c75a..50f6a5f1bb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1074,13 +1074,13 @@ R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com=
>
>  S: Obsolete
>  F: hw/mips/mips_r4k.c
>
> -Fulong 2E
> +Fuloong 2E
>  M: Huacai Chen <chenhc@lemote.com>
>  M: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>  M: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
>  R: Jiaxun Yang <jiaxun.yang@flygoat.com>
>  S: Odd Fixes
> -F: hw/mips/mips_fulong2e.c
> +F: hw/mips/fuloong2e.c
>  F: hw/isa/vt82c686.c
>  F: hw/pci-host/bonito.c
>  F: include/hw/isa/vt82c686.h
> diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
> index 2c2adbc42a..cd38546689 100644
> --- a/hw/mips/Kconfig
> +++ b/hw/mips/Kconfig
> @@ -41,7 +41,7 @@ config JAZZ
>      select DS1225Y
>      select JAZZ_LED
>
> -config FULONG
> +config FULOONG
>      bool
>
>  config MIPS_CPS
> diff --git a/hw/mips/Makefile.objs b/hw/mips/Makefile.objs
> index 525809af07..8ab41edc3f 100644
> --- a/hw/mips/Makefile.objs
> +++ b/hw/mips/Makefile.objs
> @@ -3,6 +3,6 @@ obj-$(CONFIG_R4K) +=3D mips_r4k.o
>  obj-$(CONFIG_MALTA) +=3D gt64xxx_pci.o mips_malta.o
>  obj-$(CONFIG_MIPSSIM) +=3D mips_mipssim.o
>  obj-$(CONFIG_JAZZ) +=3D mips_jazz.o
> -obj-$(CONFIG_FULONG) +=3D mips_fulong2e.o
> +obj-$(CONFIG_FULOONG) +=3D fuloong2e.o
>  obj-$(CONFIG_MIPS_CPS) +=3D cps.o
>  obj-$(CONFIG_MIPS_BOSTON) +=3D boston.o
> --
> 2.21.3
>
>


--=20
Huacai Chen

