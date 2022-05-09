Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D83852063C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 22:55:27 +0200 (CEST)
Received: from localhost ([::1]:54954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noAPd-0000lk-VY
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 16:55:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1noAO8-0008V3-3H
 for qemu-devel@nongnu.org; Mon, 09 May 2022 16:53:52 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:51745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1noAO6-0004JK-Gx
 for qemu-devel@nongnu.org; Mon, 09 May 2022 16:53:51 -0400
Received: by mail-wm1-x32e.google.com with SMTP id q20so9037823wmq.1
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 13:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Qp91JYnoa7BAJ7B033ztPddIDR0tjxupwPjjFjFQK0U=;
 b=mACMveBM/p0HylZ3+XU6EQSiGFRB0h7qu2k2k1t98gQiWw79N9Y/j+MHCI0XkexbyW
 of7KER3kskSdwQovpPXMtIwpmbKCd+JkwVbBjdVZ0U+sfL9iAIx0a6x63/njLyYn0XkJ
 Vv/dEPdrqUJ2fCD7hiOk3kNZvdu5fYB5MldOelPOcS5Qc7Rcs6RCjhFNa9PLUlzAnOrs
 hcqOZOfIYOz6FDYa4g/LUGV74zY2vliRHGX2zKgziNcspFTT1ActNe+onSczlZI+mRaO
 Y118gsLScjC0ZWsmuCM48A6hkU4WotgH6bVlDODf+4GOkBNt+8nsjRKPPuO/lBmh3dOT
 zvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Qp91JYnoa7BAJ7B033ztPddIDR0tjxupwPjjFjFQK0U=;
 b=vZQkXaBjOWo27OsP6jbA97btCVY5FljDT+V/JPeS8uFROdoTPgNIgzYQ7k5BuutZJJ
 981NFQgcu4FDE7vPRxyiTVsrJf9pURSKPg3yM1L1xqMMhIJsTmSYnycxAE0K3RaZjj5U
 bxt02GQiK3EDUkgx0GoIqMi5HUhrkB7386Od1QYRPRALaAG5FV81Umvc7iUlnhW00fct
 aGQJZ4mAcvOGIwjYRuTrCmNjka5xbPlz7l6TfgzzomfCAytkFT/HB0reUWl1xeh45ROo
 Vn8Pn3+E6rOuAMmjMvHrc+0DJBplVqw5Xrqf5xURAR6oBt3TlpppOrUGZG2OXafhXj3q
 I20A==
X-Gm-Message-State: AOAM533SFgoL20KMgCKst1YEujZhVTxakSD87p0XqzdN3VKD9ItDzAOS
 iB7B0eTdK6xD6ZKf7S9bAj0=
X-Google-Smtp-Source: ABdhPJwQuzsirNcCakeVc5OXct1dMJXHXp/mL2YKxuCDXCapRo+Elglz6jlKpIWTh3HZsAWcj31QGQ==
X-Received: by 2002:a1c:1947:0:b0:392:b883:aac9 with SMTP id
 68-20020a1c1947000000b00392b883aac9mr17648796wmz.155.1652129628811; 
 Mon, 09 May 2022 13:53:48 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a7bc1cc000000b0038ec8b633fesm376104wmj.1.2022.05.09.13.53.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 13:53:48 -0700 (PDT)
Message-ID: <4169bb0f-03dc-e5ef-18a0-fa5b27f55cba@amsat.org>
Date: Mon, 9 May 2022 22:53:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 2/7] target/mips: Fix emulation of nanoMips EXTRV_S.H
 instruction
Content-Language: en-US
To: Stefan Pejic <stefan.pejic@syrmia.com>, qemu-devel@nongnu.org
Cc: ot_stefan.pejic@mediatek.com, ot_dragan.mladjenovic@mediatek.com,
 Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
References: <20220504110403.613168-1-stefan.pejic@syrmia.com>
 <20220504110403.613168-3-stefan.pejic@syrmia.com>
In-Reply-To: <20220504110403.613168-3-stefan.pejic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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

On 4/5/22 13:03, Stefan Pejic wrote:
> From: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
> 
> The field rs in the instruction EXTRV_S.H rt, ac, rs is specified in
> nanoMips documentation as opcode[20..16]. It is, however, erroneously
> considered as opcode[25..21] in the current QEMU implementation. In
> function gen_pool32axf_2_nanomips_insn(), the variable v0_t corresponds
> to rt/opcode[25..21], and v1_t corresponds to rs/opcode[20..16]), and
> v0_t is by mistake passed to the helper gen_helper_extr_s_h().
> 
> Use v1_t rather than v0_t in the invocation of gen_helper_extr_s_h()
> to fix this.
> 

Fixes: 8b3698b294 ("target/mips: Add emulation of DSP ASE for nanoMIPS")
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
> Signed-off-by: Stefan Pejic <stefan.pejic@syrmia.com>
> ---
>   target/mips/tcg/nanomips_translate.c.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
> index 58ae35a156..9ee4df2135 100644
> --- a/target/mips/tcg/nanomips_translate.c.inc
> +++ b/target/mips/tcg/nanomips_translate.c.inc
> @@ -2036,7 +2036,7 @@ static void gen_pool32axf_2_nanomips_insn(DisasContext *ctx, uint32_t opc,
>           case NM_EXTRV_S_H:
>               check_dsp(ctx);
>               tcg_gen_movi_tl(t0, rd >> 3);
> -            gen_helper_extr_s_h(t0, t0, v0_t, cpu_env);
> +            gen_helper_extr_s_h(t0, t0, v1_t, cpu_env);
>               gen_store_gpr(t0, ret);
>               break;
>           }


