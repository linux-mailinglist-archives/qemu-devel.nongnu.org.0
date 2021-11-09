Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C1344B306
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 20:08:28 +0100 (CET)
Received: from localhost ([::1]:54686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkWTq-0008VT-IJ
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 14:08:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1mkWSE-0007ZY-Bg; Tue, 09 Nov 2021 14:06:46 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:45681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1mkWS9-0000uZ-Ro; Tue, 09 Nov 2021 14:06:46 -0500
Received: (Authenticated sender: jcd@tribudubois.net)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 71F57240002;
 Tue,  9 Nov 2021 19:06:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------Llope4Ps9cnCJ4e9YXeYc3I0"
Message-ID: <d1175f18-ba8a-3022-916f-395e0937b92e@tribudubois.net>
Date: Tue, 9 Nov 2021 20:06:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: Qemu and ARM secure state.
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <07e63acb-b756-2586-2ba2-b54b837f7fc8@tribudubois.net>
 <CAFEAcA89YQ_vN-JpCeB+L==F5g1hM=CNMBzjaf5c3EHF19NVyQ@mail.gmail.com>
 <c8b89685-7490-328b-51a3-48711c140a84@tribudubois.net>
 <d19f6d2c-7505-b326-3a67-48c336f111e9@tribudubois.net>
 <dd45f94c-6110-7251-4f9f-5b4e1fbb73a4@tribudubois.net>
 <e0a1b786-4b1c-c608-495b-3fb839de2376@tribudubois.net>
 <CAFEAcA-DnbocsRHC3cUM_uX=kGn-KJa3q42TCyaB=isxKTS-Sg@mail.gmail.com>
 <ec74f093-9508-c0fc-3e06-2e8abf8655c6@tribudubois.net>
 <CAFEAcA8RU3=owBnCwJ7ePKW6Sm2GBU6er7o44iQd4Rs19TQs9Q@mail.gmail.com>
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
In-Reply-To: <CAFEAcA8RU3=owBnCwJ7ePKW6Sm2GBU6er7o44iQd4Rs19TQs9Q@mail.gmail.com>
Received-SPF: pass client-ip=217.70.178.230; envelope-from=jcd@tribudubois.net;
 helo=relay10.mail.gandi.net
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-3.364, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------Llope4Ps9cnCJ4e9YXeYc3I0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 09/11/2021 à 11:55, Peter Maydell a écrit :
> On Mon, 8 Nov 2021 at 22:09, Jean-Christophe DUBOIS<jcd@tribudubois.net>  wrote:
>> OK, so one problem seems to be that PSCI-via-SMC is enabled on i.MX6UL
>> when there is no built in PSCI related function on this processor.
>>
>> According the Linux DTS, i.MX7 (solo and dual) processors have a
>> somewhat PSCI related "entry-method"
>> (https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/imx7s.dtsi).
>> But it is not clear to me how this is used and this seems a bit strange
>> as "entry-method" seems to be mostly used on arm64 and there is no other
>> PSCI related information in the i.MX7 DTS files.
> Yeah, PSCI was an interface introduced mostly with aarch64. In the
> 32-bit world bringing up multiple CPUs was complete anarchy -- the
> way the kernel told the secure firmware that it should start up
> a secondary core was entirely determined by the firmware, and
> the kernel had to have board-specific code to do this. (For the
> 32-bit imx boards I think this is in arch/arm/mach-imx/src.c.)
> For aarch64 we had a clean slate and took the opportunity to insist
> that all boards did it the same way, ie using PSCI. (There are other
> useful things PSCI allows, but standardising secondary boot is the
> one that matters for this discussion.) So if a platform's firmware
> implements PSCI, all the dts file has to do is say so, and then
> there's no need for board-specific "start secondary CPUs" code.
> PSCI does define an aarch32 interface, but there are a lot of
> legacy older boards (and new flavours of boards in long-standing
> design families) which still do things the old way in aarch32 land.
>
> Typically the top-level "PSCI is available" node is added by the firmware.
> (QEMU will do this too when it's emulating PSCI firmware) -- if the
> board code enables the psci-conduit it will add an appropriate psci
> node in the hw/arm/boot.c code.)
>
>> As a matter of fact
>> previous quad or dual i.MX6 were not supporting PSCI. Instead they were
>> using a proprietary method through the internal SRC device (and i.MX7
>> also has a similar internal SRC device). But let's assume Linux on i.mx7
>> is actually using PSCI to handle processors.
>>
>> Thinking about it, I guess this might be u-boot that sets an EL3 monitor
>> software that is able to handle PSCI requests for the Linux kernel. If
>> this is the case, it make sense that Qemu emulates the PSCI services
>> normally provided by u-boot to be able to boot linux directly (without
>> booting a real u-boot prior to linux). All  is well and nice.
> Yes, that's the way it works. The EL3 firmware is supposed to provide
> PSCI.
>
> For aarch64 the kernel is never entered in EL3 -- it will always run at EL2
> or EL1. (This is unlike aarch32, where in some cases you might run the
> kernel in secure-SVC, although even there starting the kernel in
> NS-SVC or NS-Hyp is more common.)
>
>> But then if I want to boot and test the u-boot binary (or any trusted OS
>> for the matter) on a Qemu emulated i.MX7 (to later boot an hypervisor or
>> an OS), it would be rather strange that any PSCI related service
>> requested by the hypervisor/OS  would be handled by Qemu directly and
>> not by the u-boot code (or any other EL3 code) running on the processor.
> Exactly. This is why the board code is supposed to set things
> up so that if we are starting the guest code in EL1 or EL2
> then we enable the PSCI-via-SMC support, and if we're starting
> the guest code in EL3 then we do not.
>
>> How is it supposed to work? How can I tell Qemu (dynamically?) if I want
>> it to provide (or not) the PSCI services (and more generally SMC/HVC
>> services).
> If you want PSCI via SMC or HVC, then set the psci-conduit
> property on the CPUs to QEMU_PSCI_CONDUIT_SMC or QEMU_PSCI_CONDUIT_HVC.
> If you do not want QEMU to provide PSCI, then leave psci-conduit
> at its default (which is QEMU_PSCI_CONDUIT_DISABLED).
>
> How can I tell it that I want to handle all SMC/EL3 services
>> by myself even if the "psci-conduit" is already set to SMC in Qemu?
> It's the imx7 code that's setting psci-conduit, so it should
> not do that if it doesn't want that (and also should either
> start or not start the secondary cpus powered off, depending
> on what the hardware-to-firmware interface is supposed to be.)
> This is a bit awkward, because the boards we initially wanted
> PSCI for (notably virt) don't have an SoC object, so the code
> creating CPUs is in the same source file as the code that knows
> whether it's booting a kernel directly or not, and so it just
> open-codes the decision logic. With the imx, the CPU creation
> is in the source code for the SoC object which is abstracted
> away from the board model code. So we'd need to sort out how
> to plumb that information into the SoC object (or have the SoC
> object's code that creates the CPUs call some function to find out).

Thanks Peter,

So basically the Qemu i.MX7 processor code needs to set psci-conduit to 
SMC because we want to be able to boot the Linux kernel directly 
(without u-boot) with Qemu emulating the PSCI services when an SMC 
instruction is triggered.

As I see it we also need a way to disable this Qemu PSCI emulation in 
case we want to boot an EL3 software (u-boot, optee or other).

We could certainly pass a command line option to explicitly tell Qemu to 
disable the PCSI emulation. But this would be a bit cumbersome as the 
board level code would then need to call to the SOC code to disable the 
psci setting on all cores.

So I am wondering if we could be more "clever" solution and have things 
sorted out automatically. I would like to suggest 2 solutions;

 1. The first solution could be based on the mode of the processor when
    it starts executing the provided software. If I remember correctly
    what you explained, if an ELF file is provided then the processor
    boots in the highest level (EL3 for i.MX6/i.MX7) while if a non ELF
    file is provided (uImage ...) then the processor boots in EL2 (or
    lower depending on the processor) to emulate the uboot behavior.
     1. if the processor starts the software in EL3 then we need to
        disable the "psci-conduit" through SMC (if set) because the EL3
        software should install/provide the necessary firmware.
     2. If the processor starts the software in EL2 then we need to
        disable the "psci-conduit" through HVC (if set) because the EL2
        software should install/provide the necessary firmware.
 2. The other solution is to check if the booted software has installed
    an EL3 or EL2 exception vector table.
     1. if the software has installed an EL3 (monitor) exception vector
        table then we need to disable the "psci-conduit" through SMC (if
        set).
     2. if the software has installed an EL2 (hypervisor) exception
        vector table then we need to disable the "psci-conduit" through
        HVC (if set).

Is any of these proposals reasonable in your point of view? This would 
apply for any (ARM) target and this seems generic enough.

Thanks

JC

>
> -- PMM
>

--------------Llope4Ps9cnCJ4e9YXeYc3I0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Le 09/11/2021 à 11:55, Peter Maydell a
      écrit :<br>
    </div>
    <blockquote type="cite"
cite="mid:CAFEAcA8RU3=owBnCwJ7ePKW6Sm2GBU6er7o44iQd4Rs19TQs9Q@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Mon, 8 Nov 2021 at 22:09, Jean-Christophe DUBOIS <a class="moz-txt-link-rfc2396E" href="mailto:jcd@tribudubois.net">&lt;jcd@tribudubois.net&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">OK, so one problem seems to be that PSCI-via-SMC is enabled on i.MX6UL
when there is no built in PSCI related function on this processor.

According the Linux DTS, i.MX7 (solo and dual) processors have a
somewhat PSCI related "entry-method"
(<a class="moz-txt-link-freetext" href="https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/imx7s.dtsi">https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/imx7s.dtsi</a>).
But it is not clear to me how this is used and this seems a bit strange
as "entry-method" seems to be mostly used on arm64 and there is no other
PSCI related information in the i.MX7 DTS files.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yeah, PSCI was an interface introduced mostly with aarch64. In the
32-bit world bringing up multiple CPUs was complete anarchy -- the
way the kernel told the secure firmware that it should start up
a secondary core was entirely determined by the firmware, and
the kernel had to have board-specific code to do this. (For the
32-bit imx boards I think this is in arch/arm/mach-imx/src.c.)
For aarch64 we had a clean slate and took the opportunity to insist
that all boards did it the same way, ie using PSCI. (There are other
useful things PSCI allows, but standardising secondary boot is the
one that matters for this discussion.) So if a platform's firmware
implements PSCI, all the dts file has to do is say so, and then
there's no need for board-specific "start secondary CPUs" code.
PSCI does define an aarch32 interface, but there are a lot of
legacy older boards (and new flavours of boards in long-standing
design families) which still do things the old way in aarch32 land.

Typically the top-level "PSCI is available" node is added by the firmware.
(QEMU will do this too when it's emulating PSCI firmware) -- if the
board code enables the psci-conduit it will add an appropriate psci
node in the hw/arm/boot.c code.)

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">As a matter of fact
previous quad or dual i.MX6 were not supporting PSCI. Instead they were
using a proprietary method through the internal SRC device (and i.MX7
also has a similar internal SRC device). But let's assume Linux on i.mx7
is actually using PSCI to handle processors.

Thinking about it, I guess this might be u-boot that sets an EL3 monitor
software that is able to handle PSCI requests for the Linux kernel. If
this is the case, it make sense that Qemu emulates the PSCI services
normally provided by u-boot to be able to boot linux directly (without
booting a real u-boot prior to linux). All  is well and nice.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yes, that's the way it works. The EL3 firmware is supposed to provide
PSCI.

For aarch64 the kernel is never entered in EL3 -- it will always run at EL2
or EL1. (This is unlike aarch32, where in some cases you might run the
kernel in secure-SVC, although even there starting the kernel in
NS-SVC or NS-Hyp is more common.)

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">But then if I want to boot and test the u-boot binary (or any trusted OS
for the matter) on a Qemu emulated i.MX7 (to later boot an hypervisor or
an OS), it would be rather strange that any PSCI related service
requested by the hypervisor/OS  would be handled by Qemu directly and
not by the u-boot code (or any other EL3 code) running on the processor.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Exactly. This is why the board code is supposed to set things
up so that if we are starting the guest code in EL1 or EL2
then we enable the PSCI-via-SMC support, and if we're starting
the guest code in EL3 then we do not.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">How is it supposed to work? How can I tell Qemu (dynamically?) if I want
it to provide (or not) the PSCI services (and more generally SMC/HVC
services).
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
If you want PSCI via SMC or HVC, then set the psci-conduit
property on the CPUs to QEMU_PSCI_CONDUIT_SMC or QEMU_PSCI_CONDUIT_HVC.
If you do not want QEMU to provide PSCI, then leave psci-conduit
at its default (which is QEMU_PSCI_CONDUIT_DISABLED).

