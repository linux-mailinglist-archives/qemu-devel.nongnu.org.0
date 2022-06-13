Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C90D547E42
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 05:52:15 +0200 (CEST)
Received: from localhost ([::1]:35632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0b7d-0000SL-Oq
	for lists+qemu-devel@lfdr.de; Sun, 12 Jun 2022 23:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1o0b5l-0008CR-Na
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 23:50:17 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46760 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1o0b5i-0003ZD-QV
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 23:50:17 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxH0_rs6Zii2I9AA--.29743S3; 
 Mon, 13 Jun 2022 11:50:04 +0800 (CST)
Subject: Re: [PATCH v15 8/9] target/loongarch: Adjust functions and structure
 to support user-mode
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220609024209.2406188-1-gaosong@loongson.cn>
 <20220609024209.2406188-9-gaosong@loongson.cn>
 <4c0fd198-922e-d94f-fec4-05c53c5d6858@linaro.org>
 <e6e9c111-ca44-0126-b7a5-dcffe33385a5@loongson.cn>
 <20b38d22-0c59-ec11-88e1-af0f1f604984@linaro.org>
 <a6306006-d1df-e5eb-4f2c-5e1bf6adfe07@loongson.cn>
 <5476bca7-eadd-0880-8625-b01579f257f5@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <758e6450-341a-3f76-dd95-34483347e142@loongson.cn>
Date: Mon, 13 Jun 2022 11:50:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5476bca7-eadd-0880-8625-b01579f257f5@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------3EC1E11CD2DDB975AEE17E04"
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxH0_rs6Zii2I9AA--.29743S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Cry3JF4xKFWDtFWDCr15Arb_yoW8KF18pF
 1xKw43Jry8G3WkXw1UJr4DtryUWr4UGw4UJw18Xa4DJF1xtryYgr1DWF4qgr17Jr4kXr47
 AFWUAryUZws8GrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvE1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
 87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzx
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
--------------3EC1E11CD2DDB975AEE17E04
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022/6/12 上午12:06, Richard Henderson wrote:
>> void helper_asrtle_d(CPULoongArchState *env,  target_ulong rj, 
>> target_ulong  rk)
>> {
>>       if (rj > rk) {
>>          env->badvaddr = env->pc;
>>          do_raise_exception(env, EXCCODE_BCE, env->badvaddr);
>>       }
>> }
>
> Well, not quite.  The value of env->pc is not current; it is too 
> expensive to update all of the time.  We need to recover that value by 
> using TCG unwinding, e.g.:
>
>     if (rj > rk) {
>         cpu_restore_state(env_cpu(env), GETPC(), true);
>         env->badvaddr = env->pc;
>
> However,
>
>         do_raise_exception(env, EXCCODE_ADEM, GETPC());
>
> expects to do it's own cpu_restore_state via cpu_loop_exit_restore(), 
> and we should not do that twice.
>
> Therefore, since the value of badvaddr is something that we can more 
> easily recover later than earlier, we should move the setting of 
> badvaddr for ADEM to loongarch_cpu_do_interrupt():
>
>     case EXCCODE_ADEM:
>
>         env->badvaddr = env->pc;
>         cause = cs->exception_index;
>         break;
>
> It is probably worthwhile to check how many other exceptions should be 
> having the same effect.
>
Thank you for your advice.
like this:

  void helper_asrtle_d(CPULoongArchState *env, target_ulong rj, 
target_ulong rk)
  {
+    CPUState *cs = env_cpu(env);
+
      if (rj > rk) {
-        env->badaddr = env->pc;
-        do_raise_exception(env, EXCCODE_BCE, env->badaddr);
+        cpu_restore_state(cs, GETPC(), true);
+        cs->exception_index = EXCCODE_BCE;
+        cpu_loop_exit(cs);
      }
  }

cpu.c


      case EXCCODE_ADEM:
+    case EXCCODE_BCE:
      case EXCCODE_SYS:
      case EXCCODE_BRK:
+    case EXCCODE_INE:
+    case EXCCODE_IPE:
+    case EXCCODE_FPE:
+        env->badvaddr = env->pc;
+        QEMU_FALLTHROUGH;
      case EXCCODE_PIL:
      case EXCCODE_PIS:
      case EXCCODE_PME:
      case EXCCODE_PNR:
      case EXCCODE_PNX:
      case EXCCODE_PPI:
-    case EXCCODE_INE:
-    case EXCCODE_IPE:
-    case EXCCODE_FPE:
          cause = cs->exception_index;
          break;

Thanks
Song Gao

--------------3EC1E11CD2DDB975AEE17E04
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022/6/12 上午12:06, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5476bca7-eadd-0880-8625-b01579f257f5@linaro.org">
      <blockquote type="cite" style="color: #000000;">void
        helper_asrtle_d(CPULoongArchState *env,  target_ulong rj,
        target_ulong  rk)
        <br>
        {
        <br>
              if (rj &gt; rk) {
        <br>
                 env-&gt;badvaddr = env-&gt;pc;
        <br>
                 do_raise_exception(env, EXCCODE_BCE, 
        env-&gt;badvaddr);
        <br>
              }
        <br>
        }
        <br>
      </blockquote>
      <br>
      Well, not quite.  The value of env-&gt;pc is not current; it is
      too expensive to update all of the time.  We need to recover that
      value by using TCG unwinding, e.g.:
      <br>
      <br>
          if (rj &gt; rk) {
      <br>
              cpu_restore_state(env_cpu(env), GETPC(), true);
      <br>
              env-&gt;badvaddr = env-&gt;pc;
      <br>
      <br>
      However,
      <br>
      <br>
              do_raise_exception(env, EXCCODE_ADEM, GETPC());
      <br>
      <br>
      expects to do it's own cpu_restore_state via
      cpu_loop_exit_restore(), and we should not do that twice.
      <br>
      <br>
      Therefore, since the value of badvaddr is something that we can
      more easily recover later than earlier, we should move the setting
      of badvaddr for ADEM to loongarch_cpu_do_interrupt():
      <br>
      <br>
          case EXCCODE_ADEM:
      <br>
      <br>
              env-&gt;badvaddr = env-&gt;pc;
      <br>
              cause = cs-&gt;exception_index;
      <br>
              break;
      <br>
      <br>
      It is probably worthwhile to check how many other exceptions
      should be having the same effect.
      <br>
      <br>
    </blockquote>
    Thank you for your advice.<br>
    like this:<br>
    <p> void helper_asrtle_d(CPULoongArchState *env, target_ulong rj,
      target_ulong rk)<br>
       {<br>
      +    CPUState *cs = env_cpu(env);<br>
      +<br>
           if (rj &gt; rk) {<br>
      -        env-&gt;badaddr = env-&gt;pc;<br>
      -        do_raise_exception(env, EXCCODE_BCE, env-&gt;badaddr);<br>
      +        cpu_restore_state(cs, GETPC(), true);<br>
      +        cs-&gt;exception_index = EXCCODE_BCE;<br>
      +        cpu_loop_exit(cs);<br>
           }<br>
       }<br>
    </p>
    <p>cpu.c</p>
    <p><br>
           case EXCCODE_ADEM:<br>
      +    case EXCCODE_BCE:<br>
           case EXCCODE_SYS:<br>
           case EXCCODE_BRK:<br>
      +    case EXCCODE_INE:<br>
      +    case EXCCODE_IPE:<br>
      +    case EXCCODE_FPE:<br>
      +        env-&gt;badvaddr = env-&gt;pc;<br>
      +        QEMU_FALLTHROUGH;<br>
           case EXCCODE_PIL:<br>
           case EXCCODE_PIS:<br>
           case EXCCODE_PME:<br>
           case EXCCODE_PNR:<br>
           case EXCCODE_PNX:<br>
           case EXCCODE_PPI:<br>
      -    case EXCCODE_INE:<br>
      -    case EXCCODE_IPE:<br>
      -    case EXCCODE_FPE:<br>
               cause = cs-&gt;exception_index;<br>
               break;<br>
    </p>
    Thanks<br>
    Song Gao<br>
  </body>
</html>

--------------3EC1E11CD2DDB975AEE17E04--


