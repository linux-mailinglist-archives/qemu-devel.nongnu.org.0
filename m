Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 258F5539158
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 15:06:48 +0200 (CEST)
Received: from localhost ([::1]:41270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw1aA-0003j2-Uy
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 09:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw119-00021p-TY
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:30:37 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:40935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw117-0006ks-SC
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:30:35 -0400
Received: by mail-yb1-xb30.google.com with SMTP id w2so1921627ybi.7
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 05:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KOZPr6pnJOadb2f21OyYgxBGVyrLDjhAlrrSN+4kWCs=;
 b=y2c05ZOL+C7VFF06jMd9osB1nC2AjYo3FvCQ3tThdiEk32rM8s3sByJSS8hsdmnOeC
 0uTkkNH/nYv4oHlVT0uUW14MrwloaeSulEFTHYM/DSWl+yezLgDpselY1LTQT7Ok330P
 1/dMFUMh1Mz3TakSC3S8F63YcIdNWu9Pw8WGb+KXqp61utHWyxqZrJY6aXQHIHX018Hj
 H3/X+KusyP2if2q0ECkylPKcU1braBV7C8Xjm94j9OGktGfue3aVBYVvZpyf80tga16V
 Ck1dS8SrwC6Yb1rcInNaeZ+mWjy/XXbMBRxHsRmQpsk4GlFEXdrv5knyZdcFCCSfLEv+
 TMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KOZPr6pnJOadb2f21OyYgxBGVyrLDjhAlrrSN+4kWCs=;
 b=DtIGul2rKtpKN/9Y3qo29o+bV4WLTed6Cu/6GCMekkoenjiDPJ3DRdYYWBg4vlopxQ
 +XRoKJI9oqS8HnTt7DWv+X/KwRp032s2KZYiBUzisi7xYyPnhUtOYn8odkCmO9tQ2RYz
 eYwSJJkL1NqDtvV4w0TZZ8njzSXwh66N4Qr4zoAtOGxahMvgk87n3T7SQV5RuJ5rCx2b
 OvfvbnkXC8cYH6AtM3xdc0HZno6xl29zW2PcnsMC2zJaEmyoehKCEJyPKOq7dCRJWx+9
 Kco+PwwT2QGK3bSaMpTWhUymRWNCDwc0zSsvpZB6RtIYwalfn8NXL4dev0pzFWgS7TTO
 slmQ==
X-Gm-Message-State: AOAM533x0HuDFYhnd7Pw3FAJY/Por1X+AvueexlaB3QbL7cI3FrH/9XY
 2W/79+BebKZBh7RRneU5cirVk3/fv3NxlT6ua81A1g==
X-Google-Smtp-Source: ABdhPJxp3FHagiumBTnhGqBHdi1s9FDmj+hIJcquLdZPjYBY4gGE2RXzNN1Pqfkg9yKRDbpiWgD2gZia5Mubigot6oU=
X-Received: by 2002:a25:ab2a:0:b0:65c:bdcf:44be with SMTP id
 u39-20020a25ab2a000000b0065cbdcf44bemr12079455ybi.85.1654000232759; Tue, 31
 May 2022 05:30:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220527180623.185261-1-richard.henderson@linaro.org>
 <20220527180623.185261-13-richard.henderson@linaro.org>
In-Reply-To: <20220527180623.185261-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 13:30:21 +0100
Message-ID: <CAFEAcA_8-a_15iAOgxJckdmtmRnteTbS2-ZjnikNgP+7=Pd80g@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] target/arm: Move expand_pred_b to vec_internal.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, 27 May 2022 at 19:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Put the inline function near the array declaration.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/vec_internal.h | 8 +++++++-
>  target/arm/sve_helper.c   | 9 ---------
>  2 files changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/target/arm/vec_internal.h b/target/arm/vec_internal.h
> index 1d63402042..d1a1ea4a66 100644
> --- a/target/arm/vec_internal.h
> +++ b/target/arm/vec_internal.h
> @@ -50,8 +50,14 @@
>  #define H8(x)   (x)
>  #define H1_8(x) (x)
>
> -/* Data for expanding active predicate bits to bytes, for byte elements. */
> +/*
> + * Expand active predicate bits to bytes, for byte elements.
> + */
>  extern const uint64_t expand_pred_b_data[256];
> +static inline uint64_t expand_pred_b(uint8_t byte)
> +{
> +    return expand_pred_b_data[byte];
> +}

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

