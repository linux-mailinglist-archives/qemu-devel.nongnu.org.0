Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C24457CB3
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 10:42:42 +0100 (CET)
Received: from localhost ([::1]:56116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moMtN-0000b4-Pa
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 04:42:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1moMrJ-0007RF-76
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 04:40:33 -0500
Received: from mail.loongson.cn ([114.242.206.163]:46570 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1moMrF-0003Og-Tl
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 04:40:32 -0500
Received: from [10.20.42.193] (unknown [10.20.42.193])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxfuT8uZhhD+sAAA--.4239S3;
 Sat, 20 Nov 2021 17:03:57 +0800 (CST)
Subject: Re: [PATCH v11 05/26] target/loongarch: Add fixed point shift
 instruction translation
To: Richard Henderson <richard.henderson@linaro.org>
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-6-git-send-email-gaosong@loongson.cn>
 <a3ccf869-fe7c-96d5-6390-4bb9b4bba02f@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <d8efaf38-4093-01c0-56a4-28ea4bb16d16@loongson.cn>
Date: Sat, 20 Nov 2021 17:03:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a3ccf869-fe7c-96d5-6390-4bb9b4bba02f@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------F9E9376FC1EE9B99D6A8D962"
Content-Language: en-US
X-CM-TRANSID: AQAAf9AxfuT8uZhhD+sAAA--.4239S3
X-Coremail-Antispam: 1UD129KBjvJXoWxWFy7KrW8trWxAw1kurWUCFg_yoW5Xr4fpF
 48Kr1UGryjqwn7XrWkZw1DWF9rJrn0yayUWF48uF1rCw4UJryqgwsrX39I9ry2kws7Xr4F
 yFZ3uryq9wn8J3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9j1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2
 jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzx
 vE52x082IY62kv0487McIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8
 JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYx
 C7Mx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVCm-wCF
 04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26ryrJr1UJwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1U
 MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvf
 C2KfnxnUUI43ZEXa7VU889N3UUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-2.625, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------F9E9376FC1EE9B99D6A8D962
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Richard,

On 2021/11/20 下午3:42, Richard Henderson wrote:
> On 11/19/21 7:13 AM, Song Gao wrote:
>> +static bool gen_shift(DisasContext *ctx, arg_rr_i *a,
>> +                      void(*func)(TCGv, TCGv, TCGv))
>> +{
>> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_SIGN);
>> +    TCGv src1 = gpr_src(ctx, a->rj, EXT_ZERO);
>> +    TCGv src2 = tcg_constant_tl(a->imm);
>> +
>> +    func(dest, src1, src2);
>> +    gen_set_gpr(a->rd, dest, EXT_SIGN);
>> +
>> +    return true;
>> +}
>
> This is no longer generic; it's specific to word operations.  But 
> there's nothing in here that can't be done with gen_rr_i, so I think 
> you should remove it.
>
OK.
>> +
>> +static bool gen_shift_i(DisasContext *ctx, arg_rr_i *a,
>> +                        void(*func)(TCGv, TCGv, target_long))
>> +{
>> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
>> +    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
>> +
>> +    func(dest, src1, a->imm);
>> +
>> +    return true;
>> +}
>
> This one has dropped gen_set_gpr.
>
We need't gen_set_gpr, the dst_ext is EXT_NONE.

> I think that your current gen_rr_i should be named gen_rri_v 
> (variable) and this one should regain the DisasExtend and be named 
> gen_rri_c (constant).
>
> Then, in the previous,
>
> TRANS(addi_w, gen_rri_c, EXT_NONE, EXT_SIGN, tcg_gen_addi_tl)
> TRANS(addi_d, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_addi_tl)
> TRANS(andi, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_andi_tl)
> TRANS(ori, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_ori_tl)
> TRANS(xori, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_xori_tl)
>
> There are a few identity tests within these tcg_gen_opi_tl functions 
> which would be nice to apply.  Particularly because the canonical 
> "nop" instruction for loongarch is "andi r0,r0,0".
>
>> +TRANS(slli_w, gen_shift, tcg_gen_shl_tl)
>> +TRANS(slli_d, gen_shift_i, tcg_gen_shli_tl)
>> +TRANS(srli_w, gen_shift, tcg_gen_shr_tl)
>> +TRANS(srli_d, gen_shift_i, tcg_gen_shri_tl)
>> +TRANS(srai_d, gen_shift_i, tcg_gen_sari_tl)
>> +TRANS(rotri_w, gen_shift, gen_rotr_w)
>> +TRANS(rotri_d, gen_shift_i, tcg_gen_rotri_tl)
>
> Then these become
>
> TRANS(slli_w, gen_rri_c, EXT_NONE, EXT_SIGN, tcg_gen_shli_tl)
> TRANS(slli_d, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_shli_tl)
> TRANS(srli_w, gen_rri_c, EXT_SIGN, EXT_SIGN, tcg_gen_shri_tl)
> TRANS(srli_d, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_shri_tl)
> TRANS(srai_d, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_sari_tl)
> TRANS(rotri_w, gen_rri_v, EXT_NONE, EXT_NONE, gen_rotr_w)
> TRANS(rotri_d, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_rotri_tl)
>
Very nice, very clean.

Thanks
Song Gao

> r~

--------------F9E9376FC1EE9B99D6A8D962
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">
      <pre>Hi Richard,
</pre>
    </div>
    <div class="moz-cite-prefix">On 2021/11/20 下午3:42, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a3ccf869-fe7c-96d5-6390-4bb9b4bba02f@linaro.org">On
      11/19/21 7:13 AM, Song Gao wrote:
      <br>
      <blockquote type="cite">+static bool gen_shift(DisasContext *ctx,
        arg_rr_i *a,
        <br>
        +                      void(*func)(TCGv, TCGv, TCGv))
        <br>
        +{
        <br>
        +    TCGv dest = gpr_dst(ctx, a-&gt;rd, EXT_SIGN);
        <br>
        +    TCGv src1 = gpr_src(ctx, a-&gt;rj, EXT_ZERO);
        <br>
        +    TCGv src2 = tcg_constant_tl(a-&gt;imm);
        <br>
        +
        <br>
        +    func(dest, src1, src2);
        <br>
        +    gen_set_gpr(a-&gt;rd, dest, EXT_SIGN);
        <br>
        +
        <br>
        +    return true;
        <br>
        +}
        <br>
      </blockquote>
      <br>
      This is no longer generic; it's specific to word operations.  But
      there's nothing in here that can't be done with gen_rr_i, so I
      think you should remove it.
      <br>
      <br>
    </blockquote>
    OK.<br>
    <blockquote type="cite"
      cite="mid:a3ccf869-fe7c-96d5-6390-4bb9b4bba02f@linaro.org">
      <blockquote type="cite">+
        <br>
        +static bool gen_shift_i(DisasContext *ctx, arg_rr_i *a,
        <br>
        +                        void(*func)(TCGv, TCGv, target_long))
        <br>
        +{
        <br>
        +    TCGv dest = gpr_dst(ctx, a-&gt;rd, EXT_NONE);
        <br>
        +    TCGv src1 = gpr_src(ctx, a-&gt;rj, EXT_NONE);
        <br>
        +
        <br>
        +    func(dest, src1, a-&gt;imm);
        <br>
        +
        <br>
        +    return true;
        <br>
        +}
        <br>
      </blockquote>
      <br>
      This one has dropped gen_set_gpr.
      <br>
      <br>
    </blockquote>
    <pre>We need't gen_set_gpr, the dst_ext is EXT_NONE.</pre>
    <blockquote type="cite"
      cite="mid:a3ccf869-fe7c-96d5-6390-4bb9b4bba02f@linaro.org">I think
      that your current gen_rr_i should be named gen_rri_v (variable)
      and this one should regain the DisasExtend and be named gen_rri_c
      (constant).
      <br>
      <br>
      Then, in the previous,
      <br>
      <br>
      TRANS(addi_w, gen_rri_c, EXT_NONE, EXT_SIGN, tcg_gen_addi_tl)
      <br>
      TRANS(addi_d, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_addi_tl)
      <br>
      TRANS(andi, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_andi_tl)
      <br>
      TRANS(ori, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_ori_tl)
      <br>
      TRANS(xori, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_xori_tl)
      <br>
      <br>
      There are a few identity tests within these tcg_gen_opi_tl
      functions which would be nice to apply.  Particularly because the
      canonical "nop" instruction for loongarch is "andi r0,r0,0".
      <br>
      <br>
      <blockquote type="cite">+TRANS(slli_w, gen_shift, tcg_gen_shl_tl)
        <br>
        +TRANS(slli_d, gen_shift_i, tcg_gen_shli_tl)
        <br>
        +TRANS(srli_w, gen_shift, tcg_gen_shr_tl)
        <br>
        +TRANS(srli_d, gen_shift_i, tcg_gen_shri_tl)
        <br>
        +TRANS(srai_d, gen_shift_i, tcg_gen_sari_tl)
        <br>
        +TRANS(rotri_w, gen_shift, gen_rotr_w)
        <br>
        +TRANS(rotri_d, gen_shift_i, tcg_gen_rotri_tl)
        <br>
      </blockquote>
      <br>
      Then these become
      <br>
      <br>
      TRANS(slli_w, gen_rri_c, EXT_NONE, EXT_SIGN, tcg_gen_shli_tl)
      <br>
      TRANS(slli_d, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_shli_tl)
      <br>
      TRANS(srli_w, gen_rri_c, EXT_SIGN, EXT_SIGN, tcg_gen_shri_tl)
      <br>
      TRANS(srli_d, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_shri_tl)
      <br>
      TRANS(srai_d, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_sari_tl)
      <br>
      TRANS(rotri_w, gen_rri_v, EXT_NONE, EXT_NONE, gen_rotr_w)
      <br>
      TRANS(rotri_d, gen_rri_c, EXT_NONE, EXT_NONE, tcg_gen_rotri_tl)
      <br>
      <br>
    </blockquote>
    <pre>Very nice, very clean.

Thanks
Song Gao
</pre>
    <blockquote type="cite"
      cite="mid:a3ccf869-fe7c-96d5-6390-4bb9b4bba02f@linaro.org">r~
      <br>
    </blockquote>
  </body>
</html>

--------------F9E9376FC1EE9B99D6A8D962--


