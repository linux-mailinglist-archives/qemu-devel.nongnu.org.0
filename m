Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D434DD93F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 12:52:09 +0100 (CET)
Received: from localhost ([::1]:58778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVB9N-0006wO-3Y
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 07:52:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lorenzo.pieralisi@arm.com>)
 id 1nVB5Y-0005Vo-OM
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 07:48:14 -0400
Received: from foss.arm.com ([217.140.110.172]:50706)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lorenzo.pieralisi@arm.com>) id 1nVB5U-0001eQ-VM
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 07:48:11 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A19AD1424;
 Fri, 18 Mar 2022 04:48:06 -0700 (PDT)
Received: from lpieralisi (unknown [10.57.6.38])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7ACB83F7F5;
 Fri, 18 Mar 2022 04:48:04 -0700 (PDT)
Date: Fri, 18 Mar 2022 11:48:00 +0000
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: aarch64 efi boot failures with qemu 6.0+
Message-ID: <YjRxTJINgRsGYuAH@lpieralisi>
References: <14aff6ab-0b96-fe22-bc35-18d2e8528a5b@roeck-us.net>
 <2a4076fd-2225-b3a8-7a1e-3bc090046673@redhat.com>
 <CAMj1kXGBpyqB3Upt76ynry-cmowRGCcyMpWzHV2xiyS+txytdQ@mail.gmail.com>
 <20210727004401-mutt-send-email-mst@kernel.org>
 <f526c655-3d25-bf66-8f96-cef55c9f6fa3@roeck-us.net>
 <CAMj1kXEx1wqGJqTsNDNpBNLhFzn=kXmKFJ8m6AqZCPhfF1WC1g@mail.gmail.com>
 <20210727052516-mutt-send-email-mst@kernel.org>
 <CAMj1kXHtjZh_n-iBObPTDqdN8oV0DKtpXgRfUApNOYgVeYpCBA@mail.gmail.com>
 <20210727060550-mutt-send-email-mst@kernel.org>
 <CAMj1kXHyV2Vp60AuqM+9a5jyW_K2=KNUp4NqyFNGBshmFmhkQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMj1kXHyV2Vp60AuqM+9a5jyW_K2=KNUp4NqyFNGBshmFmhkQg@mail.gmail.com>
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=lorenzo.pieralisi@arm.com; helo=foss.arm.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: Jiahui Cen <cenjiahui@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Ard Biesheuvel <ardb+tianocore@kernel.org>, qemu-devel@nongnu.org,
 Bjorn Helgaas <bhelgaas@google.com>, Igor Mammedov <imammedo@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 27, 2021 at 12:14:48PM +0200, Ard Biesheuvel wrote:
