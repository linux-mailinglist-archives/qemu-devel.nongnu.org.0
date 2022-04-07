Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8931F4F76D7
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 09:09:02 +0200 (CEST)
Received: from localhost ([::1]:43790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncMGL-0006Wy-9K
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 03:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ncMCy-0005IW-Pt
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 03:05:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ncMCt-0005Np-56
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 03:05:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649315126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VT3Y6P0oJyftyM+5SLMXssi0fqxZBukbgYwbSaQCpss=;
 b=K3cLxp+e/cDun9HDVhnNJbt/oeVcwQ+cX3hziKNLYFCgIwFlE4EzTiJZQQopbq+MMys08f
 JPOdfq6ewcRd8FeT24ut+9myTzGWHop9Aax+ymHSFiKMDqO0G1TQbue7uVv/hs42AUM0Mb
 SW/5/5V+U7AzIQGyYySHc4z0vDRwrkY=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-nLC3WBY4MPuSS5zV4zvfhw-1; Thu, 07 Apr 2022 03:05:22 -0400
X-MC-Unique: nLC3WBY4MPuSS5zV4zvfhw-1
Received: by mail-pj1-f70.google.com with SMTP id
 om8-20020a17090b3a8800b001c68e7ccd5fso5302895pjb.9
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 00:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VT3Y6P0oJyftyM+5SLMXssi0fqxZBukbgYwbSaQCpss=;
 b=K3GObGdhLbVTLaQZETf5orCSFqpq485yOGMg3VbvG30Ms5oLOgWEnW9uVyBVL+z0p/
 39YJABTTBMlhRspp/9LBsrn2fn5O/61GdN2LGMDsN85AZ1ENnVZIgi0PN4dnPobVcMH8
 ovoOfmIRktE1AjaK07HmDQmUnlFKhAKmXCakzBS1R+PRAS2bR3tquHePEpxUzwbppL5s
 NoM0Ni/pP8W++uJRHrHZfhyM6oMjiazbVJMvKd/c3epXhI72HDLfmAutcgiXnITiCZXg
 oNr9vP/1dmanqroIdc8d69toF5oF1ydK4VmfPR7nJ7Dhzo3GRcjCR7nSyx34biJuj8Ni
 NKMA==
X-Gm-Message-State: AOAM530bvX7IFLdxbuZaJZVfeXR6b+J4bPSEJ+8EhJ8JgzIumXnl/NEV
 SPBLG5yLI9dUMCKVW8WUj2MYA1UFbIYwaQRYMUEar9OP8W0j5z7REdy4qN5WuO/G64D+7fN8sdO
 7A5jgMUzHq3+O++g=
X-Received: by 2002:a65:4081:0:b0:381:6ff8:f4ba with SMTP id
 t1-20020a654081000000b003816ff8f4bamr10000146pgp.457.1649315120915; 
 Thu, 07 Apr 2022 00:05:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxn9Hdjzwvid2CWRRaS6fqdZHI77JuMcwiyUo7PLMQdIFxSRQhj9ikCuWDORcYWXDNjhqO7Lw==
X-Received: by 2002:a65:4081:0:b0:381:6ff8:f4ba with SMTP id
 t1-20020a654081000000b003816ff8f4bamr10000115pgp.457.1649315120371; 
 Thu, 07 Apr 2022 00:05:20 -0700 (PDT)
Received: from [10.72.13.105] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a056a000bd900b004faae43da95sm20405604pfu.138.2022.04.07.00.05.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 00:05:19 -0700 (PDT)
Message-ID: <393aebd3-34d3-b196-43fd-47fbd1901a5d@redhat.com>
Date: Thu, 7 Apr 2022 15:05:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 4/7] virtio: don't read pending event on host notifier if
 disabled
To: Si-Wei Liu <si-wei.liu@oracle.com>
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <1648621997-22416-5-git-send-email-si-wei.liu@oracle.com>
 <CACGkMEt=Bs7XPWQaMOQB5iBece1CH9HJZ69YEF_m-e2Tj95qDg@mail.gmail.com>
 <4f2acb7a-d436-9d97-80b1-3308c1b396b5@oracle.com>
 <CACGkMEtsV6e6LOYCfVZb7_-SvSAWRk1XHom+neXR=d3aQQwXmg@mail.gmail.com>
 <b190a762-1d21-4fec-b138-e4c09a949525@oracle.com>
 <CACGkMEv-ddVvrwSXGsvajiVXq5X3ZXy8mM41fvwQTYTGGnyznQ@mail.gmail.com>
 <8f8ea4e4-2398-6d94-88fe-93b2c0f6f9ca@oracle.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <8f8ea4e4-2398-6d94-88fe-93b2c0f6f9ca@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eperezma <eperezma@redhat.com>, Eli Cohen <eli@mellanox.com>,
 qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/4/6 上午3:18, Si-Wei Liu 写道:
