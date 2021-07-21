Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 531FA3D0EDE
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 14:39:58 +0200 (CEST)
Received: from localhost ([::1]:55492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6BW1-0003Hj-DT
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 08:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6BRQ-0006wx-9Q
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 08:35:14 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6BRM-0001CH-Bd
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 08:35:11 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4GVFJF3H0Bz1CM2T;
 Wed, 21 Jul 2021 20:29:17 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 21 Jul 2021 20:35:04 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 21 Jul 2021 20:35:03 +0800
Subject: Re: [PATCH for-6.2 v2 01/11] machine: Disallow specifying topology
 parameters as zero
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-2-wangyanan55@huawei.com> <YPWsThPiZa3mF+zp@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <62331552-7125-411f-8f70-1040ffad6805@huawei.com>
Date: Wed, 21 Jul 2021 20:35:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <YPWsThPiZa3mF+zp@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme709-chm.china.huawei.com (10.1.199.105) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.117,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/7/20 0:46, Daniel P. Berrangé wrote:
> On Mon, Jul 19, 2021 at 11:20:33AM +0800, Yanan Wang wrote:
>> In the SMP configuration, we should either specify a topology
>> parameter with a reasonable value (equal to or greater than 1)
>> or just leave it omitted and QEMU will calculate its value.
>>
>> Configurations which explicitly specify the topology parameters
>> as zero like "sockets=0" are meaningless, so disallow them.
>>
>> Suggested-by: Andrew Jones <drjones@redhat.com>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/core/machine.c | 31 +++++++++++++++++++++++--------
>>   hw/i386/pc.c      | 29 +++++++++++++++++++++--------
>>   qapi/machine.json |  4 ++--
>>   3 files changed, 46 insertions(+), 18 deletions(-)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index 775add0795..d73daa10f4 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -745,11 +745,25 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>>   {
>>       unsigned cpus    = config->has_cpus ? config->cpus : 0;
>>       unsigned sockets = config->has_sockets ? config->sockets : 0;
>> +    unsigned dies    = config->has_dies ? config->dies : 1;
> It looks odd to set dies=1 by default at initially, when everything
> else is set to 0.  I realize you're just copying existing pc_smp_parse
> code in this respect, but I feel like could benefit from a separate
> initialization with a comment to explain why we're hardcoding it
> to 1....
>
>>       unsigned cores   = config->has_cores ? config->cores : 0;
>>       unsigned threads = config->has_threads ? config->threads : 0;
>> +    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
>> +
>> +    if ((config->has_cpus && config->cpus == 0) ||
>> +        (config->has_sockets && config->sockets == 0) ||
>> +        (config->has_dies && config->dies == 0) ||
>> +        (config->has_cores && config->cores == 0) ||
>> +        (config->has_threads && config->threads == 0) ||
>> +        (config->has_maxcpus && config->maxcpus == 0)) {
>> +        error_setg(errp, "parameters must be equal to or greater than one"
>> +                   "if provided");
>> +        return;
>> +    }
>>   
>> -    if (config->has_dies && config->dies != 0 && config->dies != 1) {
>> +    if (dies > 1) {
>>           error_setg(errp, "dies not supported by this machine's CPU topology");
>> +        return;
>>       }
> .... eg how about here adding
>
>       /* Never try to assign multiple dies when defaulting omitted topology */
>       if (dies == 0) {
>           dies = 1;
>       }
Yeah, I agree to default dies to 0 like the other parameters at initially
and then explicitly assign it to 1 if omitted here. But I think this 
explicit
assignment should be in pc_smp_parse, because dies is never used in
the calculation in smp_parse yet except the front sanity-check.

So I think what should be updated for this patch is:
1) default dies to 0 at initially both in smp_parse and pc_smp_parse
2) then explicitly assign dies to 1 if it's omitted in pc_smp_parse
>
>
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index c3210ee1fb..c11b2e6f73 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -1288,8 +1288,8 @@
>>   ##
>>   # @SMPConfiguration:
>>   #
>> -# Schema for CPU topology configuration.  "0" or a missing value lets
>> -# QEMU figure out a suitable value based on the ones that are provided.
>> +# Schema for CPU topology configuration. A missing value lets QEMU
>> +# figure out a suitable value based on the ones that are provided.
> Hmm, so we had actually documented that '0' had the same semantics
> as omitting a parameter. This was done in:
>
>    commit 1e63fe685804dfadddd643bf3860b1a59702d4bf
>    Author: Paolo Bonzini <pbonzini@redhat.com>
>    Date:   Thu Jun 17 17:53:06 2021 +0200
>
>      machine: pass QAPI struct to mc->smp_parse
>
> which hasn't been released yet.
>
> This was possible, but never documented, with the traditiaonl -smp
> impl before it was qapi-ified. I think that historical behaviour
> was simply a side effect of the QemuOpts impl rather than an
> intentional design, hence not documented.
Agreed.
> At the very least I think need to get rid of this bit of docs about
> "0" before this release, otherwise we'll have stronger need to
> consider a real deprecation process.
If the doc needs to be fixed right now, then I think we'd better resend this
single patch separately for 6.1, including the doc fix and also the related
sanity-check in the parsers. Right?

Thanks,
Yanan
.

