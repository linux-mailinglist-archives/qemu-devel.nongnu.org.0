Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2052742ED58
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:14:45 +0200 (CEST)
Received: from localhost ([::1]:60964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJIa-00078K-5w
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mbIui-0003k6-4j
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 04:50:07 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mbIub-0006tS-CD
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 04:50:03 -0400
Received: by mail-wr1-x433.google.com with SMTP id r10so25091721wra.12
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 01:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nMP6/CHo9TbZQ33flnK2L7QTAk7kl0SCozeB5KvbGw8=;
 b=oMdd/uRQZIsYkOuD/MR1uMJ2eNjDEwYXY1NExtpG5XwIDucriBsEvJW587VIk8YzAM
 erKwBGp3B9lfNaH/QdFkO9bzt+5MBpymolCAKx+IU4aoKaDVT0i5cfb6tLG1Jx+LUcK0
 YTTMhKwEAPzQ/87IDt9ZFKuiOZBk5nQLNm+2EhbR14Guu+OY9b1rKtjNy4a6dIsnY9KO
 xJtXuTwxYLJ5bhdoz8ScPhVyGWd0JoStxZZCtjesrXX4+UWWJRwbmiTdqemj8bDxE6n8
 sxLwh7znCHhkl43lPkODoW9VDx6ARV9rFlZHwsc6tOPh1ykcIMs3hk0UP9srNP4wlpqz
 SEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nMP6/CHo9TbZQ33flnK2L7QTAk7kl0SCozeB5KvbGw8=;
 b=GmyEdveJFyEztFTSiGjai4snIG4d2lWvAeMZGYqME6/OLaRTWzfEleMez2mqyW8GsV
 PG6rf+ef45cDjqHsz+QOkEMXlCXTK65GFuzZC8GoWG6ecm1nWjRb+BIBMNAkaq22Y6id
 FHFfsJtsqK21lyjJVtVA/+wB8dfm7PKWov43IYMqHclkTlJv/UaOQKbH80wZoNUcWxPS
 C8QGIlP/OzLwG64Dhi/08g6kBKfv9/KCyakr6ZLPPiHqBrKsVpyUP9LfR2V95nKo8sST
 r3eqRlWfc2oxGnG9SkKcTefmb+BXT01ocXSa82XjiydUtutH/OuJqUGK0MsC67ly5Ns5
 W7DQ==
X-Gm-Message-State: AOAM532hHHTwr6Ly5sCQnXZ5jeQBo2i/J/awBp7pQQ2WVnnxy2VqOUk/
 ZpQGoN7hZ2uGAFOBo3PQThc=
X-Google-Smtp-Source: ABdhPJyr0LZLAoDtSBIalca45GAx6VZkSP89MrjOVs21YyAXIJmBMc9RWmyT1ixd6FVeoR2Ka0n02A==
X-Received: by 2002:a05:6000:1884:: with SMTP id
 a4mr12902304wri.356.1634287794775; 
 Fri, 15 Oct 2021 01:49:54 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id d8sm4535034wrv.80.2021.10.15.01.49.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 01:49:54 -0700 (PDT)
Message-ID: <f840d219-5562-f4af-8eeb-7c7df87f4741@amsat.org>
Date: Fri, 15 Oct 2021 10:49:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 0/3] hw/mips/boston: ELF kernel support
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20211002184539.169-1-jiaxun.yang@flygoat.com>
 <b039e68a-e591-a5d3-9e95-cde45c7d0bd8@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <b039e68a-e591-a5d3-9e95-cde45c7d0bd8@flygoat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: aleksandar.rikalo@syrmia.com, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/21 15:58, Jiaxun Yang wrote:
> ping?
> 
> 在 2021/10/2 19:45, Jiaxun Yang 写道:
>> Jiaxun Yang (3):
>>    hw/mips/boston: Massage memory map information
>>    hw/mips/boston: Allow loading elf kernel and dtb
>>    hw/mips/boston: Add FDT generator

Next time please run checkpatch.pl before submitting,
see
https://blog.vmsplice.net/2011/03/how-to-automatically-run-checkpatchpl.html

