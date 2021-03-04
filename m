Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C533032DB46
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:42:03 +0100 (CET)
Received: from localhost ([::1]:37672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHunK-00071Q-Qd
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:42:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lHudk-00075H-0g; Thu, 04 Mar 2021 15:32:08 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:29037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lHudd-0003hq-FS; Thu, 04 Mar 2021 15:32:07 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D388B74581E;
 Thu,  4 Mar 2021 21:31:56 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 902D37456E3; Thu,  4 Mar 2021 21:31:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8DEBF7456B7;
 Thu,  4 Mar 2021 21:31:56 +0100 (CET)
Date: Thu, 4 Mar 2021 21:31:56 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v4 6/6] hw/ppc: Add emulation of Genesi/bPlan Pegasos
 II
In-Reply-To: <YD7Wl/21vn7Dkizg@yekko.fritz.box>
Message-ID: <bc813a4-51f6-7893-1cff-294e231f743@eik.bme.hu>
References: <cover.1614282456.git.balaton@eik.bme.hu>
 <848089b1c91e0c28eb7c52ccdc55dc870eb49dc0.1614282457.git.balaton@eik.bme.hu>
 <97399e18-3217-40db-5021-702371d196bc@amsat.org>
 <c0403b8b-fee1-11e2-a8d0-2af36f66c9@eik.bme.hu>
 <YD7Wl/21vn7Dkizg@yekko.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1786372220-1614889916=:54902"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1786372220-1614889916=:54902
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 3 Mar 2021, David Gibson wrote:
> On Tue, Mar 02, 2021 at 10:13:19AM +0100, BALATON Zoltan wrote:
>> On Tue, 2 Mar 2021, Philippe Mathieu-Daudé wrote:
>>> On 2/25/21 8:47 PM, BALATON Zoltan wrote:
>>>> Add new machine called pegasos2 emulating the Genesi/bPlan Pegasos II,
>>>> a PowerPC board based on the Marvell MV64361 system controller and the
>>>> VIA VT8231 integrated south bridge/superio chips. It can run Linux,
>>>> AmigaOS and a wide range of MorphOS versions. Currently a firmware ROM
>>>> image is needed to boot and only MorphOS has a video driver to produce
>>>> graphics output. Linux could work too but distros that supported this
>>>> machine don't include usual video drivers so those only run with
>>>> serial console for now.
>>>>
>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>> ---
>>>>  MAINTAINERS                             |  10 ++
>>>>  default-configs/devices/ppc-softmmu.mak |   2 +
>>>>  hw/ppc/Kconfig                          |  10 ++
>>>>  hw/ppc/meson.build                      |   2 +
>>>>  hw/ppc/pegasos2.c                       | 144 ++++++++++++++++++++++++
>>>>  5 files changed, 168 insertions(+)
>>>>  create mode 100644 hw/ppc/pegasos2.c
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 9b2aa18e1f..a023217702 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -1345,6 +1345,16 @@ F: pc-bios/canyonlands.dt[sb]
>>>>  F: pc-bios/u-boot-sam460ex-20100605.bin
>>>>  F: roms/u-boot-sam460ex
>>>>
>>>> +pegasos2
>>>> +M: BALATON Zoltan <balaton@eik.bme.hu>
>>>> +R: David Gibson <david@gibson.dropbear.id.au>
>>>
>>> :)
>>
>> He's also listed as reviewer for the sam460ex and I think as the PPC
>> maintainer probably should be notified about changes that's why this is
>> here. I guess he can complain or submit a patch later if he wants to be
>> removed.
>
> Including me as reviewer is fine for now.
>
>>
>>>> +L: qemu-ppc@nongnu.org
>>>> +S: Maintained
>>>> +F: hw/ppc/pegasos2.c
>>>> +F: hw/pci-host/mv64361.c
>>>> +F: hw/pci-host/mv643xx.h
>>>> +F: include/hw/pci-host/mv64361.h
>>>> +
>>>>  RISC-V Machines
>>>>  ---------------
>>>>  OpenTitan
>>>> diff --git a/default-configs/devices/ppc-softmmu.mak b/default-configs/devices/ppc-softmmu.mak
>>>> index 61b78b844d..4535993d8d 100644
>>>> --- a/default-configs/devices/ppc-softmmu.mak
>>>> +++ b/default-configs/devices/ppc-softmmu.mak
>>>> @@ -14,5 +14,7 @@ CONFIG_SAM460EX=y
>>>>  CONFIG_MAC_OLDWORLD=y
>>>>  CONFIG_MAC_NEWWORLD=y
>>>>
>>>> +CONFIG_PEGASOS2=y
>>>> +
>>>>  # For PReP
>>>>  CONFIG_PREP=y
>>>> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
>>>> index d11dc30509..98d8dd1a84 100644
>>>> --- a/hw/ppc/Kconfig
>>>> +++ b/hw/ppc/Kconfig
>>>> @@ -68,6 +68,16 @@ config SAM460EX
>>>>      select USB_OHCI
>>>>      select FDT_PPC
>>>>
>>>> +config PEGASOS2
>>>> +    bool
>>>> +    select MV64361
>>>> +    select VT82C686
>>>> +    select IDE_VIA
>>>> +    select SMBUS_EEPROM
>>>> +# These should come with VT82C686
>>>> +    select APM
>>>> +    select ACPI_X86
>>>> +
>>>>  config PREP
>>>>      bool
>>>>      imply PCI_DEVICES
>>>> diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
>>>> index 218631c883..86d6f379d1 100644
>>>> --- a/hw/ppc/meson.build
>>>> +++ b/hw/ppc/meson.build
>>>> @@ -78,5 +78,7 @@ ppc_ss.add(when: 'CONFIG_E500', if_true: files(
>>>>  ))
>>>>  # PowerPC 440 Xilinx ML507 reference board.
>>>>  ppc_ss.add(when: 'CONFIG_VIRTEX', if_true: files('virtex_ml507.c'))
>>>> +# Pegasos2
>>>> +ppc_ss.add(when: 'CONFIG_PEGASOS2', if_true: files('pegasos2.c'))
>>>>
>>>>  hw_arch += {'ppc': ppc_ss}
>>>> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
>>>> new file mode 100644
>>>> index 0000000000..427e884fbf
>>>> --- /dev/null
>>>> +++ b/hw/ppc/pegasos2.c
>>>> @@ -0,0 +1,144 @@
>>>> +/*
>>>> + * QEMU PowerPC CHRP (Genesi/bPlan Pegasos II) hardware System Emulator
>>>> + *
>>>> + * Copyright (c) 2018-2020 BALATON Zoltan
>>>
>>> 2018-2021
>>
>> Not really. I've done this between Christmas of 2018 and 2020. This year
>> were only changes for upstreaming and review comments so I preserved the
>> dates to record when the actual code was written.
>
> Fwiw, Red Hat's internal guidelines have the opinion that the years
> don't matter that much and are usually out of date, so they suggest
> simply "Copyright Red Hat." for contributions from us. IANAL.

I think including the year originally comes from that in some 
jurisdictions there is or was a limit for how long copyright is reserved 
starting from this date and then each modification may restart that period 
but I read somewhere that it's not any more relevant. Anyway, I've just 
added the year to record when did I do it and the whole copyright message 
is mostly to state who's to blame for this as it's under GPL anyway so 
copyright does not matter much and the commit log also has this info it's 
just easier to find in the header comment.

>>>> + *
>>>> + * This work is licensed under the GNU GPL license version 2 or later.
>>>> + *
>>>> + */
>>>> +
>>>> +#include "qemu/osdep.h"
>>>> +#include "qemu-common.h"
>>>> +#include "qemu/units.h"
>>>> +#include "qapi/error.h"
>>>> +#include "hw/hw.h"
>>>> +#include "hw/ppc/ppc.h"
>>>> +#include "hw/sysbus.h"
>>>> +#include "hw/pci/pci_host.h"
>>>> +#include "hw/irq.h"
>>>> +#include "hw/pci-host/mv64361.h"
>>>> +#include "hw/isa/vt82c686.h"
>>>> +#include "hw/ide/pci.h"
>>>> +#include "hw/i2c/smbus_eeprom.h"
>>>> +#include "hw/qdev-properties.h"
>>>> +#include "sysemu/reset.h"
>>>> +#include "hw/boards.h"
>>>> +#include "hw/loader.h"
>>>> +#include "hw/fw-path-provider.h"
>>>> +#include "elf.h"
>>>> +#include "qemu/log.h"
>>>> +#include "qemu/error-report.h"
>>>> +#include "sysemu/kvm.h"
>>>> +#include "kvm_ppc.h"
>>>> +#include "exec/address-spaces.h"
>>>> +#include "trace.h"
>>>> +#include "qemu/datadir.h"
>>>> +#include "sysemu/device_tree.h"
>>>> +
>>>> +#define PROM_FILENAME "pegasos2.rom"
>>>> +#define PROM_ADDR     0xfff00000
>>>> +#define PROM_SIZE     0x80000
>>>> +
>>>> +#define BUS_FREQ 133333333
>>>
>>> Can you rename as BUS_FREQ_HZ?
>>>
>>>> +
>>>> +static void pegasos2_cpu_reset(void *opaque)
>>>> +{
>>>> +    PowerPCCPU *cpu = opaque;
>>>> +
>>>> +    cpu_reset(CPU(cpu));
>>>> +    cpu->env.spr[SPR_HID1] = 7ULL << 28;
>>>> +}
>>>> +
>>>> +static void pegasos2_init(MachineState *machine)
>>>> +{
>>>> +    PowerPCCPU *cpu = NULL;
>>>> +    MemoryRegion *rom = g_new(MemoryRegion, 1);
>>>> +    DeviceState *mv;
>>>> +    PCIBus *pci_bus;
>>>> +    PCIDevice *dev;
>>>> +    I2CBus *i2c_bus;
>>>> +    const char *fwname = machine->firmware ?: PROM_FILENAME;
>>>> +    char *filename;
>>>> +    int sz;
>>>> +    uint8_t *spd_data;
>>>> +
>>>> +    /* init CPU */
>>>> +    cpu = POWERPC_CPU(cpu_create(machine->cpu_type));
>>>> +    if (PPC_INPUT(&cpu->env) != PPC_FLAGS_INPUT_6xx) {
>>>> +        error_report("Incompatible CPU, only 6xx bus supported");
>>>> +        exit(1);
>>>> +    }
>>>> +
>>>> +    /* Set time-base frequency */
>>>> +    cpu_ppc_tb_init(&cpu->env, BUS_FREQ / 4);
>>>> +    qemu_register_reset(pegasos2_cpu_reset, cpu);
>>>> +
>>>> +    /* RAM */
>>>> +    memory_region_add_subregion(get_system_memory(), 0, machine->ram);
>>>> +
>>>> +    /* allocate and load firmware */
>>>> +    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, fwname);
>>>> +    if (!filename) {
>>>> +        error_report("Could not find firmware '%s'", fwname);
>>>> +        exit(1);
>>>> +    }
>>>> +    memory_region_init_rom(rom, NULL, "pegasos2.rom", PROM_SIZE, &error_fatal);
>>>> +    memory_region_add_subregion(get_system_memory(), PROM_ADDR, rom);
>>>> +    sz = load_elf(filename, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1,
>>>> +                  PPC_ELF_MACHINE, 0, 0);
>>>> +    if (sz <= 0) {
>>>> +        sz = load_image_targphys(filename, PROM_ADDR, PROM_SIZE);
>>>> +    }
>>>> +    if (sz <= 0 || sz > PROM_SIZE) {
>>>> +        error_report("Could not load firmware '%s'", filename);
>>>> +        exit(1);
>>>> +    }
>>>> +    g_free(filename);
>>>> +
>>>> +    /* Marvell Discovery II system controller */
>>>> +    mv = DEVICE(sysbus_create_simple(TYPE_MV64361, -1,
>>>> +                        ((qemu_irq *)cpu->env.irq_inputs)[PPC6xx_INPUT_INT]));
>>>
>>> Indent off.
>>
>> There's no other way to fit in the 80 chars line length limit in a sensible
>> way. (Aligning to DEVICE( would be confusing as last arg belongs to
>> sysbus_create_simple().)
>
> You could declare a temporary variable with the complex irq_inputs expression.

Should I submit a new version with that change or you just noted it as a 
possibility? I've also thought about that but I think it's not worth it if 
it's only used at this one place. This may also be simplified in the 
future if PPC interrupts are converted to gpios as Peter suggested.

Regards,
BALATON Zoltan
--3866299591-1786372220-1614889916=:54902--

