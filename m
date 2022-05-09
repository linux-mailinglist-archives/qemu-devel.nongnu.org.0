Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 456BC51F9E1
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 12:30:09 +0200 (CEST)
Received: from localhost ([::1]:42534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no0eW-0002GQ-7i
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 06:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1no0Pq-0001US-H5
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:14:58 -0400
Received: from mail.loongson.cn ([114.242.206.163]:42326 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1no0Pj-0008NO-Bf
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:14:55 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxmtiI6Xhi7dAOAA--.38252S3; 
 Mon, 09 May 2022 18:14:32 +0800 (CST)
Subject: Re: [PATCH v3 34/43] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
 <20220429100729.1572481-35-yangxiaojuan@loongson.cn>
 <c6b58ba0-38c4-6542-86d1-eb1f14a12121@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <32b7a86a-b02d-1c9c-0014-5907cf461d77@loongson.cn>
Date: Mon, 9 May 2022 18:14:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <c6b58ba0-38c4-6542-86d1-eb1f14a12121@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------DE6D127A57BA3FA00FCF3309"
Content-Language: en-US
X-CM-TRANSID: AQAAf9AxmtiI6Xhi7dAOAA--.38252S3
X-Coremail-Antispam: 1UD129KBjvJXoW7XF17AFW7Jw1DKFWftrW5KFg_yoW8JF13pF
 Z5J3yYyryDGw1kWr1DJa10qFyrGr18Jw42qr18CFy8Zr1rZF1SqryFqr1I9a4UJr4vkF1U
 tF45XayrurW3GwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUv214x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj6I8E
 87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjI
 I2zVCS5cI20VAGYxC7Mx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487
 MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
 02F40E14v26r106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_
 Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
 CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------DE6D127A57BA3FA00FCF3309
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022/5/7 下午11:31, Richard Henderson wrote:
>> +    if (level) {
>> +        /* if not enable return false */
>> +        if (((s->enable[enable_index]) & (1 << enable_mask)) == 0) {
>> +            return;
>> +        }
>> +        s->coreisr[cpu][coreisr_index] |= (1 << coreisr_mask);
>> +        qemu_set_irq(s->parent_irq[cpu][ipnum], level);
>> +    } else {
>> +        s->coreisr[cpu][coreisr_index] &= ~(1 << coreisr_mask);
>> +        qemu_set_irq(s->parent_irq[cpu][ipnum], level);
>> +    }
>
> This final bit, updating the cpu irq is also wrong, in that it should 
> be unconditional. This is the only way that it will work for the usage 
> in updating the enable mask.
>
> I think you are not considering when the MAP registers overlap 
> outputs.  For instance, if all 256 bits of EXT_IOIMap contain 0, then 
> all of EXT_IOI[n*32+31 : n*32] overlap.  When that happens, you cannot 
> lower the level of the cpu pin until all of the matching ioi 
> interrupts are low.
>
Thanks, i should consider the MAP registers overlap outputs.
And i want to add 'uint32_t sw_isr_group[256 / 32]', when each bit of 
sw_isr_group[n*32+31 : n*32] is 0, then lower the level of the cpu pin.

Thanks.
Xiaojuan

--------------DE6D127A57BA3FA00FCF3309
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022/5/7 下午11:31, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c6b58ba0-38c4-6542-86d1-eb1f14a12121@linaro.org">
      <blockquote type="cite" style="color: #000000;">+    if (level) {
        <br>
        +        /* if not enable return false */
        <br>
        +        if (((s-&gt;enable[enable_index]) &amp; (1 &lt;&lt;
        enable_mask)) == 0) {
        <br>
        +            return;
        <br>
        +        }
        <br>
        +        s-&gt;coreisr[cpu][coreisr_index] |= (1 &lt;&lt;
        coreisr_mask);
        <br>
        +        qemu_set_irq(s-&gt;parent_irq[cpu][ipnum], level);
        <br>
        +    } else {
        <br>
        +        s-&gt;coreisr[cpu][coreisr_index] &amp;= ~(1 &lt;&lt;
        coreisr_mask);
        <br>
        +        qemu_set_irq(s-&gt;parent_irq[cpu][ipnum], level);
        <br>
        +    }
        <br>
      </blockquote>
      <br>
      This final bit, updating the cpu irq is also wrong, in that it
      should be unconditional. This is the only way that it will work
      for the usage in updating the enable mask.
      <br>
      <br>
      I think you are not considering when the MAP registers overlap
      outputs.  For instance, if all 256 bits of EXT_IOIMap contain 0,
      then all of EXT_IOI[n*32+31 : n*32] overlap.  When that happens,
      you cannot lower the level of the cpu pin until all of the
      matching ioi interrupts are low.
      <br>
      <br>
    </blockquote>
    <span style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;">Thanks, i should consider the MAP
      registers overlap outputs.</span><br style="color: rgb(0, 0, 0);
      font-family: 宋体, arial, Verdana, sans-serif; font-size: 14px;
      font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; font-weight: 400; letter-spacing:
      normal; orphans: 2; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;">And i want to add 'uint32_t
      sw_isr_group[256 / 32]', when each bit of sw_isr_group[n*32+31 :
      n*32] is 0, then lower the level of the cpu pin.</span><br>
    <span style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;"></span><br>
    <span style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;">Thanks.</span><br>
    <span style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;">Xiaojuan</span><br>
    <span style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;"></span>
  </body>
</html>

--------------DE6D127A57BA3FA00FCF3309--


