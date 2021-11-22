Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 120C3458DAD
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 12:44:02 +0100 (CET)
Received: from localhost ([::1]:46878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp7js-0002n2-NF
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 06:44:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mp7hG-0000We-16
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 06:41:18 -0500
Received: from mail.loongson.cn ([114.242.206.163]:46862 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mp7hD-0007j2-Eh
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 06:41:17 -0500
Received: from [10.20.42.193] (unknown [10.20.42.193])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxZ+jSgZthISIAAA--.858S3;
 Mon, 22 Nov 2021 19:41:06 +0800 (CST)
Subject: Re: [PATCH v11 19/26] linux-user: Add LoongArch signal support
To: Richard Henderson <richard.henderson@linaro.org>, zltjiangshi@gmail.com
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-20-git-send-email-gaosong@loongson.cn>
 <9195824d-31d2-f2e8-610b-f8f86d687707@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <d5fed5e0-3708-4891-03e6-868986dea360@loongson.cn>
Date: Mon, 22 Nov 2021 19:41:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9195824d-31d2-f2e8-610b-f8f86d687707@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------CE362942398C0280FF6176E6"
Content-Language: en-US
X-CM-TRANSID: AQAAf9AxZ+jSgZthISIAAA--.858S3
X-Coremail-Antispam: 1UD129KBjvdXoW7JrykCw1rZrWxuw1rJFyrJFb_yoW3trg_CF
 WUGrnrZw1UAw4jqw4UJr9YqrnxJF1jqF1vyrWjvry7Jryqv3sIqwsYywn5Awn7KFW8Jwsx
 Ary5XrZa9a4DKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbVkFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280
 aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52
 x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm
 72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mx
 8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVCm-wCF04k2
 0xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26ryrJr1UJwCFx2IqxVCFs4IE7xkEbVWUJV
 W8JwC20s026c02F40E14v26r106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
 1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
 IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAI
 cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
 nxnUUI43ZEXa7VU1g4S7UUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.097, SPF_HELO_PASS=-0.001,
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, chenhuacai@loongson.cn,
 qemu-devel@nongnu.org, maobibo@loongson.cn, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------CE362942398C0280FF6176E6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Richard,

On 2021/11/20 下午6:33, Richard Henderson wrote:
>
> Drop all of the the inline markers.
>
>> +{
>> +    int i;
>> +
>> +    __put_user(env->pc, &sc->sc_pc);
>> +
>> +    __put_user(0, &sc->sc_gpr[0]);
>> +    for (i = 1; i < 32; ++i) {
>> +        __put_user(env->gpr[i], &sc->sc_gpr[i]);
>> +    }
>> +
>> +    for (i = 0; i < 32; ++i) {
>> +        __put_user(env->fpr[i], &sc->sc_fpr[i]);
>> +    }
>> +}
>
> Missing fcsr and fcc.
>
> I'll note that the kernel is missing sets of vscr and scr[0-3]. IMO 
> they should at least be zeroed in advance of supporting the vector 
> extension.

I see that vcsr set at [1]:178.
[1]
https://github.com/loongson/linux/blob/loongarch-next/arch/loongarch/kernel/signal.c

and I also see that the kernel is missing sets of scr[0-3],  Huacai is that right?

Thanks
Song Gao


--------------CE362942398C0280FF6176E6
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
      cite="mid:9195824d-31d2-f2e8-610b-f8f86d687707@linaro.org"><br>
      Drop all of the the inline markers.
      <br>
      <br>
      <blockquote type="cite" style="color: #000000;">+{
        <br>
        +    int i;
        <br>
        +
        <br>
        +    __put_user(env-&gt;pc, &amp;sc-&gt;sc_pc);
        <br>
        +
        <br>
        +    __put_user(0, &amp;sc-&gt;sc_gpr[0]);
        <br>
        +    for (i = 1; i &lt; 32; ++i) {
        <br>
        +        __put_user(env-&gt;gpr[i], &amp;sc-&gt;sc_gpr[i]);
        <br>
        +    }
        <br>
        +
        <br>
        +    for (i = 0; i &lt; 32; ++i) {
        <br>
        +        __put_user(env-&gt;fpr[i], &amp;sc-&gt;sc_fpr[i]);
        <br>
        +    }
        <br>
        +}
        <br>
      </blockquote>
      <br>
      Missing fcsr and fcc.
      <br>
      <br>
      I'll note that the kernel is missing sets of vscr and scr[0-3]. 
      IMO they should at least be zeroed in advance of supporting the
      vector extension.<br>
    </blockquote>
    <pre>I see that vcsr set at [1]:178.
[1]
<a class="moz-txt-link-freetext" href="https://github.com/loongson/linux/blob/loongarch-next/arch/loongarch/kernel/signal.c">https://github.com/loongson/linux/blob/loongarch-next/arch/loongarch/kernel/signal.c</a>

and I also see that the kernel is missing sets of scr[0-3],  Huacai is that right?

Thanks
Song Gao
</pre>
  </body>
</html>

--------------CE362942398C0280FF6176E6--