>
>
> On 4/1/2022 7:00 PM, Jason Wang wrote:
>> On Sat, Apr 2, 2022 at 4:37 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>>
>>>
>>> On 3/31/2022 1:36 AM, Jason Wang wrote:
>>>> On Thu, Mar 31, 2022 at 12:41 AM Si-Wei Liu <si-wei.liu@oracle.com> 
>>>> wrote:
>>>>>
>>>>> On 3/30/2022 2:14 AM, Jason Wang wrote:
>>>>>> On Wed, Mar 30, 2022 at 2:33 PM Si-Wei Liu 
>>>>>> <si-wei.liu@oracle.com> wrote:
>>>>>>> Previous commit prevents vhost-user and vhost-vdpa from using
>>>>>>> userland vq handler via disable_ioeventfd_handler. The same
>>>>>>> needs to be done for host notifier cleanup too, as the
>>>>>>> virtio_queue_host_notifier_read handler still tends to read
>>>>>>> pending event left behind on ioeventfd and attempts to handle
>>>>>>> outstanding kicks from QEMU userland vq.
>>>>>>>
>>>>>>> If vq handler is not disabled on cleanup, it may lead to sigsegv
>>>>>>> with recursive virtio_net_set_status call on the control vq:
>>>>>>>
>>>>>>> 0  0x00007f8ce3ff3387 in raise () at /lib64/libc.so.6
>>>>>>> 1  0x00007f8ce3ff4a78 in abort () at /lib64/libc.so.6
>>>>>>> 2  0x00007f8ce3fec1a6 in __assert_fail_base () at /lib64/libc.so.6
>>>>>>> 3  0x00007f8ce3fec252 in  () at /lib64/libc.so.6
>>>>>>> 4  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized 
>>>>>>> out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:563
>>>>>>> 5  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized 
>>>>>>> out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:558
>>>>>>> 6  0x0000558f52d7329a in vhost_virtqueue_mask 
>>>>>>> (hdev=0x558f55c01800, vdev=0x558f568f91f0, n=2, mask=<optimized 
>>>>>>> out>) at ../hw/virtio/vhost.c:1557
>>>>>> I feel it's probably a bug elsewhere e.g when we fail to start
>>>>>> vhost-vDPA, it's the charge of the Qemu to poll host notifier and we
>>>>>> will fallback to the userspace vq handler.
>>>>> Apologies, an incorrect stack trace was pasted which actually came 
>>>>> from
>>>>> patch #1. I will post a v2 with the corresponding one as below:
>>>>>
>>>>> 0  0x000055f800df1780 in qdev_get_parent_bus (dev=0x0) at
>>>>> ../hw/core/qdev.c:376
>>>>> 1  0x000055f800c68ad8 in virtio_bus_device_iommu_enabled
>>>>> (vdev=vdev@entry=0x0) at ../hw/virtio/virtio-bus.c:331
>>>>> 2  0x000055f800d70d7f in vhost_memory_unmap (dev=<optimized out>) at
>>>>> ../hw/virtio/vhost.c:318
>>>>> 3  0x000055f800d70d7f in vhost_memory_unmap (dev=<optimized out>,
>>>>> buffer=0x7fc19bec5240, len=2052, is_write=1, access_len=2052) at
>>>>> ../hw/virtio/vhost.c:336
>>>>> 4  0x000055f800d71867 in vhost_virtqueue_stop
>>>>> (dev=dev@entry=0x55f8037ccc30, vdev=vdev@entry=0x55f8044ec590,
>>>>> vq=0x55f8037cceb0, idx=0) at ../hw/virtio/vhost.c:1241
>>>>> 5  0x000055f800d7406c in vhost_dev_stop 
>>>>> (hdev=hdev@entry=0x55f8037ccc30,
>>>>> vdev=vdev@entry=0x55f8044ec590) at ../hw/virtio/vhost.c:1839
>>>>> 6  0x000055f800bf00a7 in vhost_net_stop_one (net=0x55f8037ccc30,
>>>>> dev=0x55f8044ec590) at ../hw/net/vhost_net.c:315
>>>>> 7  0x000055f800bf0678 in vhost_net_stop 
>>>>> (dev=dev@entry=0x55f8044ec590,
>>>>> ncs=0x55f80452bae0, data_queue_pairs=data_queue_pairs@entry=7,
>>>>> cvq=cvq@entry=1)
>>>>>       at ../hw/net/vhost_net.c:423
>>>>> 8  0x000055f800d4e628 in virtio_net_set_status (status=<optimized 
>>>>> out>,
>>>>> n=0x55f8044ec590) at ../hw/net/virtio-net.c:296
>>>>> 9  0x000055f800d4e628 in virtio_net_set_status
>>>>> (vdev=vdev@entry=0x55f8044ec590, status=15 '\017') at
>>>>> ../hw/net/virtio-net.c:370
>>>> I don't understand why virtio_net_handle_ctrl() call 
>>>> virtio_net_set_stauts()...
>>> The pending request left over on the ctrl vq was a VIRTIO_NET_CTRL_MQ
>>> command, i.e. in virtio_net_handle_mq():
>> Completely forget that the code was actually written by me :\
>>
>>> 1413     n->curr_queue_pairs = queue_pairs;
>>> 1414     /* stop the backend before changing the number of queue_pairs
>>> to avoid handling a
>>> 1415      * disabled queue */
>>> 1416     virtio_net_set_status(vdev, vdev->status);
>>> 1417     virtio_net_set_queue_pairs(n);
>>>
>>> Noted before the vdpa multiqueue support, there was never a vhost_dev
>>> for ctrl_vq exposed, i.e. there's no host notifier set up for the
>>> ctrl_vq on vhost_kernel as it is emulated in QEMU software.
>>>
>>>>> 10 0x000055f800d534d8 in virtio_net_handle_ctrl (iov_cnt=<optimized
>>>>> out>, iov=<optimized out>, cmd=0 '\000', n=0x55f8044ec590) at
>>>>> ../hw/net/virtio-net.c:1408
>>>>> 11 0x000055f800d534d8 in virtio_net_handle_ctrl (vdev=0x55f8044ec590,
>>>>> vq=0x7fc1a7e888d0) at ../hw/net/virtio-net.c:1452
>>>>> 12 0x000055f800d69f37 in virtio_queue_host_notifier_read
>>>>> (vq=0x7fc1a7e888d0) at ../hw/virtio/virtio.c:2331
>>>>> 13 0x000055f800d69f37 in virtio_queue_host_notifier_read
>>>>> (n=n@entry=0x7fc1a7e8894c) at ../hw/virtio/virtio.c:3575
>>>>> 14 0x000055f800c688e6 in virtio_bus_cleanup_host_notifier
>>>>> (bus=<optimized out>, n=n@entry=14) at ../hw/virtio/virtio-bus.c:312
>>>>> 15 0x000055f800d73106 in vhost_dev_disable_notifiers
>>>>> (hdev=hdev@entry=0x55f8035b51b0, vdev=vdev@entry=0x55f8044ec590)
>>>>>       at ../../../include/hw/virtio/virtio-bus.h:35
>>>>> 16 0x000055f800bf00b2 in vhost_net_stop_one (net=0x55f8035b51b0,
>>>>> dev=0x55f8044ec590) at ../hw/net/vhost_net.c:316
>>>>> 17 0x000055f800bf0678 in vhost_net_stop 
>>>>> (dev=dev@entry=0x55f8044ec590,
>>>>> ncs=0x55f80452bae0, data_queue_pairs=data_queue_pairs@entry=7,
>>>>> cvq=cvq@entry=1)
>>>>>       at ../hw/net/vhost_net.c:423
>>>>> 18 0x000055f800d4e628 in virtio_net_set_status (status=<optimized 
>>>>> out>,
>>>>> n=0x55f8044ec590) at ../hw/net/virtio-net.c:296
>>>>> 19 0x000055f800d4e628 in virtio_net_set_status (vdev=0x55f8044ec590,
>>>>> status=15 '\017') at ../hw/net/virtio-net.c:370
>>>>> 20 0x000055f800d6c4b2 in virtio_set_status (vdev=0x55f8044ec590,
>>>>> val=<optimized out>) at ../hw/virtio/virtio.c:1945
>>>>> 21 0x000055f800d11d9d in vm_state_notify 
>>>>> (running=running@entry=false,
>>>>> state=state@entry=RUN_STATE_SHUTDOWN) at ../softmmu/runstate.c:333
>>>>> 22 0x000055f800d04e7a in do_vm_stop
>>>>> (state=state@entry=RUN_STATE_SHUTDOWN, 
>>>>> send_stop=send_stop@entry=false)
>>>>> at ../softmmu/cpus.c:262
>>>>> 23 0x000055f800d04e99 in vm_shutdown () at ../softmmu/cpus.c:280
>>>>> 24 0x000055f800d126af in qemu_cleanup () at ../softmmu/runstate.c:812
>>>>> 25 0x000055f800ad5b13 in main (argc=<optimized out>, argv=<optimized
>>>>> out>, envp=<optimized out>) at ../softmmu/main.c:51
>>>>>
>>>>>    From the trace pending read only occurs in stop path. The 
>>>>> recursive
>>>>> virtio_net_set_status from virtio_net_handle_ctrl doesn't make 
>>>>> sense to me.
>>>> Yes, we need to figure this out to know the root cause.
>>> I think it has something to do with the virtqueue unready issue that 
>>> the
>>> vhost_reset_device() refactoring series attempt to fix. If that is 
>>> fixed
>>> we should not see this sigsegv with mlx5_vdpa. However I guess we both
>>> agreed that the vq_unready support would need new uAPI (some flag) to
>>> define, hence this fix applies to the situation where uAPI doesn't 
>>> exist
>>> on the kernel or the vq_unready is not supported by vdpa vendor driver.
>>>
>> Yes.
>>
>>>> The code should work for the case when vhost-vdp fails to start.
>>> Unlike the other datapath queues for net vdpa, the events left 
>>> behind in
>>> the control queue can't be processed by the userspace, as unlike
>>> vhost-kernel we don't have a fallback path in the userspace.
>> So that's the question, we should have a safe fallback.
>>
>>> To ignore
>>> the pending event and let vhost vdpa process it on resume/start is
>>> perhaps the best thing to do. This is even true for datapath queues for
>>> other vdpa devices than of network.
>>>
>>>>> Not sure I got the reason why we need to handle pending host
>>>>> notification in userland vq, can you elaborate?
>>>> Because vhost-vDPA fails to start, we will "fallback" to a dummy 
>>>> userspace.
>>> Is the dummy userspace working or operational? What's the use case of
>>> this "fallback" dummy if what guest user can get is a busted NIC?
>> The problem is we can't do better in this case now. Such fallack (e.g
>> for vhost-user) has been used for years. Or do you have any better
>> ideas?
> In my opinion if vhost-vdpa or vhost-user fails to start, maybe we 
> should try to disable the device via virtio_error(), which would set 
> broken to true and set NEEDS_RESET in case of VERSION_1. That way the 
> device won't move forward further and the guest may get the indication 
> via config interrupt that something had gone wrong underneath. If 
> device reset is well supported there the guest driver would retry.


