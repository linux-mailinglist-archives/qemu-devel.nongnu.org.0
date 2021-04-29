Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F4E36E451
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 06:50:25 +0200 (CEST)
Received: from localhost ([::1]:59186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbyd4-0002Bb-ND
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 00:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbybw-0001mK-0X
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 00:49:12 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbybu-0006oH-3T
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 00:49:11 -0400
Received: by mail-wr1-x42e.google.com with SMTP id n2so12181040wrm.0
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 21:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dsHUiav0beDS7NZIvMO3OfyMSw8udfVZzy7y1Tma0Vg=;
 b=YpGgkSmAdUb56BTdAbL+bpF/c2/SEt0EZxpF5yQtdc0raCc0k6numin0ID21Q0XSiR
 kO/w6AfP6h6fEg/P6a3s39gFEPlhuRjmEM6TczpczYbCmeVyf5SCszs0cfcbG+DWb5sB
 AfIxZ3xznZcj/m/buvfzBPrb+aGWdTuK990bsK0y999f3OHPu5/07g5PaVCLAJs+PZVh
 GkdoIrpuSxd+drMpZcgECDL433JF0q1uiAx/MdaKiNr1puCiuNcBwIknl6NA6D5hd7CQ
 xy+y72hUMv2wWRWrVfM0iKJwrY11TD5iyt3IuQ5CvynVtBJYJxCfRuSrLTrKn8IbybNW
 pmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dsHUiav0beDS7NZIvMO3OfyMSw8udfVZzy7y1Tma0Vg=;
 b=tGp9wYAWiodLv+Z5RgXqpRTfnoJUE8YmA/IXeBWXjTbn2+twM2GpxfBCO1IqxUwiip
 z4psaaYmAU14nAiOFdUPciWRLJtTVysmiz+SJ6L208QpwEYpbqQ9e4fUyn1pVTePxpA7
 R+HNYZEjHYNxYasz+xDwcJ2Lg4+AIONmRmWgV9DLua0+rh9ZNaf4YyY2i4OuQ0ZlcAGn
 fTKUnYuHmCRT3ICvv68Z9rBmVY8Dj87/GZHiK/QzypUvJYxOlkyHq5tMyJvitdsepM5N
 1Gxhcq4CdBMwxUmyS2LdQmhrRfg4VzakexFNwmKHz0kzDDXKJsHoYr2WUXziDBrmDi6Z
 Nzgg==
X-Gm-Message-State: AOAM5314vvoVDDF1Wk2CJ10wUT2aoed9KUlO/J++Ar2yY1b37pDslgKF
 moGJrddH+Gb/TQg3QZz4o8g=
X-Google-Smtp-Source: ABdhPJygwj5TGJD21HpG/Z1dZg9q30Y1fEaeEHzPFsEHVmwf6IIDs2fj5w7PSThBLEZpHc4GfmjMBA==
X-Received: by 2002:a5d:6a90:: with SMTP id s16mr40815393wru.163.1619671747732; 
 Wed, 28 Apr 2021 21:49:07 -0700 (PDT)
Received: from [172.19.58.38] (static-189-95-145-212.ipcom.comunitel.net.
 [212.145.95.189])
 by smtp.gmail.com with ESMTPSA id n12sm1937942wmq.29.2021.04.28.21.49.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 21:49:06 -0700 (PDT)
Subject: Re: [PATCH] Hexagon (target/hexagon) remove unused functions
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1619667142-29636-1-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <204e8759-7fda-4e2c-6f30-466272432c78@amsat.org>
Date: Thu, 29 Apr 2021 06:49:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1619667142-29636-1-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: ale@rev.ng, bcain@quicinc.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Taylor,

On 4/29/21 5:32 AM, Taylor Simpson wrote:
> Remove gen_read_reg and gen_set_byte
> 
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---

To help git-tools (and reviewers), please use the 'Based-on' tag
the next time you send a patch depending on another one:
Based-on: <1617930474-31979-1-git-send-email-tsimpson@quicinc.com>

>  target/hexagon/genptr.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
> index 55c7cd8..f93f895 100644
> --- a/target/hexagon/genptr.c
> +++ b/target/hexagon/genptr.c
> @@ -28,12 +28,6 @@
>  #undef QEMU_GENERATE
>  #include "gen_tcg.h"
>  
> -static inline TCGv gen_read_reg(TCGv result, int num)
> -{
> -    tcg_gen_mov_tl(result, hex_gpr[num]);
> -    return result;
> -}

But what about:

target/hexagon/macros.h:26:#define READ_REG(dest, NUM)
gen_read_reg(dest, NUM)
target/hexagon/macros.h:29:#define READ_REG(NUM)
(env->gpr[(NUM)])
target/hexagon/macros.h:360:#define fREAD_LR() (READ_REG(HEX_REG_LR))
target/hexagon/macros.h:366:#define fREAD_SP() (READ_REG(HEX_REG_SP))
target/hexagon/macros.h:367:#define fREAD_LC0 (READ_REG(HEX_REG_LC0))
target/hexagon/macros.h:368:#define fREAD_LC1 (READ_REG(HEX_REG_LC1))
target/hexagon/macros.h:369:#define fREAD_SA0 (READ_REG(HEX_REG_SA0))
target/hexagon/macros.h:370:#define fREAD_SA1 (READ_REG(HEX_REG_SA1))
target/hexagon/macros.h:371:#define fREAD_FP() (READ_REG(HEX_REG_FP))
target/hexagon/macros.h:375:    (insn->extension_valid ? 0 :
READ_REG(HEX_REG_GP))
target/hexagon/macros.h:377:#define fREAD_GP() READ_REG(HEX_REG_GP)
target/hexagon/macros.h:379:#define fREAD_PC() (READ_REG(HEX_REG_PC))
target/hexagon/macros.h:577:#define fGET_FRAMEKEY()
READ_REG(HEX_REG_FRAMEKEY)

and:

target/hexagon/genptr.c:37:static inline TCGv gen_read_preg(TCGv pred,
uint8_t num)
target/hexagon/macros.h:27:#define READ_PREG(dest, NUM)
gen_read_preg(dest, (NUM))

I'd rather send a "!fixup Hexagon (target/hexagon) circular addressing"
patch (so Richard squashes it there) with:

-- >8 --
diff --git a/target/hexagon/macros.h b/target/hexagon/macros.h
index b726c3b7917..bf0e5ae92bb 100644
--- a/target/hexagon/macros.h
+++ b/target/hexagon/macros.h
@@ -22,16 +22,11 @@
 #include "hex_regs.h"
 #include "reg_fields.h"

-#ifdef QEMU_GENERATE
-#define READ_REG(dest, NUM)              gen_read_reg(dest, NUM)
-#define READ_PREG(dest, NUM)             gen_read_preg(dest, (NUM))
-#else
 #define READ_REG(NUM)                    (env->gpr[(NUM)])
 #define READ_PREG(NUM)                   (env->pred[NUM])

 #define WRITE_RREG(NUM, VAL)             log_reg_write(env, NUM, VAL, slot)
 #define WRITE_PREG(NUM, VAL)             log_pred_write(env, NUM, VAL)
-#endif

 #define PCALIGN 4
 #define PCALIGN_MASK (PCALIGN - 1)
diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 55c7cd86a4e..42f25f6f462 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -28,18 +28,6 @@
 #undef QEMU_GENERATE
 #include "gen_tcg.h"

-static inline TCGv gen_read_reg(TCGv result, int num)
-{
-    tcg_gen_mov_tl(result, hex_gpr[num]);
-    return result;
-}
-
-static inline TCGv gen_read_preg(TCGv pred, uint8_t num)
-{
-    tcg_gen_mov_tl(pred, hex_pred[num]);
-    return pred;
-}
-
 static inline void gen_log_predicated_reg_write(int rnum, TCGv val, int
slot)
 {
     TCGv zero = tcg_const_tl(0);
@@ -319,11 +307,6 @@ static inline void gen_set_half_i64(int N, TCGv_i64
result, TCGv src)
     tcg_temp_free_i64(src64);
 }

-static inline void gen_set_byte(int N, TCGv result, TCGv src)
-{
-    tcg_gen_deposit_tl(result, result, src, N * 8, 8);
-}
-
 static void gen_set_byte_i64(int N, TCGv_i64 result, TCGv src)
 {
     TCGv_i64 src64 = tcg_temp_new_i64();
---

NB: untested :)

Regards,

Phil.

