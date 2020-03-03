Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C026517858B
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 23:23:23 +0100 (CET)
Received: from localhost ([::1]:54664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9Fwg-0006UY-BO
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 17:23:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46014)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j9Fvi-0005qv-HU
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 17:22:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j9Fvd-0005No-EL
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 17:22:22 -0500
Received: from ozlabs.org ([203.11.71.1]:51935)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j9FvQ-000592-SI; Tue, 03 Mar 2020 17:22:06 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48XBMF06gSz9sPK; Wed,  4 Mar 2020 09:22:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1583274121;
 bh=bSvrCyWd6VaeFv7AMmjH/0XDCfUvIEMdmyxDB++Vp4k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L6AmoZPHBHVT46VTCf6RRr0dnxp2DZoNs75D82a2ZOhOA2c8nu54lgCFkkcJz2XGm
 hPo7i3k+ST6IJFoGJ6SX/YYej38qBxWLTVayc6LtTNbWY7zNQ04dDkSX/sZiz1DxK4
 9W9/88O5vuUAM+I7QPtnCKhEyDh7juq87pZqS/uk=
Date: Wed, 4 Mar 2020 09:19:50 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] cpu: Use DeviceClass reset instead of a special CPUClass
 reset
Message-ID: <20200303221950.GE35885@umbus.fritz.box>
References: <20200303100511.5498-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DqhR8hV3EnoxUkKN"
Content-Disposition: inline
In-Reply-To: <20200303100511.5498-1-peter.maydell@linaro.org>
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
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 qemu-ppc@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Stafford Horne <shorne@gmail.com>,
 Richard Henderson <rth@twiddle.net>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--DqhR8hV3EnoxUkKN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2020 at 10:05:11AM +0000, Peter Maydell wrote:
