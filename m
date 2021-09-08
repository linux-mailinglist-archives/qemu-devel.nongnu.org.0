Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F2F4036DD
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 11:27:54 +0200 (CEST)
Received: from localhost ([::1]:38552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNts0-00059l-IM
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 05:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mNtpZ-0004GH-3Y
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 05:25:21 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:43985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mNtpW-0003FH-71
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 05:25:20 -0400
Received: by mail-pg1-x534.google.com with SMTP id r2so1935899pgl.10
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 02:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=mxmZAMnXC6hW7dALLZ3dfJLt69qyiDR+l/02sCzmqco=;
 b=OqDtH6kDb/pZuFKlYUE3J+UItqBdRZR+016zic1WsUClGW1Lbx7xnUY7Hfna7zEY+q
 9oCrA1OXPMkm1Ip2TiiG1wVFbFkSXMmbUclV1Rpp1JafTaAy+Cr4WA/hjnmX2j0VOZml
 tPh8gJk4dddPi2AMi6eEviXhPRpM3n/rGii0sYKFI6vVryGe4ZA+w5sD2C/2Eons1eqg
 E97jfm/sDP6t489TVk+1JQ6w17pPJ0grugDVDCkyvA09yBpy+JbFl90h7Ty3MFY1D8z4
 wgKWkomU5/vSgKB7XaASEd2hpEyBPQtgMdal/0AlMFLzx9IIcKox4SRxv/kfEKfmta0v
 W58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=mxmZAMnXC6hW7dALLZ3dfJLt69qyiDR+l/02sCzmqco=;
 b=eqCsHT8Cff165XsZ75QNUAYp+XYy9t1GibSG1omJDa/zQ0KF9TuZ3pBnWnmQiBEZPB
 34UACS1qKQcW7WBQymaMPMLNQg/Re6EaChUTKbhxNHTdJTtbIJyHLQy3w85Qv+JbRbOR
 i+hWLurQo3Trj/vnt7euQWpHK6R2YjJiG58EFE1zc/YfpF1O6CTl15vuPwRJetup/uRg
 qyshOrOJ7RiiOUYNLIw7b4WTYOg4ONSEYVrdpPGKJM+eAUVN+4lAzHghXhPmLzrSuWHT
 zDEaQ/AcHad2uAC8yqkTfoac+vk2zbMV9KBRnrSezcwaQM+rQBUZbf5AGLRPcqSGb5n8
 5g3g==
X-Gm-Message-State: AOAM5309+iOvVkJlVHCXwD7WMt4xFf99LSRN6/2N4EAJgW+SdfsXD//Y
 xbR8Gj3B/Nq1W3iXTHEUsiODoA==
X-Google-Smtp-Source: ABdhPJyBpMYWC/Vc1zL84peG+ibr0wYBiqUWx9A+YlB3ouPMkoNFJoYZLW6cPhVi1w+Z9Ikl59OrnQ==
X-Received: by 2002:a62:4ece:0:b0:3ef:88d5:ba51 with SMTP id
 c197-20020a624ece000000b003ef88d5ba51mr2867052pfb.3.1631093116204; 
 Wed, 08 Sep 2021 02:25:16 -0700 (PDT)
Received: from anisinha-lenovo ([203.163.242.70])
 by smtp.googlemail.com with ESMTPSA id l22sm1558799pjz.54.2021.09.08.02.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 02:25:15 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Wed, 8 Sep 2021 14:55:09 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH] hw/i386/acpi-build: adjust q35 IO addr range for acpi
 pci hotplug
In-Reply-To: <20210908104351.72d0bb19@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2109081452060.2227929@anisinha-lenovo>
References: <20210908041139.2219253-1-ani@anisinha.ca>
 <20210908084256.6077f7a3@redhat.com>
 <alpine.DEB.2.22.394.2109081229250.2227929@anisinha-lenovo>
 <20210908104351.72d0bb19@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::534;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x534.google.com
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
 qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Wed, 8 Sep 2021, Igor Mammedov wrote:

