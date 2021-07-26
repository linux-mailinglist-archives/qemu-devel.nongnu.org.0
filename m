Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D5C3D59F5
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 14:59:20 +0200 (CEST)
Received: from localhost ([::1]:59622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m80CV-00031t-73
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 08:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m80BN-0001gd-Lx
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:58:09 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53560 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m80BK-0006KR-V8
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:58:09 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn0JXsf5g5BUkAA--.23471S3; 
 Mon, 26 Jul 2021 20:58:00 +0800 (CST)
Subject: Re: [PATCH v2 12/22] target/loongarch: Add fixed point extra
 instruction translation
To: Richard Henderson <richard.henderson@linaro.org>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-13-git-send-email-gaosong@loongson.cn>
 <7a500d72-7d16-1a02-2ede-5e07f1383812@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <a08adb9a-67fe-b8aa-4b72-a3b3548f4945@loongson.cn>
Date: Mon, 26 Jul 2021 20:57:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <7a500d72-7d16-1a02-2ede-5e07f1383812@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn0JXsf5g5BUkAA--.23471S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCry7Cr1UGryxtw15urW3ZFb_yoW5WFWrpF
 n5JFW8GrWUKF95Z34UGr15JFySyF48t3WUJ3sYqa98AFsFkwn2gr15urs09F1rZr4kWr4a
 y3yUZwnrZr47trDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBS1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2
 jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52
 x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWU
 GwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4
 x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCYjI0SjxkI62AI
 1cAE67vIY487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r
 yrJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
 7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
 C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
 04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
 IEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfU5sjjDUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.438,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, yangxiaojuan@loongson.cn, qemu-devel@nongnu.org,
 maobibo@loongson.cn, laurent@vivier.eu, alistair.francis@wdc.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Hi, Richard.

On 07/23/2021 01:12 PM, Richard Henderson wrote:
> On 7/20/21 11:53 PM, Song Gao wrote:
>> +target_ulong helper_cpucfg(CPULoongArchState *env, target_ulong rj)
>> +{
>> +    target_ulong r = 0;
>> +
>> +    switch (rj) {
>> +    case 0:
>> +        r = env->CSR_MCSR0 & 0xffffffff;
>> +        break;
>> +    case 1:
>> +        r = (env->CSR_MCSR0 & 0xffffffff00000000) >> 32;
>> +        break;
> 
> Why do you represent all of these as high and low portions of a 64-bit internal value, when the manual describes them as 32-bit values?
> 
This method can reduce variables on env.
> >> +/* Fixed point extra instruction translation */
>> +static bool trans_crc_w_b_w(DisasContext *ctx, arg_crc_w_b_w *a)
>> +{
>> +    TCGv t0, t1;
>> +    TCGv Rd = cpu_gpr[a->rd];
>> +    TCGv_i32 tsz = tcg_const_i32(1 << 1);
> 
> This size is wrong.  It should be 1, not 1 << 1 (2).
> > 
>> +static bool trans_crc_w_w_w(DisasContext *ctx, arg_crc_w_w_w *a)
>> +{
>> +    TCGv t0, t1;
>> +    TCGv Rd = cpu_gpr[a->rd];
>> +    TCGv_i32 tsz = tcg_const_i32(1 << 4);
> 
> Because this size most certainly should not be 16...
>>> +static bool trans_crc_w_d_w(DisasContext *ctx, arg_crc_w_d_w *a)
>> +{
>> +    TCGv t0, t1;
>> +    TCGv Rd = cpu_gpr[a->rd];
>> +    TCGv_i32 tsz = tcg_const_i32(1 << 8);
> 
> ... and this size should not be 256.  Both well larger than the 8 byte buffer that you've allocated.
> 

I'm not sure about that.

> Also, you need a helper so that you don't have 8 copies of this code.
> 
OK.
>> +static bool trans_asrtle_d(DisasContext *ctx, arg_asrtle_d * a)
>> +{
>> +    TCGv t0, t1;
>> +
>> +    t0 = get_gpr(a->rj);
>> +    t1 = get_gpr(a->rk);
>> +
>> +    gen_helper_asrtle_d(cpu_env, t0, t1);
>> +
>> +    return true;
>> +}
>> +
>> +static bool trans_asrtgt_d(DisasContext *ctx, arg_asrtgt_d * a)
>> +{
>> +    TCGv t0, t1;
>> +
>> +    t0 = get_gpr(a->rj);
>> +    t1 = get_gpr(a->rk);
>> +
>> +    gen_helper_asrtgt_d(cpu_env, t0, t1);
>> +
>> +    return true;
>> +}
> 
> I'm not sure why both of these instructions are in the ISA, since
> 
>   ASRTLE X,Y <-> ASRTGT Y,X
> 
> but we certainly don't need two different helpers.
> Just swap the arguments for one of them.
>
OK.
 
>> +static bool trans_rdtimel_w(DisasContext *ctx, arg_rdtimel_w *a)
>> +{
>> +    /* Nop */
>> +    return true;
>> +}
>> +
>> +static bool trans_rdtimeh_w(DisasContext *ctx, arg_rdtimeh_w *a)
>> +{
>> +    /* Nop */
>> +    return true;
>> +}
>> +
>> +static bool trans_rdtime_d(DisasContext *ctx, arg_rdtime_d *a)
>> +{
>> +    /* Nop */
>> +    return true;
>> +}
> 
> If you don't want to implement these right now, you should at least initialize the destination register to 0, or something.
> 
OK.
> 
> r~

Again ,thanks you kindly help.

Thanks
Song Gao.


