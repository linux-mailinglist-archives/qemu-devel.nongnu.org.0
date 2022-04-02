Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FAE4EFE4C
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 05:55:42 +0200 (CEST)
Received: from localhost ([::1]:58658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naUrV-0002ch-3P
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 23:55:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qiudayu@archeros.com>)
 id 1naUq4-0001vz-2Z
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 23:54:12 -0400
Received: from smtpbg136.qq.com ([106.55.201.188]:21199 helo=smtpbg.qq.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qiudayu@archeros.com>)
 id 1naUpz-0003BT-Al
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 23:54:11 -0400
X-QQ-mid: bizesmtp69t1648871597t6g0ny50
Received: from [10.25.15.160] ( [222.190.105.194])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 02 Apr 2022 11:53:15 +0800 (CST)
X-QQ-SSF: 01000000002000803000B00A0000000
X-QQ-FEAT: w0nHo3vL0ne46KfKp/CZut8iLdDmwSFEhdjFvab+2SS7tWB7OcJPLd9szjAAA
 tgt8uG3Y0Od+wYuH/MI4JQrXCO1aiK/vSa8+6qanQ1jvgFuC9Aw0I3ZspjLJr2wlLeqfgyq
 2X+Iqxjw9WIqceXr4EC1wentq0xYNOCnJx4sEcex4H5GZUtntCSnz3L/Z459KBAeLWv9es6
 2+SNWnW1DRbdc8rcfXE3huovDCfgdHNUiGph12G2knHAQ8tkVBlhytAtnMNnGjFC+Rg48c9
 6doMKH9i19tQ19r5QiraGS3WbT5ouPbBa9HIvy+lliwTk1+NiGYSxCXYcHnp62RUoSDIlor
 GOf9fdXiKsXadTn+12OUvs1laSZSA==
X-QQ-GoodBg: 0
Message-ID: <0d2055c0-37fe-3aa4-a291-a1fc0da6059c@archeros.com>+FFA31D18764F7868
Date: Sat, 2 Apr 2022 11:53:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4] vdpa: reset the backend device in the end of
 vhost_net_stop()
To: Jason Wang <jasowang@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>
References: <1648718713-7637-1-git-send-email-qiudayu@archeros.com>
 <1648776683-23739-1-git-send-email-qiudayu@archeros.com>
 <CACGkMEuQ_YW+aSysnFtDrjy=Wjq_U3KouOobYSC+e5+5SR0zEA@mail.gmail.com>
 <ab772bc3-4acd-bb79-7f97-0518e04bb7fe@oracle.com>
 <CACGkMEv8+XC39G4wK_bUY0ZdFd29YoR7D3ugrMy-iT7cO1arew@mail.gmail.com>
From: Michael Qiu <qiudayu@archeros.com>
In-Reply-To: <CACGkMEv8+XC39G4wK_bUY0ZdFd29YoR7D3ugrMy-iT7cO1arew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:archeros.com:qybgspam:qybgspam7
Received-SPF: none client-ip=106.55.201.188; envelope-from=qiudayu@archeros.com;
 helo=smtpbg.qq.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, FORGED_MUA_MOZILLA=2.309,
 INVALID_MSGID=0.568, KHOP_HELO_FCRDNS=0.187, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: eperezma <eperezma@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>,
 mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2022/4/2 10:20, Jason Wang wrote:
