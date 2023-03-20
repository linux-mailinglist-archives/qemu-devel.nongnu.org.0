Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A5B6C0C8E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 09:53:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peBFa-0003El-Ud; Mon, 20 Mar 2023 04:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1peBFG-0003E1-6b; Mon, 20 Mar 2023 04:51:59 -0400
Received: from m12.mail.163.com ([220.181.12.217])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1peBFA-0003bB-5r; Mon, 20 Mar 2023 04:51:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
 Content-Type; bh=blFAk5tSKEM6Zyo89kLwWu36txWc733YKm2nH4LP/rU=;
 b=qUNJ1LGrVdHR+sNJcYZjjoN2R2QkYh8OM8KnnHcDg2jndxiOiTZuQe3pCxMpcI
 3WfMN6RjS0YvDzPWfpmyIYRGKZphm+KIt7GE2aQm5T45WR1yFSiGcsfq9wD7osvw
 0Eo1nYAa2ttOu+5jvGXeqYJaumgLZLbI6z/TIeB6bL5zE=
Received: from [172.21.25.67] (unknown [218.201.129.19])
 by zwqz-smtp-mta-g0-4 (Coremail) with SMTP id _____wDnY4KVHhhkopIWAg--.12216S2;
 Mon, 20 Mar 2023 16:51:34 +0800 (CST)
Message-ID: <7bea1905-139c-bdf6-e160-74b9aa99f9c9@163.com>
Date: Mon, 20 Mar 2023 16:51:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v1 00/12] *** Add allwinner R40 device support ***
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230302114102.32236-1-qianfanguijin@163.com>
 <CAPan3Wr=jqP5CVzsMtNmUTj-NvPZouxPWwC9DivY=GL65XJX4Q@mail.gmail.com>
Content-Language: en-US
From: qianfan <qianfanguijin@163.com>
In-Reply-To: <CAPan3Wr=jqP5CVzsMtNmUTj-NvPZouxPWwC9DivY=GL65XJX4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnY4KVHhhkopIWAg--.12216S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3XF17uFW7Cr1xXw4DXw1rCrg_yoW7tr15pF
 Z0kry5Kr4rJa13AF12qFnrJFyFq34kGF4Utr9rAFy7AF13u3Wq9r4UKa1S9rWrGrZrWw47
 ZFZIqFy5uws0vaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UhJ5wUUUUU=
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiXRc47VWBo+O2wgAAs-
Received-SPF: pass client-ip=220.181.12.217;
 envelope-from=qianfanguijin@163.com; helo=m12.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



在 2023/3/9 4:47, Niek Linnenbank 写道:
> Hello Qianfan Zhao,
>
> Thanks for contributing this work to Qemu! With your contribution, we 
> would get yet another Allwinner SoC supported, making it three in 
> total (A10/H3/R40). That's great.
> My thoughts are that maybe we should try to re-use commonality between 
> these SoCs where we can. Ofcourse, that may be difficult as the 
> internals/peripherals of these SoCs often really are different.
>
> Your patches look good already, and I saw patches 02 and 03 are 
> already merged too. I did a quick regression test with
> avocado for cubieboard/orangepi-pc with your patches applied and that 
> went OK:
>
> $ ARMBIAN_ARTIFACTS_CACHED=yes AVOCADO_ALLOW_LARGE_STORAGE=yes 
> ./build/tests/venv/bin/avocado --show=app,console run -t 
> machine:orangepi-pc -t machine:cubieboard 
> tests/avocado/boot_linux_console.py
> ...
> PASS (22.09 s)
> RESULTS    : PASS 8 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 
> | CANCEL 0
> JOB TIME   : 169.73 s
>
> For now, I have only two suggestions for you to consider:
> 1) You could add a new acceptance test for the new bananapi board to 
> ./tests/avocado/boot_linux_console.py.
> This helps in your current work to (re)test your code quickly, and 
> after the code is merged it helps to keep to board working when other 
> changes are done.
> 2) If time permits, it may be interesting to document your board for 
> example in a new file at ./docs/system/arm/bananapi.rst
>    If you do this, it will make the board a lot more valuable for 
> other people to use, since you can add some basic instructions on how 
> to use the board with qemu there.
>    Additionally, it also helps yourself to store this information 
> somewhere, since it can be easy to forget all the specific 
> commands/flags/arguments and links to board specific images.
>
> Once you have progressed with your patches beyond the RFC stage, I'll 
> try to find some time for a more detailed review of your patches.
Hi:

Thanks for yours guide. avocado test case and documents will be 
introduced later.

My work are stucked when I am writting avocado test case due to the 
armbian image with
linux 6.1 can't boot, the kernel paniced when loading hdmi driver:

