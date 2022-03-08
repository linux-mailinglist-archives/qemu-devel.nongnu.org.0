Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8A74D15B4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:08:35 +0100 (CET)
Received: from localhost ([::1]:57640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRXhi-0003tW-Cg
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:08:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRXgr-0003BM-FZ
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:07:41 -0500
Received: from [2607:f8b0:4864:20::b2d] (port=36701
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRXgo-00018t-GK
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:07:39 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id f38so37026554ybi.3
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4SodW+AiLqCHViTAxoBWmuJGdFxZiMjRVfs5E9GaITg=;
 b=ts02Omf2YOsVvmhMxUzhHlCTVA19loxsaNf8c+xboUB6dAPWSIjPNbwHDiCCKRt5i1
 MF1scXaqwQi+IW4ghbl0n69Yge1OTdg3UpqcLBoBNNKHR4R+D5EGFeJvUVzttQVzk4Si
 7hjSO/EEdO6uNyuBRVa8/YcSeuKMkX5O3TvaezqdLk0CtUIlfiNR4glLNykho1eZB5cL
 o5gOt56mJLkEjzeb/YVCTa4nd6BGE3+srioniLDMd3BAJjWeLJf0INgEzrsmMHTvtaa5
 eM4qCpOr4FXffCygyqlTuyIExzCCq7GfFLuusbxENUWg5KblOoke7lDcA/uUvo77MjTT
 ZJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4SodW+AiLqCHViTAxoBWmuJGdFxZiMjRVfs5E9GaITg=;
 b=SEatECj3aTSrFGDY0zGZq8T3kezWIiNYTHLAdZxg1R9BLlEejsTuytgPOU9t92XDFr
 iQh7U5r/2sJ4SmNdFXybaxjXIlYJK76avK0Ha7iF2KV3dQU1lBD4G/OAk2BZ4lJYUSzS
 gnjrs1KB5qdb7NdraTZJrtVQy6KWjCVpbTEUvfJaR+JBMQlE7ItTS0vUUF5SAl+fc0xh
 ZswM9iPD1VK9WxwLCnjhExhYh6Mm3rqtnNyZUvzsSDWuywO7gvtMJdYN8djqlyHpaJX0
 ankyZW9qk8ZGe9WRqhbpkm6mLNU/pDyfzq22kbES3RXqMH+eXKpJLAxCvYsSnpIszwHC
 3QiA==
X-Gm-Message-State: AOAM5317OHSxLaiQM1GelCLfupIgmeKgB0DqkeDkXBQFbQvyVg/4HKIK
 VcCkFogpgznLFstZdTSntsx58ZKP9PFyaA0NN+tQkA==
X-Google-Smtp-Source: ABdhPJxffnSQJnNFTkf8PPobu7xKbM0XmBO7uv3yUdcnCP66OpO7ANxM3UKMvgmfj1cTMNSvwdo5Vd2rTSvFHUB3HJ0=
X-Received: by 2002:a25:32c6:0:b0:629:130:a037 with SMTP id
 y189-20020a2532c6000000b006290130a037mr11407180yby.193.1646737657367; Tue, 08
 Mar 2022 03:07:37 -0800 (PST)
MIME-Version: 1.0
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-23-richard.henderson@linaro.org>
In-Reply-To: <20220308072005.307955-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 11:07:26 +0000
Message-ID: <CAFEAcA9PyqbGEYHbetdrkaCzXnnCUDp61dBWyF=_0PEwRc2HjQ@mail.gmail.com>
Subject: Re: [PATCH v4 22/33] target/nios2: Introduce dest_gpr
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Mar 2022 at 07:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Constrain all references to cpu_R[] to load_gpr and dest_gpr.
> This will be required for supporting shadow register sets.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/translate.c | 144 +++++++++++++++------------------------
>  1 file changed, 55 insertions(+), 89 deletions(-)



> @@ -449,15 +435,11 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
>      g_assert_not_reached();
>  #else
>      R_TYPE(instr, code);
> -    TCGv t1, t2;
> -
> -    if (unlikely(instr.c == R_ZERO)) {
> -        return;
> -    }
> +    TCGv t1, t2, dest = dest_gpr(dc, instr.c);
>
>      /* Reserved registers read as zero. */
>      if (nios2_cr_reserved(&dc->cr_state[instr.imm5])) {
> -        tcg_gen_movi_tl(cpu_R[instr.c], 0);
> +        tcg_gen_movi_tl(dest, 0);
>          return;
>      }

I assume the TCG dead-code elimination will mostly throw away the
write-to-R_ZERO stuff, but here for rdctl I suspect it won't.
But probably real code doesn't do that kind of silly thing.



Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

