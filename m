Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE60430E3BC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 21:03:58 +0100 (CET)
Received: from localhost ([::1]:45512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7ONZ-00053x-Ur
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 15:03:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l7O3L-0002QW-2f
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:43:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l7O3F-0001mu-66
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:43:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612381374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2e19AB7ioSBjqL3TMIEeY44VLiq1SUycw3Ph8oBRPnM=;
 b=Ozkc7sLhMq6YIJFVoph2k7Ii2z5tnJAnrlazel8cl47TLt7C0vMDukN6hjm6pTITtcWvL4
 UzCouf+/AuXe1rNFeYoGewVzqJXJNjyK0XAX2iIfK1PvnLqO4xW35YasQUq4zKAP/cg9tG
 qzJu8yXu/1D6JCW3W2Ojd5jliDk6OOs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-DjuiW03ZMHGxYh6QazfElQ-1; Wed, 03 Feb 2021 14:42:50 -0500
X-MC-Unique: DjuiW03ZMHGxYh6QazfElQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 745F180402C;
 Wed,  3 Feb 2021 19:42:49 +0000 (UTC)
Received: from [10.36.112.222] (ovpn-112-222.ams2.redhat.com [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C757810016F4;
 Wed,  3 Feb 2021 19:42:38 +0000 (UTC)
Subject: Re: [PATCH 3/4] hw/virtio/virtio-balloon: Remove the "class" property
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210203171832.483176-1-thuth@redhat.com>
 <20210203171832.483176-4-thuth@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <094a993e-367f-25c4-adb3-9cd3a558e655@redhat.com>
Date: Wed, 3 Feb 2021 20:42:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210203171832.483176-4-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.02.21 18:18, Thomas Huth wrote:
> This property was only required for compatibility reasons in the
> pc-1.0 machine type and earlier. Now that these machine types have
> been removed, the property is not useful anymore.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/virtio/virtio-balloon-pci.c | 11 +----------
>   1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/hw/virtio/virtio-balloon-pci.c b/hw/virtio/virtio-balloon-pci.c
> index a2c5cc7207..79a3ba979a 100644
> --- a/hw/virtio/virtio-balloon-pci.c
> +++ b/hw/virtio/virtio-balloon-pci.c
> @@ -34,21 +34,13 @@ struct VirtIOBalloonPCI {
>       VirtIOPCIProxy parent_obj;
>       VirtIOBalloon vdev;
>   };
> -static Property virtio_balloon_pci_properties[] = {
> -    DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
> -    DEFINE_PROP_END_OF_LIST(),
> -};
>   
>   static void virtio_balloon_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>   {
>       VirtIOBalloonPCI *dev = VIRTIO_BALLOON_PCI(vpci_dev);
>       DeviceState *vdev = DEVICE(&dev->vdev);
>   
> -    if (vpci_dev->class_code != PCI_CLASS_OTHERS &&
> -        vpci_dev->class_code != PCI_CLASS_MEMORY_RAM) { /* qemu < 1.1 */
> -        vpci_dev->class_code = PCI_CLASS_OTHERS;
> -    }
> -
> +    vpci_dev->class_code = PCI_CLASS_OTHERS;
>       qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
>   }
>   
> @@ -59,7 +51,6 @@ static void virtio_balloon_pci_class_init(ObjectClass *klass, void *data)
>       PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
>       k->realize = virtio_balloon_pci_realize;
>       set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> -    device_class_set_props(dc, virtio_balloon_pci_properties);
>       pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
>       pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_BALLOON;
>       pcidev_k->revision = VIRTIO_PCI_ABI_VERSION;
> 

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


