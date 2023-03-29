Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 313BD6CCFF8
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 04:30:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phLYf-0006e9-GR; Tue, 28 Mar 2023 22:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1phLYW-0006MQ-34
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 22:28:56 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1phLYT-0007Ja-1w
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 22:28:55 -0400
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8CxztpioiNka34TAA--.18265S3;
 Wed, 29 Mar 2023 10:28:50 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxhbxioiNkQAgQAA--.9808S3; 
 Wed, 29 Mar 2023 10:28:50 +0800 (CST)
Subject: Re: [RFC PATCH v2 01/44] target/loongarch: Add LSX data type VReg
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-2-gaosong@loongson.cn>
 <e7464e59-ce39-28b2-1cd8-3ba80ef51533@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <4c94dd4a-8c7a-8539-71e6-ec64d7137659@loongson.cn>
Date: Wed, 29 Mar 2023 10:28:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e7464e59-ce39-28b2-1cd8-3ba80ef51533@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------5B7EBEE666EB9DD4D2CA4162"
Content-Language: en-US
X-CM-TRANSID: AQAAf8DxhbxioiNkQAgQAA--.9808S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxAr13ZrWxAF4xAr1fJrW5Wrg_yoW5Zr4fpr
 n7uF47urW7Jr4xZw4UG345uaykWa15uw15C3WFg3WDGrykGr4qgrWjqryY9rnxJw4xJr1I
 yrWDZ3yxuF47A37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 DUYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUUbx8YFVCjjxCrM7AC8VAFwI0_Jr0_
 Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFV
 AK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2
 z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJw
 A2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487
 Mc804VCY07AIYIkI8VC2zVCFFI0UMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67
 AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l7480Y4vEI4kI2Ix0
 rVAqx4xJMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
 0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUGVWUWwC20s026x8GjcxK67AKxVWUGVWUWwC2
 zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
 4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
 CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIda
 VFxhVjvjDU0xZFpf9x07UNa9-UUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a multi-part message in MIME format.
--------------5B7EBEE666EB9DD4D2CA4162
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2023/3/29 上午3:56, Richard Henderson 写道:
>> @@ -33,7 +33,39 @@ const VMStateDescription vmstate_loongarch_cpu = {
>>             VMSTATE_UINTTL_ARRAY(env.gpr, LoongArchCPU, 32),
>>           VMSTATE_UINTTL(env.pc, LoongArchCPU),
>> -        VMSTATE_UINT64_ARRAY(env.fpr, LoongArchCPU, 32),
>> +        VMSTATE_INT64(env.fpr[0].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[1].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[2].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[3].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[4].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[5].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[6].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[7].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[8].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[9].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[10].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[11].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[12].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[13].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[14].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[15].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[16].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[17].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[18].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[19].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[20].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[21].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[22].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[23].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[24].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[25].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[26].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[27].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[28].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[29].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[30].vreg.D(0), LoongArchCPU),
>> +        VMSTATE_INT64(env.fpr[31].vreg.D(0), LoongArchCPU),
>
> Do you care about migration compatibility between qemu versions?
> If not, it might be easier to handle the vector registers differently.
Since our features are not yet complete,   such as  128 bit vector 
instrcutions,   256 bit vector instructions
and kvm ,  we don't care about this now.

Thanks.
Song Gao

--------------5B7EBEE666EB9DD4D2CA4162
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2023/3/29 上午3:56, Richard Henderson
      写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:e7464e59-ce39-28b2-1cd8-3ba80ef51533@linaro.org">
      <blockquote type="cite" style="color: #000000;">@@ -33,7 +33,39 @@
        const VMStateDescription vmstate_loongarch_cpu = {
        <br>
                    VMSTATE_UINTTL_ARRAY(env.gpr, LoongArchCPU, 32),
        <br>
                  VMSTATE_UINTTL(env.pc, LoongArchCPU),
        <br>
        -        VMSTATE_UINT64_ARRAY(env.fpr, LoongArchCPU, 32),
        <br>
        +        VMSTATE_INT64(env.fpr[0].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[1].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[2].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[3].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[4].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[5].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[6].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[7].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[8].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[9].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[10].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[11].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[12].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[13].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[14].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[15].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[16].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[17].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[18].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[19].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[20].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[21].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[22].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[23].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[24].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[25].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[26].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[27].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[28].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[29].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[30].vreg.D(0), LoongArchCPU),
        <br>
        +        VMSTATE_INT64(env.fpr[31].vreg.D(0), LoongArchCPU),
        <br>
      </blockquote>
      <br>
      Do you care about migration compatibility between qemu versions?
      <br>
      If not, it might be easier to handle the vector registers
      differently.
      <br>
    </blockquote>
    Since our features are not yet complete,   such as  128 bit vector
    instrcutions,   256 bit vector instructions<br>
    and kvm ,  we don't care about this now. <br>
    <br>
    Thanks.<br>
    Song Gao<br>
  </body>
</html>

--------------5B7EBEE666EB9DD4D2CA4162--


