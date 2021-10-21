Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 280D44358F1
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 05:24:05 +0200 (CEST)
Received: from localhost ([::1]:50250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdOgV-00060u-Fb
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 23:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mdOe9-0005Gw-Rb; Wed, 20 Oct 2021 23:21:37 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33166 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>)
 id 1mdOe6-000354-NM; Wed, 20 Oct 2021 23:21:37 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxdeWs3HBhqdAdAA--.55824S3; 
 Thu, 21 Oct 2021 11:21:17 +0800 (CST)
Subject: Re: [PATCH v7 02/21] target/loongarch: Add core definition
To: Richard Henderson <richard.henderson@linaro.org>,
 WANG Xuerui <i.qemu@xen0n.name>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-devel@nongnu.org, karl@freefriends.org
References: <1634561247-25499-1-git-send-email-gaosong@loongson.cn>
 <1634561247-25499-3-git-send-email-gaosong@loongson.cn>
 <5d8d1719-c6f3-1de5-b086-298e8379d8b6@xen0n.name>
 <274b9066-66c1-b246-72c6-35d6791cba0e@amsat.org>
 <aa983155-85ed-f3e3-47b2-b7138125e8d0@loongson.cn>
 <74bbac65-2cd4-dac7-86d1-e18cfa3f3f1f@xen0n.name>
 <da597248-8e06-2f14-b39e-67c457aa5a71@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <49d356da-30dd-6460-73fa-8a9e165a9091@loongson.cn>
Date: Thu, 21 Oct 2021 11:21:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <da597248-8e06-2f14-b39e-67c457aa5a71@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxdeWs3HBhqdAdAA--.55824S3
X-Coremail-Antispam: 1UD129KBjvJXoWxArW8JryxGry8ZF4ftr4fZrb_yoWrZF1rp3
 4ftFW2qrWDtrn7A392gw18Zr90krs7J3WDWFnYq3WkA39Fyry2gw1SgFs0gFyxJws29w15
 ZFW0gF9xur98A3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBv1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2
 z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4
 CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
 Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwI
 xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7I2V7IY
 0VAS07AlzVAYIcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaV
 Av8VW5Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
 0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMI
 IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
 0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.267,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, qemu-devel-owner@nongnu.org,
 yangxiaojuan@loongson.cn, peterx@redhat.com, laurent@vivier.eu,
 alistair.francis@wdc.com, maobibo@loongson.cn, pbonzini@redhat.com,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, all

On 10/20/2021 09:56 PM, Richard Henderson wrote:
> On 10/20/21 5:00 AM, WANG Xuerui wrote:
>> On 2021/10/20 16:54, Song Gao wrote:
>>
>>> On 10/19/2021 01:38 AM, Philippe Mathieu-Daudé wrote:
>>>> On 10/18/21 18:06, WANG Xuerui wrote:
>>>>
>>>> On 10/18/21 20:47, Song Gao wrote:
>>>>>> +static void set_loongarch_cpucfg(CPULoongArchState *env)
>>>>>> +{
>>>>>> +    int i;
>>>>>> +
>>>>>> +    for (i = 0; i < 49; i++) {
>>>>>> +        env->cpucfg[i] = 0x0;
>>>>>> +    }
>>>>>> +    env->cpucfg[0] = 0x14c010;
>>>>>> +    env->cpucfg[1] = 0x3f2f2fe;
>>>>>> +    env->cpucfg[2] = 0x60c3cf;
>>>>>> +    env->cpucfg[3] = 0xcff;
>>>>>> +    env->cpucfg[4] = 0x5f5e100;
>>>>>> +    env->cpucfg[5] = 0x10001;
>>>>>> +    env->cpucfg[16] = 0x2c3d;
>>>>>> +    env->cpucfg[17] = 0x6080003;
>>>>>> +    env->cpucfg[18] = 0x6080003;
>>>>>> +    env->cpucfg[19] = 0x60800f;
>>>>>> +    env->cpucfg[20] = 0x60f000f;
>>>>> I know these values are taken from a real 3A5000 chip, since I have such
>>>>> a machine and I've done the experiment, but others likely wouldn't
>>>>> notice so quickly. Maybe put some comment on top of this function to
>>>>> illustrate this?
>>>> Simpler: ...
>>>>
>>> On linux-user emulation. We don't care about the value of cpucfg[i].
>>> I think we only need to set cpucfg[i] to 0. and set value on system emulations, is that better?
>>
>> I'm afraid that wouldn't be better; actually it would be *wrong* to just
>> return zeroes for user-space CPUCFG accesses. CPUCFG is designed to
>> provide runtime feature probing like CPUID, and is usable from
>> user-space. So, one can only assume this data is being used, and
>> properly return data.
>>
>> I've heard that kernel could choose to not actually enable all features
>> for which CPUCFG indicate support, while not configuring CPUCFG values
>> to reflect that, thus making CPUCFG values unreliable; that's not a
>> proper reason to return zeroes. Kernel should be fixed to properly
>> configure CPUCFG instead. Because otherwise you wouldn't make such an
>> instruction an unprivileged one in the first place...
> 
> In the meantime, I think you really need to filter these values to those you have implemented.  E.g. cpucfg[2].LASX here indicates support for the 256-bit vector extension.  Similarly the COMPLEX and CRYPTO extensions.
> 
> I think you would do well to add some FIELD definitions so that these can be set symbolically.
>
OK.


BTW,   

Account yangxiaojuan@loongson.cn It seems that she has been blacklisted. Xiaojuan sent 31 e-mails, which were not displayed since the 21st one, people who don't have a CC can't read all the emails,  and xiaojuan reply can't be in qemu-level@nongnu.org. 
  

The follow is the return message:

抱歉，您的邮件被退回来了……/
Sorry, your mail is returned...
原邮件信息/
Original e-mail message : 	 
时间/Time : 	2021-10-20 09:33:59
主题/Subject : 	Re: Re: [PATCH 00/31] Add Loongarch softmmu support.
收件人/To : 	qemu-devel@nongnu.org
退信原因/
Bounce reason : 	
由于对方服务器不稳定，或者双方服务器网络连接质量不佳，或者防火墙过滤，而无法连接上对方服务器。
Can not connect to recipient's server because of unstable network or firewall filter.
rcpt handle timeout,last handle info: Can not connect to nongnu.org:2001:470:142:3::10:25
建议解决方案/
Proposed Solution : 	

    邮差温馨提示：请在稍后时间重新尝试投递，或者联系联系管理员、技术中心协助。/
    Warm tips:Please try again later, or contact administrator or helpcenter for help.
    如果您有其他退信问题，欢迎向客服中心联系/
    If you have any other bounce problems, please contact customer service center

退信代码/
Bounce Code : 	
can not connect to

----------------
This message is generated by Coremail.



Xuerui said: 

"You may address the several review comments then just send v2. This way
the threading is less likely to be damaged (you need to exactly specify
In-Reply-To headers and such for the re-sent patches to correctly link
to this thread, I think it's not worth the effort). "

I think this will have the same problem. 

Richard and Karl,  How can we solve this problem？


Thanks
Song Gao.
 
> 
> r~