> The CPUClass has a 'reset' method.  This is a legacy from when
> TYPE_CPU used not to inherit from TYPE_DEVICE.  We don't need it any
> more, as we can simply use the TYPE_DEVICE reset.  The 'cpu_reset()'
> function is kept as the API which most places use to reset a CPU; it
> is now a wrapper which calls device_cold_reset() and then the
> tracepoint function.
>=20
> This change should not cause CPU objects to be reset more often
> than they are at the moment, because:
>  * nobody is directly calling device_cold_reset() or
>    qdev_reset_all() on CPU objects
>  * no CPU object is on a qbus, so they will not be reset either
>    by somebody calling qbus_reset_all()/bus_cold_reset(), or
>    by the main "reset sysbus and everything in the qbus tree"
>    reset that most devices are reset by
>=20
> Note that this does not change the need for each machine or whatever
> to use qemu_register_reset() to arrange to call cpu_reset() -- that
> is necessary because CPU objects are not on any qbus, so they don't
> get reset when the qbus tree rooted at the sysbus bus is reset, and
> this isn't being changed here.
>=20
> All the changes to the files under target/ were made using the
> included Coccinelle script, except:
>=20
> (1) the deletion of the now-inaccurate and not terribly useful
> "CPUClass::reset" comments was done with a perl one-liner afterwards:
>   perl -n -i -e '/ CPUClass::reset/ or print' target/*/*.c
>=20
> (2) this bit of the s390 change was done by hand, because the
> Coccinelle script is not sophisticated enough to handle the
> parent_reset call being inside another function:
>=20
> | @@ -96,8 +96,9 @@ static void s390_cpu_reset(CPUState *s, cpu_reset_typ=
e type)
> |     S390CPU *cpu =3D S390_CPU(s);
> |     S390CPUClass *scc =3D S390_CPU_GET_CLASS(cpu);
> |     CPUS390XState *env =3D &cpu->env;
> |+    DeviceState *dev =3D DEVICE(s);
> |
> |-    scc->parent_reset(s);
> |+    scc->parent_reset(dev);
> |     cpu->env.sigp_order =3D 0;
> |     s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

ppc parts

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
> Testing was by 'make check' and 'make check-acceptance'.
>=20
> I need this patch as a preliminary to some arm stuff I'm
> doing, but I think it makes sense as a cleanup in its own
> right so I'm sending it out early for review. If it's not
> yet in master before I get round to finishing the stuff
> that depends on it I'll resend it as part of that series.
> ---
>  include/hw/core/cpu.h              |  6 ----
>  target/alpha/cpu-qom.h             |  2 +-
>  target/arm/cpu-qom.h               |  2 +-
>  target/cris/cpu-qom.h              |  2 +-
>  target/hppa/cpu-qom.h              |  2 +-
>  target/i386/cpu-qom.h              |  2 +-
>  target/lm32/cpu-qom.h              |  2 +-
>  target/m68k/cpu-qom.h              |  2 +-
>  target/microblaze/cpu-qom.h        |  2 +-
>  target/mips/cpu-qom.h              |  2 +-
>  target/moxie/cpu.h                 |  2 +-
>  target/nios2/cpu.h                 |  2 +-
>  target/openrisc/cpu.h              |  2 +-
>  target/ppc/cpu-qom.h               |  2 +-
>  target/riscv/cpu.h                 |  2 +-
>  target/s390x/cpu-qom.h             |  2 +-
>  target/sh4/cpu-qom.h               |  2 +-
>  target/sparc/cpu-qom.h             |  2 +-
>  target/tilegx/cpu.h                |  2 +-
>  target/tricore/cpu-qom.h           |  2 +-
>  target/xtensa/cpu-qom.h            |  2 +-
>  hw/core/cpu.c                      | 19 +++---------
>  target/arm/cpu.c                   |  8 ++---
>  target/cris/cpu.c                  |  8 ++---
>  target/i386/cpu.c                  |  8 ++---
>  target/lm32/cpu.c                  |  8 ++---
>  target/m68k/cpu.c                  |  8 ++---
>  target/microblaze/cpu.c            |  8 ++---
>  target/mips/cpu.c                  |  8 ++---
>  target/moxie/cpu.c                 |  7 +++--
>  target/nios2/cpu.c                 |  8 ++---
>  target/openrisc/cpu.c              |  8 ++---
>  target/ppc/translate_init.inc.c    |  8 ++---
>  target/riscv/cpu.c                 |  7 +++--
>  target/s390x/cpu.c                 |  8 +++--
>  target/sh4/cpu.c                   |  8 ++---
>  target/sparc/cpu.c                 |  8 ++---
>  target/tilegx/cpu.c                |  7 +++--
>  target/tricore/cpu.c               |  7 +++--
>  target/xtensa/cpu.c                |  8 ++---
>  scripts/coccinelle/cpu-reset.cocci | 47 ++++++++++++++++++++++++++++++
>  41 files changed, 144 insertions(+), 108 deletions(-)
>  create mode 100644 scripts/coccinelle/cpu-reset.cocci
>=20
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 73e9a869a41..88ee543722d 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -79,7 +79,6 @@ struct TranslationBlock;
>   * @class_by_name: Callback to map -cpu command line model name to an
>   * instantiatable CPU type.
>   * @parse_features: Callback to parse command line arguments.
> - * @reset: Callback to reset the #CPUState to its initial state.
>   * @reset_dump_flags: #CPUDumpFlags to use for reset logging.
>   * @has_work: Callback for checking if there is work to do.
>   * @do_interrupt: Callback for interrupt handling.
> @@ -165,7 +164,6 @@ typedef struct CPUClass {
>      ObjectClass *(*class_by_name)(const char *cpu_model);
>      void (*parse_features)(const char *typename, char *str, Error **errp=
);
> =20
> -    void (*reset)(CPUState *cpu);
>      int reset_dump_flags;
>      bool (*has_work)(CPUState *cpu);
>      void (*do_interrupt)(CPUState *cpu);
> @@ -1135,10 +1133,6 @@ void cpu_exec_unrealizefn(CPUState *cpu);
>   */
>  bool target_words_bigendian(void);
> =20
> -void cpu_class_set_parent_reset(CPUClass *cc,
> -                                void (*child_reset)(CPUState *cpu),
> -                                void (**parent_reset)(CPUState *cpu));
> -
>  #ifdef NEED_CPU_H
> =20
>  #ifdef CONFIG_SOFTMMU
> diff --git a/target/alpha/cpu-qom.h b/target/alpha/cpu-qom.h
> index 6f0a0adb9ef..08832fa7672 100644
> --- a/target/alpha/cpu-qom.h
> +++ b/target/alpha/cpu-qom.h
> @@ -44,7 +44,7 @@ typedef struct AlphaCPUClass {
>      /*< public >*/
> =20
>      DeviceRealize parent_realize;
> -    void (*parent_reset)(CPUState *cpu);
> +    DeviceReset parent_reset;
>  } AlphaCPUClass;
> =20
>  typedef struct AlphaCPU AlphaCPU;
> diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
> index 3a9d31ea9df..d95568bf052 100644
> --- a/target/arm/cpu-qom.h
> +++ b/target/arm/cpu-qom.h
> @@ -51,7 +51,7 @@ typedef struct ARMCPUClass {
> =20
>      const ARMCPUInfo *info;
>      DeviceRealize parent_realize;
> -    void (*parent_reset)(CPUState *cpu);
> +    DeviceReset parent_reset;
>  } ARMCPUClass;
> =20
>  typedef struct ARMCPU ARMCPU;
> diff --git a/target/cris/cpu-qom.h b/target/cris/cpu-qom.h
> index 308c1f95bdf..f1de6041dcb 100644
> --- a/target/cris/cpu-qom.h
> +++ b/target/cris/cpu-qom.h
> @@ -45,7 +45,7 @@ typedef struct CRISCPUClass {
>      /*< public >*/
> =20
>      DeviceRealize parent_realize;
> -    void (*parent_reset)(CPUState *cpu);
> +    DeviceReset parent_reset;
> =20
>      uint32_t vr;
>  } CRISCPUClass;
> diff --git a/target/hppa/cpu-qom.h b/target/hppa/cpu-qom.h
> index 6367dc47939..b1f60454953 100644
> --- a/target/hppa/cpu-qom.h
> +++ b/target/hppa/cpu-qom.h
> @@ -44,7 +44,7 @@ typedef struct HPPACPUClass {
>      /*< public >*/
> =20
>      DeviceRealize parent_realize;
> -    void (*parent_reset)(CPUState *cpu);
> +    DeviceReset parent_reset;
>  } HPPACPUClass;
> =20
>  typedef struct HPPACPU HPPACPU;
> diff --git a/target/i386/cpu-qom.h b/target/i386/cpu-qom.h
> index 0efab2fc670..3e96f8d668e 100644
> --- a/target/i386/cpu-qom.h
> +++ b/target/i386/cpu-qom.h
> @@ -71,7 +71,7 @@ typedef struct X86CPUClass {
> =20
>      DeviceRealize parent_realize;
>      DeviceUnrealize parent_unrealize;
> -    void (*parent_reset)(CPUState *cpu);
> +    DeviceReset parent_reset;
>  } X86CPUClass;
> =20
>  typedef struct X86CPU X86CPU;
> diff --git a/target/lm32/cpu-qom.h b/target/lm32/cpu-qom.h
> index dc9ac9ac9f7..bdedb3759ac 100644
> --- a/target/lm32/cpu-qom.h
> +++ b/target/lm32/cpu-qom.h
> @@ -44,7 +44,7 @@ typedef struct LM32CPUClass {
>      /*< public >*/
> =20
>      DeviceRealize parent_realize;
> -    void (*parent_reset)(CPUState *cpu);
> +    DeviceReset parent_reset;
>  } LM32CPUClass;
> =20
>  typedef struct LM32CPU LM32CPU;
> diff --git a/target/m68k/cpu-qom.h b/target/m68k/cpu-qom.h
> index b56da8a2137..88b11b60f13 100644
> --- a/target/m68k/cpu-qom.h
> +++ b/target/m68k/cpu-qom.h
> @@ -44,7 +44,7 @@ typedef struct M68kCPUClass {
>      /*< public >*/
> =20
>      DeviceRealize parent_realize;
> -    void (*parent_reset)(CPUState *cpu);
> +    DeviceReset parent_reset;
>  } M68kCPUClass;
> =20
>  typedef struct M68kCPU M68kCPU;
> diff --git a/target/microblaze/cpu-qom.h b/target/microblaze/cpu-qom.h
> index 49b07cc697b..053ba44ee8c 100644
> --- a/target/microblaze/cpu-qom.h
> +++ b/target/microblaze/cpu-qom.h
> @@ -44,7 +44,7 @@ typedef struct MicroBlazeCPUClass {
>      /*< public >*/
> =20
>      DeviceRealize parent_realize;
> -    void (*parent_reset)(CPUState *cpu);
> +    DeviceReset parent_reset;
>  } MicroBlazeCPUClass;
> =20
>  typedef struct MicroBlazeCPU MicroBlazeCPU;
> diff --git a/target/mips/cpu-qom.h b/target/mips/cpu-qom.h
> index a430c0fe4bb..9d0df6c034b 100644
> --- a/target/mips/cpu-qom.h
> +++ b/target/mips/cpu-qom.h
> @@ -48,7 +48,7 @@ typedef struct MIPSCPUClass {
>      /*< public >*/
> =20
>      DeviceRealize parent_realize;
> -    void (*parent_reset)(CPUState *cpu);
> +    DeviceReset parent_reset;
>      const struct mips_def_t *cpu_def;
>  } MIPSCPUClass;
> =20
> diff --git a/target/moxie/cpu.h b/target/moxie/cpu.h
> index 01dca548e5d..455553b794a 100644
> --- a/target/moxie/cpu.h
> +++ b/target/moxie/cpu.h
> @@ -69,7 +69,7 @@ typedef struct MoxieCPUClass {
>      /*< public >*/
> =20
>      DeviceRealize parent_realize;
> -    void (*parent_reset)(CPUState *cpu);
> +    DeviceReset parent_reset;
>  } MoxieCPUClass;
> =20
>  /**
> diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
> index 78f633f9703..4dddf9c3a10 100644
> --- a/target/nios2/cpu.h
> +++ b/target/nios2/cpu.h
> @@ -50,7 +50,7 @@ typedef struct Nios2CPUClass {
>      /*< public >*/
> =20
>      DeviceRealize parent_realize;
> -    void (*parent_reset)(CPUState *cpu);
> +    DeviceReset parent_reset;
>  } Nios2CPUClass;
> =20
>  #define TARGET_HAS_ICE 1
> diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
> index 0ad02eab794..e7fb06445eb 100644
> --- a/target/openrisc/cpu.h
> +++ b/target/openrisc/cpu.h
> @@ -48,7 +48,7 @@ typedef struct OpenRISCCPUClass {
>      /*< public >*/
> =20
>      DeviceRealize parent_realize;
> -    void (*parent_reset)(CPUState *cpu);
> +    DeviceReset parent_reset;
>  } OpenRISCCPUClass;
> =20
>  #define TARGET_INSN_START_EXTRA_WORDS 1
> diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
> index e499575dc87..b5281317611 100644
> --- a/target/ppc/cpu-qom.h
> +++ b/target/ppc/cpu-qom.h
> @@ -166,7 +166,7 @@ typedef struct PowerPCCPUClass {
> =20
>      DeviceRealize parent_realize;
>      DeviceUnrealize parent_unrealize;
> -    void (*parent_reset)(CPUState *cpu);
> +    DeviceReset parent_reset;
>      void (*parent_parse_features)(const char *type, char *str, Error **e=
rrp);
> =20
>      uint32_t pvr;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index de0a8d893a3..10aabead499 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -185,7 +185,7 @@ typedef struct RISCVCPUClass {
>      CPUClass parent_class;
>      /*< public >*/
>      DeviceRealize parent_realize;
> -    void (*parent_reset)(CPUState *cpu);
> +    DeviceReset parent_reset;
>  } RISCVCPUClass;
> =20
>  /**
> diff --git a/target/s390x/cpu-qom.h b/target/s390x/cpu-qom.h
> index dbe5346ec90..1630818c280 100644
> --- a/target/s390x/cpu-qom.h
> +++ b/target/s390x/cpu-qom.h
> @@ -61,7 +61,7 @@ typedef struct S390CPUClass {
>      const char *desc;
> =20
>      DeviceRealize parent_realize;
> -    void (*parent_reset)(CPUState *cpu);
> +    DeviceReset parent_reset;
>      void (*load_normal)(CPUState *cpu);
>      void (*reset)(CPUState *cpu, cpu_reset_type type);
>  } S390CPUClass;
> diff --git a/target/sh4/cpu-qom.h b/target/sh4/cpu-qom.h
> index 0c56d055bad..72a63f3fd3f 100644
> --- a/target/sh4/cpu-qom.h
> +++ b/target/sh4/cpu-qom.h
> @@ -51,7 +51,7 @@ typedef struct SuperHCPUClass {
>      /*< public >*/
> =20
>      DeviceRealize parent_realize;
> -    void (*parent_reset)(CPUState *cpu);
> +    DeviceReset parent_reset;
> =20
>      uint32_t pvr;
>      uint32_t prr;
> diff --git a/target/sparc/cpu-qom.h b/target/sparc/cpu-qom.h
> index 7442e2768e8..8b4d33c21e5 100644
> --- a/target/sparc/cpu-qom.h
> +++ b/target/sparc/cpu-qom.h
> @@ -49,7 +49,7 @@ typedef struct SPARCCPUClass {
>      /*< public >*/
> =20
>      DeviceRealize parent_realize;
> -    void (*parent_reset)(CPUState *cpu);
> +    DeviceReset parent_reset;
>      sparc_def_t *cpu_def;
>  } SPARCCPUClass;
> =20
> diff --git a/target/tilegx/cpu.h b/target/tilegx/cpu.h
> index 9cbec247d23..193b6bbccba 100644
> --- a/target/tilegx/cpu.h
> +++ b/target/tilegx/cpu.h
> @@ -118,7 +118,7 @@ typedef struct TileGXCPUClass {
>      /*< public >*/
> =20
>      DeviceRealize parent_realize;
> -    void (*parent_reset)(CPUState *cpu);
> +    DeviceReset parent_reset;
>  } TileGXCPUClass;
> =20
>  /**
> diff --git a/target/tricore/cpu-qom.h b/target/tricore/cpu-qom.h
> index 7c1e130b4ed..cd819e6f240 100644
> --- a/target/tricore/cpu-qom.h
> +++ b/target/tricore/cpu-qom.h
> @@ -36,7 +36,7 @@ typedef struct TriCoreCPUClass {
>      /*< public >*/
> =20
>      DeviceRealize parent_realize;
> -    void (*parent_reset)(CPUState *cpu);
> +    DeviceReset parent_reset;
>  } TriCoreCPUClass;
> =20
>  typedef struct TriCoreCPU TriCoreCPU;
> diff --git a/target/xtensa/cpu-qom.h b/target/xtensa/cpu-qom.h
> index 9ac54241bd6..3ea93ce1f93 100644
> --- a/target/xtensa/cpu-qom.h
> +++ b/target/xtensa/cpu-qom.h
> @@ -56,7 +56,7 @@ typedef struct XtensaCPUClass {
>      /*< public >*/
> =20
>      DeviceRealize parent_realize;
> -    void (*parent_reset)(CPUState *cpu);
> +    DeviceReset parent_reset;
> =20
>      const XtensaConfig *config;
>  } XtensaCPUClass;
> diff --git a/hw/core/cpu.c b/hw/core/cpu.c
> index fe65ca62ace..b889878f3cc 100644
> --- a/hw/core/cpu.c
> +++ b/hw/core/cpu.c
> @@ -239,27 +239,16 @@ void cpu_dump_statistics(CPUState *cpu, int flags)
>      }
>  }
> =20
> -void cpu_class_set_parent_reset(CPUClass *cc,
> -                                void (*child_reset)(CPUState *cpu),
> -                                void (**parent_reset)(CPUState *cpu))
> -{
> -    *parent_reset =3D cc->reset;
> -    cc->reset =3D child_reset;
> -}
> -
>  void cpu_reset(CPUState *cpu)
>  {
> -    CPUClass *klass =3D CPU_GET_CLASS(cpu);
> -
> -    if (klass->reset !=3D NULL) {
> -        (*klass->reset)(cpu);
> -    }
> +    device_cold_reset(DEVICE(cpu));
> =20
>      trace_guest_cpu_reset(cpu);
>  }
> =20
> -static void cpu_common_reset(CPUState *cpu)
> +static void cpu_common_reset(DeviceState *dev)
>  {
> +    CPUState *cpu =3D CPU(dev);
>      CPUClass *cc =3D CPU_GET_CLASS(cpu);
> =20
>      if (qemu_loglevel_mask(CPU_LOG_RESET)) {
> @@ -419,7 +408,6 @@ static void cpu_class_init(ObjectClass *klass, void *=
data)
>      CPUClass *k =3D CPU_CLASS(klass);
> =20
>      k->parse_features =3D cpu_common_parse_features;
> -    k->reset =3D cpu_common_reset;
>      k->get_arch_id =3D cpu_common_get_arch_id;
>      k->has_work =3D cpu_common_has_work;
>      k->get_paging_enabled =3D cpu_common_get_paging_enabled;
> @@ -440,6 +428,7 @@ static void cpu_class_init(ObjectClass *klass, void *=
data)
>      set_bit(DEVICE_CATEGORY_CPU, dc->categories);
>      dc->realize =3D cpu_common_realizefn;
>      dc->unrealize =3D cpu_common_unrealizefn;
> +    dc->reset =3D cpu_common_reset;
>      device_class_set_props(dc, cpu_common_props);
>      /*
>       * Reason: CPUs still need special care by board code: wiring up
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index e6016e33cec..56cd3d725b1 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -155,14 +155,14 @@ static void cp_reg_check_reset(gpointer key, gpoint=
er value,  gpointer opaque)
>      assert(oldvalue =3D=3D newvalue);
>  }
> =20
> -/* CPUClass::reset() */
> -static void arm_cpu_reset(CPUState *s)
> +static void arm_cpu_reset(DeviceState *dev)
>  {
> +    CPUState *s =3D CPU(dev);
>      ARMCPU *cpu =3D ARM_CPU(s);
>      ARMCPUClass *acc =3D ARM_CPU_GET_CLASS(cpu);
>      CPUARMState *env =3D &cpu->env;
> =20
> -    acc->parent_reset(s);
> +    acc->parent_reset(dev);
> =20
>      memset(env, 0, offsetof(CPUARMState, end_reset_fields));
> =20
> @@ -2804,7 +2804,7 @@ static void arm_cpu_class_init(ObjectClass *oc, voi=
d *data)
>                                      &acc->parent_realize);
> =20
>      device_class_set_props(dc, arm_cpu_properties);
> -    cpu_class_set_parent_reset(cc, arm_cpu_reset, &acc->parent_reset);
> +    device_class_set_parent_reset(dc, arm_cpu_reset, &acc->parent_reset);
> =20
>      cc->class_by_name =3D arm_cpu_class_by_name;
>      cc->has_work =3D arm_cpu_has_work;
> diff --git a/target/cris/cpu.c b/target/cris/cpu.c
> index 17c6712e298..cff6b9eabf6 100644
> --- a/target/cris/cpu.c
> +++ b/target/cris/cpu.c
> @@ -40,15 +40,15 @@ static bool cris_cpu_has_work(CPUState *cs)
>      return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_N=
MI);
>  }
> =20
> -/* CPUClass::reset() */
> -static void cris_cpu_reset(CPUState *s)
> +static void cris_cpu_reset(DeviceState *dev)
>  {
> +    CPUState *s =3D CPU(dev);
>      CRISCPU *cpu =3D CRIS_CPU(s);
>      CRISCPUClass *ccc =3D CRIS_CPU_GET_CLASS(cpu);
>      CPUCRISState *env =3D &cpu->env;
>      uint32_t vr;
> =20
> -    ccc->parent_reset(s);
> +    ccc->parent_reset(dev);
> =20
>      vr =3D env->pregs[PR_VR];
>      memset(env, 0, offsetof(CPUCRISState, end_reset_fields));
> @@ -264,7 +264,7 @@ static void cris_cpu_class_init(ObjectClass *oc, void=
 *data)
>      device_class_set_parent_realize(dc, cris_cpu_realizefn,
>                                      &ccc->parent_realize);
> =20
> -    cpu_class_set_parent_reset(cc, cris_cpu_reset, &ccc->parent_reset);
> +    device_class_set_parent_reset(dc, cris_cpu_reset, &ccc->parent_reset=
);
> =20
>      cc->class_by_name =3D cris_cpu_class_by_name;
>      cc->has_work =3D cris_cpu_has_work;
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 92fafa26591..d18bf983237 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5855,9 +5855,9 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index=
, uint32_t count,
>      }
>  }
> =20
> -/* CPUClass::reset() */
> -static void x86_cpu_reset(CPUState *s)
> +static void x86_cpu_reset(DeviceState *dev)
>  {
> +    CPUState *s =3D CPU(dev);
>      X86CPU *cpu =3D X86_CPU(s);
>      X86CPUClass *xcc =3D X86_CPU_GET_CLASS(cpu);
>      CPUX86State *env =3D &cpu->env;
> @@ -5865,7 +5865,7 @@ static void x86_cpu_reset(CPUState *s)
>      uint64_t xcr0;
>      int i;
> =20
> -    xcc->parent_reset(s);
> +    xcc->parent_reset(dev);
> =20
>      memset(env, 0, offsetof(CPUX86State, end_reset_fields));
> =20
> @@ -7169,7 +7169,7 @@ static void x86_cpu_common_class_init(ObjectClass *=
oc, void *data)
>                                        &xcc->parent_unrealize);
>      device_class_set_props(dc, x86_cpu_properties);
> =20
> -    cpu_class_set_parent_reset(cc, x86_cpu_reset, &xcc->parent_reset);
> +    device_class_set_parent_reset(dc, x86_cpu_reset, &xcc->parent_reset);
>      cc->reset_dump_flags =3D CPU_DUMP_FPU | CPU_DUMP_CCOP;
> =20
>      cc->class_by_name =3D x86_cpu_class_by_name;
> diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
> index 687bf35e658..c50ad5fa15a 100644
> --- a/target/lm32/cpu.c
> +++ b/target/lm32/cpu.c
> @@ -99,14 +99,14 @@ static bool lm32_cpu_has_work(CPUState *cs)
>      return cs->interrupt_request & CPU_INTERRUPT_HARD;
>  }
> =20
> -/* CPUClass::reset() */
> -static void lm32_cpu_reset(CPUState *s)
> +static void lm32_cpu_reset(DeviceState *dev)
>  {
> +    CPUState *s =3D CPU(dev);
>      LM32CPU *cpu =3D LM32_CPU(s);
>      LM32CPUClass *lcc =3D LM32_CPU_GET_CLASS(cpu);
>      CPULM32State *env =3D &cpu->env;
> =20
> -    lcc->parent_reset(s);
> +    lcc->parent_reset(dev);
> =20
>      /* reset cpu state */
>      memset(env, 0, offsetof(CPULM32State, end_reset_fields));
> @@ -218,7 +218,7 @@ static void lm32_cpu_class_init(ObjectClass *oc, void=
 *data)
> =20
>      device_class_set_parent_realize(dc, lm32_cpu_realizefn,
>                                      &lcc->parent_realize);
> -    cpu_class_set_parent_reset(cc, lm32_cpu_reset, &lcc->parent_reset);
> +    device_class_set_parent_reset(dc, lm32_cpu_reset, &lcc->parent_reset=
);
> =20
>      cc->class_by_name =3D lm32_cpu_class_by_name;
>      cc->has_work =3D lm32_cpu_has_work;
> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
> index f0653cda2ff..9445fcd6df5 100644
> --- a/target/m68k/cpu.c
> +++ b/target/m68k/cpu.c
> @@ -41,16 +41,16 @@ static void m68k_set_feature(CPUM68KState *env, int f=
eature)
>      env->features |=3D (1u << feature);
>  }
> =20
> -/* CPUClass::reset() */
> -static void m68k_cpu_reset(CPUState *s)
> +static void m68k_cpu_reset(DeviceState *dev)
>  {
> +    CPUState *s =3D CPU(dev);
>      M68kCPU *cpu =3D M68K_CPU(s);
>      M68kCPUClass *mcc =3D M68K_CPU_GET_CLASS(cpu);
>      CPUM68KState *env =3D &cpu->env;
>      floatx80 nan =3D floatx80_default_nan(NULL);
>      int i;
> =20
> -    mcc->parent_reset(s);
> +    mcc->parent_reset(dev);
> =20
>      memset(env, 0, offsetof(CPUM68KState, end_reset_fields));
>  #ifdef CONFIG_SOFTMMU
> @@ -273,7 +273,7 @@ static void m68k_cpu_class_init(ObjectClass *c, void =
*data)
> =20
>      device_class_set_parent_realize(dc, m68k_cpu_realizefn,
>                                      &mcc->parent_realize);
> -    cpu_class_set_parent_reset(cc, m68k_cpu_reset, &mcc->parent_reset);
> +    device_class_set_parent_reset(dc, m68k_cpu_reset, &mcc->parent_reset=
);
> =20
>      cc->class_by_name =3D m68k_cpu_class_by_name;
>      cc->has_work =3D m68k_cpu_has_work;
> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> index 8c90110e525..a2c2f271dfa 100644
> --- a/target/microblaze/cpu.c
> +++ b/target/microblaze/cpu.c
> @@ -102,14 +102,14 @@ static void microblaze_cpu_set_irq(void *opaque, in=
t irq, int level)
>  }
>  #endif
> =20
> -/* CPUClass::reset() */
> -static void mb_cpu_reset(CPUState *s)
> +static void mb_cpu_reset(DeviceState *dev)
>  {
> +    CPUState *s =3D CPU(dev);
>      MicroBlazeCPU *cpu =3D MICROBLAZE_CPU(s);
>      MicroBlazeCPUClass *mcc =3D MICROBLAZE_CPU_GET_CLASS(cpu);
>      CPUMBState *env =3D &cpu->env;
> =20
> -    mcc->parent_reset(s);
> +    mcc->parent_reset(dev);
> =20
>      memset(env, 0, offsetof(CPUMBState, end_reset_fields));
>      env->res_addr =3D RES_ADDR_NONE;
> @@ -292,7 +292,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *=
data)
> =20
>      device_class_set_parent_realize(dc, mb_cpu_realizefn,
>                                      &mcc->parent_realize);
> -    cpu_class_set_parent_reset(cc, mb_cpu_reset, &mcc->parent_reset);
> +    device_class_set_parent_reset(dc, mb_cpu_reset, &mcc->parent_reset);
> =20
>      cc->class_by_name =3D mb_cpu_class_by_name;
>      cc->has_work =3D mb_cpu_has_work;
> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
> index 6cd6b9650ba..e86cd065483 100644
> --- a/target/mips/cpu.c
> +++ b/target/mips/cpu.c
> @@ -96,14 +96,14 @@ static bool mips_cpu_has_work(CPUState *cs)
>      return has_work;
>  }
> =20
> -/* CPUClass::reset() */
> -static void mips_cpu_reset(CPUState *s)
> +static void mips_cpu_reset(DeviceState *dev)
>  {
> +    CPUState *s =3D CPU(dev);
>      MIPSCPU *cpu =3D MIPS_CPU(s);
>      MIPSCPUClass *mcc =3D MIPS_CPU_GET_CLASS(cpu);
>      CPUMIPSState *env =3D &cpu->env;
> =20
> -    mcc->parent_reset(s);
> +    mcc->parent_reset(dev);
> =20
>      memset(env, 0, offsetof(CPUMIPSState, end_reset_fields));
> =20
> @@ -189,7 +189,7 @@ static void mips_cpu_class_init(ObjectClass *c, void =
*data)
> =20
>      device_class_set_parent_realize(dc, mips_cpu_realizefn,
>                                      &mcc->parent_realize);
> -    cpu_class_set_parent_reset(cc, mips_cpu_reset, &mcc->parent_reset);
> +    device_class_set_parent_reset(dc, mips_cpu_reset, &mcc->parent_reset=
);
> =20
>      cc->class_by_name =3D mips_cpu_class_by_name;
>      cc->has_work =3D mips_cpu_has_work;
> diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
> index cf47bc709b5..6e0443ccb73 100644
> --- a/target/moxie/cpu.c
> +++ b/target/moxie/cpu.c
> @@ -35,13 +35,14 @@ static bool moxie_cpu_has_work(CPUState *cs)
>      return cs->interrupt_request & CPU_INTERRUPT_HARD;
>  }
> =20
> -static void moxie_cpu_reset(CPUState *s)
> +static void moxie_cpu_reset(DeviceState *dev)
>  {
> +    CPUState *s =3D CPU(dev);
>      MoxieCPU *cpu =3D MOXIE_CPU(s);
>      MoxieCPUClass *mcc =3D MOXIE_CPU_GET_CLASS(cpu);
>      CPUMoxieState *env =3D &cpu->env;
> =20
> -    mcc->parent_reset(s);
> +    mcc->parent_reset(dev);
> =20
>      memset(env, 0, offsetof(CPUMoxieState, end_reset_fields));
>      env->pc =3D 0x1000;
> @@ -101,7 +102,7 @@ static void moxie_cpu_class_init(ObjectClass *oc, voi=
d *data)
> =20
>      device_class_set_parent_realize(dc, moxie_cpu_realizefn,
>                                      &mcc->parent_realize);
> -    cpu_class_set_parent_reset(cc, moxie_cpu_reset, &mcc->parent_reset);
> +    device_class_set_parent_reset(dc, moxie_cpu_reset, &mcc->parent_rese=
t);
> =20
>      cc->class_by_name =3D moxie_cpu_class_by_name;
> =20
> diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
> index 1c0c855a6f0..0a4075949e5 100644
> --- a/target/nios2/cpu.c
> +++ b/target/nios2/cpu.c
> @@ -39,9 +39,9 @@ static bool nios2_cpu_has_work(CPUState *cs)
>      return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_N=
MI);
>  }
> =20
> -/* CPUClass::reset() */
> -static void nios2_cpu_reset(CPUState *cs)
> +static void nios2_cpu_reset(DeviceState *dev)
>  {
> +    CPUState *cs =3D CPU(dev);
>      Nios2CPU *cpu =3D NIOS2_CPU(cs);
>      Nios2CPUClass *ncc =3D NIOS2_CPU_GET_CLASS(cpu);
>      CPUNios2State *env =3D &cpu->env;
> @@ -51,7 +51,7 @@ static void nios2_cpu_reset(CPUState *cs)
>          log_cpu_state(cs, 0);
>      }
> =20
> -    ncc->parent_reset(cs);
> +    ncc->parent_reset(dev);
> =20
>      memset(env->regs, 0, sizeof(uint32_t) * NUM_CORE_REGS);
>      env->regs[R_PC] =3D cpu->reset_addr;
> @@ -188,7 +188,7 @@ static void nios2_cpu_class_init(ObjectClass *oc, voi=
d *data)
>      device_class_set_parent_realize(dc, nios2_cpu_realizefn,
>                                      &ncc->parent_realize);
>      device_class_set_props(dc, nios2_properties);
> -    cpu_class_set_parent_reset(cc, nios2_cpu_reset, &ncc->parent_reset);
> +    device_class_set_parent_reset(dc, nios2_cpu_reset, &ncc->parent_rese=
t);
> =20
>      cc->class_by_name =3D nios2_cpu_class_by_name;
>      cc->has_work =3D nios2_cpu_has_work;
> diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
> index 5cd04dafab6..5528c0918f4 100644
> --- a/target/openrisc/cpu.c
> +++ b/target/openrisc/cpu.c
> @@ -41,13 +41,13 @@ static void openrisc_disas_set_info(CPUState *cpu, di=
sassemble_info *info)
>      info->print_insn =3D print_insn_or1k;
>  }
> =20
> -/* CPUClass::reset() */
> -static void openrisc_cpu_reset(CPUState *s)
> +static void openrisc_cpu_reset(DeviceState *dev)
>  {
> +    CPUState *s =3D CPU(dev);
>      OpenRISCCPU *cpu =3D OPENRISC_CPU(s);
>      OpenRISCCPUClass *occ =3D OPENRISC_CPU_GET_CLASS(cpu);
> =20
> -    occ->parent_reset(s);
> +    occ->parent_reset(dev);
> =20
>      memset(&cpu->env, 0, offsetof(CPUOpenRISCState, end_reset_fields));
> =20
> @@ -150,7 +150,7 @@ static void openrisc_cpu_class_init(ObjectClass *oc, =
void *data)
> =20
>      device_class_set_parent_realize(dc, openrisc_cpu_realizefn,
>                                      &occ->parent_realize);
> -    cpu_class_set_parent_reset(cc, openrisc_cpu_reset, &occ->parent_rese=
t);
> +    device_class_set_parent_reset(dc, openrisc_cpu_reset, &occ->parent_r=
eset);
> =20
>      cc->class_by_name =3D openrisc_cpu_class_by_name;
>      cc->has_work =3D openrisc_cpu_has_work;
> diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate_init.=
inc.c
> index 53995f62eab..7e9780e875c 100644
> --- a/target/ppc/translate_init.inc.c
> +++ b/target/ppc/translate_init.inc.c
> @@ -10669,16 +10669,16 @@ static bool ppc_cpu_has_work(CPUState *cs)
>      return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
>  }
> =20
> -/* CPUClass::reset() */
> -static void ppc_cpu_reset(CPUState *s)
> +static void ppc_cpu_reset(DeviceState *dev)
>  {
> +    CPUState *s =3D CPU(dev);
>      PowerPCCPU *cpu =3D POWERPC_CPU(s);
>      PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
>      CPUPPCState *env =3D &cpu->env;
>      target_ulong msr;
>      int i;
> =20
> -    pcc->parent_reset(s);
> +    pcc->parent_reset(dev);
> =20
>      msr =3D (target_ulong)0;
>      msr |=3D (target_ulong)MSR_HVB;
> @@ -10885,7 +10885,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, v=
oid *data)
>      pcc->interrupts_big_endian =3D ppc_cpu_interrupts_big_endian_always;
>      device_class_set_props(dc, ppc_cpu_properties);
> =20
> -    cpu_class_set_parent_reset(cc, ppc_cpu_reset, &pcc->parent_reset);
> +    device_class_set_parent_reset(dc, ppc_cpu_reset, &pcc->parent_reset);
> =20
>      cc->class_by_name =3D ppc_cpu_class_by_name;
>      pcc->parent_parse_features =3D cc->parse_features;
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 8c86ebc1093..e2ccd820736 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -286,13 +286,14 @@ void restore_state_to_opc(CPURISCVState *env, Trans=
lationBlock *tb,
>      env->pc =3D data[0];
>  }
> =20
> -static void riscv_cpu_reset(CPUState *cs)
> +static void riscv_cpu_reset(DeviceState *dev)
>  {
> +    CPUState *cs =3D CPU(dev);
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>      RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(cpu);
>      CPURISCVState *env =3D &cpu->env;
> =20
> -    mcc->parent_reset(cs);
> +    mcc->parent_reset(dev);
>  #ifndef CONFIG_USER_ONLY
>      env->priv =3D PRV_M;
>      env->mstatus &=3D ~(MSTATUS_MIE | MSTATUS_MPRV);
> @@ -462,7 +463,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void=
 *data)
