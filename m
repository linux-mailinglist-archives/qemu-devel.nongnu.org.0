Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0006A1D68
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 15:27:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVZ2Y-000084-NF; Fri, 24 Feb 2023 09:27:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pVZ2T-00006d-5U
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 09:27:09 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pVZ2Q-00035i-Gy
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 09:27:07 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so6335795pjn.1
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 06:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AhWaX788+0H9tEp0eRrfsFK8MfuQRTG2oycKFtkQrBQ=;
 b=P81Vb2wY9cQv7Lx6JB2IXBs/vApzmBtBTTMGS6wj03yH0HkFf9FBqKh5OagsQL4uRN
 67Xyg/yhGPT+Deol8SshNWqbWr9Vpt2AqPC/q5fZgVrtChjL43c3r69UNEdzMd29m2HT
 5Kzxq74KYrBfJMTq18EdydGk/8mDRNDtpvDNxgNnztY/SF/MHoDXVgDXuH+BDebCM9uS
 wDM9dRClCx7taft4thhIZvd6q1l2gHEJtG6ER54ocX8kfJR/8HzZBagv9i43A3kMpGnZ
 gUwW6zquKDPk2YuO/owce58k+nzZzTBdrXHwgkRr4SdimnqqoDSD4tHQargh267zE6fZ
 gDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AhWaX788+0H9tEp0eRrfsFK8MfuQRTG2oycKFtkQrBQ=;
 b=BD5kY6XHeCu4hvzVO8zlAFDtutqnnM0nBQL0RZgL8ryXzbjKP2nN6snAd5m7axVlzE
 guDD26HHewAmdUxR1jS1rQE3db94E3C68uQtXxp4thD8lJVgXo4gioFKFP4o43DZaRm/
 UZQchyve7ZBL2bQVJggmEIQsSyb8RPfvh+UFQK3aTHRFdijQtMsUMdC9w5cNg9iejNJv
 MxYVIpWGJFh1w8t0frupTS5ShuINBZ+KtWh6XfCcKRTzGs0a9gp8K+HCFeMEr5CUM4Eb
 fHoAuGVHoSUiNFTE7wAXdUo/hCpy8Vyi+/pg3tA/WAfFzp/jZeWLDcsBdhEZLA3y16A3
 Dq4w==
X-Gm-Message-State: AO0yUKU7YV6Av/2ytRJoWcDs+XCN8He3YCTGkLE57OxDMsuOAyM9OO+e
 d5TrNDMBnUJcHswKPs7A/S99SY64U6bUim81
X-Google-Smtp-Source: AK7set/HNhTSF60iCNoOf4yxb/I6QYOgCcEcWhBb5NJUJhoD6opsmXNvAfwnDp2gi/uOS0JViPiA9Q==
X-Received: by 2002:a17:902:f552:b0:19a:a822:f670 with SMTP id
 h18-20020a170902f55200b0019aa822f670mr17302610plf.6.1677248825047; 
 Fri, 24 Feb 2023 06:27:05 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 m1-20020a1709026bc100b00192aa53a7d5sm4686701plt.8.2023.02.24.06.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 06:27:04 -0800 (PST)
Date: Fri, 24 Feb 2023 19:56:58 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: Re: [PATCH V4 5/8] hw/riscv/virt: virt-acpi-build.c: Add RINTC in MADT
Message-ID: <Y/jJMnHaspaic2M3@sunil-laptop>
References: <20230224083701.2657063-1-sunilvl@ventanamicro.com>
 <20230224083701.2657063-6-sunilvl@ventanamicro.com>
 <20230224135343.24a5a95b@imammedo.users.ipa.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224135343.24a5a95b@imammedo.users.ipa.redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hi Igor,

On Fri, Feb 24, 2023 at 01:53:43PM +0100, Igor Mammedov wrote:
> On Fri, 24 Feb 2023 14:06:58 +0530
> Sunil V L <sunilvl@ventanamicro.com> wrote:
> 
> > Add Multiple APIC Description Table (MADT) with the
> > RINTC structure for each cpu.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  hw/riscv/virt-acpi-build.c | 44 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> > 
> > diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> > index 3a5e2e6d53..8b85b34c55 100644
> > --- a/hw/riscv/virt-acpi-build.c
> > +++ b/hw/riscv/virt-acpi-build.c
> > @@ -32,6 +32,7 @@
> >  #include "sysemu/reset.h"
> >  #include "migration/vmstate.h"
> >  #include "hw/riscv/virt.h"
> > +#include "hw/riscv/numa.h"
> >  
> >  #define ACPI_BUILD_TABLE_SIZE             0x20000
> >  
> > @@ -132,6 +133,46 @@ static void build_dsdt(GArray *table_data,
> >      free_aml_allocator();
> >  }
> >  
> > +/* MADT */
> 
> see build_srat() how this comment must look like
>
Currently, even though ECRs are approved, the ACPI spec is not released
for these MADT structures. I can add the spec version for the generic
MADT but not for the RINTC. Same issue with a new table RHCT.
What is the recommendation in such case?

> > +static void build_madt(GArray *table_data,
> > +                       BIOSLinker *linker,
> > +                       RISCVVirtState *s)
> > +{
> > +    MachineState *ms = MACHINE(s);
> > +    int socket;
> > +    uint16_t base_hartid = 0;
> > +    uint32_t cpu_id = 0;
> > +
> > +    AcpiTable table = { .sig = "APIC", .rev = 6, .oem_id = s->oem_id,
> > +                        .oem_table_id = s->oem_table_id };
> > +
> > +    acpi_table_begin(&table, table_data);
> > +    /* Local Interrupt Controller Address */
> > +    build_append_int_noprefix(table_data, 0, 4);
> > +    build_append_int_noprefix(table_data, 0, 4);   /* MADT Flags */
> > +
> > +    /* RISC-V Local INTC structures per HART */
> > +    for (socket = 0; socket < riscv_socket_count(ms); socket++) {
> > +        base_hartid = riscv_socket_first_hartid(ms, socket);
> > +
> > +        for (int i = 0; i < s->soc[socket].num_harts; i++) {
> > +            build_append_int_noprefix(table_data, 0x18, 1);    /* Type     */
> > +            build_append_int_noprefix(table_data, 20, 1);      /* Length   */
> > +            build_append_int_noprefix(table_data, 1, 1);       /* Version  */
> > +            build_append_int_noprefix(table_data, 0, 1);       /* Reserved */
> > +            build_append_int_noprefix(table_data, 1, 4);       /* Flags    */
> > +            build_append_int_noprefix(table_data,
> > +                                      (base_hartid + i), 8);   /* Hart ID  */
> > +
> > +            /* ACPI Processor UID  */
> > +            build_append_int_noprefix(table_data, cpu_id, 4);
> 
> cpu_id here seems to be unrelated to one in DSDT.
> Could you explain how socket/hartid and cpu_id are related to each other?
> 
cpu_id should match the _UID. I needed two loops here to get the
base_hartid of the socket. hart_id is the unique ID for each hart
similar to MPIDR / APIC ID. I understand your point. Let me make DSDT
also created using two loops so that both match.

Thank you very much for your review!
Sunil

