Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2674D2F56
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 13:47:14 +0100 (CET)
Received: from localhost ([::1]:36028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRvij-0000vp-Hx
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 07:47:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1nRveM-0007sl-R4; Wed, 09 Mar 2022 07:42:42 -0500
Received: from mga02.intel.com ([134.134.136.20]:54387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1nRveJ-0004os-St; Wed, 09 Mar 2022 07:42:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646829759; x=1678365759;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6d757HxWda8grfDxytVutvcLtsv+iq/+ApI2e4FgZIQ=;
 b=SzWezIfrrwIVtHb8628VOwqiGuvnD/YXiuGJElWrnzG3huvzRWLqMAeM
 sPTpQRNQoQzClN9fXCrivvDz3YxFRk1SZWBjdDgQCV0tJ+iIFYjObzMn5
 /K7B3JhZkI8g1t+1ynCDCvSnkmqEATgqR3wqMV105Y9AA/WhiTaHBLkQ8
 ZWI8w366vEbt0ZilAL24VGRa72RYE7jNC3MO7qY/AvEDeQifn/xaUjKUT
 jG8gRSa/ikOsQMtquXayA6/Nr3zg9+F07bRCq0hp38uMWA096xv3r3kGD
 PGL0ymPRux7H3tRdvTmfgpQAt861O283ayStknQ+3HnNQ8k0GEQEBbl4C Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="242408900"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="242408900"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 04:41:36 -0800
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="554101629"
Received: from lgieryk-mobl1.ger.corp.intel.com (HELO lgieryk-VirtualBox)
 ([10.252.32.116])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 04:41:33 -0800
Date: Wed, 9 Mar 2022 13:41:27 +0100
From: =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v5 13/15] hw/nvme: Add support for the Virtualization
 Management command
Message-ID: <20220309124127.GA27213@lgieryk-VirtualBox>
References: <20220217174504.1051716-1-lukasz.maniak@linux.intel.com>
 <20220217174504.1051716-14-lukasz.maniak@linux.intel.com>
 <Yh4afDUJ9Yc0a74Z@apples>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yh4afDUJ9Yc0a74Z@apples>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=lukasz.gieryk@linux.intel.com; helo=mga02.intel.com
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
 qemu-block@nongnu.org, Lukasz Maniak <lukasz.maniak@linux.intel.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 01, 2022 at 02:07:08PM +0100, Klaus Jensen wrote:
> On Feb 17 18:45, Lukasz Maniak wrote:
> > From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
> > 
> > With the new command one can:
> >  - assign flexible resources (queues, interrupts) to primary and
> >    secondary controllers,
> >  - toggle the online/offline state of given controller.
> > 
> 
> QEMU segfaults (or asserts depending on the wind blowing) if the SR-IOV
> enabled device is hotplugged after being configured (i.e. follow the
> docs for a simple setup and then do a `device_del <nvme-device>` in the
> monitor. I suspect this is related to freeing the queues and something
> getting double-freed.
> 

I’ve finally found some time to look at the issue.

Long story short: the hot-plug mechanism deletes all VFs without the PF
knowing, then PF tries to reset and delete all the already non-existing
devices.

I have a solution for the problem, but there’s high a chance it’s not
the correct one. I’m still reading through the specs, as my knowledge in
the area of hot-plug/ACPI is quite limited.

Soon we will release the next patch set, with the fix included. I hope
the ACPI maintainers will chime in then. Till that happens, this is the
summary of my findings:

1) The current SR-IOV implementation assumes it’s the PF that creates
   and deletes VFs.
2) It’s a design decision (the Nvme device at least) for the VFs to be
   of the same class as PF. Effectively, they share the dc->hotpluggable
   value.
3) When a VF is created, it’s added as a child node to PF’s PCI bus
   slot.
4) Monitor/device_del triggers the ACPI mechanism. The implementation is
   not aware of SR/IOV and ejects PF’s PCI slot, directly unrealizing all
   hot-pluggable (!acpi_pcihp_pc_no_hotplug) children nodes.
5) VFs are unrealized directly, and it doesn’t work well with (1).
   SR/IOV structures are not updated, so when it’s PF’s turn to be
   unrealized, it works on stale pointers to already-deleted VFs.

My proposed ‘fix’ is to make the PCI ACPI code aware of SR/IOV:


diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index f4d706e47d..090bdb8e74 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -196,8 +196,12 @@ static bool acpi_pcihp_pc_no_hotplug(AcpiPciHpState *s, PCIDevice *dev)
      * ACPI doesn't allow hotplug of bridge devices.  Don't allow
      * hot-unplug of bridge devices unless they were added by hotplug
      * (and so, not described by acpi).
+     *
+     * Don't allow hot-unplug of SR-IOV Virtual Functions, as they
+     * will be removed implicitly, when Physical Function is unplugged.
      */
-    return (pc->is_bridge && !dev->qdev.hotplugged) || !dc->hotpluggable;
+    return (pc->is_bridge && !dev->qdev.hotplugged) || !dc->hotpluggable ||
+           pci_is_vf(dev);
 }


