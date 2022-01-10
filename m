Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA1B4898B4
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 13:37:48 +0100 (CET)
Received: from localhost ([::1]:36610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6tvn-0006Aa-8j
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 07:37:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1n6tsS-0005R9-MU
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 07:34:20 -0500
Received: from mail.loongson.cn ([114.242.206.163]:51678 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1n6tsP-00014g-SA
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 07:34:20 -0500
Received: from [10.20.42.193] (unknown [10.20.42.193])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cxe+jBJ9xhZzcBAA--.4720S3;
 Mon, 10 Jan 2022 20:34:09 +0800 (CST)
Subject: Re: [PATCH v14 02/26] target/loongarch: Add core definition
To: WANG Xuerui <i.qemu@xen0n.name>
References: <20220106094200.1801206-1-gaosong@loongson.cn>
 <20220106094200.1801206-3-gaosong@loongson.cn>
 <b8f31617-f217-778c-2a34-6d780de9b83a@xen0n.name>
 <be8f315d-7a98-92f0-87cc-c69983c77234@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <f69f156e-f8d9-a902-341b-12306e55f539@loongson.cn>
Date: Mon, 10 Jan 2022 20:34:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <be8f315d-7a98-92f0-87cc-c69983c77234@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------C4897F39AA5D599D37D13B6F"
Content-Language: en-US
X-CM-TRANSID: AQAAf9Cxe+jBJ9xhZzcBAA--.4720S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw4UJw4UXF13XrWfZw1xuFg_yoW8Ary3pr
 yfZFsFkr48t3Z7J348uF1j9r98Zrnak343XF1vqF1UAF1UG34jqr1Iqr1qgr9IgrWrWw4U
 XFs3ta15Za47AaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvl1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2
 jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52
 x082IY62kv0487McIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm
 72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mx
 8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVCm-wCF04k2
 0xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26ryrJr1UJwCFx2IqxVCFs4IE7xkEbVWUJV
 W8JwC20s026c02F40E14v26r106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
 1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
 IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY
 6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvj
 DU0xZFpf9x0JjjYL9UUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------C4897F39AA5D599D37D13B6F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 2022/1/10 上午2:49, Richard Henderson wrote:
>>> +static bool loongarch_cpu_has_work(CPUState *cs)
>>> +{
>>> +    return true;
>>
>> Note: this is only applicable to CONFIG_USER_ONLY, and needs to be 
>> changed in the following commits adding system emulation. To better 
>> convey your intention it may be better to use an #ifdef guard, 
>> something like this:
>>
>> #ifndef CONFIG_USER_ONLY
>> #error System emulation TODO
>> #else
>>      return true;
>> #endif
>>
>> (I'm not sure if this is okay in QEMU coding style, so please correct 
>> me if this isn't the case.)
>
In my opinion, we don't need to do this. As you pointed out below, SPW shouldn't appear in this series. All CONFIG_USER_ONLY  macors should appear in the system emulation series.

Liks this:

https://patchew.org/QEMU/20220108091419.2027710-1-yangxiaojuan@loongson.cn/20220108091419.2027710-12-yangxiaojuan@loongson.cn/

  static bool loongarch_cpu_has_work(CPUState *cs)
  {
+#ifdef CONFIG_USER_ONLY
      return true;
+#else
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+    bool has_work = false;
+
+    if ((cs->interrupt_request & CPU_INTERRUPT_HARD) &&
+        cpu_loongarch_hw_interrupts_pending(env)) {
+        has_work = true;
+    }
+
+    return has_work;
+#endif
  }

> Prefer positive tests over negative tests, so
>
> #ifdef CONFIG_USER_ONLY
>     return true;
> #else
> #error
> #endif
>
>>> +    data = FIELD_DP32(data, CPUCFG2, LSPW, 1);
>> Do you support the SPW extension in this series? If not you probably 
>> don't want to set this bit.
>
> Correct, you can't expose features that you don't implement.

Accept this suggesstions.

Thanks
Song


--------------C4897F39AA5D599D37D13B6F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <div class="moz-cite-prefix">On 2022/1/10 上午2:49, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:be8f315d-7a98-92f0-87cc-c69983c77234@linaro.org">
      <blockquote type="cite" style="color: #000000;">
        <blockquote type="cite" style="color: #000000;">+static bool
          loongarch_cpu_has_work(CPUState *cs)
          <br>
          +{
          <br>
          +    return true;
          <br>
        </blockquote>
        <br>
        Note: this is only applicable to CONFIG_USER_ONLY, and needs to
        be changed in the following commits adding system emulation. To
        better convey your intention it may be better to use an #ifdef
        guard, something like this:
        <br>
        <br>
        #ifndef CONFIG_USER_ONLY
        <br>
        #error System emulation TODO
        <br>
        #else
        <br>
             return true;
        <br>
        #endif
        <br>
        <br>
        (I'm not sure if this is okay in QEMU coding style, so please
        correct me if this isn't the case.)
        <br>
      </blockquote>
      <br>
    </blockquote>
    <pre>In my opinion, we don't need to do this. As you pointed out below, SPW shouldn't appear in this series. All CONFIG_USER_ONLY  macors should appear in the system emulation series.</pre>
    <pre>Liks this:
</pre>
    <pre><a class="moz-txt-link-freetext" href="https://patchew.org/QEMU/20220108091419.2027710-1-yangxiaojuan@loongson.cn/20220108091419.2027710-12-yangxiaojuan@loongson.cn/">https://patchew.org/QEMU/20220108091419.2027710-1-yangxiaojuan@loongson.cn/20220108091419.2027710-12-yangxiaojuan@loongson.cn/</a>
</pre>
    <pre> static bool loongarch_cpu_has_work(CPUState *cs)
 {
+#ifdef CONFIG_USER_ONLY
     return true;
+#else
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &amp;cpu-&gt;env;
+    bool has_work = false;
+
+    if ((cs-&gt;interrupt_request &amp; CPU_INTERRUPT_HARD) &amp;&amp;
+        cpu_loongarch_hw_interrupts_pending(env)) {
+        has_work = true;
+    }
+
+    return has_work;
+#endif
 }
</pre>
    <blockquote type="cite"
      cite="mid:be8f315d-7a98-92f0-87cc-c69983c77234@linaro.org">Prefer
      positive tests over negative tests, so
      <br>
      <br>
      #ifdef CONFIG_USER_ONLY
      <br>
          return true;
      <br>
      #else
      <br>
      #error
      <br>
      #endif
      <br>
      <br>
    </blockquote>
    <blockquote type="cite"
      cite="mid:be8f315d-7a98-92f0-87cc-c69983c77234@linaro.org">
      <blockquote type="cite" style="color: #000000;">
        <blockquote type="cite" style="color: #000000;">+    data =
          FIELD_DP32(data, CPUCFG2, LSPW, 1);
          <br>
        </blockquote>
        Do you support the SPW extension in this series? If not you
        probably don't want to set this bit.
        <br>
      </blockquote>
      <br>
      Correct, you can't expose features that you don't implement. <br>
    </blockquote>
    <pre>Accept this suggesstions.</pre>
    <pre>Thanks
Song
</pre>
  </body>
</html>

--------------C4897F39AA5D599D37D13B6F--


