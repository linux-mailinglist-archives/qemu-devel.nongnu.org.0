Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D5541ADB5
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 13:18:20 +0200 (CEST)
Received: from localhost ([::1]:45602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVB7r-0005sp-Az
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 07:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mVB5L-0004Vh-Cy; Tue, 28 Sep 2021 07:15:43 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mVB5I-0004TX-Jc; Tue, 28 Sep 2021 07:15:43 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HJcJQ3P0TzbmrM;
 Tue, 28 Sep 2021 19:11:18 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 28 Sep 2021 19:15:27 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Tue, 28 Sep 2021 19:15:26 +0800
Subject: Re: [PATCH v11 01/14] machine: Deprecate "parameter=0" SMP
 configurations
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-2-wangyanan55@huawei.com> <YVLnTsJE2a9wlckS@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <92c33829-d7c7-d2ed-45b2-6561876bd437@huawei.com>
Date: Tue, 28 Sep 2021 19:15:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <YVLnTsJE2a9wlckS@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme715-chm.china.huawei.com (10.1.199.111) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/9/28 17:58, Daniel P. Berrangé wrote:
> On Tue, Sep 28, 2021 at 11:57:42AM +0800, Yanan Wang wrote:
>> In the SMP configuration, we should either provide a topology
>> parameter with a reasonable value (greater than zero) or just
>> omit it and QEMU will compute the missing value.
>>
>> The users shouldn't provide a configuration with any parameter
>> of it specified as zero (e.g. -smp 8,sockets=0) which could
>> possibly cause unexpected results in the -smp parsing. So we
>> deprecate this kind of configurations since 6.2 by adding the
>> explicit sanity check.
>>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>>   docs/about/deprecated.rst | 15 +++++++++++++++
>>   hw/core/machine.c         | 14 ++++++++++++++
>>   qapi/machine.json         |  2 +-
>>   qemu-options.hx           | 12 +++++++-----
>>   4 files changed, 37 insertions(+), 6 deletions(-)
>>
>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>> index 3c2be84d80..97415dbecd 100644
>> --- a/docs/about/deprecated.rst
>> +++ b/docs/about/deprecated.rst
>> @@ -160,6 +160,21 @@ Use ``-display sdl`` instead.
>>   
>>   Use ``-display curses`` instead.
>>   
>> +``-smp`` ("parameter=0" SMP configurations) (since 6.2)
>> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''
>> +
>> +Specified CPU topology parameters must be greater than zero.
>> +
>> +In the SMP configuration, users should either provide a CPU topology
>> +parameter with a reasonable value (greater than zero) or just omit it
>> +and QEMU will compute the missing value.
>> +
>> +However, historically it was implicitly allowed for users to provide
>> +a parameter with zero value, which is meaningless and could also possibly
>> +cause unexpected results in the -smp parsing. So support for this kind of
>> +configurations (e.g. -smp 8,sockets=0) is deprecated since 6.2 and will
>> +be removed in the near future, users have to ensure that all the topology
>> +members described with -smp are greater than zero.
>>   
>>   Plugin argument passing through ``arg=<string>`` (since 6.1)
>>   ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index 067f42b528..711e83db54 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -835,6 +835,20 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
>>           return;
>>       }
>>   
>> +    /*
>> +     * Specified CPU topology parameters must be greater than zero,
>> +     * explicit configuration like "cpus=0" is not allowed.
>> +     */
>> +    if ((config->has_cpus && config->cpus == 0) ||
>> +        (config->has_sockets && config->sockets == 0) ||
>> +        (config->has_dies && config->dies == 0) ||
>> +        (config->has_cores && config->cores == 0) ||
>> +        (config->has_threads && config->threads == 0) ||
>> +        (config->has_maxcpus && config->maxcpus == 0)) {
>> +        warn_report("Invalid CPU topology deprecated: "
>> +                    "CPU topology parameters must be greater than zero");
>> +    }
>> +
>>       mc->smp_parse(ms, config, errp);
>>       if (*errp) {
>>           goto out_free;
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index 32d47f4e35..227e75d8af 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -1331,7 +1331,7 @@
>>   #
>>   # @dies: number of dies per socket in the CPU topology
>>   #
>> -# @cores: number of cores per thread in the CPU topology
>> +# @cores: number of cores per die in the CPU topology
>>   #
>>   # @threads: number of threads per core in the CPU topology
>>   #
> This change is unrelated to the rest of this commit.
>
> It just looks like a simple bug fix and should just be
> spun out into its own patch.
>
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 8f603cc7e6..91d859aa29 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -227,11 +227,13 @@ SRST
>>       of computing the CPU maximum count.
>>   
>>       Either the initial CPU count, or at least one of the topology parameters
>> -    must be specified. Values for any omitted parameters will be computed
>> -    from those which are given. Historically preference was given to the
>> -    coarsest topology parameters when computing missing values (ie sockets
>> -    preferred over cores, which were preferred over threads), however, this
>> -    behaviour is considered liable to change.
>> +    must be specified. The specified parameters must be greater than zero,
>> +    explicit configuration like "cpus=0" is not allowed. Values for any
>> +    omitted parameters will be computed from those which are given.
>> +    Historically preference was given to the coarsest topology parameters
>> +    when computing missing values (ie sockets preferred over cores, which
>> +    were preferred over threads), however, this behaviour is considered
>> +    liable to change.
>>   ERST
>>   
>>   DEF("numa", HAS_ARG, QEMU_OPTION_numa,
> If you split the docs fix out into its own patch then you can add
Ok, I will split it out. Thanks for the review of this series.

Thanks,
Yanan
>
>    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>
> to both this patch and the new patch.
>
> Regards,
> Daniel


