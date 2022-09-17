Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 113585BB7EE
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 12:58:15 +0200 (CEST)
Received: from localhost ([::1]:39440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZVWX-0005ky-MD
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 06:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huqi@loongson.cn>) id 1oZVVD-00040p-JK
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 06:56:51 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44742 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huqi@loongson.cn>) id 1oZVVA-0001XZ-UR
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 06:56:51 -0400
Received: from [10.90.50.23] (unknown [10.90.50.23])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxFeLppyVj+iUcAA--.42499S3; 
 Sat, 17 Sep 2022 18:56:42 +0800 (CST)
Message-ID: <9855c666-ed0c-52ca-d71b-60e23468161f@loongson.cn>
Date: Sat, 17 Sep 2022 18:56:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/5] target/loongarch: bstrins.w need set dest register
 EXT_SIGN
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20220917075950.1412309-1-gaosong@loongson.cn>
 <20220917075950.1412309-3-gaosong@loongson.cn>
 <6efecbd9-1a88-a5a4-bcb0-9080d710849c@loongson.cn>
 <8e58793b-4683-d026-58e1-fc3db9bf7a8a@loongson.cn>
From: Qi Hu <huqi@loongson.cn>
In-Reply-To: <8e58793b-4683-d026-58e1-fc3db9bf7a8a@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxFeLppyVj+iUcAA--.42499S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uw4UGw13ur1xWFyrCw47XFb_yoW8Zw4DpF
 18CFyUGrWUXr97Zr97Za1qqFy7Jrs7Kw47Wr4I9a4fC3y7Xr10gr4jq39Igr1jyrs7Wr4k
 AF4ru3yq9a15J3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvYb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487
 MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
 02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_
 JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
 CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
 6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07
 jY6wZUUUUU=
X-CM-SenderInfo: pkxtxqxorr0wxvrqhubq/1tbiAQAMCWMkZ1wJygAKsx
Received-SPF: pass client-ip=114.242.206.163; envelope-from=huqi@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.529,
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


On 2022/9/17 17:16, gaosong wrote:
>
> 在 2022/9/17 下午4:41, Qi Hu 写道:
>>
>> On 2022/9/17 15:59, Song Gao wrote:
>>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>>> ---
>>>   target/loongarch/insn_trans/trans_bit.c.inc | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/target/loongarch/insn_trans/trans_bit.c.inc 
>>> b/target/loongarch/insn_trans/trans_bit.c.inc
>>> index 9337714ec4..33e94878fd 100644
>>> --- a/target/loongarch/insn_trans/trans_bit.c.inc
>>> +++ b/target/loongarch/insn_trans/trans_bit.c.inc
>>> @@ -37,7 +37,7 @@ static bool gen_rr_ms_ls(DisasContext *ctx, 
>>> arg_rr_ms_ls *a,
>>>                            DisasExtend src_ext, DisasExtend dst_ext,
>>>                            void (*func)(TCGv, TCGv, unsigned int, 
>>> unsigned int))
>>>   {
>>> -    TCGv dest = gpr_dst(ctx, a->rd, dst_ext);
>>> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
>> I think this may not be correct. Maybe the code was used for 
>> debugging but forgot to modify?
> We just need EXT_SIGN  the result.

Got it. Thanks.

Qi

>>>       TCGv src1 = gpr_src(ctx, a->rj, src_ext);
>>>         if (a->ls > a->ms) {
>>> @@ -206,7 +206,7 @@ TRANS(maskeqz, gen_rrr, EXT_NONE, EXT_NONE, 
>>> EXT_NONE, gen_maskeqz)
>>>   TRANS(masknez, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, gen_masknez)
>>>   TRANS(bytepick_w, gen_rrr_sa, EXT_NONE, EXT_NONE, gen_bytepick_w)
>>>   TRANS(bytepick_d, gen_rrr_sa, EXT_NONE, EXT_NONE, gen_bytepick_d)
>>> -TRANS(bstrins_w, gen_rr_ms_ls, EXT_NONE, EXT_NONE, gen_bstrins)
>>> +TRANS(bstrins_w, gen_rr_ms_ls, EXT_NONE, EXT_SIGN, gen_bstrins)
>>>   TRANS(bstrins_d, gen_rr_ms_ls, EXT_NONE, EXT_NONE, gen_bstrins)
>>>   TRANS(bstrpick_w, gen_rr_ms_ls, EXT_NONE, EXT_SIGN, 
>>> tcg_gen_extract_tl)
>>>   TRANS(bstrpick_d, gen_rr_ms_ls, EXT_NONE, EXT_NONE, 
>>> tcg_gen_extract_tl)
>>
>