Note that the NEEDS_RESET is not implemented in the current Linux drivers.


> This can at least give the backend some chance to recover if running 
> into intermittent error. The worst result would be the device keeps 
> resetting repeatedly, for which we may introduce tunable to control 
> the rate if seeing reset occurs too often.. Did this ever get 
> considered before?


I don't know, but we manage to survive with such fallback for years. We 
can do this, but can virtio_error() fix the issue you describe here?


>
> Noted that the dummy userspace can't handle any control vq command 
> effectively once the vhost backend fails, for e.g. how does it handle 
> those guest offload, rx mode, MAC or VLAN filter changes without 
> sending the request down to the backend? 


It should be no difference compared to the real hardware. The device is 
just malfunction. The driver can detect this in many ways. E.g in the 
past I suggest to implement the device watchdog for virtio-net, the 
prototype is posted but for some reason it was stalled. Maybe we can 
consider to continue the work.


> This could easily get inconsistent state to the guest if somehow we 
> are able to resume the virtqueue without a reset. Even so, I suspect 
> the device reset eventually is still needed on the other part, which 
> is subject to the specific failure. It looks to me at least for 
> vhost-vdpa, it might be the safest fallback so far to ignore pending 
> event in ctrl_vq, and disable the device from moving forward in case 
> of backend start failure.


