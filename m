Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6AB2F91D6
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 12:03:41 +0100 (CET)
Received: from localhost ([::1]:34688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l15qN-00021C-MR
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 06:03:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l15mQ-0001Ef-5z
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 05:59:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l15mL-0003JW-Kv
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 05:59:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610881166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5rgk9IFhvTGn7hJU0giIxcqa/SkATR+D22vIffmclqk=;
 b=M+FNbYU432reYibnCQgMWWOYC/wo7rdxfZnaw8LjaNxSrYBXOgLg9inF2h6wB+P9rkduHR
 YU08vuIZvCGY/67VfxPbZuo0O0XXPAi0fO4Dfx8PfB9YAhFoHGbuGDASboCTB8eM3VTOCo
 BwgTZOkciSdJUxdq1UeID2TJ9IvrEyM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-hMKA67hANU2EjXZMEO5QdA-1; Sun, 17 Jan 2021 05:59:22 -0500
X-MC-Unique: hMKA67hANU2EjXZMEO5QdA-1
Received: by mail-wr1-f72.google.com with SMTP id 88so6719833wrc.17
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 02:59:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5rgk9IFhvTGn7hJU0giIxcqa/SkATR+D22vIffmclqk=;
 b=clRT9bIHc5IhqW83AfAAkcauOcAmVa4Y73Chg3dI+YzcAcSe04vIZAEtGIUH4Icx6D
 5neKggoAAwxlXRLLzf6SXgcURZlWGvs9vpBkukIplGhFbRgWeaSnMl2hZkRD4eW35TU9
 f2wt6yAp/+YShVSiH82PGVuoBYpS4iMGWy/BqyIndwW/GjX8LOmAhElO0AsjVEBwSut8
 JKj5xEZkJnW95YiM64qzB/C45QyzkPA0an5Cax83nG0wiUiC8ZUd6DuOkD0kUETOx2/6
 eUk3h6PrSJqNrrALTZHBLxtFyF2eOGuM2e11YTHrO3ZumbB14QFnKDP9gbmXmk5i5Y3X
 JWXQ==
X-Gm-Message-State: AOAM533U5fidgA86ye6DqHA4dJISVfXgSXoP7KXlySNGQxExG+Dsp2c5
 /3msj0AEyXhXIQ29RzhpqW0DZVKl5SQ9rdmdMeMK+v38ETqVVzF1oYtuPAvgMXegOmeCYuPakWJ
 f44VRazV00LKET20=
X-Received: by 2002:a5d:4587:: with SMTP id p7mr20494370wrq.178.1610881161580; 
 Sun, 17 Jan 2021 02:59:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyFWSRMeuWEcN9oXftT2ttyCW2SZzet22qXhq1wJsTMjEfLwRxdoghaFrHEVuaq3HofTj3JQ==
X-Received: by 2002:a5d:4587:: with SMTP id p7mr20494359wrq.178.1610881161364; 
 Sun, 17 Jan 2021 02:59:21 -0800 (PST)
Received: from redhat.com (bzq-79-176-30-58.red.bezeqint.net. [79.176.30.58])
 by smtp.gmail.com with ESMTPSA id
 a130sm19461513wmf.4.2021.01.17.02.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 02:59:20 -0800 (PST)
Date: Sun, 17 Jan 2021 05:59:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [RFC 0/5] pc: support user provided NIC naming/indexing
Message-ID: <20210117053250-mutt-send-email-mst@kernel.org>
References: <20201222233934.451578-1-imammedo@redhat.com>
 <20210113064312-mutt-send-email-mst@kernel.org>
 <20210115025902.13e84f7c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210115025902.13e84f7c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: jusual@redhat.com, qemu-devel@nongnu.org, laine@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 02:59:02AM +0100, Igor Mammedov wrote:
> On Wed, 13 Jan 2021 07:09:56 -0500
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Tue, Dec 22, 2020 at 06:39:29PM -0500, Igor Mammedov wrote:
> > > 
> > > Series implements support for 'onboard' naming scheme for network
> > > interfaces (1), which is based on PCI firmware spec and lets user
> > > to explicitly specify index that will be used by guest to name
> > > network interface, ex:
> > >     -device e1000,acpi-index=33
> > > should make guest rename NIC name to 'eno33' where 'eno' is default
> > > prefix for this scheme.
> > > 
> > > Hope is that it will allow to simplify launching VMs from
> > > template disk images with different set VM configurations
> > > without need to reconfigure guest network intrfaces or
> > > risk of loosing network connectivity.  
> > 
> > Questions:
> > the spec says:
> > Assignment of specific device names to multi-function devices installed in expansion
> > slots, and/or PCI or PCI Express devices that are hot-added to expansion slots in operating system-
> > environment would be handled in operating system-specific manner, and is not specified via this
> > specification.
> > 
> > Accordingly, link below says:
> > " Names incorporating Firmware/BIOS provided index numbers for on-board devices (example: eno1)"
> > 
> > to what extend does guest assume the index is for on-board devices?
> > it seems things work for fedora but how confident are we that this
> > will keep working.
> 
> code itself is not limiting it to onboard devices in any way.
> (I can only speculate here, reason for calling it onboard is that
> on real hardware ACPI is mostly static tables and firmware provides
> an option to set index for only built-in NICs).
> Technically there is no reason to call in onboad though.

Well there's an smbios thing that I believe says onboard
in the spec. Come to think of it that one actually
applies to multifunction devices too.


> 
> I'd believe it should work with any distribution that uses
> recent enough systemd/udev (released starting from 2003).
> 
> > Further, code seems to only look at the slot level.
> > According to this, and according to the spec, this does not work with
> > multifunction devices, does it?
> 
> we probably should disable it for multifunction devices,
> any suggestions how to detect those in QEMU?

QEMU_PCI_CAP_MULTIFUNCTION_BITNR ?

Enforcing this will help but can we make this self-documenting somehow?

> 
> > The link you supplied lists another option:
> > "Names incorporating Firmware/BIOS provided PCI Express hotplug slot index numbers (example: ens1)"
> > these are under management control already ... 
> 
> with it interface name continues to depend on PCI topology (and theoretically
> limited to PCI expess). That's becomes harder to consume as complexity grows
> (i.e. mgmt needs to keep NIC in the same place for which guest image was configured for).
> acpi-index doesn't impose such limitation.
>
> In case of 1 NIC, it could be moved anywhere within PCI hierarchy and guest
> doesn't have to be reconfigured to account for new interface name
> (i.e without loosing network connectivity - that's the actual issue coming from
> upper layers that made me look into acpi-index approach).

Could you describe the issue in a bit more detail in the commit
log pls?

> In another words acpi index is easier to consume for users above libvirt
> and frees mgmt hands in a way it could distribute PCI devices.
> Even better would be if guest image could carry index as metadata
> 
> > Also if we ask users to supply the property on the slot then it seems
> > that the property can be baked into ACPI when it's created instead of
> > being loaded from host - we can avoid adding new registers, this seems
> > preferable.  Could someone from management side chime in on whether that
> > is sufficient?
> 
> I did consider it (it would be simpler, but not much), however unless we disable
> PCI hotplug for affected slots it won't work. (unplug device from such slot and
> plug another in that place will still return boot time index.

Well it's interesting that you mention it. Let's say you remove
a device then plug in a different index immediately ...
Guest gets a wrong name temporarily, right?
Should we worry about that?


> That's why I ended up with hotplug variant. 
> 
> I chose abusing existing PCI hotplug registers for it, 
> but we can use a new range if that's preferred. 

Would it work for multi-function devices though?
If yes that's a big advantage ...


> > More questions:
> > 
> > does all this affect windows guests at all?
> I don't know (spec shows examples that reminded
> me about NIC naming which Windows use(s|d)).
> But I won't bet on it.
> If I recall correctly, for e1000 NIC, it didn't made any
> difference in naming (pre-existing guest image).
> 
> > where does the "acpi index" terminology come from?
> > the pci firmware spec talks about "instance number", right?
> it comes from linux kernel (that's how it's named in sysfs)
> and systemd/udev uses it. So I tried to avoid making up another
> one.

