Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CA6620785
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 04:32:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osFKV-0007wK-LX; Mon, 07 Nov 2022 22:31:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1osFKQ-0007wA-NG
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 22:31:11 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1osFKM-0004GT-Ud
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 22:31:10 -0500
Received: from kwepemi100025.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N5tsM3PLMzHvdf;
 Tue,  8 Nov 2022 11:30:31 +0800 (CST)
Received: from [10.174.148.223] (10.174.148.223) by
 kwepemi100025.china.huawei.com (7.221.188.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 8 Nov 2022 11:30:54 +0800
Message-ID: <1f9235a3-237f-aa89-f558-838b3f85caae@huawei.com>
Date: Tue, 8 Nov 2022 11:30:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v8 5/5] docs: Add generic vhost-vdpa device documentation
To: Jason Wang <jasowang@redhat.com>
CC: <stefanha@redhat.com>, <mst@redhat.com>, <sgarzare@redhat.com>,
 <cohuck@redhat.com>, <pbonzini@redhat.com>, <arei.gonglei@huawei.com>,
 <yechuan@huawei.com>, <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>,
 <xiehong@huawei.com>
References: <20221108004157.1112-1-longpeng2@huawei.com>
 <20221108004157.1112-6-longpeng2@huawei.com>
 <CACGkMEtPpegJ+GbUseq4Y4=Y6De+trDZ5Ks8UqnTcsyVVPvnaw@mail.gmail.com>
In-Reply-To: <CACGkMEtPpegJ+GbUseq4Y4=Y6De+trDZ5Ks8UqnTcsyVVPvnaw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi100025.china.huawei.com (7.221.188.158)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=longpeng2@huawei.com;
 helo=szxga02-in.huawei.com
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



在 2022/11/8 10:42, Jason Wang 写道:
> On Tue, Nov 8, 2022 at 8:42 AM Longpeng(Mike) <longpeng2@huawei.com> wrote:
>>
>> From: Longpeng <longpeng2@huawei.com>
>>
>> Signed-off-by: Longpeng <longpeng2@huawei.com>
>> ---
>>   docs/system/devices/vhost-vdpa-device.rst | 43 +++++++++++++++++++++++
>>   1 file changed, 43 insertions(+)
>>   create mode 100644 docs/system/devices/vhost-vdpa-device.rst
>>
>> diff --git a/docs/system/devices/vhost-vdpa-device.rst b/docs/system/devices/vhost-vdpa-device.rst
>> new file mode 100644
>> index 0000000000..b758c4fce6
>> --- /dev/null
>> +++ b/docs/system/devices/vhost-vdpa-device.rst
> 
> If the doc is for a general vhost-vDPA device, we'd better have a better name?
> 

How about general-vhost-vdpa-device.rst?

On the other hand, this series focuses on the general vhost-vDPA device, 
so the doc is for it. It's ok if you want one doc includes both, then I 
think it should move out of this series.


>> @@ -0,0 +1,43 @@
>> +
>> +=========================
>> +generic vhost-vdpa device
>> +=========================
>> +
>> +This document explains the usage of the generic vhost vdpa device.
>> +
>> +Description
>> +-----------
>> +
>> +vDPA(virtio data path acceleration) device is a device that uses a datapath
>> +which complies with the virtio specifications with vendor specific control
>> +path.
>> +
>> +QEMU provides two types of vhost-vdpa devices to enable the vDPA device, one
>> +is type sensitive which means QEMU needs to know the actual device type
>> +(e.g. net, blk, scsi) and another is called "generic vdpa device" which is
>> +type insensitive (likes vfio-pci).
> 
> Same as above, if this document is focused on the general vhost-vDPA
> device, we'd better emphasize it. And I don't think mention vfio-pci
> is good idea here since those two are different from a lot of places,
> (e.g the general vhost-vdpa is not transport specific, as demonstrated
> below).
> 

Ok, got it.

> Thanks
> 
>> +
>> +Examples
>> +--------
>> +
>> +Prepare the vhost-vdpa backends first:
>> +
>> +::
>> +  host# ls -l /dev/vhost-vdpa-*
>> +  crw------- 1 root root 236, 0 Nov  2 00:49 /dev/vhost-vdpa-0
>> +
>> +Start QEMU with virtio-mmio bus:
>> +
>> +::
>> +  host# qemu-system                                                  \
>> +      -M microvm -m 512 -smp 2 -kernel ... -initrd ...               \
>> +      -device vhost-vdpa-device,vhostdev=/dev/vhost-vdpa-0           \
>> +      ...
>> +
>> +Start QEMU with virtio-pci bus:
>> +
>> +::
>> +  host# qemu-system                                                  \
>> +      -M pc -m 512 -smp 2                                            \
>> +      -device vhost-vdpa-device-pci,vhostdev=/dev/vhost-vdpa-0       \
>> +      ...
>> --
>> 2.23.0
>>
> 
> .