I don't get here, if we fail to start vhost-vdpa, the Qemu should do a 
safe rewind otherwise it would be a bug.


>
>>
>> It doesn't differ too much of the two approaches:
>>
>> 1) dummy fallback which can do even cvq
>>
>> and
>>
>> 2) disable host notifiers
>>
>> Especially consider 2) requires more changes.
> I'm not clear if 2) really needs more changes, as it seems to me that 
> it would take more unwarranted changes to make dummy fallback to work 
> on cvq? And suppose we can fallback to disabling device via 
> virtio_error(), we don't even need to change any code on cvq?


So let me explain my points:

1) we use dummy receive as a fallback as vhost-user

2) the code should safely fallback to that otherwise it could be a bug 
elsewhere

3) if we think the dummy fallback doesn't make sense, we can improve, 
but we need to figure out why we can crash for 2) since the code could 
be used in other path.


>
> On the other hand, for the specific code path this patch tries to fix, 
> it is not due to failure to start vhost-vdpa backend, but more of a 
> control flow flaw in the stop path due to lack of VQ stop uAPI. Let 
> alone dummy or host notifier, considering currently it's in the stop 
> path followed by a reset, I feel it should be pretty safe to just 
> ignore the pending event on the control vq rather than process it 
> prematurely in userspace. What do you think? I can leave without the 
> host notifier handler change for sure.


