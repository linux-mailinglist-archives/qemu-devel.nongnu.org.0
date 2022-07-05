Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 469A756655E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:47:25 +0200 (CEST)
Received: from localhost ([::1]:40298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8eDM-0008ET-BF
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:47:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1o8eAC-0006vX-CH
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:44:10 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35520 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1o8eAA-0005sE-3M
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:44:08 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axj+LT+cNiOCIKAA--.31110S3; 
 Tue, 05 Jul 2022 16:44:03 +0800 (CST)
Subject: Re: [PATCH] tcg/tci: Remove CONFIG_DEBUG_TCG_INTERPRETER
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220705083623.1142250-1-richard.henderson@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <fbab34ac-9568-35bd-b91e-cf607f5f7636@loongson.cn>
Date: Tue, 5 Jul 2022 16:44:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20220705083623.1142250-1-richard.henderson@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------92ADAB78EBB612E32E3FD046"
Content-Language: en-US
X-CM-TRANSID: AQAAf9Axj+LT+cNiOCIKAA--.31110S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr4DGw43AFW7Kw1ftF1xGrg_yoW8XFyxp3
 93KF1vyr4rt3y8Cr15Aa48tr18JrnY9a4UCa97Gw4jvasIvay8Xw4rKw47JryxXayxGay0
 vF9avr4YvFWUJaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
 cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
 AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
 6F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI
 0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAv7VC0I7IYx2IY67AKxVWUGVWUXwAv
 7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx8Gjc
 xK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVCm-wCF04k20xvY
 0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26ryrJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
 C20s026c02F40E14v26r106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
 wI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
 v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E
 87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0x
 ZFpf9x07UAR6wUUUUU=
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
--------------92ADAB78EBB612E32E3FD046
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022/7/5 下午4:36, Richard Henderson wrote:
> There is nothing in this environment variable that cannot
> be done better with -d flags.  There is nothing special
> about TCI that warrants this hack.
>
> Moreover, it does not compile -- remove it.
>
> Reported-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Song Gao <gaosong@loongson.cn>

>   tcg/tci/tcg-target.h     | 5 -----
>   tcg/tci/tcg-target.c.inc | 7 -------
>   2 files changed, 12 deletions(-)
>
> diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
> index 033e613f24..ceb36c4f7a 100644
> --- a/tcg/tci/tcg-target.h
> +++ b/tcg/tci/tcg-target.h
> @@ -53,11 +53,6 @@
>   # error Unknown pointer size for tci target
>   #endif
>   
> -#ifdef CONFIG_DEBUG_TCG
> -/* Enable debug output. */
> -#define CONFIG_DEBUG_TCG_INTERPRETER
> -#endif
> -
>   /* Optional instructions. */
>   
>   #define TCG_TARGET_HAS_bswap16_i32      1
> diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
> index 98337c567a..f3d7441e06 100644
> --- a/tcg/tci/tcg-target.c.inc
> +++ b/tcg/tci/tcg-target.c.inc
> @@ -823,13 +823,6 @@ static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
>   
>   static void tcg_target_init(TCGContext *s)
>   {
> -#if defined(CONFIG_DEBUG_TCG_INTERPRETER)
> -    const char *envval = getenv("DEBUG_TCG");
> -    if (envval) {
> -        qemu_set_log(strtol(envval, NULL, 0));
> -    }
> -#endif
> -
>       /* The current code uses uint8_t for tcg operations. */
>       tcg_debug_assert(tcg_op_defs_max <= UINT8_MAX);
>   

--------------92ADAB78EBB612E32E3FD046
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022/7/5 下午4:36, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20220705083623.1142250-1-richard.henderson@linaro.org">
      <pre class="moz-quote-pre" wrap="">There is nothing in this environment variable that cannot
be done better with -d flags.  There is nothing special
about TCI that warrants this hack.

Moreover, it does not compile -- remove it.

Reported-by: Song Gao <a class="moz-txt-link-rfc2396E" href="mailto:gaosong@loongson.cn">&lt;gaosong@loongson.cn&gt;</a>
Signed-off-by: Richard Henderson <a class="moz-txt-link-rfc2396E" href="mailto:richard.henderson@linaro.org">&lt;richard.henderson@linaro.org&gt;</a>
---</pre>
    </blockquote>
    <pre style="color: rgb(0, 0, 0); font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; overflow-wrap: break-word;" wrap="soft">Reviewed-by: Song Gao <a class="moz-txt-link-rfc2396E" href="mailto:gaosong@loongson.cn">&lt;gaosong@loongson.cn&gt;</a></pre>
    <blockquote type="cite"
      cite="mid:20220705083623.1142250-1-richard.henderson@linaro.org">
      <pre class="moz-quote-pre" wrap="">
 tcg/tci/tcg-target.h     | 5 -----
 tcg/tci/tcg-target.c.inc | 7 -------
 2 files changed, 12 deletions(-)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 033e613f24..ceb36c4f7a 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -53,11 +53,6 @@
 # error Unknown pointer size for tci target
 #endif
 
-#ifdef CONFIG_DEBUG_TCG
-/* Enable debug output. */
-#define CONFIG_DEBUG_TCG_INTERPRETER
-#endif
-
 /* Optional instructions. */
 
 #define TCG_TARGET_HAS_bswap16_i32      1
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 98337c567a..f3d7441e06 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -823,13 +823,6 @@ static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
 
 static void tcg_target_init(TCGContext *s)
 {
-#if defined(CONFIG_DEBUG_TCG_INTERPRETER)
-    const char *envval = getenv("DEBUG_TCG");
-    if (envval) {
-        qemu_set_log(strtol(envval, NULL, 0));
-    }
-#endif
-
     /* The current code uses uint8_t for tcg operations. */
     tcg_debug_assert(tcg_op_defs_max &lt;= UINT8_MAX);
 
</pre>
    </blockquote>
  </body>
</html>

--------------92ADAB78EBB612E32E3FD046--


