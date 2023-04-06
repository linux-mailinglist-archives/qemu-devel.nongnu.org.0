Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0E56D96CD
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 14:10:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkOQv-0002M7-Aj; Thu, 06 Apr 2023 08:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pkOQo-0002Lx-DR
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 08:09:35 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pkOQj-0000ZB-MN
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 08:09:34 -0400
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8Axu5dyti5kj0kXAA--.36193S3;
 Thu, 06 Apr 2023 20:09:23 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bxab1yti5k4CYXAA--.20564S3; 
 Thu, 06 Apr 2023 20:09:22 +0800 (CST)
Subject: Re: [RFC PATCH v2 15/44] target/loongarch: Implement
 vmul/vmuh/vmulw{ev/od}
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-16-gaosong@loongson.cn>
 <732518bf-6832-aac8-cd8a-367ef68831f1@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <283522f9-3cff-30a1-b8ba-20fc6dbf7d72@loongson.cn>
Date: Thu, 6 Apr 2023 20:09:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <732518bf-6832-aac8-cd8a-367ef68831f1@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------678664460A10C821018C52B0"
Content-Language: en-US
X-CM-TRANSID: AQAAf8Bxab1yti5k4CYXAA--.20564S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxCrWrtw48tF1Utw47Cr4xXrb_yoWrtFy7pF
 18try0qry5JF1rAryUJr1DKry7Zw1UAw1jqr1UXa4rAFWUtr1qqr15ZF1Y9r15Ga18Zw45
 J34UGryj9F18Xa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 DUYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUUbxxYFVCjjxCrM7AC8VAFwI0_Jr0_
 Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFV
 AK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2
 z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr
 1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487
 Mc804VCY07AIYIkI8VC2zVCFFI0UMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67
 AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l7480Y4vEI4kI2Ix0
 rVAqx4xJMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
 0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUGVWUWwC20s026x8GjcxK67AKxVWUGVWUWwC2
 zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
 4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
 CwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
 nIWIevJa73UjIFyTuYvjxUY_-PUUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-2.224, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a multi-part message in MIME format.
--------------678664460A10C821018C52B0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

HI, Richard

