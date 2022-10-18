Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 682EC6024A4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 08:41:36 +0200 (CEST)
Received: from localhost ([::1]:60426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okgI9-00011Q-LJ
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 02:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okfjj-0007dW-OU
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:06:11 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:37713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okfjX-0006Gk-5W
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:05:56 -0400
Received: by mail-il1-x133.google.com with SMTP id 8so6976816ilj.4
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 23:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gcQvgbhx0qt7pa6W5Oz0mXkhhAvpCTYW9MZ4Lpc/vsU=;
 b=cZzP0iWYfBdpoelbxjjHwg8kfgGLFfDRbZYRJ+tuq342+yXYxm4C32nTb6lNJ+RQ04
 8ZjSfOu6ySx0lPZlpSA908hKPbwIav7JuRoBLaaU7f9AaM5GKA8R9IEWddP5EhAwn7pV
 0xdwJB4Qf5AVq9E/6g2O0Os3AygLyvSVec6PM4rCRkYlJ9+zfitODTw5wVV0zng9ffQK
 Pvt1oYDKNJYtSqgvVLEzJgSiBi/oOV8k+zWJf1xb7dAAZ8ATPKVZGpOPuN0Dc5tBt2Ax
 o0jfSGkyyEafayeMzorncOZKTJjopM77D6/oetI4G3mAsUqur9g5Ic1Z5y5fJW9icXs1
 Q1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gcQvgbhx0qt7pa6W5Oz0mXkhhAvpCTYW9MZ4Lpc/vsU=;
 b=WYqsTcXCn1ZnpvjUGIHTOWW5kVKKP9dkAQJvgaV0GvltIE9Z7UPK0o+4MfU4ftTVk5
 mHKxIj9IyRq43wclMpy5Roz4O5S+EOeLKgbVcIspKAxMgeVgDMuVMhSJHqSJD+3NLono
 6jqQuVJo3jOukGzc7C27kAKXeDU9igslU6y6QHP3PEwpeZ2kdOiCpDvWyUlVEqTcpdm+
 vW6aRWHjR6ztwTeWjoTBg9kpEg1GbADXuCXdd/acNePlQcRBza9D2UZl+11DRbSdNF+R
 D/0KIpInnaHlxG86tEWYpllfHoOQeXX+wWzPD9ePkJxbDhKbutJvNPv5B7SnC5K5Aqys
 5P6w==
X-Gm-Message-State: ACrzQf355hVC9cEmvIhwUsek72PuKBKAaT475OTIBt9UzlieR7PXGijM
 pEIqMf24ip3O/5Oo6gFRhrrEAdWyDqAPJOpYHaXhdg==
X-Google-Smtp-Source: AMsMyM6j9cglm4P7WBYc5NvSAakP+sVHnPVcmO0RGCnfiOWvLWa9Ak9zFcpwAgV7iK0miI7oUJnVIQFO8VtCQj1Hi2M=
X-Received: by 2002:a92:2601:0:b0:2fc:48be:e77a with SMTP id
 n1-20020a922601000000b002fc48bee77amr972287ile.202.1666073143236; Mon, 17 Oct
 2022 23:05:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221017234001.53297-1-gregory.price@memverge.com>
In-Reply-To: <20221017234001.53297-1-gregory.price@memverge.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 18 Oct 2022 11:35:31 +0530
Message-ID: <CAARzgwxEO5rr=b_QjiG7RoEdV=9yOgj9gxUxNvuaUnNtUEnhtw@mail.gmail.com>
Subject: Re: [BUG] hw/i386/pc.c: CXL Fixed Memory Window should not reserve
 e820 in bios
To: Gregory Price <gourry.memverge@gmail.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, marcel.apfelbaum@gmail.com, 
 imammedo@redhat.com, jonathan.cameron@huawei.com, linux-cxl@vger.kernel.org, 
 alison.schofield@intel.com, dave@stgolabs.net, a.manzanares@samsung.com, 
 bwidawsk@kernel.org, gregory.price@memverge.com, hchkuo@avery-design.com.tw, 
 cbrowy@avery-design.com, ira.weiny@intel.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x133.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Tue, Oct 18, 2022 at 5:14 AM Gregory Price <gourry.memverge@gmail.com> wrote:
>
> Early-boot e820 records will be inserted by the bios/efi/early boot
> software and be reported to the kernel via insert_resource.  Later, when
> CXL drivers iterate through the regions again, they will insert another
> resource and make the RESERVED memory area a child.

I have already sent a patch
https://www.mail-archive.com/qemu-devel@nongnu.org/msg882012.html .
When the patch is applied, there would not be any reserved entries
even with passing E820_RESERVED .
So this patch needs to be evaluated in the light of the above patch I
sent. Once you apply my patch, does the issue still exist?

>
> This RESERVED memory area causes the memory region to become unusable,
> and as a result attempting to create memory regions with
>
>     `cxl create-region ...`
>
> Will fail due to the RESERVED area intersecting with the CXL window.
>
>
> During boot the following traceback is observed:
>
> 0xffffffff81101650 in insert_resource_expand_to_fit ()
> 0xffffffff83d964c5 in e820__reserve_resources_late ()
> 0xffffffff83e03210 in pcibios_resource_survey ()
> 0xffffffff83e04f4a in pcibios_init ()
>
> Which produces a call to reserve the CFMWS area:
>
> (gdb) p *new
> $54 = {start = 0x290000000, end = 0x2cfffffff, name = "Reserved",
>        flags = 0x200, desc = 0x7, parent = 0x0, sibling = 0x0,
>        child = 0x0}
>
> Later the Kernel parses ACPI tables and reserves the exact same area as
> the CXL Fixed Memory Window.  The use of `insert_resource_conflict`
> retains the RESERVED region and makes it a child of the new region.
>
> 0xffffffff811016a4 in insert_resource_conflict ()
>                       insert_resource ()
> 0xffffffff81a81389 in cxl_parse_cfmws ()
> 0xffffffff818c4a81 in call_handler ()
>                       acpi_parse_entries_array ()
>
> (gdb) p/x *new
> $59 = {start = 0x290000000, end = 0x2cfffffff, name = "CXL Window 0",
>        flags = 0x200, desc = 0x0, parent = 0x0, sibling = 0x0,
>        child = 0x0}
>
> This produces the following output in /proc/iomem:
>
> 590000000-68fffffff : CXL Window 0
>   590000000-68fffffff : Reserved
>
> This reserved area causes `get_free_mem_region()` to fail due to a check
> against `__region_intersects()`.  Due to this reserved area, the
> intersect check will only ever return REGION_INTERSECTS, which causes
> `cxl create-region` to always fail.
>
> Signed-off-by: Gregory Price <gregory.price@memverge.com>
> ---
>  hw/i386/pc.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 566accf7e6..5bf5465a21 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1061,7 +1061,6 @@ void pc_memory_init(PCMachineState *pcms,
>          hwaddr cxl_size = MiB;
>
>          cxl_base = pc_get_cxl_range_start(pcms);
> -        e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
>          memory_region_init(mr, OBJECT(machine), "cxl_host_reg", cxl_size);
>          memory_region_add_subregion(system_memory, cxl_base, mr);
>          cxl_resv_end = cxl_base + cxl_size;
> @@ -1077,7 +1076,6 @@ void pc_memory_init(PCMachineState *pcms,
>                  memory_region_init_io(&fw->mr, OBJECT(machine), &cfmws_ops, fw,
>                                        "cxl-fixed-memory-region", fw->size);
>                  memory_region_add_subregion(system_memory, fw->base, &fw->mr);
> -                e820_add_entry(fw->base, fw->size, E820_RESERVED);
>                  cxl_fmw_base += fw->size;
>                  cxl_resv_end = cxl_fmw_base;
>              }
> --
> 2.37.3
>

