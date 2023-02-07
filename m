Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A778068DC72
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 16:06:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPPXM-0007gU-GE; Tue, 07 Feb 2023 10:05:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPPXK-0007eH-CF
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:05:34 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPPXI-0006y5-MX
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:05:34 -0500
Received: by mail-pg1-x52c.google.com with SMTP id r18so10599433pgr.12
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 07:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wqULP9uOv62ryMax0kxMFZqZakOkgflZRf7tcSpI5OU=;
 b=WcLmCpdGftlxPdcbfRjWdguRBLqru5Zs/tUggGq6RCzDGNM4joI9hz2dnwtvZT0xHo
 oDU1JkzP5hpLeu4hNyiunU3qXxwSw7XjClYSWJJmyB5BjZn9yB/2oeXHu/+65sIHTkxW
 lW9xdLHQC32welIDanLXpnKmEZhGsJN0NBHuHaJvoLVD0K0ndFKH5KMae5Vp+2Y/lKkZ
 D27pETrDyOutGwV0ciRxLhG4AqXV2J3CVwxQtag17m30c7jlG29m3r/FejU5s8FMc8hZ
 I8Hy0K9V+sDYWtTvDpYEqxmxBzBlFHoXOCzJNyTP8oAet3/zHl8DykIVMthwGIPrh5lG
 z44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wqULP9uOv62ryMax0kxMFZqZakOkgflZRf7tcSpI5OU=;
 b=QCUgVGBTPf0wwQwGPngF+xVMB1JwvjbQyCgyXAtTp6YHbaNJyR6Viy39LYeCw9ym2/
 3fHcEA6+7NyMcUKCH+Ef8grovq24olS6hO+f48eveywAT/YS8U73Pp4lfji4vM6iTpP+
 +er8Hb+O0+8lPLiDz+p7WT41Ih6QhLvd9sR7mi8x8peL8Oc1zmxBAXVMiiew12CFE8bg
 3BUITDR0y8bXQqxFsFkVo/LIITE5CIYqI+Sn/a3WRzbBNplgwJgCpkxWre5h63511Oxt
 Z621aKK8L2/qZ9lP6PXQ1/MN6yX62wwSuPsYnbHr93EQAqOClTz199NBASPsfDzTs7HA
 QzVw==
X-Gm-Message-State: AO0yUKUh/2zB9+dnLyQ8u0j9Tq7sLd2ms5QJdNTTye5pV0bR+FUBKT0V
 NeFfAzIOZdFH4JutcG5vXGMsrxMepfjr/IAmmdD5UQ==
X-Google-Smtp-Source: AK7set+4dbm/5UQ4STN6RFipLL/FVJI7ththjEdz0+XGmjUCE/5qMmkkLK0AxKVW/EdAThUBLCkju3qVXRgDiL7HiyU=
X-Received: by 2002:aa7:9a48:0:b0:58d:ce70:4683 with SMTP id
 x8-20020aa79a48000000b0058dce704683mr813369pfj.39.1675782330793; Tue, 07 Feb
 2023 07:05:30 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-9-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 15:05:19 +0000
Message-ID: <CAFEAcA_2G4V6tPe-gNtstFOM4TDsCnHwFHAESdQwkKvDx3t1yg@mail.gmail.com>
Subject: Re: [PATCH 08/22] include/exec/memattrs: Add two bits of space to
 MemTxAttrs
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
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

On Tue, 24 Jan 2023 at 00:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We will need 2 bits to represent ARMSecurityState.
>
> Do not attempt to replace or widen secure, even though it
> logically overlaps the new field -- there are uses within
> e.g. hw/block/pflash_cfi01.c, which don't know anything
> specific about ARM.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/memattrs.h | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
> index 9fb98bc1ef..d04170aa27 100644
> --- a/include/exec/memattrs.h
> +++ b/include/exec/memattrs.h
> @@ -29,10 +29,17 @@ typedef struct MemTxAttrs {
>       * "didn't specify" if necessary.
>       */
>      unsigned int unspecified:1;
> -    /* ARM/AMBA: TrustZone Secure access
> +    /*
> +     * ARM/AMBA: TrustZone Secure access
>       * x86: System Management Mode access
>       */
>      unsigned int secure:1;
> +    /*
> +     * ARM: ArmSecuritySpace.  This partially overlaps secure, but it is
> +     * easier to have both fields to assist code that does not understand
> +     * ARMv9 RME, or no specific knowledge of ARM at all (e.g. pflash).
> +     */
> +    unsigned int space:2;
>      /* Memory access is usermode (unprivileged) */
>      unsigned int user:1;

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I guess we aren't so tight on bits in this struct as to
warrant keeping the extra RME info in a single bit (which
should in theory be possible).

thanks
-- PMM

