Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0391F48C0FD
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 10:30:17 +0100 (CET)
Received: from localhost ([::1]:46438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ZxP-0003JY-Tm
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 04:30:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1n7Zw3-0002bo-BR
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 04:28:51 -0500
Received: from mail.loongson.cn ([114.242.206.163]:57928 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1n7Zw0-0002gh-Mg
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 04:28:51 -0500
Received: from [10.20.42.193] (unknown [10.20.42.193])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxKMpGn95h09QBAA--.5877S3;
 Wed, 12 Jan 2022 17:28:38 +0800 (CST)
Subject: Re: [PATCH v14 02/26] target/loongarch: Add core definition
To: WANG Xuerui <i.qemu@xen0n.name>
References: <20220106094200.1801206-1-gaosong@loongson.cn>
 <20220106094200.1801206-3-gaosong@loongson.cn>
 <b8f31617-f217-778c-2a34-6d780de9b83a@xen0n.name>
From: gaosong <gaosong@loongson.cn>
Message-ID: <fbb7f1b4-aad9-9514-050d-78418c6401ea@loongson.cn>
Date: Wed, 12 Jan 2022 17:28:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b8f31617-f217-778c-2a34-6d780de9b83a@xen0n.name>
Content-Type: multipart/alternative;
 boundary="------------A594C52FEA985888AD65A9AB"
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxKMpGn95h09QBAA--.5877S3
X-Coremail-Antispam: 1UD129KBjvdXoWrKFWUXFy5Kw1rtFyDJFWUArb_yoWkKFbEga
 1UGwn3Ww1DAa17tF1UGw13Z3y5GayktrsFvw43Cry5t348Aws8uws8uF4fZF1DG3y7GrWD
 u3W3ZFWfW3srCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbVxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2
 jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52
 x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm
 72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mx
 8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVCm-wCF04k2
 0xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26ryrJr1UJwCFx2IqxVCFs4IE7xkEbVWUJV
 W8JwC20s026c02F40E14v26r106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
 1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
 IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAI
 cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa
 73UjIFyTuYvjfUwYFCUUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------A594C52FEA985888AD65A9AB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 2022/1/9 下午5:25, WANG Xuerui wrote:
>> +    data = FIELD_DP32(data, CPUCFG16, L1_DPRE, 1);
>> +    data = FIELD_DP32(data, CPUCFG16, L2_IUPRE, 1);
>> +    data = FIELD_DP32(data, CPUCFG16, L2_IUUNIFY, 1);
>> +    data = FIELD_DP32(data, CPUCFG16, L2_IUPRIV, 1);
>> +    data = FIELD_DP32(data, CPUCFG16, L3_IUPRE, 1);
>> +    data = FIELD_DP32(data, CPUCFG16, L3_IUUNIFY, 1);
>> +    data = FIELD_DP32(data, CPUCFG16, L3_IUINCL, 1);
>> +    env->cpucfg[16] = data;
>> +
>> +    data = 0;
>> +    data = FIELD_DP32(data, CPUCFG17, L1IU_WAYS, 0x8003);
>
> This seems out-of-place, according to the manual this field is Way-1 
> for the L1I cache, so you have 0x8004=32772 ways in this cache?
>
> Same for all similar constructions below.
>
I have time to reply to your comment now.

As in the previous comments, I don't remember which one,these values should be the same as the values of the physical environment. I dumped 'CPUCFG17' value again,
the value is no problem. Maybe you didn't think about dumping these values when you commented. The value of  'L11U_SIZE' is dumped to be 0. and cpucfg[i] has been
initialized to 0 before. There is no need to set it again.

Thanks
Song


--------------A594C52FEA985888AD65A9AB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi,
</pre>
    <div class="moz-cite-prefix">On 2022/1/9 下午5:25, WANG Xuerui wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b8f31617-f217-778c-2a34-6d780de9b83a@xen0n.name">
      <blockquote type="cite" style="color: #000000;">+    data =
        FIELD_DP32(data, CPUCFG16, L1_DPRE, 1);
        <br>
        +    data = FIELD_DP32(data, CPUCFG16, L2_IUPRE, 1);
        <br>
        +    data = FIELD_DP32(data, CPUCFG16, L2_IUUNIFY, 1);
        <br>
        +    data = FIELD_DP32(data, CPUCFG16, L2_IUPRIV, 1);
        <br>
        +    data = FIELD_DP32(data, CPUCFG16, L3_IUPRE, 1);
        <br>
        +    data = FIELD_DP32(data, CPUCFG16, L3_IUUNIFY, 1);
        <br>
        +    data = FIELD_DP32(data, CPUCFG16, L3_IUINCL, 1);
        <br>
        +    env-&gt;cpucfg[16] = data;
        <br>
        +
        <br>
        +    data = 0;
        <br>
        +    data = FIELD_DP32(data, CPUCFG17, L1IU_WAYS, 0x8003);
        <br>
      </blockquote>
      <br>
      This seems out-of-place, according to the manual this field is
      Way-1 for the L1I cache, so you have 0x8004=32772 ways in this
      cache?
      <br>
      <br>
      Same for all similar constructions below.
      <br>
      <br>
    </blockquote>
    <pre>I have time to reply to your comment now.</pre>
    <pre>As in the previous comments, I don't remember which one,these values should be the same as the values of the physical environment. I dumped 'CPUCFG17' value again,
the value is no problem. Maybe you didn't think about dumping these values when you commented. The value of  'L11U_SIZE' is dumped to be 0. and cpucfg[i] has been 
initialized to 0 before. There is no need to set it again.</pre>
    <pre>Thanks
Song
</pre>
  </body>
</html>

--------------A594C52FEA985888AD65A9AB--


