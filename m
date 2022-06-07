Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9785A540350
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 18:03:37 +0200 (CEST)
Received: from localhost ([::1]:36388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nybg8-00023S-LA
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 12:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nybXc-0006Gt-Sl; Tue, 07 Jun 2022 11:54:51 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nybXa-0002H7-F6; Tue, 07 Jun 2022 11:54:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:References:To:From:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pos+A1pHWAkXmIS7vGyryCyUTnZ8914n4P0L3/TSQ+I=; b=GFd8jVSc004fuzJIm/jenyIOHT
 YqLNjEiZclnnjbChRqUyNXqFvXjVuujH8MOzeBMWQijvueFRilgCdAuHSstFZvTnvCCZ1fyHINVom
 qci4HUdcRst5BTF/6Dtc2lZ1KfMM8a7dzVepBxmnYQ8WlsFb01oEBTe4evFud/WObGEbduZbnaMal
 SD7St/eH8k9Dtw533fH3G2e+lLPiQX0u2wW3oS+FKqO19da7JGU7EZ2tISZx1oMpWHEWOcRO6NlLw
 xYyVSUyCN6amYiZmB6adAPBqmpLRsYSi4Ji2bybcNuVyXkuH3mQS+Fp2xFOC6FSTrqHFa5Md5R19l
 1rgTAPXmUTnF49bAVMG8sATonkmylovRHDi3HdLq3Xh9P8e2CGFrKObeKXL1jG4JKGsKyTXW3YqeJ
 RjVVPFYwCAiWj2Hvu1LQwR+KrawmcnfWFR69o+KPu2yhDntUC0DUr/f71fz9mbpxL8Ox33gHoz64p
 ++/sJNIj8Z9Ua0mnUnKulh1HwZxCqg50PgY+tiUbCMEh/Xj+iJm/SGRw2K8Refu66NmBH/mFdO4qy
 xBsG3AvTAo07d1hiO8f0U1TBmVHTuYXe2YlFahPdoGxE/SIboJcJfwzDmunq2sQ9vH/k/x+eUcz/T
 4fCojIHcD9+9rRDBDxK2A9hKPDuPtFaPNQsNdPpIw=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nybWE-0000mi-R2; Tue, 07 Jun 2022 16:53:27 +0100
Message-ID: <9608d355-8582-69e0-50ee-de48e0ef561f@ilande.co.uk>
Date: Tue, 7 Jun 2022 16:54:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 00/50] PS2 device QOMification - part 1
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 22/05/2022 19:17, Mark Cave-Ayland wrote:

