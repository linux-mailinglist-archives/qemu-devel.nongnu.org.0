Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B87523010
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 12:00:25 +0200 (CEST)
Received: from localhost ([::1]:40158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noj8q-0000PA-Gi
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 06:00:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1noj3h-0004Ld-Ml
 for qemu-devel@nongnu.org; Wed, 11 May 2022 05:55:05 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41372 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1noj3e-0004XN-VS
 for qemu-devel@nongnu.org; Wed, 11 May 2022 05:55:05 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axutjsh3tiXP0QAA--.57711S3; 
 Wed, 11 May 2022 17:54:53 +0800 (CST)
Subject: Re: [PATCH v3 34/43] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
 <20220429100729.1572481-35-yangxiaojuan@loongson.cn>
 <c6b58ba0-38c4-6542-86d1-eb1f14a12121@linaro.org>
 <707db6c2-49f2-2ca2-7025-0cf401f11c60@loongson.cn>
 <e514e333-b458-517f-66f7-f3fd0a0c5bad@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <b0fd3277-8abd-b6fc-bf1f-a083a3b04337@loongson.cn>
Date: Wed, 11 May 2022 17:54:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e514e333-b458-517f-66f7-f3fd0a0c5bad@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------0A507EA0D1BBB3D6BCA4AA4A"
Content-Language: en-US
X-CM-TRANSID: AQAAf9Axutjsh3tiXP0QAA--.57711S3
X-Coremail-Antispam: 1UD129KBjvdXoW7Xw4fWF1DCFyfurWxZry8Grg_yoW3KFg_Wr
 W8urykWw1kArWkG3WYqF47Zw12qFyUKrnrt3yYvr9rXFWrJrs5tws8Z3s5Xry8Wa1kZr1Y
 krW3Jrs3ZasFkjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbI8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
 Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj6I8E
 87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjI
 I2zVCS5cI20VAGYxC7Mx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487
 MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
 02F40E14v26r106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_
 Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
 CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAF
 wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj
 fUoXo2UUUUU
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
--------------0A507EA0D1BBB3D6BCA4AA4A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022/5/10 上午1:56, Richard Henderson wrote:
>
>>>> +    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
>>>> +        index = (offset - EXTIOI_IPMAP_START) >> 2;
>>>> +        s->ipmap[index] = val;
>>>> +        break;
>>>
>>> Do you need to recompute the entire interrupt map when ipmap changes?
>>>
>> Sorry, could you explain it in more detail? i can not understand the 
>> meanning of 'the entire interrupt map'?
>
> I mean, ipmap[*] and coremap[*] controls how isr[*] maps to the 
> various cpus, as coreisr[*].  If either ipmap or coremap changes, do 
> you need to re-compute coreisr[*] from the input isr[*]? 

I think the interrupt has been handled by the core before set coremap or 
ipmap, and coreisr[*] also has been set and cleard by original core.
So,  the new mapped core need not  to update the coreisr[*].

Thanks.
Xiaojuan


--------------0A507EA0D1BBB3D6BCA4AA4A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022/5/10 上午1:56, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:e514e333-b458-517f-66f7-f3fd0a0c5bad@linaro.org"><br>
      <blockquote type="cite" style="color: #000000;">
        <blockquote type="cite" style="color: #000000;">
          <blockquote type="cite" style="color: #000000;">+    case
            EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
            <br>
            +        index = (offset - EXTIOI_IPMAP_START) &gt;&gt; 2;
            <br>
            +        s-&gt;ipmap[index] = val;
            <br>
            +        break;
            <br>
          </blockquote>
          <br>
          Do you need to recompute the entire interrupt map when ipmap
          changes?
          <br>
          <br>
        </blockquote>
        Sorry, could you explain it in more detail? i can not understand
        the meanning of 'the entire interrupt map'?
        <br>
      </blockquote>
      <br>
      I mean, ipmap[*] and coremap[*] controls how isr[*] maps to the
      various cpus, as coreisr[*].  If either ipmap or coremap changes,
      do you need to re-compute coreisr[*] from the input isr[*]?
    </blockquote>
     <br>
    I think the interrupt has been handled by the core before set
    coremap or ipmap, and coreisr[*] also has been set and cleard by
    original core. <br>
    So,  the new mapped core need not  to update the coreisr[*].<br>
    <br>
    <span style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;"></span><span style="color: rgb(0, 0, 0);
      font-family: 宋体, arial, Verdana, sans-serif; font-size: 14px;
      font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; font-weight: 400; letter-spacing:
      normal; orphans: 2; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;"></span><span style="color: rgb(0, 0, 0);
      font-family: 宋体, arial, Verdana, sans-serif; font-size: 14px;
      font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; font-weight: 400; letter-spacing:
      normal; orphans: 2; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;"></span><span style="color: rgb(0, 0, 0);
      font-family: 宋体, arial, Verdana, sans-serif; font-size: 14px;
      font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; font-weight: 400; letter-spacing:
      normal; orphans: 2; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;"></span>Thanks.<br>
    Xiaojuan<br>
    <span style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;"></span>
    <p><span style="color: rgb(0, 0, 0); font-family: 宋体, arial,
        Verdana, sans-serif; font-size: 14px; font-style: normal;
        font-variant-ligatures: normal; font-variant-caps: normal;
        font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: start; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; text-decoration-thickness:
        initial; text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;"></span></p>
  </body>
</html>

--------------0A507EA0D1BBB3D6BCA4AA4A--


