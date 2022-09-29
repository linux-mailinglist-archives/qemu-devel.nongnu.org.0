Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DA65EEC66
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 05:24:43 +0200 (CEST)
Received: from localhost ([::1]:47932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odkAE-0001tR-4p
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 23:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1odk8y-0000YO-OV
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 23:23:24 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46730 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1odk8v-0002K7-Ss
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 23:23:24 -0400
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dx_2uZDzVjk5wjAA--.65406S3; 
 Thu, 29 Sep 2022 11:23:05 +0800 (CST)
Subject: Re: [PATCH v2 3/3] hw/intc: Fix LoongArch ipi device emulation
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 f4bug@amsat.org, peter.maydell@linaro.org
References: <20220927061225.3566554-1-yangxiaojuan@loongson.cn>
 <20220927061225.3566554-4-yangxiaojuan@loongson.cn>
 <aa5e61d8-0074-9c56-1da3-da120d5ee185@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <d792e3f7-ea97-47b7-e556-8ebf1576d501@loongson.cn>
Date: Thu, 29 Sep 2022 11:23:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <aa5e61d8-0074-9c56-1da3-da120d5ee185@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------3EB2FE36589169222A1BB3E6"
Content-Language: en-US
X-CM-TRANSID: AQAAf8Dx_2uZDzVjk5wjAA--.65406S3
X-Coremail-Antispam: 1UD129KBjvJXoW7WFWfur4kGw1DAFWxWF48JFb_yoW8JF4Dpr
 97AF4ak3ykAa97ta1DX348XF98GF1kXa47CF4ayFyrZw45Xr9Yqr18ur1vgFyqvw4rXryj
 qr1kA3y8ZF1UJw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvF14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21lYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0E
 x4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5V
 A0II8E6IAqYI8I648v4I1l7480Y4vEI4kI2Ix0rVAqx4xJMxk0xIA0c2IEe2xFo4CEbIxv
 r21lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
 0E5I8CrVAFwI0_JrI_JrWlx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
 AVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
 CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
 wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj
 fUwYFCUUUUU
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-2.319, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------3EB2FE36589169222A1BB3E6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/9/29 上午10:42, Richard Henderson 写道:
> On 9/26/22 23:12, Xiaojuan Yang wrote:
>> In ipi_send function, it should not to set irq before
>> writing data to dest cpu iocsr space, as the irq will
>> trigger after data writing.
>>
>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>> ---
>>   hw/intc/loongarch_ipi.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/hw/intc/loongarch_ipi.c b/hw/intc/loongarch_ipi.c
>> index 4f3c58f872..aa4bf9eb74 100644
>> --- a/hw/intc/loongarch_ipi.c
>> +++ b/hw/intc/loongarch_ipi.c
>> @@ -88,7 +88,6 @@ static void ipi_send(uint64_t val)
>>       cs = qemu_get_cpu(cpuid);
>>       cpu = LOONGARCH_CPU(cs);
>>       env = &cpu->env;
>> -    loongarch_cpu_set_irq(cpu, IRQ_IPI, 1);
>>       address_space_stl(&env->address_space_iocsr, 0x1008,
>>                         data, MEMTXATTRS_UNSPECIFIED, NULL);
>
> Did you mean to move the call below the set?
> Otherwise, where does the irq get raised?
>
When call this function 'address_space_stl(&env->address_space_iocsr, 
0x1008, ... ...)',  it will trigger  loongarch_ipi_writel(), the addr 
arg is 0x1008 ('CORE_SET_OFFSET'), and qemu_irq_raise will be called in 
this case.

Thanks.
Xiaojuan Yang


--------------3EB2FE36589169222A1BB3E6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2022/9/29 上午10:42, Richard Henderson
      写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:aa5e61d8-0074-9c56-1da3-da120d5ee185@linaro.org">On
      9/26/22 23:12, Xiaojuan Yang wrote:
      <br>
      <blockquote type="cite">In ipi_send function, it should not to set
        irq before
        <br>
        writing data to dest cpu iocsr space, as the irq will
        <br>
        trigger after data writing.
        <br>
        <br>
        Signed-off-by: Xiaojuan Yang <a class="moz-txt-link-rfc2396E" href="mailto:yangxiaojuan@loongson.cn">&lt;yangxiaojuan@loongson.cn&gt;</a>
        <br>
        ---
        <br>
          hw/intc/loongarch_ipi.c | 1 -
        <br>
          1 file changed, 1 deletion(-)
        <br>
        <br>
        diff --git a/hw/intc/loongarch_ipi.c b/hw/intc/loongarch_ipi.c
        <br>
        index 4f3c58f872..aa4bf9eb74 100644
        <br>
        --- a/hw/intc/loongarch_ipi.c
        <br>
        +++ b/hw/intc/loongarch_ipi.c
        <br>
        @@ -88,7 +88,6 @@ static void ipi_send(uint64_t val)
        <br>
              cs = qemu_get_cpu(cpuid);
        <br>
              cpu = LOONGARCH_CPU(cs);
        <br>
              env = &amp;cpu-&gt;env;
        <br>
        -    loongarch_cpu_set_irq(cpu, IRQ_IPI, 1);
        <br>
              address_space_stl(&amp;env-&gt;address_space_iocsr,
        0x1008,
        <br>
                                data, MEMTXATTRS_UNSPECIFIED, NULL);
        <br>
          </blockquote>
      <br>
      Did you mean to move the call below the set?
      <br>
      Otherwise, where does the irq get raised?
      <br>
      <br>
    </blockquote>
    <span style="font-family:SimSun;">When call this function
      'address_space_stl(&amp;env-&gt;address_space_iocsr, 0x1008, ...
      ...)',  it will trigger  loongarch_ipi_writel(), the addr arg is
      0x1008 ('CORE_SET_OFFSET'), and qemu_irq_raise will be called in
      this case.</span><br>
    <span style="font-family:SimSun;"></span><br>
    <span style="font-family:SimSun;">Thanks.</span><br>
    <span style="font-family:SimSun;">Xiaojuan Yang</span><br>
    <span style="font-family:SimSun;"></span><br>
  </body>
</html>

--------------3EB2FE36589169222A1BB3E6--


