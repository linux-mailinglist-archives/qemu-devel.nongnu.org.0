Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7593BB9D8
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:06:42 +0200 (CEST)
Received: from localhost ([::1]:49434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0KYr-0002x0-Oo
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m0KWX-0008RM-AK
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:04:17 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m0KWU-00079u-7I
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:04:17 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GJKQq6pJmz783X;
 Mon,  5 Jul 2021 17:00:35 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Jul 2021 17:03:55 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 5 Jul 2021 17:03:54 +0800
Subject: Re: [RFC PATCH 5/6] pc/machine: Disallow any configuration of dies
 for non-PC machines
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210702100739.13672-1-wangyanan55@huawei.com>
 <20210702100739.13672-6-wangyanan55@huawei.com> <YN7n+avKTj6Lj5bn@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <be785927-0a7d-7c87-a6ea-4a360c1e7d7b@huawei.com>
Date: Mon, 5 Jul 2021 17:03:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <YN7n+avKTj6Lj5bn@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme711-chm.china.huawei.com (10.1.199.107) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
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
Cc: Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, Igor
 Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com, Paolo
 Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/7/2 18:18, Daniel P. Berrangé wrote:
> On Fri, Jul 02, 2021 at 06:07:38PM +0800, Yanan Wang wrote:
>> Since a machine type does not support topology parameter of dies,
>> it's probably more reasonable to reject any explicit specification
>> to avoid possible confuse, including "dies=0" and "dies=1" although
>> they won't affect the calculation of non-PC machines.
>>
>> Also a comment of struct SMPConfiguration is fixed.
>>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/core/machine.c | 2 +-
>>   qapi/machine.json | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index 58882835be..55785feee2 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -747,7 +747,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>>       unsigned threads = config->has_threads ? config->threads : 0;
>>       unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
>>   
>> -    if (config->has_dies && config->dies != 0 && config->dies != 1) {
>> +    if (config->has_dies) {
>>           error_setg(errp, "dies not supported by this machine's CPU topology");
>>       }
> This will cause a functional regression. Libvirt always specifies
> dies=1 if QEMU supports it.  I don't see a need to reject it,
> since conceptually it is reasonable to say that all existing
> CPUs have a single die. It simply that 99% of CPUs don't support
> more than 1 die.
Ok, I agree. This is a sincere suggestion, but clearly i didn't consider
how Libvirt deals with configuration of dies. I will drop this part and
the single comment fix can be merged into patch #6.
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index c3210ee1fb..253f84abf6 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -1297,7 +1297,7 @@
>>   #
>>   # @dies: number of dies per socket in the CPU topology
>>   #
>> -# @cores: number of cores per thread in the CPU topology
>> +# @cores: number of cores per die in the CPU topology
>>   #
>>   # @threads: number of threads per core in the CPU topology
>>   #
> This is a simple docs fix and ok
>
Thanks,
Yanan
.


