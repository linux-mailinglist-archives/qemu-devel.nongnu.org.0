Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 742E1669860
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 14:21:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGJzG-0000PS-3s; Fri, 13 Jan 2023 08:20:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGJzB-0000Mm-Gx
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:20:45 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGJz9-00006u-P9
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:20:45 -0500
Received: by mail-pg1-x52c.google.com with SMTP id d10so14938749pgm.13
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 05:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2HiQcavuJZg1YKdzcRCo0RHAlxM1LHlsbYqDs55xGY8=;
 b=Pfdw/SHrpuUQQXRZW/2rwUjKZ+phvsuOqkZ73ICmSQM8IRjnfTfZ/1jOxFmCj+DKbq
 piNNzbWGZzOJMhIEDPZjP8SB9Oj6zQLwhgS54zLHZ4DbHklebHHvXZY2uCpj295aLYpr
 rMA7ekh7qlhgkiXy4aDXLK9DBObVrYWLrUICgMdD7qmJk2+OHpl1iJSqC5qjiO0BBjhC
 Yz2Icuf6PY05+8wXQAG0/BhOc1ITM1YlZ07Egn6fjpkODbN8i0EVAZN4kbBwgNqfffHW
 +iveYELxihrcgnQOrp5FwdySKOHT9M0u+jHpqFWhxlMmHaoXEGj8hSkdbxAoFibm/OEN
 MO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2HiQcavuJZg1YKdzcRCo0RHAlxM1LHlsbYqDs55xGY8=;
 b=hoDGcXuLb8JwBPwRa5WyxYqIbXW6IB7nI2/w+Tx3aiy3+M7Fjbq2ujVqiFxNxKjzt1
 rxHlp5alMzCJR7VabIkul6uFHAe66cxg6mYCxkqNfHmtnOPqcHgbHGX3+bSy/2Lr8ImI
 4voTPbC0WhUhVmI30OER5IjJB93qtD/LzzTgQGwsj5kpX1/E9Sd1fKtqqywJLK7esRAX
 GRpoIOWbCCdjmWidhVJJ9Y3FrEwPDhuczkZONJ8I6GgmLCSczSb+eHjFXLxmtzKOwjjU
 An1QkcTlXdTM+yrdd6d7LJg2rSnMK5G2YZ25PPmGC0zwweqFEHFmkJHBbAfryKo/QWQB
 P69A==
X-Gm-Message-State: AFqh2kpGIpA8O+dFG81CSIW37f6k5pvKm0hQ70tfV6O1yNypkwg2gtts
 KIDkD+M/K2kdEUIj/f1G/sn02LXm9+XSFUbvr3u9xg==
X-Google-Smtp-Source: AMrXdXtkakFdQ05oY67t652mIwbr6sKUlK4LFQQCx04rUE0ODuCGa2E3oZEz+KHoMoWW9AzNUhuhyQ4CbVpUduDzxwY=
X-Received: by 2002:aa7:999c:0:b0:582:74a2:1e4e with SMTP id
 k28-20020aa7999c000000b0058274a21e4emr3618316pfh.26.1673616041255; Fri, 13
 Jan 2023 05:20:41 -0800 (PST)
MIME-Version: 1.0
References: <20230105221251.17896-1-eiakovlev@linux.microsoft.com>
 <20230105221251.17896-4-eiakovlev@linux.microsoft.com>
In-Reply-To: <20230105221251.17896-4-eiakovlev@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jan 2023 13:20:30 +0000
Message-ID: <CAFEAcA_1K6jC1aM3DX3iNN503pqw14yyCUiORoHPSfxN7g8Xzg@mail.gmail.com>
Subject: Re: [PATCH 3/3] target/arm: allow writes to SCR_EL3.HXEn bit when
 FEAT_HCX is enabled
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 qemu-stable <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 5 Jan 2023 at 22:13, Evgeny Iakovlev
<eiakovlev@linux.microsoft.com> wrote:
>
> ARM trusted firmware, when built with FEAT_HCX support, sets SCR_EL3.HXEn bit
> to allow EL2 to modify HCRX_EL2 register without trapping it in EL3. Qemu
> uses a valid mask to clear unsupported SCR_EL3 bits when emulating SCR_EL3
> write, and that mask doesn't include SCR_EL3.HXEn bit even if FEAT_HCX is
> enabled and exposed to the guest. As a result EL3 writes of that bit are
> ignored.
>
> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
> ---
>  target/arm/helper.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index bac2ea62c4..962affdd52 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1844,6 +1844,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>          if (cpu_isar_feature(aa64_sme, cpu)) {
>              valid_mask |= SCR_ENTP2;
>          }
> +        if (cpu_isar_feature(aa64_hcx, cpu)) {
> +            valid_mask |= SCR_HXEN;
> +        }
>      } else {
>          valid_mask &= ~(SCR_RW | SCR_ST);
>          if (cpu_isar_feature(aa32_ras, cpu)) {
> --

Oops. This is worth
Cc: qemu-stable@nongnu.org

I think.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I'll take this 3rd patch into target-arm.next now; I've left
review comments for the other 2.

thanks
-- PMM