[    0.925906] sun8i-dw-hdmi 1ee0000.hdmi: supply hvcc not found, using 
dummy regulator
Invalid read at addr 0x1EF002C, size 4, region '(null)', reason: rejected
[    0.927444] 8<--- cut here ---
[    0.927780] Unhandled fault: external abort on non-linefetch (0x008) 
at 0xe091002c
[    0.928250] [e091002c] *pgd=4100a811, *pte=01ef0653, *ppte=01ef0453
[    0.929441] Internal error: : 8 [#1] SMP ARM
[    0.929925] Modules linked in:
[    0.930332] CPU: 3 PID: 52 Comm: kworker/u8:2 Not tainted 
6.3.0-rc3-ge8d018dd0257 #217
[    0.931082] Hardware name: Allwinner sun8i Family
[    0.931630] Workqueue: events_unbound deferred_probe_work_func
[    0.932443] PC is at regmap_mmio_read32le+0x8/0x14
[    0.932888] LR is at regmap_mmio_read+0x38/0x54

All my work are based on linux 5.15 in the previous days, I will take 
many times to solve this.

>
> Kind regards,
> Niek Linnenbank
>
> On Thu, Mar 2, 2023 at 12:41 PM <qianfanguijin@163.com> wrote:
>
>     From: qianfan Zhao <qianfanguijin@163.com>
>
>     v1: 2023-03-02
>
>     The first three patches try fix allwinner i2c driver and I already
>     send them
>     as a standalone PR and can read it from:
>
>     https://patchwork.kernel.org/project/qemu-devel/patch/20230220081252.25348-3-qianfanguijin@163.com/
>
>     Hope that patch can merged first before this.
>
>     The next patches will add allwinner R40 device support, including
>     ccu, mmc, i2c,
>     axp221 pmic, sdram controller, emac and gmac. Now the mainline
>     u-boot and
>     kernel can work fine (It doesn't support booting allwinner bsp
>     code and there
>     are no plans to support it now).
>
>     qianfan Zhao (12):
>       hw: allwinner-i2c: Make the trace message more readable
>       hw: allwinner-i2c: Fix TWI_CNTR_INT_FLAG on SUN6i SoCs
>       hw: arm: allwinner-h3: Fix and complete H3 i2c devices
>       hw: arm: Add bananapi M2-Ultra and allwinner-r40 support
>       hw/arm/allwinner-r40: add Clock Control Unit
>       hw: allwinner-r40: Complete uart devices
>       hw: arm: allwinner-r40: Add 5 TWI controllers
>       hw/misc: AXP221 PMU Emulation
>       hw/arm/allwinner-r40: add SDRAM controller device
>       hw: sd: allwinner-sdhost: Add sun50i-a64 SoC support
>       hw: arm: allwinner-r40: Fix the mmc controller's type
>       hw: arm: allwinner-r40: Add emac and gmac support
>
>      configs/devices/arm-softmmu/default.mak |   1 +
>      hw/arm/Kconfig                          |  10 +
>      hw/arm/allwinner-h3.c                   |  29 +-
>      hw/arm/allwinner-r40.c                  | 555
>     ++++++++++++++++++++++++
>      hw/arm/bananapi_m2u.c                   | 128 ++++++
>      hw/arm/meson.build                      |   1 +
>      hw/i2c/allwinner-i2c.c                  | 136 +++++-
>      hw/i2c/trace-events                     |   5 +-
>      hw/misc/Kconfig                         |   4 +
>      hw/misc/allwinner-r40-ccu.c             | 207 +++++++++
>      hw/misc/allwinner-r40-dramc.c           | 499 +++++++++++++++++++++
>      hw/misc/axp221.c                        | 196 +++++++++
>      hw/misc/meson.build                     |   3 +
>      hw/misc/trace-events                    |  19 +
>      hw/sd/allwinner-sdhost.c                |  70 ++-
>      include/hw/arm/allwinner-h3.h           |   6 +
>      include/hw/arm/allwinner-r40.h          | 148 +++++++
>      include/hw/i2c/allwinner-i2c.h          |   6 +
>      include/hw/misc/allwinner-r40-ccu.h     |  65 +++
>      include/hw/misc/allwinner-r40-dramc.h   | 108 +++++
>      include/hw/sd/allwinner-sdhost.h        |   9 +
>      21 files changed, 2191 insertions(+), 14 deletions(-)
>      create mode 100644 hw/arm/allwinner-r40.c
>      create mode 100644 hw/arm/bananapi_m2u.c
>      create mode 100644 hw/misc/allwinner-r40-ccu.c
>      create mode 100644 hw/misc/allwinner-r40-dramc.c
>      create mode 100644 hw/misc/axp221.c
>      create mode 100644 include/hw/arm/allwinner-r40.h
>      create mode 100644 include/hw/misc/allwinner-r40-ccu.h
>      create mode 100644 include/hw/misc/allwinner-r40-dramc.h
>
>     -- 
>     2.25.1
>
>
>
> -- 
> Niek Linnenbank
>


