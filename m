Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA3E468E8F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 02:23:49 +0100 (CET)
Received: from localhost ([::1]:35674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mu2jM-0002Ji-38
	for lists+qemu-devel@lfdr.de; Sun, 05 Dec 2021 20:23:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mu2hv-0001dJ-HR
 for qemu-devel@nongnu.org; Sun, 05 Dec 2021 20:22:19 -0500
Received: from mail.loongson.cn ([114.242.206.163]:46412 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mu2ht-0001yZ-59
 for qemu-devel@nongnu.org; Sun, 05 Dec 2021 20:22:19 -0500
Received: from [10.20.42.193] (unknown [10.20.42.193])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axasi+Za1huF0DAA--.6942S3;
 Mon, 06 Dec 2021 09:22:06 +0800 (CST)
Subject: Re: [PATCH v13 02/26] target/loongarch: Add core definition
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <1638610165-15036-1-git-send-email-gaosong@loongson.cn>
 <1638610165-15036-3-git-send-email-gaosong@loongson.cn>
 <9700d154-7185-b71f-4ab3-9c89f3021f7c@amsat.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <1bf1604e-2e65-b302-068b-3ca59a510f0b@loongson.cn>
Date: Mon, 6 Dec 2021 09:22:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9700d154-7185-b71f-4ab3-9c89f3021f7c@amsat.org>
Content-Type: multipart/alternative;
 boundary="------------77BE89E24A5ACEEA09FCC8B6"
Content-Language: en-US
X-CM-TRANSID: AQAAf9Axasi+Za1huF0DAA--.6942S3
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYq7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
 Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj
 6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c
 0EjII2zVCS5cI20VAGYxC7Mx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vI
 Y487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26ryrJr1UJw
 CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r106r1rMI8I3I0E7480Y4vE
 14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
 IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxK
 x2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
 AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUwYFCUUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-1.365, SPF_HELO_PASS=-0.001,
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------77BE89E24A5ACEEA09FCC8B6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

HI,
On 2021/12/5 上午1:26, Philippe Mathieu-Daudé wrote:
>> +
>> +    env->fcsr0_mask = 0x1f1f031f;
> Is this for all CPUs or only the 3A5000?
>
Yes,     env->fcsr0_mask = FCSR0_M1 | FCSR0_M2 | FCSR0_M3 = 0x1f1f031f;

Thanks
Song Gao

--------------77BE89E24A5ACEEA09FCC8B6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    HI,<br>
    <div class="moz-cite-prefix">On 2021/12/5 上午1:26, Philippe
      Mathieu-Daudé wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:9700d154-7185-b71f-4ab3-9c89f3021f7c@amsat.org">
      <blockquote type="cite" style="color: #000000;">
        <pre class="moz-quote-pre" wrap="">+
+    env-&gt;fcsr0_mask = 0x1f1f031f;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Is this for all CPUs or only the 3A5000?

</pre>
    </blockquote>
    Yes,     env-&gt;fcsr0_mask = FCSR0_M1 | FCSR0_M2 | FCSR0_M3 =
    0x1f1f031f; <br>
    <br>
    Thanks<br>
    Song Gao<br>
  </body>
</html>

--------------77BE89E24A5ACEEA09FCC8B6--


