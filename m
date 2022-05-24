Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 655CF53306A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 20:29:14 +0200 (CEST)
Received: from localhost ([::1]:51530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntZHM-0005xN-SG
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 14:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1ntZEF-00056p-Jo; Tue, 24 May 2022 14:25:59 -0400
Received: from mout.gmx.net ([212.227.15.18]:55719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1ntZE8-0008GF-Td; Tue, 24 May 2022 14:25:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1653416735;
 bh=HDFpH32KMJlqvy6JupuFi39XQEFbREIvEWvoptgj6/E=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=WkX/91xPE5SANL8Gk0CoVV2d+OJRPOvwf2+OxvA6YNd7x8KxRXhJav/PZfFjIcjya
 +rGGe+erQaZOlO5i0Q7NsjwBzSlkrUOEdv/nH1RVmGlNFg8PorxbC0h4B2GuD7OGM8
 5Ta98FQo4Uub3DDEXvEF2pnbRsNL91fp3xR/2A8Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.137.3]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCKBc-1o2sd32r5e-009Tpn; Tue, 24
 May 2022 20:25:35 +0200
Message-ID: <31ca8828-9b69-42da-7e0a-d1e3c5db2f08@gmx.de>
Date: Tue, 24 May 2022 20:25:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 00/50] PS2 device QOMification - part 1
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 richard.henderson@linaro.org, mst@redhat.com, pbonzini@redhat.com,
 peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:t/2OLZSraRGEp4JKkAnLW6fqvIwXy51PMS9NGHLkoC7AhO76KHC
 hiRL70Qu+ZY4sbVI0eN9+ZRT+rBG2eKJh/OLpnFh+vJFk6LMy67j66ipW4cciyCX/0ul6Ww
 1vPbZ7PI6AGfyuXACzI7MoJeOBjWllibkKvccxpYvYw23/kOefhA8UK4WaUyheKzMp2+q23
 i/+4+6EYoC781rH8HmSeQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Dxtp4/593z0=:/aYFurSEiiSwMC1I1YJhwI
 /ikrdaCDwA0M6lsPxhTQygDdwxhf9rkgGMeL/D9NurTTyambYYG7gXFriT+vx64CUZjHllM2n
 o6EZyWnEf7WTrC0nIcC5bzPw6CDw4rMoWkjdoDWETNse5UuF41HSSZ7cYaYLZpftl76Fdlkba
 IKtwH8Z9TQ8ijv3x69CpsMrg56xZ28cQKHGYm8BbaSnydYUM90KFkEkUzuCFMNmobEPO1RH3m
 vjHOeELIrZ2bDG6DMQeRc+Jow+4kVj/maeWsw5pV69hVW5FBTvcAm6NuidIyTbCFvCpWkDt9p
 V/msi6UUYhvZTF4SbUjhd05PiBu4j78Imt4MT8XlMI1Mi9AjSiZlWJrqQ0zuBraUnVksYMKLn
 y4TTuWBUAiG2tUihfxa/zRWCxk7bArSxbWvBfnqKkUuDAZ3nmabHYeoKecsIFc88Lzi+wtuVk
 aMJDhUwPQ+9RxyJnuIGuM1EGkR3RPuYrA4ZFH+oiaP+eERecOhoHqqXTnNOBvszxfYaE7OmUl
 VisHKR7Ce5sWzgBjpIdorcAdR+KQzz2F2j+dFIxk4rHjbgxjf61qz20TmgAPWJM7HXlDD1XPP
 1D2GDQlDnySyGvydqfdarhMUPkhTY4bB9yLkRCvE/ZowjhHALslutPxPnUYc7ARCJByG2rfES
 O1xKMK+Yq3mZGcx9JE0sZDUD+doS5YfY7YGeCfsnAK4vG4cyp8jGivj0+/HG4IBre/B5SDuqr
 zsyMSAW6BYhMn7jECSl8loFGINFx/Yvq4hDMvwHOsZrSJwm+s/OIsygw5D54D4lBxyCen8kRb
 dbZUatekH2fculaJTsVQooNKYxR8gUe0w5h0NXzSWTO7+TqqhfUGTm1QEop2mHh4ovM0LUg+u
 Zd5ObXecUPu4lvqzKGHHmKXqQ28dZPVaz5QxQMpOH3afIEFJSTa246dOOyUaCVfKpsDP7USJw
 RHr+Bvv1g4hvu5qUke634EhBayls3cWiIl4BnZDWee1HTqPfWTO1kADBmAAVAX2R8LUzQejWp
 gcvya9BPaMIAkEhiv2Vmo5S4FpIoRI5ZvdutQbTwS1p3KG+LuptTXkAdJu2W2/gFruXhaQmPB
 pbyI+i4IJE8MINpnus3yJne/pxXHwg4e9zD
Received-SPF: pass client-ip=212.227.15.18; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Mark,

