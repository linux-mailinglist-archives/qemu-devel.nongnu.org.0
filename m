Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 867DB1DB916
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 18:15:45 +0200 (CEST)
Received: from localhost ([::1]:42166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbRNg-0007RZ-Jr
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 12:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jbRLl-0005WN-MK
 for qemu-devel@nongnu.org; Wed, 20 May 2020 12:13:45 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58912
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jbRLj-0006TG-S0
 for qemu-devel@nongnu.org; Wed, 20 May 2020 12:13:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589991222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RrjPaUknEvSnuAKiWrSyye88/PWyXTNzQdy57Myk8EA=;
 b=AmkwF9FndJx1UXXAHmZbhlr4WE5QzW1xi8L8Qm7ZQmhQwnVwJFjuc/Piv81joLDIUhn/fO
 l47KmUr7+gLI8GoqIyB1yysxOZaAe5YkCsCn6PWOILD+FUF+wkWz9RM6lUsC4UeZkpeQ/i
 iDKGhRC003pVu32ChUvQON67rWYdjXk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-BlvIw8eOPnqTWhgTKm_0XA-1; Wed, 20 May 2020 12:13:40 -0400
X-MC-Unique: BlvIw8eOPnqTWhgTKm_0XA-1
Received: by mail-wr1-f71.google.com with SMTP id n9so1585170wru.20
 for <qemu-devel@nongnu.org>; Wed, 20 May 2020 09:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RrjPaUknEvSnuAKiWrSyye88/PWyXTNzQdy57Myk8EA=;
 b=GVcmzsHwHlWrZiNCDFKboDBpNvh8qxkn8mOsD1IDVHKZnKJ0EkR4DGY6T68qJ7euRJ
 5UWQbf2DhUNPFWtgzacrpUFSqrpBnIIy1aF73RJkA3xo13u3jTGkSHDbowqOYwr98mIs
 m1/CD6LTJUEhS9gCi5IASb4fGCiyF2LawH5WIPu1nb34DyckvQqYaZVSNQ6eeqFhXdfn
 fg1PivFaP37AE3yGfs2L4uLLFZXFeNJ0Gt0HwKCgrcYK6Gl+dDwqz7ZEJEr1g+s37I3l
 awYlIEJr5UNUk0AGYSIXxUeCdpAw7szAEPWER+UWe+X5MJvY/Ht3HxffeprksQo/HXXe
 oWJQ==
X-Gm-Message-State: AOAM531+khqPFrYOqI3E34aOEzgllyMo77SsvxmMm8Sr1EpIhELaOkR1
 dSnR0xHvuQZ3xS41fMkxN/DDbjIECoV+fXAlHbDJhymZnKZfRs1aEmBDVY4BVHKCY/bq8w8a23f
 NQaUfu3u4umZkG88=
X-Received: by 2002:a1c:e305:: with SMTP id a5mr5123970wmh.1.1589991219259;
 Wed, 20 May 2020 09:13:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx31YwVQ4N8Tj+4PscFEwFLKHPRxjKx4QxmKcYAzlmO6YbNEFK0Savyev6cNNi8fGe4UCz4PA==
X-Received: by 2002:a1c:e305:: with SMTP id a5mr5123956wmh.1.1589991218966;
 Wed, 20 May 2020 09:13:38 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 b2sm3618141wrm.30.2020.05.20.09.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 09:13:38 -0700 (PDT)
Date: Wed, 20 May 2020 12:13:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedow <imammedo@redhat.com>
Subject: Re: [PATCH V2] Add a new PIIX option to control PCI hot unplugging
 of devices on non-root buses
Message-ID: <20200520121043-mutt-send-email-mst@kernel.org>
References: <9941B800-BBEF-4DF8-BEE0-EC39D2A20D98@nutanix.com>
 <20200513214312.0dfa4752@redhat.com>
 <7FF83CE8-F25A-4458-80A7-EAA6296EF175@nutanix.com>
 <20200520114354.1982cb63@nas.mammed.net>
 <20200520054714-mutt-send-email-mst@kernel.org>
 <20200520115626.6a2a2355@nas.mammed.net>
 <20200520060645-mutt-send-email-mst@kernel.org>
 <20200520130547.7ac568b8@nas.mammed.net>
 <20200520072055-mutt-send-email-mst@kernel.org>
 <20200520142012.5394b2f6@nas.mammed.net>
MIME-Version: 1.0
In-Reply-To: <20200520142012.5394b2f6@nas.mammed.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 01:34:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Ani Sinha <ani.sinha@nutanix.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Julia Suvorova <jusual@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 20, 2020 at 02:20:12PM +0200, Igor Mammedow wrote:
> On Wed, 20 May 2020 07:23:21 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Wed, May 20, 2020 at 01:05:47PM +0200, Igor Mammedow wrote:
> > > On Wed, 20 May 2020 06:28:37 -0400
> > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > >   
> > > > On Wed, May 20, 2020 at 11:56:26AM +0200, Igor Mammedow wrote:  
> > > > > On Wed, 20 May 2020 05:47:53 -0400
> > > > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > >     
> > > > > > On Wed, May 20, 2020 at 11:43:54AM +0200, Igor Mammedow
> > > > > > wrote:    
> > > > > > > On Fri, 15 May 2020 12:13:53 +0000
> > > > > > > Ani Sinha <ani.sinha@nutanix.com> wrote:
> > > > > > >       
> > > > > > > > > On May 14, 2020, at 1:13 AM, Igor Mammedov
> > > > > > > > > <imammedo@redhat.com> wrote:       
> > > > > > > > >> 
> > > > > > > > >>         
> > > > > > > > >>> Will following hack work for you?
> > > > > > > > >>> possible permutations
> > > > > > > > >>> 1) ACPI hotplug everywhere
> > > > > > > > >>> -global PIIX4_PM.acpi-pci-hotplug=on -global
> > > > > > > > >>> PIIX4_PM.acpi-pci-hotplug-with-bridge-support=on
> > > > > > > > >>> -device pci-bridge,chassis_nr=1,shpc=doesnt_matter
> > > > > > > > >>> -device e1000,bus=pci.1,addr=01,id=netdev1 
> > > > > > > > >>> 
> > > > > > > > >>> 2) No hotplug at all
> > > > > > > > >>> -global PIIX4_PM.acpi-pci-hotplug=off -global
> > > > > > > > >>> PIIX4_PM.acpi-pci-hotplug-with-bridge-support=on
> > > > > > > > >>> -device pci-bridge,chassis_nr=1,shpc=off -device
> > > > > > > > >>> e1000,bus=pci.1,addr=01,id=netdev1
> > > > > > > > >>> 
> > > > > > > > >>> -global PIIX4_PM.acpi-pci-hotplug=off -global
> > > > > > > > >>> PIIX4_PM.acpi-pci-hotplug-with-bridge-support=off
> > > > > > > > >>> -device pci-bridge,chassis_nr=1,shpc=doesnt_matter
> > > > > > > > >>> -device e1000,bus=pci.1,addr=01,id=netdev1          
> > > > > > > > >> 
> > > > > > > > >> Given that my patch is not acceptable, I’d prefer the
> > > > > > > > >> following in the order of preference:
> > > > > > > > >> 
> > > > > > > > >> (a) Have an option to disable hot ejection of PCI-PCI
> > > > > > > > >> bridge so that Windows does not even show this HW in
> > > > > > > > >> the “safely remove HW” option. If we can do this then
> > > > > > > > >> from OS perspective the GUI options will be same as
> > > > > > > > >> what is available with PCIE/q35 - none of the devices
> > > > > > > > >> will be hot ejectable if the hot plug option is turned
> > > > > > > > >> off from the PCIE slots where devices are plugged
> > > > > > > > >> into. I looked at the code. It seems to manipulate
> > > > > > > > >> ACPI tables of the empty slots of the root bus where
> > > > > > > > >> no devices are attached (see comment "/* add hotplug
> > > > > > > > >> slots for non present devices */ “). For cold plugged
> > > > > > > > >> bridges, it recurses down to scan the slots of the
> > > > > > > > >> bridge. Is it possible to disable hot plug for the
> > > > > > > > >> slot to which the bridge is attached?        
> > > > > > > > > 
> > > > > > > > > I don't think it's possible to have per slot hotplug on
> > > > > > > > > conventional PCI hardware. it's per bridge property.
> > > > > > > > >     
> > > > > > > > 
> > > > > > > > We add the AMLs per empty slot though. When the pic
> > > > > > > > bridge is attached, we do nothing, just recurse into the
> > > > > > > > bridge slots. That is what I was asking, if it was
> > > > > > > > possible to just disable the AMLs or use some tricks to
> > > > > > > > say that this particular slot is not hotpluggable. I am
> > > > > > > > not sure why Windows is trying to eject the PCI bridge
> > > > > > > > and failing. Maybe something related to this comment?
> > > > > > > > 
> > > > > > > > 
> > > > > > > > /* When hotplug for bridges is enabled, bridges are
> > > > > > > >                               
> > > > > > > >          * described in ACPI separately (see
> > > > > > > > build_pci_bus_end). 
> > > > > > > >          * In this case they aren't themselves
> > > > > > > > hot-pluggable. 
> > > > > > > >          * Hotplugged bridges *are* hot-pluggable.
> > > > > > > > */      
> > > > > > > 
> > > > > > > thinking some more on this topic, it seems that with ACPI
> > > > > > > hotplug we already have implicit non-hotpluggble slot (slot
> > > > > > > with bridge) while the rest are staying hotpluggable.
> > > > > > > 
> > > > > > > So my question is: if it's acceptable to add
> > > > > > > 'PCIDevice::hotpluggable" property to all PCI devices so
> > > > > > > that user / libvirt could set it to false in case they do
> > > > > > > not want coldplugged device be considered as hotpluggable?
> > > > > > > (this way other devices could be treated the same way as
> > > > > > > bridges)
> > > > > > > 
> > > > > > > [...]      
> > > > > > 
> > > > > > 
> > > > > > I think Julia already posted a patch adding this to downstream
> > > > > > pcie bridges. Adding this to pci slots sounds like a
> > > > > > reasonable thing.    
> > > > > Question was more about external interface, were we do not have
> > > > > ports as separate devices with conventional PCI. The only knob
> > > > > we have is a a PCI device, where we have a property to turn
> > > > > on/off hotplug. ex: -device e1000,hotpluggable=off
> > > > > and if libvirt would be able to use it    
> > > > 
> > > > It would make sense but is it practical to add the capability is
> > > > added in a generic way to all bridges and hosts?
> > > > If not how do users probe for presence of the capability?  
> > > it probably won't work with native SHPC hotplug (which looks to be
> > > incomplete in QEMU anyway), but it should work with ACPI and per
> > > port PCIE hotplugs.
> > > In case of SHPC, we probably should be able to cleanly error out
> > > with 'unsupported' reason if  "hotpluggable" conflicts with bridge
> > > policy.  
> > 
> > "Try it and see if it works" is somewhat problematic from management
> > POV since there's a never ending stream of new things they would have
> > to try. If this approach is taken, we'd have to try to loop in some
> > people from libvirt and see what's their take.
> to clarify, we are talking here about bridges to conventional
> PCI with native SHPC hotplug semantics wrt mgmt and
> potential pcidevice.hotpluggable property.
> (the later should work fine in ACPI and PCIE hoptlug cases).
> 
> currently by default pci bridges have property shpc=off, so mgmt
> should know that deals with PCI bridge and has to enable SHPC
> on bridge explicitly,

Wait a second does that actually affect hotplug with ACPI too?

> in which case it could probably be taught that
> using conflicting hotpluggable for device attached to bridge and shpc
> values is wrong thing.
> If that's not it, then I'm not sure what kind of discovery you are
> talking about.




-- 
MST