> Adding Michael.
> 
> On Sat, Apr 2, 2022 at 7:08 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>
>>
>>
>> On 3/31/2022 7:53 PM, Jason Wang wrote:
>>> On Fri, Apr 1, 2022 at 9:31 AM Michael Qiu <qiudayu@archeros.com> wrote:
>>>> Currently, when VM poweroff, it will trigger vdpa
>>>> device(such as mlx bluefield2 VF) reset many times(with 1 datapath
>>>> queue pair and one control queue, triggered 3 times), this
>>>> leads to below issue:
>>>>
>>>> vhost VQ 2 ring restore failed: -22: Invalid argument (22)
>>>>
>>>> This because in vhost_net_stop(), it will stop all vhost device bind to
>>>> this virtio device, and in vhost_dev_stop(), qemu tries to stop the device
>>>> , then stop the queue: vhost_virtqueue_stop().
>>>>
>>>> In vhost_dev_stop(), it resets the device, which clear some flags
>>>> in low level driver, and in next loop(stop other vhost backends),
>>>> qemu try to stop the queue corresponding to the vhost backend,
>>>>    the driver finds that the VQ is invalied, this is the root cause.
>>>>
>>>> To solve the issue, vdpa should set vring unready, and
>>>> remove reset ops in device stop: vhost_dev_start(hdev, false).
>>>>
>>>> and implement a new function vhost_dev_reset, only reset backend
>>>> device after all vhost(per-queue) stoped.
>>> Typo.
>>>
>>>> Signed-off-by: Michael Qiu<qiudayu@archeros.com>
>>>> Acked-by: Jason Wang <jasowang@redhat.com>
>>> Rethink this patch, consider there're devices that don't support
>>> set_vq_ready(). I wonder if we need
>>>
>>> 1) uAPI to tell the user space whether or not it supports set_vq_ready()
>> I guess what's more relevant here is to define the uAPI semantics for
>> unready i.e. set_vq_ready(0) for resuming/stopping virtqueue processing,
>> as starting vq is comparatively less ambiguous.
> 
> Yes.
> 
>> Considering the
>> likelihood that this interface may be used for live migration, it would
>> be nice to come up with variants such as 1) discard inflight request
>> v.s. 2) waiting for inflight processing to be done,
> 
> Or inflight descriptor reporting (which seems to be tricky). But we
> can start from net that a discarding may just work.
> 
>> and 3) timeout in
>> waiting.
> 
> Actually, that's the plan and Eugenio is proposing something like this
> via virtio spec:
> 
> https://lists.oasis-open.org/archives/virtio-dev/202111/msg00020.html
> 
>>
>>> 2) userspace will call SET_VRING_ENABLE() when the device supports
>>> otherwise it will use RESET.
>> Are you looking to making virtqueue resume-able through the new
>> SET_VRING_ENABLE() uAPI?
>>
>> I think RESET is inevitable in some case, i.e. when guest initiates
>> device reset by writing 0 to the status register.
> 
> Yes, that's all my plan.
> 
>> For suspend/resume and
>> live migration use cases, indeed RESET can be substituted with
>> SET_VRING_ENABLE. Again, it'd need quite some code refactoring to
>> accommodate this change. Although I'm all for it, it'd be the best to
>> lay out the plan for multiple phases rather than overload this single
>> patch too much. You can count my time on this endeavor if you don't mind. :)
> 
> You're welcome, I agree we should choose a way to go first:
> 
> 1) manage to use SET_VRING_ENABLE (more like a workaround anyway)
> 2) go with virtio-spec (may take a while)
> 3) don't wait for the spec, have a vDPA specific uAPI first. Note that
> I've chatted with most of the vendors and they seem to be fine with
> the _S_STOP. If we go this way, we can still provide the forward
> compatibility of _S_STOP
> 4) or do them all (in parallel)
> 
> Any thoughts?
> 

virtio-spec should be long-term, not only because the spec goes very 
slowly, but also the hardware upgrade should be a problem.

For short-term, better to take the first one?

