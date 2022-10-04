Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A075F3D62
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 09:38:29 +0200 (CEST)
Received: from localhost ([::1]:55702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofcVY-0000eq-16
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 03:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ofcE3-0007eD-0Q
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 03:20:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ofcDy-0002cV-QM
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 03:20:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664868017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FGupDm3pZZf3w312tCQ7y6Jn/R2htreL3qJlGYa5rlA=;
 b=iPfeDGbh+pn0bMAW5FU8ULLpB7VZmTiLyvon+OfR1DHBzdvNAV51BodGADtsNFq04cTVRI
 NPsM+MZ/tDDozKQ5EFMvPLZ4Y4gtcgxl7b1IJdCewx72luESKz56GUxOWtPuJgo854MqvH
 CB2flJeX+QrL1knqUCfEEktxzvrFwbI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-uVQ7VNxuN7uDVVaY9Xa9lg-1; Tue, 04 Oct 2022 03:20:14 -0400
X-MC-Unique: uVQ7VNxuN7uDVVaY9Xa9lg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C83993C0ED46;
 Tue,  4 Oct 2022 07:20:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 86E0B40C6EC3;
 Tue,  4 Oct 2022 07:20:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 416B91800082; Tue,  4 Oct 2022 09:20:12 +0200 (CEST)
Date: Tue, 4 Oct 2022 09:20:12 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 1/5] pci-ids: drop PCI_DEVICE_ID_VIRTIO_IOMMU
Message-ID: <20221004072012.72lmve4hucmgfqfu@sirius.home.kraxel.org>
References: <20220930135810.1892149-1-kraxel@redhat.com>
 <20220930135810.1892149-2-kraxel@redhat.com>
 <CAFEAcA9P7D9iDhyOzjs0c7sGyAAJA8=dj=e2kR+71uwWz+C=8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9P7D9iDhyOzjs0c7sGyAAJA8=dj=e2kR+71uwWz+C=8Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
> > index 844d64770406..79ea8334f04e 100644
> > --- a/hw/virtio/virtio-iommu-pci.c
> > +++ b/hw/virtio/virtio-iommu-pci.c
> > @@ -74,8 +74,6 @@ static void virtio_iommu_pci_class_init(ObjectClass *klass, void *data)
> >      k->realize = virtio_iommu_pci_realize;
> >      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> >      device_class_set_props(dc, virtio_iommu_pci_properties);
> > -    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
> > -    pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_IOMMU;
> >      pcidev_k->revision = VIRTIO_PCI_ABI_VERSION;
> >      pcidev_k->class_id = PCI_CLASS_OTHERS;
> >      dc->hotpluggable = false;
> 
> So does this mean:
>  * these ID values on the device were never used, because some
>    other code always overwrites them with the 'modern' ID values?

Yes.

>    If so, what is that other code?

searching ...

virtio_pci_device_plugged() does it.
grep for virtio_bus_get_vdev_id to find the exact place.

Guess I should send v3 with that added to the commit messages.

>  * this is a change in behaviour?

No.

take care,
  Gerd