On 5/22/22 20:17, Mark Cave-Ayland wrote:
> This series came about when looking at improving the LASI PS2 device for
> the HPPA machine: there were improvements that I was keen to make, but
> was restricted because the PS2 device(s) weren't QOMified.
>
> Trying to do everything in a single patchset would be a very large serie=
s
> indeed, so here is part 1 of the series which does the basic QOMificatio=
n
> process and consists of:
>
> - QOMifying the basic PS2, PS2 keyboard and PS2 mouse types
>
> - Moving any functionality that exists in a global device init function
>   directly into the relevant device, so that all device behaviour is
>   configured using qdev properties and QOM
>
> - Introducing a new I8042_MMIO type for use by the MIPS magnum machine
>
> - Switch all PS2 devices to use qdev gpios for IRQs instead of using the
>   update_irq() callback function along with the update_arg opaque
>
> Once this work has been done, a follow-up part 2 series will finish the
> remainder of the work which involves i) improving the QOM object model
> now QOMification is complete and ii) removing the legacy global device
> init functions for PS2 and related devices.
>
> Testing for this series has comprised of booting a machine with each typ=
e
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

Thanks a lot for this QOMifying and cleanup work!
I've sucessfully tested it with qemu-system-hppa for HP-UX 10 and 11.

You may add either or both of:

Acked-by: Helge Deller <deller@gmx.de>
Tested-by: Helge Deller <deller@gmx.de>

Thank you!
Helge


>
>
> Mark Cave-Ayland (50):
>   ps2: checkpatch fixes
>   ps2: QOMify PS2State
>   ps2: QOMify PS2KbdState
>   ps2: QOMify PS2MouseState
>   ps2: move QOM type definitions from ps2.c to ps2.h
>   ps2: improve function prototypes in ps2.c and ps2.h
>   ps2: introduce PS2DeviceClass
>   ps2: implement ps2_reset() for the PS2_DEVICE QOM type based upon
>     ps2_common_reset()
>   ps2: remove duplicate setting of scancode_set in ps2_kbd_init()
>   ps2: implement ps2_kbd_realize() and use it to register
>     ps2_keyboard_handler
>   ps2: implement ps2_mouse_realize() and use it to register
>     ps2_mouse_handler
>   ps2: don't use vmstate_register() in ps2_kbd_init()
>   ps2: don't use vmstate_register() in ps2_mouse_init()
>   pl050: checkpatch fixes
>   pl050: split pl050_update_irq() into separate pl050_set_irq() and
>     pl050_update_irq() functions
>   lasips2: spacing fixes
>   lasips2: rename ps2dev_update_irq() to lasips2_port_set_irq()
>   pckbd: checkpatch fixes
>   pckbd: move KBDState from pckbd.c to i8042.h
>   pckbd: move ISAKBDState from pckbd.c to i8042.h
>   pckbd: introduce new I8042_MMIO QOM type
>   pckbd: implement i8042_mmio_reset() for I8042_MMIO device
>   pckbd: add mask qdev property to I8042_MMIO device
>   pckbd: add size qdev property to I8042_MMIO device
>   pckbd: implement i8042_mmio_realize() function
>   pckbd: implement i8042_mmio_init() function
>   pckbd: alter i8042_mm_init() to return a I8042_MMIO device
>   pckbd: move mapping of I8042_MMIO registers to MIPS magnum machine
>   pckbd: more vmstate_register() from i8042_mm_init() to
>     i8042_mmio_realize()
>   pckbd: move ps2_kbd_init() and ps2_mouse_init() to
>     i8042_mmio_realize()
>   ps2: make ps2_raise_irq() function static
>   ps2: use ps2_raise_irq() instead of calling update_irq() directly
>   ps2: introduce ps2_lower_irq() instead of calling update_irq()
>     directly
>   ps2: add gpio for output IRQ and optionally use it in ps2_raise_irq()
>     and ps2_lower_irq()
>   pckbd: replace irq_kbd and irq_mouse with qemu_irq array in KBDState
>   pl050: switch over from update_irq() function to PS2 device gpio
>   lasips2: QOMify LASIPS2State
>   lasips2: move lasips2 QOM types from lasips2.c to lasips2.h
>   lasips2: rename lasips2_init() to lasips2_initfn() and update it to
>     return the LASIPS2 device
>   lasips2: implement lasips2_init() function
>   lasips2: move mapping of LASIPS2 registers to HPPA machine
>   lasips2: move initialisation of PS2 ports from lasi_initfn() to
>     lasi_init()
>   lasips2: add base property
>   lasips2: implement lasips2_realize()
>   lasips2: use qdev gpio for output IRQ
>   lasips2: switch over from update_irq() function to PS2 device gpio
>   pckbd: switch I8042_MMIO device from update_irq() function to PS2
>     device gpio
>   pckbd: add i8042_reset() function to I8042 device
>   pckbd: switch I8042 device from update_irq() function to PS2 device
>     gpio
>   ps2: remove update_irq() function and update_arg parameter
>
>  hw/hppa/machine.c          |  11 +-
>  hw/input/lasips2.c         | 110 +++++---
>  hw/input/pckbd.c           | 321 ++++++++++++++++--------
>  hw/input/pl050.c           |  50 ++--
>  hw/input/ps2.c             | 500 +++++++++++++++++++++----------------
>  hw/mips/jazz.c             |  11 +-
>  include/hw/input/i8042.h   |  54 +++-
>  include/hw/input/lasips2.h |  27 +-
>  include/hw/input/ps2.h     |  79 +++++-
>  9 files changed, 775 insertions(+), 388 deletions(-)
>


