Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4615930DFD8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:38:10 +0100 (CET)
Received: from localhost ([::1]:58524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7LAP-0004ey-89
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:38:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7L7q-0002oQ-OK; Wed, 03 Feb 2021 11:35:30 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:42837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7L7n-0004Oi-DY; Wed, 03 Feb 2021 11:35:30 -0500
Received: by mail-ed1-x52e.google.com with SMTP id z22so282711edb.9;
 Wed, 03 Feb 2021 08:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eGmNkCScX26h0PduqMYxigfd4oa0Xjbk5fcZes3t+Sg=;
 b=G4mPbCLa274yN62A0CIYoxS6GduhFCZoY7Bez/l5SGLNzk3uhBFm76ij7klFJfMpA7
 C3qnlwoDnxHD5PaSof1eFyoiTsBA6mdcJxMG5pSWLAjii4IIm1GOVFHGcDMRV/SLcZiv
 gem027+KH20BezqPNELKdnleGrpFH4VmpP6XZwotTmPlxloMSYmeLsloYS2L0WbI5B7W
 O2swt0FU277aEHrJHtrtaITyjncSnpjA/99DDHh9rjKrSv3GQCzeIXdrk96QsjpOe1ez
 XvF2AndyQVng996gOIyDjfk7+fQtlGgxi8EIvNrQ9og1PVWeUNTZmONdYbI4BqPa1yhs
 HQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eGmNkCScX26h0PduqMYxigfd4oa0Xjbk5fcZes3t+Sg=;
 b=mESvoClbGNdPbfNwfSUmQJxUwF3ft/mgS8Ay/qhCOXN9LCusn2ZGZaOppPXkxLc52r
 GnaGuEmcULWvYWM0TWYZ4YaDfr8LjELThFbIcuqfmc1DL7N5OKQbY7BVszasda0zM0so
 6ATVuC1wEwtJThl0pXOLtabe+CSc42TsqcRlTseoO1xWFuYzoya1F71gNfJsqG9W35Tg
 +X0hNxyJCJm9KfIJvPUeZUbBjmipiBOT3zoGMtOYLl94U79zEzP4aLL49IsIoIeyC7Gd
 uxF2D4/ZtHOT/KI4KGv1mFj2jOk+1lekcDBBH755s0DEdI9G6HGxzajj+BvevqfpEkfa
 Y4pA==
X-Gm-Message-State: AOAM533tkA0JQBjYS+giOiToqX3Z8u76K3ztsU7DrNELUWbPgQDX9N9e
 GiTLaJiSv2zHIcQXFn5crKs=
X-Google-Smtp-Source: ABdhPJwHc9y/CysdKMlcin3EYw81Rw5JeW0sqlmT54FO7wp93oX6Do1lmBUnAOzq17MIYxnOLaZzAQ==
X-Received: by 2002:aa7:d045:: with SMTP id n5mr3878192edo.306.1612370122060; 
 Wed, 03 Feb 2021 08:35:22 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id j9sm1142466edr.25.2021.02.03.08.35.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 08:35:21 -0800 (PST)
Subject: Re: [PATCH 4/8] hw/ppc/ppc440_bamboo: Drop use of ppcuic_init()
To: avocado-devel <avocado-devel@redhat.com>
References: <20201212001537.24520-1-peter.maydell@linaro.org>
 <20201212001537.24520-5-peter.maydell@linaro.org>
 <20210111010028.GA3499905@ubuntu-m3-large-x86>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1e76accf-08cb-4633-d9cd-7296560c9bad@amsat.org>
Date: Wed, 3 Feb 2021 17:35:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210111010028.GA3499905@ubuntu-m3-large-x86>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.178,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing avocado-devel for test idea.

On 1/11/21 2:00 AM, Nathan Chancellor wrote:
> On Sat, Dec 12, 2020 at 12:15:33AM +0000, Peter Maydell wrote:
>> Switch the bamboo board to directly creating and configuring the UIC,
>> rather than doing it via the old ppcuic_init() helper function.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  hw/ppc/ppc440_bamboo.c | 38 +++++++++++++++++++++++++++-----------
>>  1 file changed, 27 insertions(+), 11 deletions(-)
...
> 
> Hopefully reporting this here is okay, I find Launchpad hard to use but
> I can file it there if need be.
> 
> This patch causes a panic while trying to boot a ppc44x_defconfig Linux
> kernel:
> 
> $ qemu-system-ppc \
>     -machine bamboo \
>     -no-reboot \
>     -append console=ttyS0 \
>     -display none \
>     -kernel uImage \
>     -m 128m \
>     -nodefaults \
>     -serial mon:stdio
> Linux version 5.11.0-rc3 (nathan@ubuntu-m3-large-x86) (powerpc-linux-gcc (GCC) 10.2.0, GNU ld (GNU Binutils) 2.35) #1 Sun Jan 10 15:52:24 MST 2021
> Using PowerPC 44x Platform machine description
> ioremap() called early from find_legacy_serial_ports+0x64c/0x794. Use early_ioremap() instead
> printk: bootconsole [udbg0] enabled
> -----------------------------------------------------
> phys_mem_size     = 0x8000000
> dcache_bsize      = 0x20
> icache_bsize      = 0x20
> cpu_features      = 0x0000000000000100
>   possible        = 0x0000000040000100
>   always          = 0x0000000000000100
> cpu_user_features = 0x8c008000 0x00000000
> mmu_features      = 0x00000008
> -----------------------------------------------------
> Zone ranges:
>   Normal   [mem 0x0000000000000000-0x0000000007ffffff]
> Movable zone start for each node
> Early memory node ranges
>   node   0: [mem 0x0000000000000000-0x0000000007ffffff]
> Initmem setup node 0 [mem 0x0000000000000000-0x0000000007ffffff]
> MMU: Allocated 1088 bytes of context maps for 255 contexts
> Built 1 zonelists, mobility grouping on.  Total pages: 32448
> Kernel command line: console=ttyS0
> Dentry cache hash table entries: 16384 (order: 4, 65536 bytes, linear)
> Inode-cache hash table entries: 8192 (order: 3, 32768 bytes, linear)
> mem auto-init: stack:off, heap alloc:off, heap free:off
> Memory: 122712K/131072K available (5040K kernel code, 236K rwdata, 1260K rodata, 200K init, 134K bss, 8360K reserved, 0K cma-reserved)
> Kernel virtual memory layout:
>   * 0xffbdf000..0xfffff000  : fixmap
>   * 0xffbdd000..0xffbdf000  : early ioremap
>   * 0xd1000000..0xffbdd000  : vmalloc & ioremap
> SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
> NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
> Oops: Exception in kernel mode, sig: 4 [#1]
> BE PAGE_SIZE=4K PowerPC 44x Platform
> Modules linked in:
> CPU: 0 PID: 0 Comm: swapper Not tainted 5.11.0-rc3 #1
> NIP:  c0019e58 LR: c062e3a0 CTR: c0019e58
> REGS: c067fe90 TRAP: 0700   Not tainted  (5.11.0-rc3)
> MSR:  000a1000 <CE,ME>  CR: 84000224  XER: 20000000
> 
> GPR00: c062e370 c067ff50 c065c300 c0019e58 00000000 c0019238 c067fde0 c065c300
> GPR08: 00000000 00000000 c066fca4 00000066 84000222 00000000 00000000 00000000
> GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 c0000010 00000000
> GPR24: c0651594 c0651594 c0690000 c7ffe080 c0690000 c05c6f64 c0680000 c0802100
> NIP [c0019e58] __mtdcr_table+0xc20/0x3ff8
> LR [c062e3a0] uic_init_one+0x13c/0x214
> Call Trace:
> [c067ff50] [c062e370] uic_init_one+0x10c/0x214 (unreliable)
> [c067ff80] [c062e4f8] uic_init_tree+0x80/0x174
> [c067ffb0] [c0627af8] start_kernel+0x33c/0x508
> [c067fff0] [c0000044] _start+0x44/0x88
> Instruction dump:
> 7c9f2b86 4e800020 7c603286 4e800020 7c803386 4e800020 7c613286 4e800020
> 7c813386 4e800020 7c623286 4e800020 <7c823386> 4e800020 7c633286 4e800020
> random: get_random_bytes called from oops_exit+0x44/0x84 with crng_init=0
> ---[ end trace 0000000000000000 ]---
> 
> Kernel panic - not syncing: Attempted to kill the idle task!
> Rebooting in 180 seconds..
> 
> I have uploaded the kernel image here:
> 
> https://github.com/nathanchance/bug-files/blob/8edf230441bd8eda067973fdf0eb063c94f04379/qemu-0270d74ef886235051c13c39b0de88500c628a02/uImage
> 
> Do note that this is not the only commit that causes an issue on this
> machine, there is also a few assertion failures which I am about to
> report as well.
> 
> Cheers,
> Nathan
> 


