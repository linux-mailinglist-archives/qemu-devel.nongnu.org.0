Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6915BBFC5
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 22:24:29 +0200 (CEST)
Received: from localhost ([::1]:41770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa0q4-0003xJ-M3
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 16:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oa0oj-0002EI-FS
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 16:23:05 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oa0oh-00042r-KU
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 16:23:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aF5YdWoc0BKUaWOlAfJGqX37BRTcZm1csiVBr/c4Kgc=; b=BHnGWDdd8o/ARQbR9g9xfBPpJL
 /i+f2QGQ1YcugfZ/wK53AnTZ8GnjX7e/h0fA3NDSctAppbypLn69o5MJ1P5gvIhwTym5vvRbuBUbF
 DIwj3zxX8YEBJCaAnbt8Uu5drvApJ9pLoFjrXLaMGV8xVWhGxtR2GjB6BcZPzg8WLKO2TaVRtW+9T
 pMW0jbWmwI9T4xwqF29nQhB80zITwaslIeLcdusrqAoX6FVjKIrk/p8hf/So4Ix5hwQUJZvuMuEti
 ynv0C514KC90UsoYL3+bRnZVXkPwW/OLsB35a02He3ABFYPQ6hbzIf83HQScerxOdP/Dgl6GC+NML
 1s0v8Hr1zjs+q/E11wUXaagAW7t9S3GjPDmVK9wCXBoD2cAuJxr+bemYy5jhB4Fh0zyYw7nDxBv1e
 lItM37JQjEEAZWmrh2MrmzaTefVQDDZhhSKUVkrNX7sp70xII/lMSeoVIPrdUve+GoTXagCt/LLWh
 Wnr3n9c6cy3XMSqHT35kanI3uDH333+VVhJXgmc3tLAsEzXWP2A9UDGwi1UPGp7qzKZ7PIM4o5emB
 08RS9DX5OjpWdRSDny5x8AwpPiVm9zkL8hBHX+J7h/7N4KQsYtsFiEC5vsOKqR/MimBwqvVKT/Z2q
 IGvG34rz7sRTlVilepJ2jm6r4Aq7cZeccRMqVE7dg=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oa0my-0007a4-OM; Sun, 18 Sep 2022 21:21:20 +0100
Message-ID: <7bdc1d9c-a18d-958a-4b9b-3487e159e92f@ilande.co.uk>
Date: Sun, 18 Sep 2022 21:22:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220901162613.6939-1-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 00/42] Consolidate PIIX south bridges
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.657,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 01/09/2022 17:25, Bernhard Beschow wrote:

> This series consolidates the implementations of the PIIX3 and PIIX4 south
> bridges and is an extended version of [1]. The motivation is to share as much
> code as possible and to bring both device models to feature parity such that
> perhaps PIIX4 can become a drop-in-replacement for PIIX3 in the pc machine. This
> could resolve the "Frankenstein" PIIX4-PM problem in PIIX3 discussed on this
> list before.
> 
> The series is structured as follows: First, PIIX3 is changed to instantiate
> internal devices itself, like PIIX4 does already. Second, PIIX3 gets prepared
> for the merge with PIIX4 which includes some fixes, cleanups, and renamings.
> Third, the same is done for PIIX4. In step four the implementations are merged.
> Since some consolidations could be done easier with merged implementations, the
> consolidation continues in step five which concludes the series.
> 
> One particular challenge in this series was that the PIC of PIIX3 used to be
> instantiated outside of the south bridge while some sub functions require a PIC
> with populated qemu_irqs. This has been solved by introducing a proxy PIC which
> furthermore allows PIIX3 to be agnostic towards the virtualization technology
> used (KVM, TCG, Xen). Due to consolidation PIIX4 gained the PIC as well,
> possibly allowing the Malta board to gain KVM capabilities in the future.
> 
> Another challenge was dealing with optional devices where Peter already gave
> advice in [1] which this series implements.
> 
> An unsolved problem still is PCI interrupt handling. The first function
> passed to pci_bus_irqs() is device-specific while the second one seems
> board-specific. This causes both PIIX device models to be coupled to a
> particular board. Any advice how to resolve this would be highly appreaciated.

Could you explain this in a bit more detail?

