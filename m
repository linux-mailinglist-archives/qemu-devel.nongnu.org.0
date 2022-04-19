Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A9D506827
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 11:59:40 +0200 (CEST)
Received: from localhost ([::1]:40384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngke3-0005AY-Ky
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 05:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1ngjtP-0005tx-Nf; Tue, 19 Apr 2022 05:11:27 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:42110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1ngjtN-0008VD-Gy; Tue, 19 Apr 2022 05:11:27 -0400
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 9BF182077D;
 Tue, 19 Apr 2022 09:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1650359478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ST+lmAisDHRsCUDH1ysmZh88/xICcO+12Uu5E/D4wkQ=;
 b=Ds7q8B9+ecNGd5U9Ywk9QiF7mQeocVOq5uxdc3Op4esudzRf3LqHNJw8IzhjQ69XaRYyp2
 7H02xulzm6oBb76f09cwnMRYqBq+jssl5uoIuhwDDnFPH8XAQ4qB3xNhyroSfawTDK3A99
 4VpG+qaemphypzkG1PXW80D2BN1QhDg=
Message-ID: <ad7c2dc1-9b4b-cd60-840b-075634272e5f@greensocs.com>
Date: Tue, 19 Apr 2022 11:11:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 02/18] hw/cpu/cpus: introduce _cpus_ device
Content-Language: en-US-large
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
 <20220330125639.201937-3-damien.hedde@greensocs.com>
 <2ded9132-c2b5-c428-6554-98c71b50e8bb@gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <2ded9132-c2b5-c428-6554-98c71b50e8bb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 mark.burton@greensocs.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-arm@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Vijai Kumar K <vijai@behindbytes.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/16/22 19:52, Philippe Mathieu-Daudé wrote:
> On 30/3/22 14:56, Damien Hedde wrote:
>> This object will be a _cpu-cluster_ generalization and
>> is meant to allow create cpus of the same type.
>>
>> The main goal is that this object, on contrary to _cpu-cluster-_,
>> can be used to dynamically create cpus: it does not rely on
>> external code to populate the object with cpus.
>>
>> Allowing the user to create a cpu cluster and each _cpu_
>> separately would be hard because of the following reasons:
>> + cpu reset need to be handled
>> + instantiation and realize of cpu-cluster and the cpus
>>    are interleaved
>> + cpu cluster must contains only identical cpus and it seems
>>    difficult to check that at runtime.
>> Therefore we add a new type solving all this constraints.
>>
>> _cpu-cluster_ will be updated to inherit from this class
>> in following commits.
>>
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>> ---
>>   include/hw/cpu/cpus.h |  71 +++++++++++++++++++++++
>>   hw/cpu/cpus.c         | 127 ++++++++++++++++++++++++++++++++++++++++++
>>   hw/cpu/meson.build    |   2 +-
>>   3 files changed, 199 insertions(+), 1 deletion(-)
>>   create mode 100644 include/hw/cpu/cpus.h
>>   create mode 100644 hw/cpu/cpus.c
>>
>> diff --git a/include/hw/cpu/cpus.h b/include/hw/cpu/cpus.h
>> new file mode 100644
>> index 0000000000..c65f568ef8
>> --- /dev/null
>> +++ b/include/hw/cpu/cpus.h
>> @@ -0,0 +1,71 @@
>> +/*
>> + * QEMU CPUs type
>> + *
>> + * Copyright (c) 2022 GreenSocs
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +
>> +#ifndef HW_CPU_CPUS_H
>> +#define HW_CPU_CPUS_H
>> +
>> +#include "qemu/typedefs.h"
>> +#include "hw/qdev-core.h"
>> +#include "qom/object.h"
>> +
>> +/*
>> + * This object represent several CPUs which are all identical.
> 
> Typo "represents".
> 
>> + *
>> + * If CPUs are not identical (for example, Cortex-A53 and Cortex-A57 
>> CPUs in an
>> + * Arm big.LITTLE system) they should be in different groups. If the 
>> CPUs do
>> + * not have the same view of memory (for example the main CPU and a 
>> management
>> + * controller processor) they should be in different groups.
> 
> This description calls for a clearer CpusGroupState name instead
> of CpusState (which confuses me with CPUState). Alternatively
> CpusArrayState.

Your are right, I'll add the "group" suffix.

Thanks,
Damien

