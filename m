Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A18A5A8780
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 22:22:56 +0200 (CEST)
Received: from localhost ([::1]:47352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTUEd-0002lK-6k
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 16:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oTTWR-0000UB-Ix; Wed, 31 Aug 2022 15:37:11 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:62852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oTTWM-0006Dq-Rq; Wed, 31 Aug 2022 15:37:09 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 69E1B74637E;
 Wed, 31 Aug 2022 21:37:04 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id EF105746324; Wed, 31 Aug 2022 21:37:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id ECF8D746307;
 Wed, 31 Aug 2022 21:37:03 +0200 (CEST)
Date: Wed, 31 Aug 2022 21:37:03 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, peter.maydell@linaro.org, 
 richard.henderson@linaro.org
Subject: Re: [PULL 00/60] ppc queue
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
Message-ID: <8cdcb0b4-39d6-1393-e9b1-5c9f64bd9d1@eik.bme.hu>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-2065349924-1661974623=:18715"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-2065349924-1661974623=:18715
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 31 Aug 2022, Daniel Henrique Barboza wrote:
> The following changes since commit 93fac696d241dccb04ebb9d23da55fc1e9d8ee36:
>
>  Open 7.2 development tree (2022-08-30 09:40:41 -0700)
>
> are available in the Git repository at:
>
>  https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20220831
>
> for you to fetch changes up to 2d9c27ac5c035823315f68c227ca1cc6313e9842:
>
>  ppc4xx: Fix code style problems reported by checkpatch (2022-08-31 14:08:06 -0300)
>
> ----------------------------------------------------------------
> ppc patch queue for 2022-08-31:
>
> In the first 7.2 queue we have changes in the powernv pnv-phb handling,
> the start of the QOMification of the ppc405 model, the removal of the
> taihu machine, a new SLOF image and others.
>
> ----------------------------------------------------------------
> Alexey Kardashevskiy (1):
>      pseries: Update SLOF firmware image
>
> BALATON Zoltan (9):
>      ppc4xx: Move PLB model to ppc4xx_devs.c
>      ppc4xx: Rename ppc405-plb to ppc4xx-plb
>      ppc4xx: Move EBC model to ppc4xx_devs.c
>      ppc4xx: Rename ppc405-ebc to ppc4xx-ebc
>      hw/intc/ppc-uic: Convert ppc-uic to a PPC4xx DCR device
>      ppc405: Move machine specific code to ppc405_boards.c
>      hw/ppc/sam3460ex: Remove PPC405 dependency from sam460ex

Seems like we have a typo in this patch title, sam3460ex should be sam460ex

Regards,
BALATON Zoltan

>      hw/ppc/Kconfig: Move imply before select
>      ppc4xx: Fix code style problems reported by checkpatch
>
> Cédric Le Goater (22):
>      ppc/ppc405: Remove taihu machine
>      ppc/ppc405: Introduce a PPC405 generic machine
>      ppc/ppc405: Move devices under the ref405ep machine
>      ppc/ppc405: Move SRAM under the ref405ep machine
>      ppc/ppc405: Introduce a PPC405 SoC
>      ppc/ppc405: Start QOMification of the SoC
>      ppc/ppc405: QOM'ify CPU
>      ppc/ppc4xx: Introduce a DCR device model
>      ppc/ppc405: QOM'ify CPC
>      ppc/ppc405: QOM'ify GPT
>      ppc/ppc405: QOM'ify OCM
>      ppc/ppc405: QOM'ify GPIO
>      ppc/ppc405: QOM'ify DMA
>      ppc/ppc405: QOM'ify EBC
>      ppc/ppc405: QOM'ify OPBA
>      ppc/ppc405: QOM'ify POB
>      ppc/ppc405: QOM'ify PLB
>      ppc/ppc405: QOM'ify MAL
>      ppc/ppc405: Use an embedded PPCUIC model in SoC state
>      ppc/ppc405: Use an explicit I2C object
>      ppc/ppc405: QOM'ify FPGA
>      ppc/ppc4xx: Fix sdram trace events
>
> Daniel Henrique Barboza (24):
>      ppc/pnv: add PHB3 bus init helper
>      ppc/pnv: add PnvPHB base/proxy device
>      ppc/pnv: turn PnvPHB3 into a PnvPHB backend
>      ppc/pnv: add PHB4 bus init helper
>      ppc/pnv: turn PnvPHB4 into a PnvPHB backend
>      ppc/pnv: add pnv-phb-root-port device
>      ppc/pnv: remove pnv-phb3-root-port
>      ppc/pnv: remove pnv-phb4-root-port
>      ppc/pnv: remove root port name from pnv_phb_attach_root_port()
>      ppc/pnv: remove pecc->rp_model
>      ppc/pnv: remove PnvPHB4.version
>      ppc/pnv: move attach_root_port helper to pnv-phb.c
>      ppc/pnv: add phb-id/chip-id PnvPHB3RootBus properties
>      ppc/pnv: add phb-id/chip-id PnvPHB4RootBus properties
>      ppc/pnv: set root port chassis and slot using Bus properties
>      ppc/pnv: add helpers for pnv-phb user devices
>      ppc/pnv: turn chip8->phbs[] into a PnvPHB* array
>      ppc/pnv: enable user created pnv-phb for powernv8
>      ppc/pnv: add PHB4 helpers for user created pnv-phb
>      ppc/pnv: enable user created pnv-phb for powernv9
>      ppc/pnv: change pnv_phb4_get_pec() to also retrieve chip10->pecs
>      ppc/pnv: user creatable pnv-phb for powernv10
>      ppc/pnv: consolidate pnv_parent_*_fixup() helpers
>      ppc/pnv: fix QOM parenting of user creatable root ports
>
> Lucas Mateus Castro (alqotel) (2):
>      fpu: Add rebias bool, value and operation
>      target/ppc: Bugfix FP when OE/UE are set
>
> Nicholas Piggin (2):
>      target/ppc: Fix host PVR matching for KVM
>      ppc/pnv: Add initial P9/10 SBE model
>
> MAINTAINERS                     |    2 +-
> docs/about/deprecated.rst       |    9 -
> docs/about/removed-features.rst |    6 +
> docs/system/ppc/embedded.rst    |    1 -
> docs/system/ppc/pseries.rst     |    2 +-
> fpu/softfloat-parts.c.inc       |   21 +-
> fpu/softfloat.c                 |    2 +
> hw/intc/ppc-uic.c               |   26 +-
> hw/pci-host/meson.build         |    3 +-
> hw/pci-host/pnv_phb.c           |  337 ++++++++++++
> hw/pci-host/pnv_phb.h           |   55 ++
> hw/pci-host/pnv_phb3.c          |  152 +++--
> hw/pci-host/pnv_phb4.c          |  191 +++----
> hw/pci-host/pnv_phb4_pec.c      |   11 +-
> hw/ppc/Kconfig                  |    3 +-
> hw/ppc/meson.build              |    1 +
> hw/ppc/pnv.c                    |  188 +++++--
> hw/ppc/pnv_sbe.c                |  414 ++++++++++++++
> hw/ppc/pnv_xscom.c              |    3 +
> hw/ppc/ppc405.h                 |  200 +++++--
> hw/ppc/ppc405_boards.c          |  552 +++++++++----------
> hw/ppc/ppc405_uc.c              | 1156 ++++++++++++++-------------------------
> hw/ppc/ppc440_bamboo.c          |   34 +-
> hw/ppc/ppc440_uc.c              |    3 +-
> hw/ppc/ppc4xx_devs.c            |  554 ++++++++++++++-----
> hw/ppc/ppc4xx_pci.c             |   31 +-
> hw/ppc/sam460ex.c               |   38 +-
> hw/ppc/trace-events             |   14 +-
> hw/ppc/virtex_ml507.c           |    7 +-
> include/fpu/softfloat-types.h   |    4 +
> include/hw/intc/ppc-uic.h       |    6 +-
> include/hw/pci-host/pnv_phb3.h  |   19 +-
> include/hw/pci-host/pnv_phb4.h  |   22 +-
> include/hw/ppc/pnv.h            |   13 +-
> include/hw/ppc/pnv_sbe.h        |   55 ++
> include/hw/ppc/pnv_xscom.h      |   12 +
> include/hw/ppc/ppc4xx.h         |   76 ++-
> pc-bios/README                  |    2 +-
> pc-bios/slof.bin                |  Bin 992384 -> 995176 bytes
> roms/SLOF                       |    2 +-
> target/ppc/cpu-qom.h            |    6 +-
> target/ppc/cpu.c                |    2 +
> target/ppc/cpu_init.c           |   91 ++-
> target/ppc/fpu_helper.c         |    2 -
> target/ppc/machine.c            |    2 +-
> 45 files changed, 2736 insertions(+), 1594 deletions(-)
> create mode 100644 hw/pci-host/pnv_phb.c
> create mode 100644 hw/pci-host/pnv_phb.h
> create mode 100644 hw/ppc/pnv_sbe.c
> create mode 100644 include/hw/ppc/pnv_sbe.h
>
>
--3866299591-2065349924-1661974623=:18715--

