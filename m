Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A46CB53320E
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 21:56:47 +0200 (CEST)
Received: from localhost ([::1]:49758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntae6-0003SY-FN
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 15:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ntabm-0001hK-Uy
 for qemu-devel@nongnu.org; Tue, 24 May 2022 15:54:22 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:42757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ntabj-000886-SZ
 for qemu-devel@nongnu.org; Tue, 24 May 2022 15:54:22 -0400
Received: by mail-ed1-x530.google.com with SMTP id s3so24382313edr.9
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 12:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y8SEVWmU3X0T6NrIuYpavPulMy+4SBOR0A54mHPRDoA=;
 b=PM3M4mf5COoToISeBTQaqvF+9oy6VDs1m36PISV0GCg0uvdZodWMu4MYbhknsbQ36T
 jZ6FfCdMRZuaXvkOgMFxGQfQPrqcIeXSHFgLuafnhhF0cf1EoH/PN6f00+d58+309CrN
 vZVVwZ5S5QH4HGywt6t36K5vI9/GmBRqg7rI2Re04RjixETRuutZ6PyDtfzTMlD0XqtA
 jX3Zd8mYYvYQUfvj/FeimH7cizEqh60H7F6qY1ssEvLwHnCZ/Cu8iKl+s8jKZI7fQyff
 CnpFHeswmXf3L8Ko1Bx5wSfR8vySH8tEBVgghrEn0LKT26D5C5bGu10BuFaNYTNdnfMo
 zUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y8SEVWmU3X0T6NrIuYpavPulMy+4SBOR0A54mHPRDoA=;
 b=ydXKyYRbrhAYwKcmaTcYHOIdNYsSvfdvtcOBp3w7Ele00b8VeA2y41Gxf5QLQly7St
 Kr62QMTICDeB4nj23xVn/7AOjhdDn39mmPcKDdf5gRixoGV0xsS9RwTIaUJx2saRo4TT
 3GtYm+AeCnRw6QoO2oxPIUwE3O3zGtX/Zx+H9a1k/yZVDvJTdH42Yc7QAn6OSZc1c8aZ
 +4HPvdZTNICYf0+f5Q/rYpaPdWAvAlKt/vzJ2nVzjB+HbyRggxrcFzqvqWI4qFoQcJhd
 37PTOxC4eZEb89nQ3t/5QRnl+esGi32ZHiR82HEAu8ZblgEXWmqCikA3mUx7gJRg8mad
 n5dw==
X-Gm-Message-State: AOAM530UYFlfC95t+AsdfY7GyfO9PX3+32Li4qiums/1PAPODg7dfW5b
 e4i9CKyQvxYRw0i0tNY/prM6VSWhyfjs5Ks9GglMRw==
X-Google-Smtp-Source: ABdhPJxzlMhzwHWo+PfTrAxE+oGdaNcEoFgWze9nZjeOTv7q2wuBsKaGDnqYegSqqwml9onc9Rpr7SlxKdroWgAsKvQ=
X-Received: by 2002:a05:6402:322a:b0:42a:cd87:b7c with SMTP id
 g42-20020a056402322a00b0042acd870b7cmr30515508eda.193.1653422057836; Tue, 24
 May 2022 12:54:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
 <94a413c6-9a4c-4068-a9e7-3979df440d9e@greensocs.com>
In-Reply-To: <94a413c6-9a4c-4068-a9e7-3979df440d9e@greensocs.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Wed, 25 May 2022 03:54:05 +0800
Message-ID: <CALw707opo56xWwme5h4yNyM=1+RKEQOMTaYYSdGE-5x+4UHK5A@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] Initial support for machine creation via QMP
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 mark.burton@greensocs.com, edgari@xilinx.com, 
 Eduardo Habkost <eduardo@habkost.net>, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Yanan Wang <wangyanan55@huawei.com>, Igor Mammedov <imammedo@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Eric Blake <eblake@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000006befa005dfc752ab"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=jim.shu@sifive.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

--0000000000006befa005dfc752ab
Content-Type: text/plain; charset="UTF-8"

Hi all,

Thanks for the work!

