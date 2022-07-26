Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D1C580B8A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 08:22:46 +0200 (CEST)
Received: from localhost ([::1]:44226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGDxt-0007uZ-Rk
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 02:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oGDuS-0005bM-S4
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 02:19:13 -0400
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:53608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oGDuP-0004fU-SK
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 02:19:12 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=kangjie.xu@linux.alibaba.com;
 NM=1; PH=DS; RN=5; SR=0; TI=SMTPD_---0VKTyeN-_1658816341; 
Received: from 30.227.68.147(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VKTyeN-_1658816341) by smtp.aliyun-inc.com;
 Tue, 26 Jul 2022 14:19:02 +0800
Message-ID: <67608209-6bf9-36b8-5c2f-bdfeacdae404@linux.alibaba.com>
Date: Tue, 26 Jul 2022 14:19:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 13/16] virtio: introduce queue_enable in virtio
To: Jason Wang <jasowang@redhat.com>
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
 <a7a06e68bde2cf8c57fbf2c95b095b9f86eb527f.1658141552.git.kangjie.xu@linux.alibaba.com>
 <9211abdb-cf8c-f24f-7947-5f1cf23d1ae6@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, xuanzhuo@linux.alibaba.com,
 hengqi@linux.alibaba.com
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
In-Reply-To: <9211abdb-cf8c-f24f-7947-5f1cf23d1ae6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.43;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-43.freemail.mail.aliyun.com
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


在 2022/7/26 12:17, Jason Wang 写道:
>
> 在 2022/7/18 19:17, Kangjie Xu 写道:
>> Introduce the interface queue_enable() in VirtioDeviceClass and the
>> fucntion virtio_queue_enable() in virtio, it can be called when
>> VIRTIO_PCI_COMMON_Q_ENABLE is written.
>
>
> I'd suggest to split this series into two.
>
> 1) queue_enable
>
> 2) queue_reset
>
> The patch looks good to me.
>
> Thanks
>
Okay, will fix.

Thanks

>
>>
>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>> ---
>>   hw/virtio/virtio-pci.c     | 1 +
>>   hw/virtio/virtio.c         | 9 +++++++++
>>   include/hw/virtio/virtio.h | 2 ++
>>   3 files changed, 12 insertions(+)
>>
>> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
>> index 35e8a5101a..85e1840479 100644
>> --- a/hw/virtio/virtio-pci.c
>> +++ b/hw/virtio/virtio-pci.c
>> @@ -1335,6 +1335,7 @@ static void virtio_pci_common_write(void 
>> *opaque, hwaddr addr,
>> proxy->vqs[vdev->queue_sel].avail[0],
>> ((uint64_t)proxy->vqs[vdev->queue_sel].used[1]) << 32 |
>> proxy->vqs[vdev->queue_sel].used[0]);
>> +            virtio_queue_enable(vdev, vdev->queue_sel);
>>               proxy->vqs[vdev->queue_sel].enabled = 1;
>>               proxy->vqs[vdev->queue_sel].reset = 0;
>>           } else {
>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>> index 0e9d41366f..82eb9dd4f2 100644
>> --- a/hw/virtio/virtio.c
>> +++ b/hw/virtio/virtio.c
>> @@ -2050,6 +2050,15 @@ void virtio_queue_reset(VirtIODevice *vdev, 
>> uint32_t queue_index)
>>       __virtio_queue_reset(vdev, queue_index);
>>   }
>>   +void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
>> +{
>> +    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
>> +
>> +    if (k->queue_enable) {
>> +        k->queue_enable(vdev, queue_index);
>> +    }
>> +}
>> +
>>   void virtio_reset(void *opaque)
>>   {
>>       VirtIODevice *vdev = opaque;
>> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
>> index 879394299b..085997d8f3 100644
>> --- a/include/hw/virtio/virtio.h
>> +++ b/include/hw/virtio/virtio.h
>> @@ -131,6 +131,7 @@ struct VirtioDeviceClass {
>>       void (*reset)(VirtIODevice *vdev);
>>       void (*set_status)(VirtIODevice *vdev, uint8_t val);
>>       void (*queue_reset)(VirtIODevice *vdev, uint32_t queue_index);
>> +    void (*queue_enable)(VirtIODevice *vdev, uint32_t queue_index);
>>       /* For transitional devices, this is a bitmap of features
>>        * that are only exposed on the legacy interface but not
>>        * the modern one.
>> @@ -270,6 +271,7 @@ int 
>> virtio_queue_set_host_notifier_mr(VirtIODevice *vdev, int n,
>>   int virtio_set_status(VirtIODevice *vdev, uint8_t val);
>>   void virtio_reset(void *opaque);
>>   void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index);
>> +void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index);
>>   void virtio_update_irq(VirtIODevice *vdev);
>>   int virtio_set_features(VirtIODevice *vdev, uint64_t val);

