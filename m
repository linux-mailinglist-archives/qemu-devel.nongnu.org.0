Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFED1438167
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 04:23:52 +0200 (CEST)
Received: from localhost ([::1]:45966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me6hL-0006CI-CL
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 22:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1me6g5-0005WT-Fm
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 22:22:33 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:35635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1me6g3-00045f-77
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 22:22:33 -0400
Received: by mail-pf1-x431.google.com with SMTP id l203so510408pfd.2
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 19:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=7PPTGQITqWFhy44bO7kl/UeCdspIUDHZD4x4DEESafY=;
 b=kCW1CajwerqxqLIh/MRoXrAcsVeJG8I2OT6nSgiGHVQ7/jmj0chZ7soCGys6qOtKMz
 GuY9kqkcK4gJvXW9u2HUBHeLkiOIUcxxXoPZJK2y2xu25VOHt/mZOZCG9ctRID/CVZu4
 GXjhilcRa2Uet1/0ezlOfr96OR3GyaqmKmDc2PVIAIGUUeN2e9laHoIh/MzRq3Whm0LM
 /9aPY07LcGrfNfge/wdN4ECs1UJWr2U701+wsToTAMAQ/CiFSOgBpcuNXVT34CJTOw23
 EcH4JC4RSNEgZJpZ4ErJjS/5Q1lxBZV3K14zp5eU+/S20JLm78StjD3SW1Z1UfGDqaGk
 kfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=7PPTGQITqWFhy44bO7kl/UeCdspIUDHZD4x4DEESafY=;
 b=SiAAHrRAeBwXPyi8+GRwEX/LJK52Fg5RoxS5UQ0EWfDRKHceB7jljl0CQ+IBwCWqw2
 QNAb/RyZd7krVrIXXJLc2XVp6FuKSZFRK85vFrFVTHFXTz1nbd6sIMKYAWkLGChwCuxQ
 ximAcohg9IV9bfoAQcNQFLy8AMhgbIWiCi77g0ePVeoAj3mBWUVIlR/vrjhVBBgHCDPA
 jYDjYTMelMnslz/nb2qeAq0DyKgaSCZEi/lUN6Q5Eb1vwnUgRFUIMEBj0+T3Y2INXfnn
 qSpcuwZc3klplUK1kHYV3Rbz/24dzrnRdNNvfWjBszo76MmlRTXjPBT/pbLggVK9DZKl
 /2Qg==
X-Gm-Message-State: AOAM530iC/HDsgyqlF2UTUonk6owpWKzAIMBhstOnbnRrsJgd86J6Vwb
 RLeKkqOU//YR81wSIDE7F5NUHw==
X-Google-Smtp-Source: ABdhPJy30LufEwVo33YangDS+TK3LKntafOTw+HxIeyW/3hR1oW3KHOi8a3U0C0zi+Wbz6GbrAfH/g==
X-Received: by 2002:a05:6a00:1707:b0:44d:47e1:9ffe with SMTP id
 h7-20020a056a00170700b0044d47e19ffemr3747030pfc.53.1634955749248; 
 Fri, 22 Oct 2021 19:22:29 -0700 (PDT)
Received: from anisinha-lenovo ([203.212.241.43])
 by smtp.googlemail.com with ESMTPSA id v11sm9266983pgf.69.2021.10.22.19.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 19:22:28 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Sat, 23 Oct 2021 07:52:21 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v8 07/10] ACPI ERST: create ACPI ERST table for pc/x86
 machines
In-Reply-To: <543751f3-b7c0-b039-64ee-cc902d9b1c80@oracle.com>
Message-ID: <alpine.DEB.2.22.394.2110230751080.291405@anisinha-lenovo>
References: <1634324580-27120-1-git-send-email-eric.devolder@oracle.com>
 <1634324580-27120-8-git-send-email-eric.devolder@oracle.com>
 <alpine.DEB.2.22.394.2110221545440.268000@anisinha-lenovo>
 <543751f3-b7c0-b039-64ee-cc902d9b1c80@oracle.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::431;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 Ani Sinha <ani@anisinha.ca>, imammedo@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Fri, 22 Oct 2021, Eric DeVolder wrote:

