Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAC14D4F8C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 17:43:54 +0100 (CET)
Received: from localhost ([::1]:36166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSLtJ-0003ZX-4a
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 11:43:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nSLs5-0002qh-3L
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 11:42:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nSLs1-0006Ut-Ry
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 11:42:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646930552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DsGuzNwB49tfmzyH+Wo2NEybpIhKIlADqna/vtkw7C0=;
 b=MwOTzvSKuvnGOiW5tMB4/dc64ydH5+p16OFDc9ZUPgmDqNSqe4iFxMPfzU/u/AcHEaJJDU
 uW1yOvPMqI+O8sRlr6W+p7NPPhrwhQOmowjRViuWcHJlYmXjAW3s/17cQ7hhg4nSBBVBOr
 YcEATPKihWbjBSPsaA8Wl0v+YteNSK4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-bjHaIrxDMlW37nBfBe1VEw-1; Thu, 10 Mar 2022 11:42:31 -0500
X-MC-Unique: bjHaIrxDMlW37nBfBe1VEw-1
Received: by mail-ej1-f71.google.com with SMTP id
 jy20-20020a170907763400b006db62b6f4e0so3420768ejc.11
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 08:42:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DsGuzNwB49tfmzyH+Wo2NEybpIhKIlADqna/vtkw7C0=;
 b=iFuKZ/Mb8rGH9+rc2PFC7ZFfRANCl3v9BpGYBPIaTdi3pngtU2Q6jQ8hVoRNbZ5D94
 1GqUAvPkaFXHL4KslOQpHL3iIb9ffi6WNwtdgv6b7rIP0JVZhjx1e5XyydYXJcXWoRyc
 6DMNUDl1SqDi3hmosvj15Cg5NENcfU3uI4WizYNTOwOgo+I6GHWI7F3vkcSpAsatv9ka
 dyMcQVo+voIgm3T15NNM/Eqf/fLbn1Sy78gIxjhupib09Xjr2BSG0eIXmj4TgKDR4MSY
 bZnEtGVXbyrzr0gqirAgKwu/xD1bPVe9+78iLZ04vhDpoCfkCT42ufKr5meeqnqWDxMd
 9Gzw==
X-Gm-Message-State: AOAM532Idh1gwAauujI5QxNKUt7d0z4kOO+BA5OT/L2DXIk1kxrWAFIC
 5N7w5vXA34wkWcko61XGzRZW/QDPgpbBwg8ssE8vd+auLO2c7+HD1O0H2US5hHDLj3poF8Fz/pu
 GV0RQikbze0eWbeE=
X-Received: by 2002:a17:907:2da3:b0:6da:8db8:9bee with SMTP id
 gt35-20020a1709072da300b006da8db89beemr5112602ejc.24.1646930549181; 
 Thu, 10 Mar 2022 08:42:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyszA+pFsojZBAHBuwuJAep5SkCCvRlUFG7QwmUC6uKpv+9E1uD7nXnTf02TlosLt6W9J4+cg==
X-Received: by 2002:a17:907:2da3:b0:6da:8db8:9bee with SMTP id
 gt35-20020a1709072da300b006da8db89beemr5112575ejc.24.1646930548902; 
 Thu, 10 Mar 2022 08:42:28 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 5-20020a508e45000000b003fe03798eafsm2403874edx.32.2022.03.10.08.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 08:42:28 -0800 (PST)
Date: Thu, 10 Mar 2022 17:42:27 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [RFC PATCH] hw/i386/e820: remove legacy reserved entries for e820
Message-ID: <20220310174227.60209f3e@redhat.com>
In-Reply-To: <CAARzgwxwu1BOFGGOnfxaixrS+WdY57QdiujQgnBj7DxBvEPqNw@mail.gmail.com>
References: <20220228152620.1474806-1-ani@anisinha.ca>
 <CAARzgwxwu1BOFGGOnfxaixrS+WdY57QdiujQgnBj7DxBvEPqNw@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Mar 2022 11:51:37 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> On Mon, Feb 28, 2022 at 8:56 PM Ani Sinha <ani@anisinha.ca> wrote:
> >
> > e820 reserved entries were used before the dynamic entries with fw config files
> > were intoduced into qemu with the following change:
> > 7d67110f2d9a6("pc: add etc/e820 fw_cfg file")
> >
> > Identical support was introduced into seabios as well with the following commit:
> > ce39bd4031820 ("Add support for etc/e820 fw_cfg file")
> >
> > Both the above commits are now quite old. Seabios uses fw config files and
> > dynamic e820 entries by default and only falls back to using reserved entries
> > when it has to work with old qemu (versions earlier than 1.7). Please see
> > functions qemu_cfg_e820() and qemu_early_e820(). It is safe to remove legacy
> > FW_CFG_E820_TABLE and associated code. It would be incredibly rare to run the
> > latest qemu version with a very old version of seabios that did not support
> > fw config files for e820.
> >
> > As far as I could see, edk2/ovfm never supported reserved entries and uses fw
> > config files from the beginning. So there should be no incompatibilities with
> > ovfm as well.  
> 
> Igor, Gerd, as I had replied in the other thread, I am not sure if we
> need the compatibility dance in order to do this. I think we can't
> carry this legacy stuff on forever.
> Please advice.

see commit 7d67110f2d
until we have older machine types it must stay or have a compat knob,
once they are gone we can remove it as 1.7 and older machine types
are supposed to have newer SeaBIOS version that doesn't utilize
it anymore.

so add a compat knob (not sure if it's worth the trouble) or
wait till pre 1.7 machines are gone and then rebase/repost.

> 
> >
> > CC: Gerd Hoffmann <kraxel@redhat.com>
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > ---
> >  hw/i386/e820_memory_layout.c | 20 +-------------------
> >  hw/i386/e820_memory_layout.h |  8 --------
> >  hw/i386/fw_cfg.c             |  3 ---
> >  hw/i386/fw_cfg.h             |  1 -
> >  hw/i386/microvm.c            |  2 --
> >  5 files changed, 1 insertion(+), 33 deletions(-)
> >
> > diff --git a/hw/i386/e820_memory_layout.c b/hw/i386/e820_memory_layout.c
> > index bcf9eaf837..06970ac44a 100644
> > --- a/hw/i386/e820_memory_layout.c
> > +++ b/hw/i386/e820_memory_layout.c
> > @@ -11,29 +11,11 @@
> >  #include "e820_memory_layout.h"
> >
> >  static size_t e820_entries;
> > -struct e820_table e820_reserve;
> >  struct e820_entry *e820_table;
> >
> >  int e820_add_entry(uint64_t address, uint64_t length, uint32_t type)
> >  {
> > -    int index = le32_to_cpu(e820_reserve.count);
> > -    struct e820_entry *entry;
> > -
> > -    if (type != E820_RAM) {
> > -        /* old FW_CFG_E820_TABLE entry -- reservations only */
> > -        if (index >= E820_NR_ENTRIES) {
> > -            return -EBUSY;
> > -        }
> > -        entry = &e820_reserve.entry[index++];
> > -
> > -        entry->address = cpu_to_le64(address);
> > -        entry->length = cpu_to_le64(length);
> > -        entry->type = cpu_to_le32(type);
> > -
> > -        e820_reserve.count = cpu_to_le32(index);
> > -    }
> > -
> > -    /* new "etc/e820" file -- include ram too */
> > +    /* new "etc/e820" file -- include ram and reserved entries */
> >      e820_table = g_renew(struct e820_entry, e820_table, e820_entries + 1);
> >      e820_table[e820_entries].address = cpu_to_le64(address);
> >      e820_table[e820_entries].length = cpu_to_le64(length);
> > diff --git a/hw/i386/e820_memory_layout.h b/hw/i386/e820_memory_layout.h
> > index 2a0ceb8b9c..daf41cc4b4 100644
> > --- a/hw/i386/e820_memory_layout.h
> > +++ b/hw/i386/e820_memory_layout.h
> > @@ -16,20 +16,12 @@
> >  #define E820_NVS        4
> >  #define E820_UNUSABLE   5
> >
> > -#define E820_NR_ENTRIES 16
> > -
> >  struct e820_entry {
> >      uint64_t address;
> >      uint64_t length;
> >      uint32_t type;
> >  } QEMU_PACKED __attribute((__aligned__(4)));
> >
> > -struct e820_table {
> > -    uint32_t count;
> > -    struct e820_entry entry[E820_NR_ENTRIES];
> > -} QEMU_PACKED __attribute((__aligned__(4)));
> > -
> > -extern struct e820_table e820_reserve;
> >  extern struct e820_entry *e820_table;
> >
> >  int e820_add_entry(uint64_t address, uint64_t length, uint32_t type);
> > diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
> > index a283785a8d..72a42f3c66 100644
> > --- a/hw/i386/fw_cfg.c
> > +++ b/hw/i386/fw_cfg.c
> > @@ -36,7 +36,6 @@ const char *fw_cfg_arch_key_name(uint16_t key)
> >          {FW_CFG_ACPI_TABLES, "acpi_tables"},
> >          {FW_CFG_SMBIOS_ENTRIES, "smbios_entries"},
> >          {FW_CFG_IRQ0_OVERRIDE, "irq0_override"},
> > -        {FW_CFG_E820_TABLE, "e820_table"},
> >          {FW_CFG_HPET, "hpet"},
> >      };
> >
> > @@ -127,8 +126,6 @@ FWCfgState *fw_cfg_arch_create(MachineState *ms,
> >  #endif
> >      fw_cfg_add_i32(fw_cfg, FW_CFG_IRQ0_OVERRIDE, 1);
> >
> > -    fw_cfg_add_bytes(fw_cfg, FW_CFG_E820_TABLE,
> > -                     &e820_reserve, sizeof(e820_reserve));
> >      fw_cfg_add_file(fw_cfg, "etc/e820", e820_table,
> >                      sizeof(struct e820_entry) * e820_get_num_entries());
> >
> > diff --git a/hw/i386/fw_cfg.h b/hw/i386/fw_cfg.h
> > index 275f15c1c5..86ca7c1c0c 100644
> > --- a/hw/i386/fw_cfg.h
> > +++ b/hw/i386/fw_cfg.h
> > @@ -17,7 +17,6 @@
> >  #define FW_CFG_ACPI_TABLES      (FW_CFG_ARCH_LOCAL + 0)
> >  #define FW_CFG_SMBIOS_ENTRIES   (FW_CFG_ARCH_LOCAL + 1)
> >  #define FW_CFG_IRQ0_OVERRIDE    (FW_CFG_ARCH_LOCAL + 2)
> > -#define FW_CFG_E820_TABLE       (FW_CFG_ARCH_LOCAL + 3)
> >  #define FW_CFG_HPET             (FW_CFG_ARCH_LOCAL + 4)
> >
> >  FWCfgState *fw_cfg_arch_create(MachineState *ms,
> > diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> > index 4b3b1dd262..f2101e7293 100644
> > --- a/hw/i386/microvm.c
> > +++ b/hw/i386/microvm.c
> > @@ -324,8 +324,6 @@ static void microvm_memory_init(MicrovmMachineState *mms)
> >      fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, machine->smp.max_cpus);
> >      fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)machine->ram_size);
> >      fw_cfg_add_i32(fw_cfg, FW_CFG_IRQ0_OVERRIDE, 1);
> > -    fw_cfg_add_bytes(fw_cfg, FW_CFG_E820_TABLE,
> > -                     &e820_reserve, sizeof(e820_reserve));
> >      fw_cfg_add_file(fw_cfg, "etc/e820", e820_table,
> >                      sizeof(struct e820_entry) * e820_get_num_entries());
> >
> > --
> > 2.25.1
> >  
> 


