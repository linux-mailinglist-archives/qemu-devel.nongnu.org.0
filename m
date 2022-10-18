Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7976602F78
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 17:18:25 +0200 (CEST)
Received: from localhost ([::1]:33872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okoMH-00044z-6F
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 11:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oko4y-0001ed-Gb
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 11:00:29 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:37423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oko4w-0003YH-7P
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 11:00:28 -0400
Received: by mail-il1-x129.google.com with SMTP id 8so7580593ilj.4
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 08:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0G7EOk7akyA/Lb/Og3gO/ph3zGPd9aFNgixDueHRudM=;
 b=sIRzegFXNA4CgUaigluF0E/LuoOcQpozmVl/Y6DdfDLQkQw9W5UaFxJ+LivqHE76Ar
 srx3QdeXJnNNc9qANcxM+yj+27aaeN3N/BDuX0Yk5nuQ2dlxnU+Tm2frbys7iXmz7vbF
 4qb/KhYIfS1WiSomLtMOzfufthVeIkdesXjmjhhX1cMp5KkdAU3a0ehmdPZXfGbYR0Ob
 duatxxOoWV5q1DBBEuByOc5remWWljvxoDxhhL8HC1mA3iaFwY+M2IoKSHMGhpYxBogE
 B6RwIdXHjyzbDTEJS02f2FH3s6LAub9QXTuNqjngvo/9xJW9Ein64b2UKwK/ga8GQ4Fq
 aQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0G7EOk7akyA/Lb/Og3gO/ph3zGPd9aFNgixDueHRudM=;
 b=RNo1iKdUQSJG0VlEqmil6XEBARHE+6nScqBzTkTCa1qx4Na6a7t1hQsENPji8Ufhu/
 b61IoaBk+dzRm7HzVvOdjUx4Av5LQqsGJetLGRLHvLpgF8cauBAA1z7ryTAXsNgppNEy
 VAoPTEZOjfZkcPCTEZvaR0KRXzYWtJaMlcpoYdlGbUojFgJHUrGepuRvYMSRJFxIUbEf
 0UCeAxR2SoK8puNTkhpxxvqdoR9g4R6bpRkwAP5nqOuekOlda2pkk3RGZeJYTm8favcH
 VpuZrWlPNrT43pPXCJmxrjnU8RI2XSt1AiOrs+vb/r7U+OzL209Lq59UkJ1hD72Pw28L
 dAfw==
X-Gm-Message-State: ACrzQf2IeoLy7IBgHyGIylWjYOd2zmoSpIfgCZI8cZpXzVqkiEU5X98Q
 9UM45Dh5eKm85pGSI7+oIx01IwgVElow3Ph/Z4x5dw==
X-Google-Smtp-Source: AMsMyM5qA+yR7U+8Z2EOqcoLCkjEtJ0ZfUCV2vhO08dU7aJpkllyyeUuZAeGwaDVdqhp/5QRwjA+5tWCdEOy19CpMHQ=
X-Received: by 2002:a05:6e02:174d:b0:2fa:1b65:106e with SMTP id
 y13-20020a056e02174d00b002fa1b65106emr1972143ill.63.1666105224269; Tue, 18
 Oct 2022 08:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <20221017234001.53297-1-gregory.price@memverge.com>
 <CAARzgwxEO5rr=b_QjiG7RoEdV=9yOgj9gxUxNvuaUnNtUEnhtw@mail.gmail.com>
 <CAD3UvdTWLXf_OecWbtP9wfAvO2+xdWiAUjQHONrgB4AAAjwdHQ@mail.gmail.com>
In-Reply-To: <CAD3UvdTWLXf_OecWbtP9wfAvO2+xdWiAUjQHONrgB4AAAjwdHQ@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 18 Oct 2022 20:30:13 +0530
Message-ID: <CAARzgwyCTaNoiqtVPS394Nk9LAS05116Dvc2GxifHpO01+ZN4g@mail.gmail.com>
Subject: Re: [BUG] hw/i386/pc.c: CXL Fixed Memory Window should not reserve
 e820 in bios
To: Gregory Price <gourry.memverge@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, marcel.apfelbaum@gmail.com, 
 imammedo@redhat.com, jonathan.cameron@huawei.com, linux-cxl@vger.kernel.org, 
 alison.schofield@intel.com, dave@stgolabs.net, a.manzanares@samsung.com, 
 bwidawsk@kernel.org, gregory.price@memverge.com, hchkuo@avery-design.com.tw, 
 cbrowy@avery-design.com, ira.weiny@intel.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x129.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

+Gerd Hoffmann

On Tue, Oct 18, 2022 at 8:16 PM Gregory Price <gourry.memverge@gmail.com> wrote:
>
> This patch does not resolve the issue, reserved entries are still created.
>
> [    0.000000] BIOS-e820: [mem 0x0000000280000000-0x00000002800fffff] reserved
> [    0.000000] BIOS-e820: [mem 0x0000000290000000-0x000000029fffffff] reserved
>
> # cat /proc/iomem
> 290000000-29fffffff : CXL Window 0
>   290000000-29fffffff : Reserved
>
> # cxl create-region -m -d decoder0.0 -w 1 -g 256 mem0
> cxl region: create_region: region0: set_size failed: Numerical result out of range
> cxl region: cmd_create_region: created 0 regions
>
> On Tue, Oct 18, 2022 at 2:05 AM Ani Sinha <ani@anisinha.ca> wrote:
>>
>> On Tue, Oct 18, 2022 at 5:14 AM Gregory Price <gourry.memverge@gmail.com> wrote:
>> >
>> > Early-boot e820 records will be inserted by the bios/efi/early boot
>> > software and be reported to the kernel via insert_resource.  Later, when
>> > CXL drivers iterate through the regions again, they will insert another
>> > resource and make the RESERVED memory area a child.
>>
>> I have already sent a patch
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg882012.html .
>> When the patch is applied, there would not be any reserved entries
>> even with passing E820_RESERVED .
>> So this patch needs to be evaluated in the light of the above patch I
>> sent. Once you apply my patch, does the issue still exist?
>>
>> >
>> > This RESERVED memory area causes the memory region to become unusable,
>> > and as a result attempting to create memory regions with
>> >
>> >     `cxl create-region ...`
>> >
>> > Will fail due to the RESERVED area intersecting with the CXL window.
>> >
>> >
>> > During boot the following traceback is observed:
>> >
>> > 0xffffffff81101650 in insert_resource_expand_to_fit ()
>> > 0xffffffff83d964c5 in e820__reserve_resources_late ()
>> > 0xffffffff83e03210 in pcibios_resource_survey ()
>> > 0xffffffff83e04f4a in pcibios_init ()
>> >
>> > Which produces a call to reserve the CFMWS area:
>> >
>> > (gdb) p *new
>> > $54 = {start = 0x290000000, end = 0x2cfffffff, name = "Reserved",
>> >        flags = 0x200, desc = 0x7, parent = 0x0, sibling = 0x0,
>> >        child = 0x0}
>> >
>> > Later the Kernel parses ACPI tables and reserves the exact same area as
>> > the CXL Fixed Memory Window.  The use of `insert_resource_conflict`
>> > retains the RESERVED region and makes it a child of the new region.
>> >
>> > 0xffffffff811016a4 in insert_resource_conflict ()
>> >                       insert_resource ()
>> > 0xffffffff81a81389 in cxl_parse_cfmws ()
>> > 0xffffffff818c4a81 in call_handler ()
>> >                       acpi_parse_entries_array ()
>> >
>> > (gdb) p/x *new
>> > $59 = {start = 0x290000000, end = 0x2cfffffff, name = "CXL Window 0",
>> >        flags = 0x200, desc = 0x0, parent = 0x0, sibling = 0x0,
>> >        child = 0x0}
>> >
>> > This produces the following output in /proc/iomem:
>> >
>> > 590000000-68fffffff : CXL Window 0
>> >   590000000-68fffffff : Reserved
>> >
>> > This reserved area causes `get_free_mem_region()` to fail due to a check
>> > against `__region_intersects()`.  Due to this reserved area, the
>> > intersect check will only ever return REGION_INTERSECTS, which causes
>> > `cxl create-region` to always fail.
>> >
>> > Signed-off-by: Gregory Price <gregory.price@memverge.com>
>> > ---
>> >  hw/i386/pc.c | 2 --
>> >  1 file changed, 2 deletions(-)
>> >
>> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> > index 566accf7e6..5bf5465a21 100644
>> > --- a/hw/i386/pc.c
>> > +++ b/hw/i386/pc.c
>> > @@ -1061,7 +1061,6 @@ void pc_memory_init(PCMachineState *pcms,
>> >          hwaddr cxl_size = MiB;
>> >
>> >          cxl_base = pc_get_cxl_range_start(pcms);
>> > -        e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
>> >          memory_region_init(mr, OBJECT(machine), "cxl_host_reg", cxl_size);
>> >          memory_region_add_subregion(system_memory, cxl_base, mr);
>> >          cxl_resv_end = cxl_base + cxl_size;
>> > @@ -1077,7 +1076,6 @@ void pc_memory_init(PCMachineState *pcms,
>> >                  memory_region_init_io(&fw->mr, OBJECT(machine), &cfmws_ops, fw,
>> >                                        "cxl-fixed-memory-region", fw->size);
>> >                  memory_region_add_subregion(system_memory, fw->base, &fw->mr);
>> > -                e820_add_entry(fw->base, fw->size, E820_RESERVED);
>> >                  cxl_fmw_base += fw->size;
>> >                  cxl_resv_end = cxl_fmw_base;
>> >              }
>> > --
>> > 2.37.3
>> >

