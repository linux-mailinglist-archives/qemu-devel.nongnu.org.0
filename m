Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 597094ED20B
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 06:04:41 +0200 (CEST)
Received: from localhost ([::1]:40412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZm35-0004mD-Vd
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 00:04:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qiudayu@archeros.com>)
 id 1nZm1a-00045m-Hx
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 00:03:06 -0400
Received: from smtpbg139.qq.com ([175.27.65.136]:17439 helo=smtpbg.qq.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qiudayu@archeros.com>)
 id 1nZm1X-00021x-7m
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 00:03:06 -0400
X-QQ-mid: bizesmtp70t1648699322tmmhf0u1
Received: from [10.25.2.237] ( [222.190.105.194])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 31 Mar 2022 12:02:01 +0800 (CST)
X-QQ-SSF: 01000000000000502000B00A0000000
X-QQ-FEAT: vmnbzJorTWTUu9YE8f+raewEKRJUGEAOpRbA3MTxwhyYZdbZADjfh5zf+XE+1
 Tcq1w0OGF1gFMh4P5nQABg+GniQuUaqiKEFUeQ0bPUepRo8ooGvuQRjZp742Wgd1jZEI9zx
 DKJPNOmKj6QY8LQ67ZLiUmsLhoEcDYdiVgEPWV1KzfShjmX+JhlWdBSyyu2AvPNMTauS1Rx
 LThSX/E/hOqg8Bfdz3UQUm+jyVs+lNbcyafOM8sDy/OjfmhggXdoSnKB96hicK3MzdhzJfL
 A7ys3Voaaoy7tJcGnfgmcsBSIwZjYQSORYN4IsZN89Jjd6MDsOEiIueABq+ZXEPDGdWxUUi
 dqGctYqonMgdot1yrA=
X-QQ-GoodBg: 0
Message-ID: <2b50795d-c241-b278-b974-bc86d4c350e0@archeros.com>+94A6F26D55F87AEC
Date: Thu, 31 Mar 2022 12:02:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] vdpa: reset the backend device in stage of stop last
 vhost device
To: Si-Wei Liu <si-wei.liu@oracle.com>, 08005325@163.com,
 jasowang@redhat.com, mst@redhat.com
References: <1648024966-5170-1-git-send-email-08005325@163.com>
 <1648634561-12504-1-git-send-email-08005325@163.com>
 <2796fe2b-969e-f545-b835-d4a46fade0f2@oracle.com>
From: Michael Qiu <qiudayu@archeros.com>
In-Reply-To: <2796fe2b-969e-f545-b835-d4a46fade0f2@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:archeros.com:qybgspam:qybgspam6
Received-SPF: none client-ip=175.27.65.136; envelope-from=qiudayu@archeros.com;
 helo=smtpbg.qq.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, FORGED_MUA_MOZILLA=2.309,
 INVALID_MSGID=0.568, KHOP_HELO_FCRDNS=0.187, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: eperezma@redhat.com, lingshan.zhu@intel.com, qemu-devel@nongnu.org,
 lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2022/3/31 8:15, Si-Wei Liu wrote:
