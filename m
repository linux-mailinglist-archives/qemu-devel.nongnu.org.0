Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ADA6A5044
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 01:51:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWoBb-0005mV-F3; Mon, 27 Feb 2023 19:49:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pWoBY-0005e2-RL
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 19:49:40 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pWoBV-00044R-8x
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 19:49:39 -0500
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8BxMI+aT_1jBEkGAA--.6277S3;
 Tue, 28 Feb 2023 08:49:30 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bxzr6ZT_1jrBtAAA--.59677S3; 
 Tue, 28 Feb 2023 08:49:29 +0800 (CST)
Subject: Re: [PATCH v1] target/loongarch: Implement Chip Configuraiton Version
 Register(0x0000)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, philmd@linaro.org, maobibo@loongson.cn,
 yangxiaojuan@loongson.cn
References: <20230227071046.1445572-1-gaosong@loongson.cn>
 <72f9cd37-3aa2-d268-629d-11754c7df34d@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <b8336500-ca70-6bc8-80a1-71d7f275b325@loongson.cn>
Date: Tue, 28 Feb 2023 08:49:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <72f9cd37-3aa2-d268-629d-11754c7df34d@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8Bxzr6ZT_1jrBtAAA--.59677S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7tFWUtw4DJr13ury7AFWfAFb_yoW8Jw1kpr
 93CFW5KFW5JFZ2yanrWay5Xr98XrsrJr47WFsFqa4vkrs8Wr92gF1vqrZFgF9rAa97Gr40
 qF1rua45ZF4qq3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bxxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1le2I2
 62IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4
 CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvj
 eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw2
 8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
 x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrw
 CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI
 42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
 80aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUrNtxDUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.089,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


在 2023/2/28 上午3:37, Richard Henderson 写道:
> On 2/26/23 21:10, Song Gao wrote:
>> According to the 3A5000 manual 4.1 implement Chip Configuration
>> Version Register(0x0000). The manual does not state that 0x0018 is
>> reserved for the vendor name and 0x0028 is reserved for the chip name.
>>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>   target/loongarch/cpu.c | 2 ++
>>   target/loongarch/cpu.h | 3 +++
>>   2 files changed, 5 insertions(+)
>>
>> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
>> index 290ab4d526..d1c803c9d6 100644
>> --- a/target/loongarch/cpu.c
>> +++ b/target/loongarch/cpu.c
>> @@ -545,6 +545,8 @@ static void loongarch_qemu_write(void *opaque, 
>> hwaddr addr,
>>   static uint64_t loongarch_qemu_read(void *opaque, hwaddr addr, 
>> unsigned size)
>>   {
>>       switch (addr) {
>> +    case VERSION_REG:
>> +        return 0x11ULL;
>
> This one is back in manual v1.03.
> I can't find manual 4.1?
Oh,   Chapter 4 Section 1.  I will correct it.
>
>> +#define VENDOR_RESERVED_REG     0x18
>> +#define CPUNAME_RESERVED_REG    0x28
>
> Since these are unused, perhaps omit them?
>
OK.

Thanks.
Song Gao
> Either way,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~


