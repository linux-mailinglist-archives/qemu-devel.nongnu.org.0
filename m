Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C7D330B4F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 11:35:54 +0100 (CET)
Received: from localhost ([::1]:34012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJDEv-0006WM-Ma
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 05:35:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lJDDU-0005jC-G7
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 05:34:24 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:2733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lJDDO-0007pP-Hy
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 05:34:24 -0500
Received: from DGGEMM402-HUB.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4DvF4S2vw4z142q2;
 Mon,  8 Mar 2021 18:31:20 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEMM402-HUB.china.huawei.com (10.3.20.210) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Mon, 8 Mar 2021 18:34:10 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Mon, 8 Mar 2021 18:34:09 +0800
Subject: Re: [PATCH v3 1/3] migration/ram: Modify the code comment of
 ram_save_host_page()
To: Peter Xu <peterx@redhat.com>
References: <20210305075035.1852-1-jiangkunkun@huawei.com>
 <20210305075035.1852-2-jiangkunkun@huawei.com>
 <20210305135923.GD397383@xz-x1>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <d83522c5-a65c-d473-5759-de4a247388dc@huawei.com>
Date: Mon, 8 Mar 2021 18:33:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210305135923.GD397383@xz-x1>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme707-chm.china.huawei.com (10.1.199.103) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=jiangkunkun@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Juan Quintela <quintela@redhat.com>, David Edmondson <dme@dme.org>, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Alexey Romko <nevilad@yahoo.com>, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Peter

On 2021/3/5 21:59, Peter Xu wrote:
> On Fri, Mar 05, 2021 at 03:50:33PM +0800, Kunkun Jiang wrote:
>> The ram_save_host_page() has been modified several times
>> since its birth. But the comment hasn't been modified as it should
>> be. It'd better to modify the comment to explain ram_save_host_page()
>> more clearly.
>>
>> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
>> ---
>>   migration/ram.c | 16 +++++++---------
>>   1 file changed, 7 insertions(+), 9 deletions(-)
>>
>> diff --git a/migration/ram.c b/migration/ram.c
>> index 72143da0ac..a168da5cdd 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -1970,15 +1970,13 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,
>>   }
>>   
>>   /**
>> - * ram_save_host_page: save a whole host page
>> + * ram_save_host_page: save a whole host page or the rest of a RAMBlock
>>    *
>> - * Starting at *offset send pages up to the end of the current host
>> - * page. It's valid for the initial offset to point into the middle of
>> - * a host page in which case the remainder of the hostpage is sent.
>> - * Only dirty target pages are sent. Note that the host page size may
>> - * be a huge page for this block.
>> - * The saving stops at the boundary of the used_length of the block
>> - * if the RAMBlock isn't a multiple of the host page size.
>> + * Send dirty pages between pss->page and either the end of that page
>> + * or the used_length of the RAMBlock, whichever is smaller.
>> + *
>> + * Note that if the host page is a huge page, pss->page may be in the
>> + * middle of that page.
> It reads more like a shorter version of original comment..  Could you point out
> what's the major difference?  Since the original comment looks still good to me.
Sorry for late reply.
The reason I want to modify the comment is that I think some parts of 
the comment
don't match the code. (1) The brief description of ram_save_host_page() 
missed a
situation that ram_save_host_page() will send dirty pages between 
pass->page and
the used_length of the block, if the RAMBlock isn't a multiple of the 
host page
size. (2) '*offset' should be replaced with pss->page.

So taking the chance of optimizing ram_save_host_page(), I modified the 
comment.
This version comment is suggested by @David Edmondson. Compared with the 
original
comment, I think it looks concise.
>>    *
>>    * Returns the number of pages written or negative on error
>>    *
>> @@ -2002,7 +2000,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>>       }
>>   
>>       do {
>> -        /* Check the pages is dirty and if it is send it */
>> +        /* Check if the page is dirty and send it if it is */
> This line fixes some English issues, it seems.  Looks okay, but normally I
> won't change it unless the wording was too weird, so as to keep the git record
> or the original lines.  Here the original looks still okay, no strong opinion.
>
> Thanks,
Yes, the original reads weird to me. Same reason as above, I modified 
this line.

If you think there is no need to modify the original commit, I do not 
insist on
changing it.😁

Thanks,
Kunkun Jiang
>>           if (!migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
>>               pss->page++;
>>               continue;
>> -- 
>> 2.23.0
>>


