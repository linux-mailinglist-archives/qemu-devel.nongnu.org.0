Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E340C403641
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 10:44:44 +0200 (CEST)
Received: from localhost ([::1]:58602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNtCG-0003mu-02
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 04:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mNtB4-0002u8-FS
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:43:30 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:42598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mNtB2-0001yS-3m
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:43:30 -0400
Received: by mail-pf1-x432.google.com with SMTP id 18so1424694pfh.9
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 01:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=LzWzfkTB8IVOF/gieUVrFXPPyoFDJw0Rc3yVdzZVGoU=;
 b=o2uqETEHdZXe+dzquDtAxOJXjcWpqTEC16aswFLi/xDQnS/C4uWlyaJ70MRxBY1fW6
 zITPTan6uJFaBNUvQZ61Jahz+IOMGdj/WB3nZ671MD5lBjMXOs/tIJFAit4sNcGWsnpd
 j1109fCv8AyuUD9CQvnBN+sr3NGBZJ61qFwTRB3r9Lon5y2KXK/jaSVkKdcxKGuj44M0
 tUmte/MF2J7rQpd4AvJPScF5TNHkRhvFYbDmPJe1qBKuUqYmP9LcMz00eLvt08VtCXSF
 hG1LjhgmDMPL/ipLWvawXydxZRGUdpBS/YWIH/sc5orD8VOWPQCphErCxN7j62GVfxmG
 fGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=LzWzfkTB8IVOF/gieUVrFXPPyoFDJw0Rc3yVdzZVGoU=;
 b=aoM42EnHHaO1L4fGXdzY58p0M/go8iH0HBsjALnLAH304Xcwi6ir6k61LcLadMRIw2
 wm8wo5rx1sMMNBGqF1dw1Xc23fccmOGzZ1ed0rlyjW9WJiuK+lnsZlQX4DGM4qHDiGk2
 gl2yKQXo312oQnZ1ifu01Tp44lOmiIRX9E73Y+Kr1c0sHhlmOtEfQ89qelaIexPsXEdT
 xPoQIIOciLTeHUoClSjndJdYbywVi72pd3nec5ci2aFp5IoomS/tXw5Zvi6hUW//zS6H
 LwE4I6jUMGaEvr47iAeVRa4AcK6m9OonEEl0L8mF9iVUHOLFxW8yEGMpx+yFDgcE8noo
 rMog==
X-Gm-Message-State: AOAM532xO3+G9CeoRRplctcGqViQmNz4+EY7vGYSs263LmIIxjLihnVV
 Hh4a4PUYYJkEYQiDBdtZqyUZrg==
X-Google-Smtp-Source: ABdhPJxADHPFwgflDP/PSZGxYAZmbIzqgSLQ9e9s/zvj2S6XdN7PUBiCbuLx4FNLR5uxm11qoMOiSw==
X-Received: by 2002:aa7:8582:0:b0:3f9:f576:a6ce with SMTP id
 w2-20020aa78582000000b003f9f576a6cemr2586174pfn.27.1631090606465; 
 Wed, 08 Sep 2021 01:43:26 -0700 (PDT)
Received: from anisinha-lenovo ([203.163.242.70])
 by smtp.googlemail.com with ESMTPSA id f16sm1417070pja.38.2021.09.08.01.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 01:43:25 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Wed, 8 Sep 2021 14:13:20 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] hw/i386/acpi-build: adjust q35 IO addr range for acpi
 pci hotplug
In-Reply-To: <alpine.DEB.2.22.394.2109081229250.2227929@anisinha-lenovo>
Message-ID: <alpine.DEB.2.22.394.2109081359400.2227929@anisinha-lenovo>
References: <20210908041139.2219253-1-ani@anisinha.ca>
 <20210908084256.6077f7a3@redhat.com>
 <alpine.DEB.2.22.394.2109081229250.2227929@anisinha-lenovo>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::432;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x432.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, jusual@redhat.com,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Wed, 8 Sep 2021, Ani Sinha wrote:

>
>
> On Wed, 8 Sep 2021, Igor Mammedov wrote:
>
> > On Wed,  8 Sep 2021 09:41:39 +0530
> > Ani Sinha <ani@anisinha.ca> wrote:
> >
> > > Change caf108bc58790 ("hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35")
> > > selects an IO address range for acpi based PCI hotplug for q35 arbitrarily. It
> > > starts at address 0x0cc4 and ends at 0x0cdb. It was assumed that this address
> > > range was free and available. However, upon more testing, it seems this address
> > > range to be not available for some latest versions of windows.
> >
> > The range is something assigned by QEMU, and guest has no say where it should be.
> > but perhaps we failed to describe it properly or something similar, so one gets
> > 'no resource' error.
>
> OK dug deeper. The existing range of IO address conflicts with the CPU
> hotplug range.
>
> CPU hotplug range (ICH9_CPU_HOTPLUG_IO_BASE) is 0x0cd8 to 0x0ce3
>
> This intersects with range 0x0cc4 to 0x0cdb for ACPI_PCIHP_ADDR_ICH9 .
>

Also verified that setting ACPI_PCIHP_ADDR_ICH9 to 0x0cc0 also works and
resolves the conflict.

> We need to change one or the other.
>
> From the windows device manager, I see that the other IO address range is
> 0x0620 to 0x062F which is reserved for GPE0.
>
> .
> > We need a find out a reason why Windows doesn't like it. You might get more
> > detailed error running Windows debug build with ACPI debugger attached.
>
> bummer. This is beyond my expertize and I do not have a windows debug
> build.
>
> >
> > > Hence, this
> > > change modifies the IO address range so that windows can allocate the address
> > > range without any conflict. The new address range would start at 0x0dd4 and end
> > > at address 0x0deb.
> > >
> > > This change has been tested using a Windows Server 2019 guest VM.
> > >
> > > Fixes: caf108bc58790 ("hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35")
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/561
> > >
> > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > ---
> > >  include/hw/acpi/ich9.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
> > > index a329ce43ab..b68c5a2174 100644
> > > --- a/include/hw/acpi/ich9.h
> > > +++ b/include/hw/acpi/ich9.h
> > > @@ -29,7 +29,7 @@
> > >  #include "hw/acpi/acpi_dev_interface.h"
> > >  #include "hw/acpi/tco.h"
> > >
> > > -#define ACPI_PCIHP_ADDR_ICH9 0x0cc4
> > > +#define ACPI_PCIHP_ADDR_ICH9 0x0dd4
> >
> > that's ABI change, it must be versioned

Any pointers how to do this? I see some property values for attributes
being set in hw/i386/pc.c for older models but this one is not exactly a
property as it is currently written.


> >
> > >
> > >  typedef struct ICH9LPCPMRegs {
> > >      /*
> >
> >
>

