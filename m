Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6DA2F0FA6
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 11:06:03 +0100 (CET)
Received: from localhost ([::1]:39818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyu5J-0006Rk-Qa
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 05:06:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyu3t-0005PF-Q0; Mon, 11 Jan 2021 05:04:33 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:32780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyu3r-0008Co-Fs; Mon, 11 Jan 2021 05:04:33 -0500
Received: by mail-ed1-x536.google.com with SMTP id j16so18221667edr.0;
 Mon, 11 Jan 2021 02:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fTFz3qRoDJIgxZ1g7nyZjqaNVheymhyk7daTsn9f8mk=;
 b=IKAkO3dJBw+QFpmOego+9jkDojniPYF4x4YZrBLQLTtES+eo3K1B0g/zttZQl+Www7
 TCckEFcDJ5zYD3ejpVQ1sMFupBAS7LryV5yLnvEBlIYZNDZY0r0OqBDx33FyYYxA47jl
 wblvxX60SYl5LS2np3yJUMLFaxKAeu2AgapSBox74FPES/xGKKPslP/gZB9X6WZ2eW31
 aRNXnZwrGHI1mFDZihcscnbtajxvsdIzPzgP5L0EoP+D0FYFHnJJgQ7mNtxq2b9reHh5
 IkTr2K3SfPUG9kXO7i9v+Nsaec8icpvnrJRhEl6MCGli96+qWFIM9lfjvPc88xSF7+c2
 H5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fTFz3qRoDJIgxZ1g7nyZjqaNVheymhyk7daTsn9f8mk=;
 b=UnKxZ113zfYvh531MrNk6onPvH8sbG8fmaDbQtWkfo7GOh+WSbSD1/ZYKGpJ/jV4BC
 hpBWyNAVB4ZZ2LcLhGDBWCKh9Fl9ljlcHB1dl3sgiYdALPmwAMlFxzRLZSUl03GBeQks
 F6QK1yK77VrUe0d9fr2sWTPEAwBl4pYloF5wUlrE1Oh2O7iMQL4KxSp67kGfEwBSeFPz
 YR7j1Ea3T5H6HfT1UMBPZrB6tpC3LXiLXqB6EhilTdQlRfQ111SdspKlFMgKs/n8XMjt
 ncwsQ11I/RKZU9qmGcjLUeiIq+90mCA5dCI7b7JGs7IpbWDqcUcgpo7NY7leUrabbLIz
 79tw==
X-Gm-Message-State: AOAM530MN+vekOC1J7RgGWnmzHSJCtAt2HlNNm6cyEpyQ/eWt2cZdVFL
 qGEl9HOheNmGkQmyTEEUxRk=
X-Google-Smtp-Source: ABdhPJy5/TaNR2hch//6fUUeaDC8EWJ/Ojcvvb3/g3RyprxKweoTMbDTfb4ZaV3ZAFoIXDOhgCog7w==
X-Received: by 2002:a05:6402:1516:: with SMTP id
 f22mr13311067edw.382.1610359468915; 
 Mon, 11 Jan 2021 02:04:28 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id t26sm6874307eji.22.2021.01.11.02.04.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 02:04:27 -0800 (PST)
Subject: Re: [PATCH 4/5] hw/ppc/ppc4xx_pci: Replace pointless warning by
 assert()
To: Nathan Chancellor <natechancellor@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200901104043.91383-1-f4bug@amsat.org>
 <20200901104043.91383-5-f4bug@amsat.org>
 <20210111011117.GA215408@ubuntu-m3-large-x86>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9bf21ccd-7e23-8329-35b8-bf09d35e335b@amsat.org>
Date: Mon, 11 Jan 2021 11:04:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210111011117.GA215408@ubuntu-m3-large-x86>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.012,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-trivial@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Huacai Chen <chenhc@lemote.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Peter

On 1/11/21 2:11 AM, Nathan Chancellor wrote:
> On Tue, Sep 01, 2020 at 12:40:42PM +0200, Philippe Mathieu-DaudÃƒÂ© wrote:
>> We call pci_register_root_bus() to register 4 IRQs with the
>> ppc4xx_pci_set_irq() handler. As it can only be called with
>> values in the [0-4[ range, replace the pointless warning by
>> an assert().
>>
>> Signed-off-by: Philippe Mathieu-DaudÃƒÂ© <f4bug@amsat.org>
>> ---
>>  hw/ppc/ppc4xx_pci.c | 5 +----
>>  1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
>> index cd3f192a138..503ef46b39a 100644
>> --- a/hw/ppc/ppc4xx_pci.c
>> +++ b/hw/ppc/ppc4xx_pci.c
>> @@ -256,10 +256,7 @@ static void ppc4xx_pci_set_irq(void *opaque, int irq_num, int level)
>>      qemu_irq *pci_irqs = opaque;
>>  
>>      trace_ppc4xx_pci_set_irq(irq_num);
>> -    if (irq_num < 0) {
>> -        fprintf(stderr, "%s: PCI irq %d\n", __func__, irq_num);
>> -        return;
>> -    }
>> +    assert(irq_num >= 0);
>>      qemu_set_irq(pci_irqs[irq_num], level);
>>  }
>>  
>> -- 
>> 2.26.2
>>
>>
> 
> Hopefully reporting this here is okay, I find Launchpad hard to use but
> I can file it there if need be.
> 
> The assertion added by this patch triggers while trying to boot a
> ppc44x_defconfig Linux kernel:
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
...
> PCI: Probing PCI hardware
> PCI host bridge to bus 0000:00
> pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
> pci_bus 0000:00: root bus resource [mem 0xa0000000-0xbfffffff]
> pci_bus 0000:00: root bus resource [bus 00-ff]
> pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to ff
> pci 0000:00:00.0: [1014:027f] type 00 class 0x068000
> qemu-system-ppc: ../hw/ppc/ppc4xx_pci.c:259: ppc4xx_pci_set_irq: Assertion `irq_num >= 0' failed.
> 
> On v5.2.0, it looks like a higher assertion triggers, added by
> commit 459ca8bfa4 ("pci: Assert irqnum is between 0 and bus->nirqs in
> pci_bus_change_irq_level").
> 
> qemu-system-ppc: ../hw/pci/pci.c:253: pci_bus_change_irq_level: Assertion `irq_num >= 0' failed.

Running with '-trace ppc4xx_pci\*':

1275265@1610357661.994462:ppc4xx_pci_map_irq devfn 0x0 irq 0 -> 0
1275265@1610357661.994480:ppc4xx_pci_set_irq PCI irq -1

(gdb) bt
#0  0x00007fc70a8a19e5 in raise () at /lib64/libc.so.6
#1  0x00007fc70a88a895 in abort () at /lib64/libc.so.6
#2  0x00007fc70a88a769 in _nl_load_domain.cold () at /lib64/libc.so.6
#3  0x00007fc70a899e76 in annobin_assert.c_end () at /lib64/libc.so.6
#4  0x0000560953c2bfe0 in ppc4xx_pci_set_irq (opaque=0x560955dcf9a0,
irq_num=-1, level=0) at hw/ppc/ppc4xx_pci.c:259
#5  0x0000560953a20474 in pci_change_irq_level (pci_dev=0x560955dd0e40,
irq_num=-1, change=0) at hw/pci/pci.c:262
#6  0x0000560953a1d028 in pci_update_irq_disabled (d=0x560955dd0e40,
was_irq_disabled=0) at hw/pci/pci.c:1375
#7  0x0000560953a1ccb3 in pci_default_write_config (d=0x560955dd0e40,
addr=4, val_in=1030, l=2) at hw/pci/pci.c:1415
#8  0x0000560953978977 in pci_host_config_write_common
(pci_dev=0x560955dd0e40, addr=4, limit=256, val=1030, len=2) at
hw/pci/pci_host.c:83
#9  0x0000560953978cb9 in pci_data_write (s=0x560955dd0210,
addr=2147483652, val=1030, len=2) at hw/pci/pci_host.c:120
#10 0x0000560953978eeb in pci_host_data_write (opaque=0x560955dcf350,
addr=0, val=1030, len=2) at hw/pci/pci_host.c:167

