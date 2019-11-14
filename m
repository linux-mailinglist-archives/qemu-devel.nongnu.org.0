Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EABACFCE4A
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Nov 2019 19:57:47 +0100 (CET)
Received: from localhost ([::1]:60836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVKJO-0004ZQ-RV
	for lists+qemu-devel@lfdr.de; Thu, 14 Nov 2019 13:57:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51272)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwankhede@nvidia.com>) id 1iVKHe-0003cD-Ad
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 13:55:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwankhede@nvidia.com>) id 1iVKHd-0001Z1-3q
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 13:55:57 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:12158)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwankhede@nvidia.com>)
 id 1iVKHc-0001YF-RG
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 13:55:57 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcda3030000>; Thu, 14 Nov 2019 10:54:59 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 14 Nov 2019 10:55:55 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 14 Nov 2019 10:55:55 -0800
Received: from [10.25.73.195] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 Nov
 2019 18:55:47 +0000
Subject: Re: [PATCH v9 Kernel 1/5] vfio: KABI for migration interface for
 device state
To: Yan Zhao <yan.y.zhao@intel.com>
References: <1573578220-7530-1-git-send-email-kwankhede@nvidia.com>
 <1573578220-7530-2-git-send-email-kwankhede@nvidia.com>
 <20191112153005.53bf324c@x1.home> <20191113032332.GB18001@joy-OptiPlex-7040>
 <d0be166b-9ffe-645d-de74-b48855995326@nvidia.com>
 <20191114003615.GD18001@joy-OptiPlex-7040>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <5592adf5-7df8-6e1a-b178-87aeee427a6a@nvidia.com>
Date: Fri, 15 Nov 2019 00:25:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191114003615.GD18001@joy-OptiPlex-7040>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573757700; bh=XrShVMnf9uJujHfUuS2c47K8whoPmvpawwcuMHNBAMA=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=GgpM7ZNnGmkiiTETY4CU47H+NR9yvfnU2hqriOTZFg4RwYBO1KKT7iuKy+ccw/oXQ
 tZOTLVY3BijIPIwP2QbDNAyTD45RN/UPtFvQARmraSoz9FcLYmRMIzmahSDjxDCJXz
 6vuFGGM0leGf6IA8AEjds8vEzZvJwR6nIt4p1QSrGqZOG/rM3Jeo+XgG824EuqJBPZ
 rnLntl4olnWaiO8UWSb/c2B5qzocf0Ub64CjQkYll2Dy6KgYwPwwztRbHHoOa5LyS9
 aEi0wOuPlmYlcieHtx8BulUtmh954b7PlQDur5wXHha8NY8cTemIgnFRFlZV5cjPqw
 zkc1Yhr1xyRUQ==
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 216.228.121.65
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
Cc: "Zhengxiao.zx@Alibaba-inc.com" <Zhengxiao.zx@Alibaba-inc.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Liu, Yi
 L" <yi.l.liu@intel.com>, "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>, "Wang, 
 Zhi A" <zhi.a.wang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 Alex Williamson <alex.williamson@redhat.com>,
 "eauger@redhat.com" <eauger@redhat.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>, "Liu,
 Changpeng" <changpeng.liu@intel.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


>>>>> + * Vendor driver should decide whether to partition data section and how to
>>>>> + * partition the data section. Vendor driver should return data_offset
>>>>> + * accordingly.
>>>>> + *
>>>>> + * Sequence to be followed for _SAVING|_RUNNING device state or pre-copy phase
>>>>> + * and for _SAVING device state or stop-and-copy phase:
>>>>> + * a. read pending_bytes. If pending_bytes > 0, go through below steps.
>>>>> + * b. read data_offset, indicates kernel driver to write data to staging buffer.
>>>>> + *    Kernel driver should return this read operation only after writing data to
>>>>> + *    staging buffer is done.
>>> May I know under what condition this data_offset will be changed per
>>> each iteration from a-f ?
>>>
>>
>> Its upto vendor driver, if vendor driver maintains multiple partitions
>> in data section.
>>
> So, do you mean each time before doing b (reading data_offset), step a
> (reading pending_bytes) is mandatory, otherwise the vendor driver does
> not know which data_offset is?

pending_bytes will only tell bytes remaining to transfer from vendor 
driver. On read operation on data_offset, vendor driver should decide 
what to send depending on where he is making data available to userspace.

> Then, any lock to wrap step a and b to ensure atomic?

With current QEMU implementation, where migration is single thread, 
there is not need of lock yet. But when we add multi-threaded support 
may be in future then locks will be required in userspace side.

Thanks,
Kirti

