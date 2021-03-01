Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C600A327E45
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 13:28:13 +0100 (CET)
Received: from localhost ([::1]:58256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGhem-0005sd-PC
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 07:28:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1lGhd0-0004IS-N8
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 07:26:22 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1lGhcy-0001TE-MY
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 07:26:22 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Dpzvp1x3rzlR1w;
 Mon,  1 Mar 2021 20:24:06 +0800 (CST)
Received: from [10.174.186.51] (10.174.186.51) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Mon, 1 Mar 2021 20:26:04 +0800
From: Zheng Chuan <zhengchuan@huawei.com>
Subject: Re: [PATCH v4 06/18] migration/rdma: export
 MultiFDSendParams/MultiFDRecvParams
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
 <1612339311-114805-7-git-send-email-zhengchuan@huawei.com>
 <20210203182307.GQ2950@work-vm>
Message-ID: <cfd1ce99-f7e6-9f44-f0fc-1a38781274be@huawei.com>
Date: Mon, 1 Mar 2021 20:26:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20210203182307.GQ2950@work-vm>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.51]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhengchuan@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: yubihong@huawei.com, berrange@redhat.com, zhang.zhanghailiang@huawei.com,
 quintela@redhat.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2021/2/4 2:23, Dr. David Alan Gilbert wrote:
> * Chuan Zheng (zhengchuan@huawei.com) wrote:
>> MultiFDSendParams and MultiFDRecvParams is need for rdma, export it
>>
>> Signed-off-by: Zhimin Feng <fengzhimin1@huawei.com>
>> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
> 
> I think these become simpler if you just return a NULL on error,
> also I think you can make 'id' unsigned and then you don't have
> to worry about it being negative.
> 
Yes, that's a good point, I will do that in v5.

> Also, please make it start with multifd_ so we know where it's coming
> from; so:
> 
> MultiFDSendParams *multifd_send_param_get(unsigned channel);
> 
> Dave

OK, will do that in next version.

>> ---
>>  migration/multifd.c | 26 ++++++++++++++++++++++++++
>>  migration/multifd.h |  2 ++
>>  2 files changed, 28 insertions(+)
>>
>> diff --git a/migration/multifd.c b/migration/multifd.c
>> index 5d34950..ae0b7f0 100644
>> --- a/migration/multifd.c
>> +++ b/migration/multifd.c
>> @@ -390,6 +390,19 @@ struct {
>>      MultiFDSetup *setup_ops;
>>  } *multifd_send_state;
>>  
>> +int get_multifd_send_param(int id, MultiFDSendParams **param)
>> +{
>> +    int ret = 0;
>> +
>> +    if (id < 0 || id >= migrate_multifd_channels()) {
>> +        ret = -1;
>> +    } else {
>> +        *param = &(multifd_send_state->params[id]);
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>>  /*
>>   * How we use multifd_send_state->pages and channel->pages?
>>   *
>> @@ -934,6 +947,19 @@ struct {
>>      MultiFDSetup *setup_ops;
>>  } *multifd_recv_state;
>>  
>> +int get_multifd_recv_param(int id, MultiFDRecvParams **param)
>> +{
>> +    int ret = 0;
>> +
>> +    if (id < 0 || id >= migrate_multifd_channels()) {
>> +        ret = -1;
>> +    } else {
>> +        *param = &(multifd_recv_state->params[id]);
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>>  static void multifd_recv_terminate_threads(Error *err)
>>  {
>>      int i;
>> diff --git a/migration/multifd.h b/migration/multifd.h
>> index e3ab4b0..d57756c 100644
>> --- a/migration/multifd.h
>> +++ b/migration/multifd.h
>> @@ -176,6 +176,8 @@ typedef struct {
>>  #ifdef CONFIG_RDMA
>>  extern MultiFDSetup multifd_rdma_ops;
>>  #endif
>> +int get_multifd_send_param(int id, MultiFDSendParams **param);
>> +int get_multifd_recv_param(int id, MultiFDRecvParams **param);
>>  MultiFDSetup *multifd_setup_ops_init(void);
>>  
>>  void multifd_register_ops(int method, MultiFDMethods *ops);
>> -- 
>> 1.8.3.1
>>

-- 
Regards.
Chuan

