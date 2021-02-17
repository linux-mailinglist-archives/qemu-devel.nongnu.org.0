Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E434931DE06
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 18:17:47 +0100 (CET)
Received: from localhost ([::1]:59580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCQSQ-0005dg-Ea
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 12:17:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1lCQIT-0006dc-C9
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 12:07:29 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1lCQIP-0000om-7H
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 12:07:29 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11HGiI5O141697
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:07:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=reply-to : subject : to
 : cc : references : from : message-id : date : mime-version : in-reply-to
 : content-type : content-transfer-encoding; s=pp1;
 bh=vfscnLHe+PMFk1Q+6/5UGXZZ7QIfJNqd0gh8UN6HKr4=;
 b=bJUGSw7uXr2AO5eivR2MnhlDj67OHokiap4gK94cPYtboYgGIfSaq7kpwYlYyrfNDWDm
 XULwLgMwBpCwHTYYKN+PRYm37ff7WP3i0aA1AcB7UE8w6PiC2N8cVY6lKin/T/PiE7Kb
 vj853q689u1vH82QtAWE09lTB2LxVpQ4UT3YFexX5ycqUGVaVP4MT5IgsYj9SAFUKqsO
 bdsdjy705uD6hps8Cqw6t5MI5d0zEL9GZh1GbpbsRoii2TdFs8aRnHYFLKEF7V7Z2IvR
 XFqMZ6TR1SlU+klQMAR79svBm09U6cHl2UFPxHDjnwP3pCyRCvikshidVT8tcegN7/o2 dQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36s6x3gr90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:07:22 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11HGsnP0038944
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:07:22 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36s6x3gr82-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Feb 2021 12:07:22 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11HGlj4c025508;
 Wed, 17 Feb 2021 17:07:20 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 36p6d97mje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Feb 2021 17:07:20 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11HH7J2x25166250
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Feb 2021 17:07:20 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D115878063;
 Wed, 17 Feb 2021 17:07:19 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B466F78064;
 Wed, 17 Feb 2021 17:07:17 +0000 (GMT)
Received: from lagarcia.br.ibm.com (unknown [9.85.184.199])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 17 Feb 2021 17:07:17 +0000 (GMT)
Subject: Re: [PATCH] IOMMU and ATS not supported by vhost-user filesystem.
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <e76462fdcfaa07208380e2a7df9b281b6e6717b8.1611685180.git.lagarcia@br.ibm.com>
 <20210127111938.GH299797@stefanha-x1.localdomain>
From: =?UTF-8?Q?Leonardo_Augusto_Guimar=c3=a3es_Garcia?=
 <lagarcia@linux.ibm.com>
Organization: IBM
Message-ID: <7e9c93f5-b13f-9773-b417-c19518683e10@linux.ibm.com>
Date: Wed, 17 Feb 2021 14:07:16 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210127111938.GH299797@stefanha-x1.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-17_13:2021-02-16,
 2021-02-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999 mlxscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102170124
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=lagarcia@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: lagarcia@br.ibm.com
Cc: gkurz@redhat.com, farosas@br.ibm.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 8:19 AM, Stefan Hajnoczi wrote:
> On Tue, Jan 26, 2021 at 03:23:38PM -0300, lagarcia@linux.ibm.com wrote:
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
> Why is this check needed in addition to VIRTIO_F_IOMMU_PLATFORM?
>
> What needs to be added to support ATS?


As I am working on v2 for this patch, I revisited this. There is no need 
for this check. ATS works fine. The only problem is with the 
iommu_platform flag.


Cheers,


Leo


>
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
>> +
>>       if (!vhost_user_init(&fs->vhost_user, &fs->conf.chardev, errp)) {
> I thought IOMMU support depends on the vhost-user device backend (e.g.
> virtiofsd), so the vhost-user backend should participate in advertising
> this feature.
>
> Perhaps the check should be:
>
>      ret = vhost_dev_init(&fs->vhost_dev, &fs->vhost_user,
>                           VHOST_BACKEND_TYPE_USER, 0);
>      if (ret < 0) {
>          error_setg_errno(errp, -ret, "vhost_dev_init failed");
>          goto err_virtio;
>      }
> +
> +   if (virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM) &&
> +       !(fs->vhost_dev.hdev_features & (1ull << VIRTIO_F_IOMMU_PLATFORM))) {
> +       error_setg(errp, "IOMMU is not supported by the vhost-user device backend");
> +       goto err_iommu_needed;
> +   }
>
> Also, can this logic be made generic for all vhost-user devices? It's
> not really specific to vhost-user-fs.
>
> Stefan

