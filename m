Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDB94BBAC6
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 15:38:32 +0100 (CET)
Received: from localhost ([::1]:53246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL4Oz-00026l-LD
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 09:38:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nL4MB-0000iS-JL; Fri, 18 Feb 2022 09:35:35 -0500
Received: from mga11.intel.com ([192.55.52.93]:31959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nL4M9-0004Qi-8S; Fri, 18 Feb 2022 09:35:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645194933; x=1676730933;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BRf2T64punlDggqJB8r5XY8HmNOYR2rHGZFQhoC4VrM=;
 b=kgo0CN3l+kJ1+Y9FmNIDv9O/QeufHhpF8fMY1zxnU3wks5uv51/hGVJs
 TZpBU4a9ek8T7Ow1JGlV7WpZjHiX10sYWF+wTe/Qvc47unC4cwbHBgAGY
 zdJZmcA9i7UZLF8uwghRApFlxhvbbxXP/JE0TkpoeFsKBygJts5QoyAB8
 cv0QA4MV7aNrO52JA/0XEgXEpF/rVpTXX3VwTn3FzAe/O+4l/Obtvm3B+
 M1jZO8nFmSlPyhm8/kNV9XBrAgyQtWDugMn1MM399WSN2RTRxxOYR7lOO
 zTgSKcO1dA9EUWCgzj/J9oLXK3/lfOnhQvWTavbeFL8uJBtInMt2YPXu6 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="248730335"
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="248730335"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 06:35:29 -0800
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="546299009"
Received: from lmaniak-dev.igk.intel.com ([10.55.249.72])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 06:35:27 -0800
Date: Fri, 18 Feb 2022 15:33:43 +0100
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v5 00/15] hw/nvme: SR-IOV with Virtualization Enhancements
Message-ID: <20220218143343.GA1070598@lmaniak-dev.igk.intel.com>
References: <20220217174504.1051716-1-lukasz.maniak@linux.intel.com>
 <20220218032252-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220218032252-mutt-send-email-mst@kernel.org>
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 18, 2022 at 03:23:15AM -0500, Michael S. Tsirkin wrote:
> On Thu, Feb 17, 2022 at 06:44:49PM +0100, Lukasz Maniak wrote:
> > Changes since v4:
> > - Added hello world example for SR-IOV to the docs
> > - Moved AER initialization from nvme_init_ctrl to nvme_init_state
> > - Fixed division by zero issue in calculation of vqfrt and vifrt
> >   capabilities
> 
> 
> BTW you should copy all reviewers on the cover letter.
> 
Yep, will do next time. Sorry about that.
> 
> 
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
> >  docs/system/devices/nvme.rst |  82 +++++
> >  hw/nvme/ctrl.c               | 674 ++++++++++++++++++++++++++++++++---
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
> >  19 files changed, 1505 insertions(+), 81 deletions(-)
> >  create mode 100644 docs/pcie_sriov.txt
> >  create mode 100644 hw/pci/pcie_sriov.c
> >  create mode 100644 include/hw/pci/pcie_sriov.h
> > 
> > -- 
> > 2.25.1
> > 
> > 
> > 
> 

