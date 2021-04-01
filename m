Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60260351433
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 13:07:10 +0200 (CEST)
Received: from localhost ([::1]:49276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRvAK-0003gT-WB
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 07:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lRv8z-00033w-9O
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:05:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lRv8t-0004WS-Sd
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:05:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617275135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fQuhy1STUJtQUWRgMPGGnVDT2Nv8xxMQoM6zTvXKCxs=;
 b=Uh3Z0QIgRt/jGF6a77ScwK5B9YVLu3qgZj35h2lZV6ZUaYvtb6Cd4bXGKf95jbC1qemUzw
 1aDVQF2iZ/yTPnXGtAuzsSQ+8TeKbGUY1i7wc1C0zraqF3/85uk2vbDi2GgdmSPjI7Hxrw
 xojBgS2TawjuqxX05uNH0ngCnYhDF3M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-Gw3b7SgMO-qm5A-Gj_LsKg-1; Thu, 01 Apr 2021 07:05:33 -0400
X-MC-Unique: Gw3b7SgMO-qm5A-Gj_LsKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64A521009E25;
 Thu,  1 Apr 2021 11:05:31 +0000 (UTC)
Received: from gondolin (ovpn-113-119.ams2.redhat.com [10.36.113.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 586336F13B;
 Thu,  1 Apr 2021 11:05:25 +0000 (UTC)
Date: Thu, 1 Apr 2021 13:05:22 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH v3 1/1] docs/devel: Add VFIO device migration documentation
Message-ID: <20210401130522.1e9c2871.cohuck@redhat.com>
In-Reply-To: <20210326131850.149337-1-targupta@nvidia.com>
References: <20210326131850.149337-1-targupta@nvidia.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kevin.tian@intel.com, cjia@nvidia.com, quintela@redhat.com,
 alex.williamson@redhat.com, qemu-devel@nongnu.org, yan.y.zhao@intel.com,
 lushenming@huawei.com, kwankhede@nvidia.com, dnigam@nvidia.com,
 berrange@redhat.com, philmd@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 26 Mar 2021 18:48:50 +0530
Tarun Gupta <targupta@nvidia.com> wrote:

> Document interfaces used for VFIO device migration. Added flow of state changes
> during live migration with VFIO device. Tested by building docs with the new
> vfio-migration.rst file.

I don't think you want to include the test state in the patch
description; that should go into a --- section that is stripped off by
git am.

> 
> v3:
> - Add introductory line about VM migration in general.
> - Remove occurcences of vfio_pin_pages() to describe pinning.
> - Incorporated comments from v2
> 
> v2:
> - Included the new vfio-migration.rst file in index.rst
> - Updated dirty page tracking section, also added details about
>   'pre-copy-dirty-page-tracking' opt-out option.
> - Incorporated comments around wording of doc.

Same for the changelog; this is interesting for review, but not for the
final git log.

> 
> Signed-off-by: Tarun Gupta <targupta@nvidia.com>
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>

This S-o-b chain does not look correct. Your address should be the last
one in the chain, signing off on all of the previous ones. (Maybe Kirti
also needs to be listed in a Co-developed-by: statement?)

> ---
>  MAINTAINERS                   |   1 +
>  docs/devel/index.rst          |   1 +
>  docs/devel/vfio-migration.rst | 143 ++++++++++++++++++++++++++++++++++
>  3 files changed, 145 insertions(+)
>  create mode 100644 docs/devel/vfio-migration.rst

> diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
> new file mode 100644
> index 0000000000..24cb55991a
> --- /dev/null
> +++ b/docs/devel/vfio-migration.rst

(...)

> +VFIO device hooks for iterative approach:

"VFIO implements the device hooks for the iterative approach as
follows:"

?

> +
> +* A ``save_setup`` function that sets up the migration region, sets _SAVING
> +  flag in the VFIO device state and informs the VFIO IOMMU module to start
> +  dirty page tracking.
> +
> +* A ``load_setup`` function that sets up the migration region on the
> +  destination and sets _RESUMING flag in the VFIO device state.
> +
> +* A ``save_live_pending`` function that reads pending_bytes from the vendor
> +  driver, which indicates the amount of data that the vendor driver has yet to
> +  save for the VFIO device.
> +
> +* A ``save_live_iterate`` function that reads the VFIO device's data from the
> +  vendor driver through the migration region during iterative phase.
> +
> +* A ``save_live_complete_precopy`` function that resets _RUNNING flag from the
> +  VFIO device state, saves the device config space, if any, and iteratively
> +  copies the remaining data for the VFIO device until the vendor driver
> +  indicates that no data remains (pending bytes is zero).
> +
> +* A ``load_state`` function that loads the config section and the data
> +  sections that are generated by the save functions above
> +
> +* ``cleanup`` functions for both save and load that perform any migration
> +  related cleanup, including unmapping the migration region
> +
> +A VM state change handler is registered to change the VFIO device state when
> +the VM state changes.

This sentence is not very informative. What about:

"The VFIO migration code uses a VM state change handler to change the
VFIO device state when the VM state changes from running to
not-running, and vice versa."

> +
> +Similarly, a migration state change notifier is registered to get a
> +notification on migration state change. These states are translated to the
> +corresponding VFIO device state and conveyed to the vendor driver.

"Similarly, a migration state change handler is used to transition the
VFIO device state back to _RUNNING in case a migration failed or was
canceled."


> +
> +System memory dirty pages tracking
> +----------------------------------
> +
> +A ``log_sync`` memory listener callback marks those system memory pages
> +as dirty which are used for DMA by the VFIO device. The dirty pages bitmap is
> +queried per container. All pages pinned by the vendor driver through external
> +APIs have to be marked as dirty during migration. When there are CPU writes,
> +CPU dirty page tracking can identify dirtied pages, but any page pinned by the
> +vendor driver can also be written by device. There is currently no device or

s/by/by the/

> +IOMMU support for dirty page tracking in hardware.
> +
> +By default, dirty pages are tracked when the device is in pre-copy as well as
> +stop-and-copy phase. So, a page pinned by vendor driver will be copied to

s/by/by the/
s/to/to the/

> +destination in both the phases. Copying dirty pages in pre-copy phase helps

s/both the/both/ ?

> +QEMU to predict if it can achieve its downtime tolerances. If QEMU during
> +pre-copy phase keeps finding dirty pages continuously, then it understands
> +that even in stop-and-copy phase, it is likely to find dirty pages and can
> +predict the downtime accordingly
> +
> +QEMU also provides per device opt-out option ``pre-copy-dirty-page-tracking``

s/provides/provides a/

> +which disables querying dirty bitmap during pre-copy phase. If it is set to

s/querying/querying the/

> +off, all dirty pages will be copied to destination in stop-and-copy phase only

s/to/to the/

(...)