> On Wed, 8 Sep 2021 12:51:04 +0530 (IST)
> Ani Sinha <ani@anisinha.ca> wrote:
>
> > On Wed, 8 Sep 2021, Igor Mammedov wrote:
> >
> > > On Wed,  8 Sep 2021 09:41:39 +0530
> > > Ani Sinha <ani@anisinha.ca> wrote:
> > >
> > > > Change caf108bc58790 ("hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35")
> > > > selects an IO address range for acpi based PCI hotplug for q35 arbitrarily. It
> > > > starts at address 0x0cc4 and ends at 0x0cdb. It was assumed that this address
> > > > range was free and available. However, upon more testing, it seems this address
> > > > range to be not available for some latest versions of windows.
> > >
> > > The range is something assigned by QEMU, and guest has no say where it should be.
> > > but perhaps we failed to describe it properly or something similar, so one gets
> > > 'no resource' error.
> >
> > OK dug deeper. The existing range of IO address conflicts with the CPU
> > hotplug range.
> >
> > CPU hotplug range (ICH9_CPU_HOTPLUG_IO_BASE) is 0x0cd8 to 0x0ce3
> >
> > This intersects with range 0x0cc4 to 0x0cdb for ACPI_PCIHP_ADDR_ICH9 .
>
> Looking at 'info mtree' it's indeed wrong:
>
>     0000000000000cc4-0000000000000cdb (prio 0, i/o): acpi-pci-hotplug
>     0000000000000cd8-0000000000000cf7 (prio 0, i/o): acpi-cpu-hotplug
>
> which of them eventually handles IO request in intersection range?
>
> Please, add to commit message your findings, so it would point out
> where problem comes from and what it breaks(doesn't work as expect).
>

Will do.

> Given it's broken to begin with (and possibly regression if it broke cpu hotplug),
> I'm inclined to fix it without adding compat stuff.
> Michael, what do you think?
>
> > We need to change one or the other.
> >
> > From the windows device manager, I see that the other IO address range is
> > 0x0620 to 0x062F which is reserved for GPE0.
> >
> > .
> > > We need a find out a reason why Windows doesn't like it. You might get more
> > > detailed error running Windows debug build with ACPI debugger attached.
> >
> > bummer. This is beyond my expertize and I do not have a windows debug
> > build.
> never mind, you already found the issue.
>
> > > > Hence, this
> > > > change modifies the IO address range so that windows can allocate the address
> > > > range without any conflict. The new address range would start at 0x0dd4 and end
> > > > at address 0x0deb.
> > > >
> > > > This change has been tested using a Windows Server 2019 guest VM.
> > > >
> > > > Fixes: caf108bc58790 ("hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35")
> > > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/561
> > > >
> > > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > > ---
> > > >  include/hw/acpi/ich9.h | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
> > > > index a329ce43ab..b68c5a2174 100644
> > > > --- a/include/hw/acpi/ich9.h
> > > > +++ b/include/hw/acpi/ich9.h
> > > > @@ -29,7 +29,7 @@
> > > >  #include "hw/acpi/acpi_dev_interface.h"
> > > >  #include "hw/acpi/tco.h"
> > > >
> > > > -#define ACPI_PCIHP_ADDR_ICH9 0x0cc4
> > > > +#define ACPI_PCIHP_ADDR_ICH9 0x0dd4
> maybe 0xcc0 to fit right under acpi-cpu-hotplug as it was intended?

After fixing, this is what it looks like:

$ virsh qemu-monitor-command --hmp win2k19 'info mtree' | grep acpi-
      0000000000000600-0000000000000603 (prio 0, i/o): acpi-evt
      0000000000000604-0000000000000605 (prio 0, i/o): acpi-cnt
      0000000000000608-000000000000060b (prio 0, i/o): acpi-tmr
      0000000000000620-000000000000062f (prio 0, i/o): acpi-gpe0
      0000000000000630-0000000000000637 (prio 0, i/o): acpi-smi
    0000000000000cc0-0000000000000cd7 (prio 0, i/o): acpi-pci-hotplug
    0000000000000cd8-0000000000000ce3 (prio 0, i/o): acpi-cpu-hotplug






