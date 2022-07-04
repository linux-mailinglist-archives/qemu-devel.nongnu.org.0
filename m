Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F29BA565081
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:13:27 +0200 (CEST)
Received: from localhost ([::1]:37604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8I91-0003h7-3N
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:13:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1o8I5s-0000B4-3R
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:10:12 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35878 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1o8I5o-0001Ny-DC
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:10:11 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX+NjrsJi4kYIAA--.25286S3; 
 Mon, 04 Jul 2022 17:09:56 +0800 (CST)
Subject: Re: [PATCH 10/11] hw/intc/loongarch_ipi: Fix ipi device access of
 64bits
To: Richard Henderson <richard.henderson@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk, mst@redhat.com,
 imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
 <20220701093407.2150607-11-yangxiaojuan@loongson.cn>
 <f67efcc1-e261-1701-5cfe-92cf1f908fd6@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <623c3e0c-f636-8adc-66be-6fab4d990f57@loongson.cn>
Date: Mon, 4 Jul 2022 17:09:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f67efcc1-e261-1701-5cfe-92cf1f908fd6@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------182EE7F9DE43442ACBB5642C"
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxX+NjrsJi4kYIAA--.25286S3
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYC7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
 6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2
 z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67
 IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCjr7xvwVCIw2I0I7xG6c02
 F41lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82
 IY6x8ErcxFaVAv8VW5Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
 xVWUGVWUWwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrx
 kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
 6r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r
 4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUtkuxU
 UUUU=
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
--------------182EE7F9DE43442ACBB5642C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022/7/4 下午1:28, Richard Henderson wrote:
> On 7/1/22 15:04, Xiaojuan Yang wrote:
>> +static const MemoryRegionOps loongarch_ipi64_ops = {
>> +    .write = loongarch_ipi_writeq,
>> +    .impl.min_access_size = 8,
>> +    .impl.max_access_size = 8,
>> +    .valid.min_access_size = 4,
>> +    .valid.max_access_size = 8,
>> +    .endianness = DEVICE_LITTLE_ENDIAN,
>> +};
>
> Is it really valid to write 4 bytes instead of 8?
>
This ipi64_ops only support 8 bytes writing,   We will correct it.

Thanks.
Song Gao

> r~

--------------182EE7F9DE43442ACBB5642C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022/7/4 下午1:28, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f67efcc1-e261-1701-5cfe-92cf1f908fd6@linaro.org">On
      7/1/22 15:04, Xiaojuan Yang wrote:
      <br>
      <blockquote type="cite">+static const MemoryRegionOps
        loongarch_ipi64_ops = {
        <br>
        +    .write = loongarch_ipi_writeq,
        <br>
        +    .impl.min_access_size = 8,
        <br>
        +    .impl.max_access_size = 8,
        <br>
        +    .valid.min_access_size = 4,
        <br>
        +    .valid.max_access_size = 8,
        <br>
        +    .endianness = DEVICE_LITTLE_ENDIAN,
        <br>
        +};
        <br>
      </blockquote>
      <br>
      Is it really valid to write 4 bytes instead of 8?
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
      !important; float: none;">This ipi64_ops only support 8 bytes
      writing,   We will correct it.<br>
    </span><br>
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
      !important; float: none;">Song Gao<br>
    </span>
    <p><span style="color: rgb(0, 0, 0); font-family: SimSun; font-size:
        14px; font-style: normal; font-variant-ligatures: normal;
        font-variant-caps: normal; font-weight: 400; letter-spacing:
        normal; orphans: 2; text-align: start; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 2;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;
        text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;"></span></p>
    <blockquote type="cite"
      cite="mid:f67efcc1-e261-1701-5cfe-92cf1f908fd6@linaro.org">r~
      <br>
    </blockquote>
  </body>
</html>

--------------182EE7F9DE43442ACBB5642C--


