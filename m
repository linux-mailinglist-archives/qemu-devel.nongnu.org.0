Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F68E5BB75E
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 11:01:31 +0200 (CEST)
Received: from localhost ([::1]:59366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZThY-0006FB-U9
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 05:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huqi@loongson.cn>) id 1oZTfY-0004sC-Os
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 04:59:24 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35156 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huqi@loongson.cn>) id 1oZTfW-0001N9-4J
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 04:59:24 -0400
Received: from [10.90.50.23] (unknown [10.90.50.23])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxX+BkjCVj+REcAA--.41512S3; 
 Sat, 17 Sep 2022 16:59:16 +0800 (CST)
Message-ID: <02cd3a40-d287-35b4-9d68-979c8ebd2e29@loongson.cn>
Date: Sat, 17 Sep 2022 16:59:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 5/5] target/loongarch: div if x/0 set dividend to 0
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 alex.bennee@linaro.org, maobibo@loongson.cn, yangxiaojuan@loongson.cn
References: <20220917075950.1412309-1-gaosong@loongson.cn>
 <20220917075950.1412309-6-gaosong@loongson.cn>
From: Qi Hu <huqi@loongson.cn>
In-Reply-To: <20220917075950.1412309-6-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8DxX+BkjCVj+REcAA--.41512S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGw17GrW5tF4xXFW5WrWxWFg_yoW5Xr43pF
 1kur4aqaykAF97Jw42v3W7Zr17GFn5Cw4jq3srtw1DGr43Zr9rArs7K34SgryxKa4rZ3y5
 ZF95uw1DWF45Ja7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvYb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487
 MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
 02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_
 Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
 CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
 6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07
 j04E_UUUUU=
X-CM-SenderInfo: pkxtxqxorr0wxvrqhubq/1tbiAQAMCWMkZ1wJwQACsy
Received-SPF: pass client-ip=114.242.206.163; envelope-from=huqi@loongson.cn;
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


On 2022/9/17 15:59, Song Gao wrote:
> div.d, div.du, div,w, div.wu, the LoongArch host if x/0  the result is 0.

The message has a typo: "div,w" => "div.w"

Also I don't know why we need to do this, since the manual say: "When 
the divisor is 0, the result can be any value".

> So we set the divisor to 1 and the dividend to 0.
>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   target/loongarch/insn_trans/trans_arith.c.inc | 34 +++++++++++++++----
>   1 file changed, 27 insertions(+), 7 deletions(-)
>
> diff --git a/target/loongarch/insn_trans/trans_arith.c.inc b/target/loongarch/insn_trans/trans_arith.c.inc
> index 8e45eadbc8..c97afb16f9 100644
> --- a/target/loongarch/insn_trans/trans_arith.c.inc
> +++ b/target/loongarch/insn_trans/trans_arith.c.inc
> @@ -147,12 +147,28 @@ static void prep_divisor_du(TCGv ret, TCGv src2)
>       tcg_gen_movcond_tl(TCG_COND_EQ, ret, src2, zero, one, src2);
>   }
>   
> +static void prep_div(TCGv divisor, TCGv dividend, TCGv src1, TCGv src2)
> +{
> +    TCGv zero = tcg_constant_tl(0);
> +    TCGv one = tcg_constant_tl(1);
> +
> +    /*
> +     * If x / 0, set the diviend to 0 set the divisor to 1
> +     * this is the same with LoongArch host.
> +     */
> +    tcg_gen_movcond_tl(TCG_COND_EQ, dividend, src2, zero, zero, src1);
> +    tcg_gen_movcond_tl(TCG_COND_EQ, divisor, src2, zero, one, src2);
> +}
> +
>   static void gen_div_d(TCGv dest, TCGv src1, TCGv src2)
>   {
>       TCGv t0 = tcg_temp_new();
> -    prep_divisor_d(t0, src1, src2);
> -    tcg_gen_div_tl(dest, src1, t0);
> +    TCGv t1 = tcg_temp_new();
> +
> +    prep_div(t0, t1, src1, src2);
> +    tcg_gen_div_tl(dest, t1, t0);
>       tcg_temp_free(t0);
> +    tcg_temp_free(t1);
>   }
>   
>   static void gen_rem_d(TCGv dest, TCGv src1, TCGv src2)
> @@ -166,9 +182,11 @@ static void gen_rem_d(TCGv dest, TCGv src1, TCGv src2)
>   static void gen_div_du(TCGv dest, TCGv src1, TCGv src2)
>   {
>       TCGv t0 = tcg_temp_new();
> -    prep_divisor_du(t0, src2);
> -    tcg_gen_divu_tl(dest, src1, t0);
> +    TCGv t1 = tcg_temp_new();
> +    prep_div(t0, t1, src1, src2);
> +    tcg_gen_divu_tl(dest, t1, t0);
>       tcg_temp_free(t0);
> +    tcg_temp_free(t1);
>   }
>   
>   static void gen_rem_du(TCGv dest, TCGv src1, TCGv src2)
> @@ -182,10 +200,12 @@ static void gen_rem_du(TCGv dest, TCGv src1, TCGv src2)
>   static void gen_div_w(TCGv dest, TCGv src1, TCGv src2)
>   {
>       TCGv t0 = tcg_temp_new();
> -    /* We need not check for integer overflow for div_w. */
> -    prep_divisor_du(t0, src2);
> -    tcg_gen_div_tl(dest, src1, t0);
> +    TCGv t1 = tcg_temp_new();
> +
> +    prep_div(t0, t1, src1, src2);
> +    tcg_gen_div_tl(dest, t1, t0);
>       tcg_temp_free(t0);
> +    tcg_temp_free(t1);
>   }
>   
>   static void gen_rem_w(TCGv dest, TCGv src1, TCGv src2)


