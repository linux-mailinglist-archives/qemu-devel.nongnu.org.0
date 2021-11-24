Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B7C45B232
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 03:48:40 +0100 (CET)
Received: from localhost ([::1]:40976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpiKt-0008U7-0q
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 21:48:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mpiJI-0007DI-Cj
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 21:47:00 -0500
Received: from mail.loongson.cn ([114.242.206.163]:41528 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mpiJF-0000cV-B8
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 21:47:00 -0500
Received: from [10.20.42.193] (unknown [10.20.42.193])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxptOVp51hINUAAA--.4115S3;
 Wed, 24 Nov 2021 10:46:45 +0800 (CST)
Subject: Re: [PATCH v11 19/26] linux-user: Add LoongArch signal support
To: Richard Henderson <richard.henderson@linaro.org>
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-20-git-send-email-gaosong@loongson.cn>
 <9195824d-31d2-f2e8-610b-f8f86d687707@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <4b0f0b90-23c8-3609-fe2f-91b086dde081@loongson.cn>
Date: Wed, 24 Nov 2021 10:46:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9195824d-31d2-f2e8-610b-f8f86d687707@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------0A7E28512270B16286893F1F"
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxptOVp51hINUAAA--.4115S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr1UWFWDWry5uw1fWw1kAFb_yoW8XrW8pF
 yrJw4xCrWUtFWrGr4DKFWUWr98Jr18Gry2ga4xXFyftayrXrZagry8XFs0vF15Za1rWrn8
 KFyDuayjvF4IqFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9j1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
 87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4
 CY6c8Ij28IcVAaY2xG8wAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_
 Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErc
 IFxwCjr7xvwVCIw2I0I7xG6c02F41lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE-syl
 42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW5Wr1UJr1l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUGVWUWwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0D
 MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvf
 C2KfnxnUUI43ZEXa7VU1g4S7UUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-3.515, SPF_HELO_PASS=-0.001,
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
--------------0A7E28512270B16286893F1F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Richard,

On 2021/11/20 下午6:33, Richard Henderson wrote:
> On 11/19/21 7:13 AM, Song Gao wrote:
>>
>> +
>> +struct target_sigcontext {
>> +    uint64_t   sc_pc;
>> +    uint64_t   sc_gpr[32];
>> +    uint64_t   sc_fpr[32];
>> +    uint64_t   sc_fcc;
>> +    uint32_t   sc_fcsr;
>> +    uint32_t   sc_flags;
>> +};
>
> Does not match
> https://github.com/loongson/linux/blob/loongarch-next/arch/loongarch/include/uapi/asm/sigcontext.h 
>
>
#define FPU_REG_WIDTH   256
union fpureg {
     uint32_t   val32[FPU_REG_WIDTH / 32];
     uint64_t   val64[FPU_REG_WIDTH / 64];
};

struct target_sigcontext {
     uint64_t   sc_pc;
     uint64_t   sc_regs[32];
     uint32_t   sc_flags;

     uint32_t   sc_fcsr;
     uint32_t   sc_vcsr;
     uint64_t   sc_fcc;
     uint64_t   scr[4];
     union fpureg    sc_fpregs[32] __attribute__((aligned(32)));

     uint32_t   sc_reserved;
};

Is this OK?

>> +
>> +struct target_ucontext {
>> +    target_ulong tuc_flags;
>> +    target_ulong tuc_link;
>> +    target_stack_t tuc_stack;
>> +    target_ulong pad0;
>> +    struct target_sigcontext tuc_mcontext;
>> +    target_sigset_t tuc_sigmask;
>> +};
>
> Does not match
> https://github.com/loongson/linux/blob/loongarch-next/arch/loongarch/include/uapi/asm/ucontext.h 
>
>
struct target_ucontext {
     target_ulong tuc_flags;
     target_ulong tuc_link;
     target_stack_t tuc_stack;
     target_sigset_t tuc_sigmask;
     target_ulong pad0;
     struct target_sigcontext tuc_mcontext;
};

Is this OK?

Thanks
Song Gao


--------------0A7E28512270B16286893F1F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi Richard,
</pre>
    <div class="moz-cite-prefix">On 2021/11/20 下午6:33, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:9195824d-31d2-f2e8-610b-f8f86d687707@linaro.org">On
      11/19/21 7:13 AM, Song Gao wrote:
      <br>
      <blockquote type="cite"> <br>
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
    <pre>#define FPU_REG_WIDTH   256
union fpureg {
    uint32_t   val32[FPU_REG_WIDTH / 32];
    uint64_t   val64[FPU_REG_WIDTH / 64];
};

struct target_sigcontext {
    uint64_t   sc_pc;
    uint64_t   sc_regs[32];
    uint32_t   sc_flags;

    uint32_t   sc_fcsr;
    uint32_t   sc_vcsr;
    uint64_t   sc_fcc;
    uint64_t   scr[4];
    union fpureg    sc_fpregs[32] __attribute__((aligned(32)));

    uint32_t   sc_reserved;
};

Is this OK?
</pre>
    <blockquote type="cite"
      cite="mid:9195824d-31d2-f2e8-610b-f8f86d687707@linaro.org">
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
    <pre>struct target_ucontext {
    target_ulong tuc_flags;
    target_ulong tuc_link;
    target_stack_t tuc_stack;
    target_sigset_t tuc_sigmask;
    target_ulong pad0;
    struct target_sigcontext tuc_mcontext;
};

Is this OK?

Thanks
Song Gao
</pre>
  </body>
</html>

--------------0A7E28512270B16286893F1F--


