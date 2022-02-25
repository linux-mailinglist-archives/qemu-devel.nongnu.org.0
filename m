Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC1E4C484B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 16:05:59 +0100 (CET)
Received: from localhost ([::1]:55266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNcAP-00046d-H3
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 10:05:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNbeI-0008QP-N9
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 09:32:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNbeE-0000fJ-Dx
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 09:32:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645799558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZL4vF0T9Iq0vAS1OKl+DkOJ7mdgHs7wgk8gclMbAyKQ=;
 b=Yyr37aGl/aSl6q8WDrK/pxz7QU9p52bTZOWlNwX93CuB+WEtJwk1VdZUqyXT7YLmHbZ9yk
 3gEzyPx6Vc5uuFpmmqfPVuDD45u3tglwShdQDyNMY3z/izs6VUVkfTKf2kPO2Aaot5ie95
 x+dckfuhHo/i4TsA5wOP1aGtcYSoNlQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-3n4DLQfsPheJNQhReT4dGg-1; Fri, 25 Feb 2022 09:32:34 -0500
X-MC-Unique: 3n4DLQfsPheJNQhReT4dGg-1
Received: by mail-ed1-f69.google.com with SMTP id
 y10-20020a056402358a00b00410deddea4cso2393391edc.16
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 06:32:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZL4vF0T9Iq0vAS1OKl+DkOJ7mdgHs7wgk8gclMbAyKQ=;
 b=WQpWA8Opt5hcmOK0/eX5CxcpnIYhsh0g9PjOXjhuuOaGQdgH574tEHsJcs+yBkO28a
 CmWV3bIRPz0WWNVVIZ6glmpWb3CLAGrp9b7pREU/1twWlgTA9cHXOYxq4NNV+5/kim+0
 SMMmzFDrai1fznZ6PJbRw+f9dHR31W/Dx/9Ud5B9iBGAyldq4PYfQnbDGHFRYABAh4Zh
 8TeXSvMduJgK/wNY3hA2Q/OdM1uBqA7XTo2DFcS8t2vRtCVV5X+KfrKt2ewEPX9AlwIR
 Ptq3nD1xZfydNqzyE3E98RQJRGl5lXYgzjlYpYUztxd2+dwyhRa1SGJq30+BJb8Wio8n
 0yUg==
X-Gm-Message-State: AOAM5329Kv5x/htYpNWmF+jepgx3ENxDcZrTakRtlhQYuoaqpZzsFbys
 Xat8qoOI7LXFwbCWVE01apOJaAVwTgjl0KEqV15aN1NTj2RS0DKYnlCg8mB0yUonQvs9GU8QIMu
 fZLBfApKzzyMpIcU=
X-Received: by 2002:a50:d496:0:b0:413:2cf1:efb6 with SMTP id
 s22-20020a50d496000000b004132cf1efb6mr7367870edi.150.1645799552749; 
 Fri, 25 Feb 2022 06:32:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxziqQuDfc+YTJBIcMn4mOqIC+3dtuGhebw7C0JmLn1a/o7BQXvafm9KKfH5diyyiwykx6WOg==
X-Received: by 2002:a50:d496:0:b0:413:2cf1:efb6 with SMTP id
 s22-20020a50d496000000b004132cf1efb6mr7367838edi.150.1645799552278; 
 Fri, 25 Feb 2022 06:32:32 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 g22-20020a170906395600b006cec40b9cf0sm1069611eje.92.2022.02.25.06.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 06:32:31 -0800 (PST)
Date: Fri, 25 Feb 2022 15:32:30 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 0/4] Fix broken PCIe device after migration
Message-ID: <20220225153230.726432bd@redhat.com>
In-Reply-To: <20220225141823.5ee12954@redhat.com>
References: <20220224174411.3296848-1-imammedo@redhat.com>
 <20220225045327-mutt-send-email-mst@kernel.org>
 <20220225141823.5ee12954@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Feb 2022 14:18:23 +0100
Igor Mammedov <imammedo@redhat.com> wrote:

