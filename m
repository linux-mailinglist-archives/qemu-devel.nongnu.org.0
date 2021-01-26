Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC47304B99
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 22:39:53 +0100 (CET)
Received: from localhost ([::1]:38634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4W40-0001M5-Mg
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 16:39:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1l4W0w-0007Ih-Ax
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 16:36:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1l4W0u-0003qn-NO
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 16:36:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611697000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xwKZdxfl2BD5jdE0BuNGoIuKx58HeI7MN7LvxdIxtzA=;
 b=b/f/YuDXSvffMOX9E0bBDgzBP71p+obcAReTBJbQw8KUEHz6lg6HanCABmnmr8iyrz7hnG
 PpD4pQQcbQ3hHcCqhVIZiczZDMTIfIy8PPavEF8Ff5Z65Nex7v/rPG8dbWCeAwGnhihYE+
 Ba35/lhVTaeLnvfVNoZyuatmtNHkK1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-9b3An5ctM26dwFxBUgMtIw-1; Tue, 26 Jan 2021 16:36:36 -0500
X-MC-Unique: 9b3An5ctM26dwFxBUgMtIw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 805CEA0C04;
 Tue, 26 Jan 2021 21:36:34 +0000 (UTC)
Received: from omen.home.shazbot.org (ovpn-112-255.phx2.redhat.com
 [10.3.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CED655D9DE;
 Tue, 26 Jan 2021 21:36:27 +0000 (UTC)
Date: Tue, 26 Jan 2021 14:36:05 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Shenming Lu <lushenming@huawei.com>
Subject: Re: [RFC PATCH v2 2/3] vfio: Set the priority of the VFIO VM state
 change handler explicitly
Message-ID: <20210126143605.4f9d5b25@omen.home.shazbot.org>
In-Reply-To: <20201209080919.156-3-lushenming@huawei.com>
References: <20201209080919.156-1-lushenming@huawei.com>
 <20201209080919.156-3-lushenming@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Neo Jia <cjia@nvidia.com>,
 mst@redhat.com, Marc Zyngier <maz@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 qemu-arm@nongnu.org, yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Dec 2020 16:09:18 +0800
Shenming Lu <lushenming@huawei.com> wrote:

> In the VFIO VM state change handler, VFIO devices are transitioned
> in the _SAVING state, which should keep them from sending interrupts.

Is this comment accurate?  It's my expectation that _SAVING has no
bearing on a device generating interrupts.  Interrupt generation must
be allowed to continue so long as the device is _RUNNING.  Thanks,

Alex

> Then we can save the pending states of all interrupts in the GIC VM
> state change handler (on ARM).
> 
> So we have to set the priority of the VFIO VM state change handler
> explicitly (like virtio devices) to ensure it is called before the
> GIC's in saving.
> 
> Signed-off-by: Shenming Lu <lushenming@huawei.com>
> Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>
> ---
>  hw/vfio/migration.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 3b9de1353a..97ea82b100 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -862,7 +862,8 @@ static int vfio_migration_init(VFIODevice *vbasedev,
>      register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1, &savevm_vfio_handlers,
>                           vbasedev);
>  
> -    migration->vm_state = qemu_add_vm_change_state_handler(vfio_vmstate_change,
> +    migration->vm_state = qdev_add_vm_change_state_handler(vbasedev->dev,
> +                                                           vfio_vmstate_change,
>                                                             vbasedev);
>      migration->migration_state.notify = vfio_migration_state_notifier;
>      add_migration_state_change_notifier(&migration->migration_state);


