Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B935BB781
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 11:18:05 +0200 (CEST)
Received: from localhost ([::1]:35710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZTxb-0002de-Vl
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 05:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oZTvw-0001Gl-U9
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 05:16:20 -0400
Received: from mail.loongson.cn ([114.242.206.163]:36862 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oZTvu-0003di-J7
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 05:16:20 -0400
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxX+BakCVj9hQcAA--.41560S3; 
 Sat, 17 Sep 2022 17:16:11 +0800 (CST)
Subject: Re: [PATCH 2/5] target/loongarch: bstrins.w need set dest register
 EXT_SIGN
To: qemu-devel@nongnu.org
References: <20220917075950.1412309-1-gaosong@loongson.cn>
 <20220917075950.1412309-3-gaosong@loongson.cn>
 <6efecbd9-1a88-a5a4-bcb0-9080d710849c@loongson.cn>
From: gaosong <gaosong@loongson.cn>
Message-ID: <8e58793b-4683-d026-58e1-fc3db9bf7a8a@loongson.cn>
Date: Sat, 17 Sep 2022 17:16:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6efecbd9-1a88-a5a4-bcb0-9080d710849c@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8DxX+BakCVj9hQcAA--.41560S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJr1rWr4fuF45Gr1fCw13CFg_yoW8Zr45pF
 18CryUGrWUZr97Zr97Za1DXFy7Jrs7Kw47Wr4I9a43C3yUXr10gr4jq39Igr1Utr4kWr4k
 AF4ruryqva15JwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvGb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
 cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
 AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
 6F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14
 v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80
 ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4
 AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK6svPMxAI
 w28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_XrWUJr1UMxC20s026xCaFVCjc4AY6r
 1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
 b7AF67AKxVWUJVWUXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
 vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
 cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa
 73UjIFyTuYvjxUz_MaUUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.816,
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


在 2022/9/17 下午4:41, Qi Hu 写道:
>
> On 2022/9/17 15:59, Song Gao wrote:
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
>>                            void (*func)(TCGv, TCGv, unsigned int, 
>> unsigned int))
>>   {
>> -    TCGv dest = gpr_dst(ctx, a->rd, dst_ext);
>> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
> I think this may not be correct. Maybe the code was used for debugging 
> but forgot to modify?
We just need EXT_SIGN  the result.
>>       TCGv src1 = gpr_src(ctx, a->rj, src_ext);
>>         if (a->ls > a->ms) {
>> @@ -206,7 +206,7 @@ TRANS(maskeqz, gen_rrr, EXT_NONE, EXT_NONE, 
>> EXT_NONE, gen_maskeqz)
>>   TRANS(masknez, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, gen_masknez)
>>   TRANS(bytepick_w, gen_rrr_sa, EXT_NONE, EXT_NONE, gen_bytepick_w)
>>   TRANS(bytepick_d, gen_rrr_sa, EXT_NONE, EXT_NONE, gen_bytepick_d)
>> -TRANS(bstrins_w, gen_rr_ms_ls, EXT_NONE, EXT_NONE, gen_bstrins)
>> +TRANS(bstrins_w, gen_rr_ms_ls, EXT_NONE, EXT_SIGN, gen_bstrins)
>>   TRANS(bstrins_d, gen_rr_ms_ls, EXT_NONE, EXT_NONE, gen_bstrins)
>>   TRANS(bstrpick_w, gen_rr_ms_ls, EXT_NONE, EXT_SIGN, 
>> tcg_gen_extract_tl)
>>   TRANS(bstrpick_d, gen_rr_ms_ls, EXT_NONE, EXT_NONE, 
>> tcg_gen_extract_tl)
>


