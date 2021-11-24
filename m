Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D37245B60B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 09:00:05 +0100 (CET)
Received: from localhost ([::1]:58820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpnCG-0007xe-4t
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 03:00:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mpn35-0000PD-4v
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:50:38 -0500
Received: from mail.loongson.cn ([114.242.206.163]:45828 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mpn2z-0007fL-Va
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:50:33 -0500
Received: from [10.20.42.193] (unknown [10.20.42.193])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx1tO97p1hSeoAAA--.4182S3;
 Wed, 24 Nov 2021 15:50:21 +0800 (CST)
Subject: Re: [PATCH v11 19/26] linux-user: Add LoongArch signal support
To: Richard Henderson <richard.henderson@linaro.org>
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-20-git-send-email-gaosong@loongson.cn>
 <9195824d-31d2-f2e8-610b-f8f86d687707@linaro.org>
 <4b0f0b90-23c8-3609-fe2f-91b086dde081@loongson.cn>
 <42490620-1333-42b3-f8bb-f0c5d24cd856@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <aa805420-e24c-2011-3999-1b9ecc9311b6@loongson.cn>
Date: Wed, 24 Nov 2021 15:50:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <42490620-1333-42b3-f8bb-f0c5d24cd856@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------A17A0BFFA2B0D878932A9877"
Content-Language: en-US
X-CM-TRANSID: AQAAf9Dx1tO97p1hSeoAAA--.4182S3
X-Coremail-Antispam: 1UD129KBjvJXoW7CFWrAw43Kw4UXFWkGF17KFg_yoW8Zw4xpF
 y8Jrs7JrWUKFZ5Gr1DGF1UX345Jr18Gw17Wa4xX3WIkas5XrZagrW8XF4j9F13ur4rGr45
 KF1ruay0vFWxXFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvK1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
 87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
 Aq07x20xvEncxIr21lYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4U
 McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I
 1l7480Y4vEI4kI2Ix0rVAqx4xJMxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK6svPMxAI
 w28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_XrWUJr1UMxC20s026xCaFVCjc4AY6r
 1j6r4UMI8I3I0E5I8CrVAFwI0_JrI_JrWlx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
 b7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
 vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI
 42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxh
 VjvjDU0xZFpf9x0JUtkuxUUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-4.1, SPF_HELO_PASS=-0.001,
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
--------------A17A0BFFA2B0D878932A9877
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Richard,

On 2021/11/24 下午3:27, Richard Henderson wrote:
> On 11/24/21 3:46 AM, gaosong wrote:
>> Hi Richard,
>>
>> On 2021/11/20 下午6:33, Richard Henderson wrote:
>>> On 11/19/21 7:13 AM, Song Gao wrote:
>>>>
>>>> +
>>>> +struct target_sigcontext {
>>>> +    uint64_t   sc_pc;
>>>> +    uint64_t   sc_gpr[32];
>>>> +    uint64_t   sc_fpr[32];
>>>> +    uint64_t   sc_fcc;
>>>> +    uint32_t   sc_fcsr;
>>>> +    uint32_t   sc_flags;
>>>> +};
>>>
>>> Does not match
>>> https://github.com/loongson/linux/blob/loongarch-next/arch/loongarch/include/uapi/asm/sigcontext.h 
>>>
>>>
>> #define FPU_REG_WIDTH   256
>> union fpureg {
>>      uint32_t   val32[FPU_REG_WIDTH / 32];
>>      uint64_t   val64[FPU_REG_WIDTH / 64];
>> };
>>
>> struct target_sigcontext {
>>      uint64_t   sc_pc;
>>      uint64_t   sc_regs[32];
>>      uint32_t   sc_flags;
>>
>>      uint32_t   sc_fcsr;
>>      uint32_t   sc_vcsr;
>>      uint64_t   sc_fcc;
>>      uint64_t   scr[4];
>>      union fpureg    sc_fpregs[32] __attribute__((aligned(32)));
>>
>>      uint32_t   sc_reserved;
>> };
>>
>> Is this OK?
>
> No, sc_reserved does not match.
>
uint8   sc_reserved[4096] __attribute__((aligned(16)));

BTW,  should we set scr[0-3] as 0 ?

>>
>>>> +
>>>> +struct target_ucontext {
>>>> +    target_ulong tuc_flags;
>>>> +    target_ulong tuc_link;
>>>> +    target_stack_t tuc_stack;
>>>> +    target_ulong pad0;
>>>> +    struct target_sigcontext tuc_mcontext;
>>>> +    target_sigset_t tuc_sigmask;
>>>> +};
>>>
>>> Does not match
>>> https://github.com/loongson/linux/blob/loongarch-next/arch/loongarch/include/uapi/asm/ucontext.h 
>>>
>>>
>> struct target_ucontext {
>>      target_ulong tuc_flags;
>>      target_ulong tuc_link;
>>      target_stack_t tuc_stack;
>>      target_sigset_t tuc_sigmask;
>>      target_ulong pad0;
>>      struct target_sigcontext tuc_mcontext;
>> };
>>
>> Is this OK?
>
> No, pad0 does not match __unused.
>
uint8  unused[1024 / 8 - sizeof(target_sigset_t)];
Is this right?

Thanks
Song Gao

>
> r~

--------------A17A0BFFA2B0D878932A9877
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi Richard,
</pre>
    <div class="moz-cite-prefix">On 2021/11/24 下午3:27, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:42490620-1333-42b3-f8bb-f0c5d24cd856@linaro.org">On
      11/24/21 3:46 AM, gaosong wrote:
      <br>
      <blockquote type="cite">Hi Richard,
        <br>
        <br>
        On 2021/11/20 下午6:33, Richard Henderson wrote:
        <br>
        <blockquote type="cite">On 11/19/21 7:13 AM, Song Gao wrote:
          <br>
          <blockquote type="cite">
            <br>
            +
            <br>
            +struct target_sigcontext {
            <br>
            +    uint64_t   sc_pc;
            <br>
            +    uint64_t   sc_gpr[32];
            <br>
            +    uint64_t   sc_fpr[32];
            <br>
            +    uint64_t   sc_fcc;
            <br>
            +    uint32_t   sc_fcsr;
            <br>
            +    uint32_t   sc_flags;
            <br>
            +};
            <br>
          </blockquote>
          <br>
          Does not match
          <br>
<a class="moz-txt-link-freetext" href="https://github.com/loongson/linux/blob/loongarch-next/arch/loongarch/include/uapi/asm/sigcontext.h">https://github.com/loongson/linux/blob/loongarch-next/arch/loongarch/include/uapi/asm/sigcontext.h</a>
          <br>
          <br>
        </blockquote>
        #define FPU_REG_WIDTH   256
        <br>
        union fpureg {
        <br>
             uint32_t   val32[FPU_REG_WIDTH / 32];
        <br>
             uint64_t   val64[FPU_REG_WIDTH / 64];
        <br>
        };
        <br>
        <br>
        struct target_sigcontext {
        <br>
             uint64_t   sc_pc;
        <br>
             uint64_t   sc_regs[32];
        <br>
             uint32_t   sc_flags;
        <br>
        <br>
             uint32_t   sc_fcsr;
        <br>
             uint32_t   sc_vcsr;
        <br>
             uint64_t   sc_fcc;
        <br>
             uint64_t   scr[4];
        <br>
             union fpureg    sc_fpregs[32] __attribute__((aligned(32)));
        <br>
        <br>
             uint32_t   sc_reserved;
        <br>
        };
        <br>
        <br>
        Is this OK?
        <br>
      </blockquote>
      <br>
      No, sc_reserved does not match.
      <br>
      <br>
    </blockquote>
    <pre>uint8   sc_reserved[4096] __attribute__((aligned(16)));

BTW,  should we set scr[0-3] as 0 ?
</pre>
    <blockquote type="cite"
      cite="mid:42490620-1333-42b3-f8bb-f0c5d24cd856@linaro.org">
      <blockquote type="cite">
        <br>
        <blockquote type="cite">
          <blockquote type="cite">+
            <br>
            +struct target_ucontext {
            <br>
            +    target_ulong tuc_flags;
            <br>
            +    target_ulong tuc_link;
            <br>
            +    target_stack_t tuc_stack;
            <br>
            +    target_ulong pad0;
            <br>
            +    struct target_sigcontext tuc_mcontext;
            <br>
            +    target_sigset_t tuc_sigmask;
            <br>
            +};
            <br>
          </blockquote>
          <br>
          Does not match
          <br>
<a class="moz-txt-link-freetext" href="https://github.com/loongson/linux/blob/loongarch-next/arch/loongarch/include/uapi/asm/ucontext.h">https://github.com/loongson/linux/blob/loongarch-next/arch/loongarch/include/uapi/asm/ucontext.h</a>
          <br>
          <br>
        </blockquote>
        struct target_ucontext {
        <br>
             target_ulong tuc_flags;
        <br>
             target_ulong tuc_link;
        <br>
             target_stack_t tuc_stack;
        <br>
             target_sigset_t tuc_sigmask;
        <br>
             target_ulong pad0;
        <br>
             struct target_sigcontext tuc_mcontext;
        <br>
        };
        <br>
        <br>
        Is this OK?
        <br>
      </blockquote>
      <br>
      No, pad0 does not match __unused.
      <br>
      <br>
    </blockquote>
    <pre>uint8  unused[1024 / 8 - sizeof(target_sigset_t)];  
Is this right?

Thanks
Song Gao
</pre>
    <blockquote type="cite"
      cite="mid:42490620-1333-42b3-f8bb-f0c5d24cd856@linaro.org">
      <br>
      r~
      <br>
    </blockquote>
  </body>
</html>

--------------A17A0BFFA2B0D878932A9877--


