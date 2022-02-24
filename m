Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EADE24C2C48
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 13:58:34 +0100 (CET)
Received: from localhost ([::1]:55204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNDha-0004BK-2E
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 07:58:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNDVs-0000eS-VM
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:46:29 -0500
Received: from [2607:f8b0:4864:20::b2d] (port=41921
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNDVl-0000Xa-UU
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:46:23 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id j12so3531634ybh.8
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 04:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dRvqrjX4ZRWm4mUgejKatfS+fFK/f3WxgZediqF9/jA=;
 b=OV6rMx9sCTnqMBhLIdtI2R18yJV8d7hu2gIfNDqa7CZ+PAxuvj2Whs7LsAsmfIgNg0
 Zs0sYG8dehW4jJpr1eEacBD8j0senUFkK2gcvDVwqctudThXIYaqEegfR3ZqXP1B+wFk
 5VCjgrFKHHsAqGcvtLuUccRkyziWx3ldIovPGwunG5g5oMjxeh8RVcQrs/IJWDxnYboc
 1vcNa0ACAg7iHkLUNGqz5oy/Nga2sEAVdhdGsMPf9gwztlCfvvbe5GnM2B5brwUdiafH
 0j5nocV/bMiSVWtMEcAjTOB471u2XNVx9DwqHCpIqRcXZMxPHNEU44hc1HlspsXIHvUu
 6vkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dRvqrjX4ZRWm4mUgejKatfS+fFK/f3WxgZediqF9/jA=;
 b=eWxf/vijmCerGanRzYYltreLuQCNtV1NfggSkU04U4IViSubFnxVFTNsiMMNb65Tig
 U257AoNykV3z1yyyEkLxrz86lh8qHGqdeyAwQIGrdkjbgQd9n+NMajp8U/vEuag80BQQ
 gyo0jFRC55mTTlCi1Ed88Xw5TUrKJRaTcahQDz2lQwBIqzuykgIgqyhsvoxdb9UMt9Fv
 NXtkDjM1y6oVde24JctyiHt+uqCVSBONG22bDndSVbt/xLWZoR2NUGh41Z0ueqgS7NxE
 GvahJuxrZVdgxAyvd45urIPttVb1gvl2J8ucMyoX2kWbeix/pjziqtQtkqYt8Rl9dJOt
 FwWw==
X-Gm-Message-State: AOAM532c1Y7czN6/QztJAm+9c5PIvzEXK7W+1s+T1pnbRwSIiS/gcbTg
 n4Jh9vy8LPJJhGIo1GbL7SXjpLQ2TRscCTIQIZn6uHMWauw=
X-Google-Smtp-Source: ABdhPJwJ/R4TOEOfOyKi1a0cGIs/oBPcWH6rDoXyNnLDDFyIXDFk73rJP2bnzW0HEUMXDlKlqvbZqEtJJU5osteTCxw=
X-Received: by 2002:a25:dc87:0:b0:624:4104:a331 with SMTP id
 y129-20020a25dc87000000b006244104a331mr2223776ybe.67.1645706779496; Thu, 24
 Feb 2022 04:46:19 -0800 (PST)
MIME-Version: 1.0
References: <20220224122110.22371-1-evgeny.v.ermakov@gmail.com>
In-Reply-To: <20220224122110.22371-1-evgeny.v.ermakov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Feb 2022 12:46:08 +0000
Message-ID: <CAFEAcA8zKcZ7=gRmKX0fygpdmYfEf-HEodfH+SXwS_fT+rt2Ag@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/armv7m_nvic: Fix typo in comment
To: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Feb 2022 at 12:22, Evgeny Ermakov <evgeny.v.ermakov@gmail.com> wrote:
>
> Signed-off-by: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
> ---
>  hw/intc/armv7m_nvic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 13df002ce4..a08a0fdc50 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -97,7 +97,7 @@ static int nvic_pending_prio(NVICState *s)
>   * this is only different in the obscure corner case where guest
>   * code has manually deactivated an exception and is about
>   * to fail an exception-return integrity check. The definition
> - * above is the one from the v8M ARM ARM and is also in line
> + * above is the one from the v8M ARM and is also in line
>   * with the behaviour documented for the Cortex-M3.
>   */

This is not a typo. The "ARM ARM" (or "Arm ARM" these days if
you want to follow the official corporate name capitalization)
is the standard abbreviated way to refer to the
Arm Architecture Reference Manual. "git grep -i 'arm arm'"
finds over 50 uses of it in various comments.

thanks
-- PMM