I'm from SiFive and we are very interested in this feature.
QMP/QAPI configurable QEMU machine is a useful feature in our use case.
With this feature, we can both model our versatile FPGA-based platforms
more easily and model a new platform without modification of source code.
It is helpful for early software development of SoC prototyping.
We think this feature is also helpful to the QEMU community.

Also, I have tested this patchset (v4) and newer v5 patchset [1] with
Damien's firmware [2] and it works correctly.

p.s. QMP option "-qmp socket,path=./qmpsocket,server" in v5 patchset
instruction may not work?
I use the option "-qmp unix:./qmpsocket,server" instead.

[1] [PATCH v5 0/6] QAPI support for device cold-plug
https://lore.kernel.org/qemu-devel/20220519153402.41540-1-damien.hedde@greensocs.com/

[2] Test firmware for patchset
v5: https://github.com/GreenSocs/qemu-qmp-machines/tree/master/arm-virt
v4:
https://github.com/GreenSocs/qemu-qmp-machines/tree/eba16dab8b587e624d65c5c302aeef424bece3a0

On Thu, Mar 3, 2022 at 7:02 PM Damien Hedde <damien.hedde@greensocs.com>
wrote:

> Ping !
>
> It would be good to have some feedback on 1st and 2nd part.
>
> Thanks,
> Damien
>
> On 2/23/22 10:06, Damien Hedde wrote:
> > Hi,
> >
> > This series adds initial support to build a machine using QMP/QAPI
> > commands. With this series, one can start from the 'none' machine,
> > create cpus, sysbus devices, memory map them and wire interrupts.
> >
> > Sorry for the huge cc list on this cover-letter. Apart from people
> > who attended the kvm call about this topic, I've cc'ed you only
> > according to MAINTAINERS file.
> >
> > The series is divided in 4 parts which are independent of each other,
> > but we need the 4 parts to be able to use this mechanism:
> > + Patches 1 to 6 allow to use the qapi command device_add to cold
> >    plug devices (like CLI -device do)
> > + Patches 7 to 10 modify the 'none' machine which serves as base
> >    machine.
> > + Patches 11 to 13 handle memory mapping and memory creation
> > + Patches 14 allows dynamic cold plug of opentitan/sifive_e machine
> >    to build some example. This last patch is based on a cleanup
> >    series: it probably works without it, but some config errors are
> >    not handled (see based-on below).
> >
> > Only patch 11 is reviewed-by.
> >
> > v4:
> > + cold plugging approach changed in order not to conflict with
> >    startup. I do not add additional command to handle this so that
> >    we can change everything easily.
> > + device_add in cold plug context is also now equivalent to -device
> >    CLI regarding -fw_cfg. I also added patches to modify the 'none'
> >    machine.
> > + reworked most of the none machine part
> > + updated the sybus-mmio-map command patch
> >
> > Note that there are still lot of limitations (for example if you try
> > to create more cpus than the _max_cpus_, tcg will abort()).
> > Basically all tasks done by machine init reading some parameters are
> > really tricky: for example, loading complex firmware. But we have to
> > start by something and all this is not accessible unless the user
> > asked for none machine and -preconfig.
> >
> > I can maintain the code introduced here. I'm not sure what's the
> > process. Is there something else to do than propose a patch to
> > MAINTAINERS ?
> > If there is a global agreement on moving on with these feature, it
> > would be great to have a login on qemu wiki so I can document
> > limitations and the work being done to solve them.
> >
> > A simple test can be done with the following scenario which build
> > a machine subset of the opentitan.
> >
> > $ cat commands.qmp
> > // RAM 0x10000000
> > device_add driver=sysbus-memory id=ram size=0x4000 readonly=false
> > sysbus-mmio-map device=ram addr=268435456
> > // CPUS
> > device_add driver=riscv.hart_array id=cpus
> cpu-type=lowrisc-ibex-riscv-cpu num-harts=1 resetvec=0x8080
> > // ROM 0x00008000
> > device_add driver=sysbus-memory id=rom size=0x4000 readonly=true
> > sysbus-mmio-map device=rom addr=32768
> > // PLIC 0x48000000
> > device_add driver=riscv.sifive.plic id=plic hart-config=M hartid-base=0
> num-sources=180 num-priorities=3 priority-base=0x0 pending-base=0x1000
> enable-base=0x2000 enable-stride=32 context-base=0x200000 context-stride=8
> aperture-size=0x4005000
> > sysbus-mmio-map device=plic addr=1207959552
> > qom-set path=plic property=unnamed-gpio-out[1]
> value=cpus/harts[0]/unnamed-gpio-in[11]
> > // UART 0x40000000
> > device_add driver=ibex-uart id=uart chardev=serial0
> > sysbus-mmio-map device=uart addr=1073741824
> > qom-set path=uart property=sysbus-irq[1] value=plic/unnamed-gpio-in[2]
> > // FIRMWARE
> > device_add driver=loader cpu-num=0 file=/path/to/firmware.elf
> > x-exit-preconfig
> >
> > $ qemu-system-riscv32 -display none -M none -preconfig -serial stdio
> -qmp unix:/tmp/qmp-sock,server
> >
> > In another terminal, you'll need to send the commands with, for example:
> > $ grep -v '^//' commands.qmp | qmp-shell /tmp/qmp-sock -v
> >
> > It is the same as running
> > $ qemu-system-riscv32 -display none -M opentitan -serial stdio -kernel
> path/to/firmware.elf
> >
> > If you need a firmware, you can pick this one
> >
> https://github.com/GreenSocs/qemu-qmp-machines/blob/master/opentitan-echo.elf
> > This firmware is just a small interrupt-based bare-metal program
> > echoing back whatever is sent in the uart.
> >
> > This repo contains also sifive_e machine example.
> >
> > Based-on: <20220218164646.132112-1-damien.hedde@greensocs.com>
> > "RiscV cleanups for user-related life cycles"
> >
> > Thanks for your comments,
> > --
> > Damien
> >
> > Damien Hedde (13):
> >    machine: add phase_get() and document phase_check()/advance()
> >    machine&vl: introduce phase_until() to handle phase transitions
> >    vl: support machine-initialized target in phase_until()
> >    qapi/device_add: compute is_hotplug flag
> >    qapi/device_add: handle the rom_order_override when cold-plugging
> >    none-machine: add the NoneMachineState structure
> >    none-machine: add 'ram-addr' property
> >    none-machine: allow cold plugging sysbus devices
> >    none-machine: allow several cpus
> >    softmmu/memory: add memory_region_try_add_subregion function
> >    add sysbus-mmio-map qapi command
> >    hw/mem/system-memory: add a memory sysbus device
> >    hw: set user_creatable on opentitan/sifive_e devices
> >
> > Mirela Grujic (1):
> >    qapi/device_add: Allow execution in machine initialized phase
> >
> >   qapi/qdev.json                 | 34 +++++++++++-
> >   include/exec/memory.h          | 22 ++++++++
> >   include/hw/mem/sysbus-memory.h | 28 ++++++++++
> >   include/hw/qdev-core.h         | 33 ++++++++++++
> >   hw/char/ibex_uart.c            |  1 +
> >   hw/char/sifive_uart.c          |  1 +
> >   hw/core/null-machine.c         | 68 ++++++++++++++++++++++--
> >   hw/core/qdev.c                 |  5 ++
> >   hw/core/sysbus.c               | 49 ++++++++++++++++++
> >   hw/gpio/sifive_gpio.c          |  1 +
> >   hw/intc/riscv_aclint.c         |  2 +
> >   hw/intc/sifive_plic.c          |  1 +
> >   hw/mem/sysbus-memory.c         | 80 +++++++++++++++++++++++++++++
> >   hw/misc/sifive_e_prci.c        |  8 +++
> >   hw/misc/unimp.c                |  1 +
> >   hw/riscv/riscv_hart.c          |  1 +
> >   hw/timer/ibex_timer.c          |  1 +
> >   monitor/misc.c                 |  2 +-
> >   softmmu/memory.c               | 23 ++++++---
> >   softmmu/qdev-monitor.c         | 20 +++++++-
> >   softmmu/vl.c                   | 94 ++++++++++++++++++++++++++--------
> >   hmp-commands.hx                |  1 +
> >   hw/mem/meson.build             |  2 +
> >   23 files changed, 439 insertions(+), 39 deletions(-)
> >   create mode 100644 include/hw/mem/sysbus-memory.h
> >   create mode 100644 hw/mem/sysbus-memory.c
> >
>
>

