Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 825493D8EAC
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 15:12:09 +0200 (CEST)
Received: from localhost ([::1]:59296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8jM0-000208-Aa
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 09:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m8jLB-0001L5-AN
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 09:11:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m8jL8-0005cM-Ok
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 09:11:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627477873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qnOPJf1tqK1v0u+qSZJiL4UwabdKxoMqZ8LBVTSc6Q4=;
 b=EyqBvUgpkgOgZXhqbeCfJCXlQnAmBnd7i76+VvVDXvW6IZjJE7RRxh+K1PPAHJzbEG/yik
 Im1frW4ep8k+12az8nCNoKyUlE+oVUtE9dfP2qPxwbcPDrOcUe1JzvgVBZ2gIePWcWNKB2
 f+a/A64OrozH7llLDuZZlL+zKORYYPw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-DF6zYRW9NfGFRtHeeeclmg-1; Wed, 28 Jul 2021 09:11:10 -0400
X-MC-Unique: DF6zYRW9NfGFRtHeeeclmg-1
Received: by mail-ed1-f70.google.com with SMTP id
 b4-20020a05640202c4b02903948bc39fd5so1218451edx.13
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 06:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=qnOPJf1tqK1v0u+qSZJiL4UwabdKxoMqZ8LBVTSc6Q4=;
 b=AoEnm2txmcQH2ElRWY4NROBH918HbEMlh4deqEJCXIgVpCR1aLkqT90yy7kMkTuYKT
 zofSUe4FsW/HVr5I+7hpv5kZJQkYLMalnLTc2jAjGRQbdjxSYkRjNXgfkeTB2n3Yi5Af
 IjnM/RtP+kfpzIiHGNaoSjR18SkNAWASDJLL5uKrnXifOmzE6m876DN9kpMSWnKUOxaQ
 nWK0MLB1tAzptDnLIkYkP15noadjq2k33UNwpgoZWpY48KeTkdX1jTLLZzCAOgdiNcQ7
 BgYUq+ZNYTk8Bxbd8Mn58qlTyd4x41UnYwtaJKHAKOl6ZJcquOg8wFPmlrX9zCRzaEf1
 TRmQ==
X-Gm-Message-State: AOAM530xgK6E3oeEZF+4Z+8Rj/WcSW6Nt0J/XggQrim3IS9AO6Uf7E2J
 ZPFQCB84Qo5LjjrtdhGeOGwqZzs5A+cxRfCL6VyJiMW9fqzPhbYaJZ3h5RoJXW1cVAkVybkdhtZ
 QCP+zQQ4QAJEOJWM=
X-Received: by 2002:aa7:dcc5:: with SMTP id w5mr34647871edu.355.1627477868816; 
 Wed, 28 Jul 2021 06:11:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/608RzYBswS2cH9eMpn9dlxx3HT1bqJD/iN3JEK+Aa1DqYhNEc2kpS/XKzOWL0o+PEFIJvA==
X-Received: by 2002:aa7:dcc5:: with SMTP id w5mr34647826edu.355.1627477868570; 
 Wed, 28 Jul 2021 06:11:08 -0700 (PDT)
Received: from redhat.com ([2.55.154.10])
 by smtp.gmail.com with ESMTPSA id a12sm2043412ejv.14.2021.07.28.06.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 06:11:08 -0700 (PDT)
Date: Wed, 28 Jul 2021 09:11:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: aarch64 efi boot failures with qemu 6.0+
Message-ID: <20210728090555-mutt-send-email-mst@kernel.org>
References: <20210724185234.GA2265457@roeck-us.net>
 <20210725181334-mutt-send-email-mst@kernel.org>
 <14aff6ab-0b96-fe22-bc35-18d2e8528a5b@roeck-us.net>
 <2a4076fd-2225-b3a8-7a1e-3bc090046673@redhat.com>
 <CAMj1kXGBpyqB3Upt76ynry-cmowRGCcyMpWzHV2xiyS+txytdQ@mail.gmail.com>
 <20210727004401-mutt-send-email-mst@kernel.org>
 <f526c655-3d25-bf66-8f96-cef55c9f6fa3@roeck-us.net>
 <20210727045315-mutt-send-email-mst@kernel.org>
 <20210727123603.6119c34c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210727123603.6119c34c@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
 Bjorn Helgaas <bhelgaas@google.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 27, 2021 at 12:36:03PM +0200, Igor Mammedov wrote:
> On Tue, 27 Jul 2021 05:01:23 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Mon, Jul 26, 2021 at 10:12:38PM -0700, Guenter Roeck wrote:
> > > On 7/26/21 9:45 PM, Michael S. Tsirkin wrote:  
> > > > On Mon, Jul 26, 2021 at 06:00:57PM +0200, Ard Biesheuvel wrote:  
> > > > > (cc Bjorn)
> > > > > 
> > > > > On Mon, 26 Jul 2021 at 11:08, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:  
> > > > > > 
> > > > > > On 7/26/21 12:56 AM, Guenter Roeck wrote:  
> > > > > > > On 7/25/21 3:14 PM, Michael S. Tsirkin wrote:  
> > > > > > > > On Sat, Jul 24, 2021 at 11:52:34AM -0700, Guenter Roeck wrote:  
> > > > > > > > > Hi all,
> > > > > > > > > 
> > > > > > > > > starting with qemu v6.0, some of my aarch64 efi boot tests no longer
> > > > > > > > > work. Analysis shows that PCI devices with IO ports do not instantiate
> > > > > > > > > in qemu v6.0 (or v6.1-rc0) when booting through efi. The problem affects
> > > > > > > > > (at least) ne2k_pci, tulip, dc390, and am53c974. The problem only
> > > > > > > > > affects
> > > > > > > > > aarch64, not x86/x86_64.
> > > > > > > > > 
> > > > > > > > > I bisected the problem to commit 0cf8882fd0 ("acpi/gpex: Inform os to
> > > > > > > > > keep firmware resource map"). Since this commit, PCI device BAR
> > > > > > > > > allocation has changed. Taking tulip as example, the kernel reports
> > > > > > > > > the following PCI bar assignments when running qemu v5.2.
> > > > > > > > > 
> > > > > > > > > [    3.921801] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
> > > > > > > > > [    3.922207] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
> > > > > > > > > [    3.922505] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f]  
> > > > > 
> > > > > IIUC, these lines are read back from the BARs
> > > > >   
> > > > > > > > > [    3.927111] pci 0000:00:01.0: BAR 0: assigned [io  0x1000-0x107f]
> > > > > > > > > [    3.927455] pci 0000:00:01.0: BAR 1: assigned [mem
> > > > > > > > > 0x10000000-0x1000007f]
> > > > > > > > >   
> > > > > 
> > > > > ... and this is the assignment created by the kernel.
> > > > >   
> > > > > > > > > With qemu v6.0, the assignment is reported as follows.
> > > > > > > > > 
> > > > > > > > > [    3.922887] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
> > > > > > > > > [    3.923278] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
> > > > > > > > > [    3.923451] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f]
> > > > > > > > >   
> > > > > 
> > > > > The problem here is that Linux, for legacy reasons, does not support
> > > > > I/O ports <= 0x1000 on PCI, so the I/O assignment created by EFI is
> > > > > rejected.
> > > > > 
> > > > > This might make sense on x86, where legacy I/O ports may exist, but on
> > > > > other architectures, this makes no sense.  
> > > > 
> > > > 
> > > > Fixing Linux makes sense but OTOH EFI probably shouldn't create mappings
> > > > that trip up existing guests, right?
> > > >   
> > > 
> > > I think it is difficult to draw a line. Sure, maybe EFI should not create
> > > such mappings, but then maybe qemu should not suddenly start to enforce
> > > those mappings for existing guests either.  
> > 
> > I would say both. But about QEMU actually I think you have a point here.
> > Re-reading the spec:
> > 
> > 0: No (The operating system shall not ignore the PCI configuration that firmware has done
> > at boot time. However, the operating system is free to configure the devices in this hierarchy
> > that have not been configured by the firmware. There may be a reduced level of hot plug
> > capability support in this hierarchy due to resource constraints. This situation is the same as
> > the legacy situation where this _DSM is not provided.)
> > 1: Yes (The operating system may ignore the PCI configuration that the firmware has done
> > at boot time, and reconfigure/rebalance the resources in the hierarchy.)
> > 
> > 
> > I think I misread the spec previously, and understood it to mean that
> > 1 means must ignore. In fact 1 gives the most flexibility.
> > So why are we suddenly telling the guest it must not override
> > firmware?
> > 
> > The commit log says
> >     The diffences could result in resource assignment failure.
> > 
> > which is kind of vague ...
> > 
> > Jiahui Cen, Igor, what do you think about it?
> > I'm inclined to revert 0cf8882fd06ba0aeb1e90fa6f23fce85504d7e14
> > at least for now.
> Looking at patch history, it seems consensus was that it's better to
> enforce firmware allocations.
> 
> Also letting OS do as it pleases might break PCI devices that
> don't tolerate reallocation. ex: firmware initializes PCI device
> IO/BARs and then fetches ACPI tables, which get patched with
> assigned resources.
> 
> to me returning 0 seems to be correct choice.
> In addition resource hinting also works via firmware allocations,
> if we revert the commit it might change those configs.


Well if firmware people now tell us their allocations were never
intended for guest OS use then maybe we should not intervene.

As others noted the original commit was kind of vague:

1. it said "Using _DSM #5 method to inform guest os not to ignore the PCI configuration
that firmware has done at boot time could handle the differences."
which is not what the spec says and not what the patch did -
guest os does not ignore configuration even without this,
it is just allowed to change it.


2. is says could result but does not report whether that happened in the
field.


Given this causes a regression I'm inclined to just revert for now.
We can figure it out for the next release.


> 
> me wonders if there is a way make enforcement per device.

devices shouldn't normally care by the spec.


> > > For my own testing, I simply reverted commit 0cf8882fd0 in my copy of
> > > qemu. That solves my immediate problem, giving us time to find a solution
> > > that is acceptable for everyone. After all, it doesn't look like anyone
> > > else has noticed the problem, so there is no real urgency.
> > > 
> > > Thanks,
> > > Guenter  
> > 
> > Well it's not like we have an army of testers, I think we should
> > treat each problem report seriously ...
> > 


