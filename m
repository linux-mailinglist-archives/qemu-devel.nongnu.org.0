Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5E84B8C36
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 16:16:33 +0100 (CET)
Received: from localhost ([::1]:46510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKM2f-0002L6-RJ
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 10:16:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nKM0I-0000X7-P2; Wed, 16 Feb 2022 10:14:02 -0500
Received: from mga12.intel.com ([192.55.52.136]:3721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nKM0F-0004Ye-8X; Wed, 16 Feb 2022 10:14:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645024439; x=1676560439;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=T5ayPhR9/R2FcrQC6QgIzKG99a+yXBBdipUG57wm9FQ=;
 b=gawwC3228OdE3qNkuxx3KdA7INbq9vMg0zkdBuv3Ybi0NtAnikVUNt27
 v/BKCy4/myoKSlJlnQeBDFBcayZRo0rIZvTOpJNefF5VB0KLkniZC79zv
 6NR2BsQdxnNYh0eA8mAWJujEGiJTE4ZfifWqgG1Ro4J+5xvFfviVBNRRs
 6w8gu6QDz3rinmT37nMlq+UuzEn9l8OEZvlxOnZXU2JvIMC09NRUiI8Z1
 ui8Ilsh0F+1zY7wOl86dwZUOmhDKGWNO4IAF88Vf/gGE3M6wcHn/O/LBC
 iI5I/HDon8vJjSJo+VhlbQoRtNKnL01HRZSjbsL1ZyUEi3LzuC0rq8L9p Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="230584793"
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="230584793"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 07:13:30 -0800
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="544979304"
Received: from lmaniak-dev.igk.intel.com ([10.55.249.72])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 07:13:28 -0800
Date: Wed, 16 Feb 2022 16:11:48 +0100
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v4 00/15] hw/nvme: SR-IOV with Virtualization Enhancements
Message-ID: <20220216151148.GA947201@lmaniak-dev.igk.intel.com>
References: <20220126171120.2939152-1-lukasz.maniak@linux.intel.com>
 <YgYPkql6nbIZCxLT@apples>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YgYPkql6nbIZCxLT@apples>
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001,
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
Cc: Keith Busch <kbusch@kernel.org>,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 11, 2022 at 08:26:10AM +0100, Klaus Jensen wrote:
> On Jan 26 18:11, Lukasz Maniak wrote:
> > Changes since v3:
> > - Addressed comments to review on pcie: Add support for Single Root I/O
> >   Virtualization (SR/IOV)
> > - Fixed issues reported by checkpatch.pl
> > 
> > Knut Omang (2):
> >   pcie: Add support for Single Root I/O Virtualization (SR/IOV)
> >   pcie: Add some SR/IOV API documentation in docs/pcie_sriov.txt
> > 
> > Lukasz Maniak (4):
> >   hw/nvme: Add support for SR-IOV
> >   hw/nvme: Add support for Primary Controller Capabilities
> >   hw/nvme: Add support for Secondary Controller List
> >   docs: Add documentation for SR-IOV and Virtualization Enhancements
> > 
> > Łukasz Gieryk (9):
> >   pcie: Add a helper to the SR/IOV API
> >   pcie: Add 1.2 version token for the Power Management Capability
> >   hw/nvme: Implement the Function Level Reset
> >   hw/nvme: Make max_ioqpairs and msix_qsize configurable in runtime
> >   hw/nvme: Remove reg_size variable and update BAR0 size calculation
> >   hw/nvme: Calculate BAR attributes in a function
> >   hw/nvme: Initialize capability structures for primary/secondary
> >     controllers
> >   hw/nvme: Add support for the Virtualization Management command
> >   hw/nvme: Update the initalization place for the AER queue
> > 
> >  docs/pcie_sriov.txt          | 115 ++++++
> >  docs/system/devices/nvme.rst |  36 ++
> >  hw/nvme/ctrl.c               | 675 ++++++++++++++++++++++++++++++++---
> >  hw/nvme/ns.c                 |   2 +-
> >  hw/nvme/nvme.h               |  55 ++-
> >  hw/nvme/subsys.c             |  75 +++-
> >  hw/nvme/trace-events         |   6 +
> >  hw/pci/meson.build           |   1 +
> >  hw/pci/pci.c                 | 100 ++++--
> >  hw/pci/pcie.c                |   5 +
> >  hw/pci/pcie_sriov.c          | 302 ++++++++++++++++
> >  hw/pci/trace-events          |   5 +
> >  include/block/nvme.h         |  65 ++++
> >  include/hw/pci/pci.h         |  12 +-
> >  include/hw/pci/pci_ids.h     |   1 +
> >  include/hw/pci/pci_regs.h    |   1 +
> >  include/hw/pci/pcie.h        |   6 +
> >  include/hw/pci/pcie_sriov.h  |  77 ++++
> >  include/qemu/typedefs.h      |   2 +
> >  19 files changed, 1460 insertions(+), 81 deletions(-)
> >  create mode 100644 docs/pcie_sriov.txt
> >  create mode 100644 hw/pci/pcie_sriov.c
> >  create mode 100644 include/hw/pci/pcie_sriov.h
> > 
> > -- 
> > 2.25.1
> > 
> > 
> 
> Hi Lukasz,
> 
> Back in v3 you changed this:
> 
> - Secondary controller cannot be set online unless the corresponding VF
>   is enabled (sriov_numvfs set to at least the secondary controller's VF
>   number)
> 
> I'm having issues getting this to work now. As I understand it, this now
> requires that sriov_numvfs is set prior to onlining the devices, i.e.:
> 
>   echo 1 > /sys/bus/pci/devices/0000\:01\:00.0/sriov_numvfs
> 
> However, this causes the kernel to reject it:
> 
>   nvme nvme1: Device not ready; aborting initialisation, CSTS=0x2
>   nvme nvme1: Removing after probe failure status: -19
> 
> Is this the expected behavior? Must I manually bind the device again to
> the nvme driver? Prior to v3 this worked just fine since the VF was
> onlined at this point.
> 
> It would be useful if you added a small "onlining for dummies" section
> to the docs ;)

Hi Klaus,

Yes, this is the expected behavior and yeah it is less user friendly
than in v3.

Yet, after re-examining the NVMe specification, we concluded that this
is how it should work.

This is now the correct minimum flow needed to run a VF-based functional
NVMe controller:
# Unbind all flexible resources from the primary controller
nvme virt-mgmt /dev/nvme0 -c 0 -r 1 -a 1 -n 0
nvme virt-mgmt /dev/nvme0 -c 0 -r 0 -a 1 -n 0

# Reset the primary controller to actually release the resources
echo 1 > /sys/bus/pci/devices/0000:01:00.0/reset

# Enable VF
echo 1 > /sys/bus/pci/devices/0000:01:00.0/sriov_numvfs

# Assign flexible resources to VF and set it ONLINE
nvme virt-mgmt /dev/nvme0 -c 1 -r 1 -a 8 -n 21
nvme virt-mgmt /dev/nvme0 -c 1 -r 0 -a 8 -n 21
nvme virt-mgmt /dev/nvme0 -c 1 -r 0 -a 9 -n 0

# Bind NVMe driver for VF controller
echo 0000:01:00.1 > /sys/bus/pci/drivers/nvme/bind

I will update the docs.

Thanks,
Lukasz