--0000000000006befa005dfc752ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<br><br>Thanks for the work!<br><br>I&#39;m from Si=
Five and we are very interested in this feature.<br>QMP/QAPI configurable Q=
EMU machine is a useful feature in our use case.<br>With this feature, we c=
an both model our versatile FPGA-based platforms more easily and model a ne=
w platform without modification of source code. It is helpful for early sof=
tware development of SoC prototyping.<br>We think this feature is also help=
ful to the QEMU community.<br><br>Also, I have tested this patchset (v4) an=
d newer v5 patchset [1] with Damien&#39;s firmware [2] and it works correct=
ly.<br><br>p.s. QMP option &quot;-qmp socket,path=3D./qmpsocket,server&quot=
; in v5 patchset instruction may not work?<br>I use the option &quot;-qmp u=
nix:./qmpsocket,server&quot; instead.<br><br>[1] [PATCH v5 0/6] QAPI suppor=
t for device cold-plug<br><a href=3D"https://lore.kernel.org/qemu-devel/202=
20519153402.41540-1-damien.hedde@greensocs.com/" target=3D"_blank">https://=
lore.kernel.org/qemu-devel/20220519153402.41540-1-damien.hedde@greensocs.co=
m/</a><br><br>[2] Test firmware for patchset<br>v5: <a href=3D"https://gith=
ub.com/GreenSocs/qemu-qmp-machines/tree/master/arm-virt" target=3D"_blank">=
https://github.com/GreenSocs/qemu-qmp-machines/tree/master/arm-virt</a><br>=
v4: <a href=3D"https://github.com/GreenSocs/qemu-qmp-machines/tree/eba16dab=
8b587e624d65c5c302aeef424bece3a0" target=3D"_blank">https://github.com/Gree=
nSocs/qemu-qmp-machines/tree/eba16dab8b587e624d65c5c302aeef424bece3a0</a><b=
r><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
hu, Mar 3, 2022 at 7:02 PM Damien Hedde &lt;<a href=3D"mailto:damien.hedde@=
greensocs.com" target=3D"_blank">damien.hedde@greensocs.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Ping !<br>
<br>
It would be good to have some feedback on 1st and 2nd part.<br>
<br>
Thanks,<br>
Damien<br>
<br>
On 2/23/22 10:06, Damien Hedde wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; This series adds initial support to build a machine using QMP/QAPI<br>
&gt; commands. With this series, one can start from the &#39;none&#39; mach=
ine,<br>
&gt; create cpus, sysbus devices, memory map them and wire interrupts.<br>
&gt; <br>
&gt; Sorry for the huge cc list on this cover-letter. Apart from people<br>
&gt; who attended the kvm call about this topic, I&#39;ve cc&#39;ed you onl=
y<br>
&gt; according to MAINTAINERS file.<br>
&gt; <br>
&gt; The series is divided in 4 parts which are independent of each other,<=
br>
&gt; but we need the 4 parts to be able to use this mechanism:<br>
&gt; + Patches 1 to 6 allow to use the qapi command device_add to cold<br>
&gt;=C2=A0 =C2=A0 plug devices (like CLI -device do)<br>
&gt; + Patches 7 to 10 modify the &#39;none&#39; machine which serves as ba=
se<br>
&gt;=C2=A0 =C2=A0 machine.<br>
&gt; + Patches 11 to 13 handle memory mapping and memory creation<br>
&gt; + Patches 14 allows dynamic cold plug of opentitan/sifive_e machine<br=
>
&gt;=C2=A0 =C2=A0 to build some example. This last patch is based on a clea=
nup<br>
&gt;=C2=A0 =C2=A0 series: it probably works without it, but some config err=
ors are<br>
&gt;=C2=A0 =C2=A0 not handled (see based-on below).<br>
&gt; <br>
&gt; Only patch 11 is reviewed-by.<br>
&gt; <br>
&gt; v4:<br>
&gt; + cold plugging approach changed in order not to conflict with<br>
&gt;=C2=A0 =C2=A0 startup. I do not add additional command to handle this s=
o that<br>
&gt;=C2=A0 =C2=A0 we can change everything easily.<br>
&gt; + device_add in cold plug context is also now equivalent to -device<br=
>
&gt;=C2=A0 =C2=A0 CLI regarding -fw_cfg. I also added patches to modify the=
 &#39;none&#39;<br>