> 
> 
> On 3/30/2022 3:02 AM, 08005325@163.com wrote:
>> From: Michael Qiu <qiudayu@archeros.com>
>>
>> Currently, when VM poweroff, it will trigger vdpa
>> device(such as mlx bluefield2 VF) reset many times(with 1 datapath
>> queue pair and one control queue, triggered 3 times), this
>> leads to below issue:
>>
>> vhost VQ 2 ring restore failed: -22: Invalid argument (22)
>>
>> This because in vhost_net_stop(), it will stop all vhost device bind to
>> this virtio device, and in vhost_dev_stop(), qemu tries to stop the 
>> device
>> , then stop the queue: vhost_virtqueue_stop().
>>
>> In vhost_dev_stop(), it resets the device, which clear some flags
>> in low level driver, and in next loop(stop other vhost backends),
>> qemu try to stop the queue corresponding to the vhost backend,
>>   the driver finds that the VQ is invalied, this is the root cause.
>>
>> To solve the issue, vdpa should set vring unready, and
>> remove reset ops in device stop: vhost_dev_start(hdev, false).
>>
>> and implement a new function vhost_dev_reset, only reset backend
>> device when the last vhost stop triggerd.
>>
>> Signed-off-by: Michael Qiu<qiudayu@archeros.com>
>> Acked-by: Jason Wang <jasowang@redhat.com>
>> ---
>> v2 --> v1:
>>     implement a new function vhost_dev_reset,
>>     reset the backend kernel device at last.
>>
>> ---
>>   hw/net/vhost_net.c        | 22 +++++++++++++++++++---
>>   hw/virtio/vhost-vdpa.c    |  8 ++++----
>>   hw/virtio/vhost.c         | 16 +++++++++++++++-
>>   include/hw/virtio/vhost.h |  1 +
>>   4 files changed, 39 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
>> index 30379d2..3cdf6a4 100644
>> --- a/hw/net/vhost_net.c
>> +++ b/hw/net/vhost_net.c
>> @@ -299,7 +299,7 @@ fail_notifiers:
>>   }
>>   static void vhost_net_stop_one(struct vhost_net *net,
>> -                               VirtIODevice *dev)
>> +                               VirtIODevice *dev, bool reset)
>>   {
>>       struct vhost_vring_file file = { .fd = -1 };
>> @@ -313,6 +313,11 @@ static void vhost_net_stop_one(struct vhost_net 
>> *net,
>>           net->nc->info->poll(net->nc, true);
>>       }
>>       vhost_dev_stop(&net->dev, dev);
>> +
>> +    if (reset) {
>> +        vhost_dev_reset(&net->dev);
>> +    }
>> +
>>       vhost_dev_disable_notifiers(&net->dev, dev);
>>   }
>> @@ -391,7 +396,12 @@ int vhost_net_start(VirtIODevice *dev, 
>> NetClientState *ncs,
>>   err_start:
>>       while (--i >= 0) {
>>           peer = qemu_get_peer(ncs , i);
>> -        vhost_net_stop_one(get_vhost_net(peer), dev);
>> +
>> +        if (i == 0) {
>> +            vhost_net_stop_one(get_vhost_net(peer), dev, true);
>> +        } else {
>> +            vhost_net_stop_one(get_vhost_net(peer), dev, false);
>> +        }
>>       }
>>       e = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
>>       if (e < 0) {
>> @@ -420,7 +430,13 @@ void vhost_net_stop(VirtIODevice *dev, 
>> NetClientState *ncs,
>>           } else {
>>               peer = qemu_get_peer(ncs, n->max_queue_pairs);
>>           }
>> -        vhost_net_stop_one(get_vhost_net(peer), dev);
>> +
>> +        /* We only reset backend device during the last vhost */
>> +        if (i == nvhosts - 1) {
> I wonder if there's any specific reason to position device reset in the 
> for loop given that there's no virtqueue level reset? Wouldn't it be 
> cleaner to reset the device at the end of vhost_net_stop() before 
> return? you may use qemu_get_peer(ncs, 0) without hassle? Noted the 
> vhost_ops->vhost_reset_device op is per device rather per vq.

OK, it's a good way to do reset at the end of vhost_net_stop(), I will 
change it in next version.

> 
>> +            vhost_net_stop_one(get_vhost_net(peer), dev, true);
>> +        } else {
>> +            vhost_net_stop_one(get_vhost_net(peer), dev, false);
>> +        }
>>       }
>>       r = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>> index c5ed7a3..d858b4f 100644
>> --- a/hw/virtio/vhost-vdpa.c
>> +++ b/hw/virtio/vhost-vdpa.c
>> @@ -719,14 +719,14 @@ static int vhost_vdpa_get_vq_index(struct 
>> vhost_dev *dev, int idx)
>>       return idx;
>>   }
>> -static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
>> +static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev, unsigned 
>> int ready)
>>   {
>>       int i;
>>       trace_vhost_vdpa_set_vring_ready(dev);
>>       for (i = 0; i < dev->nvqs; ++i) {
>>           struct vhost_vring_state state = {
>>               .index = dev->vq_index + i,
>> -            .num = 1,
>> +            .num = ready,
>>           };
>>           vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
>>       }
>> @@ -1088,8 +1088,9 @@ static int vhost_vdpa_dev_start(struct vhost_dev 
>> *dev, bool started)
>>           if (unlikely(!ok)) {
>>               return -1;
>>           }
>> -        vhost_vdpa_set_vring_ready(dev);
>> +        vhost_vdpa_set_vring_ready(dev, 1);
>>       } else {
>> +        vhost_vdpa_set_vring_ready(dev, 0);
>>           ok = vhost_vdpa_svqs_stop(dev);
>>           if (unlikely(!ok)) {
>>               return -1;
>> @@ -1105,7 +1106,6 @@ static int vhost_vdpa_dev_start(struct vhost_dev 
>> *dev, bool started)
>>           memory_listener_register(&v->listener, &address_space_memory);
>>           return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
>>       } else {
>> -        vhost_vdpa_reset_device(dev);
>>           vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>>                                      VIRTIO_CONFIG_S_DRIVER);
> Here's another issue (regression) got to address - the added 
> S_ACKNOWLEDGE | S_DRIVER bits will be cleared right away by the 
> follow-up reset in vhost_net_stop_one(... , true), which in turn will 
> cause virtio fail to initialize e.g. vhost_vdpa_set_features() will fail 
> to set VIRTIO_CONFIG_S_FEATURES_OK
> 
> Ideally the status bit should be set whenever the corresponding status 
> bit is set by virtio_net from virtio_net_vhost_status(), or practically 
> it can be done at the very beginning of vhost_dev_start(), for e.g. the 
> first call before vhost_dev_set_features(). For this purpose, you may 
> consider adding another vhost_init_device op, which is symmetric to 
> vhost_ops->vhost_reset_device in the vhost_net_stop() path.
> 

Seems only vdpa device need reset after stop, although virtio spec said 
need reset, but kernel doesn't reset, and if reset it has issue to 
reprobe virtio-net in guest, So we probely only add it after reset if it 
is VDPA device, for kernel and other datapath we just keep the same as 
before.

Thanks,
Michael

> Thanks,
> -Siwei
> 
>>           memory_listener_unregister(&v->listener);
>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>> index b643f42..6d9b4a3 100644
>> --- a/hw/virtio/vhost.c
>> +++ b/hw/virtio/vhost.c
>> @@ -1820,7 +1820,7 @@ fail_features:
>>   void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
>>   {
>>       int i;
>> -
>> +    printf("vhost_dev_stop test\n");
>>       /* should only be called after backend is connected */
>>       assert(hdev->vhost_ops);
>> @@ -1854,3 +1854,17 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
>>       return -ENOSYS;
>>   }
>> +
>> +int vhost_dev_reset(struct vhost_dev *hdev)
>> +{
>> +    int ret = 0;
>> +
>> +    /* should only be called after backend is connected */
>> +    assert(hdev->vhost_ops);
>> +
>> +    if (hdev->vhost_ops->vhost_reset_device) {
>> +        ret = hdev->vhost_ops->vhost_reset_device(hdev);
>> +    }
>> +
>> +    return ret;
>> +}
>> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
>> index 58a73e7..b8b7c20 100644
>> --- a/include/hw/virtio/vhost.h
>> +++ b/include/hw/virtio/vhost.h
>> @@ -114,6 +114,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void 
>> *opaque,
>>   void vhost_dev_cleanup(struct vhost_dev *hdev);
>>   int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
>>   void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
>> +int vhost_dev_reset(struct vhost_dev *hdev);
>>   int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice 
>> *vdev);
>>   void vhost_dev_disable_notifiers(struct vhost_dev *hdev, 
>> VirtIODevice *vdev);
> 
> 


