Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D194A58DF
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 09:59:57 +0100 (CET)
Received: from localhost ([::1]:43750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEp11-0005iT-VB
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 03:59:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nEoax-00081r-GM
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 03:32:59 -0500
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25]:38131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nEoau-0005FN-TM
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 03:32:59 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.83])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 807CE21D0F;
 Tue,  1 Feb 2022 08:32:52 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 1 Feb
 2022 09:32:51 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0056f5597bc-9346-400d-a9de-2cb0edc4de79,
 FC28BB27814F05D37416E671BAFA2F1ED858982E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <17b82ef5-5ac7-a6ec-a7e7-0553483cf939@kaod.org>
Date: Tue, 1 Feb 2022 09:32:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 00/16] arm: Fix handling of unrecognized functions in PSCI
 emulation
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220127154639.2090164-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 70abd411-27cf-4eab-8c18-36e27cef8fdd
X-Ovh-Tracer-Id: 17308459268668820435
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrgedvgdduvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghnughrvgdrphhriiihfigrrhgrsegrrhhmrdgtohhm
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Yanan Wang <wangyanan55@huawei.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 Joel Stanley <joel@jms.id.au>, "Edgar
 E. Iglesias" <edgar.iglesias@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/22 16:46, Peter Maydell wrote:
> This series fixes our handling of PSCI calls where the function ID is
> not recognized. These are supposed to return an error value, but
> currently we instead emulate the SMC or HVC instruction to trap to the
> guest at EL3 or EL2. Particularly of note for code review:
>   * patches 4-9 include some "is this the right behaviour for
>     this hardware" questions for the maintainers of those boards
>   * patch 15 has a DTB API question, as well as being a change in
>     what we edit in a DTB we are passed by the user
>   * testing of the affected machines would be welcome
> 
> We tried to fix that bug in commit 9fcd15b9193e819b, but ran into
> regressions and so reverted it in commit 4825eaae4fdd56fba0f for
> release 7.0.  This series fixes the underlying problems causing the
> regressions and reverts the revert.  It also fixes some other bugs
> that were preventing booting of guests on the midway board and that
> meant that the Linux kernel I tested couldn't bring up the secondary
> CPUs when running with more than one guest CPU.
> 
> The regressions happened on boards which enabled PSCI emulation while
> still running guest code at EL3. This used to work (as long as the
> guest code itself wasn't trying to implement PSCI!)  because of the
> fall-through-to-emulate-the-insn behaviour, but once the PSCI
> emulation handles all SMC calls, most EL3 guest code will stop working
> correctly. The solution this patchset adopts is to avoid enabling
> QEMU's PSCI emulation when running guest code at EL3.
> 
> The affected boards are:
>   * orangepi-pc, mcimx6ul-evk, mcimx7d-sabre, highbank, midway,
>     xlnx-zcu102 (for any EL3 guest code)
>   * xlnx-versal-virt (only for EL3 code run via -kernel)
>   * virt (only for EL3 code run via -kernel or generic-loader)
> For all these cases we will no longer enable PSCI emulation.
> (This might in theory break guest code that used to work because
> it was relying on running under QEMU and having the PSCI emulation
> despite being at EL3 itself, but hopefully such code is rare.)
> 
> In order to only enable PSCI emulation when the guest is running at an
> exception level lower than the level that our PSCI emulation
> "firmware" would be running at, we make the arm_load_kernel() code in
> boot.c responsible for setting the CPU properties psci-conduit and
> start-powered-off. This is because only that code knows what EL it is
> going to start the guest at (which depends on things like whether it
> has decided that the guest is a Linux kernel or not).
> 
> The complicated case in all of this is the highbank and midway board
> models, because of all the boards which enable QEMU's PSCI emulation
> only these also use the boot.c secure_board_setup flag to say "run a
> fragment of QEMU-provided boot code in the guest at EL3 to set
> something up before running the guest at EL2 or EL1". That fragment of
> code includes use of the SMC instruction, so when PSCI emulation
> starts making that a NOP rather than a trap-to-guest-EL3 the setup
> code will change behaviour. Fortunately, for this specific board's use
> case the NOP is fine. The purpose of the setup code is to arrange that
> unknown SMCs act as NOPs, because guest code may use a
> highbank/midway-specific SMC ABI to enable the L2x0 cache
> controller. So when the PSCI emulation starts to NOP the unknown SMCs
> the setup code won't actively break, and the guest behaviour will
> still be OK. (See patch 11's commit message for fuller details.)
> 
> Patches 1 and 2 make the relevant CPU properties settable after the
> CPU object has been realized. This is necessary because
> arm_load_kernel() runs very late, after the whole machine (including
> the CPU objects) has been fully initialized.  (It was the restriction
> on setting these properties before realize that previously led us to
> set them in the SoC emulation code and thus to do it unconditionally.)
> 
> Patch 3 provides the "set up psci conduit" functionality in the boot.c
> code; this is opt-in per board by setting a field in the arm_boot_info
> struct.
> 
> Patches 4 to 9 move the individual boards across to using the new
> approach. In each case I had to make a decision about the behaviour of
> secondary CPUs when running guest firmware at EL3 -- should the
> secondaries start off powered-down (waiting for the guest to power
> them up via some kind of emulated power-control device), or powered-up
> (so they all start running the firmware at once)? In a few cases I was
> able to find the answer to this; in the rest I have erred on the side
> of retaining the current "start powered down" behaviour, and added a
> TODO comment to that effect. If you know the actual hardware
> behaviour, let me know.
> 
> Patch 10 is the revert-the-revert patch.
> 
> Patch 11 removes the highbank/midway board use of the secure_board_setup
> functionality; the commit message has the details about why this is safe.
> 
> Patches 12 to 14 are more minor cleanups that allow, and follow on from,
> dropping the highbank-specific secondary CPU boot stub code.
> 
> Patch 15 is a change that is somewhat unrelated, but is necessary to
> get the highbank board to successfully boot in SMP and to get the
> midway board to start a Linux guest at all.
> 
> I have tested this with make check/check-acceptance and also with some
> test images I have locally (including highbank and midway), but I
> don't have test images for most of these boards, and in particular I
> don't really have anything that exercises "run guest EL3 code" for
> most of them. Testing would be welcome.

for the Aspeed machines,

Tested-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> 
> thanks
> -- PMM
> 
> Peter Maydell (16):
>    target/arm: make psci-conduit settable after realize
>    cpu.c: Make start-powered-off settable after realize
>    hw/arm/boot: Support setting psci-conduit based on guest EL
>    hw/arm: imx: Don't enable PSCI conduit when booting guest in EL3
>    hw/arm: allwinner: Don't enable PSCI conduit when booting guest in EL3
>    hw/arm/xlnx-zcu102: Don't enable PSCI conduit when booting guest in
>      EL3
>    hw/arm/versal: Let boot.c handle PSCI enablement
>    hw/arm/virt: Let boot.c handle PSCI enablement
>    hw/arm: highbank: For EL3 guests, don't enable PSCI, start all cores
>    Revert "Revert "arm: tcg: Adhere to SMCCC 1.3 section 5.2""
>    hw/arm/highbank: Drop use of secure_board_setup
>    hw/arm/boot: Prevent setting both psci_conduit and secure_board_setup
>    hw/arm/boot: Don't write secondary boot stub if using PSCI
>    hw/arm/highbank: Drop unused secondary boot stub code
>    hw/arm/boot: Drop nb_cpus field from arm_boot_info
>    hw/arm/boot: Drop existing dtb /psci node rather than retaining it
> 
>   include/hw/arm/boot.h        |  14 ++++-
>   include/hw/arm/xlnx-versal.h |   1 -
>   cpu.c                        |  22 ++++++-
>   hw/arm/allwinner-h3.c        |   9 ++-
>   hw/arm/aspeed.c              |   1 -
>   hw/arm/boot.c                | 107 +++++++++++++++++++++++++++++------
>   hw/arm/exynos4_boards.c      |   1 -
>   hw/arm/fsl-imx6ul.c          |   2 -
>   hw/arm/fsl-imx7.c            |   8 +--
>   hw/arm/highbank.c            |  72 +----------------------
>   hw/arm/imx25_pdk.c           |   3 +-
>   hw/arm/kzm.c                 |   1 -
>   hw/arm/mcimx6ul-evk.c        |   2 +-
>   hw/arm/mcimx7d-sabre.c       |   2 +-
>   hw/arm/npcm7xx.c             |   3 -
>   hw/arm/orangepi.c            |   5 +-
>   hw/arm/raspi.c               |   1 -
>   hw/arm/realview.c            |   1 -
>   hw/arm/sabrelite.c           |   1 -
>   hw/arm/sbsa-ref.c            |   1 -
>   hw/arm/vexpress.c            |   1 -
>   hw/arm/virt.c                |  13 +----
>   hw/arm/xilinx_zynq.c         |   1 -
>   hw/arm/xlnx-versal-virt.c    |   6 +-
>   hw/arm/xlnx-versal.c         |   5 +-
>   hw/arm/xlnx-zcu102.c         |   1 +
>   hw/arm/xlnx-zynqmp.c         |  13 +++--
>   target/arm/cpu.c             |   6 +-
>   target/arm/psci.c            |  35 ++----------
>   29 files changed, 164 insertions(+), 174 deletions(-)
> 


