Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4092B33C44F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 18:34:33 +0100 (CET)
Received: from localhost ([::1]:51548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLr6u-0006Aw-Ad
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 13:34:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lLqwD-0007ap-94
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:23:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lLqw1-0000iC-TR
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:23:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615828997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IR8yExWPfKT6ihKbZsgHwpGNSdUrDf87U2sAwsq6AEw=;
 b=dCQV9cm4ngbo0lY4Ine0PizZqsPprMeY/UBGGet6Zkf34EoLzeQqTZN3fi9JjmX65eWVR/
 f8WGh9FsXw9rzCcVrdkuaGjwBMFECT88wYh3T6X5m56ddm2JVDkENJDFcoUpd5+f/tDCOA
 +BhUvnZT0bTwu3sn3os/d6vo6Dl976c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-0MaKx0ExORKGoLQxQDCv4w-1; Mon, 15 Mar 2021 13:23:13 -0400
X-MC-Unique: 0MaKx0ExORKGoLQxQDCv4w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 752D8EC1A1;
 Mon, 15 Mar 2021 17:23:11 +0000 (UTC)
Received: from gondolin (ovpn-113-87.ams2.redhat.com [10.36.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17A5260C0F;
 Mon, 15 Mar 2021 17:23:00 +0000 (UTC)
Date: Mon, 15 Mar 2021 18:22:58 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH v2 1/1] docs/devel: Add VFIO device migration documentation
Message-ID: <20210315182258.586dbf23.cohuck@redhat.com>
In-Reply-To: <20210310192009.53848-1-targupta@nvidia.com>
References: <20210310192009.53848-1-targupta@nvidia.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 qemu-devel@nongnu.org, Kirti Wankhede <kwankhede@nvidia.com>,
 dgilbert@redhat.com, yan.y.zhao@intel.com, lushenming@huawei.com,
 alex.williamson@redhat.com, dnigam@nvidia.com, berrange@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Mar 2021 00:50:09 +0530
Tarun Gupta <targupta@nvidia.com> wrote:

> Document interfaces used for VFIO device migration. Added flow of state changes
> during live migration with VFIO device. Tested by building docs with the new
> vfio-migration.rst file.
> 
> v2:
> - Included the new vfio-migration.rst file in index.rst
> - Updated dirty page tracking section, also added details about
>   'pre-copy-dirty-page-tracking' opt-out option.
> - Incorporated comments around wording of doc.
> 
> Signed-off-by: Tarun Gupta <targupta@nvidia.com>
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> ---
>  MAINTAINERS                   |   1 +
>  docs/devel/index.rst          |   1 +
>  docs/devel/vfio-migration.rst | 135 ++++++++++++++++++++++++++++++++++
>  3 files changed, 137 insertions(+)
>  create mode 100644 docs/devel/vfio-migration.rst
> 

(...)

> diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
> new file mode 100644
> index 0000000000..6196fb132c
> --- /dev/null
> +++ b/docs/devel/vfio-migration.rst
> @@ -0,0 +1,135 @@
> +=====================
> +VFIO device Migration
> +=====================

Maybe add an introductory sentence or two describing the general
approach? I.e. we have a general framework, and specific support for
devices needs to be hooked up.

> +
> +VFIO devices use an iterative approach for migration because certain VFIO
> +devices (e.g. GPU) have large amount of data to be transfered. The iterative
> +pre-copy phase of migration allows for the guest to continue whilst the VFIO
> +device state is transferred to the destination, this helps to reduce the total
> +downtime of the VM. VFIO devices can choose to skip the pre-copy phase of
> +migration by returning pending_bytes as zero during the pre-copy phase.

What about something like:

"Migration of VFIO devices consists of two phases: the optional
pre-copy phase, and the stop-and-copy phase. The pre-copy phase is
iterative and allows to accommodate VFIO devices that have a large
amount of data that needs to be transferred. The iterative pre-copy
phase..."

> +
> +A detailed description of the UAPI for VFIO device migration can be found in
> +the comment for the ``vfio_device_migration_info`` structure in the header
> +file linux-headers/linux/vfio.h.
> +
> +VFIO device hooks for iterative approach:
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
> +  copies the remaining data for the VFIO device untill the vendor driver

s/untill/until/

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
> +
> +Similarly, a migration state change notifier is registered to get a
> +notification on migration state change. These states are translated to VFIO

s/to/to the corresponding/

> +device state and conveyed to vendor driver.

s/to/to the/

(...)

> +Postcopy
> +========
> +
> +Postcopy migration is not supported for VFIO devices.

s/is not/is currently not/ ?


