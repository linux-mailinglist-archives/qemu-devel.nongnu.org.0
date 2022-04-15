Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFC350266D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 09:54:37 +0200 (CEST)
Received: from localhost ([::1]:59976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfGmq-0003vK-6q
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 03:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nfGl5-0003Ek-PR
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 03:52:47 -0400
Received: from mail.loongson.cn ([114.242.206.163]:48036 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nfGl2-0004FI-6J
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 03:52:47 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxrxA8JFlicSwkAA--.16212S3; 
 Fri, 15 Apr 2022 15:52:29 +0800 (CST)
Subject: Re: [RFC PATCH v7 14/29] hw/loongarch: Add support loongson3 virt
 machine type.
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-15-yangxiaojuan@loongson.cn>
 <dbb17042-55e6-b9ba-8037-0b2f9013c194@linaro.org>
 <b7b3a240-da5e-9ae6-a1e7-f887c286cdf9@ilande.co.uk>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <b822e00c-145e-b874-170d-136ada096f00@loongson.cn>
Date: Fri, 15 Apr 2022 15:52:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b7b3a240-da5e-9ae6-a1e7-f887c286cdf9@ilande.co.uk>
Content-Type: multipart/alternative;
 boundary="------------9860883DC3BA1B628395BA15"
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxrxA8JFlicSwkAA--.16212S3
X-Coremail-Antispam: 1UD129KBjvdXoWrtFWDJw1fCr4xAryxKF4rXwb_yoWDWFc_Xa
 1fGr18Ww4jqw45Zw4DXa4F9r1xKr4jyF1kZrZYvr1fJrWUXrn8Jrn8W3saqr48Gw4xtrn5
 Grn8ZrW3u3W7XjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbIxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
 6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------9860883DC3BA1B628395BA15
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 2022/3/29 上午5:02, Mark Cave-Ayland wrote:
>>
>>> +static const MemoryRegionOps loongarch_qemu_ops = {
>>> +    .read = loongarch_qemu_read,
>>> +    .write = loongarch_qemu_write,
>>> +    .endianness = DEVICE_LITTLE_ENDIAN,
>>> +    .valid = {
>>> +        .min_access_size = 4,
>>> +        .max_access_size = 8,
>>> +    },
>>> +    .impl = {
>>> +        .min_access_size = 4,
>>> +        .max_access_size = 8,
>>> +    },
>>
>> The implementation above doesn't actually support access size 4; it 
>> only supports 8.
>> It doesn't seem like this should be a io region at all, but a ROM.
>
> Strangely enough I had a similar requirement for my q800 patches, and 
> when I tried to implement a ROM memory region then the accesses didn't 
> work as expected. I can't remember the exact problem however... 
It seems that iocsr_misc may not use rom region, because the 
MISC_FUNC_REG should be writen.
could I modify it as a device? and define its structure and memregion 
options.

Thanks
Xiaojuan

--------------9860883DC3BA1B628395BA15
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi, <br>
    </p>
    <div class="moz-cite-prefix">On 2022/3/29 上午5:02, Mark Cave-Ayland
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b7b3a240-da5e-9ae6-a1e7-f887c286cdf9@ilande.co.uk">
      <blockquote type="cite" style="color: #000000;"><br>
        <blockquote type="cite" style="color: #000000;">+static const
          MemoryRegionOps loongarch_qemu_ops = {
          <br>
          +    .read = loongarch_qemu_read,
          <br>
          +    .write = loongarch_qemu_write,
          <br>
          +    .endianness = DEVICE_LITTLE_ENDIAN,
          <br>
          +    .valid = {
          <br>
          +        .min_access_size = 4,
          <br>
          +        .max_access_size = 8,
          <br>
          +    },
          <br>
          +    .impl = {
          <br>
          +        .min_access_size = 4,
          <br>
          +        .max_access_size = 8,
          <br>
          +    },
          <br>
        </blockquote>
        <br>
        The implementation above doesn't actually support access size 4;
        it only supports 8.
        <br>
        It doesn't seem like this should be a io region at all, but a
        ROM.
        <br>
      </blockquote>
      <br>
      Strangely enough I had a similar requirement for my q800 patches,
      and when I tried to implement a ROM memory region then the
      accesses didn't work as expected. I can't remember the exact
      problem however...
    </blockquote>
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">It
      seems that iocsr_misc may not use rom region, because the
      MISC_FUNC_REG should be writen.</span><br style="color: rgb(0, 0,
      0); font-family: 宋体, arial, Verdana, sans-serif; font-size: 14px;
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
      initial; text-decoration-color: initial; font-family: SimSun;">could
      I modify it as a device? and define its structure and memregion
      options. </span><br>
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
      initial; text-decoration-color: initial; font-family: SimSun;">Thanks</span><br>
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

--------------9860883DC3BA1B628395BA15--


