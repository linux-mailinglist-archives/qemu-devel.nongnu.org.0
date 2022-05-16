Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1175288DF
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:30:41 +0200 (CEST)
Received: from localhost ([::1]:38296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcgC-0000wk-UL
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nqccB-0003hI-MK; Mon, 16 May 2022 11:26:31 -0400
Received: from mga05.intel.com ([192.55.52.43]:43066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nqcc9-0006BY-HY; Mon, 16 May 2022 11:26:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652714789; x=1684250789;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5LmfFQbK5AmriOtbblYySUuukJa5rYjOXtSOzU8xV1s=;
 b=VxLJqCtP5XTXP7vAZkpNMiqxEiUiAZ3DX5hFsOXCVfV4qBIkd2s7AyS4
 ifE32QPDccwx/ClYMWm3gA0qgn3UR/PULLu57xgYxc9zIn7VNkWzqJ8rJ
 kLbfjo/Bkrd6OsitX2VaaBPQi9BX9l6gZvBlwXKMoWN2kqzub7FbAC7K2
 AINLbrZjkELFU4GyTjGGPj7ozwR8sGIokh/b1sgDkp5udKxsE7ohnkirB
 V2r6DmLGimLXaz7C0qwYfkGq5tXON/BTSQIanp+iZRKIfevBUPkYk9bR+
 vT1RS73mF2phu0Ss5CG8hZ3CGcSa/it+cKMZVhn0y0iWBzxTXCSoQoxat A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="357277135"
X-IronPort-AV: E=Sophos;i="5.91,230,1647327600"; d="scan'208";a="357277135"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 08:26:01 -0700
X-IronPort-AV: E=Sophos;i="5.91,230,1647327600"; d="scan'208";a="713417582"
Received: from pbrzezix-mobl.ger.corp.intel.com ([10.213.20.224])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 08:25:57 -0700
Date: Mon, 16 May 2022 17:25:51 +0200
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, ani@anisinha.ca, armbru@redhat.com,
 f4bug@amsat.org, fam@euphon.net, hreitz@redhat.com,
 imammedo@redhat.com, its@irrelevant.dk, kbusch@kernel.org,
 k.jensen@samsung.com, kwolf@redhat.com,
 lukasz.gieryk@linux.intel.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, stefanha@redhat.com, xypron.glpk@gmx.de
Subject: Re: [PATCH v8 00/12] hw/nvme: SR-IOV with Virtualization Enhancements
Message-ID: <YoJs//DV4ZTW9tDv@pbrzezix-mobl.ger.corp.intel.com>
References: <20220509141620.3868733-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220509141620.3868733-1-lukasz.maniak@linux.intel.com>
Received-SPF: none client-ip=192.55.52.43;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga05.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
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

On Mon, May 09, 2022 at 04:16:08PM +0200, Lukasz Maniak wrote:
> Changes since v7:
> - Fixed description of hw/acpi: Make the PCI hot-plug aware of SR-IOV
> - Added description to docs: Add documentation for SR-IOV and
>   Virtualization Enhancements
> - Added Reviewed-by and Acked-by tags
> - Rebased on master
> 
> Lukasz Maniak (4):
>   hw/nvme: Add support for SR-IOV
>   hw/nvme: Add support for Primary Controller Capabilities
>   hw/nvme: Add support for Secondary Controller List
>   docs: Add documentation for SR-IOV and Virtualization Enhancements
> 
> Łukasz Gieryk (8):
>   hw/nvme: Implement the Function Level Reset
>   hw/nvme: Make max_ioqpairs and msix_qsize configurable in runtime
>   hw/nvme: Remove reg_size variable and update BAR0 size calculation
>   hw/nvme: Calculate BAR attributes in a function
>   hw/nvme: Initialize capability structures for primary/secondary
>     controllers
>   hw/nvme: Add support for the Virtualization Management command
>   hw/nvme: Update the initalization place for the AER queue
>   hw/acpi: Make the PCI hot-plug aware of SR-IOV
> 
>  docs/system/devices/nvme.rst |  82 +++++
>  hw/acpi/pcihp.c              |   6 +-
>  hw/nvme/ctrl.c               | 673 ++++++++++++++++++++++++++++++++---
>  hw/nvme/ns.c                 |   2 +-
>  hw/nvme/nvme.h               |  55 ++-
>  hw/nvme/subsys.c             |  75 +++-
>  hw/nvme/trace-events         |   6 +
>  include/block/nvme.h         |  65 ++++
>  include/hw/pci/pci_ids.h     |   1 +
>  9 files changed, 909 insertions(+), 56 deletions(-)
> 
> -- 
> 2.25.1
> 

Hi Klaus,

Should we consider this series ready to merge?

Thanks,
Lukasz

