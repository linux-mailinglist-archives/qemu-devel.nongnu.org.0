Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9320D536B18
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 08:21:12 +0200 (CEST)
Received: from localhost ([::1]:39960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nupp1-0007sY-2q
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 02:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nupkL-0005KY-2d; Sat, 28 May 2022 02:16:21 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nupkE-0001HH-7W; Sat, 28 May 2022 02:16:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BMFhhpKezurQ8SUWM8viUWQm/Im6JnvY0IbCbRR/1qo=; b=lmyPsdxuUUAROBum7lNvaxGqg5
 4hSEl/+p2jPWnDOlf9Jf5cAnnT8i/WYwOc0gHmVd4l/ochQMDTEOM/qdxRlacHIipol7dPV2kFYII
 ewJeQC+xUy16JNMVNR51lqnSih5uMKV1cg4GdOKgsofSPmRPoB/YXzPHoM63OLYetwUyunf3uyz77
 6Js0eCNO/sLwCGNqfqcJGsymW+v1cyl4tEd6Yvacc1Uw9iVjgLmQnQVoRsJ2UfO6fb3aBmXuJ8gkb
 kqcUVTBdI3cko2eJyn5smlG9S83XMHvu9KWxOspf5ODXd1scY0hkjyCU/vtY1D3gRDPT1QalQ8Cva
 gIT7kU0qDGqxDkkvkvt7oWCzozAKdt8uZYu9nO22u0z/lB2MmvyFpUp3QeT3Nho4QyeOw2RR+mFrn
 6tc9TqZP27A5vqIUlqSex6aqchfdQPtWjTbTtu0t65BcOV8bhbaGsG8sZm1AJYNby6SW5fe+hQjVa
 7s4MUQdUv3shsPuxWHJlI0Tu3lkEuQC7LGfD07QLQDtwx7W+uTFzWX97jl+4zZNdnnQbgYX5PDAJi
 ZeN18cHrxO3eg48ol3CrbAKIHamkLr6Kfwku7FoSeqbeRs+lQQ8aWjRd7kAv9U+u6KBGt7iC8IMUw
 1Nnb4ZLkYm9Fkqz5iu4sSOqvG9H3dx9tYvsfeGLQU=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nupiv-0002jC-EH; Sat, 28 May 2022 07:14:57 +0100
Message-ID: <a19d1e0b-d1e1-cb95-695c-ebeadfc1d33c@ilande.co.uk>
Date: Sat, 28 May 2022 07:15:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, richard.henderson@linaro.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <31ca8828-9b69-42da-7e0a-d1e3c5db2f08@gmx.de>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <31ca8828-9b69-42da-7e0a-d1e3c5db2f08@gmx.de>
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

On 24/05/2022 19:25, Helge Deller wrote:

> Hi Mark,
> 
> On 5/22/22 20:17, Mark Cave-Ayland wrote:
>> This series came about when looking at improving the LASI PS2 device for
>> the HPPA machine: there were improvements that I was keen to make, but
>> was restricted because the PS2 device(s) weren't QOMified.
>>
>> Trying to do everything in a single patchset would be a very large series
>> indeed, so here is part 1 of the series which does the basic QOMification
>> process and consists of:
>>
>> - QOMifying the basic PS2, PS2 keyboard and PS2 mouse types
>>
>> - Moving any functionality that exists in a global device init function
>>    directly into the relevant device, so that all device behaviour is
>>    configured using qdev properties and QOM
>>
>> - Introducing a new I8042_MMIO type for use by the MIPS magnum machine
>>
>> - Switch all PS2 devices to use qdev gpios for IRQs instead of using the
>>    update_irq() callback function along with the update_arg opaque
>>
>> Once this work has been done, a follow-up part 2 series will finish the
>> remainder of the work which involves i) improving the QOM object model
>> now QOMification is complete and ii) removing the legacy global device
>> init functions for PS2 and related devices.
>>
>> Testing for this series has comprised of booting a machine with each type
>> of PS2 device and confirming that i) the machine responds to keypresses
>> when using a graphical console and ii) completing a successful migration
>> from a machine with this series applies back to a machine running latest
>> git master. The test machines I used were:
>>
>> - qemu-system-x86_64 -M pc for the I8042 device
>> - qemu-system-hppa for the LASIPS2 device
>> - qemu-system-arm -M versatilepb for the PL050 device
>> - qemu-system-mips64el -M magnum for the I8042_MMIO device
>>
>> Finally the QOM tree changes caused by QOMification of the PS2 devices
>> trigger a failure due to a bug in the bios-tables-test qtest for subtest
>> /x86_64/acpi/q35/viot. This can be fixed by applying the series at
>> https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg04266.html
>> "hw/acpi/viot: generate stable VIOT ACPI tables" first.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> Thanks a lot for this QOMifying and cleanup work!
> I've sucessfully tested it with qemu-system-hppa for HP-UX 10 and 11.

