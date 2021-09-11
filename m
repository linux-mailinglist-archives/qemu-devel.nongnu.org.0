Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E392407545
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 08:02:02 +0200 (CEST)
Received: from localhost ([::1]:45296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOw5Q-0006AA-Vb
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 02:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mOw3J-0005KF-Oz
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 01:59:49 -0400
Received: from mail.loongson.cn ([114.242.206.163]:43088 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mOw3G-0004T5-PV
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 01:59:49 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr2ujRTxhgTMEAA--.8140S3;
 Sat, 11 Sep 2021 13:59:02 +0800 (CST)
Subject: Re: [PATCH v4 17/21] LoongArch Linux User Emulation
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 chenhuacai@gmail.com
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
 <1630586467-22463-18-git-send-email-gaosong@loongson.cn>
 <4e47e1a7-d946-f8ec-a9a1-aadc6eeb7941@linaro.org>
 <3e7fd708-fe13-8163-2926-d1baa75e3b10@loongson.cn>
 <d6349ca9-2483-2f83-f5cb-f9e1f740a404@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <3146e487-9b35-d9b8-668e-06c9e6744cb2@loongson.cn>
Date: Sat, 11 Sep 2021 13:58:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <d6349ca9-2483-2f83-f5cb-f9e1f740a404@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxr2ujRTxhgTMEAA--.8140S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ArW5uw1rtw4ktw4kXrWUurg_yoW8Wr4kpr
 y3XFs8JFWkt3W8Jw4qqw10g34vyw13J343W398XFWDC3yYqF1a9r1xXr4j9FnrKws3WFy2
 qF4F934DuF15A37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBv1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2
 jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
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
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.349,
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
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn, david@redhat.com,
 bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, tsimpson@quicinc.com,
 alistair.francis@wdc.com, edgar.iglesias@gmail.com, philmd@redhat.com,
 atar4qemu@gmail.com, thuth@redhat.com, ehabkost@redhat.com, groug@kaod.org,
 maobibo@loongson.cn, mrolnik@gmail.com, shorne@gmail.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au,
 kbastian@mail.uni-paderborn.de, crwulff@gmail.com, laurent@vivier.eu,
 palmer@dabbelt.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Richard.

On 09/10/2021 08:52 PM, Richard Henderson wrote:
> On 9/8/21 11:50 AM, Song Gao wrote:
>>
>> Hi Richard,
>>
>> On 09/05/2021 06:04 PM, Richard Henderson wrote:
>>>> +struct sigframe {
>>>> +    uint32_t sf_ass[4];             /* argument save space for o32 */
>>>
>>> Surely there is no "o32" for loongarch?
>>>
>>
>> Yes, qemu only support 64bit. but the kernel has 'o32'.  Should we have to be consistent with the kernel?
> 
> Yes, you need to be consistent with the kernel.  However... the kernel is not yet upstream, and therefore the ABI is (officially) still malleable.
> 
> Anyway, this padding was copied from mips o32, and should not have been.  Looking at the loongarch gcc sources, REG_PARM_STACK_SPACE is always 0, and thus the 4 words reserved here are never used.
> 
> I see that gcc/libgcc/config/loongarch/linux-unwind.h builds in knowledge of these unused words.  I also see that linux/arch/loongarch/vdso/sigreturn.S does not provide correct unwind info.  Certainly the kernel vdso should be fixed, so that code within gcc should not be needed.  At which point the ABI for the signal frame is entirely private to the kernel.
> 

We are cleanning up 'o32' code for gcc and kernel.   

By the way, We have already prepared V5 patches. but I see that patches [1] and [2] have not push into master. How can I use these patches? 

[1]: https://patchew.org/QEMU/20210618192951.125651-1-richard.henderson@linaro.org/
[2]: https://patchew.org/QEMU/20210822035537.283193-1-richard.henderson@linaro.org/


Song Gao
thanks
> 
> r~


