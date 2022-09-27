Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 235755EBFFD
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:43:11 +0200 (CEST)
Received: from localhost ([::1]:41234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od83S-0008Sv-96
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1od7hE-00044k-5V
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:20:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1od7hB-0003cI-SH
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:20:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664274008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oLLbYkAFHN+WVH/f+FuvA+uO9wpztDxFmpK3Vulu8Rs=;
 b=ZJ+TfV0L2TPmjkMgGggCZ3OT5vsinOOIsqwnjEWQJr/6shh49uMNmpTMzBwApMjAoBCSI1
 NJjhTcKqfRZx70G8i8F+B83HCNG+CXuVsFE98uAFWUi8ZpafKKddqRwuhTAA+INoDdWNfu
 3/Cp/iPCP9gpHIt6hmGMvUd2jKQ0aJw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-82-ORe8R66dMumZ6RJIK5-JUw-1; Tue, 27 Sep 2022 06:20:06 -0400
X-MC-Unique: ORe8R66dMumZ6RJIK5-JUw-1
Received: by mail-ed1-f71.google.com with SMTP id
 w17-20020a056402269100b0045249bc17a9so7384747edd.9
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 03:20:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=oLLbYkAFHN+WVH/f+FuvA+uO9wpztDxFmpK3Vulu8Rs=;
 b=RQTAewzO3lOr2m6CIS49vSpLYkkM79dPsyfkI4NFDdUesaQjy63XhrVZ25LddIVLbo
 11gvRlDiuBYXjkxEvpDO80ZQSizgaDzTzk3QYxZ5mBuCEdETm+ILQdEFVPQStGDBbLDq
 HG1ZUFhqUFWbYUHNZFO3hOVfSQhNRS71+rsdoDuLt3rmxo4EwO7qujuwVNb5cEcwsQZ8
 2ShB4sJL4tmc4b+TaKwNkNmiFRFwEEHPq5N54P3iwqNeg/4D2mtaY6BtKUDyzSj0XbeU
 kjtRxDlWZnoLg/raEpEiXf6wQ/AsNqPPP3CxO+RVTFy6c+rrMgiuwFy0Fa1SDrZ4YKSg
 9qcA==
X-Gm-Message-State: ACrzQf1XqKvSrKGoXlbNwv4HdfBh7a/NqTJtC3xDF54g9E7hbIwqhC1d
 TAgL8CQ6hQOqpynIjTIN/YrlXI1F2e6IeQKubo2kJDi6deTenLcJqPaGcuBFiWbdVMT705MLfHm
 c6Mn/dmeLDmkVcLU=
X-Received: by 2002:a17:907:7ea3:b0:782:8c54:259 with SMTP id
 qb35-20020a1709077ea300b007828c540259mr17996174ejc.217.1664274005886; 
 Tue, 27 Sep 2022 03:20:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4rPLOQDJiTf0UExkg2SIO+GpeoEsWdIoi/AR08zN+iJCsCsn0m+5gSDz86newqhUJ5eSJe3A==
X-Received: by 2002:a17:907:7ea3:b0:782:8c54:259 with SMTP id
 qb35-20020a1709077ea300b007828c540259mr17996150ejc.217.1664274005592; 
 Tue, 27 Sep 2022 03:20:05 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 x61-20020a50bac3000000b004575085bf18sm961633ede.74.2022.09.27.03.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 03:20:04 -0700 (PDT)
Date: Tue, 27 Sep 2022 12:20:03 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, ani@anisinha.ca
Subject: Re: [PATCH 00/17] acpi:pc/q35: minor PCI refactoring/cleanups
Message-ID: <20220927122003.08d7a1eb@redhat.com>
In-Reply-To: <20220906091023-mutt-send-email-mst@kernel.org>
References: <20220701133515.137890-1-imammedo@redhat.com>
 <20220906134108.6e8a0fb3@redhat.com>
 <20220906091023-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 6 Sep 2022 09:10:32 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Sep 06, 2022 at 01:41:08PM +0200, Igor Mammedov wrote:
> > On Fri,  1 Jul 2022 09:34:58 -0400
> > Igor Mammedov <imammedo@redhat.com> wrote:
> >   
> > > Flushing out ACPI PCI cleanups that preceed conversion of
> > > DSDT PCI slots ennumeration to AcpiDevAmlIf interface.
> > > It's is mostly collection of patches thraet removes code
> > > duplication, we've accumulated around PCI relaterd AML
> > > in DSDT.  
> > 
> > ping,
> > it still applies cleanly to master.
> > 
> > Michael can you pick it up?  
> 
> yes, thanks for the ping!

ping?

> 
> > > 
> > > git:
> > >    https://gitlab.com/imammedo/qemu.git x86_pci_cleanups
> > > 
> > > Igor Mammedov (17):
> > >   tests: acpi: whitelist pc/q35 DSDT due to HPET AML move
> > >   acpi: x86: deduplicate HPET AML building
> > >   tests: acpi: update expected blobs after HPET move
> > >   tests: acpi: whitelist pc/q35 DSDT due to HPET AML move
> > >   acpi: x86: refactor PDSM method to reduce nesting
> > >   x86: acpi: _DSM: use Package to pass parameters
> > >   tests: acpi: update expected blobs
> > >   tests: acpi: whitelist pc/q35 DSDT before switching _DSM to use ASUN
> > >   x86: acpi: cleanup PCI device _DSM duplication
> > >   tests: acpi: update expected blobs
> > >   tests: acpi: whitelist pc/q35 DSDT before moving _ADR field
> > >   x86: pci: acpi: reorder Device's _ADR and _SUN fields
> > >   tests: acpi: update expected blobs
> > >   tests: acpi: whitelist pc/q35 DSDT before moving _ADR field
> > >   x86: pci: acpi:  reorder Device's _DSM method
> > >   tests: acpi: update expected blobs
> > >   x86: pci: acpi: deduplate PCI slots creation
> > > 
> > >  hw/i386/acpi-build.c                  | 302 ++++++++++++++------------
> > >  tests/data/acpi/pc/DSDT               | Bin 5987 -> 6422 bytes
> > >  tests/data/acpi/pc/DSDT.acpierst      | Bin 5954 -> 6382 bytes
> > >  tests/data/acpi/pc/DSDT.acpihmat      | Bin 7312 -> 7747 bytes
> > >  tests/data/acpi/pc/DSDT.bridge        | Bin 8653 -> 9496 bytes
> > >  tests/data/acpi/pc/DSDT.cphp          | Bin 6451 -> 6886 bytes
> > >  tests/data/acpi/pc/DSDT.dimmpxm       | Bin 7641 -> 8076 bytes
> > >  tests/data/acpi/pc/DSDT.hpbridge      | Bin 5954 -> 6382 bytes
> > >  tests/data/acpi/pc/DSDT.hpbrroot      | Bin 3069 -> 3069 bytes
> > >  tests/data/acpi/pc/DSDT.ipmikcs       | Bin 6059 -> 6494 bytes
> > >  tests/data/acpi/pc/DSDT.memhp         | Bin 7346 -> 7781 bytes
> > >  tests/data/acpi/pc/DSDT.nohpet        | Bin 5845 -> 6280 bytes
> > >  tests/data/acpi/pc/DSDT.numamem       | Bin 5993 -> 6428 bytes
> > >  tests/data/acpi/pc/DSDT.roothp        | Bin 6195 -> 6656 bytes
> > >  tests/data/acpi/q35/DSDT              | Bin 8274 -> 8320 bytes
> > >  tests/data/acpi/q35/DSDT.acpierst     | Bin 8291 -> 8337 bytes
> > >  tests/data/acpi/q35/DSDT.acpihmat     | Bin 9599 -> 9645 bytes
> > >  tests/data/acpi/q35/DSDT.applesmc     | Bin 8320 -> 8366 bytes
> > >  tests/data/acpi/q35/DSDT.bridge       | Bin 10988 -> 11449 bytes
> > >  tests/data/acpi/q35/DSDT.cphp         | Bin 8738 -> 8784 bytes
> > >  tests/data/acpi/q35/DSDT.cxl          | Bin 9600 -> 9646 bytes
> > >  tests/data/acpi/q35/DSDT.dimmpxm      | Bin 9928 -> 9974 bytes
> > >  tests/data/acpi/q35/DSDT.ipmibt       | Bin 8349 -> 8395 bytes
> > >  tests/data/acpi/q35/DSDT.ipmismbus    | Bin 8363 -> 8409 bytes
> > >  tests/data/acpi/q35/DSDT.ivrs         | Bin 8291 -> 8337 bytes
> > >  tests/data/acpi/q35/DSDT.memhp        | Bin 9633 -> 9679 bytes
> > >  tests/data/acpi/q35/DSDT.mmio64       | Bin 9404 -> 9450 bytes
> > >  tests/data/acpi/q35/DSDT.multi-bridge | Bin 8568 -> 8640 bytes
> > >  tests/data/acpi/q35/DSDT.nohpet       | Bin 8132 -> 8178 bytes
> > >  tests/data/acpi/q35/DSDT.numamem      | Bin 8280 -> 8326 bytes
> > >  tests/data/acpi/q35/DSDT.pvpanic-isa  | Bin 8375 -> 8421 bytes
> > >  tests/data/acpi/q35/DSDT.tis.tpm12    | Bin 8880 -> 8926 bytes
> > >  tests/data/acpi/q35/DSDT.tis.tpm2     | Bin 8906 -> 8952 bytes
> > >  tests/data/acpi/q35/DSDT.viot         | Bin 9383 -> 9429 bytes
> > >  tests/data/acpi/q35/DSDT.xapic        | Bin 35637 -> 35683 bytes
> > >  35 files changed, 161 insertions(+), 141 deletions(-)
> > >   
> 


