Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A959506674
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 10:02:07 +0200 (CEST)
Received: from localhost ([::1]:44788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngioI-0001mY-2l
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 04:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1ngiGy-0004sh-Q8
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 03:27:42 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40172 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1ngiGu-0000kM-Ky
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 03:27:40 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxrxFXZF5irbUoAA--.23344S3; 
 Tue, 19 Apr 2022 15:27:20 +0800 (CST)
Subject: Re: [PATCH v1 33/43] hw/intc: Add LoongArch ls7a interrupt controller
 support(PCH-PIC)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-34-yangxiaojuan@loongson.cn>
 <832efe6e-f647-9691-202c-e8713caf97d5@linaro.org>
 <cb22faf4-8166-e91a-1cdb-3f0bd5736fe3@loongson.cn>
 <5c8d218b-ad1a-ae6f-2540-8499c4808d42@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <9be28479-bc66-81a5-5842-4ad705ed0de2@loongson.cn>
Date: Tue, 19 Apr 2022 15:27:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5c8d218b-ad1a-ae6f-2540-8499c4808d42@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------42625B740EAEC52691E2E501"
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxrxFXZF5irbUoAA--.23344S3
X-Coremail-Antispam: 1UD129KBjvJXoWxXrWUCry5Wr4xGFykZr4xWFg_yoWrWw4rpF
 y8Jr4UCrWUJr18Wr1kXryUZry8JrnrJw1Utrn5XF18ArWUXrnYqF1UXrn2gr1DGr4xJF4j
 yr45GrWjvr1UXr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvI14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
 xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21lYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0E
 x4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5V
 A0II8E6IAqYI8I648v4I1l7480Y4vEI4kI2Ix0rVAqx4xJMxk0xIA0c2IEe2xFo4CEbIxv
 r21lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
 0E5I8CrVAFwI0_JrI_JrWlx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
 AVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
 CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv
 67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf
 9x0JUp5l8UUUUU=
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
--------------42625B740EAEC52691E2E501
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022/4/18 下午10:39, Richard Henderson wrote:
> On 4/18/22 02:14, yangxiaojuan wrote:
>> Hi, Richard
>>
>> On 2022/4/18 上午11:15, Richard Henderson wrote:
>>> On 4/15/22 02:40, Xiaojuan Yang wrote:
>>>> +static void pch_pic_update_irq(LoongArchPCHPIC *s, uint32_t mask,
>>>> +                               int level, int hi)
>>>> +{
>>>> +    uint32_t val, irq;
>>>> +
>>>> +    if (level == 1) {
>>>> +        if (hi) {
>>>> +            val = mask & s->intirr_hi & (~s->int_mask_hi);
>>>> +            irq = find_first_bit((unsigned long *)&val, 32);
>>>
>>> This does not work -- you're accessing beyond the end of the 
>>> uint32_t for all LP64 hosts.  I think you just want ctz32()...
>>>
>>>
>>>> +            if (irq != 32) {
>>>> +                s->intisr_hi |= 1ULL << irq;
>>>> + qemu_set_irq(s->parent_irq[s->htmsi_vector[irq + 32]], 1);
>>>> +            }
>>>
>>> ... which should in fact only be tested if val != 0, which is to 
>>> what this IF equates.
>>>
>>> Is there a good reason that this function is treating hi and lo 
>>> separately, as opposed to simply doing all of the computation on 
>>> uint64_t?
>>>
>>
>> In the part of linux kernel, pch pic driver use 32 bits for reading 
>> and writing.
>> e.g in the drivers/irqchip/irq-loongson-pch-pic.c， pch_pic_mask_irq() 
>> function use writel() to write pch_pic mask reg.
>
> So?  update_irq is not writel.
>
> I expect that you should have done something (manual deposit64 or 
> .impl.min_access_size = 8) with the actual writel, but by the time we 
> arrive in this subroutine we have a complete uint64_t.
>

In the linux kernel pch_pic driver, pch_pic_unmask_irq() use writel to 
config PCH_PIC_CLR reg:

writel(BIT(PIC_REG_BIT(d->hwirq)),
                     priv->base + PCH_PIC_CLR + PIC_REG_IDX(d->hwirq) * 4);

And writel() need u32 value.

static inline void writel(u32 value, volatile void __iomem *addr)
{
     __io_bw();
     __raw_writel((u32 __force)__cpu_to_le32(value), addr);
     __io_aw();
}

The emulate of PCH_PIC_CLR in qemu LoongArchPCHPIC struct member is 
intirr_lo/hi(we devide 64bits reg to two 32bits reg to match the linux 
kernel), it will be changed when we config clear reg or handler irq.

static void loongarch_pch_pic_low_writew(void *opaque, hwaddr addr,
                                      uint64_t data, unsigned size)
{
...
case PCH_PIC_INT_CLEAR_LO:
     if (s->intedge_lo & data) {
         s->intirr_lo &= (~data);
         pch_pic_update_irq(s, data, 0, 0);
         s->intisr_lo &= (~data);
      }
     break;
case PCH_PIC_INT_CLEAR_HI:
     if (s->intedge_hi & data) {
         s->intirr_hi &= (~data);
         pch_pic_update_irq(s, data, 0, 1);
         s->intisr_hi &= (~data);
      }
     break;
...
}

static void pch_pic_irq_handler(void *opaque, int irq, int level)
{
...
hi = (irq >= 32) ? 1 : 0;
if (hi) {
     irq = irq - 32;
}

  mask = 1ULL << irq;


  if (hi) {
     if (s->intedge_hi & mask) {
         /* Edge triggered */
         if (level) {
             if ((s->last_intirr_hi & mask) == 0) {
                 s->intirr_hi |= mask;
             }
             s->last_intirr_hi |= mask;
         } else {
             s->last_intirr_hi &= ~mask;
         }
...
pch_pic_update_irq(s, mask, level, hi);
}

And in update_irq(), we should judge intirr，which irq number is pending.
so we also need whether is intirr_lo or intirr_hi.

static void pch_pic_update_irq(LoongArchPCHPIC *s, uint32_t mask,
                                int level, int hi)
{
     uint32_t val, irq;

     if (level) {
         if (hi) {
             val = mask & s->intirr_hi & (~s->int_mask_hi);
             if (val) {
                 irq = ctz32(val);
                 s->intisr_hi |= 1ULL << irq;
qemu_set_irq(s->parent_irq[s->htmsi_vector[irq + 32]], 1);
             }
......
}

Thanks.
Xiaojuan
>
> r~

--------------42625B740EAEC52691E2E501
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022/4/18 下午10:39, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5c8d218b-ad1a-ae6f-2540-8499c4808d42@linaro.org">On
      4/18/22 02:14, yangxiaojuan wrote:
      <br>
      <blockquote type="cite">Hi, Richard
        <br>
        <br>
        On 2022/4/18 上午11:15, Richard Henderson wrote:
        <br>
        <blockquote type="cite">On 4/15/22 02:40, Xiaojuan Yang wrote:
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
            + qemu_set_irq(s-&gt;parent_irq[s-&gt;htmsi_vector[irq +
            32]], 1);
            <br>
            +            }
            <br>
          </blockquote>
          <br>
          ... which should in fact only be tested if val != 0, which is
          to what this IF equates.
          <br>
          <br>
          Is there a good reason that this function is treating hi and
          lo separately, as opposed to simply doing all of the
          computation on uint64_t?
          <br>
          <br>
        </blockquote>
        <br>
        In the part of linux kernel, pch pic driver use 32 bits for
        reading and writing.
        <br>
        e.g in the drivers/irqchip/irq-loongson-pch-pic.c，
        pch_pic_mask_irq() function use writel() to write pch_pic mask
        reg.
        <br>
      </blockquote>
      <br>
      So?  update_irq is not writel.
      <br>
      <br>
      I expect that you should have done something (manual deposit64 or
      .impl.min_access_size = 8) with the actual writel, but by the time
      we arrive in this subroutine we have a complete uint64_t.
      <br>
      <br>
    </blockquote>
    <br>
    <span style="font-family: SimSun;">In the linux kernel pch_pic
      driver, pch_pic_unmask_irq() use writel to config PCH_PIC_CLR reg:</span><br>
    <br>
    <span style="font-family: SimSun;"></span><span style="font-family:
      SimSun;">writel(BIT(PIC_REG_BIT(d-&gt;hwirq)),</span><br>
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">   
                          priv-&gt;base + PCH_PIC_CLR +
      PIC_REG_IDX(d-&gt;hwirq) * 4);</span><br style="color: rgb(0, 0,
      0); font-family: 宋体, arial, Verdana, sans-serif; font-size: 14px;
      font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; font-weight: 400; letter-spacing:
      normal; orphans: 2; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <br style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
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
      initial; text-decoration-color: initial; font-family: SimSun;">And
      writel() need u32 value.</span><br style="color: rgb(0, 0, 0);
      font-family: 宋体, arial, Verdana, sans-serif; font-size: 14px;
      font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; font-weight: 400; letter-spacing:
      normal; orphans: 2; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="font-family: SimSun;"></span><br>
    <span style="font-family: SimSun;"></span><span style="font-family:
      SimSun;">static inline void writel(u32 value, volatile void
      __iomem *addr)</span><br>
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">{</span><br
      style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
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
      initial; text-decoration-color: initial; font-family: SimSun;">   
          __io_bw();</span><br style="color: rgb(0, 0, 0); font-family:
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
      initial; text-decoration-color: initial; font-family: SimSun;">   
          __raw_writel((u32 __force)__cpu_to_le32(value), addr);</span><br
      style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
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
      initial; text-decoration-color: initial; font-family: SimSun;">   
          __io_aw();</span><br style="color: rgb(0, 0, 0); font-family:
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
      initial; text-decoration-color: initial; font-family: SimSun;">}</span><br
      style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <br style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
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
      initial; text-decoration-color: initial; font-family: SimSun;">The
      emulate of PCH_PIC_CLR in qemu LoongArchPCHPIC struct member is
      intirr_lo/hi(we devide 64bits reg to two 32bits reg to match the
      linux kernel), it will be changed when we config clear reg or
      handler irq. </span><br style="color: rgb(0, 0, 0); font-family:
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
      initial; text-decoration-color: initial; font-family: SimSun;"></span><br>
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;"></span><span
      style="color: rgb(0, 0, 0); font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">static
      void loongarch_pch_pic_low_writew(void *opaque, hwaddr addr,</span><br
      style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
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
      initial; text-decoration-color: initial; font-family: SimSun;">   
                                           uint64_t data, unsigned size)</span><br
      style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
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
      initial; text-decoration-color: initial; font-family: SimSun;">{</span><br
      style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
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
      initial; text-decoration-color: initial; font-family: SimSun;">...</span><br
      style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
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
      initial; text-decoration-color: initial; font-family: SimSun;">   
      case PCH_PIC_INT_CLEAR_LO:</span><br style="color: rgb(0, 0, 0);
      font-family: 宋体, arial, Verdana, sans-serif; font-size: 14px;
      font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; font-weight: 400; letter-spacing:
      normal; orphans: 2; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">   
          if (s-&gt;intedge_lo &amp; data) {</span><br style="color:
      rgb(0, 0, 0); font-family: 宋体, arial, Verdana, sans-serif;
      font-size: 14px; font-style: normal; font-variant-ligatures:
      normal; font-variant-caps: normal; font-weight: 400;
      letter-spacing: normal; orphans: 2; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">   
              s-&gt;intirr_lo &amp;= (~data);</span><br style="color:
      rgb(0, 0, 0); font-family: 宋体, arial, Verdana, sans-serif;
      font-size: 14px; font-style: normal; font-variant-ligatures:
      normal; font-variant-caps: normal; font-weight: 400;
      letter-spacing: normal; orphans: 2; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">   
              pch_pic_update_irq(s, data, 0, 0);</span><br style="color:
      rgb(0, 0, 0); font-family: 宋体, arial, Verdana, sans-serif;
      font-size: 14px; font-style: normal; font-variant-ligatures:
      normal; font-variant-caps: normal; font-weight: 400;
      letter-spacing: normal; orphans: 2; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">   
              s-&gt;intisr_lo &amp;= (~data);</span><br style="color:
      rgb(0, 0, 0); font-family: 宋体, arial, Verdana, sans-serif;
      font-size: 14px; font-style: normal; font-variant-ligatures:
      normal; font-variant-caps: normal; font-weight: 400;
      letter-spacing: normal; orphans: 2; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">   
           }</span><br style="color: rgb(0, 0, 0); font-family: 宋体,
      arial, Verdana, sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
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
      initial; text-decoration-color: initial; font-family: SimSun;">   
          break;</span><br style="color: rgb(0, 0, 0); font-family: 宋体,
      arial, Verdana, sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
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
      initial; text-decoration-color: initial; font-family: SimSun;">   
      case PCH_PIC_INT_CLEAR_HI:</span><br style="color: rgb(0, 0, 0);
      font-family: 宋体, arial, Verdana, sans-serif; font-size: 14px;
      font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; font-weight: 400; letter-spacing:
      normal; orphans: 2; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">   
          if (s-&gt;intedge_hi &amp; data) {</span><br style="color:
      rgb(0, 0, 0); font-family: 宋体, arial, Verdana, sans-serif;
      font-size: 14px; font-style: normal; font-variant-ligatures:
      normal; font-variant-caps: normal; font-weight: 400;
      letter-spacing: normal; orphans: 2; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">   
              s-&gt;intirr_hi &amp;= (~data);</span><br style="color:
      rgb(0, 0, 0); font-family: 宋体, arial, Verdana, sans-serif;
      font-size: 14px; font-style: normal; font-variant-ligatures:
      normal; font-variant-caps: normal; font-weight: 400;
      letter-spacing: normal; orphans: 2; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">   
              pch_pic_update_irq(s, data, 0, 1);</span><br style="color:
      rgb(0, 0, 0); font-family: 宋体, arial, Verdana, sans-serif;
      font-size: 14px; font-style: normal; font-variant-ligatures:
      normal; font-variant-caps: normal; font-weight: 400;
      letter-spacing: normal; orphans: 2; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">   
              s-&gt;intisr_hi &amp;= (~data);</span><br style="color:
      rgb(0, 0, 0); font-family: 宋体, arial, Verdana, sans-serif;
      font-size: 14px; font-style: normal; font-variant-ligatures:
      normal; font-variant-caps: normal; font-weight: 400;
      letter-spacing: normal; orphans: 2; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">   
           }</span><br style="color: rgb(0, 0, 0); font-family: 宋体,
      arial, Verdana, sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
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
      initial; text-decoration-color: initial; font-family: SimSun;">   
          break;</span><br style="color: rgb(0, 0, 0); font-family: 宋体,
      arial, Verdana, sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
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
      initial; text-decoration-color: initial; font-family: SimSun;">...</span><br
      style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
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
      initial; text-decoration-color: initial; font-family: SimSun;">}</span><br
      style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <br style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
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
      initial; text-decoration-color: initial; font-family: SimSun;">static
      void pch_pic_irq_handler(void *opaque, int irq, int level)</span><br
      style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
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
      initial; text-decoration-color: initial; font-family: SimSun;">{</span><br
      style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
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
      initial; text-decoration-color: initial; font-family: SimSun;">...</span><br
      style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
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
      initial; text-decoration-color: initial; font-family: SimSun;">   
      hi = (irq &gt;= 32) ? 1 : 0;</span><br style="color: rgb(0, 0, 0);
      font-family: 宋体, arial, Verdana, sans-serif; font-size: 14px;
      font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; font-weight: 400; letter-spacing:
      normal; orphans: 2; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">   
      if (hi) {</span><br style="color: rgb(0, 0, 0); font-family: 宋体,
      arial, Verdana, sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
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
      initial; text-decoration-color: initial; font-family: SimSun;">   
          irq = irq - 32;</span><br style="color: rgb(0, 0, 0);
      font-family: 宋体, arial, Verdana, sans-serif; font-size: 14px;
      font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; font-weight: 400; letter-spacing:
      normal; orphans: 2; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">   
      }</span><br style="color: rgb(0, 0, 0); font-family: 宋体, arial,
      Verdana, sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
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
      initial; text-decoration-color: initial; font-family: SimSun;">   </span><br
      style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
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
      initial; text-decoration-color: initial; font-family: SimSun;"> 
       mask = 1ULL &lt;&lt; irq;</span><br style="color: rgb(0, 0, 0);
      font-family: 宋体, arial, Verdana, sans-serif; font-size: 14px;
      font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; font-weight: 400; letter-spacing:
      normal; orphans: 2; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
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
      initial; text-decoration-color: initial; font-family: SimSun;"></span><br
      style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
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
      initial; text-decoration-color: initial; font-family: SimSun;"> 
       if (hi) {</span><br style="color: rgb(0, 0, 0); font-family: 宋体,
      arial, Verdana, sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
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
      initial; text-decoration-color: initial; font-family: SimSun;">   
          if (s-&gt;intedge_hi &amp; mask) {</span><br style="color:
      rgb(0, 0, 0); font-family: 宋体, arial, Verdana, sans-serif;
      font-size: 14px; font-style: normal; font-variant-ligatures:
      normal; font-variant-caps: normal; font-weight: 400;
      letter-spacing: normal; orphans: 2; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">   
              /* Edge triggered */</span><br style="color: rgb(0, 0, 0);
      font-family: 宋体, arial, Verdana, sans-serif; font-size: 14px;
      font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; font-weight: 400; letter-spacing:
      normal; orphans: 2; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">   
              if (level) {</span><br style="color: rgb(0, 0, 0);
      font-family: 宋体, arial, Verdana, sans-serif; font-size: 14px;
      font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; font-weight: 400; letter-spacing:
      normal; orphans: 2; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">   
                  if ((s-&gt;last_intirr_hi &amp; mask) == 0) {</span><br
      style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
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
      initial; text-decoration-color: initial; font-family: SimSun;">   
                      s-&gt;intirr_hi |= mask;</span><br style="color:
      rgb(0, 0, 0); font-family: 宋体, arial, Verdana, sans-serif;
      font-size: 14px; font-style: normal; font-variant-ligatures:
      normal; font-variant-caps: normal; font-weight: 400;
      letter-spacing: normal; orphans: 2; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">   
                  }</span><br style="color: rgb(0, 0, 0); font-family:
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
      initial; text-decoration-color: initial; font-family: SimSun;">   
                  s-&gt;last_intirr_hi |= mask;</span><br style="color:
      rgb(0, 0, 0); font-family: 宋体, arial, Verdana, sans-serif;
      font-size: 14px; font-style: normal; font-variant-ligatures:
      normal; font-variant-caps: normal; font-weight: 400;
      letter-spacing: normal; orphans: 2; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">   
              } else {</span><br style="color: rgb(0, 0, 0);
      font-family: 宋体, arial, Verdana, sans-serif; font-size: 14px;
      font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; font-weight: 400; letter-spacing:
      normal; orphans: 2; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">   
                  s-&gt;last_intirr_hi &amp;= ~mask;</span><br
      style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
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
      initial; text-decoration-color: initial; font-family: SimSun;">   
              }</span><br style="color: rgb(0, 0, 0); font-family: 宋体,
      arial, Verdana, sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
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
      initial; text-decoration-color: initial; font-family: SimSun;">...</span><br
      style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
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
      initial; text-decoration-color: initial; font-family: SimSun;">   
      pch_pic_update_irq(s, mask, level, hi);</span><br style="color:
      rgb(0, 0, 0); font-family: 宋体, arial, Verdana, sans-serif;
      font-size: 14px; font-style: normal; font-variant-ligatures:
      normal; font-variant-caps: normal; font-weight: 400;
      letter-spacing: normal; orphans: 2; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">}</span><br
      style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <br style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
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
      initial; text-decoration-color: initial; font-family: SimSun;">And
      in update_irq(), we should judge intirr，which irq number is
      pending.</span><br style="color: rgb(0, 0, 0); font-family: 宋体,
      arial, Verdana, sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
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
      initial; text-decoration-color: initial; font-family: SimSun;">so
      we also need whether is intirr_lo or intirr_hi.</span><br
      style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <br style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;">static void
      pch_pic_update_irq(LoongArchPCHPIC *s, uint32_t mask,</span><br
      style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;">                               int
      level, int hi)</span><br style="color: rgb(0, 0, 0); font-family:
      宋体, arial, Verdana, sans-serif; font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;">{</span><br style="color: rgb(0, 0, 0);
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
      !important; float: none;">    uint32_t val, irq;</span><br
      style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <br style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;">    if (level) {</span><br style="color:
      rgb(0, 0, 0); font-family: 宋体, arial, Verdana, sans-serif;
      font-size: 14px; font-style: normal; font-variant-ligatures:
      normal; font-variant-caps: normal; font-weight: 400;
      letter-spacing: normal; orphans: 2; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
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
      !important; float: none;">        if (hi) {</span><br
      style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;">            val = mask &amp;
      s-&gt;intirr_hi &amp; (~s-&gt;int_mask_hi);</span><br
      style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;">            if (val) {</span><br
      style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;">                irq = ctz32(val);</span><br
      style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;">                s-&gt;intisr_hi |= 1ULL
      &lt;&lt; irq;</span><br style="color: rgb(0, 0, 0); font-family:
      宋体, arial, Verdana, sans-serif; font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;">               
      qemu_set_irq(s-&gt;parent_irq[s-&gt;htmsi_vector[irq + 32]], 1);</span><br
      style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;">            }</span><br style="color:
      rgb(0, 0, 0); font-family: 宋体, arial, Verdana, sans-serif;
      font-size: 14px; font-style: normal; font-variant-ligatures:
      normal; font-variant-caps: normal; font-weight: 400;
      letter-spacing: normal; orphans: 2; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    ......<br>
    }<br>
    <br>
    Thanks.<br>
    Xiaojuan<br>
    <blockquote type="cite"
      cite="mid:5c8d218b-ad1a-ae6f-2540-8499c4808d42@linaro.org">
      <br>
      r~
      <br>
    </blockquote>
  </body>
</html>

--------------42625B740EAEC52691E2E501--


