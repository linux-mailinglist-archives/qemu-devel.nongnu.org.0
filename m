Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4091538851F
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 05:09:18 +0200 (CEST)
Received: from localhost ([::1]:47716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljCaC-0003v0-Gf
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 23:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1ljCZO-0003ET-C5
 for qemu-devel@nongnu.org; Tue, 18 May 2021 23:08:26 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44634 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1ljCZM-0006qc-3N
 for qemu-devel@nongnu.org; Tue, 18 May 2021 23:08:26 -0400
Received: from localhost.localdomain (unknown [10.20.42.60])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxwOIggaRgIFAAAA--.1813S3;
 Wed, 19 May 2021 11:08:16 +0800 (CST)
Subject: Re: [PATCH] fw_cfg: Set the max fw_cfg mem read size to 8 bytes
To: Laszlo Ersek <lersek@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <1621341794-1041-1-git-send-email-yangxiaojuan@loongson.cn>
 <7e258317-2027-6c0f-1953-675f3aa1ee0c@redhat.com>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <f272c1d2-a88e-b6af-94b9-c38618991d15@loongson.cn>
Date: Wed, 19 May 2021 11:08:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <7e258317-2027-6c0f-1953-675f3aa1ee0c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9BxwOIggaRgIFAAAA--.1813S3
X-Coremail-Antispam: 1UD129KBjvJXoW7CrWxCw45AF4rtrW7uw15urg_yoW8ur13pF
 97u3WUCFWktr4DCF42g3y7Xa4rZ39rGr1UKa17tF1v9rn0krWkJFyjvasak3yUXrn7JF1j
 9w1kWry5X3Z0yFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvFb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
 vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
 Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJV
 W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG
 8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
 Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r12
 6r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
 kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAF
 wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj
 xU29YwUUUUU
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,Laszlo

Thanks for your kindly reply.This is my first time to submit
code to the community. I spent some time learning how to configure
the email and reply.

Yes you are right, fw_cfg_init_mem_wide can solve my problem.
I just want to access 8 bytes width.I did not look at the code
carefully.I am so sorry. My patch can be abandoned.

I am from loongson. We want to add a new board support to
the community.Later we will submit more code.

thanks
Xiaojuan Yang


On 5/18/21 11:49 PM, Laszlo Ersek wrote:
> On 05/18/21 14:43, Xiaojuan Yang wrote:
>> From: yangxiaojuan <yangxiaojuan@loongson.cn>
>>
>> fw_cfg_data_read() func supports access widths from
>> 1 to 8 bytes while the ops set the wrong read size.
>>
>> Most arch use 8 bytes to send ram_size to bios.
>>
>> Signed-off-by: yangxiaojuan <yangxiaojuan@loongson.cn>
>> ---
>>  hw/nvram/fw_cfg.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
>> index 9b8dcca4ea..242614152c 100644
>> --- a/hw/nvram/fw_cfg.c
>> +++ b/hw/nvram/fw_cfg.c
>> @@ -540,7 +540,7 @@ static const MemoryRegionOps fw_cfg_data_mem_ops = {
>>      .endianness = DEVICE_BIG_ENDIAN,
>>      .valid = {
>>          .min_access_size = 1,
>> -        .max_access_size = 1,
>> +        .max_access_size = 8,
>>          .accepts = fw_cfg_data_mem_valid,
>>      },
>>  };
>>
> 
> This patch conflicts with (adjacent) commits
> 
> - cfaadf0e89e7 ("fw_cfg_mem: introduce the "data_width" property",
> 2014-12-22) and
> 
> - 6c87e3d5967a ("fw_cfg_mem: expose the "data_width" property with
> fw_cfg_init_mem_wide()", 2014-12-22)
> 
> Your board code is supposed to call the fw_cfg_init_mem_wide() function,
> for setting the maximum access width.
> 
> In fact, I see a call to fw_cfg_init_mem_wide() in
> "hw/mips/loongson3_virt.c" already, from commit c76b409fef19 ("hw/mips:
> Add Loongson-3 machine support", 2021-01-04). (I'm only highlighting
> this board because your email address is from domain "loongson.cn".)
> 
> What is the actual problem you're trying to solve?
> 
> Thanks
> Laszlo
> 


