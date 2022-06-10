Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE7B545CC0
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 09:03:20 +0200 (CEST)
Received: from localhost ([::1]:48592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzYft-0008ST-3K
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 03:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1nzYWW-0003DA-6V
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 02:53:37 -0400
Received: from mail.loongson.cn ([114.242.206.163]:55084 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1nzYWT-00051x-Ji
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 02:53:35 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxaeRk6qJiJP01AA--.58414S3; 
 Fri, 10 Jun 2022 14:53:24 +0800 (CST)
Subject: Re: [PATCH v15 8/9] target/loongarch: Adjust functions and structure
 to support user-mode
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220609024209.2406188-1-gaosong@loongson.cn>
 <20220609024209.2406188-9-gaosong@loongson.cn>
 <4c0fd198-922e-d94f-fec4-05c53c5d6858@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <e6e9c111-ca44-0126-b7a5-dcffe33385a5@loongson.cn>
Date: Fri, 10 Jun 2022 14:53:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4c0fd198-922e-d94f-fec4-05c53c5d6858@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------A5BF89289D3E693B333BCFC7"
Content-Language: en-US
X-CM-TRANSID: AQAAf9BxaeRk6qJiJP01AA--.58414S3
X-Coremail-Antispam: 1UD129KBjvJXoW7AF4DAF4DJr1UXr1UKFWfKrg_yoW8XryxpF
 y8Ar47AryUGrn5Xw1UGr1UKFyUJr1UGw4UJw1xJa47Kw4UXr1Ygr1UWw4q9ry7JrWrJr15
 AFWav347ur4UXwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
--------------A5BF89289D3E693B333BCFC7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Richard,

On 2022/6/10 上午2:42, Richard Henderson wrote:
>>   void helper_asrtle_d(CPULoongArchState *env, target_ulong rj, 
>> target_ulong rk)
>>   {
>>       if (rj > rk) {
>> +#ifdef CONFIG_USER_ONLY
>> +        cpu_loop_exit_sigsegv(env_cpu(env), GETPC(),
>> +                              MMU_DATA_LOAD, true, GETPC());
>> +#else
>>           do_raise_exception(env, EXCCODE_ADEM, GETPC());
>> +#endif
>
> This change is wrong.  First, the kernel's do_ade raises SIGBUS. 
> Second, GETPC() is a host address, not a guest address.  Third, this 
> highlights the fact that the existing system code is wrong, and should 
> be setting badvaddr.
>
> You need to
> (1) set badvaddr here, and then
> (2) handle EXCCODE_ADEM in linux-user/loongarch/cpu_loop.c to 
> force_fix_fault(TARGET_SIGBUS, TARGET_BUS_ADRERR, env->badvaddr). 

badvaddr is env->pc or base->pc_next?   and we just raise exception on 
use-mode,

like this

   void helper_asrtle_d(CPULoongArchState *env, target_ulong rj, 
target_ulong rk)
   {
       if (rj > rk) {

          env->badvaddr = env->pc;

#ifdef CONFIG_USER_ONLY
           do_raise_exception(env, EXCCODE_ADEM, GETPC());
#endif

       }

}

cpu_loop.c

         case EXCCODE_ADEM:
             force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRERR, 
env->badvaddr);
             break;

Thanks.
Song Gao

--------------A5BF89289D3E693B333BCFC7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Richard,<br>
    </p>
    <div class="moz-cite-prefix">On 2022/6/10 上午2:42, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:4c0fd198-922e-d94f-fec4-05c53c5d6858@linaro.org">
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
        +                              MMU_DATA_LOAD, true, GETPC());
        <br>
        +#else
        <br>
                  do_raise_exception(env, EXCCODE_ADEM, GETPC());
        <br>
        +#endif
        <br>
      </blockquote>
      <br>
      This change is wrong.  First, the kernel's do_ade raises SIGBUS. 
      Second, GETPC() is a host address, not a guest address.  Third,
      this highlights the fact that the existing system code is wrong,
      and should be setting badvaddr.
      <br>
      <br>
      You need to
      <br>
      (1) set badvaddr here, and then
      <br>
      (2) handle EXCCODE_ADEM in linux-user/loongarch/cpu_loop.c to
      force_fix_fault(TARGET_SIGBUS, TARGET_BUS_ADRERR,
      env-&gt;badvaddr).
    </blockquote>
    <p>badvaddr is env-&gt;pc or base-&gt;pc_next?   and we just raise
      exception on use-mode,<br>
    </p>
    <p>like this</p>
    <p>  void helper_asrtle_d(CPULoongArchState *env, target_ulong rj,
      target_ulong rk)
      <br>
        {
      <br>
            if (rj &gt; rk) { <br>
    </p>
    <p>         env-&gt;badvaddr = env-&gt;pc;<br>
    </p>
    <p>#ifdef CONFIG_USER_ONLY
      <br>
                do_raise_exception(env, EXCCODE_ADEM, GETPC());
      <br>
      #endif <br>
    </p>
    <p>      }</p>
    <p>}</p>
    <p>cpu_loop.c</p>
    <p>        case EXCCODE_ADEM:<br>
                  force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRERR,
      env-&gt;badvaddr);<br>
                  break;<br>
      <br>
    </p>
    Thanks. <br>
    Song Gao<br>
  </body>
</html>

--------------A5BF89289D3E693B333BCFC7--


