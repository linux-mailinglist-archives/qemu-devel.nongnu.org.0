Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6B34D6170
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 13:21:59 +0100 (CET)
Received: from localhost ([::1]:39002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSeHO-0007KS-Du
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 07:21:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nSeFz-00056j-Cl; Fri, 11 Mar 2022 07:20:31 -0500
Received: from mga09.intel.com ([134.134.136.24]:25054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nSeFw-0004tX-SZ; Fri, 11 Mar 2022 07:20:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647001228; x=1678537228;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iUj40Q9a7QB8HDwfP9L6YrKHQaWbDXP/rqe5d5GyUkw=;
 b=mNMJ5R/HBy8BgsuI0Nci1NHhQvHLbw+dHxybucXfSaf81McEgUGHyqgD
 AjWld2Crwzt9sQHWERCxrb/XarQYa4NDYQ7L+V01OwokiHfOATLcZour8
 bFBm+xsDdP5U0cg0LWa7CuwlkBLzJbnWwg/IYnfrmAPXkufuKbM4jB1fS
 MN0MbVnk5N830bYKsrp/vZtRdNNUClzpFtM5BfNxekpbWvdvAD7uH/Vwp
 iJScHbA0hx6UmVIUkfwtzX0dvNmraNFB2qp4u7DAq1ZdRCSV/x2LOt+1u
 YiDbWuURh9RIXMiq3ks5oseVthnIyZag0cyTcLx/jKqgLNWe4+7tYIyQZ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="255296685"
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; d="scan'208";a="255296685"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 04:20:22 -0800
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; d="scan'208";a="689048670"
Received: from mtpaasto-mobl4.ger.corp.intel.com (HELO
 dandoron-mobl4.ger.corp.intel.com) ([10.251.219.210])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 04:20:18 -0800
Date: Fri, 11 Mar 2022 13:20:13 +0100
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
Subject: Re: [PATCH v5 13/15] hw/nvme: Add support for the Virtualization
 Management command
Message-ID: <Yis+fd6i/ipUTbDw@dandoron-mobl4.ger.corp.intel.com>
References: <20220217174504.1051716-1-lukasz.maniak@linux.intel.com>
 <20220217174504.1051716-14-lukasz.maniak@linux.intel.com>
 <Yh4afDUJ9Yc0a74Z@apples>
 <20220309124127.GA27213@lgieryk-VirtualBox>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220309124127.GA27213@lgieryk-VirtualBox>
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga09.intel.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Keith Busch <kbusch@kernel.org>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 09, 2022 at 01:41:27PM +0100, Łukasz Gieryk wrote:
> On Tue, Mar 01, 2022 at 02:07:08PM +0100, Klaus Jensen wrote:
> > On Feb 17 18:45, Lukasz Maniak wrote:
> > > From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
> > > 
> > > With the new command one can:
> > >  - assign flexible resources (queues, interrupts) to primary and
> > >    secondary controllers,
> > >  - toggle the online/offline state of given controller.
> > > 
> > 
> > QEMU segfaults (or asserts depending on the wind blowing) if the SR-IOV
> > enabled device is hotplugged after being configured (i.e. follow the
> > docs for a simple setup and then do a `device_del <nvme-device>` in the
> > monitor. I suspect this is related to freeing the queues and something
> > getting double-freed.
> > 
> 
> I’ve finally found some time to look at the issue.
> 
> Long story short: the hot-plug mechanism deletes all VFs without the PF
> knowing, then PF tries to reset and delete all the already non-existing
> devices.
> 
> I have a solution for the problem, but there’s high a chance it’s not
> the correct one. I’m still reading through the specs, as my knowledge in
> the area of hot-plug/ACPI is quite limited.
> 
> Soon we will release the next patch set, with the fix included. I hope
> the ACPI maintainers will chime in then. Till that happens, this is the
> summary of my findings:
> 
> 1) The current SR-IOV implementation assumes it’s the PF that creates
>    and deletes VFs.
> 2) It’s a design decision (the Nvme device at least) for the VFs to be
>    of the same class as PF. Effectively, they share the dc->hotpluggable
>    value.
> 3) When a VF is created, it’s added as a child node to PF’s PCI bus
>    slot.
> 4) Monitor/device_del triggers the ACPI mechanism. The implementation is
>    not aware of SR/IOV and ejects PF’s PCI slot, directly unrealizing all
>    hot-pluggable (!acpi_pcihp_pc_no_hotplug) children nodes.
> 5) VFs are unrealized directly, and it doesn’t work well with (1).
>    SR/IOV structures are not updated, so when it’s PF’s turn to be
>    unrealized, it works on stale pointers to already-deleted VFs.
> 
> My proposed ‘fix’ is to make the PCI ACPI code aware of SR/IOV:
> 

CC'ing ACPI/SMBIOS maintainers/reviewers on the proposed fix.

> 
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index f4d706e47d..090bdb8e74 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -196,8 +196,12 @@ static bool acpi_pcihp_pc_no_hotplug(AcpiPciHpState *s, PCIDevice *dev)
>       * ACPI doesn't allow hotplug of bridge devices.  Don't allow
>       * hot-unplug of bridge devices unless they were added by hotplug
>       * (and so, not described by acpi).
> +     *
> +     * Don't allow hot-unplug of SR-IOV Virtual Functions, as they
> +     * will be removed implicitly, when Physical Function is unplugged.
>       */
> -    return (pc->is_bridge && !dev->qdev.hotplugged) || !dc->hotpluggable;
> +    return (pc->is_bridge && !dev->qdev.hotplugged) || !dc->hotpluggable ||
> +           pci_is_vf(dev);
>  }
> 

