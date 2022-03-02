Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A124CA577
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:04:12 +0100 (CET)
Received: from localhost ([::1]:53478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPOeJ-0008Up-G7
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:04:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPOah-0005Eg-1T
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 08:00:28 -0500
Received: from [2607:f8b0:4864:20::112b] (port=38043
 helo=mail-yw1-x112b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPOaY-0004IA-9h
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 08:00:24 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2dbc48104beso16336337b3.5
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 05:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SkiTbDaZiU2tkSqlStyUWrTNhU1ShaGXRUPuIRdOQhE=;
 b=ocIoESHy+LG61ADBb1m/sA9PmLNm+5uKzjVEfQpD90859SqduPdkQQiEolWWhQxbp9
 +8g0PYdX+d7AMipSyco1TgFdPrzSKQQnvbqwmyPdTAwwgMNbRA7v5lfBD1iJe+dw35kJ
 7I3i3rnr5UPaltxSGjI3WZyfnYVh8b4EAkLknRhSCAiyrjaL55qyrH1q7QYUUwSaERIW
 LwXrY43ShZ7Tlv5ZzlMwhQwxdK/PzfQZL2jw7uROsg/596miHDNrIY/wysHKUKD0EopI
 XAyjzhORAvmVYCpTEEAn555pHT4tUEbKVlnTleUCTUnx3rMFzuzHuYOWMCfzViCFz2fh
 KkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SkiTbDaZiU2tkSqlStyUWrTNhU1ShaGXRUPuIRdOQhE=;
 b=D0DqYeAPB+QZfuT2lV2vnP5voNXnUA3PEZkTfJiVlxyMxKuldVJIKN/Vriybz02ko4
 LEovyJ9y905SITjFfghhiTVuT3kJZjnrom9rlZsxKxGNHbB6KpPkGhfjyVN1rNtPEuE3
 0dCit+bI2M70m9IuwhHcBL/fJvD1NkbGgYAaUgRjNzKHYBAXKOYE31/iHSsrHeSoeczk
 3TfgDO1OPHWe8DGc9cf+c40seTJ8It44XcMvD5tpTE+sw6YzEN4BHUXdz+8ZKcjc6xAf
 9Cveceypn476XGSjVLnPm9uu3Tz9LN/KXp43kgbWfyLG1hEO0ZyPDO6t/C+UFMfsfJcD
 avrg==
X-Gm-Message-State: AOAM532CBSXcvAa2JBFV4HdX99I5QxOQWy/Ujik5cQASbDBAlgN/opdh
 vy7ejsG0qqcBl59RPvac14lRSkkjg917X0+bKY2hqg==
X-Google-Smtp-Source: ABdhPJxI4r/0wiCUFaBh3itUDaY6kgDR3OSehyPpau4I2f3F/RlvvuQ7u8DdKZ5xse3GTl6Jj+drgID4/wT44iAw4yo=
X-Received: by 2002:a81:b49:0:b0:2db:f472:dfca with SMTP id
 70-20020a810b49000000b002dbf472dfcamr6117559ywl.455.1646226017236; Wed, 02
 Mar 2022 05:00:17 -0800 (PST)
MIME-Version: 1.0
References: <20220227182125.21809-1-richard.henderson@linaro.org>
 <20220227182125.21809-7-richard.henderson@linaro.org>
In-Reply-To: <20220227182125.21809-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Mar 2022 13:00:06 +0000
Message-ID: <CAFEAcA8w9f2=Fd5vDTaJOKJ07HjX51ch7EP8EM97hvKo6f5Ewg@mail.gmail.com>
Subject: Re: [PATCH 6/7] target/nios2: Special case ipending in rdctl and wrctl
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
Cc: amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 27 Feb 2022 at 18:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> It was never correct to be able to write to ipending.
> Until the rest of the irq code is tidied, the read of ipending
> will generate an "unnecessary" mask.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/translate.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/target/nios2/translate.c b/target/nios2/translate.c
> index 52965ba17e..b17ce25a36 100644
> --- a/target/nios2/translate.c
> +++ b/target/nios2/translate.c
> @@ -452,6 +452,15 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
>      }
>
>      switch (instr.imm5 + CR_BASE) {
> +    case CR_IPENDING:
> +        /*
> +         * The value of the ipending register is synthetic.
> +         * In hw, this is the AND of a set of hardware irq lines
> +         * with the ienable register.  In qemu, we re-use the space
> +         * of CR_IPENDING to store the set of irq lines.

maybe add
"and so we must perform the AND here, and anywhere else we need
the guest value of CR_IPENDING" ?

> +         */
> +        tcg_gen_and_tl(cpu_R[instr.c], cpu_R[CR_IPENDING], cpu_R[CR_IENABLE]);
> +        break;

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