> Last but not least there might be some opportunity to consolidate VM state
> handling, probably by reusing the one from PIIX3. Since I'm not very familiar
> with the requirements I didn't touch it so far.
> 
> Testing done:
> * make check
> * Boot live CD:
>    * `qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom
> manjaro-kde-21.3.2-220704-linux515.iso`
>    * `qemu-system-x86_64 -M q35 -m 2G -accel kvm -cpu host -cdrom
> manjaro-kde-21.3.2-220704-linux515.iso`
> 
> [1] https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg02348.html
> 
> Bernhard Beschow (42):
>    hw/i386/pc: Create DMA controllers in south bridges
>    hw/i386/pc: Create RTC controllers in south bridges
>    hw/i386/pc: No need for rtc_state to be an out-parameter
>    hw/i386/pc_piix: Allow for setting properties before realizing PIIX3
>      south bridge
>    hw/isa/piix3: Create USB controller in host device
>    hw/isa/piix3: Create power management controller in host device
>    hw/intc/i8259: Introduce i8259 proxy "isa-pic"
>    hw/isa/piix3: Create ISA PIC in host device
>    hw/isa/piix3: Create IDE controller in host device
>    hw/isa/piix3: Wire up ACPI interrupt internally
>    hw/isa/piix3: Remove extra ';' outside of functions
>    hw/isa/piix3: Remove unused include
>    hw/isa/piix3: Add size constraints to rcr_ops
>    hw/isa/piix3: Modernize reset handling
>    hw/isa/piix3: Prefer pci_address_space() over get_system_memory()
>    hw/isa/piix3: Allow board to provide PCI interrupt routes
>    hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
>    hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4
>    hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4
>    hw/isa/piix3: Prefix pci_slot_get_pirq() with "piix3_"
>    hw/isa/piix3: Rename typedef PIIX3State to PIIXState
>    hw/mips/malta: Reuse dev variable
>    meson: Fix dependencies of piix4 southbridge
>    hw/isa/piix4: Add missing initialization
>    hw/isa/piix4: Move pci_ide_create_devs() call to board code
>    hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
>    hw/isa/piix4: Allow board to provide PCI interrupt routes
>    hw/isa/piix4: Remove unused code
>    hw/isa/piix4: Use ISA PIC device
>    hw/isa/piix4: Reuse struct PIIXState from PIIX3
>    hw/isa/piix4: Rename reset control operations to match PIIX3
>    hw/isa/piix4: Rename wrongly named method
>    hw/isa/piix4: Prefix pci_slot_get_pirq() with "piix4_"
>    hw/isa/piix3: Merge hw/isa/piix4.c
>    hw/isa/piix: Harmonize names of reset control memory regions
>    hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4
>    hw/isa/piix: Rename functions to be shared for interrupt triggering
>    hw/isa/piix: Consolidate IRQ triggering
>    hw/isa/piix: Unexport PIIXState
>    hw/isa/piix: Share PIIX3 base class with PIIX4
>    hw/isa/piix: Drop the "3" from the PIIX base class
>    hw/i386/acpi-build: Resolve PIIX ISA bridge rather than ACPI
>      controller
> 
>   MAINTAINERS                             |   6 +-
>   configs/devices/mips-softmmu/common.mak |   3 +-
>   hw/i386/Kconfig                         |   3 +-
>   hw/i386/acpi-build.c                    |   4 +-
>   hw/i386/pc.c                            |  19 +-
>   hw/i386/pc_piix.c                       |  72 +--
>   hw/i386/pc_q35.c                        |   3 +-
>   hw/intc/i8259.c                         |  27 +
>   hw/isa/Kconfig                          |  14 +-
>   hw/isa/lpc_ich9.c                       |  11 +
>   hw/isa/meson.build                      |   3 +-
>   hw/isa/piix.c                           | 669 ++++++++++++++++++++++++
>   hw/isa/piix3.c                          | 431 ---------------
>   hw/isa/piix4.c                          | 325 ------------
>   hw/mips/malta.c                         |  34 +-
>   include/hw/i386/ich9.h                  |   2 +
>   include/hw/i386/pc.h                    |   2 +-
>   include/hw/intc/i8259.h                 |  14 +
>   include/hw/southbridge/piix.h           |  41 +-
>   19 files changed, 823 insertions(+), 860 deletions(-)
>   create mode 100644 hw/isa/piix.c
>   delete mode 100644 hw/isa/piix3.c
>   delete mode 100644 hw/isa/piix4.c

I've had a quick skim over this series and commented on the parts that caught my eye, 
however I'm generally happy with the way this series is going and it seems like a 
nice tidy-up - thanks!


ATB,

Mark.

