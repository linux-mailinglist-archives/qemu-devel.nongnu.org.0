Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848AD48899B
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 14:35:53 +0100 (CET)
Received: from localhost ([::1]:49830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6YMS-0005S8-2b
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 08:35:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n6YKf-0004hl-EO
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 08:34:01 -0500
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:56557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n6YKc-0008SX-Gp
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 08:34:01 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.241])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 2A5812024C;
 Sun,  9 Jan 2022 13:33:48 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Sun, 9 Jan
 2022 14:33:47 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003f85e4b2c-c541-4dbd-ac31-dd70621e9dc1,
 EDB71B2E67258A59641AC79CA4F264B4AF596A7D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <16b8037c-a4bc-6440-4293-cd7262f8ac8a@kaod.org>
Date: Sun, 9 Jan 2022 14:33:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PULL v3 12/55] virtio-pci: add support for configure interrupt
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, <qemu-devel@nongnu.org>
References: <20220108003423.15830-1-mst@redhat.com>
 <20220108003423.15830-13-mst@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220108003423.15830-13-mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7db0c2af-65f4-4b9f-8b33-7a2b82cf7ba8
X-Ovh-Tracer-Id: 16446019940340435936
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudegkedgheehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhulhhusehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Cindy,

On 1/8/22 02:04, Michael S. Tsirkin wrote:
> From: Cindy Lu <lulu@redhat.com>
> 
> Add support for configure interrupt, The process is used kvm_irqfd_assign
> to set the gsi to kernel. When the configure notifier was signal by
> host, qemu will inject a msix interrupt to guest
> 
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> Message-Id: <20211104164827.21911-11-lulu@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   hw/virtio/virtio-pci.h |  4 +-
>   hw/virtio/virtio-pci.c | 92 ++++++++++++++++++++++++++++++++++++------
>   2 files changed, 83 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
> index 2446dcd9ae..b704acc5a8 100644
> --- a/hw/virtio/virtio-pci.h
> +++ b/hw/virtio/virtio-pci.h
> @@ -251,5 +251,7 @@ void virtio_pci_types_register(const VirtioPCIDeviceTypeInfo *t);
>    * @fixed_queues.
>    */
>   unsigned virtio_pci_optimal_num_queues(unsigned fixed_queues);
> -
> +void virtio_pci_set_guest_notifier_fd_handler(VirtIODevice *vdev, VirtQueue *vq,
> +                                              int n, bool assign,
> +                                              bool with_irqfd);
>   #endif
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 7201cf3dc1..98fb5493ae 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -727,7 +727,8 @@ static int virtio_pci_get_notifier(VirtIOPCIProxy *proxy, int queue_no,
>       VirtQueue *vq;
>   
>       if (queue_no == VIRTIO_CONFIG_IRQ_IDX) {
> -        return -1;
> +        *n = virtio_config_get_guest_notifier(vdev);
> +        *vector = vdev->config_vector;
>       } else {
>           if (!virtio_queue_get_num(vdev, queue_no)) {
>               return -1;
> @@ -802,6 +803,10 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
>       return ret;
>   }
>   
> +static int kvm_virtio_pci_vector_config_use(VirtIOPCIProxy *proxy)
> +{
> +    return kvm_virtio_pci_vector_use_one(proxy, VIRTIO_CONFIG_IRQ_IDX);
> +}
>   
>   static void kvm_virtio_pci_vector_release_one(VirtIOPCIProxy *proxy,
>                                                 int queue_no)
> @@ -839,6 +844,11 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
>       }
>   }
>   
> +static void kvm_virtio_pci_vector_config_release(VirtIOPCIProxy *proxy)
> +{
> +    kvm_virtio_pci_vector_release_one(proxy, VIRTIO_CONFIG_IRQ_IDX);
> +}
> +
>   static int virtio_pci_one_vector_unmask(VirtIOPCIProxy *proxy,
>                                          unsigned int queue_no,
>                                          unsigned int vector,
> @@ -920,9 +930,17 @@ static int virtio_pci_vector_unmask(PCIDevice *dev, unsigned vector,
>           }
>           vq = virtio_vector_next_queue(vq);
>       }
> -
> +    /* unmask config intr */
> +    n = virtio_config_get_guest_notifier(vdev);
> +    ret = virtio_pci_one_vector_unmask(proxy, VIRTIO_CONFIG_IRQ_IDX, vector,
> +                                       msg, n);
> +    if (ret < 0) {
> +        goto undo_config;
> +    }
>       return 0;
> -
> +undo_config:
> +    n = virtio_config_get_guest_notifier(vdev);
> +    virtio_pci_one_vector_mask(proxy, VIRTIO_CONFIG_IRQ_IDX, vector, n);
>   undo:
>       vq = virtio_vector_first_queue(vdev, vector);
>       while (vq && unmasked >= 0) {
> @@ -956,6 +974,8 @@ static void virtio_pci_vector_mask(PCIDevice *dev, unsigned vector)
>           }
>           vq = virtio_vector_next_queue(vq);
>       }
> +    n = virtio_config_get_guest_notifier(vdev);
> +    virtio_pci_one_vector_mask(proxy, VIRTIO_CONFIG_IRQ_IDX, vector, n);
>   }
>   
>   static void virtio_pci_vector_poll(PCIDevice *dev,
> @@ -987,6 +1007,34 @@ static void virtio_pci_vector_poll(PCIDevice *dev,
>               msix_set_pending(dev, vector);
>           }
>       }
> +    /* poll the config intr */
> +    ret = virtio_pci_get_notifier(proxy, VIRTIO_CONFIG_IRQ_IDX, &notifier,
> +                                  &vector);
> +    if (ret < 0) {
> +        return;
> +    }
> +    if (vector < vector_start || vector >= vector_end ||
> +        !msix_is_masked(dev, vector)) {
> +        return;
> +    }
> +    if (k->guest_notifier_pending) {
> +        if (k->guest_notifier_pending(vdev, VIRTIO_CONFIG_IRQ_IDX)) {
> +            msix_set_pending(dev, vector);
> +        }
> +    } else if (event_notifier_test_and_clear(notifier)) {
> +        msix_set_pending(dev, vector);
> +    }
> +}
> +
> +void virtio_pci_set_guest_notifier_fd_handler(VirtIODevice *vdev, VirtQueue *vq,
> +                                              int n, bool assign,
> +                                              bool with_irqfd)
> +{
> +    if (n == VIRTIO_CONFIG_IRQ_IDX) {
> +        virtio_config_set_guest_notifier_fd_handler(vdev, assign, with_irqfd);
> +    } else {
> +        virtio_queue_set_guest_notifier_fd_handler(vq, assign, with_irqfd);
> +    }
>   }
>   
>   static int virtio_pci_set_guest_notifier(DeviceState *d, int n, bool assign,
> @@ -995,17 +1043,25 @@ static int virtio_pci_set_guest_notifier(DeviceState *d, int n, bool assign,
>       VirtIOPCIProxy *proxy = to_virtio_pci_proxy(d);
>       VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
>       VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
> -    VirtQueue *vq = virtio_get_queue(vdev, n);
> -    EventNotifier *notifier = virtio_queue_get_guest_notifier(vq);
> +    VirtQueue *vq = NULL;
> +    EventNotifier *notifier = NULL;
> +
> +    if (n == VIRTIO_CONFIG_IRQ_IDX) {
> +        notifier = virtio_config_get_guest_notifier(vdev);
> +    } else {
> +        vq = virtio_get_queue(vdev, n);
> +        notifier = virtio_queue_get_guest_notifier(vq);
> +    }
>   
>       if (assign) {
>           int r = event_notifier_init(notifier, 0);
>           if (r < 0) {
>               return r;
>           }
> -        virtio_queue_set_guest_notifier_fd_handler(vq, true, with_irqfd);
> +        virtio_pci_set_guest_notifier_fd_handler(vdev, vq, n, true, with_irqfd);
>       } else {
> -        virtio_queue_set_guest_notifier_fd_handler(vq, false, with_irqfd);
> +        virtio_pci_set_guest_notifier_fd_handler(vdev, vq, n, false,
> +                                                 with_irqfd);
>           event_notifier_cleanup(notifier);
>       }
>   
> @@ -1047,6 +1103,7 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
>           msix_unset_vector_notifiers(&proxy->pci_dev);
>           if (proxy->vector_irqfd) {
>               kvm_virtio_pci_vector_release(proxy, nvqs);
> +            kvm_virtio_pci_vector_config_release(proxy);
>               g_free(proxy->vector_irqfd);
>               proxy->vector_irqfd = NULL;
>           }
> @@ -1062,7 +1119,11 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
>               goto assign_error;
>           }
>       }
> -
> +    r = virtio_pci_set_guest_notifier(d, VIRTIO_CONFIG_IRQ_IDX, assign,
> +                                      with_irqfd);
> +    if (r < 0) {
> +        goto config_assign_error;
> +    }
>       /* Must set vector notifier after guest notifier has been assigned */
>       if ((with_irqfd || k->guest_notifier_mask) && assign) {
>           if (with_irqfd) {
> @@ -1071,11 +1132,14 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
>                             msix_nr_vectors_allocated(&proxy->pci_dev));
>               r = kvm_virtio_pci_vector_use(proxy, nvqs);
>               if (r < 0) {
> -                goto assign_error;
> +                goto config_assign_error;
>               }
>           }
> -        r = msix_set_vector_notifiers(&proxy->pci_dev,
> -                                      virtio_pci_vector_unmask,
> +        r = kvm_virtio_pci_vector_config_use(proxy);
> +        if (r < 0) {
> +            goto config_error;
> +        }


This is crashing a QEMU TCG machine using vhost (no irqfd). Below is a fix
but I doubt it is complete.

Thanks,

C.


 From dde4d7b21c851a33d2d03bddd18464ae4e777a3f Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Date: Sun, 9 Jan 2022 10:40:47 +0100
Subject: [PATCH] vhost: Fix support for configure interrupt
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

irqfd is not necessarily  in use (TCG using vhost).

Cc: Cindy Lu <lulu@redhat.com>
Fixes: d5d24d859c39 ("virtio-pci: add support for configure interrupt")
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
  hw/virtio/virtio-pci.c | 10 ++++++----
  1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 98fb5493ae06..39ebb042860d 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1134,10 +1134,12 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
              if (r < 0) {
                  goto config_assign_error;
              }
-        }
-        r = kvm_virtio_pci_vector_config_use(proxy);
-        if (r < 0) {
-            goto config_error;
+
+            r = kvm_virtio_pci_vector_config_use(proxy);
+            if (r < 0) {
+                abort();
+                goto config_error;
+            }
          }
          r = msix_set_vector_notifiers(&proxy->pci_dev, virtio_pci_vector_unmask,
                                        virtio_pci_vector_mask,
-- 
2.31.1


