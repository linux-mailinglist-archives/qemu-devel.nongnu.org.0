Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2357171B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 13:30:31 +0200 (CEST)
Received: from localhost ([::1]:41343 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpt01-0004Up-Mu
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 07:30:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53894)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <sgarzare@redhat.com>) id 1hpszn-00043x-MV
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 07:30:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1hpszm-0007LF-1l
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 07:30:15 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37399)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1hpszl-0007Ka-R9
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 07:30:14 -0400
Received: by mail-wm1-f68.google.com with SMTP id f17so38157474wme.2
 for <qemu-devel@nongnu.org>; Tue, 23 Jul 2019 04:30:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gCtfwNo04sQG2dZV5EO3oZ6G7pD+3Gpm/tdtz/l3UCY=;
 b=eIf6gk07DZmC/5fbUmnINC+Vg9ba6/qTD/AN3dtWUMLtMrIXxIQfIkro68FhNLYD5o
 GBt6QWw/kPLHtWs41twy5iH9xdL8sIBzoGSY68elQP5ngLfRRuZ7C6AvV3E/0WPFhuaL
 KPOwJB8KHLunmbbiimKwwqoWJsDZNmnP0yJuEmtL05jsh1LnkvGwopL8bBShMyC+4D2F
 NQcGcQSzWCON6EJMZX+sZt0cy9lUZz4Ky54Cidqy/zIKXUb6vVzVhA2EwneHoeYI/Z6p
 hv+CsHLbdteUW56BbV4t5ZeN5WpINtalDSSYZ5dP+43JifVU9CK0fhbEZ4K4D5FT0xbl
 LjVQ==
X-Gm-Message-State: APjAAAWqaVBR0tJR6/ZlUcAodK3e9RZExKwd0G4tzZTrD9VSVm5zcKUK
 1PYB6CUEhmEsOmuPhr3HSyOk6w==
X-Google-Smtp-Source: APXvYqzQm2mMYAnNhSurDjeFSj8bsOCmPgbL8YuJmAOLlYUQT1kWUg2FsmPpGHaAKEBBuNHINAWVZg==
X-Received: by 2002:a7b:c776:: with SMTP id x22mr67867137wmk.55.1563881412351; 
 Tue, 23 Jul 2019 04:30:12 -0700 (PDT)
Received: from steredhat (host122-201-dynamic.13-79-r.retail.telecomitalia.it.
 [79.13.201.122])
 by smtp.gmail.com with ESMTPSA id q10sm42611546wrf.32.2019.07.23.04.30.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 04:30:11 -0700 (PDT)
Date: Tue, 23 Jul 2019 13:30:09 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20190723113009.mqvcliqkc2eqcbc4@steredhat>
References: <20190702121106.28374-1-slp@redhat.com>
 <20190703095825.GE11844@stefanha-x1.localdomain>
 <87d0i7tlkl.fsf@redhat.com>
 <20190719102915.GG18585@stefanha-x1.localdomain>
 <8736j2p22w.fsf@redhat.com>
 <CAJSP0QXTSwk4eJteC0wTB7LGoHY3=7t4G-eNfgREQ6k+GzV2_w@mail.gmail.com>
 <904248411098104fcf7db22382172057e50db76c.camel@intel.com>
 <87tvbdrvin.fsf@redhat.com>
 <CAJSP0QW1NrYwC6a61jj_vgJOJO7ofJOVUcz6Bf4z720OiN_0rw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJSP0QW1NrYwC6a61jj_vgJOJO7ofJOVUcz6Bf4z720OiN_0rw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-devel] [PATCH v3 0/4] Introduce the microvm machine type
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
Cc: "ehabkost@redhat.com" <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>, "Montes, Julio" <julio.montes@intel.com>,
 "maran.wilson@oracle.com" <maran.wilson@oracle.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 23, 2019 at 10:47:39AM +0100, Stefan Hajnoczi wrote:
