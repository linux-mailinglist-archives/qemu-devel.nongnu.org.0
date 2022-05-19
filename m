Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2917252D260
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 14:23:49 +0200 (CEST)
Received: from localhost ([::1]:55924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrfC0-0004HS-9o
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 08:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nrf3H-0008O4-SH; Thu, 19 May 2022 08:14:52 -0400
Received: from mga14.intel.com ([192.55.52.115]:8763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nrf3G-0001Ql-04; Thu, 19 May 2022 08:14:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652962486; x=1684498486;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5jkNoKW+g5NqPa2RqdSoClc/EH5ZdRJoFq4ON35Wqzg=;
 b=jCDqly+S7beG/PGS2EXQFrc4wfet0vCCs9V6oVP6plQdtMPfQZJ0rJW4
 ZW55V5hro4ARy5kMAkJjUklS3z49HYu13cSUdb3NrcwiXBYJATRaODib1
 7B05lisqJdvwpL9bf8jBsHc99u+gLqfl9WEA1Wf3hiG2Ql6UNSFo8TszL
 3wZjCl66zBZADNyLjmFq6SdY5ke612xzEvXuYzmgOx6I+zxsF6uffcfFB
 EQDUHPGP5MWDVI91+K3IEQhgly5CK9Vslj11zZxSRtvvhoiTC4P0bggdR
 +7CCSXyraEy9+7s5dKEe+GwTzeK/ZHUGnqL0omivwvlhOQMOqUUZrle/L g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="272302993"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="272302993"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 05:14:40 -0700
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="546060556"
Received: from kpiekosz-mobl.ger.corp.intel.com ([10.213.24.244])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 05:14:32 -0700
Date: Thu, 19 May 2022 14:14:28 +0200
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: Klaus Jensen <its@irrelevant.dk>, lukasz.gieryk@linux.intel.com
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, ani@anisinha.ca,
 armbru@redhat.com, f4bug@amsat.org, fam@euphon.net,
 hreitz@redhat.com, imammedo@redhat.com, kbusch@kernel.org,
 k.jensen@samsung.com, kwolf@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, stefanha@redhat.com, xypron.glpk@gmx.de
Subject: Re: [PATCH v8 00/12] hw/nvme: SR-IOV with Virtualization Enhancements
Message-ID: <YoY0pMW7dH/+5nWW@kpiekosz-mobl.ger.corp.intel.com>
References: <20220509141620.3868733-1-lukasz.maniak@linux.intel.com>
 <YoJs//DV4ZTW9tDv@pbrzezix-mobl.ger.corp.intel.com>
 <YoOBWMmnW2Lc5a+/@apples>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YoOBWMmnW2Lc5a+/@apples>
Received-SPF: none client-ip=192.55.52.115;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga14.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 17, 2022 at 01:04:56PM +0200, Klaus Jensen wrote:
> On May 16 17:25, Lukasz Maniak wrote:
> > On Mon, May 09, 2022 at 04:16:08PM +0200, Lukasz Maniak wrote:
> > > Changes since v7:
> > > - Fixed description of hw/acpi: Make the PCI hot-plug aware of SR-IOV
> > > - Added description to docs: Add documentation for SR-IOV and
> > >   Virtualization Enhancements
> > > - Added Reviewed-by and Acked-by tags
> > > - Rebased on master
> > > 
> > > Lukasz Maniak (4):
> > >   hw/nvme: Add support for SR-IOV
> > >   hw/nvme: Add support for Primary Controller Capabilities
> > >   hw/nvme: Add support for Secondary Controller List
> > >   docs: Add documentation for SR-IOV and Virtualization Enhancements
> > > 
> > > Łukasz Gieryk (8):
> > >   hw/nvme: Implement the Function Level Reset
> > >   hw/nvme: Make max_ioqpairs and msix_qsize configurable in runtime
> > >   hw/nvme: Remove reg_size variable and update BAR0 size calculation
> > >   hw/nvme: Calculate BAR attributes in a function
> > >   hw/nvme: Initialize capability structures for primary/secondary
> > >     controllers
> > >   hw/nvme: Add support for the Virtualization Management command
> > >   hw/nvme: Update the initalization place for the AER queue
> > >   hw/acpi: Make the PCI hot-plug aware of SR-IOV
> > > 
> > >  docs/system/devices/nvme.rst |  82 +++++
> > >  hw/acpi/pcihp.c              |   6 +-
> > >  hw/nvme/ctrl.c               | 673 ++++++++++++++++++++++++++++++++---
> > >  hw/nvme/ns.c                 |   2 +-
> > >  hw/nvme/nvme.h               |  55 ++-
> > >  hw/nvme/subsys.c             |  75 +++-
> > >  hw/nvme/trace-events         |   6 +
> > >  include/block/nvme.h         |  65 ++++
> > >  include/hw/pci/pci_ids.h     |   1 +
> > >  9 files changed, 909 insertions(+), 56 deletions(-)
> > > 
> > > -- 
> > > 2.25.1
> > > 
> > 
> > Hi Klaus,
> > 
> > Should we consider this series ready to merge?
> > 
> 
> Hi Lukasz and Lukasz :)
> 
> Yes, I'm queing this up.
> 
> I found a problem when used with SPDK introduced by the "hw/nvme: Add
> support for the Virtualization Management command" patch. However, it's
> not really a problem in your patch, its related to the general handling
> of CSTS and CC in nvme_write_bar(). I'll follow up with a patch on top
> of this series and when reviewed, I'll apply this series and that patch
> to nvme-next together.
> 

Thank you, will do a review.

> Thanks for following through on this major feature! :)

We are very pleased to contribute to such an important and robust
project :)

Lukasz

> 
> 
> Klaus



