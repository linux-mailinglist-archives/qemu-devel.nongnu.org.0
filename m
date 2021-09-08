Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E403403768
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 11:57:12 +0200 (CEST)
Received: from localhost ([::1]:38382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuKN-00007j-GU
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 05:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mNuEV-0007ht-Kn
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 05:51:10 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49342 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mNuES-0008Ba-QT
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 05:51:07 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxROZthzhhpZwBAA--.7066S3;
 Wed, 08 Sep 2021 17:50:39 +0800 (CST)
Subject: Re: [PATCH v4 17/21] LoongArch Linux User Emulation
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 chenhuacai@gmail.com
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
 <1630586467-22463-18-git-send-email-gaosong@loongson.cn>
 <4e47e1a7-d946-f8ec-a9a1-aadc6eeb7941@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <3e7fd708-fe13-8163-2926-d1baa75e3b10@loongson.cn>
Date: Wed, 8 Sep 2021 17:50:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <4e47e1a7-d946-f8ec-a9a1-aadc6eeb7941@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9CxROZthzhhpZwBAA--.7066S3
X-Coremail-Antispam: 1UD129KBjvdXoW7Gr43Zw4xWF4xZr18Jr1UKFg_yoWktFgE9a
 yfGF4xWw4UtF4UXw1jvrySvFy3GF1qkFyrurWFkr47XF1aqrn5tws3Xr93Ar97KwsxXrnx
 JrZ3trn3CF1FgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbSAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2
 jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
 8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
 Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
 ACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7I2V7IY0VAS
 07AlzVAYIcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8V
 W5Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
 6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
 42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
 IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.332,
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


Hi Richard,

On 09/05/2021 06:04 PM, Richard Henderson wrote:
>> +struct sigframe {
>> +    uint32_t sf_ass[4];             /* argument save space for o32 */
> 
> Surely there is no "o32" for loongarch?
> 

Yes, qemu only support 64bit. but the kernel has 'o32'.  Should we have to be consistent with the kernel?

>> +    uint32_t sf_code[2];            /* signal trampoline */
> 
> Note that there are patches on-list for moving the signal trampoline off of the stack.
> 
>> diff --git a/linux-user/loongarch64/termbits.h b/linux-user/loongarch64/termbits.h
>> new file mode 100644
>> index 0000000..33e74ed
>> --- /dev/null
>> +++ b/linux-user/loongarch64/termbits.h
>> @@ -0,0 +1,229 @@
>> +#ifndef LINUX_USER_LOONGARCH_TERMBITS_H
>> +#define LINUX_USER_LOONGARCH_TERMBITS_H
>> +
>> +#define TARGET_NCCS 19
> 
> Surely you should be using generic/termbits.h?
> OK.
> We will prefer not to merge a linux-user port that is not upstream, because the ABI may change in between.  Can you provide a pointer to your kernel port in the meantime?


Latest kernel: https://github.com/loongson/linux/tree/loongarch-next


Song Gao
Thanks.


