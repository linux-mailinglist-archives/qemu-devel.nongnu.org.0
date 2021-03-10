Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D614E334B67
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 23:20:22 +0100 (CET)
Received: from localhost ([::1]:53304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK7Bl-0001jX-Cq
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 17:20:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6lN-0005k3-UQ; Wed, 10 Mar 2021 16:53:06 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:48075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6lL-0007gz-6s; Wed, 10 Mar 2021 16:53:05 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MKuGD-1l1Bna3TWn-00LIkp; Wed, 10 Mar 2021 22:53:00 +0100
Subject: Re: [PULL 00/22] Trivial branch for 6.0 patches
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210310214504.1183162-1-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <0a9adc53-f0ec-f3fe-ad1f-197ec89fd491@vivier.eu>
Date: Wed, 10 Mar 2021 22:52:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210310214504.1183162-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9to1miQTg2dtmvPAszWWXQP+ZYZ/L0ZOUp6Of6YmldmjOAhTcvh
 5yt2M9V7fCdrEWL/8ibTWmo+MutjBStc15BDK5jVKlN5GPNxbQUaeXWcY3HlRcHJI/xDjMo
 8+MX6c1LLxHKoGQg3Fazh4YzzvTAHvCwVG1XqMXJecxhuVVI1Q/MdIyfUoN5c0S7BrZmOtV
 hjx2jFPDZvyRHlj2juweQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:V3zwHgB2XtA=:2vwk0G7YKimeAd+LOp0rJ3
 TVrrwdzUVJxSYXQAoD7zOdBS29sgdP/Ylgytj2A78DUTgdTPPAlGBiyMiVW5Z3Nok2uvY38V0
 HleCD4IIhkk9VupdPvFbEfEB5vQCE2fwwdLMz+aO9qzLpqe1DVbpjivMkqGfxmLVwSU/q3N8a
 87iyxrrK+UjTSDXdEZ+uoUv2TR3lSagFxwmS7ZTMuu7o6anWdK+8pFwyHC4YVSkxfu7GunFe3
 mFSod3NrqpllSMMEBqhZ0tFTl2Iq6PxF84tPI+VoI5mlP78T1Mz/AUKABzz5aGpFIXUbMCzeF
 mZXmMOpyISPIwIM8bJBkiGgD9ZiRnkdGczLItbaD00/oGLu2czKKv2Ce+tdMgVwZma5RkcnW8
 XqwIh2bok5NlHkJ1UHkrhmcexS9jBIJZ46kXHPvDmDB/D9jVP/fa1NnAReutl+K7+O/Ki0iL2
 1cV1QgVv2A==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter,

my "git publish" has failed at patch 20 with:

Requested action aborted
Mails per session limit exceeded.

I think my email provider has added new limits :(

can you merge this PR without I have to resend it?

Thanks,
Laurent

Le 10/03/2021 à 22:44, Laurent Vivier a écrit :
> The following changes since commit b2ae1009d7cca2701e17eae55ae2d44fd22c942a:
> 
>   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-sparc-20210307' in=
> to staging (2021-03-09 13:50:35 +0000)
> 
> are available in the Git repository at:
> 
>   git://github.com/vivier/qemu.git tags/trivial-branch-for-6.0-pull-request
> 
> for you to fetch changes up to 538f049704e9b7a07eeaf326af772fdd30d89576:
> 
>   sysemu: Let VMChangeStateHandler take boolean 'running' argument (2021-03-0=
> 9 23:13:57 +0100)
> 
> ----------------------------------------------------------------
> Pull request trivial patches 20210310
> 
> ----------------------------------------------------------------
> 
> Alexander Bulekov (1):
>   fuzz-test: remove unneccessary debugging flags
> 
> Eric Blake (1):
>   scsi: Silence gcc warning
> 
> Markus Armbruster (2):
>   backends/dbus-vmstate: Fix short read error handling
>   vhost_user_gpu: Drop dead check for g_malloc() failure
> 
> Michael Tokarev (1):
>   Various spelling fixes
> 
> Peter Maydell (1):
>   qemu-common.h: Update copyright string to 2021
> 
> Philippe Mathieu-Daud=C3=A9 (13):
>   hw/elf_ops: Fix a typo
>   target/hexagon/gen_tcg_funcs: Fix a typo
>   exec/memory: Use struct Object typedef
>   ui: Replace the word 'whitelist'
>   scripts/tracetool: Replace the word 'whitelist'
>   seccomp: Replace the word 'blacklist'
>   qemu-options: Replace the word 'blacklist'
>   tests/fp/fp-test: Replace the word 'blacklist'
>   hw/lm32/Kconfig: Introduce CONFIG_LM32_EVR for lm32-evr/uclinux boards
>   hw/lm32/Kconfig: Rename CONFIG_LM32 -> CONFIG_LM32_DEVICES
>   hw/lm32/Kconfig: Have MILKYMIST select LM32_DEVICES
>   sysemu/runstate: Let runstate_is_running() return bool
>   sysemu: Let VMChangeStateHandler take boolean 'running' argument
> 
> Thomas Huth (1):
>   net: Use id_generate() in the network subsystem, too
> 
> Wainer dos Santos Moschetta (1):
>   MAINTAINERS: Fix the location of tools manuals
> 
> lijiejun (1):
>   virtio-gpu: Adjust code space style
> 
>  MAINTAINERS                              | 10 ++++----
>  accel/xen/xen-all.c                      |  2 +-
>  audio/audio.c                            |  2 +-
>  backends/dbus-vmstate.c                  |  5 +++-
>  block/block-backend.c                    |  2 +-
>  default-configs/devices/lm32-softmmu.mak |  2 +-
>  disas/nanomips.cpp                       |  2 +-
>  gdbstub.c                                |  2 +-
>  hw/block/pflash_cfi01.c                  |  2 +-
>  hw/block/virtio-blk.c                    |  2 +-
>  hw/char/meson.build                      |  4 +--
>  hw/display/qxl.c                         |  2 +-
>  hw/display/vhost-user-gpu.c              |  1 -
>  hw/display/virtio-gpu-3d.c               |  3 +--
>  hw/i386/kvm/clock.c                      |  2 +-
>  hw/i386/kvm/i8254.c                      |  2 +-
>  hw/i386/kvmvapic.c                       |  2 +-
>  hw/i386/xen/xen-hvm.c                    |  2 +-
>  hw/ide/core.c                            |  2 +-
>  hw/intc/arm_gicv3_its_kvm.c              |  2 +-
>  hw/intc/arm_gicv3_kvm.c                  |  2 +-
>  hw/intc/meson.build                      |  2 +-
>  hw/intc/spapr_xive_kvm.c                 |  2 +-
>  hw/lm32/Kconfig                          | 10 +++++---
>  hw/lm32/meson.build                      |  2 +-
>  hw/misc/mac_via.c                        |  2 +-
>  hw/misc/trace-events                     |  2 +-
>  hw/net/allwinner-sun8i-emac.c            |  2 +-
>  hw/net/e1000e_core.c                     |  2 +-
>  hw/nvram/spapr_nvram.c                   |  2 +-
>  hw/ppc/pnv_bmc.c                         |  2 +-
>  hw/ppc/pnv_xscom.c                       |  2 +-
>  hw/ppc/ppc.c                             |  2 +-
>  hw/ppc/ppc_booke.c                       |  2 +-
>  hw/s390x/tod-kvm.c                       |  2 +-
>  hw/scsi/scsi-bus.c                       |  2 +-
>  hw/scsi/scsi-disk.c                      |  1 +
>  hw/timer/meson.build                     |  2 +-
>  hw/usb/ccid-card-emulated.c              |  2 +-
>  hw/usb/hcd-ehci.c                        |  2 +-
>  hw/usb/hcd-ohci.c                        |  2 +-
>  hw/usb/host-libusb.c                     |  2 +-
>  hw/usb/redirect.c                        |  2 +-
>  hw/vfio/migration.c                      |  2 +-
>  hw/virtio/vhost.c                        |  2 +-
>  hw/virtio/virtio-rng.c                   |  2 +-
>  hw/virtio/virtio.c                       |  2 +-
>  include/exec/memory.h                    | 32 ++++++++++++------------
>  include/hw/elf_ops.h                     |  2 +-
>  include/hw/ppc/pnv_xscom.h               |  2 +-
>  include/hw/s390x/css.h                   |  2 +-
>  include/qemu-common.h                    |  2 +-
>  include/qemu/id.h                        |  1 +
>  include/sysemu/runstate.h                | 12 ++++++---
>  net/net.c                                |  8 +++---
>  qemu-options.hx                          | 10 ++++----
>  scripts/tracetool/__init__.py            |  2 +-
>  softmmu/memory.c                         | 14 +++++------
>  softmmu/qemu-seccomp.c                   | 16 ++++++------
>  softmmu/runstate.c                       |  4 +--
>  target/arm/kvm.c                         |  2 +-
>  target/arm/kvm_arm.h                     |  2 +-
>  target/hexagon/gen_tcg_funcs.py          | 14 +++++------
>  target/i386/cpu.c                        |  2 +-
>  target/i386/kvm/kvm.c                    |  2 +-
>  target/i386/machine.c                    |  2 +-
>  target/i386/sev.c                        |  2 +-
>  target/i386/whpx/whpx-all.c              |  2 +-
>  target/m68k/op_helper.c                  |  2 +-
>  target/mips/kvm.c                        |  4 +--
>  target/ppc/cpu-qom.h                     |  2 +-
>  target/riscv/cpu.c                       |  2 +-
>  tests/fp/fp-test.c                       |  8 +++---
>  tests/qtest/fuzz-test.c                  |  3 +--
>  ui/console.c                             |  2 +-
>  ui/gtk.c                                 |  2 +-
>  ui/spice-core.c                          |  2 +-
>  ui/vnc-auth-sasl.c                       |  4 +--
>  util/id.c                                |  1 +
>  79 files changed, 147 insertions(+), 134 deletions(-)
> 
> --=20
> 2.29.2
> 
> 


