Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BACC56E04EF
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 04:54:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmn5P-0001iX-JO; Wed, 12 Apr 2023 22:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pmn5M-0001gE-J1
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 22:53:20 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pmn5J-0004bI-RZ
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 22:53:20 -0400
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8BxMI+Tbjdk+5gbAA--.42910S3;
 Thu, 13 Apr 2023 10:53:08 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bxab2SbjdkV8YhAA--.35723S3; 
 Thu, 13 Apr 2023 10:53:07 +0800 (CST)
Subject: Re: [RFC PATCH v2 38/44] target/loongarch: Implement vbitsel vset
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-39-gaosong@loongson.cn>
 <dc51342e-952c-c014-3b60-4dd751646468@linaro.org>
 <ac4562c5-ea37-d57a-b1dd-02b21af72985@loongson.cn>
 <f785b8f3-d7f3-a481-81c3-3603542a0111@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <58a22259-8bf0-e3fc-720a-0d8d3872e8d3@loongson.cn>
Date: Thu, 13 Apr 2023 10:53:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f785b8f3-d7f3-a481-81c3-3603542a0111@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------DAF1BBD9140B5A923A0C472A"
Content-Language: en-US
X-CM-TRANSID: AQAAf8Bxab2SbjdkV8YhAA--.35723S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxuF4kWFWkJw4xGw17Zry7ZFb_yoWrAw1xpr
 18Jr1UJryUJr18Jr1UJr1UJryUJr1UJw1UJr1UJF1UJr1UJr1jqr1UXr1jgr1UJr48Jr1U
 Jr1UJr1UZr1UJrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 DUYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUUbxxYFVCjjxCrM7AC8VAFwI0_Jr0_
 Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFV
 AK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2
 z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr
 1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG
 8wAqjxCEc2xF0cIa020Ex4CE44I27wAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aV
 AFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx8GjcxK6IxK0xII
 j40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
 Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_JrI_JrWlx2IqxVCjr7xvwVAFwI0_JrI_JrWl
 x4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
 1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_
 JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCT
 nIWIevJa73UjIFyTuYvjxUY_-PUUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-1.083, SPF_HELO_PASS=-0.001,
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
--------------DAF1BBD9140B5A923A0C472A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2023/4/12 下午2:53, Richard Henderson 写道:
>
>>>> +#define SETANYEQZ(NAME, BIT, E) \
>>>> +void HELPER(NAME)(CPULoongArchState *env, uint32_t cd, uint32_t vj) \
>>>> +{                                                                   \
>>>> +    int i; \
>>>> +    bool ret = false;                                               \
>>>> +    VReg *Vj = &(env->fpr[vj].vreg); \
>>>> +                                                                    \
>>>> +    for (i = 0; i < LSX_LEN/BIT; i++) {                             \
>>>> +        ret |= (Vj->E(i) == 0);                                     \
>>>> + } \
>>>> +    env->cf[cd & 0x7] = ret;                                        \
>>>> +}
>>>> +SETANYEQZ(vsetanyeqz_b, 8, B)
>>>> +SETANYEQZ(vsetanyeqz_h, 16, H)
>>>> +SETANYEQZ(vsetanyeqz_w, 32, W)
>>>> +SETANYEQZ(vsetanyeqz_d, 64, D)
>>>
>>> These could be inlined, though slightly harder.
>>> C.f. target/arm/sve_helper.c, do_match2 (your n == 0).
>>>
>> Do you mean an inline like trans_vseteqz_v or just an inline helper 
>> function?
>
> I meant inline tcg code generation, instead of a call to a helper.
> But even if we keep this in a helper, see do_match2 for avoiding the 
> loop over bytes. 
Ok,
e.g
#define SETANYEQZ(NAME, MO)                                  \
void HELPER(NAME)(CPULoongArchState *env, uint32_t cd, uint32_t vj) \
{                                                                 \
     int i;                                                                \
     bool ret = false; \
     VReg *Vj = &(env->fpr[vj].vreg); \
\
     ret = do_match2(0, (uint64_t)Vj->D(0), (uint64_t)Vj->D(1), 
MO);              \
     env->cf[cd & 0x7] = ret;      \
}
SETANYEQZ(vsetanyeqz_b, MO_8)
SETANYEQZ(vsetanyeqz_h, MO_16)
SETANYEQZ(vsetanyeqz_w, MO_32)
SETANYEQZ(vsetanyeqz_d, MO_64)