How can irq be -1? pci_update_irq_disabled() hasn't been updated
since commit a7b15a5cc626 (2009-12-23):

1368 static void pci_update_irq_disabled(PCIDevice *d, int was_irq_disabled)
1369 {
1370     int i, disabled = pci_irq_disabled(d);
1371     if (disabled == was_irq_disabled)
1372         return;
1373     for (i = 0; i < PCI_NUM_PINS; ++i) {
1374         int state = pci_irq_state(d, i);
1375         pci_change_irq_level(d, i, disabled ? -state : state);
1376     }
1377 }

Let's rebuild using --enable-sanitizers to check an overflow occured:

1286013@1610358549.342593:ppc4xx_pci_map_irq devfn 0x0 irq 0 -> 0
=================================================================
==1286011==ERROR: AddressSanitizer: heap-buffer-overflow on address
0x60200004f78c at pc 0x55b6d738454c bp 0x7f779b9f7810 sp 0x7f779b9f7808
READ of size 4 at 0x60200004f78c thread T2
    #0 0x55b6d738454b in pci_change_irq_level hw/pci/pci.c:261:29
    #1 0x55b6d73763be in pci_update_irq_disabled hw/pci/pci.c:1375:9
    #2 0x55b6d7374e2d in pci_default_write_config hw/pci/pci.c:1415:9
    #3 0x55b6d70cb8ec in pci_host_config_write_common hw/pci/pci_host.c:83:5
    #4 0x55b6d70cc43f in pci_data_write hw/pci/pci_host.c:120:5
    #5 0x55b6d70ccd43 in pci_host_data_write hw/pci/pci_host.c:167:9
    #6 0x55b6d8505348 in memory_region_write_accessor softmmu/memory.c:483:5
    #7 0x55b6d8504c1a in access_with_adjusted_size softmmu/memory.c:544:18
    #8 0x55b6d8503316 in memory_region_dispatch_write
