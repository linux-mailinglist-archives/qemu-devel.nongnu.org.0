Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA9A1DB815
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 17:24:31 +0200 (CEST)
Received: from localhost ([::1]:35560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbQa6-00073y-6G
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 11:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jbQZ7-0005vD-Kk
 for qemu-devel@nongnu.org; Wed, 20 May 2020 11:23:29 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:8722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jbQZ6-0003U3-On
 for qemu-devel@nongnu.org; Wed, 20 May 2020 11:23:29 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ec54adf0000>; Wed, 20 May 2020 08:21:03 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 20 May 2020 08:23:26 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 20 May 2020 08:23:26 -0700
Received: from [10.40.103.233] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 May
 2020 15:23:18 +0000
Subject: Re: [PATCH Kernel v22 7/8] vfio iommu: Add migration capability to
 report supported features
To: Cornelia Huck <cohuck@redhat.com>
References: <1589781397-28368-1-git-send-email-kwankhede@nvidia.com>
 <1589781397-28368-8-git-send-email-kwankhede@nvidia.com>
 <20200520124200.0b4f3562.cohuck@redhat.com>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <58ec5324-43e5-29cb-73b1-3675444cf89b@nvidia.com>
Date: Wed, 20 May 2020 20:53:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200520124200.0b4f3562.cohuck@redhat.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1589988063; bh=UMdQ/xPibCGY4nwJSkquHiL7+3P4sPKyNpcpRUS9mXw=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=YxFUbzyR8PNp5m1/hFX766bVMC/wBi1dhO64zkqKWjYMrqWX3wp+4OMNl+QCS0NC0
 H6jHFnGIaDimDYXdYmSNHFiQZYGNH5Riz2ymxMqrVKhfhwxRT+Ekj2ltlaKUIF0j3/
 XQPOQyA8TKxhARDG6tIYFrxX4M9ITYfarQADow++FLfxhmZVJO9DpikxtKfboC+8kU
 fIqybF26pvNK/p3mIHMXqmQFXGuTQDtjqnvjYTBD53tMxd8cByh/pMPXkIS0Hk5Khl
 su4eWzVgls5cjMSAup3XFUcqpWcMogBGD3saYZ9WwWl7du96tAG17so43ZPPf2JUR7
 kyfU9Eq7CA0sg==
Received-SPF: pass client-ip=216.228.121.143;
 envelope-from=kwankhede@nvidia.com; helo=hqnvemgate24.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 11:23:27
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: kevin.tian@intel.com, yi.l.liu@intel.com, cjia@nvidia.com,
 kvm@vger.kernel.org, eskultet@redhat.com, ziye.yang@intel.com,
 qemu-devel@nongnu.org, Zhengxiao.zx@Alibaba-inc.com,
 shuangtai.tst@alibaba-inc.com, dgilbert@redhat.com, zhi.a.wang@intel.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, aik@ozlabs.ru,
 alex.williamson@redhat.com, eauger@redhat.com, felipe@nutanix.com,
 jonathan.davies@nutanix.com, yan.y.zhao@intel.com, changpeng.liu@intel.com,
 Ken.Xue@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 5/20/2020 4:12 PM, Cornelia Huck wrote:
> On Mon, 18 May 2020 11:26:36 +0530
> Kirti Wankhede <kwankhede@nvidia.com> wrote:
> 
>> Added migration capability in IOMMU info chain.
>> User application should check IOMMU info chain for migration capability
>> to use dirty page tracking feature provided by kernel module.
>> User application must check page sizes supported and maximum dirty
>> bitmap size returned by this capability structure for ioctls used to get
>> dirty bitmap.
>>
>> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
>> ---
>>   drivers/vfio/vfio_iommu_type1.c | 23 ++++++++++++++++++++++-
>>   include/uapi/linux/vfio.h       | 22 ++++++++++++++++++++++
>>   2 files changed, 44 insertions(+), 1 deletion(-)
> 
> (...)
> 
>> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
>> index a1dd2150971e..aa8aa9dcf02a 100644
>> --- a/include/uapi/linux/vfio.h
>> +++ b/include/uapi/linux/vfio.h
>> @@ -1013,6 +1013,28 @@ struct vfio_iommu_type1_info_cap_iova_range {
>>   	struct	vfio_iova_range iova_ranges[];
>>   };
>>   
>> +/*
>> + * The migration capability allows to report supported features for migration.
>> + *
>> + * The structures below define version 1 of this capability.
>> + *
>> + * The existence of this capability indicates IOMMU kernel driver supports
> 
> s/indicates/indicates that/
> 
>> + * dirty page tracking.
>> + *
>> + * pgsize_bitmap: Kernel driver returns supported page sizes bitmap for dirty
>> + * page tracking.
> 
> "bitmap of supported page sizes for dirty page tracking" ?
> 
>> + * max_dirty_bitmap_size: Kernel driver returns maximum supported dirty bitmap
>> + * size in bytes to be used by user application for ioctls to get dirty bitmap.
> 
> "maximum supported dirty bitmap size in bytes that can be used by user
> applications when getting the dirty bitmap" ?
> 

Done.

>> + */
>> +#define VFIO_IOMMU_TYPE1_INFO_CAP_MIGRATION  1
>> +
>> +struct vfio_iommu_type1_info_cap_migration {
>> +	struct	vfio_info_cap_header header;
>> +	__u32	flags;
>> +	__u64	pgsize_bitmap;
>> +	__u64	max_dirty_bitmap_size;		/* in bytes */
>> +};
>> +
>>   #define VFIO_IOMMU_GET_INFO _IO(VFIO_TYPE, VFIO_BASE + 12)
>>   
>>   /**
> 
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> 

Thanks.

Kirti

