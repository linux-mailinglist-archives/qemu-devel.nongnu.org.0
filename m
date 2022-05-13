Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B15525D5E
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 10:34:08 +0200 (CEST)
Received: from localhost ([::1]:35364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npQkR-0001kI-5H
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 04:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1npQeU-0004AS-N2
 for qemu-devel@nongnu.org; Fri, 13 May 2022 04:27:58 -0400
Received: from mail.loongson.cn ([114.242.206.163]:59126 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1npQeS-0001Qg-1j
 for qemu-devel@nongnu.org; Fri, 13 May 2022 04:27:58 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxGtmCFn5iABEUAA--.5320S3;
 Fri, 13 May 2022 16:27:46 +0800 (CST)
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
Message-ID: <7fe135de-0250-e45c-16aa-fb97bb001876@loongson.cn>
Date: Fri, 13 May 2022 16:27:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e514e333-b458-517f-66f7-f3fd0a0c5bad@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------4252A252A364258375DBCB30"
Content-Language: en-US
X-CM-TRANSID: AQAAf9AxGtmCFn5iABEUAA--.5320S3
X-Coremail-Antispam: 1UD129KBjvdXoWrtr4UAr4xJry8Ww1kGr1fXrb_yoWkGFb_Jr
 W7JFWjvF1kArW0yw1jvr1UZr1UAw4jvr1xJr12yw47K34kZ3ZxtrsYqr93Jr1fKF45Gr1D
 CrWqkr13Jrn0qjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbI8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
 6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
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
--------------4252A252A364258375DBCB30
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022/5/10 上午1:56, Richard Henderson wrote:
> On 5/9/22 04:38, yangxiaojuan wrote:
>>> You are not considering CSR[0x420][49], which changes the format of 
>>> this mapping.
>>>
>> Thanks very much, I will consider the mapping format by read 
>> iocsr[0x420][49] like this:
>> static uint64_t map_format(void)
>> {
>>      LoongArchCPU *cpu;
>>      CPULoongArchState *env;
>>      uint64_t val;
>>
>>      cpu = LOONGARCH_CPU(current_cpu);
>>      env = &(cpu->env);
>>
>>      val = address_space_ldq(&env->address_space_iocsr, 0x420,
>>                               MEMTXATTRS_UNSPECIFIED, NULL);
>>      val &= 1 << 49;
>>      return val;
>> }
>
> I'm not 100% sure how this "Other configuration control register" 
> should be handled, but definitely not like this. 
Could we use the bitmapping as the default cpu or ip map format? Becaue 
we emulate iocsr[0x420] as a default value, and it does not support to 
write. We will add 'TOOD' logs and continue to modify them when using 
other routing methods later.
What do you think of this idea？

Thanks.
Xiaojuan

--------------4252A252A364258375DBCB30
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
      cite="mid:e514e333-b458-517f-66f7-f3fd0a0c5bad@linaro.org">On
      5/9/22 04:38, yangxiaojuan wrote:
      <br>
      <blockquote type="cite" style="color: #000000;">
        <blockquote type="cite" style="color: #000000;">You are not
          considering CSR[0x420][49], which changes the format of this
          mapping.
          <br>
          <br>
        </blockquote>
        Thanks very much, I will consider the mapping format by read
        iocsr[0x420][49] like this:
        <br>
        static uint64_t map_format(void)
        <br>
        {
        <br>
             LoongArchCPU *cpu;
        <br>
             CPULoongArchState *env;
        <br>
             uint64_t val;
        <br>
        <br>
             cpu = LOONGARCH_CPU(current_cpu);
        <br>
             env = &amp;(cpu-&gt;env);
        <br>
        <br>
             val = address_space_ldq(&amp;env-&gt;address_space_iocsr,
        0x420,
        <br>
                                      MEMTXATTRS_UNSPECIFIED, NULL);
        <br>
             val &amp;= 1 &lt;&lt; 49;
        <br>
             return val;
        <br>
        }
        <br>
      </blockquote>
      <br>
      I'm not 100% sure how this "Other configuration control register"
      should be handled, but definitely not like this.
    </blockquote>
    Could we use the bitmapping as the default cpu or ip map format?
    Becaue we emulate iocsr[0x420] as a default value, and it does not
    support to write. We will add 'TOOD' logs and continue to modify
    them when using other routing methods later.<br>
    What do you think of this idea？<br>
    <br>
    Thanks.<br>
    Xiaojuan<br>
  </body>
</html>

--------------4252A252A364258375DBCB30--


