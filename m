Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FF4304902
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 20:48:13 +0100 (CET)
Received: from localhost ([::1]:38208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4UJv-0000HM-Jd
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 14:48:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l4UHw-0007CJ-NL
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 14:46:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l4UHu-0008LX-RF
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 14:46:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611690365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L+Xjn0lEeM160ZAxM2rK5Rxn6b4e+mwZ8nwkk3q9Thg=;
 b=bBsvFyE5kRLCq/zgGB35b2ud1vEBF6ci/Y7Mm8wfe5SXlT6gu6T9qDiXj/4d/bh2cy56sp
 8L486VrMhNdKlJ2rJ0fJg7wA+iUsHb+/sxdhaeZyHiBVcCaUBpe7GuU3RUCQ54A+aP+twf
 BRh5FjxTOs9kWsf+ewMEgPK55NBngxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-yIfmg29MONqk4tkVrknnFw-1; Tue, 26 Jan 2021 14:46:03 -0500
X-MC-Unique: yIfmg29MONqk4tkVrknnFw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DE9619251A9;
 Tue, 26 Jan 2021 19:46:01 +0000 (UTC)
Received: from work-vm (ovpn-115-24.ams2.redhat.com [10.36.115.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8390B10013C0;
 Tue, 26 Jan 2021 19:45:56 +0000 (UTC)
Date: Tue, 26 Jan 2021 19:45:53 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: lagarcia@linux.ibm.com
Subject: Re: [PATCH] IOMMU and ATS not supported by vhost-user filesystem.
Message-ID: <20210126194553.GJ2978@work-vm>
References: <e76462fdcfaa07208380e2a7df9b281b6e6717b8.1611685180.git.lagarcia@br.ibm.com>
MIME-Version: 1.0
In-Reply-To: <e76462fdcfaa07208380e2a7df9b281b6e6717b8.1611685180.git.lagarcia@br.ibm.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, qemu-devel@nongnu.org,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* lagarcia@linux.ibm.com (lagarcia@linux.ibm.com) wrote:
> From: Leonardo Garcia <lagarcia@br.ibm.com>
> 
> Currently, as IOMMU and ATS are not supported, if a user mistakenly set
> any of them and tries to mount the vhost-user filesystem inside the
> guest, whenever the user tries to access the mount point, the system
> will hang forever.
> 
> Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
> ---
>  hw/virtio/vhost-user-fs-pci.c | 7 +++++++
>  hw/virtio/vhost-user-fs.c     | 5 +++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/hw/virtio/vhost-user-fs-pci.c b/hw/virtio/vhost-user-fs-pci.c
> index 2ed8492b3f..564d1fd108 100644
> --- a/hw/virtio/vhost-user-fs-pci.c
> +++ b/hw/virtio/vhost-user-fs-pci.c
> @@ -11,6 +11,8 @@
>   * top-level directory.
>   */
>  
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
>  #include "qemu/osdep.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/virtio/vhost-user-fs.h"
> @@ -45,6 +47,11 @@ static void vhost_user_fs_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>          vpci_dev->nvectors = dev->vdev.conf.num_request_queues + 2;
>      }
>  
> +    if (vpci_dev->flags & VIRTIO_PCI_FLAG_ATS) {
> +        error_setg(errp, "ATS is currently not supported with vhost-user-fs-pci");
> +        return;
> +    }
> +
>      qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
>  }
>  
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index ac4fc34b36..914d68b3ee 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -203,6 +203,11 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> +    if (virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
> +        error_setg(errp, "IOMMU is currently not supported with vhost-user-fs");
> +        return;
> +    }

Yes, I've seen this problem - however, I'm a little confused; isn't the
negotiation of features on virtio supposed to happen automatically?
If so, how come it's managing to set VIRTIO_F_IOMMU_PLATFORM?

Dave

>      if (!vhost_user_init(&fs->vhost_user, &fs->conf.chardev, errp)) {
>          return;
>      }
> -- 
> 2.29.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


