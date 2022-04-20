Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 192C3508BDD
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:13:39 +0200 (CEST)
Received: from localhost ([::1]:41182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhC1S-0006tW-78
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nhBf5-0000Vk-TU; Wed, 20 Apr 2022 10:50:32 -0400
Received: from mga07.intel.com ([134.134.136.100]:24631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nhBf3-0001YO-P3; Wed, 20 Apr 2022 10:50:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650466229; x=1682002229;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MG8mlEdrXUVo7+91XBo+9kWsPs4eH2Mfl8OirpInn6M=;
 b=f8Go5mt9RtURymhe2L8KNdbBwOGZ6E9Vkx1Ty8aNHPXrv8vGn1aPM8X1
 iW4Qu5S6jSdZsoh6uDXVVDHFkz87+TyOHFJfZdaVtfD/MIdg/P05VQbpR
 oNG9W4GxGzo3JGOmFXOB962eSva/D9cOJbXgBU0B3QJtp2BKAz1KFwSVj
 F8RTe9jeyvGvsqGf6MFYhojLkk+wlB4isfR/AuvxqLolYWwRymhK2Y754
 Yd/b5SXIRFWtRYUHAAGyWzw+q4jKQV2PNRKkaZTXD+qYroAPdXX6awZcU
 kQtwl5knrZ1RVi0sSbQauvTReZ4CUJrN4i8Sn33lGNksJ3qPodGnSqLpq A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="326941665"
X-IronPort-AV: E=Sophos;i="5.90,276,1643702400"; d="scan'208";a="326941665"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 07:50:27 -0700
X-IronPort-AV: E=Sophos;i="5.90,276,1643702400"; d="scan'208";a="529776019"
Received: from rshamets-mobl.ger.corp.intel.com ([10.213.19.118])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 07:50:20 -0700
Date: Wed, 20 Apr 2022 16:50:15 +0200
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: Klaus Jensen <its@irrelevant.dk>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v7 00/12] hw/nvme: SR-IOV with Virtualization Enhancements
Message-ID: <YmAdp3hEvlJxVhpf@rshamets-mobl.ger.corp.intel.com>
References: <20220318191819.1711831-1-lukasz.maniak@linux.intel.com>
 <20220420080053-mutt-send-email-mst@kernel.org>
 <Yl/4yp61szG1kqeZ@apples>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yl/4yp61szG1kqeZ@apples>
Received-SPF: none client-ip=134.134.136.100;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga07.intel.com
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
Cc: fam@euphon.net, kwolf@redhat.com, stefanha@redhat.com,
 qemu-block@nongnu.org, armbru@redhat.com, lukasz.gieryk@linux.intel.com,
 f4bug@amsat.org, qemu-devel@nongnu.org, kbusch@kernel.org, hreitz@redhat.com,
 xypron.glpk@gmx.de, k.jensen@samsung.com, ani@anisinha.ca, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 20, 2022 at 02:12:58PM +0200, Klaus Jensen wrote:
> On Apr 20 08:02, Michael S. Tsirkin wrote:
> > On Fri, Mar 18, 2022 at 08:18:07PM +0100, Lukasz Maniak wrote:
> > > Resubmitting v6 as v7 since Patchew got lost with my sophisticated CC of
> > > all maintainers just for the cover letter.
> > > 
> > > Changes since v5:
> > > - Fixed PCI hotplug issue related to deleting VF twice
> > > - Corrected error messages for SR-IOV parameters
> > > - Rebased on master, patches for PCI got pulled into the tree
> > > - Added Reviewed-by labels
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
> > 
> > the right people to review and merge this would be storage/nvme
> > maintainers.
> > I did take a quick look though.
> > 
> > Acked-by: Michael S. Tsirkin <mst@redhat.com>
> > 
> 
> Was waiting for a review on the acpi stuff. Thanks! :)

Thank you for checking and acking Michael :)

Klaus, looking through the list of patches, we are still missing reviews
for numbers 03, 08 and 09.
Do you want me to update to v8 or wait for a review first?

Thanks,
Lukasz

