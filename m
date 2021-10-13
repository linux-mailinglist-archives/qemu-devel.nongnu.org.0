Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B7B42BCDC
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 12:32:29 +0200 (CEST)
Received: from localhost ([::1]:40828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mabYi-00048B-4t
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 06:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mabVk-0002xj-Am
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 06:29:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mabVg-0005bC-1x
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 06:29:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634120954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cc9Yr6Ivo5YgbZym8EPisfM2zuvkGCC6lw8x1GY5CmU=;
 b=drSNS9NZMcqa3+xUmmq9pQGK6sPzwnhBWv8cVQ2tMfwhBQuzSCWzWw9PKh1y5oW0K9Zx+U
 qcDicBuZfZL59Rr+evQwAbOsxac5HPc90FO1yi1ssFtrwRxPqGaIPQw2KlcGhwHQ/i8fqT
 Au1isI+oIn/K1TZGUa3tmg6q45Py8HQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-m55McQ8DMBmbn9WmtuTzlQ-1; Wed, 13 Oct 2021 06:29:14 -0400
X-MC-Unique: m55McQ8DMBmbn9WmtuTzlQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1599100CCC0;
 Wed, 13 Oct 2021 10:29:12 +0000 (UTC)
Received: from localhost (unknown [10.39.193.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 09BB362A41;
 Wed, 13 Oct 2021 10:28:46 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 mst@redhat.com, peter.maydell@linaro.org
Subject: Re: [PATCH] virtio-iommu: Remove non transitional name
In-Reply-To: <20211013095554.758806-1-eric.auger@redhat.com>
Organization: Red Hat GmbH
References: <20211013095554.758806-1-eric.auger@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Wed, 13 Oct 2021 12:28:44 +0200
Message-ID: <875yu1w74z.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jean-philippe@linaro.org, abologna@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13 2021, Eric Auger <eric.auger@redhat.com> wrote:

> Remove non transitional name for virtio iommu. Like other
> devices introduced after 1.0 spec, the virtio-iommu does
> not need it.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Andrea Bolognani <abologna@redhat.com>
> ---
>  hw/virtio/virtio-iommu-pci.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
> index 770c286be7..86fa4e6c28 100644
> --- a/hw/virtio/virtio-iommu-pci.c
> +++ b/hw/virtio/virtio-iommu-pci.c
> @@ -100,7 +100,6 @@ static void virtio_iommu_pci_instance_init(Object *obj)
>  static const VirtioPCIDeviceTypeInfo virtio_iommu_pci_info = {
>      .base_name             = TYPE_VIRTIO_IOMMU_PCI,
>      .generic_name          = "virtio-iommu-pci",
> -    .non_transitional_name = "virtio-iommu-pci-non-transitional",
>      .instance_size = sizeof(VirtIOIOMMUPCI),
>      .instance_init = virtio_iommu_pci_instance_init,
>      .class_init    = virtio_iommu_pci_class_init,

No objections, but I'm a bit confused regarding base_name and
generic_name here. Can you drop base_name, re-define
TYPE_VIRTIO_IOMMU_PCI to "virtio-iommu-pci", and switch generic_name
over to it? I think that would be more in line with other modern-only
devices. AFAICS, the places using the #define should continue to work.


