Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C42574AC4E4
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 17:07:26 +0100 (CET)
Received: from localhost ([::1]:42660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH6Y1-0003cs-1x
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 11:07:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1nH6Qh-0000lr-Jl; Mon, 07 Feb 2022 10:59:52 -0500
Received: from mail.csgraf.de ([85.25.223.15]:33900 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1nH6Qf-0006GD-5O; Mon, 07 Feb 2022 10:59:51 -0500
Received: from [0.0.0.0] (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com
 [3.122.114.9]) by csgraf.de (Postfix) with ESMTPSA id 593D4608119E;
 Mon,  7 Feb 2022 16:59:45 +0100 (CET)
Content-Type: multipart/alternative;
 boundary="------------O2SEz3LzpOUt5MN2NwIyKpOa"
Message-ID: <a6caa3b0-89ae-d482-62f5-2cada740a60e@csgraf.de>
Date: Mon, 7 Feb 2022 16:59:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 06/16] hw/arm/xlnx-zcu102: Don't enable PSCI conduit when
 booting guest in EL3
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-7-peter.maydell@linaro.org>
 <2c67bde5-65b2-0af0-afde-7353a4fe2a1b@csgraf.de>
 <CAFEAcA9DcHXRkA7gCihU6LrOc40EOHnVnTeEcf4+xSfG22eJ-g@mail.gmail.com>
 <44ec9504-a7ef-6805-ae94-4435e5a37735@csgraf.de>
 <CAJy5ezqUtLphzH_WKmW8dR34=k-g5dmuevuZY42GfnD-R-uCqg@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <CAJy5ezqUtLphzH_WKmW8dR34=k-g5dmuevuZY42GfnD-R-uCqg@mail.gmail.com>
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Havard Skinnemoen <hskinnemoen@google.com>,
 Yanan Wang <wangyanan55@huawei.com>, Rob Herring <robh@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Joel Stanley <joel@jms.id.au>,
 Andre Przywara <andre.przywara@arm.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Tyrone Ting <kfting@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------O2SEz3LzpOUt5MN2NwIyKpOa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 07.02.22 16:52, Edgar E. Iglesias wrote:
>
>
> On Mon, Feb 7, 2022 at 4:33 PM Alexander Graf <agraf@csgraf.de> wrote:
>
>
>     On 07.02.22 16:22, Peter Maydell wrote:
>     > On Mon, 7 Feb 2022 at 14:21, Alexander Graf <agraf@csgraf.de> wrote:
>     >>
>     >> On 27.01.22 16:46, Peter Maydell wrote:
>     >>> Change the Xilinx ZynqMP-based board xlnx-zcu102 to use the new
>     >>> boot.c functionality to allow us to enable psci-conduit only if
>     >>> the guest is being booted in EL1 or EL2, so that if the user runs
>     >>> guest EL3 firmware code our PSCI emulation doesn't get in its
>     >>> way.
>     >>>
>     >>> To do this we stop setting the psci-conduit property on the CPU
>     >>> objects in the SoC code, and instead set the psci_conduit field in
>     >>> the arm_boot_info struct to tell the common boot loader code that
>     >>> we'd like PSCI if the guest is starting at an EL that it makes
>     >>> sense with.
>     >>>
>     >>> Note that this means that EL3 guest code will have no way
>     >>> to power on secondary cores, because we don't model any
>     >>> kind of power controller that does that on this SoC.
>     >>>
>     >>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>     >>
>     >> It's been a while since I worked with ZynqMP, but typically
>     your ATF in
>     >> EL3 will want to talk to a microblaze firmware blob on the PMU.
>     >>
>     >> I only see a stand alone PMU machine for microblaze and a PMU IRQ
>     >> handling I/O block in QEMU, but nothing that would listen to
>     the events.
>     >> So I'm fairly sure it will be broken after this patch - and
>     really only
>     >> worked by accident before.
>     > Edgar submitted a power-control model patchset:
>     >
>     https://patchew.org/QEMU/20220203140141.310870-1-edgar.iglesias@gmail.com/
>
>
>     Ah, nice. Would this also work for Versal?
>
>
>     Thanks,
>
>     Alex
>
>
> Hi,
>
> Both Versal and ZynqMP require MicroBlaze firmware to run the 
> reference implementations of Trusted Firmware. We never supported this 
> in upstream QEMU but we do support it with our fork (by running 
> multiple QEMU instances co-simulating).
>
> Having said that, we do have tons of EL3 test-cases that we use to 
> validate QEMU that run with EL3 enabled in upstream.
>
> So there's two user flows:
> 1. Direct boots using QEMUs builtin PSCI (Most users use this to run 
> Linux, Xen, U-boot, etc)
> 2. Firmware boot at EL3 without QEMUs builtin PSCI (Mostly used by 
> test-code)
>
> Number #2 is the one affected here and that by accident used to have 
> the builtin PSCI support enabled but now requires more power control 
> modelling to keep working.
> Unless I'm missing something, the -kernel boots will continue to use 
> the builtin PSCI implementation.


So nobody is using upstream QEMU to validate and prototype ATF/EL1s/EL0s 
code? That's a shame :). I suppose there is little value without the 
bitstream emulation and R cluster. Do you have plans to bring multi 
process emulation upstream some day to enable these there?


Alex

--------------O2SEz3LzpOUt5MN2NwIyKpOa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 07.02.22 16:52, Edgar E. Iglesias
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJy5ezqUtLphzH_WKmW8dR34=k-g5dmuevuZY42GfnD-R-uCqg@mail.gmail.com">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Mon, Feb 7, 2022 at 4:33
            PM Alexander Graf &lt;<a href="mailto:agraf@csgraf.de"
              moz-do-not-send="true" class="moz-txt-link-freetext">agraf@csgraf.de</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote"><br>
            On 07.02.22 16:22, Peter Maydell wrote:<br>
            &gt; On Mon, 7 Feb 2022 at 14:21, Alexander Graf &lt;<a
              href="mailto:agraf@csgraf.de" target="_blank"
              moz-do-not-send="true" class="moz-txt-link-freetext">agraf@csgraf.de</a>&gt;
            wrote:<br>
            &gt;&gt;<br>
            &gt;&gt; On 27.01.22 16:46, Peter Maydell wrote:<br>
            &gt;&gt;&gt; Change the Xilinx ZynqMP-based board
            xlnx-zcu102 to use the new<br>
            &gt;&gt;&gt; boot.c functionality to allow us to enable
            psci-conduit only if<br>
            &gt;&gt;&gt; the guest is being booted in EL1 or EL2, so
            that if the user runs<br>
            &gt;&gt;&gt; guest EL3 firmware code our PSCI emulation
            doesn't get in its<br>
            &gt;&gt;&gt; way.<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt; To do this we stop setting the psci-conduit
            property on the CPU<br>
            &gt;&gt;&gt; objects in the SoC code, and instead set the
            psci_conduit field in<br>
            &gt;&gt;&gt; the arm_boot_info struct to tell the common
            boot loader code that<br>
            &gt;&gt;&gt; we'd like PSCI if the guest is starting at an
            EL that it makes<br>
            &gt;&gt;&gt; sense with.<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt; Note that this means that EL3 guest code will
            have no way<br>
            &gt;&gt;&gt; to power on secondary cores, because we don't
            model any<br>
            &gt;&gt;&gt; kind of power controller that does that on this
            SoC.<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt; Signed-off-by: Peter Maydell &lt;<a
              href="mailto:peter.maydell@linaro.org" target="_blank"
              moz-do-not-send="true" class="moz-txt-link-freetext">peter.maydell@linaro.org</a>&gt;<br>
            &gt;&gt;<br>
            &gt;&gt; It's been a while since I worked with ZynqMP, but
            typically your ATF in<br>
            &gt;&gt; EL3 will want to talk to a microblaze firmware blob
            on the PMU.<br>
            &gt;&gt;<br>
            &gt;&gt; I only see a stand alone PMU machine for microblaze
            and a PMU IRQ<br>
            &gt;&gt; handling I/O block in QEMU, but nothing that would
            listen to the events.<br>
            &gt;&gt; So I'm fairly sure it will be broken after this
            patch - and really only<br>
            &gt;&gt; worked by accident before.<br>
            &gt; Edgar submitted a power-control model patchset:<br>
            &gt; <a
href="https://patchew.org/QEMU/20220203140141.310870-1-edgar.iglesias@gmail.com/"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">https://patchew.org/QEMU/20220203140141.310870-1-edgar.iglesias@gmail.com/</a><br>
            <br>
            <br>
            Ah, nice. Would this also work for Versal?<br>
            <br>
            <br>
            Thanks,<br>
            <br>
            Alex<br>
          </blockquote>
          <div><br>
          </div>
          <div>Hi,</div>
          <div><br>
          </div>
          <div>Both Versal and ZynqMP require MicroBlaze firmware to run
            the reference implementations of Trusted Firmware. We never
            supported this in upstream QEMU but we do support it with
            our fork (by running multiple QEMU instances co-simulating).</div>
          <div><br>
          </div>
          <div>Having said that, we do have tons of EL3 test-cases that
            we use to validate QEMU that run with EL3 enabled in
            upstream.</div>
          <div><br>
          </div>
          <div>So there's two user flows:</div>
          <div>1. Direct boots using QEMUs builtin PSCI (Most users use
            this to run Linux, Xen, U-boot, etc)</div>
          <div>2. Firmware boot at EL3 without QEMUs builtin PSCI
            (Mostly used by test-code)</div>
          <div><br>
          </div>
          <div>Number #2 is the one affected here and that by accident
            used to have the builtin PSCI support enabled but now
            requires more power control modelling to keep working.</div>
          <div>Unless I'm missing something, the -kernel boots will
            continue to use the builtin PSCI implementation.</div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>So nobody is using upstream QEMU to validate and prototype
      ATF/EL1s/EL0s code? That's a shame :). I suppose there is little
      value without the bitstream emulation and R cluster. Do you have
      plans to bring multi process emulation upstream some day to enable
      these there?<br>
      <br>
      <br>
      Alex<br>
      <br>
    </p>
  </body>
</html>

--------------O2SEz3LzpOUt5MN2NwIyKpOa--

