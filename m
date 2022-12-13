Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B49064B8A7
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 16:39:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p57M1-0000tn-DY; Tue, 13 Dec 2022 10:38:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1p57Lw-0000tW-Us
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 10:37:56 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1p57Lt-0002K8-Mh
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 10:37:56 -0500
Received: from kwepemi100025.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NWjK43QsZzlVhw;
 Tue, 13 Dec 2022 23:36:40 +0800 (CST)
Received: from [10.174.148.223] (10.174.148.223) by
 kwepemi100025.china.huawei.com (7.221.188.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Tue, 13 Dec 2022 23:37:37 +0800
Message-ID: <c4bb4aca-d09f-b419-5d0b-dc7044a0c8fb@huawei.com>
Date: Tue, 13 Dec 2022 23:37:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v10 5/5] docs: Add generic vhost-vdpa device documentation
To: Stefano Garzarella <sgarzare@redhat.com>
CC: <stefanha@redhat.com>, <mst@redhat.com>, <jasowang@redhat.com>,
 <cohuck@redhat.com>, <pbonzini@redhat.com>, <arei.gonglei@huawei.com>,
 <yechuan@huawei.com>, <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>
References: <20221205084943.2259-1-longpeng2@huawei.com>
 <20221205084943.2259-6-longpeng2@huawei.com>
 <20221213143511.awu6ibpavokxrghv@sgarzare-redhat>
In-Reply-To: <20221213143511.awu6ibpavokxrghv@sgarzare-redhat>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi100025.china.huawei.com (7.221.188.158)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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



在 2022/12/13 22:35, Stefano Garzarella 写道:
> On Mon, Dec 05, 2022 at 04:49:43PM +0800, Longpeng(Mike) wrote:
>> From: Longpeng <longpeng2@huawei.com>
>>
>> Signed-off-by: Longpeng <longpeng2@huawei.com>
>> ---
>> .../devices/vhost-vdpa-generic-device.rst     | 66 +++++++++++++++++++
>> 1 file changed, 66 insertions(+)
>> create mode 100644 docs/system/devices/vhost-vdpa-generic-device.rst
>>
>> diff --git a/docs/system/devices/vhost-vdpa-generic-device.rst 
>> b/docs/system/devices/vhost-vdpa-generic-device.rst
>> new file mode 100644
>> index 0000000000..7d13359ea1
>> --- /dev/null
>> +++ b/docs/system/devices/vhost-vdpa-generic-device.rst
>> @@ -0,0 +1,66 @@
>> +
>> +=========================
>> +vhost-vDPA generic device
>> +=========================
>> +
>> +This document explains the usage of the vhost-vDPA generic device.
>> +
>> +Description
>> +-----------
>> +
>> +vDPA(virtio data path acceleration) device is a device that uses a 
>> datapath
>> +which complies with the virtio specifications with vendor specific 
>> control
>> +path.
>> +
>> +QEMU provides two types of vhost-vDPA devices to enable the vDPA 
>> device, one
>> +is type sensitive which means QEMU needs to know the actual device type
>> +(e.g. net, blk, scsi) and another is called "vhost-vDPA generic 
>> device" which
>> +is type insensitive.
>> +
>> +The vhost-vDPA generic device builds on the vhost-vdpa subsystem and 
>> virtio
>> +subsystem. It is quite small, but it can support any type of virtio 
>> device.
>> +
> 
> Maybe we can also add a minimum requirement section (e.g. we needs at 
> least Linux v5.18 for VHOST_VDPA_GET_VQS_COUNT)
> 
Ok.

>> +Examples
>> +--------
>> +
>> +1. Please make sure the modules listed bellow are installed:
>> +    vhost.ko
>> +    vhost_iotlb.ko
>> +    vdpa.ko
>> +    vhost_vdpa.ko
>> +
>> +
>> +2. Prepare the vhost-vDPA backends, here is an example using 
>> vdpa_sim_blk
>> +   device:
>> +
>> +::
> 
> Should we add also a `modprobe vhost-vdpa` step?
> 
This is already described in Step 1.

>> +  host# modprobe vdpa_sim_blk
>> +  host# vdpa dev add mgmtdev vdpasim_blk name blk0
>> +  (...you can see the vhost-vDPA device under /dev directory now...)
>> +  host# ls -l /dev/vhost-vdpa-*
>> +  crw------- 1 root root 236, 0 Nov  2 00:49 /dev/vhost-vdpa-0
>> +
>> +Note:
>> +It needs some vendor-specific steps to provision the vDPA device if 
>> you're
>> +using real HW devices, such as installing the vendor-specific vDPA 
>> driver
>> +and binding the device to the driver.
>> +
>> +
>> +3. Start the virtual machine:
>> +
>> +Start QEMU with virtio-mmio bus:
>> +
>> +::
>> +  host# qemu-system                                                  \
>> +      -M microvm -m 512 -smp 2 -kernel ... -initrd ...               \
>> +      -device vhost-vdpa-device,vhostdev=/dev/vhost-vdpa-0           \
>> +      ...
>> +
>> +
>> +Start QEMU with virtio-pci bus:
>> +
>> +::
>> +  host# qemu-system                                                  \
>> +      -M pc -m 512 -smp 2                                            \
>> +      -device vhost-vdpa-device-pci,vhostdev=/dev/vhost-vdpa-0       \
>> +      ...
>> -- 
>> 2.23.0
>>
> 
> .

