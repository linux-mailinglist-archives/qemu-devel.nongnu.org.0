Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F734481918
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 04:51:47 +0100 (CET)
Received: from localhost ([::1]:44844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2mTh-0002eb-Mo
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 22:51:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n2mSW-0001z9-Hr
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 22:50:32 -0500
Received: from mail.xen0n.name ([115.28.160.31]:33456
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n2mSS-0000Fs-EP
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 22:50:32 -0500
Received: from [192.168.9.172] (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id A194C60091;
 Thu, 30 Dec 2021 11:50:22 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1640836222; bh=7Lsd8w+hc7Q2htIc/m7buHLf+VsbHRlUQ1p7wZiZ50M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rzq0smKBGyk0VsVSGpTxfAAvY6TeFu6ePUP4WvWODeNCd5O4SLrvDy1cPgiv4AwAa
 +r+RgbVngNHeTBn+4IQXGEhfkmm1s0MUoZJjU7y4MJoJtgsRAA8u7cjUVRvIoRpjFK
 d3NV0vW6zmoc9XdDbOVdIoSRX1aUVgQtRHIokm1M=
Content-Type: multipart/alternative;
 boundary="------------Ytjcw2NfF6YATxDEe2y6GMGQ"
Message-ID: <67ac3255-30d3-783e-cf9b-db2e8e84b162@xen0n.name>
Date: Thu, 30 Dec 2021 11:50:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0a1
Subject: Re: [PATCH v11 29/31] linux-user: Implement CPU-specific signal
 handler for loongarch64 hosts
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>
References: <20211221054105.178795-1-git@xen0n.name>
 <20211221054105.178795-30-git@xen0n.name>
 <1d837c79-e939-f540-0a31-759975b43560@loongson.cn>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <1d837c79-e939-f540-0a31-759975b43560@loongson.cn>
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-3.024, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
--------------Ytjcw2NfF6YATxDEe2y6GMGQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 12/30/21 11:11, gaosong wrote:
>
> HI,
>
> On 2021/12/21 下午1:41, WANG Xuerui wrote:
>> +    case 0b001110: /* indexed, atomic, bounds-checking memory operations */
>> +        uint32_t sel = (insn >> 15) & 0b11111111111;
>> +
>> +        switch (sel) {
>> +        case 0b00000100000: /* stx.b */
>> +        case 0b00000101000: /* stx.h */
>> +        case 0b00000110000: /* stx.w */
>> +        case 0b00000111000: /* stx.d */
>> +        case 0b00001110000: /* fstx.s */
>> +        case 0b00001111000: /* fstx.d */
>> +        case 0b00011101100: /* fstgt.s */
>> +        case 0b00011101101: /* fstgt.d */
>> +        case 0b00011101110: /* fstle.s */
>> +        case 0b00011101111: /* fstle.d */
>> +        case 0b00011111000: /* stgt.b */
>> +        case 0b00011111001: /* stgt.h */
>> +        case 0b00011111010: /* stgt.w */
>> +        case 0b00011111011: /* stgt.d */
>> +        case 0b00011111100: /* stle.b */
>> +        case 0b00011111101: /* stle.h */
>> +        case 0b00011111110: /* stle.w */
>> +        case 0b00011111111: /* stle.d */
>> +        case 0b00011000000 ... 0b00011100011: /* am* insns */
>> +            return true;
>> +        }
>> +        break;
>> +    }
> We build qemu-x86_64 on LoongArch machine, but got an error,
> ../linux-user/host/loongarch64/host-signal.h:57:9: error: a label can only be part of a statement and a declaration is not a statement
>           uint32_t sel = (insn >> 15) & 0b11111111111;
>           ^~~~~~~~
> I think  we should define  'sel'  before:
>      /* Detect store by reading the instruction at the program counter.  */
>      switch ((insn >> 26) & 0b111111) {
> or
> case 0b001110:
>       {
>            uint32_t set = ...;
>            ...
>       }
I can't reproduce the error on both my development machines (amd64 and 
loongarch64), so I wonder if the issue is related to your particular 
setup (i.e. compiler versions and such)?
--------------Ytjcw2NfF6YATxDEe2y6GMGQ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <div class="moz-cite-prefix">On 12/30/21 11:11, gaosong wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1d837c79-e939-f540-0a31-759975b43560@loongson.cn">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    </blockquote>
    I can't reproduce the error on both my development machines (amd64
    and loongarch64), so I wonder if the issue is related to your
    particular setup (i.e. compiler versions and such)?<br>
  </body>
</html>

--------------Ytjcw2NfF6YATxDEe2y6GMGQ--

