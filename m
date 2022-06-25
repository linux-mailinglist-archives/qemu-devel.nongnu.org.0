Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE6A55AD57
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 01:04:49 +0200 (CEST)
Received: from localhost ([::1]:53212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5Epc-0007Fe-3b
	for lists+qemu-devel@lfdr.de; Sat, 25 Jun 2022 19:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simon.sapin@exyr.org>)
 id 1o5EoV-0006Zq-V5
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 19:03:39 -0400
Received: from r0-2.smtpout1.paris1.alwaysdata.com
 ([2a00:b6e0:1:40:1:0:10:6]:42073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simon.sapin@exyr.org>)
 id 1o5EoT-0004W5-EH
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 19:03:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=alwaysdata.net; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Lzeue7Q3Kh02o2U6bOHOLxsJlW04vwVRFN3gqRkBPso=; b=hgZEvSMbtYOUkbWg8GvG8jquRl
 GOJ1gWeCaHTYurem1KG70mINT5+cCuN1C1kDifddBKKyqVsnMGVhynS9a1BYgw7Z20B0tlmcOEwtp
 8dlWxti8kExOotsUZmI1GJq/77NOelWuwYLa570xXTHPlT2GYuf1YOIUx+Dn2cdM7dJA=;
Received: from [2a01:e34:ecb8:5a0:f192:bd1d:5684:24ee]
 by smtpout1.paris1.alwaysdata.com with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <simon.sapin@exyr.org>)
 id 1o5EoN-0004ED-2y; Sun, 26 Jun 2022 01:03:31 +0200
Message-ID: <da785d05-e322-2e40-7a89-e926256c6dbe@exyr.org>
Date: Sun, 26 Jun 2022 01:03:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Booting bare-metal RISC-V virt (Was: [PATCH] Add some documentation
 for "dtb" devices tree blobs)
Content-Language: en_US
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
References: <20220625223458.1273408-1-simon.sapin@exyr.org>
From: Simon Sapin <simon.sapin@exyr.org>
In-Reply-To: <20220625223458.1273408-1-simon.sapin@exyr.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-alwaysdata-ID: 127190591
Received-SPF: pass client-ip=2a00:b6e0:1:40:1:0:10:6;
 envelope-from=simon.sapin@exyr.org; helo=r0-2.smtpout1.paris1.alwaysdata.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 26/06/2022 00:34, Simon Sapin wrote:
> +On startup, the dtb is memory-mapped and its address is passed to the guest
> +in a target-specific way:
> +
> +* Arm: :ref:`arm-baremetal`
> +* **TODO**: document other targets

Hello,

My current interest is playing with bare-metal / freestanding RISC-V, using QEMU as a 
reference emulator. Based on various blog posts, reading QEMU source code, and lots 
of trial-and-error I’ve managed to get something running[1] but it wasn’t easy.

In comparison, the docs for Arm virt have a very helpful section[2] for this 
scenario. I would like to contribute similar docs for RISC-V virt but I’d need 
confirmation of the information to put in it:

* Through `dumpdtb` I see that flash memory starts at address 0x2_000_0000, and RAM 
at 0x8_000_0000. Is this information that guest code can rely on and hard-code? What 
details can or cannot be similarly relied on?

* With `qemu-system-riscv32 -machine virt -bios none -kernel something.elf -s -S`, 
GDB shows that execution starts at the lowest address of RAM, not of flash like I 
expected. Then what is emulated flash for?

* What’s the difference between a bios and a kernel? The previous command is based on 
a blog post but I don’t fully quite the details.

* I see in source code[3] that QEMU passes some arguments to the firmware. Register 
a0 gets the hart ID, a1 is the dtb address, but what’s in a2?

* To what extent is the above calling convention standardized? I found similar things 
in coreboot[4] and in OpenSBI[5]


[1] https://github.com/SimonSapin/riscv-qemu-demo

[2] 
https://www.qemu.org/docs/master/system/arm/virt.html#hardware-configuration-information-for-bare-metal-programming

[3] https://gitlab.com/qemu-project/qemu/-/blob/v7.0.0/hw/riscv/boot.c#L297-317

[4] https://doc.coreboot.org/arch/riscv/index.html#stage-handoff-protocol

[5] 
https://github.com/riscv-software-src/opensbi/blob/v1.1/platform/generic/platform.c#L59-L75


Thanks!
-- 
Simon Sapin

