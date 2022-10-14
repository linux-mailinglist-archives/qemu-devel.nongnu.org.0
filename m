Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 565C35FE780
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 05:17:13 +0200 (CEST)
Received: from localhost ([::1]:60296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojBCC-00053A-34
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 23:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huqi@loongson.cn>) id 1ojBA5-0003UM-FD
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 23:15:01 -0400
Received: from mail.loongson.cn ([114.242.206.163]:60424 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huqi@loongson.cn>) id 1ojBA2-0001Br-M6
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 23:15:01 -0400
Received: from [10.90.50.23] (unknown [10.90.50.23])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxX+Ap1EhjUdUtAA--.33612S3; 
 Fri, 14 Oct 2022 11:14:49 +0800 (CST)
Message-ID: <bb199ea5-88c3-480d-7661-6b89fd0e52b1@loongson.cn>
Date: Fri, 14 Oct 2022 11:14:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2] tcg/loongarch64: Add direct jump support
To: Richard Henderson <richard.henderson@linaro.org>,
 WANG Xuerui <git@xen0n.name>
Cc: qemu-devel@nongnu.org
References: <cc5770f1a03bf90fa8b990666fb061b1e063b803.1665405913.git.huqi@loongson.cn>
 <20221013030123.979720-1-huqi@loongson.cn>
 <7ca40cf8-f49f-6a84-c384-f031f69a3305@linaro.org>
Content-Language: en-US
From: Qi Hu <huqi@loongson.cn>
In-Reply-To: <7ca40cf8-f49f-6a84-c384-f031f69a3305@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxX+Ap1EhjUdUtAA--.33612S3
X-Coremail-Antispam: 1UD129KBjvJXoWxKFWxuFWDuw1UKryUGFyDKFg_yoW7WFW8pr
 1kJr1UJrWUJrs5Jr4UJF1UXryUAr15Ja4DJF18XF1UJws8Jr1jgr40grn0gF1UJr48Zr1U
 Ar1DJrnxZF4UAFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvYb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjc
 xK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
 Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
 W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG
 8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
 Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y
 6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
 kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
 xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07
 jOb18UUUUU=
X-CM-SenderInfo: pkxtxqxorr0wxvrqhubq/1tbiAQATCWNH-+ATCAABs6
Received-SPF: pass client-ip=114.242.206.163; envelope-from=huqi@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2022/10/14 02:52, Richard Henderson wrote:
> On 10/13/22 20:01, Qi Hu wrote:
>> Similar to the ARM64, LoongArch has PC-relative instructions such as
>> PCADDU18I. These instructions can be used to support direct jump for
>> LoongArch. Additionally, if instruction "B offset" can cover the target
>> address(target is within ±128MB range), a single "B offset" plus a nop
>> will be used by "tb_target_set_jump_target".
>>
>> Signed-off-by: Qi Hu <huqi@loongson.cn>
>
> First, when sending a v2, do not reply to a different thread.
> This confuses our patch tracking tools like patchew.org.
>
Ok, I will pay attention about that.
>> +void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
>> +                              uintptr_t jmp_rw, uintptr_t addr)
>> +{
>> +    tcg_insn_unit i1, i2;
>> +    ptrdiff_t upper, lower;
>> +    ptrdiff_t offset = (addr - jmp_rx) >> 2;
>> +
>> +    if (offset == sextreg(offset, 0, 28)) {
>> +        i1 = encode_sd10k16_insn(OPC_B, offset);
>> +        i2 = NOP;
>> +    } else {
>> +        upper = ((offset + (1 << 15)) >> 16) & 0xfffff;
>> +        lower = (offset & 0xffff);
>
> This computation is incorrect, cropping the values to unsigned.
> This will assert inside
>
>> +        /* patch pcaddu18i */
>> +        i1 = encode_dsj20_insn(OPC_PCADDU18I, TCG_REG_T0, upper);
>> +        /* patch jirl */
>> +        i2 = encode_djsk16_insn(OPC_JIRL, TCG_REG_ZERO, TCG_REG_T0, 
>> lower);
>
> these encoding functions.  You want
>
>     lower = (int16_t)offset;
>     upper = (offset - lower) >> 16;
Yes, thanks for your advise.
>
> Wang Xuerui asked you to remove the redundant comments there, which 
> give no more information than the code itself.
I will remove these comments.
>
>> @@ -1058,11 +1088,24 @@ static void tcg_out_op(TCGContext *s, 
>> TCGOpcode opc,
>>           break;
>>         case INDEX_op_goto_tb:
>> -        assert(s->tb_jmp_insn_offset == 0);
>> -        /* indirect jump method */
>> -        tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
>> -                   (uintptr_t)(s->tb_jmp_target_addr + a0));
>> -        tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_TMP0, 0);
>> +        if (s->tb_jmp_insn_offset != NULL) {
>> +            /* TCG_TARGET_HAS_direct_jump */
>> +            /* Ensure that "patch area" are 8-byte aligned so that an
>> +               atomic write can be used to patch the target address. */
>> +            if ((uintptr_t)s->code_ptr & 7) {
>> +                tcg_out_nop(s);
>> +            }
>> +            s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
>> +            /* actual branch destination will be patched by
>> +               tb_target_set_jmp_target later */
>> +            tcg_out_opc_pcaddu18i(s, TCG_REG_TMP0, 0);
>> +            tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_TMP0, 0);
>> +        } else {
>> +            /* !TCG_TARGET_HAS_direct_jump */
>> +            tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
>> +                    (uintptr_t)(s->tb_jmp_target_addr + a0));
>> +            tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_TMP0, 0);
>> +        }
>
> Your comment formatting does not follow our coding style.  It must be
>
>     /*
>      * Comment with
>      * multiple lines.
>      */
>
> There is a tool, ./scripts/check_patch.pl, that will diagnose this error.
I will modify these comments.
>
>> diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
>> index 67380b2432..c008d5686d 100644
>> --- a/tcg/loongarch64/tcg-target.h
>> +++ b/tcg/loongarch64/tcg-target.h
>> @@ -123,7 +123,7 @@ typedef enum {
>>   #define TCG_TARGET_HAS_clz_i32          1
>>   #define TCG_TARGET_HAS_ctz_i32          1
>>   #define TCG_TARGET_HAS_ctpop_i32        0
>> -#define TCG_TARGET_HAS_direct_jump      0
>> +#define TCG_TARGET_HAS_direct_jump      1
>>   #define TCG_TARGET_HAS_brcond2          0
>>   #define TCG_TARGET_HAS_setcond2         0
>>   #define TCG_TARGET_HAS_qemu_st8_i32     0
>> @@ -166,7 +166,6 @@ typedef enum {
>>   #define TCG_TARGET_HAS_muluh_i64        1
>>   #define TCG_TARGET_HAS_mulsh_i64        1
>>   -/* not defined -- call should be eliminated at compile time */
>>   void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, 
>> uintptr_t);
>>     #define TCG_TARGET_DEFAULT_MO (0)
>
> You are missing a change to
>
> #define MAX_CODE_GEN_BUFFER_SIZE  SIZE_MAX
>
> The branch distance with pcaddu18i is +/- 37 bits (128GB) not 64 bits.
>
Oh, thanks for your reminder. I will add this.
>
> r~

I will send V3 after editing these.

Thanks.

Qi