Thanks for testing! As mentioned in the cover letter, in part 1 it's just a very 
basic conversion for now to keep the size of the series down - part 2 is where the 
magic happens :)

> You may add either or both of:
> 
> Acked-by: Helge Deller <deller@gmx.de>
> Tested-by: Helge Deller <deller@gmx.de>
> 
> Thank you!
> Helge
> 
> 
>>
>>
>> Mark Cave-Ayland (50):
>>    ps2: checkpatch fixes
>>    ps2: QOMify PS2State
>>    ps2: QOMify PS2KbdState
>>    ps2: QOMify PS2MouseState
>>    ps2: move QOM type definitions from ps2.c to ps2.h
>>    ps2: improve function prototypes in ps2.c and ps2.h
>>    ps2: introduce PS2DeviceClass
>>    ps2: implement ps2_reset() for the PS2_DEVICE QOM type based upon
>>      ps2_common_reset()
>>    ps2: remove duplicate setting of scancode_set in ps2_kbd_init()
>>    ps2: implement ps2_kbd_realize() and use it to register
>>      ps2_keyboard_handler
>>    ps2: implement ps2_mouse_realize() and use it to register
>>      ps2_mouse_handler
>>    ps2: don't use vmstate_register() in ps2_kbd_init()
>>    ps2: don't use vmstate_register() in ps2_mouse_init()
>>    pl050: checkpatch fixes
>>    pl050: split pl050_update_irq() into separate pl050_set_irq() and
>>      pl050_update_irq() functions
>>    lasips2: spacing fixes
>>    lasips2: rename ps2dev_update_irq() to lasips2_port_set_irq()
>>    pckbd: checkpatch fixes
>>    pckbd: move KBDState from pckbd.c to i8042.h
>>    pckbd: move ISAKBDState from pckbd.c to i8042.h
>>    pckbd: introduce new I8042_MMIO QOM type
>>    pckbd: implement i8042_mmio_reset() for I8042_MMIO device
>>    pckbd: add mask qdev property to I8042_MMIO device
>>    pckbd: add size qdev property to I8042_MMIO device
>>    pckbd: implement i8042_mmio_realize() function
>>    pckbd: implement i8042_mmio_init() function
>>    pckbd: alter i8042_mm_init() to return a I8042_MMIO device
>>    pckbd: move mapping of I8042_MMIO registers to MIPS magnum machine
>>    pckbd: more vmstate_register() from i8042_mm_init() to
>>      i8042_mmio_realize()
>>    pckbd: move ps2_kbd_init() and ps2_mouse_init() to
>>      i8042_mmio_realize()
>>    ps2: make ps2_raise_irq() function static
>>    ps2: use ps2_raise_irq() instead of calling update_irq() directly
>>    ps2: introduce ps2_lower_irq() instead of calling update_irq()
>>      directly
>>    ps2: add gpio for output IRQ and optionally use it in ps2_raise_irq()
>>      and ps2_lower_irq()
>>    pckbd: replace irq_kbd and irq_mouse with qemu_irq array in KBDState
>>    pl050: switch over from update_irq() function to PS2 device gpio
>>    lasips2: QOMify LASIPS2State
>>    lasips2: move lasips2 QOM types from lasips2.c to lasips2.h
>>    lasips2: rename lasips2_init() to lasips2_initfn() and update it to
>>      return the LASIPS2 device
>>    lasips2: implement lasips2_init() function
>>    lasips2: move mapping of LASIPS2 registers to HPPA machine
>>    lasips2: move initialisation of PS2 ports from lasi_initfn() to
>>      lasi_init()
>>    lasips2: add base property
>>    lasips2: implement lasips2_realize()
>>    lasips2: use qdev gpio for output IRQ
>>    lasips2: switch over from update_irq() function to PS2 device gpio
>>    pckbd: switch I8042_MMIO device from update_irq() function to PS2
>>      device gpio
>>    pckbd: add i8042_reset() function to I8042 device
>>    pckbd: switch I8042 device from update_irq() function to PS2 device
>>      gpio
>>    ps2: remove update_irq() function and update_arg parameter
>>
>>   hw/hppa/machine.c          |  11 +-
>>   hw/input/lasips2.c         | 110 +++++---
>>   hw/input/pckbd.c           | 321 ++++++++++++++++--------
>>   hw/input/pl050.c           |  50 ++--
>>   hw/input/ps2.c             | 500 +++++++++++++++++++++----------------
>>   hw/mips/jazz.c             |  11 +-
>>   include/hw/input/i8042.h   |  54 +++-
>>   include/hw/input/lasips2.h |  27 +-
>>   include/hw/input/ps2.h     |  79 +++++-
>>   9 files changed, 775 insertions(+), 388 deletions(-)


ATB,

Mark.

