Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1404B7AA4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 23:41:33 +0100 (CET)
Received: from localhost ([::1]:54002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK6Vo-0003xq-BG
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 17:41:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK6AF-0004OX-OT
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:19:15 -0500
Received: from [2a00:1450:4864:20::32f] (port=37382
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK6A9-000885-UY
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:19:15 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso2454128wmj.2
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 14:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+GO2t88Z+VbnJ3TDs49HJ+5AsGu6OFL8hFwfMD+4rQw=;
 b=u+PIijCPMCTsd3rtCl5HoRRCBH2E1ZgonuoxGVTkj8xn1fGegxp+715wueWbj/mKl7
 HHH1OH8KVbjlynld4PQ4yJVvVONWu0Qu9dCzDNj1h1YUO6pZzu5TiZv6vAR9gfVGNv9q
 72gd+vnWrpnoNJNnXYVzzM9OFEYVeHNCzBbWXOBPrlXbY19vpThNac7EVSkRLxDJ5nLG
 xs/gg5fR0UV1L5yUvP+LmJ0nxWckUQ3GKUoBM9xllIu4VWVvVxO96NkmYDX2QI2LWr7o
 bmN0fGK0Y+E5FHk/ZVKcaHemhRlTfcqGjrWxfdE3+C9xQvhARDMCUlruOZhOKiAAtXSX
 ywpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+GO2t88Z+VbnJ3TDs49HJ+5AsGu6OFL8hFwfMD+4rQw=;
 b=BrQegHYYEaupjgS1wjY/M6m1MZQiq87GqUnSx+A/vG9r8RYJOvbOlQf/o5tbygcykt
 lm7ArMUicSelz7UnGj+R8ocz1qhmXs7hhkK0OswYEjHlozBMhATu+eW33xuBYIcN0Qhv
 vnLI1UwDVbwR6rJUcXnRdfPrOuxX5WU4Rw9yM5wBMcBLZ9e4dlCr2gkP67HUxhBnUHma
 1RTRNzSJQFI3ZaCBCdXKYUO1WHo467cLEg+dn4qE6cX3c8RNrcAd957LriQJmDkqF/y9
 Zx9np+Uxza9DwdAF4kooeQMMV8dAk9zeEozhxRbI/RR40F3dzbutTIHpFfjUualZwZkc
 zg0A==
X-Gm-Message-State: AOAM533F2YedWQFTlmumQwVxOhqOHooBNzh2Hg6ce61t9Vtoejv+9ocO
 5SaKgTOXNuD3p7XTTkYZvd93i5wD9L42o2otMaKEVQ==
X-Google-Smtp-Source: ABdhPJwiI+KEwjbiWKzosr2OIfSTzf2mTfd4ye/13o36sIYSgBNnI6C58uujrxP/m92eOVBTlBiDeAI9qkqD+DtmuUc=
X-Received: by 2002:a05:600c:4f14:b0:353:32b7:b47 with SMTP id
 l20-20020a05600c4f1400b0035332b70b47mr4988462wmq.126.1644963548036; Tue, 15
 Feb 2022 14:19:08 -0800 (PST)
MIME-Version: 1.0
References: <20220210040423.95120-1-richard.henderson@linaro.org>
 <20220210040423.95120-14-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 22:18:57 +0000
Message-ID: <CAFEAcA9-em5bOe7fALC6__Jg_zjeqQTLMLWZ01Hk3JQYr_pXVQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] target/arm: Fix TLBIRange.base for 16k and 64k
 pages
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On Thu, 10 Feb 2022 at 04:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The shift of the BaseADDR field depends on the translation
> granule in use.
>
> Fixes: 84940ed8255 ("target/arm: Add support for FEAT_TLBIRANGE")
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

