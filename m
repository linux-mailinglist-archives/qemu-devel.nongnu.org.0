Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E42F450200
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 11:07:57 +0100 (CET)
Received: from localhost ([::1]:37848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmYu4-0005Z1-6X
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 05:07:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mmYo4-0000Er-29
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 05:01:44 -0500
Received: from [2607:f8b0:4864:20::62c] (port=38488
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mmYo1-0005mc-Q2
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 05:01:43 -0500
Received: by mail-pl1-x62c.google.com with SMTP id o14so14018692plg.5
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 02:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=4OWF2F1/g3x/+CVc9V7dRPZ6NbsyND1M4rE+b+MVCF4=;
 b=fUk0UH4yhIJ1thWl4W1F64J47Gy5VgrzbvZ6VR2k7QN5VaV/LwqQBvOQEVddY6dmiL
 Fzfm/A1nu9O1M1pajOhNtseuoij+HmKNGAdadfMtdNJZ0WhshW4TNqJUBkKD+CnVAgcC
 Y+SOJxMoKjmmZ3C8v8Cgy83ZiyhIaJsU1NZ+ExpXs9gHtONiLJElpKljEAIM6CouYBqi
 Mb5sajqZk4RR3eiN4gl1YrPIQqc6Eey3pm8YgCPl4Ipjh2uKfb3Yepa3vxGfV+9rtfro
 A8MV0Z2nbf5OYkMib1BPv9zK3duOrENmZeSywDDPNDpGNnXz4EgpMW2XC6oJbSr1IAky
 eZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=4OWF2F1/g3x/+CVc9V7dRPZ6NbsyND1M4rE+b+MVCF4=;
 b=5Nod/MZ7IOWmc130G76gD9hHNB+thBuhVIR/i7ACZSRn/Bl3bg3mxhyxICFYEHIetT
 FppzFRTIBiKKLjG+Z779qwsBU1/ImF60lDkcFSDN3JYCRrb9fqWnv/kLF29oR+hK+m9p
 bwJ7lgtzl8dCGfRWbAHToDIchyUOWiWrRgygTGOn0SaVwdTwOCkhAwB7KAGxz8vu9Bj6
 9x1JPbdrBkTQl4F4Y1K6rERcnZKN2MaLhDmlnAH1hQv2RaMRGCrU9hrON/wu1dUuDXsh
 3ih8DmmtYdbtfnRr/ouXJhuYJlepjn7qJ53Ict2xksN483kVX90lKXA3ySYIApjQPlNi
 529w==
X-Gm-Message-State: AOAM530TrCy0aOk8ZwCFEpW+pbZvaXnIkYk9xDAU0n4thjxl8zT2qc7K
 W9fnBVTEZQCP6UkU2w/axEwV2w==
X-Google-Smtp-Source: ABdhPJyVqzOQ1QLaFDJ5pRI2kM771deTovkI3RHxdFf3hAvbXGzB6aPC/QwtskY9qTus0phsgkpVng==
X-Received: by 2002:a17:90b:4a4d:: with SMTP id
 lb13mr61961718pjb.97.1636970498204; 
 Mon, 15 Nov 2021 02:01:38 -0800 (PST)
Received: from anisinha-lenovo ([49.207.202.156])
 by smtp.googlemail.com with ESMTPSA id j6sm11306009pgf.60.2021.11.15.02.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 02:01:37 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Mon, 15 Nov 2021 15:31:31 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH for 6.2 v2 1/5] pcie: rename 'native-hotplug' to
 'x-native-hotplug'
In-Reply-To: <20211112114707.0923f553@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2111151528260.505682@anisinha-lenovo>
References: <20211110211140.3057199-1-imammedo@redhat.com>
 <20211110211140.3057199-2-imammedo@redhat.com>
 <alpine.DEB.2.22.394.2111110853010.133428@anisinha-lenovo>
 <20211112114707.0923f553@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::62c;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: mapfelba@redhat.com, mst@redhat.com, jusual@redhat.com,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org, kraxel@redhat.com,
 Ani Sinha <ani@anisinha.ca>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Fri, 12 Nov 2021, Igor Mammedov wrote:

> On Thu, 11 Nov 2021 08:55:24 +0530 (IST)
> Ani Sinha <ani@anisinha.ca> wrote:
>
> > On Wed, 10 Nov 2021, Igor Mammedov wrote:
> >
> > > Mark property as experimental/internal adding 'x-' prefix.
> > >
> > > Property was introduced in 6.1 and it should have provided
> > > ability to turn on native PCIE hotplug on port even when
> > > ACPI PCI hotplug is in use is user explicitly sets property
> > > on CLI. However that never worked since slot is wired to
> > > ACPI hotplug controller.
> > > Another non-intended usecase: disable native hotplug on slot
> > > when APCI based hotplug is disabled, which works but slot has
> > > 'hotplug' property for this taks.
> > >
> > > It should be relatively safe to rename it to experimental
> > > as no users should exist for it and given that the property
> > > is broken we don't really want to leave it around for much
> > > longer lest users start using it.
> > >
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> >
> > Barring the comment below,
> >
> > Reviewed-by: Ani Sinha <ani@anisinha.ca>
>
> Thanks!
>
> >
> > > ---
> > > CC: qemu-stable@nongnu.org
> > > ---
> > >  hw/i386/pc_q35.c   | 2 +-
> > >  hw/pci/pcie_port.c | 2 +-
> > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> > > index 797e09500b..fc34b905ee 100644
> > > --- a/hw/i386/pc_q35.c
> > > +++ b/hw/i386/pc_q35.c
> > > @@ -243,7 +243,7 @@ static void pc_q35_init(MachineState *machine)
> > >                                            NULL);
> > >
> > >      if (acpi_pcihp) {
> > > -        object_register_sugar_prop(TYPE_PCIE_SLOT, "native-hotplug",
> > > +        object_register_sugar_prop(TYPE_PCIE_SLOT, "x-native-hotplug",
> > >                                     "false", true);
> >
> > Let us document the fact that this property is experimental. It was not at
> > once obvious to me that an "x-" prefix meant to indicate experimental
> > status.
>
> it's common knowledge, but quick grep shows we only documented
> x- prefix for qmp commands but not for properties even though
> properties were the first to use it. So we probably should
> document it somewhere.
> I thought we have acceptable property name format documented

sadly I could not find it either.

> but I couldn't find it quickly (that would be a good place
> to document it).
> Care to post a patch?
>
> >
> >
> > >      }
> > >
> > > diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
> > > index da850e8dde..e95c1e5519 100644
> > > --- a/hw/pci/pcie_port.c
> > > +++ b/hw/pci/pcie_port.c
> > > @@ -148,7 +148,7 @@ static Property pcie_slot_props[] = {
> > >      DEFINE_PROP_UINT8("chassis", PCIESlot, chassis, 0),
> > >      DEFINE_PROP_UINT16("slot", PCIESlot, slot, 0),
> > >      DEFINE_PROP_BOOL("hotplug", PCIESlot, hotplug, true),
> > > -    DEFINE_PROP_BOOL("native-hotplug", PCIESlot, native_hotplug, true),
> > > +    DEFINE_PROP_BOOL("x-native-hotplug", PCIESlot, native_hotplug, true),
> > >      DEFINE_PROP_END_OF_LIST()
> > >  };
> > >
> > > --
> > > 2.27.0
> > >
> > >
> >
>
>

