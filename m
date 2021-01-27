Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EE230647B
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 20:56:21 +0100 (CET)
Received: from localhost ([::1]:51068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4qvM-0001Sm-V5
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 14:56:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@br.ibm.com>)
 id 1l4qtM-0000df-5v
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 14:54:16 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:1874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@br.ibm.com>)
 id 1l4qtH-0007Aw-Hv
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 14:54:15 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10RJYV1g044479
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 14:54:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=fLNUozVJiit+yRUbpuoa9E09cdMXGpgZt9fWeNhreY0=;
 b=Drv/o0Ze047hjNRO5O5JL+CyPpRA71VMxpa77FaxEaacHNij34RohrsC1SDplZX2WM9J
 2Yh3HOvgUeAHpKSXVm5tQHcbglviwmHCi2OAWb2B3A3nTQcIAd7ceJ5BYkXXQCLFD5CV
 0T5vYi9eZNhxiRBNz8+RiI+AJsT59P+7zVTPFp3WHvX/srymSOE18wuvUBtRyHbZ78KL
 6t0sndiuFCqAk2StE0Jy1+yHg1A1zo2NQjlxiUIC1J2481lzyRPaPIb/f1kdzt2MDNWl
 y9qkHC2ilfPtJ/y6y96xHUOWJMVWjQlu+SZn/87xxAcZlcFRSQkWFDTXUhP5I2yy6gEN 2g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36b4cr4e1b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 14:54:08 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10RJYdul045381
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 14:54:08 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36b4cr4e0t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 14:54:08 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10RJfo8M028749;
 Wed, 27 Jan 2021 19:54:07 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03wdc.us.ibm.com with ESMTP id 36a0t2r9r8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 19:54:07 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10RJs6p431326604
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jan 2021 19:54:06 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4163112062;
 Wed, 27 Jan 2021 19:54:06 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1BA9112064;
 Wed, 27 Jan 2021 19:54:05 +0000 (GMT)
Received: from lagarcia.br.ibm.com (unknown [9.85.165.159])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 27 Jan 2021 19:54:05 +0000 (GMT)
Subject: Re: [PATCH] IOMMU and ATS not supported by vhost-user filesystem.
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <e76462fdcfaa07208380e2a7df9b281b6e6717b8.1611685180.git.lagarcia@br.ibm.com>
 <20210127111938.GH299797@stefanha-x1.localdomain>
 <cb16f58f-471f-4bf9-8cee-437feeba8750@linux.ibm.com>
 <20210127163423.GI3052@work-vm>
 <3b31eb9a-1737-e681-73a1-e4a96313a819@br.ibm.com>
 <20210127194016.GP3052@work-vm>
From: =?UTF-8?Q?Leonardo_Augusto_Guimar=c3=a3es_Garcia?= <lagarcia@br.ibm.com>
Organization: IBM
Message-ID: <8d08efa0-71f6-5e50-0eda-591d09714319@br.ibm.com>
Date: Wed, 27 Jan 2021 16:54:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210127194016.GP3052@work-vm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-27_06:2021-01-27,
 2021-01-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101270097
