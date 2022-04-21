Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 389E850953E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 05:12:12 +0200 (CEST)
Received: from localhost ([::1]:40608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhNEp-0005UX-1y
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 23:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nhNDO-0004gz-Qq
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 23:10:43 -0400
Received: from mail.loongson.cn ([114.242.206.163]:52296 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nhNDM-0004I9-7c
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 23:10:42 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxsM4oy2Bi9bUqAA--.26334S3; 
 Thu, 21 Apr 2022 11:10:32 +0800 (CST)
Subject: Re: [PATCH v1 33/43] hw/intc: Add LoongArch ls7a interrupt controller
 support(PCH-PIC)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-34-yangxiaojuan@loongson.cn>
 <832efe6e-f647-9691-202c-e8713caf97d5@linaro.org>
 <cb22faf4-8166-e91a-1cdb-3f0bd5736fe3@loongson.cn>
 <5c8d218b-ad1a-ae6f-2540-8499c4808d42@linaro.org>
 <9be28479-bc66-81a5-5842-4ad705ed0de2@loongson.cn>
 <d0506536-de1f-52d9-a498-46de3d42a6cc@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <4880ba0b-e51e-8879-fdb8-f6cb8b5d8be8@loongson.cn>
Date: Thu, 21 Apr 2022 11:10:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d0506536-de1f-52d9-a498-46de3d42a6cc@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------7E5CD6A9FD8F07BB66961EA6"
Content-Language: en-US
X-CM-TRANSID: AQAAf9BxsM4oy2Bi9bUqAA--.26334S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJry8KrWDur48Xr17WryrtFb_yoW8WF1rpF
 W8Jr4UArWUtr18Wr1kuryUJFy8Jr17Aw1a9rn8Ga48A3yYqr9Yqr1DXrn2grnrKr4xJr1U
 JFnrJrWj9r1DZwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUva14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
 4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj
 6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c
 0EjII2zVCS5cI20VAGYxC7Mx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vI
 Y487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
 026c02F40E14v26r106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
 JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
 vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280
 aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyT
 uYvjfUoXo2UUUUU
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
--------------7E5CD6A9FD8F07BB66961EA6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022/4/20 上午1:14, Richard Henderson wrote:
>
>> The emulate of PCH_PIC_CLR in qemu LoongArchPCHPIC struct member is 
>> intirr_lo/hi(we devide 64bits reg to two 32bits reg to match the 
>> linux kernel), it will be changed when we config clear reg or handler 
>> irq.
>>
>> static void loongarch_pch_pic_low_writew(void *opaque, hwaddr addr,
>>                                       uint64_t data, unsigned size)
>> {
>> ...
>> case PCH_PIC_INT_CLEAR_LO:
>>      if (s->intedge_lo & data) {
>>          s->intirr_lo &= (~data);
>>          pch_pic_update_irq(s, data, 0, 0);
>>          s->intisr_lo &= (~data);
>>       }
>>      break;
>> case PCH_PIC_INT_CLEAR_HI:
>>      if (s->intedge_hi & data) {
>>          s->intirr_hi &= (~data);
>>          pch_pic_update_irq(s, data, 0, 1);
>>          s->intisr_hi &= (~data);
>>       }
>>      break;
>
> One can just as easily do
>
>     case PCH_PIC_INT_CLEAR_LO:
>         data = (uint32_t)data;
>         goto do_clear;
>     case PCH_PIC_INT_CLEAR_HI:
>         data <<= 32;
>     do_clear:
>         s->intrr &= ~data;
>         pch_pic_update_irq(s...);
>         s->intrs &= ~data;
>
> with the values internal to qemu be represented with uint64_t instead 
> of a pair of uint32_t.  Which would in fact be *much* clearer to read, 
> and would seem to cut down the number of code lines required by half. 
Sorry, I didn't understand your means before.
I will fix it in this way. Repalcing pch_pic uint32 registers with 
uint64 and fix its' reading/writing options to keep consistency with the 
document.

Thanks.
Xiaojuan

--------------7E5CD6A9FD8F07BB66961EA6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022/4/20 上午1:14, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:d0506536-de1f-52d9-a498-46de3d42a6cc@linaro.org"><br>
      <blockquote type="cite" style="color: #000000;">The emulate of
        PCH_PIC_CLR in qemu LoongArchPCHPIC struct member is
        intirr_lo/hi(we devide 64bits reg to two 32bits reg to match the
        linux kernel), it will be changed when we config clear reg or
        handler irq.
        <br>
        <br>
        static void loongarch_pch_pic_low_writew(void *opaque, hwaddr
        addr,
        <br>
                                              uint64_t data, unsigned
        size)
        <br>
        {
        <br>
        ...
        <br>
        case PCH_PIC_INT_CLEAR_LO:
        <br>
             if (s-&gt;intedge_lo &amp; data) {
        <br>
                 s-&gt;intirr_lo &amp;= (~data);
        <br>
                 pch_pic_update_irq(s, data, 0, 0);
        <br>
                 s-&gt;intisr_lo &amp;= (~data);
        <br>
              }
        <br>
             break;
        <br>
        case PCH_PIC_INT_CLEAR_HI:
        <br>
             if (s-&gt;intedge_hi &amp; data) {
        <br>
                 s-&gt;intirr_hi &amp;= (~data);
        <br>
                 pch_pic_update_irq(s, data, 0, 1);
        <br>
                 s-&gt;intisr_hi &amp;= (~data);
        <br>
              }
        <br>
             break;
        <br>
      </blockquote>
      <br>
      One can just as easily do
      <br>
      <br>
          case PCH_PIC_INT_CLEAR_LO:
      <br>
              data = (uint32_t)data;
      <br>
              goto do_clear;
      <br>
          case PCH_PIC_INT_CLEAR_HI:
      <br>
              data &lt;&lt;= 32;
      <br>
          do_clear:
      <br>
              s-&gt;intrr &amp;= ~data;
      <br>
              pch_pic_update_irq(s...);
      <br>
              s-&gt;intrs &amp;= ~data;
      <br>
      <br>
      with the values internal to qemu be represented with uint64_t
      instead of a pair of uint32_t.  Which would in fact be <b
        class="moz-txt-star"><span class="moz-txt-tag">*</span>much<span
          class="moz-txt-tag">*</span></b> clearer to read, and would
      seem to cut down the number of code lines required by half.
    </blockquote>
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">Sorry,
      I didn't understand your means before.</span><br style="color:
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
      initial; text-decoration-color: initial; font-family: SimSun;">I
      will fix it in this way. Repalcing pch_pic uint32 registers with
      uint64 and fix its' reading/writing options to keep consistency
      with the document.</span><br>
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
      initial; text-decoration-color: initial; font-family: SimSun;">Xiaojuan</span><br>
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;"></span>
  </body>
</html>

--------------7E5CD6A9FD8F07BB66961EA6--


