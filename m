Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFF339F7FA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 15:40:17 +0200 (CEST)
Received: from localhost ([::1]:53032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqbxo-0005ag-GA
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 09:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lqbwV-0003zy-1p
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 09:38:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lqbwR-0007XI-9H
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 09:38:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623159530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R5INkCumvjSBA4Q/Wq2jCLHwioNGtsVbnsIx6dLek9g=;
 b=KrJZbHo/8Yz+AVqpiSI4NFogLa2bPllXIpHYgqyTwHwmg86RaAbD2zrHH7z0zQBmL5NIrE
 2Oz3hSSOnQCgO42OeQyCGpxX4Tj7+S0SAaU/f1foRNkyouBjlXzWU9duVnaytYnuhWi3RN
 j0t1K4EncP8sYRFWn/q4lPonyEYwMHw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-3AXi4ySJNKmdhq1xiOAJ_A-1; Tue, 08 Jun 2021 09:38:48 -0400
X-MC-Unique: 3AXi4ySJNKmdhq1xiOAJ_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC238800D62;
 Tue,  8 Jun 2021 13:38:46 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63B275C1BB;
 Tue,  8 Jun 2021 13:38:28 +0000 (UTC)
Date: Tue, 8 Jun 2021 15:38:28 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Xingang Wang <wangxingang5@huawei.com>
Subject: Re: [PATCH v4 0/8] IOMMU: Add support for IOMMU Bypass Feature
Message-ID: <20210608153828.05b400e6@redhat.com>
In-Reply-To: <f04e5527-d9d8-953e-a572-83b91bcd05c7@huawei.com>
References: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
 <20210605143238.2e52b08a@redhat.com>
 <f04e5527-d9d8-953e-a572-83b91bcd05c7@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: xieyingtai@huawei.com, peter.maydell@linaro.org, ehabkost@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, eric.auger@redhat.com, qemu-arm@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Jun 2021 20:24:35 +0800
Xingang Wang <wangxingang5@huawei.com> wrote:

> Hi Igor,
> 
> On 2021/6/5 20:32, Igor Mammedov wrote:
> > On Tue, 25 May 2021 03:49:57 +0000
> > Wang Xingang <wangxingang5@huawei.com> wrote:
> >   
> >> From: Xingang Wang <wangxingang5@huawei.com>
> >>
> >> These patches add support for configure bypass_iommu on/off for
> >> pci root bus, including primary bus and pxb root bus. At present,
> >> all root bus will go through iommu when iommu is configured,
> >> which is not flexible, because in many situations the need for using
> >> iommu and bypass iommu aften exists at the same time.  
> > 
> > 'many situations' doesn't describe why bypass is needed,
> > can you provide a use-cases here and what are security implications
> > when bypass is allowed.
> > (PS: the later probably should be documented somewhere in the docs/option description)
> >     
> 
> It is possible that some devices support the iommu and some devices do 
> not. When we need to pass through both kind of devices to a virtual
> machine, bypass iommu would help.
> 
> E.g I have a HiSilicon network and computing encryption device(SEC),
> which supports both iommu and noiommu mode. If I have to use a SEC in
> noiommu mode along with another device which need iommu, then it would
> need this bypass iommu feature.
> 
> Besides, bypass iommu would have less performance loss because there
> might be many trap in and out using a virtual iommu.
usually if one enables 'iommu', one wants the isolation it provides.
so the bypass option negates that. Why not just use machine with IOMMU
disabled globally in the first place?

> However there might be potential security risks without iommu,
> as devices might send malicious dma requests.
> It would be necessary to only bypass iommu for trusted devices.
that's what I was worried about, at least it should be documented
or a warning printed to discourage using the feature.

> 
> Thanks
> 
> Xingang
> 
> >> So this add option to enable/disable bypass_iommu for primary bus
> >> and pxb root bus. The bypass_iommu property is set to false default,
> >> meaning that devcies will go through iommu if no explicit configuration
> >> is added. When bypass_iommu is enabled for the root bus, devices
> >> attached to it will bypass iommu, otherwise devices will go through
> >> iommu.
> >>
> >> This feature can be used in this manner:
> >> arm: -machine virt,iommu=smmuv3,bypass_iommu=true
> >> x86: -machine q35,bypass_iommu=true
> >> pxb: -device pxb-pcie,bus_nr=0x10,id=pci.10,bus=pcie.0,bypass_iommu=true
> >>
> >> History:
> >>
> >> v3 -> v4:
> >> - simplify the logic in building the IORT idmap
> >>
> >> v2 -> v3:
> >> - rebase on top of v6.0.0-rc4
> >> - Took into account Eric's comments, replace with a bypass_iommu
> >>    proerty
> >> - When building the IORT idmap, cover the whole RID space
> >>
> >> v1 -> v2:
> >> - rebase on top of v6.0.0-rc0
> >> - Fix some issues
> >> - Took into account Eric's comments, and remove the PCI_BUS_IOMMU flag,
> >>    replace it with a property in PCIHostState.
> >> - Add support for x86 iommu option
> >>
> >> Xingang Wang (8):
> >>    hw/pci/pci_host: Allow bypass iommu for pci host
> >>    hw/pxb: Add a bypass iommu property
> >>    hw/arm/virt: Add a machine option to bypass iommu for primary bus
> >>    hw/i386: Add a pc machine option to bypass iommu for primary bus
> >>    hw/pci: Add pci_bus_range to get bus number range
> >>    hw/arm/virt-acpi-build: Add explicit IORT idmap for smmuv3 node
> >>    hw/i386/acpi-build: Add explicit scope in DMAR table
> >>    hw/i386/acpi-build: Add bypass_iommu check when building IVRS table
> >>
> >>   hw/arm/virt-acpi-build.c            | 135 ++++++++++++++++++++++++----
> >>   hw/arm/virt.c                       |  26 ++++++
> >>   hw/i386/acpi-build.c                |  70 ++++++++++++++-
> >>   hw/i386/pc.c                        |  18 ++++
> >>   hw/pci-bridge/pci_expander_bridge.c |   3 +
> >>   hw/pci-host/q35.c                   |   1 +
> >>   hw/pci/pci.c                        |  33 ++++++-
> >>   hw/pci/pci_host.c                   |   2 +
> >>   include/hw/arm/virt.h               |   1 +
> >>   include/hw/i386/pc.h                |   1 +
> >>   include/hw/pci/pci.h                |   2 +
> >>   include/hw/pci/pci_host.h           |   1 +
> >>   12 files changed, 270 insertions(+), 23 deletions(-)
> >>  
> > 
> > .
> >   
> 
> .
> 