Thanks,
Michael
> Thanks
> 
>>
>>>
>>> And for safety, I suggest tagging this as 7.1.
>> +1
>>
>> Regards,
>> -Siwei
>>
>>>
>>>> ---
>>>> v4 --> v3
>>>>       Nothing changed, becasue of issue with mimecast,
>>>>       when the From: tag is different from the sender,
>>>>       the some mail client will take the patch as an
>>>>       attachment, RESEND v3 does not work, So resend
>>>>       the patch as v4
>>>>
>>>> v3 --> v2:
>>>>       Call vhost_dev_reset() at the end of vhost_net_stop().
>>>>
>>>>       Since the vDPA device need re-add the status bit
>>>>       VIRTIO_CONFIG_S_ACKNOWLEDGE and VIRTIO_CONFIG_S_DRIVER,
>>>>       simply, add them inside vhost_vdpa_reset_device, and
>>>>       the only way calling vhost_vdpa_reset_device is in
>>>>       vhost_net_stop(), so it keeps the same behavior as before.
>>>>
>>>> v2 --> v1:
>>>>      Implement a new function vhost_dev_reset,
>>>>      reset the backend kernel device at last.
>>>> ---
>>>>    hw/net/vhost_net.c        | 24 +++++++++++++++++++++---
>>>>    hw/virtio/vhost-vdpa.c    | 15 +++++++++------
>>>>    hw/virtio/vhost.c         | 15 ++++++++++++++-
>>>>    include/hw/virtio/vhost.h |  1 +
>>>>    4 files changed, 45 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
>>>> index 30379d2..422c9bf 100644
>>>> --- a/hw/net/vhost_net.c
>>>> +++ b/hw/net/vhost_net.c
>>>> @@ -325,7 +325,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>>>>        int total_notifiers = data_queue_pairs * 2 + cvq;
>>>>        VirtIONet *n = VIRTIO_NET(dev);
>>>>        int nvhosts = data_queue_pairs + cvq;
>>>> -    struct vhost_net *net;
>>>> +    struct vhost_net *net = NULL;
>>>>        int r, e, i, index_end = data_queue_pairs * 2;
>>>>        NetClientState *peer;
>>>>
>>>> @@ -391,8 +391,17 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>>>>    err_start:
>>>>        while (--i >= 0) {
>>>>            peer = qemu_get_peer(ncs , i);
>>>> -        vhost_net_stop_one(get_vhost_net(peer), dev);
>>>> +
>>>> +        net = get_vhost_net(peer);
>>>> +
>>>> +        vhost_net_stop_one(net, dev);
>>>>        }
>>>> +
>>>> +    /* We only reset backend vdpa device */
>>>> +    if (net && net->dev.vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA) {
>>>> +        vhost_dev_reset(&net->dev);
>>>> +    }
>>>> +
>>>>        e = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
>>>>        if (e < 0) {
>>>>            fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", e);
>>>> @@ -410,6 +419,7 @@ void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
>>>>        VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(vbus);
>>>>        VirtIONet *n = VIRTIO_NET(dev);
>>>>        NetClientState *peer;
>>>> +    struct vhost_net *net = NULL;
>>>>        int total_notifiers = data_queue_pairs * 2 + cvq;
>>>>        int nvhosts = data_queue_pairs + cvq;
>>>>        int i, r;
>>>> @@ -420,7 +430,15 @@ void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
>>>>            } else {
>>>>                peer = qemu_get_peer(ncs, n->max_queue_pairs);
>>>>            }
>>>> -        vhost_net_stop_one(get_vhost_net(peer), dev);
>>>> +
>>>> +        net = get_vhost_net(peer);
>>>> +
>>>> +        vhost_net_stop_one(net, dev);
>>>> +    }
>>>> +
>>>> +    /* We only reset backend vdpa device */
>>>> +    if (net && net->dev.vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA) {
>>>> +        vhost_dev_reset(&net->dev);
>>>>        }
>>> So we've already reset the device in vhost_vdpa_dev_start(), any
>>> reason we need to do it again here?
>>>
>>>>        r = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
>>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>>> index c5ed7a3..3ef0199 100644
>>>> --- a/hw/virtio/vhost-vdpa.c
>>>> +++ b/hw/virtio/vhost-vdpa.c
>>>> @@ -708,6 +708,11 @@ static int vhost_vdpa_reset_device(struct vhost_dev *dev)
>>>>
>>>>        ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
>>>>        trace_vhost_vdpa_reset_device(dev, status);
>>>> +
>>>> +    /* Add back this status, so that the device could work next time*/
>>>> +    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>>>> +                               VIRTIO_CONFIG_S_DRIVER);
>>> This seems to contradict the semantic of reset.
>>>
>>>> +
>>>>        return ret;
>>>>    }
>>>>
>>>> @@ -719,14 +724,14 @@ static int vhost_vdpa_get_vq_index(struct vhost_dev *dev, int idx)
>>>>        return idx;
>>>>    }
>>>>
>>>> -static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
>>>> +static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev, unsigned int ready)
>>>>    {
>>>>        int i;
>>>>        trace_vhost_vdpa_set_vring_ready(dev);
>>>>        for (i = 0; i < dev->nvqs; ++i) {
>>>>            struct vhost_vring_state state = {
>>>>                .index = dev->vq_index + i,
>>>> -            .num = 1,
>>>> +            .num = ready,
>>>>            };
>>>>            vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
>>>>        }
>>>> @@ -1088,8 +1093,9 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>>>>            if (unlikely(!ok)) {
>>>>                return -1;
>>>>            }
>>>> -        vhost_vdpa_set_vring_ready(dev);
>>>> +        vhost_vdpa_set_vring_ready(dev, 1);
>>>>        } else {
>>>> +        vhost_vdpa_set_vring_ready(dev, 0);
>>>>            ok = vhost_vdpa_svqs_stop(dev);
>>>>            if (unlikely(!ok)) {
>>>>                return -1;
>>>> @@ -1105,9 +1111,6 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>>>>            memory_listener_register(&v->listener, &address_space_memory);
>>>>            return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
>>>>        } else {
>>>> -        vhost_vdpa_reset_device(dev);
>>>> -        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>>>> -                                   VIRTIO_CONFIG_S_DRIVER);
>>>>            memory_listener_unregister(&v->listener);
>>>>
>>>>            return 0;
>>>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>>>> index b643f42..7e0cdb6 100644
>>>> --- a/hw/virtio/vhost.c
>>>> +++ b/hw/virtio/vhost.c
>>>> @@ -1820,7 +1820,6 @@ fail_features:
>>>>    void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
>>>>    {
>>>>        int i;
>>>> -
>>> Unnecessary changes.
>>>
>>>>        /* should only be called after backend is connected */
>>>>        assert(hdev->vhost_ops);
>>>>
>>>> @@ -1854,3 +1853,17 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
>>>>
>>>>        return -ENOSYS;
>>>>    }
>>>> +
>>>> +int vhost_dev_reset(struct vhost_dev *hdev)
>>>> +{
>>> Let's use a separate patch for this.
>>>
>>> Thanks
>>>
>>>> +    int ret = 0;
>>>> +
>>>> +    /* should only be called after backend is connected */
>>>> +    assert(hdev->vhost_ops);
>>>> +
>>>> +    if (hdev->vhost_ops->vhost_reset_device) {
>>>> +        ret = hdev->vhost_ops->vhost_reset_device(hdev);
>>>> +    }
>>>> +
>>>> +    return ret;
>>>> +}
>>>> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
>>>> index 58a73e7..b8b7c20 100644
>>>> --- a/include/hw/virtio/vhost.h
>>>> +++ b/include/hw/virtio/vhost.h
>>>> @@ -114,6 +114,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
>>>>    void vhost_dev_cleanup(struct vhost_dev *hdev);
>>>>    int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
>>>>    void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
>>>> +int vhost_dev_reset(struct vhost_dev *hdev);
>>>>    int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
>>>>    void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
>>>>
>>>> --
>>>> 1.8.3.1
>>>>
>>>>
>>>>
>>
> 
> 