> Ani, inline below.
> eric
>
> On 10/22/21 05:18, Ani Sinha wrote:
> >
> >
> > On Fri, 15 Oct 2021, Eric DeVolder wrote:
> >
> > > This change exposes ACPI ERST support for x86 guests.
> > >
> > > Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> > > ---
> > >   hw/i386/acpi-build.c   | 9 +++++++++
> > >   hw/i386/acpi-microvm.c | 9 +++++++++
> > >   include/hw/acpi/erst.h | 5 +++++
> > >   3 files changed, 23 insertions(+)
> > >
> > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > index 81418b7..9c2f9d9 100644
> > > --- a/hw/i386/acpi-build.c
> > > +++ b/hw/i386/acpi-build.c
> > > @@ -43,6 +43,7 @@
> > >   #include "sysemu/tpm.h"
> > >   #include "hw/acpi/tpm.h"
> > >   #include "hw/acpi/vmgenid.h"
> > > +#include "hw/acpi/erst.h"
> > >   #include "sysemu/tpm_backend.h"
> > >   #include "hw/rtc/mc146818rtc_regs.h"
> > >   #include "migration/vmstate.h"
> > > @@ -2499,6 +2500,7 @@ void acpi_build(AcpiBuildTables *tables,
> > > MachineState *machine)
> > >       GArray *tables_blob = tables->table_data;
> > >       AcpiSlicOem slic_oem = { .id = NULL, .table_id = NULL };
> > >       Object *vmgenid_dev;
> > > +    Object *erst_dev;
> > >       char *oem_id;
> > >       char *oem_table_id;
> > >
> > > @@ -2560,6 +2562,13 @@ void acpi_build(AcpiBuildTables *tables,
> > > MachineState *machine)
> > >                       ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
> > >                       x86ms->oem_table_id);
> > >
> > > +    erst_dev = find_erst_dev();
> > > +    if (erst_dev) {
> > > +        acpi_add_table(table_offsets, tables_blob);
> > > +        build_erst(tables_blob, tables->linker, erst_dev,
> > > +                   x86ms->oem_id, x86ms->oem_table_id);
> > > +    }
> > > +
> >
> > This needs to be ifdef'd between CONFIG_ERST.
> ok
>
> >
> >
> > >       vmgenid_dev = find_vmgenid_dev();
> > >       if (vmgenid_dev) {
> > >           acpi_add_table(table_offsets, tables_blob);
> > > diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> >
> > I do not think we need to include this for microvm machines. They are
> > supposed to have minimal ACPUI support. So lets not bloat it unless there
> > is a specific requirement to support ERST on microvms as well.
> Would it be ok if I ifdef this on CONFIG_ERST also?

I think we should not touch microvm machine unless you can justify why you
need ERST support there.

>
> >
> >
> > > index 196d318..662c8ad 100644
> > > --- a/hw/i386/acpi-microvm.c
> > > +++ b/hw/i386/acpi-microvm.c
> > > @@ -30,6 +30,7 @@
> > >   #include "hw/acpi/bios-linker-loader.h"
> > >   #include "hw/acpi/generic_event_device.h"
> > >   #include "hw/acpi/utils.h"
> > > +#include "hw/acpi/erst.h"
> > >   #include "hw/i386/fw_cfg.h"
> > >   #include "hw/i386/microvm.h"
> > >   #include "hw/pci/pci.h"
> > > @@ -158,6 +159,7 @@ static void acpi_build_microvm(AcpiBuildTables
> > > *tables,
> > >       X86MachineState *x86ms = X86_MACHINE(mms);
> > >       GArray *table_offsets;
> > >       GArray *tables_blob = tables->table_data;
> > > +    Object *erst_dev;
> > >       unsigned dsdt, xsdt;
> > >       AcpiFadtData pmfadt = {
> > >           /* ACPI 5.0: 4.1 Hardware-Reduced ACPI */
> > > @@ -207,6 +209,13 @@ static void acpi_build_microvm(AcpiBuildTables
> > > *tables,
> > >                       ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
> > >                       x86ms->oem_table_id);
> > >
> > > +    erst_dev = find_erst_dev();
> > > +    if (erst_dev) {
> > > +        acpi_add_table(table_offsets, tables_blob);
> > > +        build_erst(tables_blob, tables->linker, erst_dev,
> > > +                   x86ms->oem_id, x86ms->oem_table_id);
> > > +    }
> > > +
> >
> >
> >
> > >       xsdt = tables_blob->len;
> > >       build_xsdt(tables_blob, tables->linker, table_offsets,
> > > x86ms->oem_id,
> > >                  x86ms->oem_table_id);
> > > diff --git a/include/hw/acpi/erst.h b/include/hw/acpi/erst.h
> > > index 9d63717..b747fe7 100644
> > > --- a/include/hw/acpi/erst.h
> > > +++ b/include/hw/acpi/erst.h
> > > @@ -16,4 +16,9 @@ void build_erst(GArray *table_data, BIOSLinker *linker,
> > > Object *erst_dev,
> > >
> > >   #define TYPE_ACPI_ERST "acpi-erst"
> > >
> > > +/* returns NULL unless there is exactly one device */
> > > +static inline Object *find_erst_dev(void)
> > > +{
> > > +    return object_resolve_path_type("", TYPE_ACPI_ERST, NULL);
> > > +}
> > >   #endif
> > > --
> > > 1.8.3.1
> > >
> > >
>

