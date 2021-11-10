Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6425844BDA0
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 10:11:35 +0100 (CET)
Received: from localhost ([::1]:36522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkjdl-0003Em-UK
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 04:11:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mkjbt-0002YF-Lv
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 04:09:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mkjbm-0000lZ-1Y
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 04:09:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636535368;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=cQoXwSNh0yibMdWQuFV8ETLras/CNUESzLKC4DAqW0Y=;
 b=IHAFy+9wYGzb8hKYG9W4hmrNm7TlaodpITU6gBRqkYK3cEf6cQP80AxLdyT/Ftd3LR3Utr
 2bU2JX1NrYtFgRKlL0CJwCbsYxCzQ5T0WUW0eJ1DsxEWuOQ2jf9yQ/pf3F8AV3Tp5Lk0zJ
 MGwlsSlq5HyQwZD8I6zvIiuxxJ9gaMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-_zVvApcFOxCm_PxZ7zypiw-1; Wed, 10 Nov 2021 04:09:27 -0500
X-MC-Unique: _zVvApcFOxCm_PxZ7zypiw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1086A100C618;
 Wed, 10 Nov 2021 09:09:26 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 387571981F;
 Wed, 10 Nov 2021 09:08:37 +0000 (UTC)
Date: Wed, 10 Nov 2021 09:08:34 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 1/5] hw/pci/pcie_port: Rename 'native-hotplug' to
 'native-hpc-bit'
Message-ID: <YYuMEtYOSCNO5whZ@redhat.com>
References: <20211110053014.489591-1-jusual@redhat.com>
 <20211110053014.489591-2-jusual@redhat.com>
 <20211110010239-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211110010239-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Marcel Apfelbaum <mapfelba@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 10, 2021 at 01:04:54AM -0500, Michael S. Tsirkin wrote:
> On Wed, Nov 10, 2021 at 06:30:10AM +0100, Julia Suvorova wrote:
> > Rename the option to better represent its function - toggle Hot-Plug
> > Capable bit in the PCIe Slot Capability.
> > 
> > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > ---
> >  include/hw/pci/pcie_port.h         | 2 +-
> >  hw/i386/pc_q35.c                   | 2 +-
> >  hw/pci-bridge/gen_pcie_root_port.c | 6 +++++-
> >  hw/pci/pcie.c                      | 2 +-
> >  hw/pci/pcie_port.c                 | 2 +-
> >  5 files changed, 9 insertions(+), 5 deletions(-)
> > 
> > diff --git a/include/hw/pci/pcie_port.h b/include/hw/pci/pcie_port.h
> > index e25b289ce8..0da6d66c95 100644
> > --- a/include/hw/pci/pcie_port.h
> > +++ b/include/hw/pci/pcie_port.h
> > @@ -60,7 +60,7 @@ struct PCIESlot {
> >      /* Indicates whether any type of hot-plug is allowed on the slot */
> >      bool        hotplug;
> >  
> > -    bool        native_hotplug;
> > +    bool        native_hpc_bit;
> >  
> >      QLIST_ENTRY(PCIESlot) next;
> >  };
> > diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> 
> 
> This is ok.
> 
> 
> > index 797e09500b..ded61f8ef7 100644
> > --- a/hw/i386/pc_q35.c
> > +++ b/hw/i386/pc_q35.c
> > @@ -243,7 +243,7 @@ static void pc_q35_init(MachineState *machine)
> >                                            NULL);
> >  
> >      if (acpi_pcihp) {
> > -        object_register_sugar_prop(TYPE_PCIE_SLOT, "native-hotplug",
> > +        object_register_sugar_prop(TYPE_PCIE_SLOT, "native-hpc-bit",
> >                                     "false", true);
> >      }
> >
> 
> 
> This part is problematic since we made the feature user-settable in 6.1.
> We can have two features if we really want to ...
> I don't think we have a way to mark properties deprecated, do we?

IMHO just leave the feature with its current name. It won't be the
first thing without a "perfect" name and the name doesn't have a
negative impact on mgmt apps. Changing the name will cause more
pain than it solves.

>   
> > diff --git a/hw/pci-bridge/gen_pcie_root_port.c b/hw/pci-bridge/gen_pcie_root_port.c
> > index 20099a8ae3..ed079d72b3 100644
> > --- a/hw/pci-bridge/gen_pcie_root_port.c
> > +++ b/hw/pci-bridge/gen_pcie_root_port.c
> > @@ -87,7 +87,11 @@ static void gen_rp_realize(DeviceState *dev, Error **errp)
> >          return;
> >      }
> >  
> > -    if (grp->res_reserve.io == -1 && s->hotplug && !s->native_hotplug) {
> > +    /*
> > +     * Make sure that IO is assigned in case the slot is hot-pluggable
> > +     * but it is not visible through the PCIe Slot Capabilities
> > +     */
> > +    if (grp->res_reserve.io == -1 && s->hotplug && !s->native_hpc_bit) {
> >          grp->res_reserve.io = GEN_PCIE_ROOT_DEFAULT_IO_RANGE;
> >      }
> >      int rc = pci_bridge_qemu_reserve_cap_init(d, 0,
> > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > index 914a9bf3d1..ebe002831e 100644
> > --- a/hw/pci/pcie.c
> > +++ b/hw/pci/pcie.c
> > @@ -535,7 +535,7 @@ void pcie_cap_slot_init(PCIDevice *dev, PCIESlot *s)
> >       * hot-plug is disabled on the slot.
> >       */
> >      if (s->hotplug &&
> > -        (s->native_hotplug || DEVICE(dev)->hotplugged)) {
> > +        (s->native_hpc_bit || DEVICE(dev)->hotplugged)) {
> >          pci_long_test_and_set_mask(dev->config + pos + PCI_EXP_SLTCAP,
> >                                     PCI_EXP_SLTCAP_HPS |
> >                                     PCI_EXP_SLTCAP_HPC);
> > diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
> > index da850e8dde..eae06d10e2 100644
> > --- a/hw/pci/pcie_port.c
> > +++ b/hw/pci/pcie_port.c
> > @@ -148,7 +148,7 @@ static Property pcie_slot_props[] = {
> >      DEFINE_PROP_UINT8("chassis", PCIESlot, chassis, 0),
> >      DEFINE_PROP_UINT16("slot", PCIESlot, slot, 0),
> >      DEFINE_PROP_BOOL("hotplug", PCIESlot, hotplug, true),
> > -    DEFINE_PROP_BOOL("native-hotplug", PCIESlot, native_hotplug, true),
> > +    DEFINE_PROP_BOOL("native-hpc-bit", PCIESlot, native_hpc_bit, true),
> >      DEFINE_PROP_END_OF_LIST()
> >  };
> >  
> > -- 
> > 2.31.1
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


