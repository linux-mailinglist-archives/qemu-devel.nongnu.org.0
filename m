Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DFD52062F
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 22:49:08 +0200 (CEST)
Received: from localhost ([::1]:49434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noAJX-0005EC-Df
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 16:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1noAIT-0004XC-Nk
 for qemu-devel@nongnu.org; Mon, 09 May 2022 16:48:01 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1noAIS-0003aJ-6t
 for qemu-devel@nongnu.org; Mon, 09 May 2022 16:48:01 -0400
Received: by mail-wr1-x430.google.com with SMTP id x18so21091951wrc.0
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 13:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UHO0Z8vs3iKown5KBG6Zh4dA/7ztIx0lEj4PNbVBUT8=;
 b=nPTvXf0eEdbGnVZJSZna13oSiMvpcAf42qsMScFeNi0PCuuQktDGYrPD5YX24NZNa8
 E2yT12ijAErqs0t9m9nfpAIZtHEr33naSOcBAjohM79flcE77oljWwwkl4jXB6LJCuva
 847e9x0CejXrTtGb55mVXRBMQMqtWlvWcRxXebT3szbCzZbRKWjmepcSLUORGUrq+PO4
 HsGLrZF2o8EYRkQ0DRQY+wQFuntEAzcgswKRvaBHhkaMSSC9qdZru5t1iiL94p4jyqha
 4VIwPHYorTamMRZdEjsZxtwmuc7piaVpgTwDyFmjJp0hniWTEhh4bYbq8MlKaxlh6jpz
 Ubjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UHO0Z8vs3iKown5KBG6Zh4dA/7ztIx0lEj4PNbVBUT8=;
 b=yOsYBf9YH5IGnbuyfh5LLiTJvBdSwrtmGJtKf4MPzUWujsxgCf8Q+w+lpQPgkDItKA
 K8JubIxrnbOCGa/MxzG49+TjawRkj7q+KvR68X+Xeaz0PEzuydHwiyx3D0IO7UEa1zb9
 vHm/tqwukEt7tcYAjhH+kcxFtAp+VbzWDpAKqutmhafmBjQl98WIFffyCyABIGCDHyx4
 hcWo3kAb+CZnWbHMvWHFyMkuJbpg4DADUPKTbn5k60Tm7STyTPYT7AnOvQO9/UUuiK61
 4AcgyZ7hUZFiOVX9W5hNGfRlc4Ki5ovqJuy/MAWNU+w5Pcb7Eysgqi/gmKT5OTJydp+8
 R0sw==
X-Gm-Message-State: AOAM533TNx3o7my+cDuAHMc/gLOtF4o5aCdpm16bJFNUyGpgNxOa85ql
 3yUAtALQbZr2I0BLw6y+9kI=
X-Google-Smtp-Source: ABdhPJxLICJyhWJA3aeRU7R0AGdqI5LqH+kSte3SkZCIOn1xSWkF41dbgup9YTaJ3nEaCUhzTIO6IA==
X-Received: by 2002:a5d:64c6:0:b0:20c:6ffb:9584 with SMTP id
 f6-20020a5d64c6000000b0020c6ffb9584mr15300797wri.156.1652129278360; 
 Mon, 09 May 2022 13:47:58 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a1c7710000000b003942a244ed0sm316965wmi.21.2022.05.09.13.47.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 13:47:57 -0700 (PDT)
Message-ID: <f3c35e7c-7b2a-c59d-0d36-4c808cab5bfb@amsat.org>
Date: Mon, 9 May 2022 22:47:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 1/7] target/mips: Fix emulation of nanoMips MTHLIP
 instruction
Content-Language: en-US
To: Stefan Pejic <stefan.pejic@syrmia.com>, qemu-devel@nongnu.org
Cc: ot_stefan.pejic@mediatek.com, ot_dragan.mladjenovic@mediatek.com
References: <20220504110403.613168-1-stefan.pejic@syrmia.com>
 <20220504110403.613168-2-stefan.pejic@syrmia.com>
In-Reply-To: <20220504110403.613168-2-stefan.pejic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Hi Stefan,

On 4/5/22 13:03, Stefan Pejic wrote:
> The field ac in nanoMips instruction MTHLIP rs, ac is specified in
> nanoMips documentation as opcode[15..14] (2 bits). However, in the
> current QEMU code, the corresponding argument passed to the helper
> gen_helper_mthlip() has the value of opcode[15..11] (5 bits). Right
> shift the value of this argument by three bits to fix this.

Indeed. This applies to all the class, so
gen_pool32axf_1_nanomips_insn() could directly take (shifted) 'ac'
argument instead of v2.

Anyhow:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Stefan Pejic <stefan.pejic@syrmia.com>
> ---
>   target/mips/tcg/nanomips_translate.c.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
> index 916cece4d2..58ae35a156 100644
> --- a/target/mips/tcg/nanomips_translate.c.inc
> +++ b/target/mips/tcg/nanomips_translate.c.inc
> @@ -1597,7 +1597,7 @@ static void gen_pool32axf_1_nanomips_insn(DisasContext *ctx, uint32_t opc,
>           check_dsp(ctx);
>           switch (extract32(ctx->opcode, 12, 2)) {
>           case NM_MTHLIP:
> -            tcg_gen_movi_tl(t0, v2);
> +            tcg_gen_movi_tl(t0, v2 >> 3);
>               gen_helper_mthlip(t0, v0_t, cpu_env);
>               break;
>           case NM_SHILOV:


