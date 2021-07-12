Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0027E3C5C12
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 14:25:06 +0200 (CEST)
Received: from localhost ([::1]:46840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2uzi-0002zI-1E
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 08:25:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m2uyR-0002Cg-S4
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:23:47 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m2uyP-0006EE-5f
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:23:47 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4GNjTM18Mfz1CHyY;
 Mon, 12 Jul 2021 20:17:59 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 12 Jul 2021 20:23:34 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 12 Jul 2021 20:23:33 +0800
Subject: Re: [PATCH 2/4] qemu-options: re-arrange CPU topology options
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20210628113047.462498-1-berrange@redhat.com>
 <20210628113047.462498-3-berrange@redhat.com> <YOwVMUkX948MrNxC@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <8bde35cc-85cb-e36b-3d04-ef602edd8d15@huawei.com>
Date: Mon, 12 Jul 2021 20:23:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <YOwVMUkX948MrNxC@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme716-chm.china.huawei.com (10.1.199.112) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.479,
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
Cc: Igor Mammedov <imammedo@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/7/12 18:10, Daniel P. Berrangé wrote:
> On Mon, Jun 28, 2021 at 12:30:45PM +0100, Daniel P. Berrangé wrote:
>> The list of CPU topology options are presented in a fairly arbitrary
>> order currently. Re-arrange them so that they're ordered from largest to
>> smallest unit
>>
>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>> ---
>>   qemu-options.hx | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index ba3ca9da1d..aa33dfdcfd 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -196,17 +196,17 @@ SRST
>>   ERST
>>   
>>   DEF("smp", HAS_ARG, QEMU_OPTION_smp,
>> -    "-smp [cpus=]n[,maxcpus=cpus][,cores=cores][,threads=threads][,dies=dies][,sockets=sockets]\n"
>> +    "-smp [cpus=]n[,maxcpus=cpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]\n"
>>       "                set the number of CPUs to 'n' [default=1]\n"
>>       "                maxcpus= maximum number of total cpus, including\n"
>>       "                offline CPUs for hotplug, etc\n"
>> +    "                sockets= number of discrete sockets in the system\n",
>> +    "                dies= number of CPU dies on one socket (for PC only)\n"
>>       "                cores= number of CPU cores on one socket (for PC, it's on one die)\n"
>>       "                threads= number of threads on one CPU core\n"
>> -    "                dies= number of CPU dies on one socket (for PC only)\n"
>> -    "                sockets= number of discrete sockets in the system\n",
>>           QEMU_ARCH_ALL)
> Stupid typo in this posting - didn't adjust the trailing ',' when moving
> the lines.
I can fix it incidentally in [1] if you wish. :)

[1] https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg00259.html

Thanks,
Yanan
.
>>   SRST
>> -``-smp [cpus=]n[,cores=cores][,threads=threads][,dies=dies][,sockets=sockets][,maxcpus=maxcpus]``
>> +``-smp [cpus=]n[,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]``
>>       Simulate an SMP system with n CPUs. On the PC target, up to 255 CPUs
>>       are supported. On Sparc32 target, Linux limits the number of usable
>>       CPUs to 4. For the PC target, the number of cores per die, the
>> -- 
>> 2.31.1
>>
> Regards,
> Daniel


