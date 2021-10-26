Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E35343B2C4
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 14:58:21 +0200 (CEST)
Received: from localhost ([::1]:40406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfM1z-0003xM-Ex
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 08:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mfLzk-0001fX-0y; Tue, 26 Oct 2021 08:56:00 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mfLzg-0006aL-U8; Tue, 26 Oct 2021 08:55:59 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HdsBm3dTKzbnNr;
 Tue, 26 Oct 2021 20:51:12 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Tue, 26 Oct 2021 20:55:50 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Tue, 26 Oct 2021 20:55:50 +0800
Subject: Re: [PATCH] hw/core/machine: Add the missing delimiter in
 cpu_slot_to_string()
To: Laurent Vivier <laurent@vivier.eu>, <qemu-devel@nongnu.org>
References: <20211008075040.18028-1-wangyanan55@huawei.com>
 <57481b57-13cf-ee9d-b9ef-205b9e3de610@vivier.eu>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <e28ce319-9fba-0e2c-9e62-5783612e14db@huawei.com>
Date: Tue, 26 Oct 2021 20:55:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <57481b57-13cf-ee9d-b9ef-205b9e3de610@vivier.eu>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme707-chm.china.huawei.com (10.1.199.103) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.215,
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 wanghaibin.wang@huawei.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/10/19 16:23, Laurent Vivier wrote:
> Le 08/10/2021 à 09:50, Yanan Wang a écrit :
>> The expected output string from cpu_slot_to_string() ought to be
>> like "socket-id: *, die-id: *, core-id: *, thread-id: *", so add
>> the missing ", " before "die-id". This affects the readability
>> of the error message.
>>
>> Fixes: 176d2cda0d ("i386/cpu: Consolidate die-id validity in smp context")
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/core/machine.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index b8d95eec32..0a23ae3106 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -1157,6 +1157,9 @@ static char *cpu_slot_to_string(const CPUArchId *cpu)
>>           g_string_append_printf(s, "socket-id: %"PRId64, cpu->props.socket_id);
>>       }
>>       if (cpu->props.has_die_id) {
>> +        if (s->len) {
>> +            g_string_append_printf(s, ", ");
>> +        }
>>           g_string_append_printf(s, "die-id: %"PRId64, cpu->props.die_id);
>>       }
>>       if (cpu->props.has_core_id) {
>>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> .
Thanks! Will you take this one in the trivial branch ?

Thanks,
Yanan