> (+ Lorenzo)
> 
> On Tue, 27 Jul 2021 at 12:07, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Jul 27, 2021 at 11:50:23AM +0200, Ard Biesheuvel wrote:
> > > On Tue, 27 Jul 2021 at 11:30, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Tue, Jul 27, 2021 at 09:04:20AM +0200, Ard Biesheuvel wrote:
> > > > > On Tue, 27 Jul 2021 at 07:12, Guenter Roeck <linux@roeck-us.net> wrote:
> > > > > >
> > > > > > On 7/26/21 9:45 PM, Michael S. Tsirkin wrote:
> > > > > > > On Mon, Jul 26, 2021 at 06:00:57PM +0200, Ard Biesheuvel wrote:
> > > > > > >> (cc Bjorn)
> > > > > > >>
> > > > > > >> On Mon, 26 Jul 2021 at 11:08, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> > > > > > >>>
> > > > > > >>> On 7/26/21 12:56 AM, Guenter Roeck wrote:
> > > > > > >>>> On 7/25/21 3:14 PM, Michael S. Tsirkin wrote:
> > > > > > >>>>> On Sat, Jul 24, 2021 at 11:52:34AM -0700, Guenter Roeck wrote:
> > > > > > >>>>>> Hi all,
> > > > > > >>>>>>
> > > > > > >>>>>> starting with qemu v6.0, some of my aarch64 efi boot tests no longer
> > > > > > >>>>>> work. Analysis shows that PCI devices with IO ports do not instantiate
> > > > > > >>>>>> in qemu v6.0 (or v6.1-rc0) when booting through efi. The problem affects
> > > > > > >>>>>> (at least) ne2k_pci, tulip, dc390, and am53c974. The problem only
> > > > > > >>>>>> affects
> > > > > > >>>>>> aarch64, not x86/x86_64.
> > > > > > >>>>>>
> > > > > > >>>>>> I bisected the problem to commit 0cf8882fd0 ("acpi/gpex: Inform os to
> > > > > > >>>>>> keep firmware resource map"). Since this commit, PCI device BAR
> > > > > > >>>>>> allocation has changed. Taking tulip as example, the kernel reports
> > > > > > >>>>>> the following PCI bar assignments when running qemu v5.2.
> > > > > > >>>>>>
> > > > > > >>>>>> [    3.921801] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
> > > > > > >>>>>> [    3.922207] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
> > > > > > >>>>>> [    3.922505] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f]
> > > > > > >>
> > > > > > >> IIUC, these lines are read back from the BARs
> > > > > > >>
> > > > > > >>>>>> [    3.927111] pci 0000:00:01.0: BAR 0: assigned [io  0x1000-0x107f]
> > > > > > >>>>>> [    3.927455] pci 0000:00:01.0: BAR 1: assigned [mem
> > > > > > >>>>>> 0x10000000-0x1000007f]
> > > > > > >>>>>>
> > > > > > >>
> > > > > > >> ... and this is the assignment created by the kernel.
> > > > > > >>
> > > > > > >>>>>> With qemu v6.0, the assignment is reported as follows.
> > > > > > >>>>>>
> > > > > > >>>>>> [    3.922887] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
> > > > > > >>>>>> [    3.923278] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
> > > > > > >>>>>> [    3.923451] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f]
> > > > > > >>>>>>
> > > > > > >>
> > > > > > >> The problem here is that Linux, for legacy reasons, does not support
> > > > > > >> I/O ports <= 0x1000 on PCI, so the I/O assignment created by EFI is
> > > > > > >> rejected.
> > > > > > >>
> > > > > > >> This might make sense on x86, where legacy I/O ports may exist, but on
> > > > > > >> other architectures, this makes no sense.
> > > > > > >
> > > > > > >
> > > > > > > Fixing Linux makes sense but OTOH EFI probably shouldn't create mappings
> > > > > > > that trip up existing guests, right?
> > > > > > >
> > > > > >
> > > > > > I think it is difficult to draw a line. Sure, maybe EFI should not create
> > > > > > such mappings, but then maybe qemu should not suddenly start to enforce
> > > > > > those mappings for existing guests either.
> > > > > >
> > > > >
> > > > > EFI creates the mappings primarily for itself, and up until DSM #5
> > > > > started to be enforced, all PCI resource allocations that existed at
> > > > > boot were ignored by Linux and recreated from scratch.
> > > > >
> > > > > Also, the commit in question looks dubious to me. I don't think it is
> > > > > likely that Linux would fail to create a resource tree. What does
> > > > > happen is that BARs get moved around, which may cause trouble in some
> > > > > cases: for instance, we had to add special code to the EFI framebuffer
> > > > > driver to copy with framebuffer BARs being relocated.
> > > > >
> > > > > > For my own testing, I simply reverted commit 0cf8882fd0 in my copy of
> > > > > > qemu. That solves my immediate problem, giving us time to find a solution
> > > > > > that is acceptable for everyone. After all, it doesn't look like anyone
> > > > > > else has noticed the problem, so there is no real urgency.
> > > > > >
> > > > >
> > > > > I would argue that it is better to revert that commit. DSM #5 has a
> > > > > long history of debate and misinterpretation, and while I think we
> > > > > ended up with something sane, I don't think we should be using it in
> > > > > this particular case.
> > > >
> > > > I think revert might make sense, however:
> > > >
> > > > 0: No (The operating system shall not ignore the PCI configuration that firmware has done
> > > > at boot time. However, the operating system is free to configure the devices in this hierarchy
> > > > that have not been configured by the firmware. There may be a reduced level of hot plug
> > > > capability support in this hierarchy due to resource constraints. This situation is the same as
> > > > the legacy situation where this _DSM is not provided.)
> > > >
> > > > ^^^^ does not this imply that reporting a 0 as we currently do
> > > >      should be mostly a NOP?
> > > >
> > >
> > > Not really. The resource allocation strategies are different between
> > > EDK2 and Linux, and as Guenter's testing proves, EDK2 may lay out PCI
> > > resources in a way that interferes with Linux's expectations. The I/O
> > > port 0x0 problem is just one potential issue here: another issue is
> > > resource padding for hotplug, which is important for VMs, not only the
> > > IO/MEM resource allocations, but the bus ranges as well.
> >
> > Hmm not sure I understand the answer. The text above seems to say
> > that 0 should be the same as _DSM 5 is not provided, does it not?
> 
> That is what the spec says, but it has never been what Linux/arm64
> does. Its PCI arch code is based on 32-bit ARM, which uses simple
> bootloaders that are completely unaware of the existence of PCI, and
> so from the beginning, we have always reassigned all resources (but
> not bus numbers IIRC) because that is what ARM did. On arm64, of
> course, we often do have rich firmware that initializes PCI, but by
> that time, the cat was out of the bag already, and we could not simply
> stop reassigning resources without running a substantial regression
> risk, even when booting in ACPI mode.
> 
> So the default behavior on arm64 is '1' not '0' in terms of DSM #5.

So, to summarize, what happens here is that if the _DSM #5 returns
0, we try to keep the BAR content, which in Linux terms means we
"claim" the resources and succeed, correct ?

In other words: pci_bus_claim_resources(), for IO BARs succeeds,
it is not the claiming that fails but kernel code that tries to
access IO resources at 0x0 and deems it inappropriate on arm64.

The issue then is that the kernel rejects IO port addresses on PCI
starting at 0x0 - are we able to pinpoint where the actual bug
kicks in in this specific case ?

Thanks,
Lorenzo

> 
> > Why did behaviour change when we switched from not providing _DSM 5
> > to providing but returning 0?
> >
> >
> > > >
> > > > 1: Yes (The operating system may ignore the PCI configuration that the firmware has done
> > > > at boot time, and reconfigure/rebalance the resources in the hierarchy.)
> > > >
> > > >
> > > > So I am debating with myself whether this should be a plain revert or
> > > > return 1 here:
> > > >      /*
> > > >       * 0 - The operating system must not ignore the PCI configuration that
> > > >       *     firmware has done at boot time.
> > > >       */
> > > >      aml_append(ifctx1, aml_return(aml_int(0)));
> > > > -    aml_append(ifctx, ifctx1);
> > > > +    aml_append(ifctx1, aml_return(aml_int(1)));
> > > >      aml_append(method, ifctx);
> > > >
> > >
> > > I agree that returning '1' here is a better choice, as it explicitly
> > > gives the OS license to reassign all resources, which is what we have
> > > been relying on to begin with.
> > >
> > > OTOH, I do think we should fix arbitrary zero checks in Linux that
> > > make no sense on !x86
> > >
> > > >
> > > >
> > > > Guenter what happens if we return 1? Do things work well?
> > > >
> > > > --
> > > > MST
> > > >
> >

