Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0168F4818DC
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 04:13:33 +0100 (CET)
Received: from localhost ([::1]:35360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2lsh-0002rA-IT
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 22:13:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1n2lqU-0000qb-7Y
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 22:11:14 -0500
Received: from mail.loongson.cn ([114.242.206.163]:59806 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1n2lqR-0003Nk-U7
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 22:11:13 -0500
Received: from [10.20.42.193] (unknown [10.20.42.193])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxeZVEI81hpkgFAA--.3341S3;
 Thu, 30 Dec 2021 11:11:03 +0800 (CST)
Subject: Re: [PATCH v11 29/31] linux-user: Implement CPU-specific signal
 handler for loongarch64 hosts
To: WANG Xuerui <git@xen0n.name>
References: <20211221054105.178795-1-git@xen0n.name>
 <20211221054105.178795-30-git@xen0n.name>
From: gaosong <gaosong@loongson.cn>
Message-ID: <1d837c79-e939-f540-0a31-759975b43560@loongson.cn>
Date: Thu, 30 Dec 2021 11:11:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20211221054105.178795-30-git@xen0n.name>
Content-Type: multipart/alternative;
 boundary="------------00673D38E398DD4992241BB1"
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxeZVEI81hpkgFAA--.3341S3
X-Coremail-Antispam: 1UD129KBjvJXoW7AF47ury5tw4Uur4kWr1rZwb_yoW8XF17pr
 18trW8GrZ7Jr97Jrn7JrWkJ34DGFnrAw4kJFy8KF4q9F1UKw1YqrZ5WrWjgrZ8WrWrZFyS
 g3W7Xr109r1jyaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9Y1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
 87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4
 CY6c8Ij28IcVAaY2xG8wAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_
 Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErc
 IFxwCjr7xvwVCIw2I0I7xG6c02F41lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE-syl
 42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW5Wr1UJr1l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUGVWUWwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyU
 JwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
 nIWIevJa73UjIFyTuYvjfUwYFCUUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) HTML_MESSAGE=0.001, NICE_REPLY_A=-3.024,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------00673D38E398DD4992241BB1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

HI,

On 2021/12/21 下午1:41, WANG Xuerui wrote:
> +    case 0b001110: /* indexed, atomic, bounds-checking memory operations */
> +        uint32_t sel = (insn >> 15) & 0b11111111111;
> +
> +        switch (sel) {
> +        case 0b00000100000: /* stx.b */
> +        case 0b00000101000: /* stx.h */
> +        case 0b00000110000: /* stx.w */
> +        case 0b00000111000: /* stx.d */
> +        case 0b00001110000: /* fstx.s */
> +        case 0b00001111000: /* fstx.d */
> +        case 0b00011101100: /* fstgt.s */
> +        case 0b00011101101: /* fstgt.d */
> +        case 0b00011101110: /* fstle.s */
> +        case 0b00011101111: /* fstle.d */
> +        case 0b00011111000: /* stgt.b */
> +        case 0b00011111001: /* stgt.h */
> +        case 0b00011111010: /* stgt.w */
> +        case 0b00011111011: /* stgt.d */
> +        case 0b00011111100: /* stle.b */
> +        case 0b00011111101: /* stle.h */
> +        case 0b00011111110: /* stle.w */
> +        case 0b00011111111: /* stle.d */
> +        case 0b00011000000 ... 0b00011100011: /* am* insns */
> +            return true;
> +        }
> +        break;
> +    }

We build qemu-x86_64 on LoongArch machine, but got an error,

../linux-user/host/loongarch64/host-signal.h:57:9: error: a label can only be part of a statement and a declaration is not a statement
          uint32_t sel = (insn >> 15) & 0b11111111111;
          ^~~~~~~~

I think  we should define  'sel'  before:

     /* Detect store by reading the instruction at the program counter.  */
     switch ((insn >> 26) & 0b111111) {

or
case 0b001110:

      {

           uint32_t set = ...;

           ...

      }

Thanks
Song Gao


--------------00673D38E398DD4992241BB1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>HI, <br>
    </p>
    <div class="moz-cite-prefix">On 2021/12/21 下午1:41, WANG Xuerui
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20211221054105.178795-30-git@xen0n.name">
      <pre class="moz-quote-pre" wrap="">+    case 0b001110: /* indexed, atomic, bounds-checking memory operations */
+        uint32_t sel = (insn &gt;&gt; 15) &amp; 0b11111111111;
+
+        switch (sel) {
+        case 0b00000100000: /* stx.b */
+        case 0b00000101000: /* stx.h */
+        case 0b00000110000: /* stx.w */
+        case 0b00000111000: /* stx.d */
+        case 0b00001110000: /* fstx.s */
+        case 0b00001111000: /* fstx.d */
+        case 0b00011101100: /* fstgt.s */
+        case 0b00011101101: /* fstgt.d */
+        case 0b00011101110: /* fstle.s */
+        case 0b00011101111: /* fstle.d */
+        case 0b00011111000: /* stgt.b */
+        case 0b00011111001: /* stgt.h */
+        case 0b00011111010: /* stgt.w */
+        case 0b00011111011: /* stgt.d */
+        case 0b00011111100: /* stle.b */
+        case 0b00011111101: /* stle.h */
+        case 0b00011111110: /* stle.w */
+        case 0b00011111111: /* stle.d */
+        case 0b00011000000 ... 0b00011100011: /* am* insns */
+            return true;
+        }
+        break;
+    } 
</pre>
    </blockquote>
    <pre>We build qemu-x86_64 on LoongArch machine, but got an error,</pre>
    <pre>../linux-user/host/loongarch64/host-signal.h:57:9: error: a label can only be part of a statement and a declaration is not a statement
         uint32_t sel = (insn &gt;&gt; 15) &amp; 0b11111111111;
         ^~~~~~~~</pre>
    <pre>I think  we should define  'sel'  before: 
</pre>
    <pre>    /* Detect store by reading the instruction at the program counter.  */
    switch ((insn &gt;&gt; 26) &amp; 0b111111) {  
</pre>
    <pre>or 
case 0b001110:</pre>
    <pre>     {
</pre>
    <pre>          uint32_t set = ...;            
</pre>
    <pre>          ...
</pre>
    <pre>     }</pre>
    <pre>
Thanks
Song Gao
</pre>
  </body>
</html>

--------------00673D38E398DD4992241BB1--


