Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4CC41C0FF
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 10:53:21 +0200 (CEST)
Received: from localhost ([::1]:60404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVVL5-0002oE-Lw
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 04:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVJV-0001pE-87
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 04:51:41 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:38597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVJS-0007uy-DK
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 04:51:40 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1McY4R-1n6D2g0naH-00d2uK; Wed, 29 Sep 2021 10:51:35 +0200
Subject: Re: [PATCH v6 00/20] nubus: bus, device, bridge, IRQ and address
 space improvements
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210924073808.1041-1-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <62d5aeb5-ad89-1663-f5b1-5aa011a345c7@vivier.eu>
Date: Wed, 29 Sep 2021 10:51:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210924073808.1041-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:7kr8QMoDWQLNWGch2rXSI6gYgVK8PqbZBqWdV/hdPulT96iZZck
 TgzbcBjO11JiS2KNR9/LZVk6FFIihEVSECllPkeSgXCZkEgoYnpHHpCF2WdU+S1TBSOrI4c
 ack1D0cwrb+3bk+bZJlnQmnSN3dArBc6g1J5FRMBvrNR6HM/BaxWgqwo5hg/rYxMfUhySlX
 L7BSOKgZRCjguxDeFVD4A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TdpLkjkbURM=:LiWDGAULwklW6L8ubuRau7
 GQ51BtaRCTfny8WxOo9Qvg3HCh2sxtSHs8GswFcCm7WfH02obaYCrDCPzsulyQo/HWIEOto/t
 IQ0509LYuDzuc/w//4MP9orWlBUuAE3DnM6eQkXuhBAd4b+g2034Wqf7eK+A2HJiafPFcnc4T
 xTlSCC5dSDB6SZ31W7WOssZLbjiV6S/7FWX+95kPKyi/cRecrV3/sXEw3lUgLhpRiDbZOuEbw
 0y0nHm/fY6BfnuTk+8oTlMMzQEzxrEdXFMdH2PaNu/Q8IO4C7/8IA+Vu666fXYezN935AzwTD
 DJgo5aqCS6krf9uWuBelJXB9/EK9BZY/M4dgMCfMMDCJNX5yS6727XB3l54kuUC8uFOHiHZir
 +dou7qUc9F0UN36IkSS5BS0AK/EHMlgTFcos0W2m2VXeuRfYMc5K3HJjFgsH3ClDHL+UcK3r0
 RQbK5TprwsHkLu01N0PP/Wb7n+bXaAy/Tnqm9Xc8ACg2OZ4MQA/RKrF6l20RI8ExvpMXUtRpB
 30bPNtasSMDYZMBhwCJfzOZsdBs880MLuJxW8uFSHfF4tIv0G/xXN6PLCK8tndMdnFuX1T7pg
 ns5JGeJRAU1geZoA0a81R7JdUlZvcrUkZbsRH1NTrkvhEfXo2Ly7u8VUyltXoAl88vElyXylo
 m15k+VxCsPrZrbQmMmqW3shsctsbgzIY7Ct0L/nGB6EohvV7C9dWafCSTPGy0sHCSfLj93qS0
 arQ3VUW4rscrmUiVmWWfykcD971xX4c8aVM4vA==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.562,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 24/09/2021 à 09:37, Mark Cave-Ayland a écrit :
> This patchset is the next set of changes required to boot MacOS on the q800 machine. The
> main aim of these patches is to improve the Nubus support so that devices can be plugged
> into the Nubus from the command line i.e.
> 
>     -device nubus-macfb[,slot=num][,romfile=decl.rom]
> 
> At the moment the only device that can be plugged into the Nubus is the macfb framebuffer
> however with these changes it is possible to take a ROM from a real Nubus card and
> attempt to use it in QEMU, and also allow for future interfaces such as virtio.
> 
> Patches 1 to 6 move the logic which manages bus addresses from the NubusDevice into
> the NubusBus itself, including the introduction of a bitmap to manage available
> slots on the bus.
> 
> Patches 7 and 8 change the handling for unassigned (empty) slots to generate a bus
> fault and add trace events to allow logging of empty slot accesses during Nubus
> enumeration.
> 
> Patches 9 to 11 remove the existing stubs for generating the format block (the epilogue
> of the Nubus device embedded ROM consisting of metadata and a checksum) and replace them
> with a romfile device property to allow the entire Nubus ROM to be loaded from a file
> into the ROM area, similar to a PCI option ROM.
> 
> Patch 12 moves the Nubus into its own separate address space whilst patches 13 to 17
> update the NubusBridge (and MacNubusBridge) devices to allow machines to map the
> required slots from the Nubus address space using sysbus_mmio_map().
> 
> Finally patches 18 to 20 add support for Nubus IRQs and wire them up appropriately for
> the q800 machine through VIA2, which is required for the next set of macfb updates.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> 
> v6:
> - Rebase onto master
> - Add extra R-B tags from Laurent and Philippe
> - Use int for ctz32() result in patches 4 and 5
> - Change slot_available_mask to uint16_t in patches 4 and 17
> - Fix typo in commit message for patch 4
> 
> v5:
> - Rebase onto master
> - Add R-B tags from Laurent
> - Introduce NUBUS_FIRST_SLOT/NUBUS_LAST_SLOT and MAC_NUBUS_FIRST_SLOT/MAC_NUBUS_LAST_SLOT
>   and fix up NUBUS_SUPER_SLOT_NB/NUBUS_SLOT_NB in patch 4
> - Fix super slot offset calculation in patch 4
> - Squash original patch 3 ("nubus-device: add device slot parameter") into patch 4
>   ("nubus: use bitmap to manage available slots")
> - Add new patch 1 ("nubus: add comment indicating reference documents") containing
>   documentation references
> - Drop "nubus->slot_available_mask = MAKE_64BIT_MASK(0, 16);" from nubus_init() in patch 17
>   
> v4:
> - Rebase onto master
> - Pass &error_abort to memory_region_init_rom() in patch 11
> - Change warn_error() to error_setg() and tweak message in patch 11
> 
> v3:
> - Rebase onto master
> - Add Phil's R-B for patch 7
> - Move NUBUS_FIRST_SLOT/NUBUS_LAST_SLOT check to end of nubus_device_realize() in patch 4
> - Use BIT() macro in patches 4 and 20
> 
> v2:
> - Rebase onto master
> - Tweak the cover letter by adding the optional slot parameter in the -device example
> - Add R-B tags from Phil
> - Document the increase in max_access_size in patch 7
> - Change the maximum declaration ROM size to 128KiB using (128 * KiB) in patch 11
> - use MAKE_64BIT_MASK() in patches 4 and 16
> 
> 
> Mark Cave-Ayland (20):
>   nubus: add comment indicating reference documents
>   nubus-device: rename slot_nb variable to slot
>   nubus-device: expose separate super slot memory region
>   nubus: use bitmap to manage available slots
>   nubus: move slot bitmap checks from NubusDevice realize() to BusClass
>     check_address()
>   nubus: implement BusClass get_dev_path()
>   nubus: add trace-events for empty slot accesses
>   nubus: generate bus error when attempting to access empty slots
>   macfb: don't register declaration ROM
>   nubus-device: remove nubus_register_rom() and
>     nubus_register_format_block()
>   nubus-device: add romfile property for loading declaration ROMs
>   nubus: move nubus to its own 32-bit address space
>   nubus-bridge: introduce separate NubusBridge structure
>   mac-nubus-bridge: rename MacNubusState to MacNubusBridge
>   nubus: move NubusBus from mac-nubus-bridge to nubus-bridge
>   nubus-bridge: embed the NubusBus object directly within nubus-bridge
>   nubus-bridge: make slot_available_mask a qdev property
>   nubus: add support for slot IRQs
>   q800: wire up nubus IRQs
>   q800: configure nubus available slots for Quadra 800
> 
>  hw/display/macfb.c                  |   6 -
>  hw/m68k/q800.c                      |  26 +++-
>  hw/nubus/mac-nubus-bridge.c         |  34 ++++-
>  hw/nubus/nubus-bridge.c             |  23 ++-
>  hw/nubus/nubus-bus.c                | 120 ++++++++++++---
>  hw/nubus/nubus-device.c             | 227 ++++++++--------------------
>  hw/nubus/trace-events               |   7 +
>  hw/nubus/trace.h                    |   1 +
>  include/hw/nubus/mac-nubus-bridge.h |  13 +-
>  include/hw/nubus/nubus.h            |  49 +++---
>  meson.build                         |   1 +
>  11 files changed, 278 insertions(+), 229 deletions(-)
>  create mode 100644 hw/nubus/trace-events
>  create mode 100644 hw/nubus/trace.h
> 

Applied to my q800-for-6.2 branch

Thanks,
Laurent