> On Fri, 25 Feb 2022 04:58:46 -0500
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Thu, Feb 24, 2022 at 12:44:07PM -0500, Igor Mammedov wrote:  
> > > Currently ACPI PCI hotplug is enabled by default for Q35 machine
> > > type and overrides native PCIe hotplug. It works as expected when
> > > a PCIe device is hotplugged into slot, however the device becomes
> > > in-operational after migration. Which is caused by BARs being
> > > disabled on target due to powered off status of the slot.
> > > 
> > > Proposed fix disables power control on PCIe slot when ACPI pcihp
> > > takes over hotplug control and makes PCIe slot check if power
> > > control is enabled before trying to change slot's power. Which
> > > leaves slot always powered on and that makes PCI core keep BARs
> > > enabled.    
> > 
> > 
> > I thought some more about this. One of the reasons we
> > did not remove the hotplug capability is really so
> > it's easier to layer acpi on top of pcihp if we
> > want to do it down the road. And it would be quite annoying
> > if we had to add more hack to go back to having capability.
> > 
> > How about instead of patch 3 we call pci_set_power(dev, true) for all
> > devices where ACPI is managing hotplug immediately on plug?  This will
> > fix the bug avoiding headache with migration.  
> 
> true it would be more migration friendly (v6.2 still broken
> but that can't be helped), since we won't alter pci_config at all.
> Although it's still more hackish compared to disabling SLTCAP_PCP
> (though it seems guest OSes have no issues with SLTCAP_PCP being
> present but not really operational, at least for ~6months the thing
> was released (6.1-6.2-now)).
> 
> Let me play with this idea and see if it works and at what cost,
> though I still prefer cleaner SLTCAP_PCP disabling to make sure
> guest OS won't get wrong idea about power control being present
> when it's not actually not.

It's not going to work, plug time is not the problem here.
The hot-plugged device already ends up in power on state by default.

It's later on target pcie_cap_slot_post_load() updates its power
to 'off' due to sltctl & SLTCTL_PCC == 400

options if we go fixup route are
 1) from ich9_pm_post_load() scan PCI hierarchy and do fixup
    it's currently called after root port pcie_cap_slot_reset()
    in simple test case.
    It's sketchy and fragile to rely on particular load() order,
    if it's somehow changed in future it will (silently) break
    this dependency.
 2) do fixup from pcie_cap_slot_post_load(), means polluting
    generic PCI code with APCI hotplug idiosyncrasies.
    I thought you would be the first one to shoot that down.


I guess, I pretty much convinced myself that instead of fixing up
broken SLTCTL_PCC on the fly, it's more correct to fix the
root issue (non functional power control) on source by disabling
it completely.
Quick smoke testing with Linux(FC14) and Windows (2012r2)
shows it works as expected.

Alternative idea of chaining native pcie callbacks into
acpi ones, looks inferior as well since we would have pollute
native ones with ACPI logic to inhibit native hotplug event
while keeping its power mgmt part working.

 
> > Patch 2 does seem like a good idea.
> >   
> > > PS:
> > > it's still hacky approach as all ACPI PCI hotplug is, but it's
> > > the least intrusive one. Alternative, I've considered, could be
> > > chaining hotplug callbacks and making pcihp ones call overriden
> > > native callbacks while inhibiting hotplug event in native callbacks
> > > somehow. But that were a bit more intrusive and spills over to SHPC
> > > if implemented systematically, so I ditched that for now. It could
> > > be resurrected later on if current approach turns out to be
> > > insufficient.
> > > 
> > > RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=2053584
> > > CC: mst@redhat.com
> > > CC: kraxel@redhat.com
> > > 
> > > Igor Mammedov (4):
> > >   pci: expose TYPE_XIO3130_DOWNSTREAM name
> > >   pcie: update slot power status only is power control is enabled
> > >   acpi: pcihp: disable power control on PCIe slot
> > >   q35: compat: keep hotplugged PCIe device broken after migration for
> > >     6.2-older machine types
> > > 
> > >  include/hw/acpi/pcihp.h                    |  4 +++-
> > >  include/hw/pci-bridge/xio3130_downstream.h | 15 +++++++++++++++
> > >  hw/acpi/acpi-pci-hotplug-stub.c            |  3 ++-
> > >  hw/acpi/ich9.c                             | 21 ++++++++++++++++++++-
> > >  hw/acpi/pcihp.c                            | 16 +++++++++++++++-
> > >  hw/acpi/piix4.c                            |  3 ++-
> > >  hw/core/machine.c                          |  4 +++-
> > >  hw/pci-bridge/xio3130_downstream.c         |  3 ++-
> > >  hw/pci/pcie.c                              |  5 ++---
> > >  9 files changed, 64 insertions(+), 10 deletions(-)
> > >  create mode 100644 include/hw/pci-bridge/xio3130_downstream.h
> > > 
> > > -- 
> > > 2.31.1    
> >   
> 


