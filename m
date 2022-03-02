Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF114CA1EB
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 11:13:25 +0100 (CET)
Received: from localhost ([::1]:57818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPLz2-0001WW-JV
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 05:13:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nPLvv-00089B-Mh
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 05:10:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nPLvs-0004zp-0W
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 05:10:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646215806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5oe0uhGT1oxcqFitX5hOxI+lyaZearD/CJbfdsAWIgE=;
 b=IOH9FW7Fq4jf3v+Ug8MsNMPpht/eELUEfQb4EVIqkRe+UQFFS2weWbP/rzMAmu9QUeSo4L
 hfgIA/azvm9f3EsCJipVcxF3vTAhRl7tapdLkgWLrosoEQILo10SRJYZ8qzsvrrQ2PU7pr
 Z7v0g9ZfoRDk3S4KEsGjw0Ih3Ay3SyA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498--SYOi-OoN2yQzTplSsSyLg-1; Wed, 02 Mar 2022 05:10:03 -0500
X-MC-Unique: -SYOi-OoN2yQzTplSsSyLg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB489FC81;
 Wed,  2 Mar 2022 10:10:00 +0000 (UTC)
Received: from localhost (unknown [10.39.194.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C3EE1042A56;
 Wed,  2 Mar 2022 10:09:52 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Yishai Hadas <yishaih@nvidia.com>, alex.williamson@redhat.com,
 bhelgaas@google.com, jgg@nvidia.com, saeedm@nvidia.com
Subject: Re: [PATCH V9 mlx5-next 11/15] vfio: Remove migration protocol v1
 documentation
In-Reply-To: <20220224142024.147653-12-yishaih@nvidia.com>
Organization: Red Hat GmbH
References: <20220224142024.147653-1-yishaih@nvidia.com>
 <20220224142024.147653-12-yishaih@nvidia.com>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Wed, 02 Mar 2022 11:09:50 +0100
Message-ID: <87wnhcis29.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: mgurtovoy@nvidia.com, kevin.tian@intel.com, yishaih@nvidia.com,
 ashok.raj@intel.com, kvm@vger.kernel.org, linux-pci@vger.kernel.org,
 qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
 kwankhede@nvidia.com, netdev@vger.kernel.org, kuba@kernel.org,
 leonro@nvidia.com, maorg@nvidia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 24 2022, Yishai Hadas <yishaih@nvidia.com> wrote:

> From: Jason Gunthorpe <jgg@nvidia.com>
>
> v1 was never implemented and is replaced by v2.
>
> The old uAPI documentation is removed from the header file.
>
> The old uAPI definitions are still kept in the header file to ease
> transition for userspace copying these headers. They will be fully
> removed down the road.
>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
> ---
>  include/uapi/linux/vfio.h | 200 +-------------------------------------
>  1 file changed, 2 insertions(+), 198 deletions(-)
>
> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> index 26a66f68371d..fea86061b44e 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -323,7 +323,7 @@ struct vfio_region_info_cap_type {
>  #define VFIO_REGION_TYPE_PCI_VENDOR_MASK	(0xffff)
>  #define VFIO_REGION_TYPE_GFX                    (1)
>  #define VFIO_REGION_TYPE_CCW			(2)
> -#define VFIO_REGION_TYPE_MIGRATION              (3)
> +#define VFIO_REGION_TYPE_MIGRATION_DEPRECATED   (3)

This means that QEMU will need to do a (simple) rename when it updates
the headers, but that seems easy enough. (cc: to give a heads up.)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