&gt;=C2=A0 =C2=A0 machine.<br>
&gt; + reworked most of the none machine part<br>
&gt; + updated the sybus-mmio-map command patch<br>
&gt; <br>
&gt; Note that there are still lot of limitations (for example if you try<b=
r>
&gt; to create more cpus than the _max_cpus_, tcg will abort()).<br>
&gt; Basically all tasks done by machine init reading some parameters are<b=
r>
&gt; really tricky: for example, loading complex firmware. But we have to<b=
r>
&gt; start by something and all this is not accessible unless the user<br>
&gt; asked for none machine and -preconfig.<br>
&gt; <br>
&gt; I can maintain the code introduced here. I&#39;m not sure what&#39;s t=
he<br>
&gt; process. Is there something else to do than propose a patch to<br>
&gt; MAINTAINERS ?<br>
&gt; If there is a global agreement on moving on with these feature, it<br>
&gt; would be great to have a login on qemu wiki so I can document<br>
&gt; limitations and the work being done to solve them.<br>
&gt; <br>
&gt; A simple test can be done with the following scenario which build<br>
&gt; a machine subset of the opentitan.<br>
&gt; <br>
&gt; $ cat commands.qmp<br>
&gt; // RAM 0x10000000<br>
&gt; device_add driver=3Dsysbus-memory id=3Dram size=3D0x4000 readonly=3Dfa=
lse<br>
&gt; sysbus-mmio-map device=3Dram addr=3D268435456<br>
&gt; // CPUS<br>
&gt; device_add driver=3Driscv.hart_array id=3Dcpus cpu-type=3Dlowrisc-ibex=
-riscv-cpu num-harts=3D1 resetvec=3D0x8080<br>
&gt; // ROM 0x00008000<br>
&gt; device_add driver=3Dsysbus-memory id=3Drom size=3D0x4000 readonly=3Dtr=
ue<br>
&gt; sysbus-mmio-map device=3Drom addr=3D32768<br>
&gt; // PLIC 0x48000000<br>
&gt; device_add driver=3Driscv.sifive.plic id=3Dplic hart-config=3DM hartid=
-base=3D0 num-sources=3D180 num-priorities=3D3 priority-base=3D0x0 pending-=
base=3D0x1000 enable-base=3D0x2000 enable-stride=3D32 context-base=3D0x2000=
00 context-stride=3D8 aperture-size=3D0x4005000<br>
&gt; sysbus-mmio-map device=3Dplic addr=3D1207959552<br>
&gt; qom-set path=3Dplic property=3Dunnamed-gpio-out[1] value=3Dcpus/harts[=
0]/unnamed-gpio-in[11]<br>
&gt; // UART 0x40000000<br>
&gt; device_add driver=3Dibex-uart id=3Duart chardev=3Dserial0<br>
&gt; sysbus-mmio-map device=3Duart addr=3D1073741824<br>
&gt; qom-set path=3Duart property=3Dsysbus-irq[1] value=3Dplic/unnamed-gpio=
-in[2]<br>
&gt; // FIRMWARE<br>
&gt; device_add driver=3Dloader cpu-num=3D0 file=3D/path/to/firmware.elf<br=
>
&gt; x-exit-preconfig<br>
&gt; <br>
&gt; $ qemu-system-riscv32 -display none -M none -preconfig -serial stdio -=
qmp unix:/tmp/qmp-sock,server<br>
&gt; <br>
&gt; In another terminal, you&#39;ll need to send the commands with, for ex=
ample:<br>
&gt; $ grep -v &#39;^//&#39; commands.qmp | qmp-shell /tmp/qmp-sock -v<br>
&gt; <br>
&gt; It is the same as running<br>
&gt; $ qemu-system-riscv32 -display none -M opentitan -serial stdio -kernel=
 path/to/firmware.elf<br>
