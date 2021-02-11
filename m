Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6212B31964D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 00:06:27 +0100 (CET)
Received: from localhost ([::1]:59136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAL2Y-0004jP-DY
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 18:06:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAL0h-0003iq-Ul
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 18:04:31 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAL0g-0007UH-88
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 18:04:31 -0500
Received: by mail-wr1-x436.google.com with SMTP id 7so5869833wrz.0
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 15:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BUpSQuQfzlclnk0XUEUTw/8J8R/p1lOZC5q1womgimk=;
 b=FOzvXEe9FqG1ha2rrtIuH8vvLAEGnRCscTCFWJj4KD6u1Zh5jPCePiwLEwfzf0/VQt
 16u3UE2W7/SX2cUWEdodsUlFVnrReLRNX33ZUK7KCQeKu456dGKyT8ZC+T83B6mbJx/w
 cPqyp/UDot3K30HpAg1pazvH+EeIaL7a5+vqfCeFwhSq9SrdVbzARRcFUtr4zRo1furH
 6AYqYQSPsUTjA0F/ryMGL5tyj+svBZFayNJ/ECIuK6hPp7Cvi/eW5nHZgxaHssph7h8+
 hUbotHcLVjAE34fJxPT0d/hfqmWzpDYxGbOuMAtCEIZOg7gwibMvXCzka5XbSxAadrF3
 78pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BUpSQuQfzlclnk0XUEUTw/8J8R/p1lOZC5q1womgimk=;
 b=MCfaEgBH/kfLGPkp/dGzeTFdKuXFEUcVMZMZogvPYCbwSvrnJ1RIrIl5BHd60WYTCT
 mWK2qJJy4+DWUFb+UO5505CaUOBsFIY2YNL0c9FQP/FBzPoLP9C+9mU+5ugfXBI9DZjS
 p+AI5xsBu//EI/bZUKfN/9rwBe4zAxBQnraYMSW8whpX6zYgUbyrIaB9HZ979BfbSfbf
 nUraRCBjhtXKlRyJPtYwVKYObPXUWstLhi1rpoSDnK+SUS7FhCsPEZHT/1w6ng6sIShf
 sPZLKQXfNwU4KgTNdcP4v7h9yY6QC0ziw/8zUG3n75HAK9pGndpG0p7bdpbHrhxKMCRv
 rM4w==
X-Gm-Message-State: AOAM532e/DVTaLyqOUc5UZmfup2pJDRb2K33R4847X9d0MI6AR6DSmwv
 HChXZb/ZZUA2Z/qKdPHCrEI=
X-Google-Smtp-Source: ABdhPJzMGwIteEUOhJYa3hcqF8FgvTFSWSwY9F/ir+sazhvYVGl8sMdEDn+FsL6WHXn5AEWUXtpcsQ==
X-Received: by 2002:adf:facb:: with SMTP id a11mr92418wrs.161.1613084652057;
 Thu, 11 Feb 2021 15:04:12 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d9sm7248494wrq.74.2021.02.11.15.04.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 15:04:11 -0800 (PST)
Subject: Re: [RFC PATCH 03/10] target/hexagon: make helper functions non-static
To: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org
References: <20210211215051.2102435-1-ale.qemu@rev.ng>
 <20210211215051.2102435-4-ale.qemu@rev.ng>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <60f20674-0b70-832e-8b03-56423a99fad2@amsat.org>
Date: Fri, 12 Feb 2021 00:04:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210211215051.2102435-4-ale.qemu@rev.ng>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
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
Cc: babush@rev.ng, bcain@quicinc.com, tsimpson@quicinc.com, nizzo@rev.ng,
 Alessandro Di Federico <ale@rev.ng>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/21 10:50 PM, Alessandro Di Federico via wrote:
> From: Paolo Montesel <babush@rev.ng>
> 
> Move certain helper functions required by code generated by the
> idef-parser available outside genptr.c, moving them into macros.h.
> 

^ OK

> This patch also introduces the gen_cancel and gen_fbrev helper which
> will be used by idef-parser.

No, it doesn't. Probably old comment?

Removing it:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> ---
>  target/hexagon/genptr.c | 13 ++++++++++---
>  target/hexagon/genptr.h |  7 +++++++
>  2 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
> index 7481f4c1dd..97de669f38 100644
> --- a/target/hexagon/genptr.c
> +++ b/target/hexagon/genptr.c
> @@ -26,8 +26,15 @@
>  #include "translate.h"
>  #include "macros.h"
>  #include "gen_tcg.h"
> +#include "genptr.h"
>  
> -static inline TCGv gen_read_preg(TCGv pred, uint8_t num)
> +TCGv gen_read_reg(TCGv result, int num)
> +{
> +    tcg_gen_mov_tl(result, hex_gpr[num]);
> +    return result;
> +}
> +
> +TCGv gen_read_preg(TCGv pred, uint8_t num)
>  {
>      tcg_gen_mov_tl(pred, hex_pred[num]);
>      return pred;
> @@ -53,7 +60,7 @@ static inline void gen_log_predicated_reg_write(int rnum, TCGv val, int slot)
>      tcg_temp_free(slot_mask);
>  }
>  
> -static inline void gen_log_reg_write(int rnum, TCGv val)
> +void gen_log_reg_write(int rnum, TCGv val)
>  {
>      tcg_gen_mov_tl(hex_new_value[rnum], val);
>  #if HEX_DEBUG
> @@ -116,7 +123,7 @@ static void gen_log_reg_write_pair(int rnum, TCGv_i64 val)
>  #endif
>  }
>  
> -static inline void gen_log_pred_write(int pnum, TCGv val)
> +void gen_log_pred_write(int pnum, TCGv val)
>  {
>      TCGv zero = tcg_const_tl(0);
>      TCGv base_val = tcg_temp_new();
> diff --git a/target/hexagon/genptr.h b/target/hexagon/genptr.h
> index c158005d2a..0bfa99b463 100644
> --- a/target/hexagon/genptr.h
> +++ b/target/hexagon/genptr.h
> @@ -19,7 +19,14 @@
>  #define HEXAGON_GENPTR_H
>  
>  #include "insn.h"
> +#include "tcg/tcg.h"
> +#include "translate.h"
>  
>  extern const SemanticInsn opcode_genptr[];
>  
> +TCGv gen_read_reg(TCGv result, int num);
> +TCGv gen_read_preg(TCGv pred, uint8_t num);
> +void gen_log_reg_write(int rnum, TCGv val);
> +void gen_log_pred_write(int pnum, TCGv val);
> +
>  #endif
> 