I wonder how vhost-user deal with this.


>
>>
>>> I
>>> think this is very different from the vhost-kernel case in that once
>>> vhost fails, we can fallback to userspace to emulate the network 
>>> through
>>> the tap fd in a good way. However, there's no equivalent yet for
>>> vhost-vdpa...
>>>
>> As said previously, technically we can have vhost-vDPA network backend
>> as a fallback.
> But this is working as yet. And how do you envision the datapath may 
> work given that we don't have a fallback tap fd?


I mean we can treat vhost-vdpa as a kind of general networking backend 
that could be used by all NIC model like e1000e. Then we can use that as 
a fallback.

But I'm not sure it's worth to bother.

Thanks


>
> -Siwei
>
>
>>   (So did for vhost-user).
>>
>> Thanks
>>
>>> Thanks,
>>> -Siwei
>>>
>>>> Thanks
>>>>
>>>>> Thanks,
>>>>> -Siwei
>>>>>
>>>>>> Thanks
>>>>>>
>>>>>>> 7  0x0000558f52c6b89a in virtio_pci_set_guest_notifier 
>>>>>>> (d=d@entry=0x558f568f0f60, n=n@entry=2, 
>>>>>>> assign=assign@entry=true, with_irqfd=with_irqfd@entry=false)
>>>>>>>       at ../hw/virtio/virtio-pci.c:974
>>>>>>> 8  0x0000558f52c6c0d8 in virtio_pci_set_guest_notifiers 
>>>>>>> (d=0x558f568f0f60, nvqs=3, assign=true) at 
>>>>>>> ../hw/virtio/virtio-pci.c:1019
>>>>>>> 9  0x0000558f52bf091d in vhost_net_start 
>>>>>>> (dev=dev@entry=0x558f568f91f0, ncs=0x558f56937cd0, 
>>>>>>> data_queue_pairs=data_queue_pairs@entry=1, cvq=cvq@entry=1)
>>>>>>>       at ../hw/net/vhost_net.c:361
>>>>>>> 10 0x0000558f52d4e5e7 in virtio_net_set_status 
>>>>>>> (status=<optimized out>, n=0x558f568f91f0) at 
>>>>>>> ../hw/net/virtio-net.c:289
>>>>>>> 11 0x0000558f52d4e5e7 in virtio_net_set_status 
>>>>>>> (vdev=0x558f568f91f0, status=15 '\017') at 
>>>>>>> ../hw/net/virtio-net.c:370
>>>>>>> 12 0x0000558f52d6c4b2 in virtio_set_status 
>>>>>>> (vdev=vdev@entry=0x558f568f91f0, val=val@entry=15 '\017') at 
>>>>>>> ../hw/virtio/virtio.c:1945
>>>>>>> 13 0x0000558f52c69eff in virtio_pci_common_write 
>>>>>>> (opaque=0x558f568f0f60, addr=<optimized out>, val=<optimized 
>>>>>>> out>, size=<optimized out>) at ../hw/virtio/virtio-pci.c:1292
>>>>>>> 14 0x0000558f52d15d6e in memory_region_write_accessor 
>>>>>>> (mr=0x558f568f19d0, addr=20, value=<optimized out>, size=1, 
>>>>>>> shift=<optimized out>, mask=<optimized out>, attrs=...)
>>>>>>>       at ../softmmu/memory.c:492
>>>>>>> 15 0x0000558f52d127de in access_with_adjusted_size 
>>>>>>> (addr=addr@entry=20, value=value@entry=0x7f8cdbffe748, 
>>>>>>> size=size@entry=1, access_size_min=<optimized out>, 
>>>>>>> access_size_max=<optimized out>, access_fn=0x558f52d15cf0 
>>>>>>> <memory_region_write_accessor>, mr=0x558f568f19d0, attrs=...) at 
>>>>>>> ../softmmu/memory.c:554
>>>>>>> 16 0x0000558f52d157ef in memory_region_dispatch_write 
>>>>>>> (mr=mr@entry=0x558f568f19d0, addr=20, data=<optimized out>, 
>>>>>>> op=<optimized out>, attrs=attrs@entry=...)
>>>>>>>       at ../softmmu/memory.c:1504
>>>>>>> 17 0x0000558f52d078e7 in flatview_write_continue 
>>>>>>> (fv=fv@entry=0x7f8accbc3b90, addr=addr@entry=103079215124, 
>>>>>>> attrs=..., ptr=ptr@entry=0x7f8ce6300028, len=len@entry=1, 
>>>>>>> addr1=<optimized out>, l=<optimized out>, mr=0x558f568f19d0) at 
>>>>>>> ../../../include/qemu/host-utils.h:165
>>>>>>> 18 0x0000558f52d07b06 in flatview_write (fv=0x7f8accbc3b90, 
>>>>>>> addr=103079215124, attrs=..., buf=0x7f8ce6300028, len=1) at 
>>>>>>> ../softmmu/physmem.c:2822
>>>>>>> 19 0x0000558f52d0b36b in address_space_write (as=<optimized 
>>>>>>> out>, addr=<optimized out>, attrs=..., 
>>>>>>> buf=buf@entry=0x7f8ce6300028, len=<optimized out>)
>>>>>>>       at ../softmmu/physmem.c:2914
>>>>>>> 20 0x0000558f52d0b3da in address_space_rw (as=<optimized out>, 
>>>>>>> addr=<optimized out>, attrs=...,
>>>>>>>       attrs@entry=..., buf=buf@entry=0x7f8ce6300028, 
>>>>>>> len=<optimized out>, is_write=<optimized out>) at 
>>>>>>> ../softmmu/physmem.c:2924
>>>>>>> 21 0x0000558f52dced09 in kvm_cpu_exec 
>>>>>>> (cpu=cpu@entry=0x558f55c2da60) at ../accel/kvm/kvm-all.c:2903
>>>>>>> 22 0x0000558f52dcfabd in kvm_vcpu_thread_fn 
>>>>>>> (arg=arg@entry=0x558f55c2da60) at ../accel/kvm/kvm-accel-ops.c:49
>>>>>>> 23 0x0000558f52f9f04a in qemu_thread_start (args=<optimized 
>>>>>>> out>) at ../util/qemu-thread-posix.c:556
>>>>>>> 24 0x00007f8ce4392ea5 in start_thread () at /lib64/libpthread.so.0
>>>>>>> 25 0x00007f8ce40bb9fd in clone () at /lib64/libc.so.6
>>>>>>>
>>>>>>> Fixes: 4023784 ("vhost-vdpa: multiqueue support")
>>>>>>> Cc: Jason Wang <jasowang@redhat.com>
>>>>>>> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
>>>>>>> ---
>>>>>>>     hw/virtio/virtio-bus.c | 3 ++-
>>>>>>>     1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
>>>>>>> index 0f69d1c..3159b58 100644
>>>>>>> --- a/hw/virtio/virtio-bus.c
>>>>>>> +++ b/hw/virtio/virtio-bus.c
>>>>>>> @@ -311,7 +311,8 @@ void 
>>>>>>> virtio_bus_cleanup_host_notifier(VirtioBusState *bus, int n)
>>>>>>>         /* Test and clear notifier after disabling event,
>>>>>>>          * in case poll callback didn't have time to run.
>>>>>>>          */
>>>>>>> -    virtio_queue_host_notifier_read(notifier);
>>>>>>> +    if (!vdev->disable_ioeventfd_handler)
>>>>>>> +        virtio_queue_host_notifier_read(notifier);
>>>>>>>         event_notifier_cleanup(notifier);
>>>>>>>     }
>>>>>>>
>>>>>>> -- 
>>>>>>> 1.8.3.1
>>>>>>>
>


