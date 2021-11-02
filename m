Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEB0443159
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 16:14:23 +0100 (CET)
Received: from localhost ([::1]:35842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhvUU-0003yF-2X
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 11:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1mhvHl-0005TC-Cm; Tue, 02 Nov 2021 11:01:13 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:36828 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1mhvHd-0003rX-CB; Tue, 02 Nov 2021 11:01:12 -0400
Received: from [192.168.0.103] (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowABnb2ekUoFh5XLgBQ--.32524S2;
 Tue, 02 Nov 2021 23:00:52 +0800 (CST)
Subject: Re: [RFC 1/6] target/riscv: rvk: add flag support for Zbk[bcx]
To: Richard Henderson <richard.henderson@linaro.org>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20211102031128.17296-1-liweiwei@iscas.ac.cn>
 <20211102031128.17296-2-liweiwei@iscas.ac.cn>
 <97624133-30f2-fdc4-4f3c-0cc843f0768c@linaro.org>
From: liweiwei <liweiwei@iscas.ac.cn>
Message-ID: <b36ceb2c-1b75-c310-f9f5-177ab7ac4d2a@iscas.ac.cn>
Date: Tue, 2 Nov 2021 23:00:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <97624133-30f2-fdc4-4f3c-0cc843f0768c@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: rQCowABnb2ekUoFh5XLgBQ--.32524S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tr17uF4UXFyxGr4rXrW8WFg_yoW8urWrpr
 1kJrWUAryDJr18Jr4UJr1UJry8Jr18J3WUJw1UJF1UJr4UJr12qr1UWr1qgr4UJr48Xr15
 Jr1UJr1DZrnrJrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBI14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
 c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x
 0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
 7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
 C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
 04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aV
 CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUj0JPtUUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.549,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, luruibo2000@163.com,
 lustrew@foxmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/11/2 下午10:18, Richard Henderson 写道:
> On 11/1/21 11:11 PM, liweiwei wrote:
>> +++ b/target/riscv/cpu.c
>> @@ -472,15 +472,15 @@ static void riscv_cpu_realize(DeviceState *dev, 
>> Error **errp)
>>               error_setg(errp,
>>                          "I and E extensions are incompatible");
>>                          return;
>> -       }
>> +        }
>>             if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
>>               error_setg(errp,
>>                          "Either I or E extension must be set");
>>                          return;
>> -       }
>> +        }
>>   -       if (cpu->cfg.ext_g && !(cpu->cfg.ext_i & cpu->cfg.ext_m &
>> +        if (cpu->cfg.ext_g && !(cpu->cfg.ext_i & cpu->cfg.ext_m &
>>                                  cpu->cfg.ext_a & cpu->cfg.ext_f &
>>                                  cpu->cfg.ext_d)) {
>>               warn_report("Setting G will also set IMAFD");
>
> This re-indentation should not be happening.
>
Thanks for your comments. I'll restore them later. By the way, the 
reason I changed these is that they don't align with other code.
>> +    DEFINE_PROP_BOOL("x-zbkb", RISCVCPU, cfg.ext_zbkb, false),
>> +    DEFINE_PROP_BOOL("x-zbkc", RISCVCPU, cfg.ext_zbkc, false),
>> +    DEFINE_PROP_BOOL("x-zbkx", RISCVCPU, cfg.ext_zbkx, false),
>
> The properties cannot be exposed until the end.
>
Ok. I'll move these to the end of the patchset.
>>          bool ext_zbb;
>>          bool ext_zbc;
>>          bool ext_zbs;
>> +        bool ext_zbkb;
>> +        bool ext_zbkc;
>> +        bool ext_zbkx;
>
> Better to keep them alphabetical: zbk* < zbs.
>
Ok. I'll move them before zbs.
>
> r~


