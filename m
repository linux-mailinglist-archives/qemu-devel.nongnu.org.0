Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0D2542E0F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 12:43:04 +0200 (CEST)
Received: from localhost ([::1]:40460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyt9S-0001fN-QO
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 06:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nyt5I-0006yL-St; Wed, 08 Jun 2022 06:38:45 -0400
Received: from mga02.intel.com ([134.134.136.20]:47846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nyt5F-00017g-SL; Wed, 08 Jun 2022 06:38:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654684721; x=1686220721;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=lCT2Ah2nE+OkXr7s+/i/iOcLn8DdzAI0ewAFn7RasjU=;
 b=SkFcz03j131R3CLbRB95KkDgp4x46P+Sj9eXdoXkoct6v2OcqG+ZZlaT
 wI1xHh4IgrB8T0rH96enpEw6/1u+cGN5rHG3V5aHPxl0/dDAS/2njS/uf
 I/4yaiufBomZxeh3B6Pm5voF/veXDrb40O4ESwyoW21+lKscb2xtXI51M
 Mt3vf2bbaDJ6eTF3YRpA4Mxx5Ij/iZKvM79j6Xal7jjAvErqo3jf0BhpA
 VzF2FPghA7CZkTGRa7wjwIkijsnWcZE0m0s8DpcM6zBFBll6Q0oD8U+Od
 D/3HAL9ypQ/wTPlmxI+M7iZFroqUcPHcJUjDc7gAz0uKVZRwalUQkrS3Y w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="265656500"
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; d="scan'208";a="265656500"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 03:38:39 -0700
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; d="scan'208";a="907603240"
Received: from pmarchew-mobl.ger.corp.intel.com (HELO
 kzawora-mobl.ger.corp.intel.com) ([10.213.0.97])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 03:38:35 -0700
Date: Wed, 8 Jun 2022 12:38:32 +0200
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, ani@anisinha.ca,
 armbru@redhat.com, f4bug@amsat.org, fam@euphon.net,
 hreitz@redhat.com, imammedo@redhat.com, kbusch@kernel.org,
 k.jensen@samsung.com, kwolf@redhat.com,
 lukasz.gieryk@linux.intel.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, stefanha@redhat.com, xypron.glpk@gmx.de
Subject: Re: [PATCH v8 00/12] hw/nvme: SR-IOV with Virtualization Enhancements
Message-ID: <YqB8KOCJ8BLyg+tb@kzawora-mobl.ger.corp.intel.com>
References: <20220509141620.3868733-1-lukasz.maniak@linux.intel.com>
 <YqBdx+ahn8rpCkn6@apples>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YqBdx+ahn8rpCkn6@apples>
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Jun 08, 2022 at 10:28:55AM +0200, Klaus Jensen wrote:
> On May  9 16:16, Lukasz Maniak wrote:
> > Changes since v7:
> > - Fixed description of hw/acpi: Make the PCI hot-plug aware of SR-IOV
> > - Added description to docs: Add documentation for SR-IOV and
> >   Virtualization Enhancements
> > - Added Reviewed-by and Acked-by tags
> > - Rebased on master
> > 
> > Lukasz Maniak (4):
> >   hw/nvme: Add support for SR-IOV
> >   hw/nvme: Add support for Primary Controller Capabilities
> >   hw/nvme: Add support for Secondary Controller List
> >   docs: Add documentation for SR-IOV and Virtualization Enhancements
> > 
> > Łukasz Gieryk (8):
> >   hw/nvme: Implement the Function Level Reset
> >   hw/nvme: Make max_ioqpairs and msix_qsize configurable in runtime
> >   hw/nvme: Remove reg_size variable and update BAR0 size calculation
> >   hw/nvme: Calculate BAR attributes in a function
> >   hw/nvme: Initialize capability structures for primary/secondary
> >     controllers
> >   hw/nvme: Add support for the Virtualization Management command
> >   hw/nvme: Update the initalization place for the AER queue
> >   hw/acpi: Make the PCI hot-plug aware of SR-IOV
> > 
> >  docs/system/devices/nvme.rst |  82 +++++
> >  hw/acpi/pcihp.c              |   6 +-
> >  hw/nvme/ctrl.c               | 673 ++++++++++++++++++++++++++++++++---
> >  hw/nvme/ns.c                 |   2 +-
> >  hw/nvme/nvme.h               |  55 ++-
> >  hw/nvme/subsys.c             |  75 +++-
> >  hw/nvme/trace-events         |   6 +
> >  include/block/nvme.h         |  65 ++++
> >  include/hw/pci/pci_ids.h     |   1 +
> >  9 files changed, 909 insertions(+), 56 deletions(-)
> > 
> > -- 
> > 2.25.1
> > 
> 
> Thanks!
> 
> Applied to nvme-next along with v3 of the CSTS fix.

Yay! That's great news.

Thank you :)

