Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69622563A12
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 21:38:56 +0200 (CEST)
Received: from localhost ([::1]:60572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7MTf-0008Eq-32
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 15:38:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1o7MSa-0007LX-RL; Fri, 01 Jul 2022 15:37:48 -0400
Received: from mout.gmx.net ([212.227.15.19]:46327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1o7MSY-0005d8-S1; Fri, 01 Jul 2022 15:37:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656704257;
 bh=mTRYlqPld9bnDVJe8uwGh2sy9qi/4PKywxxyJZIRnl0=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=jhUH4Lu9Dxcnwu4idKToEdwVVP8N88Pm6pJpx0OjuY4wA2Uc8fAZqNEgRH+0UF4KH
 mUHi8zuxcDRswhX2MbCjT1XzHO1XaVo6Qu9Iu00GOujdHPghqPhJXSTGWCUBQ8R8aq
 GTuaJj7Qza93TpVylFOvpp76fILnW7w71PutY0js=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.182.192]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtwZ4-1nmWFw3cgW-00uHaT; Fri, 01
 Jul 2022 21:37:36 +0200
Message-ID: <df36fc56-cb08-5570-5f66-5f0a12c55396@gmx.de>
Date: Fri, 1 Jul 2022 21:37:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 00/40] PS2 device QOMification - part 2
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 richard.henderson@linaro.org, svens@stackframe.org, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:u2RDyGRVIt5yhEPAcgBiC4LatFj2eB4JewSuvjI98Dm47M2m9bZ
 +CaQTgEClrgfJQfluaVBLajbg+6ken528cjJ4T0weIUzZm+lvWOF38AV7xpKMzUun6VpX6t
 /7+LQIuy3Kfdn6ES/FlQuHw9u81V6V8nhqxwf7fHuoKzwYAu9bKPjrAWOEdY3opqecwCFRi
 TUfczJQKVeQ8K5GCbd/Og==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wevI0BucazY=:iC05JplkNRfmtFqg2o5qLf
 wTsvxjpNTRD/GsGkhqYkzdmp3CMh8w7+hUIQ1ruiAJdy5/rIB/hoGfVgaarDSYscxpri2WzSr
 Ns70e0J19pMVGsURNpgBr1B6NLYDT+vF/cqVRHQqqLfu1NNNgaMzGpZIn0fwld8Ks1+JfysGp
 AeQs5EOfD0YO2zI7l6tlFViDonUbjMEV9nq7cmVba1MALmYx3upTw0JG6g7xF58iYeyRV9WhZ
 xvfJ5kMjAe7SK+tNq72gb1kDuyd9jlTJ/8MVQY8er22X4WZi/+PrGAgzQW126C3Vh/FNgnFDr
 KnNasDnIvwX7Ix5hsBNC0VCGysEBLhIBvHqazB2YaDRlJYHbBhltr89ImdwWq3h+W0bIR/T2L
 5aGMXZ+Zad3A6y9GCc53Oa7ONd0s2m8AFng5D6q40OgPcdGMHDFQw29eY0uysqH51FtnmtcH2
 b2PDW99atqty0I0MbBYsvvS6zWVi+ZlegWASsy1Jy158YBdQzCQ7QHr3RcYXJU6ziEqv10IWA
 L2jEBZLXdrDbf5msZT2y/BqZ0hqp7DEhhGwqz/+Y4+4JSIyQA0w9HMknWYwuFFszm+KxOaGMp
 CFeUS5VPu1N7V/wMFJbG1vAQNnvxcQzI2CKiT7ChLIo3cWP0CeLkli2pamzeVL4Xmx2YIexbk
 aYStHZY+cwjhXBjBst1Kkdg/trbgs3wIMT+b/9AlVTbYIDjSgTWMNC4PrRkqOPOAQ1rwtStT2
 VrQ/TIt0A9IG/cazFatudwcs0S8A/PSfaxI5pEEhFGcPEcG2O2Pccr1L9wbzHUL9R6AZp8h2z
 u0EaB5iov23fPTchzUYmpqgeO8UEMLly4znvt9yIbd5H/iB0eKIbT9rZCP9xYH30byZYq0P0y
 RGnCqwGnVpHRJNxEC8B6pBDhbe5lMpeMu0oglofgSdfnxGHf1uxsFtLSTUueWoYjq7h2as1JY
 v9s2yPIorbtikBq+2EFBxykBDj1A8x+1XIQN7SKihqarF6QpTiMnGqF1aNIryxZJzu8O+Cn3E
 hWaStQ1SYIl1rg3jGj/1sv2YlNRk40IfLiC5AWqhL/FQmJBtpGjfi358DLTCJR8WCeJJSbAcp
 B937b7nnBDZfTOwmO00xhqjZicALx7qzCbJXkm2oSqbAh2k0U9QyuDucw==
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
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

On 6/29/22 14:39, Mark Cave-Ayland wrote:
> Here is the follow-on series from part 1 which completes the work to rem=
ove
> the legacy global device init functions for PS2 devices. Now that part 1=
 has