>      device_class_set_parent_realize(dc, riscv_cpu_realize,
>                                      &mcc->parent_realize);
> =20
> -    cpu_class_set_parent_reset(cc, riscv_cpu_reset, &mcc->parent_reset);
> +    device_class_set_parent_reset(dc, riscv_cpu_reset, &mcc->parent_rese=
t);
> =20
>      cc->class_by_name =3D riscv_cpu_class_by_name;
>      cc->has_work =3D riscv_cpu_has_work;
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index 3dd396e8703..427a46e3e1b 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -96,8 +96,9 @@ static void s390_cpu_reset(CPUState *s, cpu_reset_type =
type)
>      S390CPU *cpu =3D S390_CPU(s);
>      S390CPUClass *scc =3D S390_CPU_GET_CLASS(cpu);
>      CPUS390XState *env =3D &cpu->env;
> +    DeviceState *dev =3D DEVICE(s);
> =20
> -    scc->parent_reset(s);
> +    scc->parent_reset(dev);
>      cpu->env.sigp_order =3D 0;
>      s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
> =20
> @@ -450,8 +451,9 @@ static Property s390x_cpu_properties[] =3D {
>      DEFINE_PROP_END_OF_LIST()
>  };
> =20
> -static void s390_cpu_reset_full(CPUState *s)
> +static void s390_cpu_reset_full(DeviceState *dev)
>  {
> +    CPUState *s =3D CPU(dev);
>      return s390_cpu_reset(s, S390_CPU_RESET_CLEAR);
>  }
> =20
> @@ -466,7 +468,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void=
 *data)
