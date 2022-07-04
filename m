Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA5656507C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:12:23 +0200 (CEST)
Received: from localhost ([::1]:35606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8I7y-0002NJ-BB
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1o8I5u-0000Dd-7q
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:10:14 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35902 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1o8I5r-0001Pm-V5
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:10:14 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axr+JrrsJi60YIAA--.25428S3; 
 Mon, 04 Jul 2022 17:10:03 +0800 (CST)
Subject: Re: [PATCH 11/11] hw/intc/loongarch_ipi: Fix mail send and any send
 function
To: Richard Henderson <richard.henderson@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk, mst@redhat.com,
 imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
 <20220701093407.2150607-12-yangxiaojuan@loongson.cn>
 <b73e54dc-a224-8413-f4cf-91da6bd346a0@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <ba0bcdad-4e03-9544-6e76-b3efaa05c747@loongson.cn>
Date: Mon, 4 Jul 2022 17:10:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b73e54dc-a224-8413-f4cf-91da6bd346a0@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------9B540A54756CD562F94B257D"
Content-Language: en-US
X-CM-TRANSID: AQAAf9Axr+JrrsJi60YIAA--.25428S3
X-Coremail-Antispam: 1UD129KBjvJXoW7AFWkZw4DCFWkZF17uF48WFg_yoW8tr1kpr
 yfAr43GrWDAF93trnrJr1UJFy5JFykJa4UJF4IqFy8uw1UZr1Ygr1UWryvgFyUJ395WF1j
 qr4UZry5uF1UJw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBF1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2
 z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzx
 vE52x082IY62kv0487McIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8
 JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYx
 C7M4IIrI8v6xkF7I0E8cxan2IY04v7Mx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI
 1cAE67vIY487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r
 yrJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r106r1rMI8I3I0E
 7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
 C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
 04k26cxKx2IYs7xG6r1I6r4UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
 CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JjjYL9UUUUU=
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
--------------9B540A54756CD562F94B257D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022/7/4 下午1:37, Richard Henderson wrote:
> On 7/1/22 15:04, Xiaojuan Yang wrote:
>> By the document of ipi mailsend device, byte is written only when the 
>> mask bit
>> is 0. The original code discards mask bit and overwrite the data 
>> always, this
>> patch fixes the issue.
>>
>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>> ---
>>   hw/intc/loongarch_ipi.c | 45 ++++++++++++++++++++++-------------------
>>   1 file changed, 24 insertions(+), 21 deletions(-)
>>
>> diff --git a/hw/intc/loongarch_ipi.c b/hw/intc/loongarch_ipi.c
>> index 553e88703d..e4b1fb5366 100644
>> --- a/hw/intc/loongarch_ipi.c
>> +++ b/hw/intc/loongarch_ipi.c
>> @@ -50,35 +50,40 @@ static uint64_t loongarch_ipi_readl(void *opaque, 
>> hwaddr addr, unsigned size)
>>       return ret;
>>   }
>>   -static int get_ipi_data(target_ulong val)
>> +static void send_ipi_data(CPULoongArchState *env, target_ulong val, 
>> target_ulong addr)
>>   {
>>       int i, mask, data;
>>   -    data = val >> 32;
>> -    mask = (val >> 27) & 0xf;
>> -
>> +    data = address_space_ldl(&env->address_space_iocsr, addr,
>> +                             MEMTXATTRS_UNSPECIFIED, NULL);
>> +    mask  = 0;
>>       for (i = 0; i < 4; i++) {
>> -        if ((mask >> i) & 1) {
>> -            data &= ~(0xff << (i * 8));
>> +        /* bit 27 - 30 is mask for byte write */
>> +        if (val & (0x1UL << (27 + i))) {
>
> UL suffix is never correct, since it means different things on 
> different hosts.
> Anyway, you don't any suffix here.
>
OK, we will remove the suffix there.

> How often does mask == 0, so that all of val is written?  In which 
> case you could skip the load.
>
At most time the mask is always 0, so  we add a condition to skip the load.
like this:
+    int i, mask = 0, data = 0;
...

+   /*
+    * bit 27-30 is mask for byte writing,
+    * if the mask is 0, we should do nothing.
+    */
+   if ((val >> 27) & 0xf) {
+       data = address_space_ldl(&env->address_space_iocsr, addr,
+                                MEMTXATTRS_UNSPECIFIED, NULL);
...
}

After fix these problem, should we only send these two patches?

Thanks.
Song Gao
> r~

--------------9B540A54756CD562F94B257D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022/7/4 下午1:37, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b73e54dc-a224-8413-f4cf-91da6bd346a0@linaro.org">On
      7/1/22 15:04, Xiaojuan Yang wrote:
      <br>
      <blockquote type="cite">By the document of ipi mailsend device,
        byte is written only when the mask bit
        <br>
        is 0. The original code discards mask bit and overwrite the data
        always, this
        <br>
        patch fixes the issue.
        <br>
        <br>
        Signed-off-by: Xiaojuan Yang <a class="moz-txt-link-rfc2396E" href="mailto:yangxiaojuan@loongson.cn">&lt;yangxiaojuan@loongson.cn&gt;</a>
        <br>
        ---
        <br>
          hw/intc/loongarch_ipi.c | 45
        ++++++++++++++++++++++-------------------
        <br>
          1 file changed, 24 insertions(+), 21 deletions(-)
        <br>
        <br>
        diff --git a/hw/intc/loongarch_ipi.c b/hw/intc/loongarch_ipi.c
        <br>
        index 553e88703d..e4b1fb5366 100644
        <br>
        --- a/hw/intc/loongarch_ipi.c
        <br>
        +++ b/hw/intc/loongarch_ipi.c
        <br>
        @@ -50,35 +50,40 @@ static uint64_t loongarch_ipi_readl(void
        *opaque, hwaddr addr, unsigned size)
        <br>
              return ret;
        <br>
          }
        <br>
          -static int get_ipi_data(target_ulong val)
        <br>
        +static void send_ipi_data(CPULoongArchState *env, target_ulong
        val, target_ulong addr)
        <br>
          {
        <br>
              int i, mask, data;
        <br>
          -    data = val &gt;&gt; 32;
        <br>
        -    mask = (val &gt;&gt; 27) &amp; 0xf;
        <br>
        -
        <br>
        +    data = address_space_ldl(&amp;env-&gt;address_space_iocsr,
        addr,
        <br>
        +                             MEMTXATTRS_UNSPECIFIED, NULL);
        <br>
        +    mask  = 0;
        <br>
              for (i = 0; i &lt; 4; i++) {
        <br>
        -        if ((mask &gt;&gt; i) &amp; 1) {
        <br>
        -            data &amp;= ~(0xff &lt;&lt; (i * 8));
        <br>
        +        /* bit 27 - 30 is mask for byte write */
        <br>
        +        if (val &amp; (0x1UL &lt;&lt; (27 + i))) {
        <br>
      </blockquote>
      <br>
      UL suffix is never correct, since it means different things on
      different hosts.
      <br>
      Anyway, you don't any suffix here.
      <br>
      <br>
    </blockquote>
    <p>OK, we will remove the suffix there.</p>
    <blockquote type="cite"
      cite="mid:b73e54dc-a224-8413-f4cf-91da6bd346a0@linaro.org">How
      often does mask == 0, so that all of val is written?  In which
      case you could skip the load.
      <br>
      <br>
    </blockquote>
    At most time the mask is always 0, so  we add a condition to skip
    the load.<br>
    like this:<br>
    <span style="color: rgb(0, 0, 0); font-family: SimSun; font-size:
      14px; font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; font-weight: 400; letter-spacing:
      normal; orphans: 2; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;">+    int i, mask = 0, data = 0;</span><br>
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">...<br>
    </span><br>
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">+ 
        /*</span><br>
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">+ 
         * bit 27-30 is mask for byte writing,</span><br style="color:
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
      initial; text-decoration-color: initial; font-family: SimSun;">+ 
         * if the mask is 0, we should do nothing.</span><br
      style="color: rgb(0, 0, 0); font-family: 宋体, arial, Verdana,
      sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">+ 
         */</span><br style="color: rgb(0, 0, 0); font-family: 宋体,
      arial, Verdana, sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">+ 
        if ((val &gt;&gt; 27) &amp; 0xf) {</span><br style="color:
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
      initial; text-decoration-color: initial; font-family: SimSun;">+ 
            data = address_space_ldl(&amp;env-&gt;address_space_iocsr,
      addr,</span><br style="color: rgb(0, 0, 0); font-family: 宋体,
      arial, Verdana, sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">
    <span style="color: rgb(0, 0, 0); font-size: 14px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; font-family: SimSun;">+ 
                                     MEMTXATTRS_UNSPECIFIED, NULL);</span><br>
    <span style="color: rgb(0, 0, 0); font-family: SimSun; font-size:
      14px; font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; font-weight: 400; letter-spacing:
      normal; orphans: 2; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;"></span> ...<br>
    }<br>
    <br>
    After fix these problem, should we only send these two patches? <br>
    <br>
    Thanks.<br>
    Song Gao<br>
    <blockquote type="cite"
      cite="mid:b73e54dc-a224-8413-f4cf-91da6bd346a0@linaro.org">r~
      <br>
    </blockquote>
  </body>
</html>

--------------9B540A54756CD562F94B257D--


