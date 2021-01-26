Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 906C8304D52
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 00:23:52 +0100 (CET)
Received: from localhost ([::1]:44066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Xgd-0006sy-2P
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 18:23:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@br.ibm.com>)
 id 1l4WMa-0006Ur-U4
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 16:59:05 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@br.ibm.com>)
 id 1l4WMX-00032J-NJ
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 16:59:04 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10QLgmMD146710
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 16:58:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : references :
 from : cc : to : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=2D/UuUCD5sZuD9Mtzl2rWgk57MHj6zMebOb4viG7njs=;
 b=jl7ztKkClV1dPcMhRmrexl2uTEpanr8CDK5kqA6DavBjBOG3ejclStGmOKQz1YtCUcrY
 fmjJXiuqDIEgx/Ky7gxrlEaeNUzPvW1pDU32bYU8V8DrSmH+45dVQ49Ni2c6qf7MNwha
 ahqeu5wZl0YumwEzXPxzDuFA6gPgmxwKcuOIX0BbZTnvXSVw5AksO8m7pNqWpH0Kh4jw
 RwXwn6QWJsLzrK78y+aSlW8bKgYVNAAzMnV/XDMUTDVaycEmoLryCVSRhlCdHWB+6193
 f5GUIZ2lsGVQnv3n9QmFIvQ25dz1I6+l6YdNBMzb2eVB2jo9o9sX8pv5oIEDJK6Zrop0 kQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36au7vg9bq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 16:58:56 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10QLh1BS147453
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 16:58:56 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36au7vg9bb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jan 2021 16:58:55 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10QLjl1J000632;
 Tue, 26 Jan 2021 21:58:54 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 36a8uh6ayy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jan 2021 21:58:54 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10QLwr9C25493942
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jan 2021 21:58:53 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C5AB178060;
 Tue, 26 Jan 2021 21:58:53 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8A4D78064;
 Tue, 26 Jan 2021 21:58:52 +0000 (GMT)
Received: from lagarcia.br.ibm.com (unknown [9.85.165.159])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 26 Jan 2021 21:58:52 +0000 (GMT)
Subject: Re: [PATCH] IOMMU and ATS not supported by vhost-user filesystem.
References: <e76462fdcfaa07208380e2a7df9b281b6e6717b8.1611685180.git.lagarcia@br.ibm.com>
 <20210126194553.GJ2978@work-vm>
From: =?UTF-8?Q?Leonardo_Augusto_Guimar=c3=a3es_Garcia?= <lagarcia@br.ibm.com>
To: dgilbert@redhat.com
Organization: IBM
Message-ID: <fa9da505-58d9-70e6-3980-73519713ebb2@br.ibm.com>
Date: Tue, 26 Jan 2021 18:58:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210126194553.GJ2978@work-vm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-26_11:2021-01-26,
 2021-01-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 clxscore=1011
 mlxlogscore=999 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101260109
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
X-Mailman-Approved-At: Tue, 26 Jan 2021 18:22:32 -0500
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
Cc: qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/26/21 4:45 PM, Dr. David Alan Gilbert wrote:
> * lagarcia@linux.ibm.com (lagarcia@linux.ibm.com) wrote:
>> From: Leonardo Garcia <lagarcia@br.ibm.com>
>>
>> Currently, as IOMMU and ATS are not supported, if a user mistakenly set
>> any of them and tries to mount the vhost-user filesystem inside the
>> guest, whenever the user tries to access the mount point, the system
>> will hang forever.
>>
>> Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
>> ---
>>   hw/virtio/vhost-user-fs-pci.c | 7 +++++++
>>   hw/virtio/vhost-user-fs.c     | 5 +++++
>>   2 files changed, 12 insertions(+)
>>
>> diff --git a/hw/virtio/vhost-user-fs-pci.c b/hw/virtio/vhost-user-fs-pci.c
>> index 2ed8492b3f..564d1fd108 100644
>> --- a/hw/virtio/vhost-user-fs-pci.c
>> +++ b/hw/virtio/vhost-user-fs-pci.c
>> @@ -11,6 +11,8 @@
>>    * top-level directory.
>>    */
>>   
>> +#include "qemu/osdep.h"
>> +#include "qapi/error.h"
>>   #include "qemu/osdep.h"
>>   #include "hw/qdev-properties.h"
>>   #include "hw/virtio/vhost-user-fs.h"
>> @@ -45,6 +47,11 @@ static void vhost_user_fs_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>>           vpci_dev->nvectors = dev->vdev.conf.num_request_queues + 2;
>>       }
>>   
>> +    if (vpci_dev->flags & VIRTIO_PCI_FLAG_ATS) {
>> +        error_setg(errp, "ATS is currently not supported with vhost-user-fs-pci");
>> +        return;
>> +    }
>> +
>>       qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
>>   }
>>   
>> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
>> index ac4fc34b36..914d68b3ee 100644
>> --- a/hw/virtio/vhost-user-fs.c
>> +++ b/hw/virtio/vhost-user-fs.c
>> @@ -203,6 +203,11 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
>>           return;
>>       }
>>   
>> +    if (virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
>> +        error_setg(errp, "IOMMU is currently not supported with vhost-user-fs");
>> +        return;
>> +    }
> Yes, I've seen this problem - however, I'm a little confused; isn't the
> negotiation of features on virtio supposed to happen automatically?
> If so, how come it's managing to set VIRTIO_F_IOMMU_PLATFORM?


It is easy to set by passing iommu_platform=on on the QEMU command line. 
Something like this:

-device 
vhost-user-fs-pci,chardev=chr-vu-fs0,queue-size=512,tag=myfs,iommu_platform=on,ats=on

I understand this is a user error, but QEMU should not allow this 
configuration as it doesn't work.

Cheers,

Leo


>
> Dave
>
>>       if (!vhost_user_init(&fs->vhost_user, &fs->conf.chardev, errp)) {
>>           return;
>>       }
>> -- 
>> 2.29.2
>>