在 2023/3/29 上午4:46, Richard Henderson 写道:
>> +static void do_vmuh_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
>> +                      uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
>> +{
>> +    static const GVecGen3 op[4] = {
>> +        {
>> +            .fno = gen_helper_vmuh_b,
>> +            .vece = MO_8
>> +        },
>> +        {
>> +            .fno = gen_helper_vmuh_h,
>> +            .vece = MO_16
>> +        },
>> +        {
>> +            .fno = gen_helper_vmuh_w,
>> +            .vece = MO_32
>> +        },
>> +        {
>> +            .fno = gen_helper_vmuh_d,
>> +            .vece = MO_64
>> +        },
>> +    };
>
> Could be worth integer expansion, especially for MO_32/MO_64?
> Should be trivial...
For integer expansion.  How about the following code?

static void gen_vmuh_b(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
{
     int i;
     TCGv_i64 t1, t2;

     t1 = tcg_temp_new_i64();
     t2 = tcg_temp_new_i64();

     tcg_gen_mov_i64(t, tcg_constant_i64(0));

     for (i = 0; i < 8; i++) {
         tcg_gen_shri_i64(t1, a, 8 *i);
         tcg_gen_shri_i64(t2, b, 8 *i);
         tcg_gen_ext8s_i64(t1, t1);
         tcg_gen_ext8s_i64(t2, t2);
         tcg_gen_mul_i64(t1, t1, t2);
         tcg_gen_andi_i64(t1, t1, 0xffff);
         tcg_gen_shri_i64(t1, t1, 8);
         tcg_gen_shli_i64(t1, t1, 8 * i);
         tcg_gen_or_i64(t, t, t1);
     }
}

static void gen_vmuh_h(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
{
     int i;
     TCGv_i64 t1, t2;

     t1 = tcg_temp_new_i64();
     t2 = tcg_temp_new_i64();

     tcg_gen_mov_i64(t, tcg_constant_i64(0));

     for ( i = 0; i < 4; i++) {
         tcg_gen_shri_i64(t1, a, 16 *i);
         tcg_gen_shri_i64(t2, b, 16*i);
         tcg_gen_ext16s_i64(t1, t1);
         tcg_gen_ext16s_i64(t2, t2);
         tcg_gen_mul_i64(t1, t1, t2);
         tcg_gen_andi_i64(t1, t1, 0xffffffff);
         tcg_gen_shri_i64(t1, t1, 16);
         tcg_gen_shli_i64(t1, t1, 16 * i);
         tcg_gen_or_i64(t, t, t1);
     }
}

static void gen_vmuh_w(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
{
     TCGv_i64 t1, t2;

     t1 = tcg_temp_new_i64();
     t2 = tcg_temp_new_i64();
     tcg_gen_ext_i32_i64(t1, a);
     tcg_gen_ext_i32_i64(t2, b);
     tcg_gen_mul_i64(t2, t1, t2);
     tcg_gen_extrh_i64_i32(t, t2);
}

static void gen_vmuh_d(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
{
     TCGv_i64 t1;

     t1 = tcg_temp_new_i64();
     tcg_gen_muls2_i64(t1, t, a, b);
}

static void gen_vmuh_bu(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
{
     int i;
     TCGv_i64 t1, t2;

     t1 = tcg_temp_new_i64();
     t2 = tcg_temp_new_i64();

     tcg_gen_mov_i64(t, tcg_constant_i64(0));

     for (i = 0; i < 8; i++) {
         tcg_gen_shri_i64(t1, a, 8 * i);
         tcg_gen_shri_i64(t2, b, 8 * i);
         tcg_gen_ext8u_i64(t1, t1);
         tcg_gen_ext8u_i64(t2, t2);
         tcg_gen_mul_i64(t1, t1, t2);
         tcg_gen_shri_i64(t1, t1, 8);
         tcg_gen_shli_i64(t1, t1, 8 * i);
         tcg_gen_or_i64(t, t, t1);
     }
}

static void gen_vmuh_hu(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
{
     int i;
     TCGv_i64 t1, t2;

     t1 = tcg_temp_new_i64();
     t2 = tcg_temp_new_i64();

     tcg_gen_mov_i64(t, tcg_constant_i64(0));

     for (i = 0; i < 4; i++) {
         tcg_gen_shri_i64(t1, a, 16 *i);
         tcg_gen_shri_i64(t2, b, 16*i);
         tcg_gen_ext16u_i64(t1, t1);
         tcg_gen_ext16u_i64(t2, t2);
         tcg_gen_mul_i64(t1, t1, t2);
         tcg_gen_shri_i64(t1, t1, 16);
         tcg_gen_shli_i64(t1, t1, 16 * i);
         tcg_gen_or_i64(t, t, t1);
     }
}

static void gen_vmuh_wu(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
{
     TCGv_i64 t1, t2;

     t1 = tcg_temp_new_i64();
     t2 = tcg_temp_new_i64();
     tcg_gen_extu_i32_i64(t1, a);
     tcg_gen_extu_i32_i64(t2, b);
     tcg_gen_mul_i64(t2, t1, t2);
     tcg_gen_extrh_i64_i32(t, t2);
}

static void gen_vmuh_du(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
{
     TCGv_i64 t1;

     t1 = tcg_temp_new_i64();
     tcg_gen_mulu2_i64(t1, t, a, b);
}

Thanks.
Song Gao

--------------678664460A10C821018C52B0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>HI, Richard<br>
    </p>
    <div class="moz-cite-prefix">在 2023/3/29 上午4:46, Richard Henderson
      写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:732518bf-6832-aac8-cd8a-367ef68831f1@linaro.org">
      <blockquote type="cite" style="color: #000000;">+static void
        do_vmuh_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
        <br>
        +                      uint32_t vk_ofs, uint32_t oprsz, uint32_t
        maxsz)
        <br>
        +{
        <br>
        +    static const GVecGen3 op[4] = {
        <br>
        +        {
        <br>
        +            .fno = gen_helper_vmuh_b,
        <br>
        +            .vece = MO_8
        <br>
        +        },
        <br>
        +        {
        <br>
        +            .fno = gen_helper_vmuh_h,
        <br>
        +            .vece = MO_16
        <br>
        +        },
        <br>
        +        {
        <br>
        +            .fno = gen_helper_vmuh_w,
        <br>
        +            .vece = MO_32
        <br>
        +        },
        <br>
        +        {
        <br>
        +            .fno = gen_helper_vmuh_d,
        <br>
        +            .vece = MO_64
        <br>
        +        },
        <br>
        +    };
        <br>
      </blockquote>
      <br>
      Could be worth integer expansion, especially for MO_32/MO_64?
      <br>
      Should be trivial... <br>
    </blockquote>
    For integer expansion.  How about the following code?<br>
    <br>
    static void gen_vmuh_b(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)<br>
    {<br>
        int i;<br>
        TCGv_i64 t1, t2;<br>
    <br>
        t1 = tcg_temp_new_i64();<br>
        t2 = tcg_temp_new_i64();<br>
    <br>
        tcg_gen_mov_i64(t, tcg_constant_i64(0));<br>
    <br>
        for (i = 0; i &lt; 8; i++) {<br>
            tcg_gen_shri_i64(t1, a, 8 *i);<br>
            tcg_gen_shri_i64(t2, b, 8 *i);<br>
            tcg_gen_ext8s_i64(t1, t1);<br>
            tcg_gen_ext8s_i64(t2, t2);<br>
            tcg_gen_mul_i64(t1, t1, t2);<br>
            tcg_gen_andi_i64(t1, t1, 0xffff);<br>
            tcg_gen_shri_i64(t1, t1, 8); <br>
            tcg_gen_shli_i64(t1, t1, 8 * i);<br>
            tcg_gen_or_i64(t, t, t1);<br>
        }<br>
    }<br>
    <br>
    static void gen_vmuh_h(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)<br>
    {<br>
        int i;<br>
        TCGv_i64 t1, t2;<br>
    <br>
        t1 = tcg_temp_new_i64();<br>
        t2 = tcg_temp_new_i64();<br>
    <br>
        tcg_gen_mov_i64(t, tcg_constant_i64(0));<br>
    <br>
        for ( i = 0; i &lt; 4; i++) {<br>
            tcg_gen_shri_i64(t1, a, 16 *i);<br>
            tcg_gen_shri_i64(t2, b, 16*i);<br>
            tcg_gen_ext16s_i64(t1, t1);<br>
            tcg_gen_ext16s_i64(t2, t2);<br>
            tcg_gen_mul_i64(t1, t1, t2);<br>
            tcg_gen_andi_i64(t1, t1, 0xffffffff);<br>
            tcg_gen_shri_i64(t1, t1, 16);<br>
            tcg_gen_shli_i64(t1, t1, 16 * i);<br>
            tcg_gen_or_i64(t, t, t1);<br>
        }<br>
    }<br>
    <br>
    static void gen_vmuh_w(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)<br>
    {<br>
        TCGv_i64 t1, t2;<br>
    <br>
        t1 = tcg_temp_new_i64();<br>
        t2 = tcg_temp_new_i64();<br>
        tcg_gen_ext_i32_i64(t1, a);<br>
        tcg_gen_ext_i32_i64(t2, b);<br>
        tcg_gen_mul_i64(t2, t1, t2);<br>
        tcg_gen_extrh_i64_i32(t, t2);<br>
    }<br>
    <br>
    static void gen_vmuh_d(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)<br>
    {<br>
        TCGv_i64 t1;<br>
    <br>
        t1 = tcg_temp_new_i64();<br>
        tcg_gen_muls2_i64(t1, t, a, b);<br>
    }<br>
    <br>
    static void gen_vmuh_bu(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)<br>
    {<br>
        int i;<br>
        TCGv_i64 t1, t2;<br>
    <br>
        t1 = tcg_temp_new_i64();<br>
        t2 = tcg_temp_new_i64();<br>
    <br>
        tcg_gen_mov_i64(t, tcg_constant_i64(0));<br>
    <br>
        for (i = 0; i &lt; 8; i++) {<br>
            tcg_gen_shri_i64(t1, a, 8 * i);<br>
            tcg_gen_shri_i64(t2, b, 8 * i);<br>
            tcg_gen_ext8u_i64(t1, t1);<br>
            tcg_gen_ext8u_i64(t2, t2);<br>
            tcg_gen_mul_i64(t1, t1, t2);<br>
            tcg_gen_shri_i64(t1, t1, 8);<br>
            tcg_gen_shli_i64(t1, t1, 8 * i);<br>
            tcg_gen_or_i64(t, t, t1);<br>
        }<br>
    }<br>
    <br>
    static void gen_vmuh_hu(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)<br>
    {<br>
        int i;<br>
        TCGv_i64 t1, t2;<br>
    <br>
        t1 = tcg_temp_new_i64();<br>
        t2 = tcg_temp_new_i64();<br>
    <br>
        tcg_gen_mov_i64(t, tcg_constant_i64(0));<br>
    <br>
        for (i = 0; i &lt; 4; i++) {<br>
            tcg_gen_shri_i64(t1, a, 16 *i);<br>
            tcg_gen_shri_i64(t2, b, 16*i);<br>
            tcg_gen_ext16u_i64(t1, t1);<br>
            tcg_gen_ext16u_i64(t2, t2);<br>
            tcg_gen_mul_i64(t1, t1, t2);<br>
            tcg_gen_shri_i64(t1, t1, 16);<br>
            tcg_gen_shli_i64(t1, t1, 16 * i);<br>
            tcg_gen_or_i64(t, t, t1);<br>
        }<br>
    }<br>
    <br>
    static void gen_vmuh_wu(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)<br>
    {<br>
        TCGv_i64 t1, t2;<br>
    <br>
        t1 = tcg_temp_new_i64();<br>
        t2 = tcg_temp_new_i64();<br>
        tcg_gen_extu_i32_i64(t1, a);<br>
        tcg_gen_extu_i32_i64(t2, b);<br>
        tcg_gen_mul_i64(t2, t1, t2);<br>
        tcg_gen_extrh_i64_i32(t, t2);<br>
    }<br>
    <br>
    static void gen_vmuh_du(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)<br>
    {<br>
        TCGv_i64 t1;<br>
    <br>
        t1 = tcg_temp_new_i64();<br>
        tcg_gen_mulu2_i64(t1, t, a, b);<br>
    }<br>
    <br>
    Thanks.<br>
    Song Gao<br>
  </body>
</html>

--------------678664460A10C821018C52B0--