OTOH that's guest specific ... and does not seem to imply
the limitations unless you look at the code ...

> 
> > > For more detailed description/examples see patches [3-4/5]
> > > 
> > > 1)
> > >  https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/ 
> > > 
> > > Git repo for testing:
> > >    https://github.com/imammedo/qemu/branches acpi-index-rfc
> > > 
> > > Igor Mammedov (5):
> > >   acpi: add aml_to_decimalstring() and aml_call6() helpers
> > >   tests: acpi: temporary whitelist DSDT changes
> > >   pci: introduce apci-index property for PCI device
> > >   pci: acpi: add _DSM method to PCI devices
> > >   tests: acpi: update expected data files
> > > 
> > >  include/hw/acpi/aml-build.h                 |   3 +
> > >  include/hw/acpi/pci.h                       |   1 +
> > >  include/hw/acpi/pcihp.h                     |   7 +-
> > >  include/hw/pci/pci.h                        |   1 +
> > >  tests/qtest/bios-tables-test-allowed-diff.h |  21 +++++
> > >  hw/acpi/aml-build.c                         |  28 +++++++
> > >  hw/acpi/pci.c                               |  84 ++++++++++++++++++++
> > >  hw/acpi/pcihp.c                             |  25 +++++-
> > >  hw/i386/acpi-build.c                        |  31 +++++++-
> > >  hw/pci/pci.c                                |   1 +
> > >  tests/data/acpi/pc/DSDT                     | Bin 5065 -> 6023 bytes
> > >  tests/data/acpi/pc/DSDT.acpihmat            | Bin 6390 -> 7348 bytes
> > >  tests/data/acpi/pc/DSDT.bridge              | Bin 6924 -> 8689 bytes
> > >  tests/data/acpi/pc/DSDT.cphp                | Bin 5529 -> 6487 bytes
> > >  tests/data/acpi/pc/DSDT.dimmpxm             | Bin 6719 -> 7677 bytes
> > >  tests/data/acpi/pc/DSDT.hpbridge            | Bin 5026 -> 5990 bytes
> > >  tests/data/acpi/pc/DSDT.hpbrroot            | Bin 3084 -> 3177 bytes
> > >  tests/data/acpi/pc/DSDT.ipmikcs             | Bin 5137 -> 6095 bytes
> > >  tests/data/acpi/pc/DSDT.memhp               | Bin 6424 -> 7382 bytes
> > >  tests/data/acpi/pc/DSDT.numamem             | Bin 5071 -> 6029 bytes
> > >  tests/data/acpi/pc/DSDT.roothp              | Bin 5261 -> 6324 bytes
> > >  tests/data/acpi/q35/DSDT                    | Bin 7801 -> 7863 bytes
> > >  tests/data/acpi/q35/DSDT.acpihmat           | Bin 9126 -> 9188 bytes
> > >  tests/data/acpi/q35/DSDT.bridge             | Bin 7819 -> 7911 bytes
> > >  tests/data/acpi/q35/DSDT.cphp               | Bin 8265 -> 8327 bytes
> > >  tests/data/acpi/q35/DSDT.dimmpxm            | Bin 9455 -> 9517 bytes
> > >  tests/data/acpi/q35/DSDT.ipmibt             | Bin 7876 -> 7938 bytes
> > >  tests/data/acpi/q35/DSDT.memhp              | Bin 9160 -> 9222 bytes
> > >  tests/data/acpi/q35/DSDT.mmio64             | Bin 8932 -> 9024 bytes
> > >  tests/data/acpi/q35/DSDT.numamem            | Bin 7807 -> 7869 bytes
> > >  tests/data/acpi/q35/DSDT.tis                | Bin 8407 -> 8468 bytes
> > >  31 files changed, 197 insertions(+), 5 deletions(-)
> > > 
> > > -- 
> > > 2.27.0  
> > 
> > 