and
vsetanyeqz.b    $fcc5  $vr11
   v11    : {edc0004d576eef5b, ec03ec0fec03ea47}
------------------
do_match2
bits is 8
m1 is ec03ec0fec03ea47
m0 is edc0004d576eef5b
ones is 1010101
sings is 80808080
cmp1 is 0
cmp0 is edc0004d576eef5b
cmp1 is ec03ec0fec03ea47
cmp0 is 10000
cmp1 is 3000100
ret is 0

but,  the results is not correct  for vsetanyeqz.b. :-)

Thanks.
Song Gao

--------------DAF1BBD9140B5A923A0C472A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2023/4/12 下午2:53, Richard Henderson
      写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f785b8f3-d7f3-a481-81c3-3603542a0111@linaro.org"><br>
      <blockquote type="cite" style="color: #000000;">
        <blockquote type="cite" style="color: #000000;">
          <blockquote type="cite" style="color: #000000;">+#define
            SETANYEQZ(NAME, BIT, E)                                    
            \
            <br>
            +void HELPER(NAME)(CPULoongArchState *env, uint32_t cd,
            uint32_t vj) \
            <br>
+{                                                                   \
            <br>
            +    int
            i;                                                         
            \
            <br>
            +    bool ret =
            false;                                               \
            <br>
            +    VReg *Vj =
            &amp;(env-&gt;fpr[vj].vreg);                               
            \
            <br>
+                                                                    \
            <br>
            +    for (i = 0; i &lt; LSX_LEN/BIT; i++)
            {                             \
            <br>
            +        ret |= (Vj-&gt;E(i) ==
            0);                                     \
            <br>
            + } \
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
        Do you mean an inline like trans_vseteqz_v or just an inline
        helper function?
        <br>
      </blockquote>
      <br>
      I meant inline tcg code generation, instead of a call to a helper.
      <br>
      But even if we keep this in a helper, see do_match2 for avoiding
      the loop over bytes.
    </blockquote>
    Ok,<br>
    e.g<br>
    #define SETANYEQZ(NAME, MO)                                        
                                     \<br>
    void HELPER(NAME)(CPULoongArchState *env, uint32_t cd, uint32_t vj)
    \<br>
    {                                                                   
                                                                    \<br>
        int i;                                                         
                                                                   \<br>
        bool ret =
false;                                                                                                   
    \<br>
        VReg *Vj =
&amp;(env-&gt;fpr[vj].vreg);                                                                        
    \<br>
                               
                                                                                                        
    \<br>
        ret = do_match2(0, (uint64_t)Vj-&gt;D(0), (uint64_t)Vj-&gt;D(1),
    MO);              \<br>
        env-&gt;cf[cd &amp; 0x7] =
ret;                                                                                
         \<br>
    }<br>
    SETANYEQZ(vsetanyeqz_b, MO_8)<br>
    SETANYEQZ(vsetanyeqz_h, MO_16)<br>
    SETANYEQZ(vsetanyeqz_w, MO_32)<br>
    SETANYEQZ(vsetanyeqz_d, MO_64)<br>
    <br>
    and <br>
    vsetanyeqz.b    $fcc5  $vr11<br>
      v11    : {edc0004d576eef5b, ec03ec0fec03ea47}<br>
    ------------------<br>
    do_match2 <br>
    bits is 8<br>
    m1 is ec03ec0fec03ea47<br>
    m0 is edc0004d576eef5b<br>
    ones is 1010101<br>
    sings is 80808080<br>
    cmp1 is 0<br>
    cmp0 is edc0004d576eef5b<br>
    cmp1 is ec03ec0fec03ea47<br>
    cmp0 is 10000<br>
    cmp1 is 3000100<br>
    ret is 0<br>
    <p>but,  the results is not correct  for vsetanyeqz.b.  <span
        class="moz-smiley-s1"><span>:-)</span></span><br>
    </p>
    Thanks.<br>
    Song Gao<br>
  </body>
</html>

--------------DAF1BBD9140B5A923A0C472A--