Received-SPF: pass client-ip=148.163.156.1; envelope-from=lagarcia@br.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: maxime.coquelin@redhat.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 4:40 PM, Dr. David Alan Gilbert wrote:
> * Leonardo Augusto Guimarães Garcia (lagarcia@br.ibm.com) wrote:
>> On 1/27/21 1:34 PM, Dr. David Alan Gilbert wrote:
>>> * Leonardo Augusto GuimarÃ£es Garcia (lagarcia@linux.ibm.com) wrote:
>>>> On 1/27/21 8:19 AM, Stefan Hajnoczi wrote:
>>>>> On Tue, Jan 26, 2021 at 03:23:38PM -0300, lagarcia@linux.ibm.com wrote:
>>>>>> From: Leonardo Garcia <lagarcia@br.ibm.com>
>>>>>>
>>>>>> Currently, as IOMMU and ATS are not supported, if a user mistakenly set
>>>>>> any of them and tries to mount the vhost-user filesystem inside the
>>>>>> guest, whenever the user tries to access the mount point, the system
>>>>>> will hang forever.
>>>>>>
>>>>>> Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
>>>>>> ---
>>>>>>     hw/virtio/vhost-user-fs-pci.c | 7 +++++++
>>>>>>     hw/virtio/vhost-user-fs.c     | 5 +++++
>>>>>>     2 files changed, 12 insertions(+)
>>>>>>
>>>>>> diff --git a/hw/virtio/vhost-user-fs-pci.c b/hw/virtio/vhost-user-fs-pci.c
>>>>>> index 2ed8492b3f..564d1fd108 100644
>>>>>> --- a/hw/virtio/vhost-user-fs-pci.c
>>>>>> +++ b/hw/virtio/vhost-user-fs-pci.c
>>>>>> @@ -11,6 +11,8 @@
>>>>>>      * top-level directory.
>>>>>>      */
>>>>>> +#include "qemu/osdep.h"
>>>>>> +#include "qapi/error.h"
>>>>>>     #include "qemu/osdep.h"
>>>>>>     #include "hw/qdev-properties.h"
>>>>>>     #include "hw/virtio/vhost-user-fs.h"
>>>>>> @@ -45,6 +47,11 @@ static void vhost_user_fs_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>>>>>>             vpci_dev->nvectors = dev->vdev.conf.num_request_queues + 2;
>>>>>>         }
>>>>>> +    if (vpci_dev->flags & VIRTIO_PCI_FLAG_ATS) {
>>>>>> +        error_setg(errp, "ATS is currently not supported with vhost-user-fs-pci");
>>>>>> +        return;
>>>>>> +    }
>>>>> Why is this check needed in addition to VIRTIO_F_IOMMU_PLATFORM?
>>>>>
>>>>> What needs to be added to support ATS?
>>>>>
>>>>>> +
>>>>>>         qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
>>>>>>     }
>>>>>> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
>>>>>> index ac4fc34b36..914d68b3ee 100644
>>>>>> --- a/hw/virtio/vhost-user-fs.c
>>>>>> +++ b/hw/virtio/vhost-user-fs.c
>>>>>> @@ -203,6 +203,11 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
>>>>>>             return;
>>>>>>         }
>>>>>> +    if (virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
>>>>>> +        error_setg(errp, "IOMMU is currently not supported with vhost-user-fs");
>>>>>> +        return;
>>>>>> +    }
>>>>>> +
>>>>>>         if (!vhost_user_init(&fs->vhost_user, &fs->conf.chardev, errp)) {
>>>>> I thought IOMMU support depends on the vhost-user device backend (e.g.
>>>>> virtiofsd), so the vhost-user backend should participate in advertising
>>>>> this feature.
>>>>>
>>>>> Perhaps the check should be:
>>>>>
>>>>>        ret = vhost_dev_init(&fs->vhost_dev, &fs->vhost_user,
>>>>>                             VHOST_BACKEND_TYPE_USER, 0);
>>>>>        if (ret < 0) {
>>>>>            error_setg_errno(errp, -ret, "vhost_dev_init failed");
>>>>>            goto err_virtio;
>>>>>        }
>>>>> +
>>>>> +   if (virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM) &&
>>>>> +       !(fs->vhost_dev.hdev_features & (1ull << VIRTIO_F_IOMMU_PLATFORM))) {
>>>>> +       error_setg(errp, "IOMMU is not supported by the vhost-user device backend");
>>>>> +       goto err_iommu_needed;
>>>>> +   }
>>>>>
>>>>> Also, can this logic be made generic for all vhost-user devices? It's
>>>>> not really specific to vhost-user-fs.
>>>> Further analyzing this, on vhost-user.c, I see:
>>>>
>>>> Â Â Â Â Â Â Â  if (virtio_has_feature(features, VIRTIO_F_IOMMU_PLATFORM) &&
>>>> Â Â Â Â Â Â Â Â Â Â Â Â Â Â Â  !(virtio_has_feature(dev->protocol_features,
>>>> Â Â Â Â Â Â Â Â Â Â Â Â Â Â Â Â Â Â Â  VHOST_USER_PROTOCOL_F_SLAVE_REQ) &&
>>>> Â Â Â Â Â Â Â Â Â Â Â Â Â Â Â Â  virtio_has_feature(dev->protocol_features,
>>>> Â Â Â Â Â Â Â Â Â Â Â Â Â Â Â Â Â Â Â  VHOST_USER_PROTOCOL_F_REPLY_ACK))) {
>>>> Â Â Â Â Â Â Â Â Â Â Â  error_report("IOMMU support requires reply-ack and "
>>>> Â Â Â Â Â Â Â Â Â Â Â Â Â Â Â Â Â Â Â Â Â Â Â Â  "slave-req protocol features.");
>>>> Â Â Â Â Â Â Â Â Â Â Â  return -1;
>>>> Â Â Â Â Â Â Â  }
>>>>
>>>> This code was included by commit 6dcdd06. It included support for
>>>> VIRTIO_F_IOMMU_PLATFORM with vhost_net devices. So, the restriction is not
>>>> generic for all vhost-user devices.
>>> That test is a slightly different test; that's checking that the
>>> vhost-user device has two underlying features that are needed to make
>>> iommu work; it's not a full test though; it doesn't actually check the
>>> vhost-user device also wants to do iommu.
>>
>> Right... but Stefan was suggesting to move the check I proposed to avoid
>> VIRTIO_F_IOMMU_PLATFORM on vhost-user-fs up to vhost-user. What I understand
>> from the above code excerpt and the rest of commit 6dcdd06 is that IOMMU
>> support has been added into vhost-user already. However, it seems
>> vhost-user-fs (maybe all other devices on top of vhost-user) doesn't support
>> it yet. If I move the check up to vhost-user, does it make sense to still
>> have all the IOMMU code support there?
> Libvhost-user isn't just used by virtiofs; so it can have IOMMU code in
> (I'm not convinced it was complete though); it just needs to make sure
> that the device is also happy to do IOMMU, as Stefan's code did.


Oh, I think I finally got what Stefan and you are saying. Thanks for the 
additional clarification!

Leo


>
> Dave
>
>> Leo
>>
>>
>>> Dave
>>>
>>>> Cheers,
>>>>
>>>> Leo
>>>>
>>>>> Stefan