softmmu/memory.c:1465:16
    #9 0x55b6d878ab51 in flatview_write_continue exec.c:3177:23
    #10 0x55b6d8779046 in flatview_write exec.c:3217:14
    #11 0x55b6d879d1ab in subpage_write exec.c:2829:12
    #12 0x55b6d8505af7 in memory_region_write_with_attrs_accessor
softmmu/memory.c:503:12
    #13 0x55b6d8504af4 in access_with_adjusted_size softmmu/memory.c:539:18
    #14 0x55b6d850376e in memory_region_dispatch_write
softmmu/memory.c:1472:13
    #15 0x55b6d8485b60 in io_writex accel/tcg/cputlb.c:1121:9
    #16 0x55b6d845ef8b in store_helper accel/tcg/cputlb.c:2140:13
    #17 0x55b6d845f558 in helper_le_stw_mmu accel/tcg/cputlb.c:2194:5
    #18 0x7f77a40c0252  (<unknown module>)

0x60200004f78c is located 4 bytes to the left of 16-byte region
[0x60200004f790,0x60200004f7a0)
allocated by thread T0 here:
    #0 0x55b6d6ab9227 in calloc (qemu-system-ppc+0x1a9f227)
    #1 0x7f77f3ab19b0 in g_malloc0 (/lib64/libglib-2.0.so.0+0x589b0)
    #2 0x55b6d7370ef0 in pci_register_root_bus hw/pci/pci.c:493:5
    #3 0x55b6d7dec5de in ppc4xx_pcihost_realize hw/ppc/ppc4xx_pci.c:318:9
    #4 0x55b6d8a04ffb in device_set_realized hw/core/qdev.c:864:13
    #5 0x55b6d89309e8 in property_set_bool qom/object.c:2202:5
    #6 0x55b6d8928f92 in object_property_set qom/object.c:1349:5
    #7 0x55b6d891aa29 in object_property_set_qobject qom/qom-qobject.c:28:10
    #8 0x55b6d8929d71 in object_property_set_bool qom/object.c:1416:15
    #9 0x55b6d89f76fc in qdev_realize hw/core/qdev.c:379:12
    #10 0x55b6d89f7734 in qdev_realize_and_unref hw/core/qdev.c:386:11
    #11 0x55b6d7ccc37e in sysbus_realize_and_unref hw/core/sysbus.c:261:12
    #12 0x55b6d7ccc0a3 in sysbus_create_varargs hw/core/sysbus.c:236:5
    #13 0x55b6d7dbce60 in bamboo_init hw/ppc/ppc440_bamboo.c:212:11
    #14 0x55b6d6c3cdae in machine_run_board_init hw/core/machine.c:1144:5
    #15 0x55b6d86893ee in qemu_init softmmu/vl.c:4355:5
    #16 0x55b6d6af0f49 in main softmmu/main.c:49:5
    #17 0x7f77f23bd041 in __libc_start_main (/lib64/libc.so.6+0x27041)