2/4 Checking commit 5c65dfb784f3 (hw/mips/boston: Massage memory map
information)
WARNING: line over 80 characters
#108: FILE: hw/mips/boston.c:372:
+                                 1, boston_memmap[BOSTON_LOWDDR].base,
1, ram_low_sz,

WARNING: line over 80 characters
#109: FILE: hw/mips/boston.c:373:
+                                 1, boston_memmap[BOSTON_HIGHDDR].base
+ ram_low_sz,

WARNING: line over 80 characters
#119: FILE: hw/mips/boston.c:478:
+    memory_region_init_rom(flash, NULL, "boston.flash",
boston_memmap[BOSTON_FLASH].size,

WARNING: line over 80 characters
#122: FILE: hw/mips/boston.c:480:
+    memory_region_add_subregion_overlap(sys_mem,
boston_memmap[BOSTON_FLASH].base,

WARNING: line over 80 characters
#126: FILE: hw/mips/boston.c:483:
+    memory_region_add_subregion_overlap(sys_mem,
boston_memmap[BOSTON_HIGHDDR].base,

WARNING: line over 80 characters
#178: FILE: hw/mips/boston.c:526:
+    memory_region_add_subregion_overlap(sys_mem,
boston_memmap[BOSTON_LCD].base, lcd, 0);

3/4 Checking commit 5bb14fa00b48 (hw/mips/boston: Allow loading elf
kernel and dtb)
WARNING: line over 80 characters
#58: FILE: hw/mips/boston.c:567:
+                dtb_load_data = boston_fdt_filter(s, dtb_file_data,
NULL, &dtb_vaddr);

4/4 Checking commit 04f5b1319a3d (hw/mips/boston: Add FDT generator)
WARNING: line over 80 characters
#56: FILE: hw/mips/boston.c:459:
+    qemu_fdt_setprop_string(fdt, name, "compatible",
"xlnx,axi-pcie-host-1.00.a");

WARNING: line over 80 characters
#92: FILE: hw/mips/boston.c:495:
+    qemu_fdt_setprop(fdt, name, "interrupt-map", &interrupt_map,
sizeof(interrupt_map));

WARNING: line over 80 characters
#98: FILE: hw/mips/boston.c:501:
+static const void *create_fdt(BostonState *s, const MemMapEntry
*memmap, int *dt_size)

WARNING: line over 80 characters
#105: FILE: hw/mips/boston.c:508:
+    static const char * const syscon_compat[2] =
{"img,boston-platform-regs", "syscon"};

WARNING: line over 80 characters
#144: FILE: hw/mips/boston.c:547:
+    fdt_create_pcie(fdt, gic_ph, 2, memmap[BOSTON_PCIE0].base,
memmap[BOSTON_PCIE0].size,

WARNING: line over 80 characters
#145: FILE: hw/mips/boston.c:548:
+                    memmap[BOSTON_PCIE0_MMIO].base,
memmap[BOSTON_PCIE0_MMIO].size);

WARNING: line over 80 characters
#147: FILE: hw/mips/boston.c:550:
+    fdt_create_pcie(fdt, gic_ph, 1, memmap[BOSTON_PCIE1].base,
memmap[BOSTON_PCIE1].size,

WARNING: line over 80 characters
#148: FILE: hw/mips/boston.c:551:
+                    memmap[BOSTON_PCIE1_MMIO].base,
memmap[BOSTON_PCIE1_MMIO].size);

WARNING: line over 80 characters
#150: FILE: hw/mips/boston.c:553:
+    fdt_create_pcie(fdt, gic_ph, 0, memmap[BOSTON_PCIE2].base,
memmap[BOSTON_PCIE2].size,

WARNING: line over 80 characters
#151: FILE: hw/mips/boston.c:554:
+                    memmap[BOSTON_PCIE2_MMIO].base,
memmap[BOSTON_PCIE2_MMIO].size);

WARNING: line over 80 characters
#196: FILE: hw/mips/boston.c:599:
+    qemu_fdt_setprop_cells(fdt, platreg_name, "reg",
memmap[BOSTON_PLATREG].base,

WARNING: line over 80 characters
#278: FILE: hw/mips/boston.c:786:
+            dtb_load_data = boston_fdt_filter(s, dtb_file_data, NULL,
&dtb_vaddr);

For now I'll fix that locally.