> been applied, the hard part to remove the PS2 function callback and argu=
ment
> has been completed and all that remains is to improve the PS2 device
> QOMification to allow the legacy PS2 functions to be removed.
>
> Patches 1-11 update the pl050 device to remove the use of ps2_kbd_init()=
 and
> ps2_mouse_init(), whilst patches 12-34 make some more involved changes t=
o
> the lasips2 device (in particular completing the LASIPS2Port abstraction=
)
> before doing the same.
>
> Finally patches 35-40 complete the process for the pckbd (I8042 and I804=
2_MMIO
> devices) before removing the now unused ps2_kbd_init(), ps2_mouse_init()=
 and
> i8042_mm_init() functions.
>
> Note that this series is a migration break for the HPPA B160L and MIPS m=
agnum
> machines: I've had agreement from both Helge and Herv=C3=A9 that this is=
 worth
> doing to allow the use of the DeviceClass vmsd property to set the
> VMStateDescription rather than manually calling vmstate_register().
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

I did tested this patch series successfully with hppa Linux and HP-UX gues=
ts.
PS/2 mouse and keyboard works as expected.
Thanks for this nice cleanup work!

You may add either or both of:
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>

Helge


>
> Mark Cave-Ayland (40):
>   pl050: move PL050State from pl050.c to new pl050.h header file
>   pl050: rename pl050_keyboard_init() to pl050_kbd_init()
>   pl050: change PL050State dev pointer from void to PS2State
>   pl050: introduce new PL050_KBD_DEVICE QOM type
>   pl050: introduce new PL050_MOUSE_DEVICE QOM type
>   pl050: move logic from pl050_realize() to pl050_init()
>   pl050: introduce PL050DeviceClass for the PL050 device
>   pl050: introduce pl050_kbd_class_init() and pl050_kbd_realize()
>   pl050: introduce pl050_mouse_class_init() and pl050_mouse_realize()
>   pl050: don't use legacy ps2_kbd_init() function
>   pl050: don't use legacy ps2_mouse_init() function
>   lasips2: don't use vmstate_register() in lasips2_realize()
>   lasips2: remove the qdev base property and the lasips2_properties
>     array
>   lasips2: remove legacy lasips2_initfn() function
>   lasips2: change LASIPS2State dev pointer from void to PS2State
>   lasips2: QOMify LASIPS2Port
>   lasips2: introduce new LASIPS2_KBD_PORT QOM type
>   lasips2: introduce new LASIPS2_MOUSE_PORT QOM type
>   lasips2: move keyboard port initialisation to new
>     lasips2_kbd_port_init() function
>   lasips2: move mouse port initialisation to new
>     lasips2_mouse_port_init() function
>   lasips2: introduce lasips2_kbd_port_class_init() and
>     lasips2_kbd_port_realize()
>   lasips2: introduce lasips2_mouse_port_class_init() and
>     lasips2_mouse_port_realize()
>   lasips2: rename LASIPS2Port irq field to birq
>   lasips2: introduce port IRQ and new lasips2_port_init() function
>   lasips2: introduce LASIPS2PortDeviceClass for the LASIPS2_PORT device
>   lasips2: add named input gpio to port for downstream PS2 device IRQ
>   lasips2: add named input gpio to handle incoming port IRQs
>   lasips2: switch to using port-based IRQs
>   lasips2: rename LASIPS2Port parent pointer to lasips2
>   lasips2: standardise on lp name for LASIPS2Port variables
>   lasips2: switch register memory region to DEVICE_BIG_ENDIAN
>   lasips2: don't use legacy ps2_kbd_init() function
>   lasips2: don't use legacy ps2_mouse_init() function
>   lasips2: update VMStateDescription for LASIPS2 device
>   pckbd: introduce new vmstate_kbd_mmio VMStateDescription for the
>     I8042_MMIO device
>   pckbd: don't use legacy ps2_kbd_init() function
>   ps2: remove unused legacy ps2_kbd_init() function
>   pckbd: don't use legacy ps2_mouse_init() function
>   ps2: remove unused legacy ps2_mouse_init() function
>   pckbd: remove legacy i8042_mm_init() function
>
>  hw/hppa/machine.c          |   7 +-
>  hw/input/lasips2.c         | 320 ++++++++++++++++++++++++++-----------
>  hw/input/pckbd.c           |  82 ++++++----
>  hw/input/pl050.c           | 112 ++++++++-----
>  hw/input/ps2.c             |  26 ---
>  hw/input/trace-events      |   2 -
>  hw/mips/jazz.c             |  13 +-
>  include/hw/input/i8042.h   |   7 +-
>  include/hw/input/lasips2.h |  57 +++++--
>  include/hw/input/pl050.h   |  59 +++++++
>  include/hw/input/ps2.h     |   2 -
>  11 files changed, 466 insertions(+), 221 deletions(-)
>  create mode 100644 include/hw/input/pl050.h
>


