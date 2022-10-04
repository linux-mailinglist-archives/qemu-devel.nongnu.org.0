Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE20A5F3E57
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 10:29:14 +0200 (CEST)
Received: from localhost ([::1]:33248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofdIf-0007JB-Uc
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 04:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ofcjO-00070S-Ll
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 03:52:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ofcjG-0005oU-IB
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 03:52:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664869957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qVgNdUHzdU2FevsD+lP2R5rBrPM4irkEAds3Z6KxYbY=;
 b=CPaL/25XbwIVgPUpjHtnlIfpE0NBCdUR+MA92eOeoCkgU0csHgEhY1KUv5WbTX1fMnK1Tk
 fNnsx596pLVXjlFzmMogloEU8+PXgKboKYJuVhF/rDq6GOu75HMDVIJ22SxFHFekgg6lng
 f0IuMkH5InBSPP3/VKASzGY3s5yy32U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-O-LUtEyFMXC-fkR-8HfyUg-1; Tue, 04 Oct 2022 03:52:35 -0400
X-MC-Unique: O-LUtEyFMXC-fkR-8HfyUg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A25E63C0F420;
 Tue,  4 Oct 2022 07:52:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 658C940C6EC2;
 Tue,  4 Oct 2022 07:52:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2328A1800082; Tue,  4 Oct 2022 09:52:34 +0200 (CEST)
Date: Tue, 4 Oct 2022 09:52:34 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 David Hildenbrand <david@redhat.com>, peter.maydell@linaro.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 4/5] pci-ids: drop PCI_DEVICE_ID_VIRTIO_VSOCK
Message-ID: <20221004075234.5dtq72pa4myay7ny@sirius.home.kraxel.org>
References: <20220930135810.1892149-1-kraxel@redhat.com>
 <20220930135810.1892149-5-kraxel@redhat.com>
 <20221004073030.nbi632tchiokqfv5@sgarzare-redhat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221004073030.nbi632tchiokqfv5@sgarzare-redhat>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

> > diff --git a/hw/virtio/vhost-vsock-pci.c b/hw/virtio/vhost-vsock-pci.c
> > index 9f34414d3814..170a806b6765 100644
> > --- a/hw/virtio/vhost-vsock-pci.c
> > +++ b/hw/virtio/vhost-vsock-pci.c
> > @@ -65,8 +65,6 @@ static void vhost_vsock_pci_class_init(ObjectClass *klass, void *data)
> >     k->realize = vhost_vsock_pci_realize;
> >     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> >     device_class_set_props(dc, vhost_vsock_pci_properties);
> > -    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
> > -    pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_VSOCK;
> >     pcidev_k->revision = 0x00;
> >     pcidev_k->class_id = PCI_CLASS_COMMUNICATION_OTHER;
> > }
> 
> Could we have migration issues with this change?
> 
> This reminded me that we've had issues already with vsock being incorrectly
> exported as legacy, that we discovered when we added commit 9b3a35ec82
> ("virtio: verify that legacy support is not accidentally on").
> 
> Then we needed commit d55f518248 ("virtio: skip legacy support check on
> machine types less than 5.1") to avoid migration issues.
> 
> And we merged the following commits to force 1.0 in virtio-vsock devices for
> machine types >= 5.1 :
> - 6209070503 ("vhost-vsock-pci: force virtio version 1")
> - 27eda699f5 ("vhost-user-vsock-pci: force virtio version 1")

Oh, the virtio_pci_force_virtio_1() call is conditional.  Hmm.

The change will break vsock devices in legacy/transitional mode.  So, if
that is allowed for old machine types for backward compatibility reasons
I guess I should better drop this patch.

take care,
  Gerd


