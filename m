Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CF65A1F56
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 05:13:24 +0200 (CEST)
Received: from localhost ([::1]:51002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRPmc-00051x-LM
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 23:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qtxuning1999@sjtu.edu.cn>)
 id 1oRPfc-0002rh-42
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 23:06:08 -0400
Received: from smtp237.sjtu.edu.cn ([202.120.2.237]:60434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qtxuning1999@sjtu.edu.cn>)
 id 1oRPfQ-0004pp-Bs
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 23:06:07 -0400
Received: from mta91.sjtu.edu.cn (unknown [10.118.0.91])
 by smtp237.sjtu.edu.cn (Postfix) with ESMTPS id 1DDC01007FEC3;
 Fri, 26 Aug 2022 11:05:41 +0800 (CST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mta91.sjtu.edu.cn (Postfix) with ESMTP id AE29837C840;
 Fri, 26 Aug 2022 11:05:41 +0800 (CST)
X-Virus-Scanned: amavisd-new at 
Received: from mta91.sjtu.edu.cn ([127.0.0.1])
 by localhost (mta91.sjtu.edu.cn [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id xhsc10HrVwRU; Fri, 26 Aug 2022 11:05:41 +0800 (CST)
Received: from mstore105.sjtu.edu.cn (mstore101.sjtu.edu.cn [10.118.0.105])
 by mta91.sjtu.edu.cn (Postfix) with ESMTP id 8B76C37C83E;
 Fri, 26 Aug 2022 11:05:41 +0800 (CST)
Date: Fri, 26 Aug 2022 11:05:41 +0800 (CST)
From: Guo Zhi <qtxuning1999@sjtu.edu.cn>
To: jasowang <jasowang@redhat.com>
Cc: eperezma <eperezma@redhat.com>, sgarzare <sgarzare@redhat.com>, 
 Michael Tsirkin <mst@redhat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Message-ID: <948043856.9092353.1661483141212.JavaMail.zimbra@sjtu.edu.cn>
In-Reply-To: <CACGkMEuMkfpGVQJfEHbsRkBoP9yLbdA2p2w-Jbqwm-4cPQQaiQ@mail.gmail.com>
References: <20220818151244.2050-1-qtxuning1999@sjtu.edu.cn>
 <20220818151244.2050-2-qtxuning1999@sjtu.edu.cn>
 <CACGkMEuMkfpGVQJfEHbsRkBoP9yLbdA2p2w-Jbqwm-4cPQQaiQ@mail.gmail.com>
Subject: Re: [RFC 1/2] virtio: expose used buffers
MIME-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.166.246.247]
X-Mailer: Zimbra 8.8.15_GA_4308 (ZimbraWebClient - GC104 (Mac)/8.8.15_GA_3928)
Thread-Topic: virtio: expose used buffers
Thread-Index: tcvtfxdYZyN3zNoMCZXyEudPJRqUhw==
Received-SPF: pass client-ip=202.120.2.237;
 envelope-from=qtxuning1999@sjtu.edu.cn; helo=smtp237.sjtu.edu.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



----- Original Message -----
> From: "jasowang" <jasowang@redhat.com>
> To: "Guo Zhi" <qtxuning1999@sjtu.edu.cn>
> Cc: "eperezma" <eperezma@redhat.com>, "sgarzare" <sgarzare@redhat.com>, "Michael Tsirkin" <mst@redhat.com>,
> "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
> Sent: Thursday, August 25, 2022 2:06:11 PM
> Subject: Re: [RFC 1/2] virtio: expose used buffers

> On Thu, Aug 18, 2022 at 11:13 PM Guo Zhi <qtxuning1999@sjtu.edu.cn> wrote:
>>
>> Follow VIRTIO 1.1 spec, we can only writing out a single used ring for a
>> batch of descriptors, and only notify guest when the batch of
>> descriptors have all been used.
> 
> Yes, but I don't see anything that is related to the "exposing used
> buffers", it looks more like batching used buffers etc.
> 
>>
>> We do that batch for tx, because the driver doesn't need to know the
>> length of tx buffer, while for rx, we don't apply the batch strategy.
>>
>> Signed-off-by: Guo Zhi <qtxuning1999@sjtu.edu.cn>
>> ---
>>  hw/net/virtio-net.c | 29 ++++++++++++++++++++++++++---
>>  1 file changed, 26 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>> index dd0d056f..c8e83921 100644
>> --- a/hw/net/virtio-net.c
>> +++ b/hw/net/virtio-net.c
>> @@ -2542,8 +2542,10 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
>>      VirtIONet *n = q->n;
>>      VirtIODevice *vdev = VIRTIO_DEVICE(n);
>>      VirtQueueElement *elem;
>> +    VirtQueueElement *elems[VIRTQUEUE_MAX_SIZE];
>>      int32_t num_packets = 0;
>>      int queue_index = vq2q(virtio_get_queue_index(q->tx_vq));
>> +    size_t j;
>>      if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK)) {
>>          return num_packets;
>>      }
>> @@ -2621,14 +2623,35 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
>>          }
>>
>>  drop:
>> -        virtqueue_push(q->tx_vq, elem, 0);
>> -        virtio_notify(vdev, q->tx_vq);
>> -        g_free(elem);
>> +        if (!virtio_vdev_has_feature(vdev, VIRTIO_F_IN_ORDER)) {
>> +            virtqueue_push(q->tx_vq, elem, 0);
>> +            virtio_notify(vdev, q->tx_vq);
>> +            g_free(elem);
>> +        } else {
>> +            elems[num_packets] = elem;
>> +        }
>>
>>          if (++num_packets >= n->tx_burst) {
>>              break;
>>          }
>>      }
>> +
>> +    if (virtio_vdev_has_feature(vdev, VIRTIO_F_IN_ORDER) && num_packets) {
>> +        /**
>> +         * If in order feature negotiated, devices can notify the use of a
>> batch
>> +         * of buffers to the driver by only writing out a single used ring
>> entry
>> +         * with the id corresponding to the head entry of the descriptor chain
>> +         * describing the last buffer in the batch.
>> +         */
>> +        virtqueue_fill(q->tx_vq, elems[num_packets - 1], 0, 0);
> 
> So virtqueue_fill will call virtqueue_unmap_sg(), won't this cause
> mapping to be leaked?
> 
Virtqueue_push was virtqueue_vill + virtqueue_flush already, and I will call vq_detach_element for exposed buffers.

> And I think playing batching in device specific code seems
> sub-optimal, e.g if we want to implement in-order in block we need
> duplicate the logic here.
> 

Only the device knows if the batching is possible,
We have the same problem as in vhost-kernel in this regard, and it was proposed to do per-device there.

> Thanks
> 
>> +        for (j = 0; j < num_packets; j++) {
>> +            g_free(elems[j]);
>> +        }
>> +
>> +        virtqueue_flush(q->tx_vq, num_packets);
>> +        virtio_notify(vdev, q->tx_vq);
>> +    }
>> +
>>      return num_packets;
>>  }
>>
>> --
>> 2.17.1
>>