> This series came about when looking at improving the LASI PS2 device for
> the HPPA machine: there were improvements that I was keen to make, but
> was restricted because the PS2 device(s) weren't QOMified.
> 
> Trying to do everything in a single patchset would be a very large series
> indeed, so here is part 1 of the series which does the basic QOMification
> process and consists of:
> 
> - QOMifying the basic PS2, PS2 keyboard and PS2 mouse types
> 
> - Moving any functionality that exists in a global device init function
>    directly into the relevant device, so that all device behaviour is
>    configured using qdev properties and QOM
> 
> - Introducing a new I8042_MMIO type for use by the MIPS magnum machine
> 
> - Switch all PS2 devices to use qdev gpios for IRQs instead of using the
>    update_irq() callback function along with the update_arg opaque
> 
> Once this work has been done, a follow-up part 2 series will finish the
> remainder of the work which involves i) improving the QOM object model
> now QOMification is complete and ii) removing the legacy global device
> init functions for PS2 and related devices.
> 
> Testing for this series has comprised of booting a machine with each type
> of PS2 device and confirming that i) the machine responds to keypresses
> when using a graphical console and ii) completing a successful migration
> from a machine with this series applies back to a machine running latest
> git master. The test machines I used were:
> 
> - qemu-system-x86_64 -M pc for the I8042 device
> - qemu-system-hppa for the LASIPS2 device
> - qemu-system-arm -M versatilepb for the PL050 device
> - qemu-system-mips64el -M magnum for the I8042_MMIO device
> 
> Finally the QOM tree changes caused by QOMification of the PS2 devices
> trigger a failure due to a bug in the bios-tables-test qtest for subtest
> /x86_64/acpi/q35/viot. This can be fixed by applying the series at
> https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg04266.html
> "hw/acpi/viot: generate stable VIOT ACPI tables" first.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> 
> Mark Cave-Ayland (50):
>    ps2: checkpatch fixes
>    ps2: QOMify PS2State
>    ps2: QOMify PS2KbdState
>    ps2: QOMify PS2MouseState
>    ps2: move QOM type definitions from ps2.c to ps2.h
>    ps2: improve function prototypes in ps2.c and ps2.h
>    ps2: introduce PS2DeviceClass
>    ps2: implement ps2_reset() for the PS2_DEVICE QOM type based upon
>      ps2_common_reset()
>    ps2: remove duplicate setting of scancode_set in ps2_kbd_init()
>    ps2: implement ps2_kbd_realize() and use it to register
>      ps2_keyboard_handler
>    ps2: implement ps2_mouse_realize() and use it to register
>      ps2_mouse_handler
>    ps2: don't use vmstate_register() in ps2_kbd_init()
>    ps2: don't use vmstate_register() in ps2_mouse_init()
>    pl050: checkpatch fixes
>    pl050: split pl050_update_irq() into separate pl050_set_irq() and
>      pl050_update_irq() functions
>    lasips2: spacing fixes
>    lasips2: rename ps2dev_update_irq() to lasips2_port_set_irq()
>    pckbd: checkpatch fixes
>    pckbd: move KBDState from pckbd.c to i8042.h
>    pckbd: move ISAKBDState from pckbd.c to i8042.h
>    pckbd: introduce new I8042_MMIO QOM type
>    pckbd: implement i8042_mmio_reset() for I8042_MMIO device
>    pckbd: add mask qdev property to I8042_MMIO device
>    pckbd: add size qdev property to I8042_MMIO device
>    pckbd: implement i8042_mmio_realize() function
>    pckbd: implement i8042_mmio_init() function
>    pckbd: alter i8042_mm_init() to return a I8042_MMIO device
>    pckbd: move mapping of I8042_MMIO registers to MIPS magnum machine
>    pckbd: more vmstate_register() from i8042_mm_init() to
>      i8042_mmio_realize()
>    pckbd: move ps2_kbd_init() and ps2_mouse_init() to
>      i8042_mmio_realize()
>    ps2: make ps2_raise_irq() function static
>    ps2: use ps2_raise_irq() instead of calling update_irq() directly
>    ps2: introduce ps2_lower_irq() instead of calling update_irq()
>      directly
>    ps2: add gpio for output IRQ and optionally use it in ps2_raise_irq()
>      and ps2_lower_irq()
>    pckbd: replace irq_kbd and irq_mouse with qemu_irq array in KBDState
>    pl050: switch over from update_irq() function to PS2 device gpio
>    lasips2: QOMify LASIPS2State
>    lasips2: move lasips2 QOM types from lasips2.c to lasips2.h
>    lasips2: rename lasips2_init() to lasips2_initfn() and update it to
>      return the LASIPS2 device
>    lasips2: implement lasips2_init() function
>    lasips2: move mapping of LASIPS2 registers to HPPA machine
>    lasips2: move initialisation of PS2 ports from lasi_initfn() to
>      lasi_init()
>    lasips2: add base property
>    lasips2: implement lasips2_realize()
>    lasips2: use qdev gpio for output IRQ
>    lasips2: switch over from update_irq() function to PS2 device gpio
>    pckbd: switch I8042_MMIO device from update_irq() function to PS2
>      device gpio
>    pckbd: add i8042_reset() function to I8042 device
>    pckbd: switch I8042 device from update_irq() function to PS2 device
>      gpio
>    ps2: remove update_irq() function and update_arg parameter
> 
>   hw/hppa/machine.c          |  11 +-
>   hw/input/lasips2.c         | 110 +++++---
>   hw/input/pckbd.c           | 321 ++++++++++++++++--------
>   hw/input/pl050.c           |  50 ++--
>   hw/input/ps2.c             | 500 +++++++++++++++++++++----------------
>   hw/mips/jazz.c             |  11 +-
>   include/hw/input/i8042.h   |  54 +++-
>   include/hw/input/lasips2.h |  27 +-
>   include/hw/input/ps2.h     |  79 +++++-
>   9 files changed, 775 insertions(+), 388 deletions(-)

Ping? I've had an R-B from Phil for patches 1-20 along with a Tested-by from Helge 
for the entire series, but that still leaves the last 30 patches unreviewed...


ATB,

Mark.

