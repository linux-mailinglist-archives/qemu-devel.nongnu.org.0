Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1055504E67
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 11:31:02 +0200 (CEST)
Received: from localhost ([::1]:55502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngNin-0002lX-5z
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 05:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1ngNSw-00029g-Ei
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 05:14:38 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53416 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1ngNSt-0004LX-20
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 05:14:37 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax6sztK11imaMnAA--.56728S3; 
 Mon, 18 Apr 2022 17:14:21 +0800 (CST)
Subject: Re: [PATCH v1 33/43] hw/intc: Add LoongArch ls7a interrupt controller
 support(PCH-PIC)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-34-yangxiaojuan@loongson.cn>
 <832efe6e-f647-9691-202c-e8713caf97d5@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <cb22faf4-8166-e91a-1cdb-3f0bd5736fe3@loongson.cn>
Date: Mon, 18 Apr 2022 17:14:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <832efe6e-f647-9691-202c-e8713caf97d5@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------84453B67596C30FE186C1442"
Content-Language: en-US
X-CM-TRANSID: AQAAf9Ax6sztK11imaMnAA--.56728S3
X-Coremail-Antispam: 1UD129KBjvJXoW7AF48Ary8uw4UXr1kZr45trb_yoW8Gr1UpF
 W8Jr4UCryUJw18Jr1DJw1UJryUAr1UJw1Utr18JF18JrWUJFnYqr1UXr12gr1DGr4xJF1j
 yF45WryUZr1UAwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUv214x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2
 z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67
 IIx4CEVc8vx2IErcIFxwCjr7xvwVCIw2I0I7xG6c02F41lc7I2V7IY0VAS07AlzVAYIcxG
 8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
 Aqx4xG67AKxVWUGVWUWwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r12
 6r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
 kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE
 14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa
 7VUb_gA7UUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------84453B67596C30FE186C1442
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi, Richard

On 2022/4/18 上午11:15, Richard Henderson wrote:
> On 4/15/22 02:40, Xiaojuan Yang wrote:
>> +static void pch_pic_update_irq(LoongArchPCHPIC *s, uint32_t mask,
>> +                               int level, int hi)
>> +{
>> +    uint32_t val, irq;
>> +
>> +    if (level == 1) {
>> +        if (hi) {
>> +            val = mask & s->intirr_hi & (~s->int_mask_hi);
>> +            irq = find_first_bit((unsigned long *)&val, 32);
>
> This does not work -- you're accessing beyond the end of the uint32_t 
> for all LP64 hosts.  I think you just want ctz32()...
>
>
>> +            if (irq != 32) {
>> +                s->intisr_hi |= 1ULL << irq;
>> + qemu_set_irq(s->parent_irq[s->htmsi_vector[irq + 32]], 1);
>> +            }
>
> ... which should in fact only be tested if val != 0, which is to what 
> this IF equates.
>
> Is there a good reason that this function is treating hi and lo 
> separately, as opposed to simply doing all of the computation on 
> uint64_t?
>

In the part of linux kernel, pch pic driver use 32 bits for reading and 
writing.
e.g in the drivers/irqchip/irq-loongson-pch-pic.c， pch_pic_mask_irq() 
function use writel() to write pch_pic mask reg.

Thanks.
Xiaojuan
>
> r~

--------------84453B67596C30FE186C1442
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi, Richard<br>
    </p>
    <div class="moz-cite-prefix">On 2022/4/18 上午11:15, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:832efe6e-f647-9691-202c-e8713caf97d5@linaro.org">On
      4/15/22 02:40, Xiaojuan Yang wrote:
      <br>
      <blockquote type="cite">+static void
        pch_pic_update_irq(LoongArchPCHPIC *s, uint32_t mask,
        <br>
        +                               int level, int hi)
        <br>
        +{
        <br>
        +    uint32_t val, irq;
        <br>
        +
        <br>
        +    if (level == 1) {
        <br>
        +        if (hi) {
        <br>
        +            val = mask &amp; s-&gt;intirr_hi &amp;
        (~s-&gt;int_mask_hi);
        <br>
        +            irq = find_first_bit((unsigned long *)&amp;val,
        32);
        <br>
      </blockquote>
      <br>
      This does not work -- you're accessing beyond the end of the
      uint32_t for all LP64 hosts.  I think you just want ctz32()...
      <br>
      <br>
      <br>
      <blockquote type="cite">+            if (irq != 32) {
        <br>
        +                s-&gt;intisr_hi |= 1ULL &lt;&lt; irq;
        <br>
        +               
        qemu_set_irq(s-&gt;parent_irq[s-&gt;htmsi_vector[irq + 32]], 1);
        <br>
        +            }
        <br>
      </blockquote>
      <br>
      ... which should in fact only be tested if val != 0, which is to
      what this IF equates.
      <br>
      <br>
      Is there a good reason that this function is treating hi and lo
      separately, as opposed to simply doing all of the computation on
      uint64_t?
      <br>
      <br>
    </blockquote>
    <br>
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">In
      the part of linux kernel, pch pic driver use 32 bits for reading
      and writing. </span><br style="color: rgb(0, 0, 0); font-family:
      宋体, arial, Verdana, sans-serif; font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">e.g 
      in the drivers/irqchip/irq-loongson-pch-pic.c， pch_pic_mask_irq()
      function use writel() to write pch_pic mask reg.</span><br>
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;"></span><br>
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">Thanks.</span><br>
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">Xiaojuan</span>
    <blockquote type="cite"
      cite="mid:832efe6e-f647-9691-202c-e8713caf97d5@linaro.org">
      <br>
      r~
      <br>
    </blockquote>
  </body>
</html>

--------------84453B67596C30FE186C1442--


