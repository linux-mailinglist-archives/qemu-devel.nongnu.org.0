Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3864C324BDF
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 09:18:43 +0100 (CET)
Received: from localhost ([::1]:52582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFBr7-0002Wd-NF
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 03:18:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lFBpq-00024J-90
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 03:17:22 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lFBpn-0004Y9-2R
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 03:17:21 -0500
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4DmQZj4RqRz5WWk;
 Thu, 25 Feb 2021 16:15:25 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Thu, 25 Feb 2021 16:17:02 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Thu, 25 Feb 2021 16:17:01 +0800
Subject: Re: [PATCH 1/3] migration/ram: Modify the code comment of
 ram_save_host_page()
To: David Edmondson <dme@dme.org>, Juan Quintela <quintela@redhat.com>, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
References: <20210223021646.500-1-jiangkunkun@huawei.com>
 <20210223021646.500-2-jiangkunkun@huawei.com> <cunim6haxhm.fsf@dme.org>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <fad133ed-05ea-b216-c8f2-af211e4041b6@huawei.com>
Date: Thu, 25 Feb 2021 16:16:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <cunim6haxhm.fsf@dme.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme709-chm.china.huawei.com (10.1.199.105) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=jiangkunkun@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com, Keqian
 Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/2/25 6:53, David Edmondson wrote:
> On Tuesday, 2021-02-23 at 10:16:43 +08, Kunkun Jiang wrote:
>
>> The ram_save_host_page() has been modified several times
>> since its birth. But the comment hasn't been modified as it should
>> be. It'd better to modify the comment to explain ram_save_host_page()
>> more clearly.
>>
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
>> ---
>>   migration/ram.c | 17 +++++++++--------
>>   1 file changed, 9 insertions(+), 8 deletions(-)
>>
>> diff --git a/migration/ram.c b/migration/ram.c
>> index 72143da0ac..fc49c3f898 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -1970,15 +1970,16 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,
>>   }
>>   
>>   /**
>> - * ram_save_host_page: save a whole host page
>> + * ram_save_host_page: save a whole host page or the rest of a block
>>    *
>> - * Starting at *offset send pages up to the end of the current host
>> - * page. It's valid for the initial offset to point into the middle of
>> - * a host page in which case the remainder of the hostpage is sent.
>> - * Only dirty target pages are sent. Note that the host page size may
>> - * be a huge page for this block.
>> - * The saving stops at the boundary of the used_length of the block
>> - * if the RAMBlock isn't a multiple of the host page size.
>> + * Starting at pss->page send pages up to the end of the current host
>> + * page or the boundary of used_length of the block (if the RAMBlock
>> + * isn't a multiple of the host page size). The min one is selected.
>> + * Only dirty target pages are sent.
>> + *
>> + * Note that the host page size may be a huge page for this block, it's
>> + * valid for the initial offset to point into the middle of a host page
>> + * in which case the remainder of the hostpage is sent.
> How about:
>
> * Send dirty pages between pss->page and either the end of that page or
> * the used_length of the RAMBlock, whichever is smaller.
> *
> * Note that if the host page is a huge page, pss->page may be in the
> * middle of that page.

Thank you. It looks concise and comprehensive.

Best Regards

Kunkun Jiang

>>    *
>>    * Returns the number of pages written or negative on error
>>    *
>> -- 
>> 2.23.0
> dme.