Thread T2 created by T0 here:
    #0 0x55b6d6a32bb6 in pthread_create (qemu-system-ppc+0x1a18bb6)
    #1 0x55b6d92a1df4 in qemu_thread_create util/qemu-thread-posix.c:558:11
    #2 0x55b6d8807dc5 in qemu_tcg_init_vcpu softmmu/cpus.c:1926:13
    #3 0x55b6d8807142 in qemu_init_vcpu softmmu/cpus.c:2047:9
    #4 0x55b6d7e79f88 in ppc_cpu_realize
target/ppc/translate_init.c.inc:10146:5
    #5 0x55b6d8a04ffb in device_set_realized hw/core/qdev.c:864:13
    #6 0x55b6d89309e8 in property_set_bool qom/object.c:2202:5
    #7 0x55b6d8928f92 in object_property_set qom/object.c:1349:5
    #8 0x55b6d891aa29 in object_property_set_qobject qom/qom-qobject.c:28:10
    #9 0x55b6d8929d71 in object_property_set_bool qom/object.c:1416:15
    #10 0x55b6d89f76fc in qdev_realize hw/core/qdev.c:379:12
    #11 0x55b6d724d4db in cpu_create hw/core/cpu.c:62:10
    #12 0x55b6d7dbc024 in bamboo_init hw/ppc/ppc440_bamboo.c:183:11
    #13 0x55b6d6c3cdae in machine_run_board_init hw/core/machine.c:1144:5
    #14 0x55b6d86893ee in qemu_init softmmu/vl.c:4355:5
    #15 0x55b6d6af0f49 in main softmmu/main.c:49:5
    #16 0x7f77f23bd041 in __libc_start_main (/lib64/libc.so.6+0x27041)

SUMMARY: AddressSanitizer: heap-buffer-overflow hw/pci/pci.c:261:29 in
pci_change_irq_level
Shadow bytes around the buggy address:
  0x0c0480001ea0: fa fa fd fd fa fa fd fd fa fa 00 06 fa fa 00 02
  0x0c0480001eb0: fa fa fd fd fa fa fd fd fa fa 00 06 fa fa 00 02
  0x0c0480001ec0: fa fa fd fd fa fa fd fd fa fa 00 06 fa fa 00 02
  0x0c0480001ed0: fa fa 00 00 fa fa 00 00 fa fa 00 01 fa fa 05 fa
  0x0c0480001ee0: fa fa 06 fa fa fa fd fd fa fa 06 fa fa fa 00 03
=>0x0c0480001ef0: fa[fa]00 00 fa fa fd fa fa fa fd fa fa fa fd fa
  0x0c0480001f00: fa fa fd fa fa fa 00 01 fa fa fd fd fa fa fd fa
  0x0c0480001f10: fa fa fd fd fa fa 00 02 fa fa fd fa fa fa 00 02
  0x0c0480001f20: fa fa 05 fa fa fa 07 fa fa fa 00 01 fa fa 07 fa
  0x0c0480001f30: fa fa 05 fa fa fa 07 fa fa fa fd fd fa fa 00 02
  0x0c0480001f40: fa fa 05 fa fa fa 07 fa fa fa 00 01 fa fa 07 fa
Shadow byte legend (one shadow byte represents 8 application bytes):
  Addressable:           00
  Partially addressable: 01 02 03 04 05 06 07
  Heap left redzone:       fa
  Freed heap region:       fd
  Stack left redzone:      f1
  Stack mid redzone:       f2
  Stack right redzone:     f3
  Stack after return:      f5
  Stack use after scope:   f8
  Global redzone:          f9
  Global init order:       f6
  Poisoned by user:        f7
  Container overflow:      fc
  Array cookie:            ac
  Intra object redzone:    bb
  ASan internal:           fe
  Left alloca redzone:     ca
  Right alloca redzone:    cb
  Shadow gap:              cc
