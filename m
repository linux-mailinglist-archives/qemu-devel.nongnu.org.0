Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB70319467
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 21:25:48 +0100 (CET)
Received: from localhost ([::1]:36188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAIX5-0005pn-BE
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 15:25:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lAIRk-0002F9-E0
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 15:20:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lAIRh-0004AV-Kp
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 15:20:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613074812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6XtdO2/+UuMCY/9BcmB/4eIg5RHULcDpAcE5xofvX7A=;
 b=GRYrlu6L6d8OPTbje4iMj+Nw97yWyjuTdcOtQJk29AXfhBxiVSWHr0aB62+/U3qoq8mhct
 lSRJlO2F1tkiBKej+eIUL4/InMcUuMqZapKvCxc/O+QVjjeagoHbjIDtu0VlpdiEkfs19c
 +pHiJ4WQwV5OgzhRgGnWUTqIH/W51WM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-vd-wYUv7OSCH1Mcfwd2GTA-1; Thu, 11 Feb 2021 15:20:10 -0500
X-MC-Unique: vd-wYUv7OSCH1Mcfwd2GTA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 555371005501;
 Thu, 11 Feb 2021 20:20:08 +0000 (UTC)
Received: from omen.home.shazbot.org (ovpn-112-255.phx2.redhat.com
 [10.3.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21F1A7086A;
 Thu, 11 Feb 2021 20:19:57 +0000 (UTC)
Date: Thu, 11 Feb 2021 13:19:56 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 1/2] vfio: Do not register any
 IOMMU_NOTIFIER_DEVIOTLB_UNMAP notifier
Message-ID: <20210211131956.107537f7@omen.home.shazbot.org>
In-Reply-To: <20210209213233.40985-2-eric.auger@redhat.com>
References: <20210209213233.40985-1-eric.auger@redhat.com>
 <20210209213233.40985-2-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: peter.maydell@linaro.org, mst@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, peterx@redhat.com, groug@kaod.org, eperezma@redhat.com,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, david@gibson.dropbear.id.au,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue,  9 Feb 2021 22:32:32 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> In an attempt to fix smmu/virtio-iommu - vhost regression, commit
> 958ec334bca3 ("vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support")
> broke virtio-iommu integration. This is due to the fact VFIO registers
> IOMMU_NOTIFIER_ALL notifiers, which includes IOMMU_NOTIFIER_DEVIOTLB_UNMAP
> and this latter now is rejected by the virtio-iommu. As a consequence,
> the registration fails. VHOST behaves like a device with an ATC cache. The
> VFIO device does not support this scheme yet.
> 
> Let's register only legacy MAP and UNMAP notifiers.
> 
> Fixes: 958ec334bca3 ("vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support")
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/vfio/common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 6ff1daa763..a50b10c801 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -787,7 +787,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
>          iommu_idx = memory_region_iommu_attrs_to_index(iommu_mr,
>                                                         MEMTXATTRS_UNSPECIFIED);
>          iommu_notifier_init(&giommu->n, vfio_iommu_map_notify,
> -                            IOMMU_NOTIFIER_ALL,
> +                            IOMMU_NOTIFIER_IOTLB_EVENTS,
>                              section->offset_within_region,
>                              int128_get64(llend),
>                              iommu_idx);

Acked-by: Alex Williamson <alex.williamson@redhat.com>


