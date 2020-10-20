Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AB528CF0E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 15:22:01 +0200 (CEST)
Received: from localhost ([::1]:42528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSKFc-0004Nt-8j
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 09:22:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yubihong@huawei.com>)
 id 1kSKEF-0003j0-Cj; Tue, 13 Oct 2020 09:20:35 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5178 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yubihong@huawei.com>)
 id 1kSKE9-0008ME-FN; Tue, 13 Oct 2020 09:20:35 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 60D42D6F03B004B82F7B;
 Tue, 13 Oct 2020 21:20:20 +0800 (CST)
Received: from [10.174.186.14] (10.174.186.14) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Tue, 13 Oct 2020 21:20:11 +0800
Subject: Re: [PATCH v2 1/8] migration: Do not use C99 // comments
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1602508140-11372-1-git-send-email-yubihong@huawei.com>
 <1602508140-11372-2-git-send-email-yubihong@huawei.com>
 <20201013093905.GB2920@work-vm>
From: Bihong Yu <yubihong@huawei.com>
Message-ID: <ae6666c0-e68e-3541-274e-de25d4bd3a22@huawei.com>
Date: Tue, 13 Oct 2020 21:20:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201013093905.GB2920@work-vm>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.14]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=yubihong@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 08:34:04
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: zhengchuan@huawei.com, quintela@redhat.com, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thank you for your review. OK, I will try to rewrite the DPRINTF to use trace_ instead.

On 2020/10/13 17:39, Dr. David Alan Gilbert wrote:
> * Bihong Yu (yubihong@huawei.com) wrote:
>> Signed-off-by: Bihong Yu <yubihong@huawei.com>
>> Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> another task at some point would be to rewrite the DPRINTF's in
> migration/block.c to use trace_ instead.
> 
>> ---
>>  migration/block.c | 2 +-
>>  migration/rdma.c  | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/migration/block.c b/migration/block.c
>> index 737b649..4b8576b 100644
>> --- a/migration/block.c
>> +++ b/migration/block.c
>> @@ -40,7 +40,7 @@
>>  #define MAX_IO_BUFFERS 512
>>  #define MAX_PARALLEL_IO 16
>>  
>> -//#define DEBUG_BLK_MIGRATION
>> +/* #define DEBUG_BLK_MIGRATION */
>>  
>>  #ifdef DEBUG_BLK_MIGRATION
>>  #define DPRINTF(fmt, ...) \
>> diff --git a/migration/rdma.c b/migration/rdma.c
>> index 0340841..0eb42b7 100644
>> --- a/migration/rdma.c
>> +++ b/migration/rdma.c
>> @@ -1288,7 +1288,7 @@ const char *print_wrid(int wrid)
>>   * workload information or LRU information is available, do not attempt to use
>>   * this feature except for basic testing.
>>   */
>> -//#define RDMA_UNREGISTRATION_EXAMPLE
>> +/* #define RDMA_UNREGISTRATION_EXAMPLE */
>>  
>>  /*
>>   * Perform a non-optimized memory unregistration after every transfer
>> -- 
>> 1.8.3.1
>>