&gt; <br>
&gt; If you need a firmware, you can pick this one<br>
&gt; <a href=3D"https://github.com/GreenSocs/qemu-qmp-machines/blob/master/=
opentitan-echo.elf" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/GreenSocs/qemu-qmp-machines/blob/master/opentitan-echo.elf</a><br>
&gt; This firmware is just a small interrupt-based bare-metal program<br>
&gt; echoing back whatever is sent in the uart.<br>
&gt; <br>
&gt; This repo contains also sifive_e machine example.<br>
&gt; <br>
&gt; Based-on: &lt;<a href=3D"mailto:20220218164646.132112-1-damien.hedde@g=
reensocs.com" target=3D"_blank">20220218164646.132112-1-damien.hedde@greens=
ocs.com</a>&gt;<br>
&gt; &quot;RiscV cleanups for user-related life cycles&quot;<br>
&gt; <br>
&gt; Thanks for your comments,<br>
&gt; --<br>
&gt; Damien<br>
&gt; <br>
&gt; Damien Hedde (13):<br>
&gt;=C2=A0 =C2=A0 machine: add phase_get() and document phase_check()/advan=
ce()<br>
&gt;=C2=A0 =C2=A0 machine&amp;vl: introduce phase_until() to handle phase t=
ransitions<br>
&gt;=C2=A0 =C2=A0 vl: support machine-initialized target in phase_until()<b=
r>
&gt;=C2=A0 =C2=A0 qapi/device_add: compute is_hotplug flag<br>
&gt;=C2=A0 =C2=A0 qapi/device_add: handle the rom_order_override when cold-=
plugging<br>
&gt;=C2=A0 =C2=A0 none-machine: add the NoneMachineState structure<br>
&gt;=C2=A0 =C2=A0 none-machine: add &#39;ram-addr&#39; property<br>
&gt;=C2=A0 =C2=A0 none-machine: allow cold plugging sysbus devices<br>
&gt;=C2=A0 =C2=A0 none-machine: allow several cpus<br>
&gt;=C2=A0 =C2=A0 softmmu/memory: add memory_region_try_add_subregion funct=
ion<br>
&gt;=C2=A0 =C2=A0 add sysbus-mmio-map qapi command<br>
&gt;=C2=A0 =C2=A0 hw/mem/system-memory: add a memory sysbus device<br>
&gt;=C2=A0 =C2=A0 hw: set user_creatable on opentitan/sifive_e devices<br>
&gt; <br>
&gt; Mirela Grujic (1):<br>
&gt;=C2=A0 =C2=A0 qapi/device_add: Allow execution in machine initialized p=
hase<br>
&gt; <br>
&gt;=C2=A0 =C2=A0qapi/qdev.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 34 +++++++++++-<br>
&gt;=C2=A0 =C2=A0include/exec/memory.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
22 ++++++++<br>
&gt;=C2=A0 =C2=A0include/hw/mem/sysbus-memory.h | 28 ++++++++++<br>
&gt;=C2=A0 =C2=A0include/hw/qdev-core.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
33 ++++++++++++<br>
&gt;=C2=A0 =C2=A0hw/char/ibex_uart.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0hw/char/sifive_uart.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0hw/core/null-machine.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
68 ++++++++++++++++++++++--<br>
&gt;=C2=A0 =C2=A0hw/core/qdev.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 5 ++<br>
&gt;=C2=A0 =C2=A0hw/core/sysbus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 49 ++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0hw/gpio/sifive_gpio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0hw/intc/riscv_aclint.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +<br>
&gt;=C2=A0 =C2=A0hw/intc/sifive_plic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0hw/mem/sysbus-memory.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
80 +++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0hw/misc/sifive_e_prci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 8 +++<br>
&gt;=C2=A0 =C2=A0hw/misc/unimp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0hw/riscv/riscv_hart.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0hw/timer/ibex_timer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0monitor/misc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0softmmu/memory.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 23 ++++++---<br>
&gt;=C2=A0 =C2=A0softmmu/qdev-monitor.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
20 +++++++-<br>
&gt;=C2=A0 =C2=A0softmmu/vl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 94 ++++++++++++++++++++++++++--------<br>
&gt;=C2=A0 =C2=A0hmp-commands.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0hw/mem/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 2 +<br>
&gt;=C2=A0 =C2=A023 files changed, 439 insertions(+), 39 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 include/hw/mem/sysbus-memory.h<br>
&gt;=C2=A0 =C2=A0create mode 100644 hw/mem/sysbus-memory.c<br>
&gt; <br>
<br>
</blockquote></div></div>

--0000000000006befa005dfc752ab--

