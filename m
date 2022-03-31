Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7016A4ED143
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 03:18:13 +0200 (CEST)
Received: from localhost ([::1]:57076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZjS0-0000NK-Fk
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 21:18:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nZjQq-0007ia-Mu
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 21:17:00 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38910 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nZjQn-0008B2-CH
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 21:17:00 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxDxP_AEVipY8TAA--.21841S3; 
 Thu, 31 Mar 2022 09:16:47 +0800 (CST)
Subject: Re: [RFC PATCH v7 16/29] hw/loongarch: Add LoongArch ipi interrupt
 support(IPI)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-17-yangxiaojuan@loongson.cn>
 <939fafbb-eae3-7f89-0969-287b48d3d270@ilande.co.uk>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <302d111e-2fea-effc-af90-d50460fbf789@loongson.cn>
Date: Thu, 31 Mar 2022 09:16:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <939fafbb-eae3-7f89-0969-287b48d3d270@ilande.co.uk>
Content-Type: multipart/alternative;
 boundary="------------DBE2C34A4120F6FE059410D1"
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxDxP_AEVipY8TAA--.21841S3
X-Coremail-Antispam: 1UD129KBjvJXoW7tFW3uFy3tF1DuFW8Cw17Jrb_yoW8Gryfpr
 y0kFZ3uF4j9Fn7WrsrJa15X3s5JF1rAryUWw4FqFWDGw40vw1aqwn0qr1q9r45GrZ3XFn3
 Xay5Gr45ZFyxXrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
 4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAv7VC0I7IYx2IY67AKxVWUGVWUXwAv
 7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7
 Aq67IIx4CEVc8vx2IErcIFxwCjr7xvwVCIw2I0I7xG6c02F41lc7I2V7IY0VAS07AlzVAY
 IcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
 IqxVAqx4xG67AKxVWUGVWUWwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
 6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
 IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E
 87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
 IFyTuYvjfUwFApUUUUU
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
Cc: richard.henderson@linaro.org, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------DBE2C34A4120F6FE059410D1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Mark,

On 2022/3/29 上午4:15, Mark Cave-Ayland wrote:
>> +
>> +#define TYPE_LOONGARCH_IPI "loongarch_ipi"
>> +OBJECT_DECLARE_SIMPLE_TYPE(LoongArchIPI, LOONGARCH_IPI)
>> +
>> +typedef struct IPICore {
>> +    uint32_t status;
>> +    uint32_t en;
>> +    uint32_t set;
>> +    uint32_t clear;
>> +    /* 64bit buf divide into 2 32bit buf */
>> +    uint32_t buf[MAX_IPI_MBX_NUM * 2];
>> +    qemu_irq irq;
>> +} IPICore;
>> +
>> +typedef struct LoongArchIPI {
>> +    SysBusDevice parent_obj;
>> +    IPICore core[MAX_IPI_CORE_NUM];
>> +    MemoryRegion ipi_mmio[MAX_IPI_CORE_NUM];
>> +} LoongArchIPI;
>> +
>> +#endif
>
> You missed the part in my original comment on patch 14 about dropping 
> the typedef for QOM structs that are defined using 
> OBJECT_DECLARE_TYPE_SIMPLE() i.e.
>
>
> #define TYPE_LOONGARCH_IPI "loongarch_ipi"
> OBJECT_DECLARE_SIMPLE_TYPE(LoongArchIPI, LOONGARCH_IPI)
>
> ...
> ...
>
> typedef struct IPICore {
>    uint32_t status;
>    uint32_t en;
>    uint32_t set;
>    uint32_t clear;
>    /* 64bit buf divide into 2 32bit buf */
>    uint32_t buf[MAX_IPI_MBX_NUM * 2];
>    qemu_irq irq;
> } IPICore;
>
> struct LoongArchIPI {
>     SysBusDevice parent_obj;
>     IPICore core[MAX_IPI_CORE_NUM];
>     MemoryRegion ipi_mmio[MAX_IPI_CORE_NUM];
> };
>
Sorry for that,   I will be more carefully.

Thanks.
Xiaojuan
>
> ATB,
>
> Mark. 

--------------DBE2C34A4120F6FE059410D1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Mark,<br>
    </p>
    <div class="moz-cite-prefix">On 2022/3/29 上午4:15, Mark Cave-Ayland
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:939fafbb-eae3-7f89-0969-287b48d3d270@ilande.co.uk">
      <blockquote type="cite" style="color: #000000;">+
        <br>
        +#define TYPE_LOONGARCH_IPI "loongarch_ipi"
        <br>
        +OBJECT_DECLARE_SIMPLE_TYPE(LoongArchIPI, LOONGARCH_IPI)
        <br>
        +
        <br>
        +typedef struct IPICore {
        <br>
        +    uint32_t status;
        <br>
        +    uint32_t en;
        <br>
        +    uint32_t set;
        <br>
        +    uint32_t clear;
        <br>
        +    /* 64bit buf divide into 2 32bit buf */
        <br>
        +    uint32_t buf[MAX_IPI_MBX_NUM * 2];
        <br>
        +    qemu_irq irq;
        <br>
        +} IPICore;
        <br>
        +
        <br>
        +typedef struct LoongArchIPI {
        <br>
        +    SysBusDevice parent_obj;
        <br>
        +    IPICore core[MAX_IPI_CORE_NUM];
        <br>
        +    MemoryRegion ipi_mmio[MAX_IPI_CORE_NUM];
        <br>
        +} LoongArchIPI;
        <br>
        +
        <br>
        +#endif
        <br>
      </blockquote>
      <br>
      You missed the part in my original comment on patch 14 about
      dropping the typedef for QOM structs that are defined using
      OBJECT_DECLARE_TYPE_SIMPLE() i.e.
      <br>
      <br>
      <br>
      #define TYPE_LOONGARCH_IPI "loongarch_ipi"
      <br>
      OBJECT_DECLARE_SIMPLE_TYPE(LoongArchIPI, LOONGARCH_IPI)
      <br>
      <br>
      ...
      <br>
      ...
      <br>
      <br>
      typedef struct IPICore {
      <br>
         uint32_t status;
      <br>
         uint32_t en;
      <br>
         uint32_t set;
      <br>
         uint32_t clear;
      <br>
         /* 64bit buf divide into 2 32bit buf */
      <br>
         uint32_t buf[MAX_IPI_MBX_NUM * 2];
      <br>
         qemu_irq irq;
      <br>
      } IPICore;
      <br>
      <br>
      struct LoongArchIPI {
      <br>
          SysBusDevice parent_obj;
      <br>
          IPICore core[MAX_IPI_CORE_NUM];
      <br>
          MemoryRegion ipi_mmio[MAX_IPI_CORE_NUM];
      <br>
      };
      <br>
      <br>
    </blockquote>
    Sorry for that,   I will be more carefully.<br>
    <br>
    Thanks.<br>
    Xiaojuan<br>
    <blockquote type="cite"
      cite="mid:939fafbb-eae3-7f89-0969-287b48d3d270@ilande.co.uk">
      <br>
      ATB,
      <br>
      <br>
      Mark.
    </blockquote>
  </body>
</html>

--------------DBE2C34A4120F6FE059410D1--


