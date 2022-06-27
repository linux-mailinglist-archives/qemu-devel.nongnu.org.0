Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B148C55B7E8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 08:17:44 +0200 (CEST)
Received: from localhost ([::1]:38646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5i47-0000LB-Ip
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 02:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simon.sapin@exyr.org>)
 id 1o5i1f-0007pe-Bm
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 02:15:11 -0400
Received: from r0-2.smtpout1.paris1.alwaysdata.com
 ([2a00:b6e0:1:40:1:0:10:6]:46183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simon.sapin@exyr.org>)
 id 1o5i1c-0000Pw-F6
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 02:15:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=alwaysdata.net; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a/HDckDCTgqMeUj3lqmuq9wc9NsWYnJ++VwBRdwDunM=; b=SLzYLTgGNVi6DdPhi4/5s6vFuA
 7hcVdnD4ltAZlU09y/yfsltBtswSXGNIV0g+LxZ5p59i4MsYNGqQVnZ5Pdg2qZO8nBu3IFwrYhYfN
 bZ+elMn7yzaCNYJs9ttnRk7XNGlSoH3TtyivtJ8ni5iEnVXzS87/m/ZXU9T6MYFzaIGI=;
Received: from [2a01:e34:ecb8:5a0:f192:bd1d:5684:24ee]
 by smtpout1.paris1.alwaysdata.com with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <simon.sapin@exyr.org>)
 id 1o5i1U-0002pw-Gc; Mon, 27 Jun 2022 08:15:00 +0200
Message-ID: <357832d7-6e23-4298-5dbf-cf9171e32e6e@exyr.org>
Date: Mon, 27 Jun 2022 08:15:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Booting bare-metal RISC-V virt (Was: [PATCH] Add some
 documentation for "dtb" devices tree blobs)
Content-Language: en-US-large
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
References: <20220625223458.1273408-1-simon.sapin@exyr.org>
 <da785d05-e322-2e40-7a89-e926256c6dbe@exyr.org>
 <CAKmqyKN+xvOseT_5XeFgZ=b77giU+wdaZy=w9OgEFL8EXNGDVg@mail.gmail.com>
From: Simon Sapin <simon.sapin@exyr.org>
In-Reply-To: <CAKmqyKN+xvOseT_5XeFgZ=b77giU+wdaZy=w9OgEFL8EXNGDVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-alwaysdata-ID: 127430093
Received-SPF: pass client-ip=2a00:b6e0:1:40:1:0:10:6;
 envelope-from=simon.sapin@exyr.org; helo=r0-2.smtpout1.paris1.alwaysdata.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 27/06/2022 07:40, Alistair Francis wrote:
> We have previously kept the addresses backwards compatible. So that
> software for an older virt machine will work on a newer one. There is
> currently talks about changing the virt machine memory layout in a
> breaking way and versioning in the current one though.
> 
> So I don't really have a good answer for you. I would recommend
> reading as much as possible from the device tree dynamically at boot.
> 
> In general though we don't want to break people, we just might have to
> make changes in the future to allow for new functionality.

I agree that reading from the device tree as much as possible is good. We there’s 
still a need to get code running at all, and finding the device tree.

So it would be good to decide to make stable what’s needed to get there (like was 
apparently decided for ARM) and document it.

On principle maybe a firmware/bootloader could be entirely position-independent? But 
in what I’ve done/seen so far https://docs.rs/riscv-rt/latest/riscv_rt/ has address 
ranges hard-coded in a linker script for different regions, and when passing an ELF 
file to -kernel, QEMU maps it to those addresses but boots at 0x8000_0000 regardless.


>> * With `qemu-system-riscv32 -machine virt -bios none -kernel something.elf -s -S`,
>> GDB shows that execution starts at the lowest address of RAM, not of flash like I
>> expected. Then what is emulated flash for?
> 
> If you supply a flash image we will start executing from flash automatically.

Passing with -drive? Should I use that instead of -kernel?


>> * To what extent is the above calling convention standardized? I found similar things
>> in coreboot[4] and in OpenSBI[5]
> 
> Good question. I don't think it's specified in a spec, but it is very common

Should we document this convention as something guest code can rely on?

-- 
Simon Sapin

