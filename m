Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B34057013BE
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 03:29:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxe3l-0001EA-2d; Fri, 12 May 2023 21:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pxe3j-0001Dz-G5
 for qemu-devel@nongnu.org; Fri, 12 May 2023 21:28:31 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pxe3g-0006uI-CS
 for qemu-devel@nongnu.org; Fri, 12 May 2023 21:28:31 -0400
Received: from loongson.cn (unknown [10.20.42.57])
 by gateway (Coremail) with SMTP id _____8Dxh+m6515kOVsIAA--.14515S3;
 Sat, 13 May 2023 09:28:26 +0800 (CST)
Received: from [10.20.42.57] (unknown [10.20.42.57])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dx87S4515khP1YAA--.25606S3; 
 Sat, 13 May 2023 09:28:25 +0800 (CST)
Subject: Re: [PATCH v2] tests/avocado: Add LoongArch machine start test
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, thuth@redhat.com,
 qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 philmd@linaro.org, pbonzini@redhat.com, alex.bennee@linaro.org,
 maobibo@loongson.cn, yangxiaojuan@loongson.cn, lvivier@redhat.com,
 atar4qemu@gmail.com, edgar.iglesias@gmail.com, wainersm@redhat.com,
 quic_llindhol@quicinc.com, kraxel@redhat.com, deller@gmx.de,
 stefanha@redhat.com, crosa@redhat.com, eduardo@habkost.net,
 quintela@redhat.com, jsnow@redhat.com, ysato@users.sourceforge.jp,
 iii@linux.ibm.com, pavel.dovgaluk@ispras.ru, andrew@aj.id.au,
 kbastian@mail.uni-paderborn.de, bleal@redhat.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, mark.cave-ayland@ilande.co.uk,
 rad@semihalf.com, aurelien@aurel32.net, david@redhat.com, armbru@redhat.com,
 joel@jms.id.au, berrange@redhat.com
References: <20230512063305.1629046-1-gaosong@loongson.cn>
 <526023cc-1469-4d3b-fec9-71ad127c400a@kaod.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <a64c29b6-8509-1b8a-0f46-2cbfa77fcfd4@loongson.cn>
Date: Sat, 13 May 2023 09:28:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <526023cc-1469-4d3b-fec9-71ad127c400a@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8Dx87S4515khP1YAA--.25606S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxCw1xAr48ury5JFWUZF4DCFg_yoW5GFWxpr
 18AF45JrWxJrn7Jr1agw15ZFy5Xr4kG3W7Jr1IqF18CFn8Ar10gr1UXw1vgryDJw48Gr1x
 ZryDXw13ZF1UJrJanT9S1TB71UUUUbDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bqkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
 ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAa
 w2AFwI0_Jw0_GFyle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
 I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2
 jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62
 AI1cAE67vIY487MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCa
 FVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1q6r43MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
 IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41l
 IxAIcVC0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIx
 AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2
 jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jTq2NUUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.845,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



在 2023/5/12 下午7:44, Cédric Le Goater 写道:
> Hello,
>
> On 5/12/23 08:33, Song Gao wrote:
>> Add a new test in tests/avocado to check LoongArch virt machine start.
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>   MAINTAINERS                        |  1 +
>>   tests/avocado/machine_loongarch.py | 68 ++++++++++++++++++++++++++++++
>>   2 files changed, 69 insertions(+)
>>   create mode 100644 tests/avocado/machine_loongarch.py
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index f757369373..4c0d37a1aa 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -245,6 +245,7 @@ M: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>>   S: Maintained
>>   F: target/loongarch/
>>   F: tests/tcg/loongarch64/
>> +F: tests/avocado/machine_loongarch.py
>>     M68K TCG CPUs
>>   M: Laurent Vivier <laurent@vivier.eu>
>> diff --git a/tests/avocado/machine_loongarch.py 
>> b/tests/avocado/machine_loongarch.py
>> new file mode 100644
>> index 0000000000..e8fcb578d7
>> --- /dev/null
>> +++ b/tests/avocado/machine_loongarch.py
>> @@ -0,0 +1,68 @@
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +#
>> +# LoongArch virt test.
>> +#
>> +# Copyright (c) 2023 Loongson Technology Corporation Limited
>> +#
>> +
>> +import os
>> +import tempfile
>> +
>> +from avocado_qemu import QemuSystemTest
>> +from avocado_qemu import exec_command_and_wait_for_pattern
>> +from avocado_qemu import wait_for_console_pattern
>> +
>> +class LoongArchMachine(QemuSystemTest):
>> +    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
>> +
>> +    timeout = 120
>> +
>> +    def wait_for_console_pattern(self, success_message, vm=None):
>> +        wait_for_console_pattern(self, success_message,
>> +                                 failure_message='Kernel panic - not 
>> syncing',
>> +                                 vm=vm)
>> +
>> +    dmesg_clear_count = 1
>> +    def clear_guest_dmesg(self):
>> +        exec_command_and_wait_for_pattern(self, 'dmesg -c > 
>> /dev/null; '
>> +                    'echo dm_clear\ ' + str(self.dmesg_clear_count),
>> +                    'dm_clear ' + str(self.dmesg_clear_count))
>> +        self.dmesg_clear_count += 1
>
> Routine clear_guest_dmesg() doesn't seem to be used anywhere.
>
Clean it on v3.

Thanks.
Song Gao


