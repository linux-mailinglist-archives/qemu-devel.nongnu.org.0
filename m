Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5067B5A07AF
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 05:40:33 +0200 (CEST)
Received: from localhost ([::1]:50150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR3jL-0003jx-Nt
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 23:40:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oR3hc-0002NQ-Io
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 23:38:44 -0400
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42]:50571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oR3hS-0000eN-28
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 23:38:38 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VNBZXIo_1661398700; 
Received: from 30.227.72.120(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VNBZXIo_1661398700) by smtp.aliyun-inc.com;
 Thu, 25 Aug 2022 11:38:21 +0800
Message-ID: <5f784e21-f629-bc44-e71f-d07b7f8f85ac@linux.alibaba.com>
Date: Thu, 25 Aug 2022 11:38:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 07/24] virtio-pci: support queue enable
To: Jason Wang <jasowang@redhat.com>
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <6dda660c634b2a35c3dea46a98e63fb2ef3a36c9.1660611460.git.kangjie.xu@linux.alibaba.com>
 <1824ba40-9460-4c5d-9a27-820a51355ba3@redhat.com>
 <9fb3e2b4-9f78-5da1-3ab6-0ec53f03b628@linux.alibaba.com>
 <5812b7ed-3983-6b39-0c44-e1701ca4ecf0@redhat.com>
 <a5cb0b2d-1a76-86eb-acd7-6421a5f6d3eb@linux.alibaba.com>
 <CACGkMEvrzc2asJfWVynh=Y=6mjrGLG5EOTDhfrDWV69SX7Yb1g@mail.gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, f4bug@amsat.org,
 wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
In-Reply-To: <CACGkMEvrzc2asJfWVynh=Y=6mjrGLG5EOTDhfrDWV69SX7Yb1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.42;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-42.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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


在 2022/8/25 10:52, Jason Wang 写道:
> On Wed, Aug 24, 2022 at 7:27 PM Kangjie Xu <kangjie.xu@linux.alibaba.com> wrote:
>>
>> 在 2022/8/24 16:59, Jason Wang 写道:
>>
>>
>> 在 2022/8/23 16:20, Kangjie Xu 写道:
>>
>>
>> 在 2022/8/23 15:44, Jason Wang 写道:
>>
>>
>> 在 2022/8/16 09:06, Kangjie Xu 写道:
>>
>> PCI devices support vq enable.
>>
>>
>>
>> Nit: it might be "support device specific vq enable"
>>
>>
>> Get it.
>>
>>
>> Based on this function, the driver can re-enable the virtqueue after the
>> virtqueue is reset.
>>
>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>> ---
>>    hw/virtio/virtio-pci.c | 1 +
>>    1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
>> index ec8e92052f..3d560e45ad 100644
>> --- a/hw/virtio/virtio-pci.c
>> +++ b/hw/virtio/virtio-pci.c
>> @@ -1335,6 +1335,7 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
>> proxy->vqs[vdev->queue_sel].avail[0],
>> ((uint64_t)proxy->vqs[vdev->queue_sel].used[1]) << 32 |
>> proxy->vqs[vdev->queue_sel].used[0]);
>> +            virtio_queue_enable(vdev, vdev->queue_sel);
>>                proxy->vqs[vdev->queue_sel].enabled = 1;
>>                proxy->vqs[vdev->queue_sel].reset = 0;
>>
>>
>>
>> Any reason we do it before the assignment of 1? It probably means the device specific method can't depend on virtio_queue_enabled()?
>>
>> Thanks
>>
>> Sorry, I don't get why device specific method can't depend on virtio_queue_enabled().
>>
>>
>>
>> I meant if the device specific method call virtio_queue_enabled() it will return false in this case, is this intended?
>>
>> Yes, I intend it to behave in this way.
>>
>>
>>
>> Before virtio_queue_enable() is done, virtqueue should always be not ready and disabled.
>>
>> Otherwise, If we put it after the assignment of enabled to 1, the virtqueue may be accessed illegally and may cause panic, because the virtqueue is still being intialized and being configured.
>>
>>
>>
>> How? Shouldn't we make transport ready before making device virtqueue(device) ready?
>>
>> Thanks
>>
>> I am not experienced in this field, could you tell me why we should make the transport ready first?
> That's a must for the device to work.
>
> E.g for PCI device, I can't image the device is ready to work before
> PCI is ready.
>
>> I make the transport ready later than making device ready for two aspects:
>>
>> 1. In QEMU, the virtio_queue_enabled() is used only when we start the device/queue pair (vhost_dev_start_one), or reading VIRTIO_PCI_COMMON_Q_ENABLE. These two operations and resetting the queue will be synchronized using iothread lock, so we do not need to worry about the case currently.
> Note that virtio_queue_enabled() is an exported helper, you can't
> assume how it will be used in the future.
>
>> 2. Suppose we use virtio_queue_enabled() or access the enabled status asynchronously, and we make the transport ready first.
>>
>> After enabled set to true, and before virtio_queue_enable() is finished, somewhere  that call virtio_queue_enabled()  or access the enabled status of VirtIOPCIQueue. Then the caller will consider the virtqueue as enabled(enabled = true in VirtIOPCIQueue). The caller might access the virtqueue(access avail ring / desc table). But I think the access here is illegal because the virtqueue might still be unintialized status.
>>
> How can this happen, won't we call device specific method after we set
> queue_enabled as true? It's the charge of the device specific method
> to synchronize the necessary external I/O in this case.
>
> Thanks

I get your point.

You are right. I realized that I ignored the external I/O.

Will fix it.

Thanks

>
>> Thus, from my perspective, to prevent illegal access, we need to make transport ready after virtio_queue_enable().
>>
>> Thanks
>>
>>
>>
>> Thanks
>>
>>
>>            } else {
>>
>>

