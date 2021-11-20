Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38766457C9D
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 09:53:54 +0100 (CET)
Received: from localhost ([::1]:52304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moM89-0001X9-Bn
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 03:53:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1moM73-00008h-7Z
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 03:52:45 -0500
Received: from mail.loongson.cn ([114.242.206.163]:39556 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1moM6z-0006ua-BE
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 03:52:44 -0500
Received: from [10.20.42.193] (unknown [10.20.42.193])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx+M1Qt5hhI+oAAA--.224S3;
 Sat, 20 Nov 2021 16:52:32 +0800 (CST)
Subject: Re: [PATCH v11 04/26] target/loongarch: Add fixed point arithmetic
 instruction translation
To: Richard Henderson <richard.henderson@linaro.org>
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-5-git-send-email-gaosong@loongson.cn>
 <6ccd9c56-9db6-7a40-d59c-22bf3fc2f6b0@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <b6259138-0f0d-c0dd-c4ed-632f76e507fb@loongson.cn>
Date: Sat, 20 Nov 2021 16:52:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6ccd9c56-9db6-7a40-d59c-22bf3fc2f6b0@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------F725EC670056822656FA1CAD"
Content-Language: en-US
X-CM-TRANSID: AQAAf9Dx+M1Qt5hhI+oAAA--.224S3
X-Coremail-Antispam: 1UD129KBjvJXoW7KFyfuF4UurW5Gw1fJw15XFb_yoW8JFW7pF
 y8Jr4UCFyUJwn5Jr97Zw4UWFy7Xw18Jw45J34xCa4jka18tryv9r42qrZI9r1YyrWkX3y5
 AFyrW34jvFWUt37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvE1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2
 jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzx
 vE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8
 JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYx
 C7Mx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVCm-wCF
 04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26ryrJr1UJwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWI
 evJa73UjIFyTuYvjfUwYFCUUUUU
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
--------------F725EC670056822656FA1CAD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Richard,

On 2021/11/20 下午3:17, Richard Henderson wrote:
> On 11/19/21 7:13 AM, Song Gao wrote:
>> +static bool gen_rrr(DisasContext *ctx, arg_rrr *a,
>> +                    DisasExtend src1_ext, DisasExtend src2_ext,
>> +                    DisasExtend dst_ext, void (*func)(TCGv, TCGv, 
>> TCGv))
>> +{
>> +    TCGv dest = gpr_dst(ctx, a->rd, dst_ext);
>> +    TCGv src1 = gpr_src(ctx, a->rj, src1_ext);
>> +    TCGv src2 = gpr_src(ctx, a->rk, src2_ext);
>> +
>> +    func(dest, src1, src2);
>> +
>> +    /* dst_ext is EXT_NONE and input is dest, We don't run 
>> gen_set_gpr. */
>> +    if (dst_ext) {
>> +        gen_set_gpr(a->rd, dest, dst_ext);
>> +    }
>
> Why the (incomplete) condition around gen_set_gpr?
>
> I think it's a bug to not name EXT_NONE in the test (just because 
> EXT_NONE == 0 now...), but I also think you should not have added the 
> test at all.  We will not generate any code in the end within 
> gen_set_gpr, but it allows the routines to be self-contained.  You 
> shouldn't assume what gpr_dst returned.
>
You're right, gen_set_gpr not need EXT_NONE at all, and we need not condition around gen_set_gpr.
I think that if we know the dst_ext is EXT_NONE, we do't need gen_set_gpr.  I'll correct them on v12.

Thanks
Song Gao

>
> r~

--------------F725EC670056822656FA1CAD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi Richard,
</pre>
    <div class="moz-cite-prefix">On 2021/11/20 下午3:17, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6ccd9c56-9db6-7a40-d59c-22bf3fc2f6b0@linaro.org">On
      11/19/21 7:13 AM, Song Gao wrote:
      <br>
      <blockquote type="cite">+static bool gen_rrr(DisasContext *ctx,
        arg_rrr *a,
        <br>
        +                    DisasExtend src1_ext, DisasExtend src2_ext,
        <br>
        +                    DisasExtend dst_ext, void (*func)(TCGv,
        TCGv, TCGv))
        <br>
        +{
        <br>
        +    TCGv dest = gpr_dst(ctx, a-&gt;rd, dst_ext);
        <br>
        +    TCGv src1 = gpr_src(ctx, a-&gt;rj, src1_ext);
        <br>
        +    TCGv src2 = gpr_src(ctx, a-&gt;rk, src2_ext);
        <br>
        +
        <br>
        +    func(dest, src1, src2);
        <br>
        +
        <br>
        +    /* dst_ext is EXT_NONE and input is dest, We don't run
        gen_set_gpr. */
        <br>
        +    if (dst_ext) {
        <br>
        +        gen_set_gpr(a-&gt;rd, dest, dst_ext);
        <br>
        +    }
        <br>
      </blockquote>
      <br>
      Why the (incomplete) condition around gen_set_gpr?
      <br>
      <br>
      I think it's a bug to not name EXT_NONE in the test (just because
      EXT_NONE == 0 now...), but I also think you should not have added
      the test at all.  We will not generate any code in the end within
      gen_set_gpr, but it allows the routines to be self-contained.  You
      shouldn't assume what gpr_dst returned.
      <br>
      <br>
    </blockquote>
    <pre>You're right, gen_set_gpr not need EXT_NONE at all, and we need not condition around gen_set_gpr. 
I think that if we know the dst_ext is EXT_NONE, we do't need gen_set_gpr.  I'll correct them on v12. 

Thanks
Song Gao
</pre>
    <blockquote type="cite"
      cite="mid:6ccd9c56-9db6-7a40-d59c-22bf3fc2f6b0@linaro.org">
      <br>
      r~
      <br>
    </blockquote>
  </body>
</html>

--------------F725EC670056822656FA1CAD--


