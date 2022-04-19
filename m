Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EF95061F3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 04:00:55 +0200 (CEST)
Received: from localhost ([::1]:49932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngdAk-0000oR-U4
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 22:00:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1ngd13-0001Y5-I8
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 21:50:56 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38950 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1ngd10-0003ij-Jd
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 21:50:53 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxKsxxFV5iNGkoAA--.22701S3; 
 Tue, 19 Apr 2022 09:50:41 +0800 (CST)
Subject: Re: [PATCH v1 35/43] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-36-yangxiaojuan@loongson.cn>
 <6d62ce6d-acc2-b07e-71ac-dee03bbfd22f@linaro.org>
 <9f27b53d-d2bf-1fb5-3a46-c910a34d5e3d@ilande.co.uk>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <c25c3a00-b66b-6b1a-1a5e-b007cb36a7be@loongson.cn>
Date: Tue, 19 Apr 2022 09:50:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9f27b53d-d2bf-1fb5-3a46-c910a34d5e3d@ilande.co.uk>
Content-Type: multipart/alternative;
 boundary="------------ED1204DDCDF8D63A216DE539"
Content-Language: en-US
X-CM-TRANSID: AQAAf9AxKsxxFV5iNGkoAA--.22701S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZFy3Gry5Gw43tF18uw4fGrg_yoW5ur1fpr
 18Jw4UGryUJr1kJr1UJr1UXryDJw1UJw1UJr18JF1UJr1UJr1jqr1UXr1jgF1UJw48Jr1U
 Jr1UXr1UZw1UJrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvS14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
 4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAv7VC0I7IYx2IY67AKxVWUJVWUGwAv
 7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7
 Aq67IIx4CEVc8vx2IErcIFxwCjr7xvwVCIw2I0I7xG6c02F41lc7I2V7IY0VAS07AlzVAY
 IcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
 IqxVAqx4xG67AKxVWUGVWUWwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
 6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
 IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2
 jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43
 ZEXa7VUb_gA7UUUUU==
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
Cc: gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------ED1204DDCDF8D63A216DE539
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022/4/18 下午4:57, Mark Cave-Ayland wrote:
> On 18/04/2022 04:48, Richard Henderson wrote:
>
>> On 4/15/22 02:40, Xiaojuan Yang wrote:
>>> + memory_region_init(&s->mmio[cpu], OBJECT(s),
>>> +                           "loongarch_extioi", EXTIOI_SIZE);
>>> +
>>> +        memory_region_init_io(&s->mmio_nodetype[cpu], OBJECT(s),
>>> +                              &extioi_nodetype_ops, s,
>>> +                              EXTIOI_LINKNAME(.nodetype),
>>> +                              IPMAP_OFFSET - APIC_BASE);
>>> +        memory_region_add_subregion(&s->mmio[cpu], 0, 
>>> &s->mmio_nodetype[cpu]);
>>> +
>>> + memory_region_init_io(&s->mmio_ipmap_enable[cpu], OBJECT(s),
>>> +                              &extioi_ipmap_enable_ops, s,
>>> +                              EXTIOI_LINKNAME(.ipmap_enable),
>>> +                              BOUNCE_OFFSET - IPMAP_OFFSET);
>>> +        memory_region_add_subregion(&s->mmio[cpu], IPMAP_OFFSET - 
>>> APIC_BASE,
>>> + &s->mmio_ipmap_enable[cpu]);
>>> +
>>> + memory_region_init_io(&s->mmio_bounce_coreisr[cpu], OBJECT(s),
>>> +                              &extioi_bounce_coreisr_ops, s,
>>> + EXTIOI_LINKNAME(.bounce_coreisr),
>>> +                              COREMAP_OFFSET - BOUNCE_OFFSET);
>>> +        memory_region_add_subregion(&s->mmio[cpu], BOUNCE_OFFSET - 
>>> APIC_BASE,
>>> + &s->mmio_bounce_coreisr[cpu]);
>>> +
>>> +        memory_region_init_io(&s->mmio_coremap[cpu], OBJECT(s),
>>> +                              &extioi_coremap_ops, s,
>>> +                              EXTIOI_LINKNAME(.coremap),
>>> +                              EXTIOI_COREMAP_END);
>>> +        memory_region_add_subregion(&s->mmio[cpu], COREMAP_OFFSET - 
>>> APIC_BASE,
>>> + &s->mmio_coremap[cpu]);
>>
>> Why are these separate memory regions, instead of one region? They're 
>> certainly described in a single table in section 11.2 of the 3A5000 
>> manual...
>
> The reason it was done like this is because there were different 
> access sizes in the relevant _ops definitions. Certainly when I looked 
> at the patches previously I wasn't able to easily see how these could 
> be consolidated without digging deeper into the documentation.
>
Would it be better to keep consistent with the content of the 3A5000 
manual document？ And only one memory region is used to represent the 
extioi iocsr region

Thanks.
Xiaojuan
>
> ATB,
>
> Mark.

--------------ED1204DDCDF8D63A216DE539
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022/4/18 下午4:57, Mark Cave-Ayland
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:9f27b53d-d2bf-1fb5-3a46-c910a34d5e3d@ilande.co.uk">On
      18/04/2022 04:48, Richard Henderson wrote:
      <br>
      <br>
      <blockquote type="cite">On 4/15/22 02:40, Xiaojuan Yang wrote:
        <br>
        <blockquote type="cite">+       
          memory_region_init(&amp;s-&gt;mmio[cpu], OBJECT(s),
          <br>
          +                           "loongarch_extioi", EXTIOI_SIZE);
          <br>
          +
          <br>
          +        memory_region_init_io(&amp;s-&gt;mmio_nodetype[cpu],
          OBJECT(s),
          <br>
          +                              &amp;extioi_nodetype_ops, s,
          <br>
          +                              EXTIOI_LINKNAME(.nodetype),
          <br>
          +                              IPMAP_OFFSET - APIC_BASE);
          <br>
          +        memory_region_add_subregion(&amp;s-&gt;mmio[cpu], 0,
          &amp;s-&gt;mmio_nodetype[cpu]);
          <br>
          +
          <br>
          +       
          memory_region_init_io(&amp;s-&gt;mmio_ipmap_enable[cpu],
          OBJECT(s),
          <br>
          +                              &amp;extioi_ipmap_enable_ops,
          s,
          <br>
          +                              EXTIOI_LINKNAME(.ipmap_enable),
          <br>
          +                              BOUNCE_OFFSET - IPMAP_OFFSET);
          <br>
          +        memory_region_add_subregion(&amp;s-&gt;mmio[cpu],
          IPMAP_OFFSET - APIC_BASE,
          <br>
          +                                   
          &amp;s-&gt;mmio_ipmap_enable[cpu]);
          <br>
          +
          <br>
          +       
          memory_region_init_io(&amp;s-&gt;mmio_bounce_coreisr[cpu],
          OBJECT(s),
          <br>
          +                              &amp;extioi_bounce_coreisr_ops,
          s,
          <br>
          +                             
          EXTIOI_LINKNAME(.bounce_coreisr),
          <br>
          +                              COREMAP_OFFSET -
          BOUNCE_OFFSET);
          <br>
          +        memory_region_add_subregion(&amp;s-&gt;mmio[cpu],
          BOUNCE_OFFSET - APIC_BASE,
          <br>
          +                                   
          &amp;s-&gt;mmio_bounce_coreisr[cpu]);
          <br>
          +
          <br>
          +        memory_region_init_io(&amp;s-&gt;mmio_coremap[cpu],
          OBJECT(s),
          <br>
          +                              &amp;extioi_coremap_ops, s,
          <br>
          +                              EXTIOI_LINKNAME(.coremap),
          <br>
          +                              EXTIOI_COREMAP_END);
          <br>
          +        memory_region_add_subregion(&amp;s-&gt;mmio[cpu],
          COREMAP_OFFSET - APIC_BASE,
          <br>
          +                                   
          &amp;s-&gt;mmio_coremap[cpu]);
          <br>
        </blockquote>
        <br>
        Why are these separate memory regions, instead of one region? 
        They're certainly described in a single table in section 11.2 of
        the 3A5000 manual...
        <br>
      </blockquote>
      <br>
      The reason it was done like this is because there were different
      access sizes in the relevant _ops definitions. Certainly when I
      looked at the patches previously I wasn't able to easily see how
      these could be consolidated without digging deeper into the
      documentation.
      <br>
      <br>
    </blockquote>
    <span style="color: rgb(0, 0, 0); font-family: SimSun; font-size:
      14px; font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; font-weight: 400; letter-spacing:
      normal; orphans: 2; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;">Would it be better to keep consistent
      with the content of the 3A5000 manual document？ And only one
      memory region is used to represent the extioi iocsr region</span><br>
    <span style="color: rgb(0, 0, 0); font-family: SimSun; font-size:
      14px; font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; font-weight: 400; letter-spacing:
      normal; orphans: 2; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;"></span><br>
    <span style="color: rgb(0, 0, 0); font-family: SimSun; font-size:
      14px; font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; font-weight: 400; letter-spacing:
      normal; orphans: 2; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;">Thanks.</span><br>
    <span style="color: rgb(0, 0, 0); font-family: SimSun; font-size:
      14px; font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; font-weight: 400; letter-spacing:
      normal; orphans: 2; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;">Xiaojuan</span><br>
    <span style="color: rgb(0, 0, 0); font-family: SimSun; font-size:
      14px; font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; font-weight: 400; letter-spacing:
      normal; orphans: 2; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;"></span>
    <blockquote type="cite"
      cite="mid:9f27b53d-d2bf-1fb5-3a46-c910a34d5e3d@ilande.co.uk">
      <br>
      ATB,
      <br>
      <br>
      Mark.
      <br>
    </blockquote>
  </body>
</html>

--------------ED1204DDCDF8D63A216DE539--


