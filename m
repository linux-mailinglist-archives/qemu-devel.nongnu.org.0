Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6123D729C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 12:09:06 +0200 (CEST)
Received: from localhost ([::1]:53352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8K1I-0002H7-V6
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 06:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m8K02-000100-U3
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:07:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m8Jzy-0002Tz-OE
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:07:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627380460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hTBg0YmPwXqcm4Htxcs6rV29lQN034Sq3/trw/VofkU=;
 b=ZHtWbO6TIlmOnChUR4INIMQRcZSO6xE1mRZM45NOXQY387xsbL0jCKEFoaqFeL4m99UiJ6
 xc6tfgqPJcs9fPHWfzjbcwo1LYCPbX7kM4zCGMlElqwXQAKurb9lWL+p5KaSCU0YPBApMc
 hsBh6BEeISzh4IAr+f2umOSl0C6+pco=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-sUz9GIakM7SBsynkO9Q_hQ-1; Tue, 27 Jul 2021 06:07:39 -0400
X-MC-Unique: sUz9GIakM7SBsynkO9Q_hQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 c20-20020a0564021014b029039994f9cab9so6312914edu.22
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 03:07:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hTBg0YmPwXqcm4Htxcs6rV29lQN034Sq3/trw/VofkU=;
 b=ts1dkP2Uf8V9HUDiEJvFxLu0NshPgBYoeD0BdSffemj7MVdCFwYeTVh0eXcBGA7WV4
 chDTOdmHnWMeHwGf6AuBQ+0F2gAgVKXLilbk8NZ2Aeg28P3J+14LDtuk2g4Mr0wGqb0F
 oeZw0MhP1x+Eit9LO7KsJ8Nina9az0Q9YLOimHU0AcDAH9jCCrTo2d3xIJzWu+9IHyTS
 xj3ANyz7p6sPWAvtVe/Hy6bWDVy5aOOEr6vm4v5o3hyzpxglpW0gzo7pDEwl/adFC4xa
 /d8JZZNLmZB4MaEv49sNJNUgkDQPWJDpn4j4JDHkRaO+N7y6gaXxlnXar/Hk1ZVvvpWF
 ykwA==
X-Gm-Message-State: AOAM5333yINw0aTNIQA9Nogcb0nB4GE+nQkWDL4w3aobGgzpzlGlVbPf
 hnQRJJa3uLeJsrzsKu6gqnYmC01IdqmUtnqbrVlxVPEnM4lCcuHz4GNzZTn5Tjj7/uAaE3K2zH+
 q0kxbTThi9rDUiio=
X-Received: by 2002:a17:906:e089:: with SMTP id
 gh9mr14983130ejb.80.1627380457934; 
 Tue, 27 Jul 2021 03:07:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhhPsgajmzHJ0Q2Bn1bg0f82TOAzGINOz3jpGAObcvb0xeBLZ0c6J2X13eLbvOoePVQ3ZyZQ==
X-Received: by 2002:a17:906:e089:: with SMTP id
 gh9mr14983109ejb.80.1627380457681; 
 Tue, 27 Jul 2021 03:07:37 -0700 (PDT)
Received: from redhat.com ([2.55.128.141])
 by smtp.gmail.com with ESMTPSA id l7sm743415ejk.53.2021.07.27.03.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 03:07:36 -0700 (PDT)
Date: Tue, 27 Jul 2021 06:07:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: aarch64 efi boot failures with qemu 6.0+
Message-ID: <20210727060550-mutt-send-email-mst@kernel.org>
References: <20210724185234.GA2265457@roeck-us.net>
 <20210725181334-mutt-send-email-mst@kernel.org>
 <14aff6ab-0b96-fe22-bc35-18d2e8528a5b@roeck-us.net>
 <2a4076fd-2225-b3a8-7a1e-3bc090046673@redhat.com>
 <CAMj1kXGBpyqB3Upt76ynry-cmowRGCcyMpWzHV2xiyS+txytdQ@mail.gmail.com>
 <20210727004401-mutt-send-email-mst@kernel.org>
 <f526c655-3d25-bf66-8f96-cef55c9f6fa3@roeck-us.net>
 <CAMj1kXEx1wqGJqTsNDNpBNLhFzn=kXmKFJ8m6AqZCPhfF1WC1g@mail.gmail.com>
 <20210727052516-mutt-send-email-mst@kernel.org>
 <CAMj1kXHtjZh_n-iBObPTDqdN8oV0DKtpXgRfUApNOYgVeYpCBA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMj1kXHtjZh_n-iBObPTDqdN8oV0DKtpXgRfUApNOYgVeYpCBA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jiahui Cen <cenjiahui@huawei.com>,
 Ard Biesheuvel <ardb+tianocore@kernel.org>, qemu-devel@nongnu.org,
 Bjorn Helgaas <bhelgaas@google.com>, Igor Mammedov <imammedo@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 27, 2021 at 11:50:23AM +0200, Ard Biesheuvel wrote:
> On Tue, 27 Jul 2021 at 11:30, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Jul 27, 2021 at 09:04:20AM +0200, Ard Biesheuvel wrote:
> > > On Tue, 27 Jul 2021 at 07:12, Guenter Roeck <linux@roeck-us.net> wrote:
> > > >
> > > > On 7/26/21 9:45 PM, Michael S. Tsirkin wrote:
> > > > > On Mon, Jul 26, 2021 at 06:00:57PM +0200, Ard Biesheuvel wrote:
> > > > >> (cc Bjorn)
> > > > >>
> > > > >> On Mon, 26 Jul 2021 at 11:08, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> > > > >>>
> > > > >>> On 7/26/21 12:56 AM, Guenter Roeck wrote:
> > > > >>>> On 7/25/21 3:14 PM, Michael S. Tsirkin wrote:
> > > > >>>>> On Sat, Jul 24, 2021 at 11:52:34AM -0700, Guenter Roeck wrote:
> > > > >>>>>> Hi all,
> > > > >>>>>>
> > > > >>>>>> starting with qemu v6.0, some of my aarch64 efi boot tests no longer
> > > > >>>>>> work. Analysis shows that PCI devices with IO ports do not instantiate
> > > > >>>>>> in qemu v6.0 (or v6.1-rc0) when booting through efi. The problem affects
> > > > >>>>>> (at least) ne2k_pci, tulip, dc390, and am53c974. The problem only
> > > > >>>>>> affects
> > > > >>>>>> aarch64, not x86/x86_64.
> > > > >>>>>>
> > > > >>>>>> I bisected the problem to commit 0cf8882fd0 ("acpi/gpex: Inform os to
> > > > >>>>>> keep firmware resource map"). Since this commit, PCI device BAR
> > > > >>>>>> allocation has changed. Taking tulip as example, the kernel reports
> > > > >>>>>> the following PCI bar assignments when running qemu v5.2.
> > > > >>>>>>
> > > > >>>>>> [    3.921801] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
> > > > >>>>>> [    3.922207] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
> > > > >>>>>> [    3.922505] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f]
> > > > >>
> > > > >> IIUC, these lines are read back from the BARs
> > > > >>
> > > > >>>>>> [    3.927111] pci 0000:00:01.0: BAR 0: assigned [io  0x1000-0x107f]
> > > > >>>>>> [    3.927455] pci 0000:00:01.0: BAR 1: assigned [mem
> > > > >>>>>> 0x10000000-0x1000007f]
> > > > >>>>>>
> > > > >>
> > > > >> ... and this is the assignment created by the kernel.
> > > > >>
> > > > >>>>>> With qemu v6.0, the assignment is reported as follows.
> > > > >>>>>>
> > > > >>>>>> [    3.922887] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
> > > > >>>>>> [    3.923278] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
> > > > >>>>>> [    3.923451] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f]
> > > > >>>>>>
> > > > >>
> > > > >> The problem here is that Linux, for legacy reasons, does not support
> > > > >> I/O ports <= 0x1000 on PCI, so the I/O assignment created by EFI is
> > > > >> rejected.
> > > > >>
> > > > >> This might make sense on x86, where legacy I/O ports may exist, but on
> > > > >> other architectures, this makes no sense.
> > > > >
> > > > >
> > > > > Fixing Linux makes sense but OTOH EFI probably shouldn't create mappings
> > > > > that trip up existing guests, right?
> > > > >
> > > >
> > > > I think it is difficult to draw a line. Sure, maybe EFI should not create
> > > > such mappings, but then maybe qemu should not suddenly start to enforce
> > > > those mappings for existing guests either.
> > > >
> > >
> > > EFI creates the mappings primarily for itself, and up until DSM #5
> > > started to be enforced, all PCI resource allocations that existed at
> > > boot were ignored by Linux and recreated from scratch.
> > >
> > > Also, the commit in question looks dubious to me. I don't think it is
> > > likely that Linux would fail to create a resource tree. What does
> > > happen is that BARs get moved around, which may cause trouble in some
> > > cases: for instance, we had to add special code to the EFI framebuffer
> > > driver to copy with framebuffer BARs being relocated.
> > >
> > > > For my own testing, I simply reverted commit 0cf8882fd0 in my copy of
> > > > qemu. That solves my immediate problem, giving us time to find a solution
> > > > that is acceptable for everyone. After all, it doesn't look like anyone
> > > > else has noticed the problem, so there is no real urgency.
> > > >
> > >
> > > I would argue that it is better to revert that commit. DSM #5 has a
> > > long history of debate and misinterpretation, and while I think we
> > > ended up with something sane, I don't think we should be using it in
> > > this particular case.
> >
> > I think revert might make sense, however:
> >
> > 0: No (The operating system shall not ignore the PCI configuration that firmware has done
> > at boot time. However, the operating system is free to configure the devices in this hierarchy
> > that have not been configured by the firmware. There may be a reduced level of hot plug
> > capability support in this hierarchy due to resource constraints. This situation is the same as
> > the legacy situation where this _DSM is not provided.)
> >
> > ^^^^ does not this imply that reporting a 0 as we currently do
> >      should be mostly a NOP?
> >
> 
> Not really. The resource allocation strategies are different between
> EDK2 and Linux, and as Guenter's testing proves, EDK2 may lay out PCI
> resources in a way that interferes with Linux's expectations. The I/O
> port 0x0 problem is just one potential issue here: another issue is
> resource padding for hotplug, which is important for VMs, not only the
> IO/MEM resource allocations, but the bus ranges as well.

Hmm not sure I understand the answer. The text above seems to say
that 0 should be the same as _DSM 5 is not provided, does it not?
Why did behaviour change when we switched from not providing _DSM 5
to providing but returning 0?


> >
> > 1: Yes (The operating system may ignore the PCI configuration that the firmware has done
> > at boot time, and reconfigure/rebalance the resources in the hierarchy.)
> >
> >
> > So I am debating with myself whether this should be a plain revert or
> > return 1 here:
> >      /*
> >       * 0 - The operating system must not ignore the PCI configuration that
> >       *     firmware has done at boot time.
> >       */
> >      aml_append(ifctx1, aml_return(aml_int(0)));
> > -    aml_append(ifctx, ifctx1);
> > +    aml_append(ifctx1, aml_return(aml_int(1)));
> >      aml_append(method, ifctx);
> >
> 
> I agree that returning '1' here is a better choice, as it explicitly
> gives the OS license to reassign all resources, which is what we have
> been relying on to begin with.
> 
> OTOH, I do think we should fix arbitrary zero checks in Linux that
> make no sense on !x86
> 
> >
> >
> > Guenter what happens if we return 1? Do things work well?
> >
> > --
> > MST
> >