==1286011==ABORTING

I see this sysbus_create_varargs() call in bamboo_init()
has recently been updated by Peter in commit 0270d74ef88
("hw/ppc/ppc440_bamboo: Drop use of ppcuic_init()").

Running with current master (7b09f127738) the assert is
not reached:

Linux version 5.11.0-rc3 (nathan@ubuntu-m3-large-x86) (powerpc-linux-gcc
(GCC) 10.2.0, GNU ld (GNU Binutils) 2.35) #1 Sun Jan 10 15:52:24 MST 2021
Using PowerPC 44x Platform machine description
ioremap() called early from find_legacy_serial_ports+0x64c/0x794. Use
early_ioremap() instead
printk: bootconsole [udbg0] enabled
-----------------------------------------------------
phys_mem_size     = 0x8000000
dcache_bsize      = 0x20
icache_bsize      = 0x20
cpu_features      = 0x0000000000000100
  possible        = 0x0000000040000100
  always          = 0x0000000000000100
cpu_user_features = 0x8c008000 0x00000000
mmu_features      = 0x00000008
-----------------------------------------------------
Zone ranges:
  Normal   [mem 0x0000000000000000-0x0000000007ffffff]
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000000000000-0x0000000007ffffff]
Initmem setup node 0 [mem 0x0000000000000000-0x0000000007ffffff]
MMU: Allocated 1088 bytes of context maps for 255 contexts
Built 1 zonelists, mobility grouping on.  Total pages: 32448
Kernel command line: console=ttyS0
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes, linear)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes, linear)
mem auto-init: stack:off, heap alloc:off, heap free:off
Memory: 122712K/131072K available (5040K kernel code, 236K rwdata, 1260K
rodata, 200K init, 134K bss, 8360K reserved, 0K cma-reserved)
Kernel virtual memory layout:
  * 0xffbdf000..0xfffff000  : fixmap
  * 0xffbdd000..0xffbdf000  : early ioremap
  * 0xd1000000..0xffbdd000  : vmalloc & ioremap
SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
Oops: Exception in kernel mode, sig: 4 [#1]
BE PAGE_SIZE=4K PowerPC 44x Platform
Modules linked in:
CPU: 0 PID: 0 Comm: swapper Not tainted 5.11.0-rc3 #1
NIP:  c0019e58 LR: c062e3a0 CTR: c0019e58
REGS: c067fe90 TRAP: 0700   Not tainted  (5.11.0-rc3)
MSR:  000a1000 <CE,ME>  CR: 84000224  XER: 20000000

GPR00: c062e370 c067ff50 c065c300 c0019e58 00000000 c0019238 c067fde0
c065c300
GPR08: 00000000 00000000 c066fca4 00000066 84000222 00000000 00000000
00000000
GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 c0000010
00000000
GPR24: c0651594 c0651594 c0690000 c7ffe080 c0690000 c05c6f64 c0680000
c0802100
NIP [c0019e58] __mtdcr_table+0xc20/0x3ff8
LR [c062e3a0] uic_init_one+0x13c/0x214
Call Trace:
[c067ff50] [c062e370] uic_init_one+0x10c/0x214 (unreliable)
[c067ff80] [c062e4f8] uic_init_tree+0x80/0x174
[c067ffb0] [c0627af8] start_kernel+0x33c/0x508
[c067fff0] [c0000044] _start+0x44/0x88
Instruction dump:
7c9f2b86 4e800020 7c603286 4e800020 7c803386 4e800020 7c613286 4e800020
7c813386 4e800020 7c623286 4e800020 <7c823386> 4e800020 7c633286 4e800020
random: get_random_bytes called from oops_exit+0x44/0x84 with crng_init=0
---[ end trace 0000000000000000 ]---

Kernel panic - not syncing: Attempted to kill the idle task!
Rebooting in 180 seconds..

I suppose we can end this thread as NOTABUG.

Thanks for testing and your report,

Phil.