>      device_class_set_props(dc, s390x_cpu_properties);
>      dc->user_creatable =3D true;
> =20
> -    cpu_class_set_parent_reset(cc, s390_cpu_reset_full, &scc->parent_res=
et);
> +    device_class_set_parent_reset(dc, s390_cpu_reset_full, &scc->parent_=
reset);
>  #if !defined(CONFIG_USER_ONLY)
>      scc->load_normal =3D s390_cpu_load_normal;
>  #endif
> diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
> index 70c8d8170ff..3c68021c565 100644
> --- a/target/sh4/cpu.c
> +++ b/target/sh4/cpu.c
> @@ -47,14 +47,14 @@ static bool superh_cpu_has_work(CPUState *cs)
>      return cs->interrupt_request & CPU_INTERRUPT_HARD;
>  }
> =20
> -/* CPUClass::reset() */
> -static void superh_cpu_reset(CPUState *s)
> +static void superh_cpu_reset(DeviceState *dev)
>  {
> +    CPUState *s =3D CPU(dev);
>      SuperHCPU *cpu =3D SUPERH_CPU(s);
>      SuperHCPUClass *scc =3D SUPERH_CPU_GET_CLASS(cpu);
>      CPUSH4State *env =3D &cpu->env;
> =20
> -    scc->parent_reset(s);
> +    scc->parent_reset(dev);
> =20
>      memset(env, 0, offsetof(CPUSH4State, end_reset_fields));
> =20
> @@ -214,7 +214,7 @@ static void superh_cpu_class_init(ObjectClass *oc, vo=
id *data)
>      device_class_set_parent_realize(dc, superh_cpu_realizefn,
>                                      &scc->parent_realize);
> =20
> -    cpu_class_set_parent_reset(cc, superh_cpu_reset, &scc->parent_reset);
> +    device_class_set_parent_reset(dc, superh_cpu_reset, &scc->parent_res=
et);
> =20
>      cc->class_by_name =3D superh_cpu_class_by_name;
>      cc->has_work =3D superh_cpu_has_work;
> diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
> index eeaecbd8d69..3f05aba9d66 100644
> --- a/target/sparc/cpu.c
> +++ b/target/sparc/cpu.c
> @@ -28,14 +28,14 @@
> =20
>  //#define DEBUG_FEATURES
> =20
> -/* CPUClass::reset() */
> -static void sparc_cpu_reset(CPUState *s)
> +static void sparc_cpu_reset(DeviceState *dev)
>  {
> +    CPUState *s =3D CPU(dev);
>      SPARCCPU *cpu =3D SPARC_CPU(s);
>      SPARCCPUClass *scc =3D SPARC_CPU_GET_CLASS(cpu);
>      CPUSPARCState *env =3D &cpu->env;
> =20
> -    scc->parent_reset(s);
> +    scc->parent_reset(dev);
> =20
>      memset(env, 0, offsetof(CPUSPARCState, end_reset_fields));
>      env->cwp =3D 0;
> @@ -859,7 +859,7 @@ static void sparc_cpu_class_init(ObjectClass *oc, voi=
d *data)
>                                      &scc->parent_realize);
>      device_class_set_props(dc, sparc_cpu_properties);
> =20
> -    cpu_class_set_parent_reset(cc, sparc_cpu_reset, &scc->parent_reset);
> +    device_class_set_parent_reset(dc, sparc_cpu_reset, &scc->parent_rese=
t);
> =20
>      cc->class_by_name =3D sparc_cpu_class_by_name;
>      cc->parse_features =3D sparc_cpu_parse_features;
> diff --git a/target/tilegx/cpu.c b/target/tilegx/cpu.c
> index cd422a0467a..1fee87c094b 100644
> --- a/target/tilegx/cpu.c
> +++ b/target/tilegx/cpu.c
> @@ -68,13 +68,14 @@ static bool tilegx_cpu_has_work(CPUState *cs)
>      return true;
>  }
> =20
> -static void tilegx_cpu_reset(CPUState *s)
> +static void tilegx_cpu_reset(DeviceState *dev)
>  {
> +    CPUState *s =3D CPU(dev);
>      TileGXCPU *cpu =3D TILEGX_CPU(s);
>      TileGXCPUClass *tcc =3D TILEGX_CPU_GET_CLASS(cpu);
>      CPUTLGState *env =3D &cpu->env;
> =20
> -    tcc->parent_reset(s);
> +    tcc->parent_reset(dev);
> =20
>      memset(env, 0, offsetof(CPUTLGState, end_reset_fields));
>  }
> @@ -142,7 +143,7 @@ static void tilegx_cpu_class_init(ObjectClass *oc, vo=
id *data)
>      device_class_set_parent_realize(dc, tilegx_cpu_realizefn,
>                                      &tcc->parent_realize);
> =20
> -    cpu_class_set_parent_reset(cc, tilegx_cpu_reset, &tcc->parent_reset);
> +    device_class_set_parent_reset(dc, tilegx_cpu_reset, &tcc->parent_res=
et);
> =20
>      cc->class_by_name =3D tilegx_cpu_class_by_name;
>      cc->has_work =3D tilegx_cpu_has_work;
> diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
> index 85bc9f03a1e..743b404a95a 100644
> --- a/target/tricore/cpu.c
> +++ b/target/tricore/cpu.c
> @@ -53,13 +53,14 @@ static void tricore_cpu_synchronize_from_tb(CPUState =
*cs,
>      env->PC =3D tb->pc;
>  }
> =20
> -static void tricore_cpu_reset(CPUState *s)
> +static void tricore_cpu_reset(DeviceState *dev)
>  {
> +    CPUState *s =3D CPU(dev);
>      TriCoreCPU *cpu =3D TRICORE_CPU(s);
>      TriCoreCPUClass *tcc =3D TRICORE_CPU_GET_CLASS(cpu);
>      CPUTriCoreState *env =3D &cpu->env;
> =20
> -    tcc->parent_reset(s);
> +    tcc->parent_reset(dev);
> =20
>      cpu_state_reset(env);
>  }
> @@ -153,7 +154,7 @@ static void tricore_cpu_class_init(ObjectClass *c, vo=
id *data)
>      device_class_set_parent_realize(dc, tricore_cpu_realizefn,
>                                      &mcc->parent_realize);
> =20
> -    cpu_class_set_parent_reset(cc, tricore_cpu_reset, &mcc->parent_reset=
);
> +    device_class_set_parent_reset(dc, tricore_cpu_reset, &mcc->parent_re=
set);
>      cc->class_by_name =3D tricore_cpu_class_by_name;
>      cc->has_work =3D tricore_cpu_has_work;
> =20
> diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
> index 4856aee8eca..82c2ee0679f 100644
> --- a/target/xtensa/cpu.c
> +++ b/target/xtensa/cpu.c
> @@ -67,14 +67,14 @@ bool xtensa_abi_call0(void)
>  }
>  #endif
> =20
> -/* CPUClass::reset() */
> -static void xtensa_cpu_reset(CPUState *s)
> +static void xtensa_cpu_reset(DeviceState *dev)
>  {
> +    CPUState *s =3D CPU(dev);
>      XtensaCPU *cpu =3D XTENSA_CPU(s);
>      XtensaCPUClass *xcc =3D XTENSA_CPU_GET_CLASS(cpu);
>      CPUXtensaState *env =3D &cpu->env;
> =20
> -    xcc->parent_reset(s);
> +    xcc->parent_reset(dev);
> =20
>      env->exception_taken =3D 0;
>      env->pc =3D env->config->exception_vector[EXC_RESET0 + env->static_v=
ectors];
> @@ -184,7 +184,7 @@ static void xtensa_cpu_class_init(ObjectClass *oc, vo=
id *data)
>      device_class_set_parent_realize(dc, xtensa_cpu_realizefn,
>                                      &xcc->parent_realize);
> =20
> -    cpu_class_set_parent_reset(cc, xtensa_cpu_reset, &xcc->parent_reset);
> +    device_class_set_parent_reset(dc, xtensa_cpu_reset, &xcc->parent_res=
et);
> =20
>      cc->class_by_name =3D xtensa_cpu_class_by_name;
>      cc->has_work =3D xtensa_cpu_has_work;
> diff --git a/scripts/coccinelle/cpu-reset.cocci b/scripts/coccinelle/cpu-=
reset.cocci
> new file mode 100644
> index 00000000000..396a724e514
> --- /dev/null
> +++ b/scripts/coccinelle/cpu-reset.cocci
> @@ -0,0 +1,47 @@
> +// Convert targets using the old CPUState reset to DeviceState reset
> +//
> +// Copyright Linaro Ltd 2020
> +// This work is licensed under the terms of the GNU GPLv2 or later.
> +//
> +// spatch --macro-file scripts/cocci-macro-file.h \
> +//        --sp-file scripts/coccinelle/cpu-reset.cocci \
> +//        --keep-comments --smpl-spacing --in-place --include-headers --=
dir target
> +//
> +// For simplicity we assume some things about the code we're modifying
> +// that happen to be true for all our targets:
> +//  * all cpu_class_set_parent_reset() callsites have a 'DeviceClass *dc=
' local
> +//  * the parent reset field in the target CPU class is 'parent_reset'
> +//  * no reset function already has a 'dev' local
> +
> +@@
> +identifier cpu, x;
> +typedef CPUState;
> +@@
> +struct x {
> +...
> +- void (*parent_reset)(CPUState *cpu);
> ++ DeviceReset parent_reset;
> +...
> +};
> +@ rule1 @
> +identifier resetfn;
> +expression resetfield;
> +identifier cc;
> +@@
> +- cpu_class_set_parent_reset(cc, resetfn, resetfield)
> ++ device_class_set_parent_reset(dc, resetfn, resetfield)
> +@@
> +identifier rule1.resetfn;
> +identifier cpu, cc;
> +typedef CPUState, DeviceState;
> +@@
> +-resetfn(CPUState *cpu)
> +-{
> ++resetfn(DeviceState *dev)
> ++{
> ++    CPUState *cpu =3D CPU(dev);
> +<...
> +-    cc->parent_reset(cpu);
> ++    cc->parent_reset(dev);
> +...>
> +}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DqhR8hV3EnoxUkKN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5e2AQACgkQbDjKyiDZ
s5IJHxAA1KKupRXoWuYbK7YmuJAfDuhNiwnbMoXbD1PRDztyXbHcsWsRf7NGugk+
XP5HUIXnnXhXX13ImqbUYrvZYB0kuseEp/2reJM/uto/+EUmHvcg9rDIZDCsWiIS
TeXrOKMfybI1d++jGJm91T4fjOKmos5myK+K/B6QHmGsJdREwqHqFFUOg8RNj8fv
WLMOOfkLSCfbm08A8vbHfnraqHWQ2sDHvoCzOz687kPWlUTDaVHLrtuS6vCRG3uO
4owxxnfNDw0t5SgC1eOISF8QdKDAeSZLouJ4k6woKp514S/QepZR+6NJZsysl17b
r3+dkvxoUkHArNAvHQ6JtBZahihqbpIFnh1KI3v8IUObaTaFjO8/ZehTAAa42VZn
Gw0WlcdKIRlYZK2s9LC5BgPDsAKVLkoXLG/qqqcDUE13oJ/+E6TA5pJL9XTIwoMx
r3tEXV6CIa5xjfHI9rDhDvdOhoutDg19sMdABAi7Q//I2u/zKQ1N/CAEM8vHhbK5
vYBbKCX4rzYbur5xdJe9/DiuMNqgBHOUheXkKzDfkj9IUMsLHB019xjBRfUKIdJ+
q+ZLnGcDUUDvSXPk3yOQ0NN8nGWlnEDLYI60GodNNlQgBEVP6462qsAMAzArcdsj
u+HASq2NofpKLL8Clt3GHACAG4nTtvAGmnrkxNW8h/ImjaWAMIw=
=D24O
-----END PGP SIGNATURE-----

--DqhR8hV3EnoxUkKN--

