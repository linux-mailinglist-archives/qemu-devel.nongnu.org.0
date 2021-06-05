Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A880539C82B
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 14:34:41 +0200 (CEST)
Received: from localhost ([::1]:37504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpVVf-0004WL-V2
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 08:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lpVU2-0003BK-Qw
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 08:32:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lpVTy-0006lB-Ku
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 08:32:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622896374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t7RhKwuiQCmztjvYtfuTqLMQ5n48THL/aL9f+dwUDl0=;
 b=F70NWTiAPulggJBLDYKuLqxdMGMwAXvNa1aoOGTK0Hue0d7vSMR+cXE3jBawE2E9saWfyo
 nrvYrydlbaF8LoRBZ82ydkgJG/PrmKqmD61Sd1kXRbH19gQsgC/VuBmBgzAZqqf4oAgzoY
 8l5Je4mKrLZKxKR/4wA8wmNyx2/moBo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-iBPaOqfcOEyVz9B-xiFRlw-1; Sat, 05 Jun 2021 08:32:50 -0400
X-MC-Unique: iBPaOqfcOEyVz9B-xiFRlw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A334D803625;
 Sat,  5 Jun 2021 12:32:49 +0000 (UTC)
Received: from localhost (unknown [10.40.208.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE51A19C79;
 Sat,  5 Jun 2021 12:32:39 +0000 (UTC)
Date: Sat, 5 Jun 2021 14:32:38 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Wang Xingang <wangxingang5@huawei.com>
Subject: Re: [PATCH v4 0/8] IOMMU: Add support for IOMMU Bypass Feature
Message-ID: <20210605143238.2e52b08a@redhat.com>
In-Reply-To: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
References: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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

On Tue, 25 May 2021 03:49:57 +0000
Wang Xingang <wangxingang5@huawei.com> wrote:

> From: Xingang Wang <wangxingang5@huawei.com>
> 
> These patches add support for configure bypass_iommu on/off for
> pci root bus, including primary bus and pxb root bus. At present,
> all root bus will go through iommu when iommu is configured,
> which is not flexible, because in many situations the need for using
> iommu and bypass iommu aften exists at the same time.

'many situations' doesn't describe why bypass is needed,
can you provide a use-cases here and what are security implications
when bypass is allowed.
(PS: the later probably should be documented somewhere in the docs/option description)
 
> So this add option to enable/disable bypass_iommu for primary bus
> and pxb root bus. The bypass_iommu property is set to false default,
> meaning that devcies will go through iommu if no explicit configuration
> is added. When bypass_iommu is enabled for the root bus, devices
> attached to it will bypass iommu, otherwise devices will go through
> iommu.
> 
> This feature can be used in this manner:
> arm: -machine virt,iommu=smmuv3,bypass_iommu=true
> x86: -machine q35,bypass_iommu=true
> pxb: -device pxb-pcie,bus_nr=0x10,id=pci.10,bus=pcie.0,bypass_iommu=true 
> 
> History:
> 
> v3 -> v4:
> - simplify the logic in building the IORT idmap
> 
> v2 -> v3:
> - rebase on top of v6.0.0-rc4
> - Took into account Eric's comments, replace with a bypass_iommu
>   proerty 
> - When building the IORT idmap, cover the whole RID space
> 
> v1 -> v2:
> - rebase on top of v6.0.0-rc0
> - Fix some issues
> - Took into account Eric's comments, and remove the PCI_BUS_IOMMU flag,
>   replace it with a property in PCIHostState.
> - Add support for x86 iommu option
> 
> Xingang Wang (8):
>   hw/pci/pci_host: Allow bypass iommu for pci host
>   hw/pxb: Add a bypass iommu property
>   hw/arm/virt: Add a machine option to bypass iommu for primary bus
>   hw/i386: Add a pc machine option to bypass iommu for primary bus
>   hw/pci: Add pci_bus_range to get bus number range
>   hw/arm/virt-acpi-build: Add explicit IORT idmap for smmuv3 node
>   hw/i386/acpi-build: Add explicit scope in DMAR table
>   hw/i386/acpi-build: Add bypass_iommu check when building IVRS table
> 
>  hw/arm/virt-acpi-build.c            | 135 ++++++++++++++++++++++++----
>  hw/arm/virt.c                       |  26 ++++++
>  hw/i386/acpi-build.c                |  70 ++++++++++++++-
>  hw/i386/pc.c                        |  18 ++++
>  hw/pci-bridge/pci_expander_bridge.c |   3 +
>  hw/pci-host/q35.c                   |   1 +
>  hw/pci/pci.c                        |  33 ++++++-
>  hw/pci/pci_host.c                   |   2 +
>  include/hw/arm/virt.h               |   1 +
>  include/hw/i386/pc.h                |   1 +
>  include/hw/pci/pci.h                |   2 +
>  include/hw/pci/pci_host.h           |   1 +
>  12 files changed, 270 insertions(+), 23 deletions(-)
> 


