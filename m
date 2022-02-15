Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 156284B7A5A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 23:19:25 +0100 (CET)
Received: from localhost ([::1]:33128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK6AO-0003AD-63
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 17:19:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK5iL-0006md-Ri
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 16:50:25 -0500
Received: from [2a00:1450:4864:20::332] (port=36725
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK5iJ-0003s5-E9
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 16:50:25 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 q198-20020a1ca7cf000000b0037bb52545c6so2424026wme.1
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 13:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hl9V2vSIDvdQJg3iIq63+5zfKgN3QkEu00wlkzTr30k=;
 b=LBpS/6tLDOtJEesn+pFKwuNu9zjjTMZ67UnUWcviJ19SgT4LCRMdKDvGCFTCodrRwM
 3NeeubDcRDk2Yi6TlP0xJW6qTiBNeyJ6nNt+MH+HiokseBJfCCAhV6239mdsA1wG7vRN
 36TZtKJM0OjH1vBIeN3DBJ6O/Q55pv2lOpcba/Xtg1Wn68cZl1Hmp9sv7McWdHtMToFl
 leV+1YsFCQkS6odVdUfzXhNCj9XPvbVUYCWFKp+y5W8EuilCBApBJrIsXQkFkgYUFH9N
 YYy8VdOK2SSqR0joHwYEa5bv+ocFRaNU7/lLlp1WQfSUu0cY27sKgMoaCOK4u+TTcjXs
 zpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hl9V2vSIDvdQJg3iIq63+5zfKgN3QkEu00wlkzTr30k=;
 b=G7xAuDppEaDDNtSXHsqxupfxAacOjxgYSzl0y+LI00AlaROpe6zw9LFP/jyshtKcQw
 UdQFF6P5QZPOnZJuN7XuKBxYLMHPXlO7YftXaefXHqBnvAv/ygT26ZHKk4EkdEPXu5MW
 Iiqet0GPWNU7XMKTD8uQ1zjLcuk7RLcMhgrN+6hsUGs5lWbTjI2iNUxG15+1QfvABv9C
 2O2jQEIjZavTPJVAYM9GJ2EYC5yD9IBQ1KYJlPRD+TFBlehzAftkf9RW/SjKeHCDjTA9
 bsHLJYAuIEo3PD72c7/E8yGGuIzx6OtwHeWIy0o28nyb65IHLvlHmw0una0k4otJ7w58
 LB0w==
X-Gm-Message-State: AOAM533RRP6CoZsJRXP9vVzUWrr0yhxdnpi1UqvV91mMUJ8CAbAtxuIX
 d+lzcCjJvCnuiqOEYML8NXreuf5YuTAraVtdM105Kg==
X-Google-Smtp-Source: ABdhPJxmYSegOmL5KaR0sNI2T5QaX3zGffPuQL1PKmTh+2wN1UubHRH38t29cz5cSUZNeB/tBTzhT7dKYGpaoi+hQ1s=
X-Received: by 2002:a05:600c:4f14:b0:353:32b7:b47 with SMTP id
 l20-20020a05600c4f1400b0035332b70b47mr4915281wmq.126.1644961821239; Tue, 15
 Feb 2022 13:50:21 -0800 (PST)
MIME-Version: 1.0
References: <20220210040423.95120-1-richard.henderson@linaro.org>
 <20220210040423.95120-3-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 21:50:10 +0000
Message-ID: <CAFEAcA826e-gGQkLuD+eeCAv4+MYHCyaZzU=QKpPjRUctos-+A@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] target/arm: Set TCR_EL1.TSZ for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Feb 2022 at 04:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Set this as the kernel would, to 48 bits, to keep the computation
> of the address space correct for PAuth.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 5a9c02a256..92f19f919a 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -206,10 +206,11 @@ static void arm_cpu_reset(DeviceState *dev)
>                  aarch64_sve_zcr_get_valid_len(cpu, cpu->sve_default_vq - 1);
>          }
>          /*
> +         * Enable 48-bit address space (TODO: take reserved_va into account).
>           * Enable TBI0 but not TBI1.
>           * Note that this must match useronly_clean_ptr.
>           */
> -        env->cp15.tcr_el[1].raw_tcr = (1ULL << 37);
> +        env->cp15.tcr_el[1].raw_tcr = 5 | (1ULL << 37);

I think the kernel defaults to 39 bits if it's built for 4K pages
(probably the usual setup), but OTOH we've been effectively
using 48 bits previously so not changing that seems the best
option.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

