Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D92F7547188
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 05:12:41 +0200 (CEST)
Received: from localhost ([::1]:36330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzrYG-0002Bv-20
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 23:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1nzrWV-0001TK-JQ
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 23:10:51 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53782 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1nzrWS-0004tp-HE
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 23:10:51 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx30+wB6RiFEM4AA--.24473S3; 
 Sat, 11 Jun 2022 11:10:40 +0800 (CST)
Subject: Re: [PATCH v15 8/9] target/loongarch: Adjust functions and structure
 to support user-mode
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220609024209.2406188-1-gaosong@loongson.cn>
 <20220609024209.2406188-9-gaosong@loongson.cn>
 <4c0fd198-922e-d94f-fec4-05c53c5d6858@linaro.org>
 <e6e9c111-ca44-0126-b7a5-dcffe33385a5@loongson.cn>
 <20b38d22-0c59-ec11-88e1-af0f1f604984@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <a6306006-d1df-e5eb-4f2c-5e1bf6adfe07@loongson.cn>
Date: Sat, 11 Jun 2022 11:10:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20b38d22-0c59-ec11-88e1-af0f1f604984@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------0B7B6A19815CB7D3DF9DE7D4"
Content-Language: en-US
X-CM-TRANSID: AQAAf9Dx30+wB6RiFEM4AA--.24473S3
X-Coremail-Antispam: 1UD129KBjvJXoWxtrWxCF1rXFyrAFy7JFWkWFg_yoW3AF18pr
 18Jr1UGrW8Jr18Jr1UJr1UJryUtr1UA3WUJr1UJF1UJr1UJr1jqr1UXryjgr1DJr48Jr17
 Jr1UJr1jvr1UJw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9j1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2
 jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
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
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This is a multi-part message in MIME format.
--------------0B7B6A19815CB7D3DF9DE7D4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022/6/11 上午6:45, Richard Henderson wrote:
> On 6/9/22 23:53, gaosong wrote:
>> Hi Richard,
>>
>> On 2022/6/10 上午2:42, Richard Henderson wrote:
>>>>   void helper_asrtle_d(CPULoongArchState *env, target_ulong rj, 
>>>> target_ulong rk)
>>>>   {
>>>>       if (rj > rk) {
>>>> +#ifdef CONFIG_USER_ONLY
>>>> +        cpu_loop_exit_sigsegv(env_cpu(env), GETPC(),
>>>> +                              MMU_DATA_LOAD, true, GETPC());
>>>> +#else
>>>>           do_raise_exception(env, EXCCODE_ADEM, GETPC());
>>>> +#endif
>>>
>>> This change is wrong.  First, the kernel's do_ade raises SIGBUS. 
>>> Second, GETPC() is a host address, not a guest address.  Third, this 
>>> highlights the fact that the existing system code is wrong, and 
>>> should be setting badvaddr.
>>>
>>> You need to
>>> (1) set badvaddr here, and then
>>> (2) handle EXCCODE_ADEM in linux-user/loongarch/cpu_loop.c to 
>>> force_fix_fault(TARGET_SIGBUS, TARGET_BUS_ADRERR, env->badvaddr). 
>>
>> badvaddr is env->pc or base->pc_next?
>
> I don't know.  The documentation for the ASRT{LE,GD}.D instructions is 
> incomplete.
>
> However, from the kernel code,
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/loongarch/kernel/traps.c#n360 
>
>
> I can see that the kernel expects *some* value to be set there.  Given 
> that this is the same trap used by the bound check memory accesses, I 
> presume that badvaddr is related to the memory access not the PC.  So 
> I would expect badvaddr to be RJ.
>
> But that is a guess.  Please check with your hardware engineers.

Thanks you,


I had tested asrtgt.d on hardware.  the log is :

the gdb log

(gdb) info registers
                   zero               ra tp               sp
R0   0000000000000000 000000fff7e7c774 000000fff7ffef20 000000ffffff6940
                     a0               a1 a2               a3
R4   0000000000000001 000000ffffff6a88 000000ffffff6a98 000000fff7fbc4b0
                     a4               a5 a6               a7
R8   0000000000000000 000000fff7fe6f70 000000ffffff6a80 0000000000000080
                     t0               t1 t2               t3
R12  0000000000000000 0000000000000000 0000000000000000 000000fff7fbeeb8
                     t4               t5 t6               t7
R16  000000fff7fbdd40 000000fff7fbdd40 7f7f7f7f7f7f7f7f 0000000000000000
                     t8                x fp               s0
R20  ffffff0000000000 0000000000000000 000000ffffff6960 0000000000000000
                     s1               s2 s3               s4
R24  0000000120000658 000000aaaabd9c60 0000000000000000 000000aaaabe9b50
                     s5               s6 s7               s8
R28  000000aaaabd9c60 0000000000000000 0000000000000000 000000aaaabcfa08
pc             0x120000638         0x120000638 <main+32>
badvaddr       0xfff7e935c8        0xfff7e935c8 <__cxa_atexit>
(gdb) stepi

Program received signal SIGSYS, Bad system call.
0x0000000120000638 in main () at asrtle.c:8
8        asm volatile("asrtgt.d  %0,%1\n\t"
(gdb) info registers
                   zero               ra tp               sp
R0   0000000000000000 000000fff7e7c774 000000fff7ffef20 000000ffffff6940
                     a0               a1 a2               a3
R4   0000000000000001 000000ffffff6a88 000000ffffff6a98 000000fff7fbc4b0
                     a4               a5 a6               a7
R8   0000000000000000 000000fff7fe6f70 000000ffffff6a80 0000000000000080
                     t0               t1 t2               t3
R12  0000000000000000 0000000000000000 0000000000000000 000000fff7fbeeb8
                     t4               t5 t6               t7
R16  000000fff7fbdd40 000000fff7fbdd40 7f7f7f7f7f7f7f7f 0000000000000000
                     t8                x fp               s0
R20  ffffff0000000000 0000000000000000 000000ffffff6960 0000000000000000
                     s1               s2 s3               s4
R24  0000000120000658 000000aaaabd9c60 0000000000000000 000000aaaabe9b50
                     s5               s6 s7               s8
R28  000000aaaabd9c60 0000000000000000 0000000000000000 000000aaaabcfa08
pc             0x120000638         0x120000638 <main+32>
badvaddr       0x120000638         0x120000638 <main+32>
(gdb) disas
Dump of assembler code for function main:
    0x0000000120000618 <+0>:    addi.d    $r3,$r3,-32(0xfe0)
    0x000000012000061c <+4>:    st.d    $r22,$r3,24(0x18)
    0x0000000120000620 <+8>:    addi.d    $r22,$r3,32(0x20)
    0x0000000120000624 <+12>:    addi.w    $r12,$r0,23(0x17)
    0x0000000120000628 <+16>:    st.d    $r12,$r22,-24(0xfe8)
    0x000000012000062c <+20>:    st.d    $r0,$r22,-32(0xfe0)
    0x0000000120000630 <+24>:    ld.d    $r12,$r22,-32(0xfe0)
    0x0000000120000634 <+28>:    ld.d    $r13,$r22,-32(0xfe0)
=> 0x0000000120000638 <+32>:    asrtgt.d    $r12,$r12
    0x000000012000063c <+36>:    st.d    $r12,$r22,-24(0xfe8)
    0x0000000120000640 <+40>:    move    $r12,$r0
    0x0000000120000644 <+44>:    move    $r4,$r12
    0x0000000120000648 <+48>:    ld.d    $r22,$r3,24(0x18)
    0x000000012000064c <+52>:    addi.d    $r3,$r3,32(0x20)
    0x0000000120000650 <+56>:    jirl    $r0,$r1,0
End of assembler dump.

dmesg :

[151125.931122] pid:32782 [a.out] Caught reserved exception 10 - should 
not happen


So

badvaddr is the PC,

exitsting system code is BCE, (10)

And I think the change like this:

void helper_asrtle_d(CPULoongArchState *env,  target_ulong rj, 
target_ulong  rk)

{

      if (rj > rk) {

         env->badvaddr = env->pc;

         do_raise_exception(env, EXCCODE_BCE,  env->badvaddr);

      }

}

cpu_loop.c

case EXCCODE_BCE:

     force_sig_fault(TARGET_SIGSYS,  TARGET_SI_KERNEL, env->badvaddr)


Thanks.
Song Gao

--------------0B7B6A19815CB7D3DF9DE7D4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022/6/11 上午6:45, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20b38d22-0c59-ec11-88e1-af0f1f604984@linaro.org">On
      6/9/22 23:53, gaosong wrote:
      <br>
      <blockquote type="cite" style="color: #000000;">Hi Richard,
        <br>
        <br>
        On 2022/6/10 上午2:42, Richard Henderson wrote:
        <br>
        <blockquote type="cite" style="color: #000000;">
          <blockquote type="cite" style="color: #000000;">  void
            helper_asrtle_d(CPULoongArchState *env, target_ulong rj,
            target_ulong rk)
            <br>
              {
            <br>
                  if (rj &gt; rk) {
            <br>
            +#ifdef CONFIG_USER_ONLY
            <br>
            +        cpu_loop_exit_sigsegv(env_cpu(env), GETPC(),
            <br>
            +                              MMU_DATA_LOAD, true,
            GETPC());
            <br>
            +#else
            <br>
                      do_raise_exception(env, EXCCODE_ADEM, GETPC());
            <br>
            +#endif
            <br>
          </blockquote>
          <br>
          This change is wrong.  First, the kernel's do_ade raises
          SIGBUS. Second, GETPC() is a host address, not a guest
          address.  Third, this highlights the fact that the existing
          system code is wrong, and should be setting badvaddr.
          <br>
          <br>
          You need to
          <br>
          (1) set badvaddr here, and then
          <br>
          (2) handle EXCCODE_ADEM in linux-user/loongarch/cpu_loop.c to
          force_fix_fault(TARGET_SIGBUS, TARGET_BUS_ADRERR,
          env-&gt;badvaddr). </blockquote>
        <br>
        badvaddr is env-&gt;pc or base-&gt;pc_next?
        <br>
      </blockquote>
      <br>
      I don't know.  The documentation for the ASRT{LE,GD}.D
      instructions is incomplete.
      <br>
      <br>
      However, from the kernel code,
      <br>
      <br>
      <a class="moz-txt-link-freetext"
href="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/loongarch/kernel/traps.c#n360"
        moz-do-not-send="true">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/loongarch/kernel/traps.c#n360</a>
      <br>
      <br>
      I can see that the kernel expects <b class="moz-txt-star"><span
          class="moz-txt-tag">*</span>some<span class="moz-txt-tag">*</span></b>
      value to be set there.  Given that this is the same trap used by
      the bound check memory accesses, I presume that badvaddr is
      related to the memory access not the PC.  So I would expect
      badvaddr to be RJ.
      <br>
      <br>
      But that is a guess.  Please check with your hardware engineers.
      <br>
    </blockquote>
    <p>Thanks you,</p>
    <p><br>
    </p>
    <p>I had tested asrtgt.d on hardware.  the log is :</p>
    <p>the gdb log</p>
    <p>(gdb) info registers <br>
                        zero               ra              
      tp               sp<br>
      R0   0000000000000000 000000fff7e7c774 000000fff7ffef20
      000000ffffff6940 <br>
                          a0               a1              
      a2               a3<br>
      R4   0000000000000001 000000ffffff6a88 000000ffffff6a98
      000000fff7fbc4b0 <br>
                          a4               a5              
      a6               a7<br>
      R8   0000000000000000 000000fff7fe6f70 000000ffffff6a80
      0000000000000080 <br>
                          t0               t1              
      t2               t3<br>
      R12  0000000000000000 0000000000000000 0000000000000000
      000000fff7fbeeb8 <br>
                          t4               t5              
      t6               t7<br>
      R16  000000fff7fbdd40 000000fff7fbdd40 7f7f7f7f7f7f7f7f
      0000000000000000 <br>
                          t8                x              
      fp               s0<br>
      R20  ffffff0000000000 0000000000000000 000000ffffff6960
      0000000000000000 <br>
                          s1               s2              
      s3               s4<br>
      R24  0000000120000658 000000aaaabd9c60 0000000000000000
      000000aaaabe9b50 <br>
                          s5               s6              
      s7               s8<br>
      R28  000000aaaabd9c60 0000000000000000 0000000000000000
      000000aaaabcfa08 <br>
      pc             0x120000638         0x120000638 &lt;main+32&gt;<br>
      badvaddr       0xfff7e935c8        0xfff7e935c8
      &lt;__cxa_atexit&gt;<br>
      (gdb) stepi<br>
      <br>
      Program received signal SIGSYS, Bad system call.<br>
      0x0000000120000638 in main () at asrtle.c:8<br>
      8        asm volatile("asrtgt.d  %0,%1\n\t"<br>
      (gdb) info registers <br>
                        zero               ra              
      tp               sp<br>
      R0   0000000000000000 000000fff7e7c774 000000fff7ffef20
      000000ffffff6940 <br>
                          a0               a1              
      a2               a3<br>
      R4   0000000000000001 000000ffffff6a88 000000ffffff6a98
      000000fff7fbc4b0 <br>
                          a4               a5              
      a6               a7<br>
      R8   0000000000000000 000000fff7fe6f70 000000ffffff6a80
      0000000000000080 <br>
                          t0               t1              
      t2               t3<br>
      R12  0000000000000000 0000000000000000 0000000000000000
      000000fff7fbeeb8 <br>
                          t4               t5              
      t6               t7<br>
      R16  000000fff7fbdd40 000000fff7fbdd40 7f7f7f7f7f7f7f7f
      0000000000000000 <br>
                          t8                x              
      fp               s0<br>
      R20  ffffff0000000000 0000000000000000 000000ffffff6960
      0000000000000000 <br>
                          s1               s2              
      s3               s4<br>
      R24  0000000120000658 000000aaaabd9c60 0000000000000000
      000000aaaabe9b50 <br>
                          s5               s6              
      s7               s8<br>
      R28  000000aaaabd9c60 0000000000000000 0000000000000000
      000000aaaabcfa08 <br>
      pc             0x120000638         0x120000638 &lt;main+32&gt;<br>
      badvaddr       0x120000638         0x120000638 &lt;main+32&gt;<br>
      (gdb) disas<br>
      Dump of assembler code for function main:<br>
         0x0000000120000618 &lt;+0&gt;:    addi.d    $r3,$r3,-32(0xfe0)<br>
         0x000000012000061c &lt;+4&gt;:    st.d    $r22,$r3,24(0x18)<br>
         0x0000000120000620 &lt;+8&gt;:    addi.d    $r22,$r3,32(0x20)<br>
         0x0000000120000624 &lt;+12&gt;:    addi.w    $r12,$r0,23(0x17)<br>
         0x0000000120000628 &lt;+16&gt;:    st.d    $r12,$r22,-24(0xfe8)<br>
         0x000000012000062c &lt;+20&gt;:    st.d    $r0,$r22,-32(0xfe0)<br>
         0x0000000120000630 &lt;+24&gt;:    ld.d    $r12,$r22,-32(0xfe0)<br>
         0x0000000120000634 &lt;+28&gt;:    ld.d    $r13,$r22,-32(0xfe0)<br>
      =&gt; 0x0000000120000638 &lt;+32&gt;:    asrtgt.d    $r12,$r12<br>
         0x000000012000063c &lt;+36&gt;:    st.d    $r12,$r22,-24(0xfe8)<br>
         0x0000000120000640 &lt;+40&gt;:    move    $r12,$r0<br>
         0x0000000120000644 &lt;+44&gt;:    move    $r4,$r12<br>
         0x0000000120000648 &lt;+48&gt;:    ld.d    $r22,$r3,24(0x18)<br>
         0x000000012000064c &lt;+52&gt;:    addi.d    $r3,$r3,32(0x20)<br>
         0x0000000120000650 &lt;+56&gt;:    jirl    $r0,$r1,0<br>
      End of assembler dump.<br>
      <br>
    </p>
    <p>dmesg :</p>
    <p>[151125.931122] pid:32782 [a.out] Caught reserved exception 10 -
      should not happen</p>
    <p><br>
    </p>
    <p>So <br>
    </p>
    <p>badvaddr is the PC,  <br>
    </p>
    <p>exitsting system code is BCE, (10)<br>
    </p>
    <p>And I think the change like this:</p>
    <p>void helper_asrtle_d(CPULoongArchState *env,  target_ulong rj,
      target_ulong  rk)</p>
    <p>{</p>
    <p>     if (rj &gt; rk) {</p>
    <p>        env-&gt;badvaddr = env-&gt;pc;</p>
    <p>        do_raise_exception(env, EXCCODE_BCE,  env-&gt;badvaddr);<br>
    </p>
    <p>     }<br>
    </p>
    <p>}<br>
    </p>
    <p>cpu_loop.c</p>
    <p>case EXCCODE_BCE:</p>
    <p>    force_sig_fault(TARGET_SIGSYS,  TARGET_SI_KERNEL, 
      env-&gt;badvaddr)<br>
    </p>
    <p><br>
    </p>
    Thanks.<br>
    Song Gao<br>
  </body>
</html>

--------------0B7B6A19815CB7D3DF9DE7D4--


