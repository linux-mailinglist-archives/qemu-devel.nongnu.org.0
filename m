Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 660185EEF2A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 09:36:38 +0200 (CEST)
Received: from localhost ([::1]:39672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odo5z-0002RN-Ge
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 03:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1odnxU-0004Gq-2u
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:27:50 -0400
Received: from mail.loongson.cn ([114.242.206.163]:51114 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1odnxQ-0005pa-HI
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:27:47 -0400
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxnmvjSDVjaasjAA--.53107S3; 
 Thu, 29 Sep 2022 15:27:31 +0800 (CST)
Subject: Re: [PATCH v2 2/4] target/loongarch: bstrins.w need set dest register
 EXT_SIGN
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: yangxiaojuan@loongson.cn, huqi@loongson.cn, peter.maydell@linaro.org,
 alex.bennee@linaro.org, maobibo@loongson.cn
References: <20220927064838.3570928-1-gaosong@loongson.cn>
 <20220927064838.3570928-3-gaosong@loongson.cn>
 <fa9bc59a-a617-a243-7bf4-bc1f07db1a46@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <c330da65-8069-4ec9-929e-15b2a1b2c47b@loongson.cn>
Date: Thu, 29 Sep 2022 15:27:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <fa9bc59a-a617-a243-7bf4-bc1f07db1a46@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8BxnmvjSDVjaasjAA--.53107S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ur1kWF47GryftrWDZFWrKrg_yoW8uF4fpF
 18CryUGrWUXr97Zr97Za1DXFy7JFs7Kw47WF4I9a4rCay5Xr10grW2g39Igry7tw4kWr4k
 Aan5uryqva15J37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9j1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
 87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
 Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j
 6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
 1lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK6svP
 MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_XrWUJr1UMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
 C2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
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


在 2022/9/28 下午11:13, Richard Henderson 写道:
> On 9/26/22 23:48, Song Gao wrote:
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>   target/loongarch/insn_trans/trans_bit.c.inc | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/loongarch/insn_trans/trans_bit.c.inc 
>> b/target/loongarch/insn_trans/trans_bit.c.inc
>> index 9337714ec4..33e94878fd 100644
>> --- a/target/loongarch/insn_trans/trans_bit.c.inc
>> +++ b/target/loongarch/insn_trans/trans_bit.c.inc
>> @@ -37,7 +37,7 @@ static bool gen_rr_ms_ls(DisasContext *ctx, 
>> arg_rr_ms_ls *a,
>>                            DisasExtend src_ext, DisasExtend dst_ext,
>>                             void (*func)(TCGv, TCGv, unsigned int, 
>> unsigned int))
>>   {
>> -    TCGv dest = gpr_dst(ctx, a->rd, dst_ext);
>> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
>>       TCGv src1 = gpr_src(ctx, a->rj, src_ext);
>>         if (a->ls > a->ms) {
>> @@ -206,7 +206,7 @@ TRANS(maskeqz, gen_rrr, EXT_NONE, EXT_NONE, 
>> EXT_NONE, gen_maskeqz)
>>   TRANS(masknez, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, gen_masknez)
>>   TRANS(bytepick_w, gen_rrr_sa, EXT_NONE, EXT_NONE, gen_bytepick_w)
>>   TRANS(bytepick_d, gen_rrr_sa, EXT_NONE, EXT_NONE, gen_bytepick_d)
>> -TRANS(bstrins_w, gen_rr_ms_ls, EXT_NONE, EXT_NONE, gen_bstrins)
>> +TRANS(bstrins_w, gen_rr_ms_ls, EXT_NONE, EXT_SIGN, gen_bstrins)
>
> These two hunks do opposite things: change dst_ext from NONE to SIGN, 
> and then ignore the change.
>
> I assume the first hunk is in fact in error.
>
rd is also a src register,    rd should be src_dst.

     TCGv dest = gpr_src(ctx, a->rd, src_dst);   what about this?


Thanks.
Song Gao
>
> r~
>
>
>>   TRANS(bstrins_d, gen_rr_ms_ls, EXT_NONE, EXT_NONE, gen_bstrins)
>>   TRANS(bstrpick_w, gen_rr_ms_ls, EXT_NONE, EXT_SIGN, 
>> tcg_gen_extract_tl)
>>   TRANS(bstrpick_d, gen_rr_ms_ls, EXT_NONE, EXT_NONE, 
>> tcg_gen_extract_tl)


