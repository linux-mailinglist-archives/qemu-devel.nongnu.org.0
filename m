Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D83726DD983
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 13:38:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmCJL-0002NR-JW; Tue, 11 Apr 2023 07:37:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pmCJG-0002NB-Lq
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 07:37:14 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pmCJD-00050L-Qy
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 07:37:14 -0400
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8DxEzRcRjVkwCEaAA--.40488S3;
 Tue, 11 Apr 2023 19:37:00 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxprxcRjVkZ1UeAA--.30120S3; 
 Tue, 11 Apr 2023 19:37:00 +0800 (CST)
Subject: Re: [RFC PATCH v2 38/44] target/loongarch: Implement vbitsel vset
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-39-gaosong@loongson.cn>
 <dc51342e-952c-c014-3b60-4dd751646468@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <ac4562c5-ea37-d57a-b1dd-02b21af72985@loongson.cn>
Date: Tue, 11 Apr 2023 19:37:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <dc51342e-952c-c014-3b60-4dd751646468@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------624A3210EE90ED531B3721C9"
Content-Language: en-US
X-CM-TRANSID: AQAAf8BxprxcRjVkZ1UeAA--.30120S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxAr4rCFW5ZF18ZFyxJFW5ZFb_yoW5KF4rpr
 18Ar1UJryUJr18Jr1UJr1UtryUJr1UJw1UJr1UJF1UArWUJr1qqr1UXr1jgr1UJr48Xr1U
 Jr1UXr1jvr1UJrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 DUYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUUb4xYFVCjjxCrM7AC8VAFwI0_Jr0_
 Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFV
 AK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2
 z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM2
 8EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc80
 4VCY07AIYIkI8VC2zVCFFI0UMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxV
 WUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l7480Y4vEI4kI2Ix0rVAq
 x4xJMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUGVWUWwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
 42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxh
 VjvjDU0xZFpf9x07UEFAJUUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-2.17, SPF_HELO_PASS=-0.001,
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
--------------624A3210EE90ED531B3721C9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2023/4/4 上午9:03, Richard Henderson 写道:
>> +void HELPER(vseteqz_v)(CPULoongArchState *env, uint32_t cd, uint32_t 
>> vj)
>> +{
>> +    VReg *Vj = &(env->fpr[vj].vreg);
>> +    env->cf[cd & 0x7] = (Vj->Q(0) == 0);
>> +}
>> +
>> +void HELPER(vsetnez_v)(CPULoongArchState *env, uint32_t cd, uint32_t 
>> vj)
>> +{
>> +    VReg *Vj = &(env->fpr[vj].vreg);
>> +    env->cf[cd & 0x7] = (Vj->Q(0) != 0);
>> +}
>
> This is trivial inline.

e.g

static bool trans_vseteqz_v(DisasContext *ctx, arg_cv *a)
{
     TCGv_i64  t1, t2, al, ah, zero;

     al = tcg_temp_new_i64();
     ah = tcg_temp_new_i64();
     t1 = tcg_temp_new_i64();
     t2 = tcg_temp_new_i64();
     zero = tcg_constant_i64(0);

     get_vreg64(ah, a->vj, 1);
     get_vreg64(al, a->vj, 0);

     CHECK_SXE;
     tcg_gen_setcond_i64(TCG_COND_EQ, t1, al, zero);
     tcg_gen_setcond_i64(TCG_COND_EQ, t2, ah, zero);
     tcg_gen_and_i64(t1, t1, t2);
     tcg_gen_st8_tl(t1, cpu_env, offsetof(CPULoongArchState, cf[a->cd & 
0x7]));

     return true;
}

and

static bool trans_vsetnez_v(DisasContext *ctx, arg_cv *a)
{
     TCGv_i64  t1, t2, al, ah, zero;

     al = tcg_temp_new_i64();
     ah = tcg_temp_new_i64();
     t1 = tcg_temp_new_i64();
     t2 = tcg_temp_new_i64();
     zero = tcg_constant_i64(0);

     get_vreg64(ah, a->vj, 1);
     get_vreg64(al, a->vj, 0);

     CHECK_SXE;
     tcg_gen_setcond_i64(TCG_COND_NE, t1, al, zero);
     tcg_gen_setcond_i64(TCG_COND_NE, t2, ah, zero);
     tcg_gen_or_i64(t1, t1, t2);
     tcg_gen_st8_tl(t1, cpu_env, offsetof(CPULoongArchState, cf[a->cd & 
0x7]));

     return true;
}

>> +#define SETANYEQZ(NAME, BIT, E)                                     \
>> +void HELPER(NAME)(CPULoongArchState *env, uint32_t cd, uint32_t vj) \
>> +{                                                                   \
>> +    int i;                                                          \
>> +    bool ret = false;                                               \
>> +    VReg *Vj = &(env->fpr[vj].vreg);                                \
>> +                                                                    \
>> +    for (i = 0; i < LSX_LEN/BIT; i++) {                             \
>> +        ret |= (Vj->E(i) == 0);                                     \
>> + } \
>> +    env->cf[cd & 0x7] = ret;                                        \
>> +}
>> +SETANYEQZ(vsetanyeqz_b, 8, B)
>> +SETANYEQZ(vsetanyeqz_h, 16, H)
>> +SETANYEQZ(vsetanyeqz_w, 32, W)
>> +SETANYEQZ(vsetanyeqz_d, 64, D)
>
> These could be inlined, though slightly harder.
> C.f. target/arm/sve_helper.c, do_match2 (your n == 0).
>
Do you mean an inline like trans_vseteqz_v or just an inline helper 
function?

