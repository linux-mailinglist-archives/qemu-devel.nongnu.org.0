Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A58C45316D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 12:52:01 +0100 (CET)
Received: from localhost ([::1]:47822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmx0K-0002iv-GP
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 06:52:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mmwyd-0001Bn-SY
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:50:16 -0500
Received: from mail.loongson.cn ([114.242.206.163]:47104 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mmwya-0002mm-To
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:50:15 -0500
Received: from [10.20.42.193] (unknown [10.20.42.193])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxv7PsmpNh64MAAA--.3196S3;
 Tue, 16 Nov 2021 19:50:04 +0800 (CST)
Subject: Re: [PATCH v10 17/26] linux-user: Add LoongArch generic header files
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <1636700049-24381-1-git-send-email-gaosong@loongson.cn>
 <1636700049-24381-18-git-send-email-gaosong@loongson.cn>
 <a9eaf4a6-4b2e-51c5-67d6-46210fef03c3@amsat.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <0f1b0a56-f1f7-81ac-8dee-755c894b0910@loongson.cn>
Date: Tue, 16 Nov 2021 19:50:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a9eaf4a6-4b2e-51c5-67d6-46210fef03c3@amsat.org>
Content-Type: multipart/alternative;
 boundary="------------75C978D262CB88FC084B45E1"
Content-Language: en-US
X-CM-TRANSID: AQAAf9Dxv7PsmpNh64MAAA--.3196S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw4xCw4DXF1rWrykJF45GFg_yoW8Zr47pF
 Wrur1xGr48GrZrJ34qq343XF1fZw4j9F47ua4fWryUArWrC348Zwn3Kry5Wa43Z3WYkFW0
 qFyDWa1UKF4DXFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvC1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2
 jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
 8Ij28IcVAaY2xG8wAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1l
 Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxw
 Cjr7xvwVCIw2I0I7xG6c02F41lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE-syl42xK
 82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW5Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr
 0_Gr1lx2IqxVAqx4xG67AKxVWUGVWUWwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
 17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
 C0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF
 0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2Kf
 nxnUUI43ZEXa7VU1g4S7UUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-1.446, SPF_HELO_PASS=-0.001,
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
--------------75C978D262CB88FC084B45E1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Philippe,

On 2021/11/16 下午4:33, Philippe Mathieu-Daudé wrote:
> Hi,
>
> On 11/12/21 07:54, Song Gao wrote:
>> This includes:
>> - sockbits.h
>> - target_errno_defs.h
>> - target_fcntl.h
>> - termbits.h
>>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>> ---
>>   linux-user/loongarch64/sockbits.h          | 1 +
>>   linux-user/loongarch64/target_errno_defs.h | 7 +++++++
>>   linux-user/loongarch64/target_fcntl.h      | 6 ++++++
>>   linux-user/loongarch64/termbits.h          | 1 +
>>   4 files changed, 15 insertions(+)
>>   create mode 100644 linux-user/loongarch64/sockbits.h
>>   create mode 100644 linux-user/loongarch64/target_errno_defs.h
>>   create mode 100644 linux-user/loongarch64/target_fcntl.h
>>   create mode 100644 linux-user/loongarch64/termbits.h
>>
>> diff --git a/linux-user/loongarch64/sockbits.h b/linux-user/loongarch64/sockbits.h
>> new file mode 100644
>> index 0000000..0e4c8f0
>> --- /dev/null
>> +++ b/linux-user/loongarch64/sockbits.h
>> @@ -0,0 +1 @@
> Why not guarding the header here, ...
>
>> +#include "../generic/sockbits.h"
>> diff --git a/linux-user/loongarch64/target_errno_defs.h b/linux-user/loongarch64/target_errno_defs.h
>> new file mode 100644
>> index 0000000..17165c1
>> --- /dev/null
>> +++ b/linux-user/loongarch64/target_errno_defs.h
>> @@ -0,0 +1,7 @@
>> +#ifndef LOONGARCH_TARGET_ERRNO_DEFS_H
>> +#define LOONGARCH_TARGET_ERRNO_DEFS_H
> ... but guard this one?
>> +
>> +/* Target uses generic errno */
>> +#include "../generic/target_errno_defs.h"
>> +
>> +#endif
> New files require a license. I'd recommend adding a SPDX
> tag in the first line. For example with GPLv2+:
>
> /* SPDX-License-Identifier: GPL-2.0-or-later */

Yes, except for sockbits.h and target_errno_defs.h, other files are in this format.
Sould we need to unify al files formats like this?  I see that the most of linux-user/ARCH/ sockets.h and target_errno_defs,h are the same.

Thanks
Song Gao



--------------75C978D262CB88FC084B45E1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi Philippe,
</pre>
    <div class="moz-cite-prefix">On 2021/11/16 下午4:33, Philippe
      Mathieu-Daudé wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a9eaf4a6-4b2e-51c5-67d6-46210fef03c3@amsat.org">
      <pre class="moz-quote-pre" wrap="">Hi,

On 11/12/21 07:54, Song Gao wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This includes:
- sockbits.h
- target_errno_defs.h
- target_fcntl.h
- termbits.h

Signed-off-by: Song Gao <a class="moz-txt-link-rfc2396E" href="mailto:gaosong@loongson.cn">&lt;gaosong@loongson.cn&gt;</a>
Signed-off-by: Xiaojuan Yang <a class="moz-txt-link-rfc2396E" href="mailto:yangxiaojuan@loongson.cn">&lt;yangxiaojuan@loongson.cn&gt;</a>
---
 linux-user/loongarch64/sockbits.h          | 1 +
 linux-user/loongarch64/target_errno_defs.h | 7 +++++++
 linux-user/loongarch64/target_fcntl.h      | 6 ++++++
 linux-user/loongarch64/termbits.h          | 1 +
 4 files changed, 15 insertions(+)
 create mode 100644 linux-user/loongarch64/sockbits.h
 create mode 100644 linux-user/loongarch64/target_errno_defs.h
 create mode 100644 linux-user/loongarch64/target_fcntl.h
 create mode 100644 linux-user/loongarch64/termbits.h

diff --git a/linux-user/loongarch64/sockbits.h b/linux-user/loongarch64/sockbits.h
new file mode 100644
index 0000000..0e4c8f0
--- /dev/null
+++ b/linux-user/loongarch64/sockbits.h
@@ -0,0 +1 @@
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Why not guarding the header here, ...

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+#include "../generic/sockbits.h"
diff --git a/linux-user/loongarch64/target_errno_defs.h b/linux-user/loongarch64/target_errno_defs.h
new file mode 100644
index 0000000..17165c1
--- /dev/null
+++ b/linux-user/loongarch64/target_errno_defs.h
@@ -0,0 +1,7 @@
+#ifndef LOONGARCH_TARGET_ERRNO_DEFS_H
+#define LOONGARCH_TARGET_ERRNO_DEFS_H
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
... but guard this one?
</pre>
    </blockquote>
    <blockquote type="cite"
      cite="mid:a9eaf4a6-4b2e-51c5-67d6-46210fef03c3@amsat.org">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+/* Target uses generic errno */
+#include "../generic/target_errno_defs.h"
+
+#endif
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
New files require a license. I'd recommend adding a SPDX
tag in the first line. For example with GPLv2+:

/* SPDX-License-Identifier: GPL-2.0-or-later */</pre>
    </blockquote>
    <pre>Yes, except for sockbits.h and target_errno_defs.h, other files are in this format.
Sould we need to unify al files formats like this?  I see that the most of linux-user/ARCH/ sockets.h and target_errno_defs,h are the same.

Thanks
Song Gao
</pre>
    <p><br>
    </p>
  </body>
</html>

--------------75C978D262CB88FC084B45E1--


