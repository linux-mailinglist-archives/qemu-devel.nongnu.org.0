Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CE8651A9A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 07:21:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7W00-0001uQ-Rn; Tue, 20 Dec 2022 01:21:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1p7Vzx-0001sk-Bc
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 01:21:09 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1p7Vzu-0003fH-4P
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 01:21:08 -0500
Received: from kwepemi100025.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NbmYZ3zZYzqT7b;
 Tue, 20 Dec 2022 14:16:34 +0800 (CST)
Received: from [10.174.148.223] (10.174.148.223) by
 kwepemi100025.china.huawei.com (7.221.188.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Tue, 20 Dec 2022 14:20:57 +0800
Message-ID: <fbaeb062-b6de-66af-1cd3-0988d984f84b@huawei.com>
Date: Tue, 20 Dec 2022 14:20:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v11 5/5] docs: Add generic vhost-vdpa device documentation
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, <stefanha@redhat.com>,
 <sgarzare@redhat.com>, <cohuck@redhat.com>, <pbonzini@redhat.com>,
 <arei.gonglei@huawei.com>, <yechuan@huawei.com>, <huangzhichao@huawei.com>,
 <qemu-devel@nongnu.org>
References: <20221215134944.2809-1-longpeng2@huawei.com>
 <20221215134944.2809-6-longpeng2@huawei.com>
 <CACGkMEt65Nr_M6aTU1NwS3t=S6CaMROt7C+Hb0HqszzO7gJKMw@mail.gmail.com>
 <20221219163711-mutt-send-email-mst@kernel.org>
 <607f5e9e-710f-1436-0fc4-eb32d30e0c3a@huawei.com>
 <20221220011432-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221220011432-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi100025.china.huawei.com (7.221.188.158)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.149,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Reply-to:  "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
From: longpeng2--- via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



在 2022/12/20 14:15, Michael S. Tsirkin 写道:
> On Tue, Dec 20, 2022 at 08:02:51AM +0800, Longpeng (Mike, Cloud Infrastructure Service Product Dept.) wrote:
>>
>>
>> 在 2022/12/20 5:37, Michael S. Tsirkin 写道:
>>> On Fri, Dec 16, 2022 at 11:33:49AM +0800, Jason Wang wrote:
>>>> On Thu, Dec 15, 2022 at 9:50 PM Longpeng(Mike) <longpeng2@huawei.com> wrote:
>>>>>
>>>>> From: Longpeng <longpeng2@huawei.com>
>>>>>
>>>>> Signed-off-by: Longpeng <longpeng2@huawei.com>
>>>>> ---
>>>>>    .../devices/vhost-vdpa-generic-device.rst     | 68 +++++++++++++++++++
>>>>>    1 file changed, 68 insertions(+)
>>>>>    create mode 100644 docs/system/devices/vhost-vdpa-generic-device.rst
>>>>>
>>>>> diff --git a/docs/system/devices/vhost-vdpa-generic-device.rst b/docs/system/devices/vhost-vdpa-generic-device.rst
>>>>> new file mode 100644
>>>>> index 0000000000..24c825ef1a
>>>>> --- /dev/null
>>>>> +++ b/docs/system/devices/vhost-vdpa-generic-device.rst
>>>>> @@ -0,0 +1,68 @@
>>>>> +
>>>>> +=========================
>>>>> +vhost-vDPA generic device
>>>>> +=========================
>>>>> +
>>>>> +This document explains the usage of the vhost-vDPA generic device.
>>>>> +
>>>>> +
>>>>> +Description
>>>>> +-----------
>>>>> +
>>>>> +vDPA(virtio data path acceleration) device is a device that uses a datapath
>>>>> +which complies with the virtio specifications with vendor specific control
>>>>> +path.
>>>>> +
>>>>> +QEMU provides two types of vhost-vDPA devices to enable the vDPA device, one
>>>>> +is type sensitive which means QEMU needs to know the actual device type
>>>>> +(e.g. net, blk, scsi) and another is called "vhost-vDPA generic device" which
>>>>> +is type insensitive.
>>>>> +
>>>>> +The vhost-vDPA generic device builds on the vhost-vdpa subsystem and virtio
>>>>> +subsystem. It is quite small, but it can support any type of virtio device.
>>>>> +
>>>>> +
>>>>> +Requirements
>>>>> +------------
>>>>> +Linux 5.18+
>>>>> +iproute2/vdpa 5.12.0+
>>>>> +
>>>>> +
>>>>> +Examples
>>>>> +--------
>>>>> +
>>>>> +1. Prepare the vhost-vDPA backends, here is an example using vdpa_sim_blk
>>>>> +   device:
>>>>> +
>>>>> +::
>>>>> +  host# modprobe vhost_vdpa
>>>>> +  host# modprobe vdpa_sim_blk
>>>>
>>>> Nit: it's probably better to add driver binding steps here.
>>>>
>>>>> +  host# vdpa dev add mgmtdev vdpasim_blk name blk0
>>>>> +  (...you can see the vhost-vDPA device under /dev directory now...)
>>>>
>>>> And then the vhost char dev name could be fetch via
>>>>
>>>> ls /sys/bus/vdpa/device/blk0/vhost-vdpa*
>>>>
>>>> With the above changes.
>>>>
>>>> Acked-by: Jason Wang <jasowang@redhat.com>
>>>>
>>>> Thanks
>>>
>>>
>>> Sounds minor enough, I'll queue, pls fix with a patch on top.
>>>
>> OK, thanks. I'll send when I'm free.
> 
> Is this going to be in the next couple of weeks? then ok.

I think I can send out during this weekend.

> We do want this addressed by let's say rc3.
> 
>>>>> +  host# ls -l /dev/vhost-vdpa-*
>>>>> +  crw------- 1 root root 236, 0 Nov  2 00:49 /dev/vhost-vdpa-0
>>>>> +
>>>>> +Note:
>>>>> +It needs some vendor-specific steps to provision the vDPA device if you're
>>>>> +using real HW devices, such as loading the vendor-specific vDPA driver and
>>>>> +binding the device to the driver.
>>>>> +
>>>>> +
>>>>> +2. Start the virtual machine:
>>>>> +
>>>>> +Start QEMU with virtio-mmio bus:
>>>>> +
>>>>> +::
>>>>> +  host# qemu-system                                                  \
>>>>> +      -M microvm -m 512 -smp 2 -kernel ... -initrd ...               \
>>>>> +      -device vhost-vdpa-device,vhostdev=/dev/vhost-vdpa-0           \
>>>>> +      ...
>>>>> +
>>>>> +
>>>>> +Start QEMU with virtio-pci bus:
>>>>> +
>>>>> +::
>>>>> +  host# qemu-system                                                  \
>>>>> +      -M pc -m 512 -smp 2                                            \
>>>>> +      -device vhost-vdpa-device-pci,vhostdev=/dev/vhost-vdpa-0       \
>>>>> +      ...
>>>>> --
>>>>> 2.23.0
>>>>>
>>>
>>> .
> 
> .

