Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AA782EFD
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Aug 2019 11:48:05 +0200 (CEST)
Received: from localhost ([::1]:59916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1huw4a-0002sy-P4
	for lists+qemu-devel@lfdr.de; Tue, 06 Aug 2019 05:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36657)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1huw46-0002NO-Sr
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 05:47:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1huw45-00028t-Pt
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 05:47:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37550)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1huw43-000284-Bf; Tue, 06 Aug 2019 05:47:31 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AD28EE8CDA;
 Tue,  6 Aug 2019 09:47:29 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D43DB60920;
 Tue,  6 Aug 2019 09:47:24 +0000 (UTC)
Date: Tue, 6 Aug 2019 11:47:23 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190806114723.04637d1b@redhat.com>
In-Reply-To: <CAFEAcA-2LPngO8nXbzZBNTN6c60xG11ogUyqVM1N8Ct-bECqNQ@mail.gmail.com>
References: <20190726104519.23812-1-shameerali.kolothum.thodi@huawei.com>
 <20190726104519.23812-4-shameerali.kolothum.thodi@huawei.com>
 <20190730172524.6cf566ed@Igors-MacBook-Pro>
 <5FC3163CFD30C246ABAA99954A238FA83F33D896@lhreml524-mbs.china.huawei.com>
 <20190805153045.60db7bf5@redhat.com>
 <CAFEAcA-+z4t75VwfWG1ezJm=4zfdWH6nz1Oe75Zs953+vKMvdQ@mail.gmail.com>
 <20190805174652.61e9852a@redhat.com>
 <CAFEAcA-2LPngO8nXbzZBNTN6c60xG11ogUyqVM1N8Ct-bECqNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 06 Aug 2019 09:47:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH-for-4.2 v8 3/9] hw/acpi: Add ACPI Generic
 Event Device Support
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
Cc: "sameo@linux.intel.com" <sameo@linux.intel.com>,
 "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Linuxarm <linuxarm@huawei.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "xuwei \(O\)" <xuwei5@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>,
 "lersek@redhat.com" <lersek@redhat.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 5 Aug 2019 16:54:06 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Mon, 5 Aug 2019 at 16:47, Igor Mammedov <imammedo@redhat.com> wrote:
> > On Mon, 5 Aug 2019 14:42:38 +0100
> > Peter Maydell <peter.maydell@linaro.org> wrote:  
> > > This is definitely a bad idea -- devices should not add their
> > > own memory regions to the system memory MR. They should
> > > expose their MRs (by being a sysbus-device) and let the board
> > > code do the wiring up of the MRs into the right memory space
> > > at the right address.  
> >
> > it's not the only place in GED that is trying to add to system address
> > space, optionally if called acpi_memory_hotplug_init() will do the same,
> > then later we could add cpu hotplug memory region over there.
> >
> > Perhaps we could use bus-less device plug code path,
> > in that case memory_region_init_io()/qdev_init_gpio_out_named()
> > should be moved to ged_initfn() and mapping part into specialized helper
> > (similar to pc_dimm_plug() ) that's called by board (from virt_machine_device_plug_cb)
> > callback during completing device realize stage, it would be something like:
> >
> > virt.c:
> >    virt_machine_device_plug_cb()
> >       if dev == GED_TYPE
> >         machine_ged_plug_helper(system_memory)
> >
> > generic_event_device.c:
> >    machine_ged_plug_helper(as, irq) // similar to sysbus_mmio_map() but ged specialized
> >       connect_irq()
> >       memory_region_add_subregion(as, ged->ged_base, &ged->io)
> >       if ged->memory-hotplug-support
> >           memory_region_add_subregion(as, ged->memhp_base , &ged->memhp_state.memhp_io)  
> 
> I don't really understand why we want to do this complicated
> thing, rather than just doing the normal thing for devices
> that live at particular addresses, ie make them sysbus devices
> and have the board map their memory regions in the right place.

hotplug path is basically the same as sysbus the only difference is
that it uses machine's (pre_)plug handler to wire up devices and more
flexible than sysbus.
 
> > in this case addresses could be normally hard-codded in board code if device is not optional
> > (as in patch 6/9: create_acpi_ged() )
> > or potentially they could come from CLI as -device parameters
> > (/me thinking about building blocks that allow to create machine from config)  
> 
> I don't think we want to do this. The user should not have to
> know anything about addresses or have to specify them on the
> command line. (This is why you can't create sysbus devices
> with -device except for some odd special cases to do with passthrough
> of hardware.)
> 
> > sysbus device might be fine as shortcut if we are thinking about
> > only creating device during machine_init (although I have a reservations towards
> > sysbus interface (ex: caller of sysbus_mmio_map() has no clue when mapping N-th
> > region at some address)).  
> 
> Not sure entirely what you have in mind here? (though yes, the
> sysbus device API has its awkward corners, some of which are
> just down to how old it is.)
since it's a fixed device I don't mind using sysbus either,
lets do it this way.

> thanks
> -- PMM