> On Tue, Jul 23, 2019 at 9:43 AM Sergio Lopez <slp@redhat.com> wrote:
> > Montes, Julio <julio.montes@intel.com> writes:
> >
> > > On Fri, 2019-07-19 at 16:09 +0100, Stefan Hajnoczi wrote:
> > >> On Fri, Jul 19, 2019 at 2:48 PM Sergio Lopez <slp@redhat.com> wrote:
> > >> > Stefan Hajnoczi <stefanha@gmail.com> writes:
> > >> > > On Thu, Jul 18, 2019 at 05:21:46PM +0200, Sergio Lopez wrote:
> > >> > > > Stefan Hajnoczi <stefanha@gmail.com> writes:
> > >> > > >
> > >> > > > > On Tue, Jul 02, 2019 at 02:11:02PM +0200, Sergio Lopez wrote:
> > >> > > >  --------------
> > >> > > >  | Conclusion |
> > >> > > >  --------------
> > >> > > >
> > >> > > > The average boot time of microvm is a third of Q35's (115ms vs.
> > >> > > > 363ms),
> > >> > > > and is smaller on all sections (QEMU initialization, firmware
> > >> > > > overhead
> > >> > > > and kernel start-to-user).
> > >> > > >
> > >> > > > Microvm's memory tree is also visibly simpler, significantly
> > >> > > > reducing
> > >> > > > the exposed surface to the guest.
> > >> > > >
> > >> > > > While we can certainly work on making Q35 smaller, I definitely
> > >> > > > think
> > >> > > > it's better (and way safer!) having a specialized machine type
> > >> > > > for a
> > >> > > > specific use case, than a minimal Q35 whose behavior
> > >> > > > significantly
> > >> > > > diverges from a conventional Q35.
> > >> > >
> > >> > > Interesting, so not a 10x difference!  This might be amenable to
> > >> > > optimization.
> > >> > >
> > >> > > My concern with microvm is that it's so limited that few users
> > >> > > will be
> > >> > > able to benefit from the reduced attack surface and faster
> > >> > > startup time.
> > >> > > I think it's worth investigating slimming down Q35 further first.
> > >> > >
> > >> > > In terms of startup time the first step would be profiling Q35
> > >> > > kernel
> > >> > > startup to find out what's taking so long (firmware
> > >> > > initialization, PCI
> > >> > > probing, etc)?
> > >> >
> > >> > Some findings:
> > >> >
> > >> >  1. Exposing the TSC_DEADLINE CPU flag (i.e. using "-cpu host")
> > >> > saves a
> > >> >     whooping 120ms by avoiding the APIC timer calibration at
> > >> >     arch/x86/kernel/apic/apic.c:calibrate_APIC_clock
> > >> >
> > >> > Average boot time with "-cpu host"
> > >> >  qemu_init_end: 76.408950
> > >> >  linux_start_kernel: 116.166142 (+39.757192)
> > >> >  linux_start_user: 242.954347 (+126.788205)
> > >> >
> > >> > Average boot time with default "cpu"
> > >> >  qemu_init_end: 77.467852
> > >> >  linux_start_kernel: 116.688472 (+39.22062)
> > >> >  linux_start_user: 363.033365 (+246.344893)
> > >>
> > >> \o/
> > >>
> > >> >  2. The other 130ms are a direct result of PCI and ACPI presence
> > >> > (tested
> > >> >     with a kernel without support for those elements). I'll publish
> > >> > some
> > >> >     detailed numbers next week.
> > >>
> > >> Here are the Kata Containers kernel parameters:
> > >>
> > >> var kernelParams = []Param{
> > >>         {"tsc", "reliable"},
> > >>         {"no_timer_check", ""},
> > >>         {"rcupdate.rcu_expedited", "1"},
> > >>         {"i8042.direct", "1"},
> > >>         {"i8042.dumbkbd", "1"},
> > >>         {"i8042.nopnp", "1"},
> > >>         {"i8042.noaux", "1"},
> > >>         {"noreplace-smp", ""},
> > >>         {"reboot", "k"},
> > >>         {"console", "hvc0"},
> > >>         {"console", "hvc1"},
> > >>         {"iommu", "off"},
> > >>         {"cryptomgr.notests", ""},
> > >>         {"net.ifnames", "0"},
> > >>         {"pci", "lastbus=0"},
> > >> }
> > >>
> > >> pci lastbus=0 looks interesting and so do some of the others :).
> > >>
> > >
> > > yeah, pci=lastbus=0 is very helpful to reduce the boot time in q35,
> > > kernel won't scan the 255.. buses :)
> >
> > I can confirm that adding pci=lastbus=0 makes a significant
> > improvement. In fact, is the only option from Kata's kernel parameter
> > list that has an impact, probably because the kernel is already quite
> > minimalistic.
> >
> > Average boot time with "-cpu host" and "pci=lastbus=0"
> >  qemu_init_end: 73.711569
> >  linux_start_kernel: 113.414311 (+39.702742)
> >  linux_start_user: 190.949939 (+77.535628)
> >
> > That's still ~40% slower than microvm, and the breach quickly widens
> > when adding more PCI devices (each one adds 10-15ms), but it's certainly
> > an improvement over the original numbers.
> >
> > On the other hand, there isn't much we can do here from QEMU's
> > perspective, as this is basically Guest OS tuning.
> 
> fw_cfg could expose this information so guest kernels know when to
> stop enumerating the PCI bus.  This would make all PCI guests with new
> kernels boot ~50 ms faster, regardless of machine type.
> 
> The difference between microvm and tuned Q35 is 76 ms now.
> 
> microvm:
> qemu_init_end: 64.043264
> linux_start_kernel: 65.481782 (+1.438518)
> linux_start_user: 114.938353 (+49.456571)
> 
> Q35 with -cpu host and pci=lasbus=0:
> qemu_init_end: 73.711569
> linux_start_kernel: 113.414311 (+39.702742)
> linux_start_user: 190.949939 (+77.535628)
> 
> There is a ~39 ms difference before linux_start_kernel.  SeaBIOS is
> loading the PVH Option ROM.
> 
> Stefano: any recommendations for profiling or tuning SeaBIOS?

As I said on IRC, the SeaBIOS image in QEMU is the 1.12.1 and it doesn't
include this patch (available in the upstream SeaBIOS) that saves ~10ms:

    commit 75b42835134553c96f113e5014072c0caf99d092
    Author: Stefano Garzarella <sgarzare@redhat.com>
    Date:   Sun Dec 2 14:10:13 2018 +0100

        qemu: avoid debug prints if debugcon is not enabled

        In order to speed up the boot phase, we can check the QEMU
        debugcon device, and disable the writes if it is not recognized.

        This patch allow us to save around 10 msec (time measured
        between SeaBIOS entry point and "linuxboot" entry point)
        when CONFIG_DEBUG_LEVEL=1 and debugcon is not enabled.

        Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
        Signed-off-by: Kevin O'Connor <kevin@koconnor.net>

As you said, we should update SeaBIOS for the next QEMU release.

For profiling, I have some patches that I used to put trace points in
the SeaBIOS code. I'll put them in this repository ASAP:
    https://github.com/stefano-garzarella/qemu-boot-time

