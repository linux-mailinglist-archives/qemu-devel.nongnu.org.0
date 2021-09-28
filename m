Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EF441AD74
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 13:00:02 +0200 (CEST)
Received: from localhost ([::1]:47940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVAq9-00031U-0C
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 07:00:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mVAof-0000rE-68; Tue, 28 Sep 2021 06:58:29 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mVAoc-00085h-7K; Tue, 28 Sep 2021 06:58:28 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HJbwX4mmZzRd5k;
 Tue, 28 Sep 2021 18:54:04 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 28 Sep 2021 18:58:21 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Tue, 28 Sep 2021 18:58:20 +0800
Subject: Re: [PATCH 2/2] qemu-options: Add missing "sockets=2" to CLI "-smp 2"
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
References: <20210928093157.14620-1-wangyanan55@huawei.com>
 <20210928093157.14620-3-wangyanan55@huawei.com>
 <9728083c-059c-3990-f651-3fbdce86491c@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <0508934a-f4d5-a7ed-310a-065aa823fb08@huawei.com>
Date: Tue, 28 Sep 2021 18:58:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <9728083c-059c-3990-f651-3fbdce86491c@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme702-chm.china.huawei.com (10.1.199.98) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.562,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: wanghaibin.wang@huawei.com, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/9/28 18:46, Philippe Mathieu-Daudé wrote:
> On 9/28/21 11:31, Yanan Wang wrote:
>> There is one example of -smp CLI in qemu-options.hx currently
>> using "-smp 2" and assuming that there will be 2 sockets.
>> However now the actually calculation logic of missing sockets
>> and cores is not immutable, we should use more explicit CLIs
>> like "-smp 2,sockets=2" if we want multiple sockets.
>>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   qemu-options.hx | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index dcd9595650..ff8917c5e1 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -395,7 +395,7 @@ SRST
>>           -m 2G \
>>           -object memory-backend-ram,size=1G,id=m0 \
>>           -object memory-backend-ram,size=1G,id=m1 \
>> -        -smp 2 \
>> +        -smp 2,sockets=2,maxcpus=2 \
> Is the addition of "maxcpus=2" intentional?
Yes, but it's not necessary IMO. I just wanted to keep consistency
with other numa config examples in the Doc. Should I remove it ?

Thanks,
Yanan
>>           -numa node,nodeid=0,memdev=m0 \
>>           -numa node,nodeid=1,memdev=m1,initiator=0 \
>>           -numa cpu,node-id=0,socket-id=0 \
>>
> .