How can I tell it that I want to handle all SMC/EL3 services
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">by myself even if the "psci-conduit" is already set to SMC in Qemu?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It's the imx7 code that's setting psci-conduit, so it should
not do that if it doesn't want that (and also should either
start or not start the secondary cpus powered off, depending
on what the hardware-to-firmware interface is supposed to be.)
This is a bit awkward, because the boards we initially wanted
PSCI for (notably virt) don't have an SoC object, so the code
creating CPUs is in the same source file as the code that knows
whether it's booting a kernel directly or not, and so it just
open-codes the decision logic. With the imx, the CPU creation
is in the source code for the SoC object which is abstracted
away from the board model code. So we'd need to sort out how
to plumb that information into the SoC object (or have the SoC
object's code that creates the CPUs call some function to find out).</pre>
    </blockquote>
    <p>Thanks Peter,</p>
    <p>So basically the Qemu i.MX7 processor code needs to set
      psci-conduit to SMC because we want to be able to boot the Linux
      kernel directly (without u-boot) with Qemu emulating the PSCI
      services when an SMC instruction is triggered.</p>
    <p>As I see it we also need a way to disable this Qemu PSCI
      emulation in case we want to boot an EL3 software (u-boot, optee
      or other).</p>
    <p>We could certainly pass a command line option to explicitly tell
      Qemu to disable the PCSI emulation. But this would be a bit
      cumbersome as the board level code would then need to call to the
      SOC code to disable the psci setting on all cores.<br>
    </p>
    <p>So I am wondering if we could be more "clever" solution and have
      things sorted out automatically. I would like to suggest 2
      solutions;</p>
    <ol>
      <li>The first solution could be based on the mode of the processor
        when it starts executing the provided software. If I remember
        correctly what you explained, if an ELF file is provided then
        the processor boots in the highest level (EL3 for i.MX6/i.MX7)
        while if a non ELF file is provided (uImage ...) then the
        processor boots in EL2 (or lower depending on the processor) to
        emulate the uboot behavior.</li>
      <ol>
        <li>if the processor starts the software in EL3 then we need to
          disable the "psci-conduit" through SMC (if set) because the
          EL3 software should install/provide the necessary firmware.</li>
        <li>If the processor starts the software in EL2 then we need to
          disable the "psci-conduit" through HVC (if set) because the
          EL2 software should install/provide the necessary firmware.</li>
      </ol>
      <li>The other solution is to check if the booted software has
        installed an EL3 or EL2 exception vector table.</li>
      <ol>
        <li>if the software has installed an EL3 (monitor) exception
          vector table then we need to disable the "psci-conduit"
          through SMC (if set).</li>
        <li>if the software has installed an EL2 (hypervisor) exception
          vector table then we need to disable the "psci-conduit"
          through HVC (if set).</li>
      </ol>
    </ol>
    <p>Is any of these proposals reasonable in your point of view? This
      would apply for any (ARM) target and this seems generic enough.</p>
    <p>Thanks</p>
    <p>JC<br>
    </p>
    <blockquote type="cite"
cite="mid:CAFEAcA8RU3=owBnCwJ7ePKW6Sm2GBU6er7o44iQd4Rs19TQs9Q@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

-- PMM

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>
--------------Llope4Ps9cnCJ4e9YXeYc3I0--