Thanks.
Song Gao
> Anyway, leaving this as-is for now is also ok. 

--------------624A3210EE90ED531B3721C9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p> <br>
    </p>
    <div class="moz-cite-prefix">在 2023/4/4 上午9:03, Richard Henderson
      写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:dc51342e-952c-c014-3b60-4dd751646468@linaro.org">
      <blockquote type="cite" style="color: #000000;">+void
        HELPER(vseteqz_v)(CPULoongArchState *env, uint32_t cd, uint32_t
        vj)
        <br>
        +{
        <br>
        +    VReg *Vj = &amp;(env-&gt;fpr[vj].vreg);
        <br>
        +    env-&gt;cf[cd &amp; 0x7] = (Vj-&gt;Q(0) == 0);
        <br>
        +}
        <br>
        +
        <br>
        +void HELPER(vsetnez_v)(CPULoongArchState *env, uint32_t cd,
        uint32_t vj)
        <br>
        +{
        <br>
        +    VReg *Vj = &amp;(env-&gt;fpr[vj].vreg);
        <br>
        +    env-&gt;cf[cd &amp; 0x7] = (Vj-&gt;Q(0) != 0);
        <br>
        +}
        <br>
      </blockquote>
      <br>
      This is trivial inline. <br>
    </blockquote>
    <p>e.g <br>
    </p>
    <p>static bool trans_vseteqz_v(DisasContext *ctx, arg_cv *a)<br>
      {<br>
          TCGv_i64  t1, t2, al, ah, zero;<br>
      <br>
          al = tcg_temp_new_i64();<br>
          ah = tcg_temp_new_i64();<br>
          t1 = tcg_temp_new_i64();<br>
          t2 = tcg_temp_new_i64();<br>
          zero = tcg_constant_i64(0);<br>
      <br>
          get_vreg64(ah, a-&gt;vj, 1);<br>
          get_vreg64(al, a-&gt;vj, 0);<br>
      <br>
          CHECK_SXE;<br>
          tcg_gen_setcond_i64(TCG_COND_EQ, t1, al, zero);<br>
          tcg_gen_setcond_i64(TCG_COND_EQ, t2, ah, zero);<br>
          tcg_gen_and_i64(t1, t1, t2);<br>
          tcg_gen_st8_tl(t1, cpu_env, offsetof(CPULoongArchState,
      cf[a-&gt;cd &amp; 0x7]));<br>
      <br>
          return true;<br>
      }<br>
    </p>
    <p>and</p>
    <p>static bool trans_vsetnez_v(DisasContext *ctx, arg_cv *a)<br>
      {<br>
          TCGv_i64  t1, t2, al, ah, zero;<br>
      <br>
          al = tcg_temp_new_i64();<br>
          ah = tcg_temp_new_i64();<br>
          t1 = tcg_temp_new_i64();<br>
          t2 = tcg_temp_new_i64();<br>
          zero = tcg_constant_i64(0);<br>
      <br>
          get_vreg64(ah, a-&gt;vj, 1);<br>
          get_vreg64(al, a-&gt;vj, 0);<br>
      <br>
          CHECK_SXE;<br>
          tcg_gen_setcond_i64(TCG_COND_NE, t1, al, zero);<br>
          tcg_gen_setcond_i64(TCG_COND_NE, t2, ah, zero);<br>
          tcg_gen_or_i64(t1, t1, t2);<br>
          tcg_gen_st8_tl(t1, cpu_env, offsetof(CPULoongArchState,
      cf[a-&gt;cd &amp; 0x7]));<br>
      <br>
          return true;<br>
      }<br>
      <br>
    </p>
    <blockquote type="cite"
      cite="mid:dc51342e-952c-c014-3b60-4dd751646468@linaro.org">
      <blockquote type="cite" style="color: #000000;">+#define
        SETANYEQZ(NAME, BIT, E)                                     \
        <br>
        +void HELPER(NAME)(CPULoongArchState *env, uint32_t cd, uint32_t
        vj) \
        <br>
+{                                                                   \
        <br>
        +    int
        i;                                                          \
        <br>
        +    bool ret =
        false;                                               \
        <br>
        +    VReg *Vj =
        &amp;(env-&gt;fpr[vj].vreg);                                \
        <br>
+                                                                    \
        <br>
        +    for (i = 0; i &lt; LSX_LEN/BIT; i++)
        {                             \
        <br>
        +        ret |= (Vj-&gt;E(i) ==
        0);                                     \
        <br>
        +   
        }                                                              
        \
        <br>
        +    env-&gt;cf[cd &amp; 0x7] =
        ret;                                        \
        <br>
        +}
        <br>
        +SETANYEQZ(vsetanyeqz_b, 8, B)
        <br>
        +SETANYEQZ(vsetanyeqz_h, 16, H)
        <br>
        +SETANYEQZ(vsetanyeqz_w, 32, W)
        <br>
        +SETANYEQZ(vsetanyeqz_d, 64, D)
        <br>
      </blockquote>
      <br>
      These could be inlined, though slightly harder.
      <br>
      C.f. target/arm/sve_helper.c, do_match2 (your n == 0).
      <br>
      <br>
    </blockquote>
    Do you mean an inline like trans_vseteqz_v or just an inline helper
    function?<br>
    <br>
    Thanks.<br>
    Song Gao<br>
    <blockquote type="cite"
      cite="mid:dc51342e-952c-c014-3b60-4dd751646468@linaro.org">Anyway,
      leaving this as-is for now is also ok.
    </blockquote>
  </body>
</html>

--------------624A3210EE90ED531B3721C9--


