Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2044E26BA
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 13:39:38 +0100 (CET)
Received: from localhost ([::1]:43736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWHJx-0003BS-5k
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 08:39:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nWHHg-0001fR-UI; Mon, 21 Mar 2022 08:37:16 -0400
Received: from mga03.intel.com ([134.134.136.65]:31691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nWHHe-0005td-TK; Mon, 21 Mar 2022 08:37:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647866234; x=1679402234;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fkfFb8YeTsygVBSyMhjqeDuvAeoj08UvQ+f4TT1y0xE=;
 b=gI015ds0PIy4oI6gcu5iFNddbc0g/Ovqf/6UVFabB0fC9vSnQ9i305GG
 XJSngb376y5HscuOfoJ1MHDFDG26nTnH6avvMzWfe9lr7rXxQqI/LVM/u
 cG/h2U3brfp4QBFqdwrnxHO1Wl+mwDMtbhMG/bmfR2TkcnvqnMkkF3WOA
 eQztbHRYbUzGfFOt+Z48djivi5OqLjLls2mGzA34iRPlOD63CditsmT86
 XXoULmQ6ns8lt+aoDPjLx9TwrDTa2Rl9QSWOOkpGnDjEqBF7f0gUASNQM
 aJ8YwjV4YQXWrErhfcmTW6GxOqNdysVaOWkHI5qNEx6qBoARHe3DDExSp w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="257487851"
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="257487851"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 05:37:12 -0700
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="559850543"
Received: from kagner-mobl1.ger.corp.intel.com ([10.252.35.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 05:37:07 -0700
Date: Mon, 21 Mar 2022 13:36:59 +0100
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v5 14/15] docs: Add documentation for SR-IOV and
 Virtualization Enhancements
Message-ID: <YjhxX9r6XLKCM1Fh@kagner-MOBL1.ger.corp.intel.com>
References: <20220217174504.1051716-1-lukasz.maniak@linux.intel.com>
 <20220217174504.1051716-15-lukasz.maniak@linux.intel.com>
 <Yh4QNqgQ+jl+sZCC@apples>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yh4QNqgQ+jl+sZCC@apples>
Received-SPF: none client-ip=134.134.136.65;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga03.intel.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: qemu-block@nongnu.org,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <k.jensen@samsung.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 01, 2022 at 01:23:18PM +0100, Klaus Jensen wrote:
> On Feb 17 18:45, Lukasz Maniak wrote:
> > Signed-off-by: Lukasz Maniak <lukasz.maniak@linux.intel.com>
> 
> Please add a short commit description as well. Otherwise,

Klaus,

Sorry I forgot to add the description in v6 aka v7, been really busy
recently.
I am going to add the description for v8.

Regards,
Lukasz
> 
> Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
> 
> > ---
> >  docs/system/devices/nvme.rst | 82 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 82 insertions(+)
> > 
> > diff --git a/docs/system/devices/nvme.rst b/docs/system/devices/nvme.rst
> > index b5acb2a9c19..aba253304e4 100644
> > --- a/docs/system/devices/nvme.rst
> > +++ b/docs/system/devices/nvme.rst
> > @@ -239,3 +239,85 @@ The virtual namespace device supports DIF- and DIX-based protection information
> >    to ``1`` to transfer protection information as the first eight bytes of
> >    metadata. Otherwise, the protection information is transferred as the last
> >    eight bytes.
> > +
> > +Virtualization Enhancements and SR-IOV (Experimental Support)
> > +-------------------------------------------------------------
> > +
> > +The ``nvme`` device supports Single Root I/O Virtualization and Sharing
> > +along with Virtualization Enhancements. The controller has to be linked to
> > +an NVM Subsystem device (``nvme-subsys``) for use with SR-IOV.
> > +
> > +A number of parameters are present (**please note, that they may be
> > +subject to change**):
> > +
> > +``sriov_max_vfs`` (default: ``0``)
> > +  Indicates the maximum number of PCIe virtual functions supported
> > +  by the controller. Specifying a non-zero value enables reporting of both
> > +  SR-IOV and ARI (Alternative Routing-ID Interpretation) capabilities
> > +  by the NVMe device. Virtual function controllers will not report SR-IOV.
> > +
> > +``sriov_vq_flexible``
> > +  Indicates the total number of flexible queue resources assignable to all
> > +  the secondary controllers. Implicitly sets the number of primary
> > +  controller's private resources to ``(max_ioqpairs - sriov_vq_flexible)``.
> > +
> > +``sriov_vi_flexible``
> > +  Indicates the total number of flexible interrupt resources assignable to
> > +  all the secondary controllers. Implicitly sets the number of primary
> > +  controller's private resources to ``(msix_qsize - sriov_vi_flexible)``.
> > +
> > +``sriov_max_vi_per_vf`` (default: ``0``)
> > +  Indicates the maximum number of virtual interrupt resources assignable
> > +  to a secondary controller. The default ``0`` resolves to
> > +  ``(sriov_vi_flexible / sriov_max_vfs)``
> > +
> > +``sriov_max_vq_per_vf`` (default: ``0``)
> > +  Indicates the maximum number of virtual queue resources assignable to
> > +  a secondary controller. The default ``0`` resolves to
> > +  ``(sriov_vq_flexible / sriov_max_vfs)``
> > +
> > +The simplest possible invocation enables the capability to set up one VF
> > +controller and assign an admin queue, an IO queue, and a MSI-X interrupt.
> > +
> > +.. code-block:: console
> > +
> > +   -device nvme-subsys,id=subsys0
> > +   -device nvme,serial=deadbeef,subsys=subsys0,sriov_max_vfs=1,
> > +    sriov_vq_flexible=2,sriov_vi_flexible=1
> > +
> > +The minimum steps required to configure a functional NVMe secondary
> > +controller are:
> > +
> > +  * unbind flexible resources from the primary controller
> > +
> > +.. code-block:: console
> > +
> > +   nvme virt-mgmt /dev/nvme0 -c 0 -r 1 -a 1 -n 0
> > +   nvme virt-mgmt /dev/nvme0 -c 0 -r 0 -a 1 -n 0
> > +
> > +  * perform a Function Level Reset on the primary controller to actually
> > +    release the resources
> > +
> > +.. code-block:: console
> > +
> > +   echo 1 > /sys/bus/pci/devices/0000:01:00.0/reset
> > +
> > +  * enable VF
> > +
> > +.. code-block:: console
> > +
> > +   echo 1 > /sys/bus/pci/devices/0000:01:00.0/sriov_numvfs
> > +
> > +  * assign the flexible resources to the VF and set it ONLINE
> > +
> > +.. code-block:: console
> > +
> > +   nvme virt-mgmt /dev/nvme0 -c 1 -r 1 -a 8 -n 1
> > +   nvme virt-mgmt /dev/nvme0 -c 1 -r 0 -a 8 -n 2
> > +   nvme virt-mgmt /dev/nvme0 -c 1 -r 0 -a 9 -n 0
> > +
> > +  * bind the NVMe driver to the VF
> > +
> > +.. code-block:: console
> > +
> > +   echo 0000:01:00.1 > /sys/bus/pci/drivers/nvme/bind
> > \ No newline at end of file
> > -- 
> > 2.25.1
> > 
> 
> -- 
> One of us - No more doubt, silence or taboo about mental illness.



