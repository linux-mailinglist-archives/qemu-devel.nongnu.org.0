Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AD832ED76
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 15:51:01 +0100 (CET)
Received: from localhost ([::1]:49152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIBnA-0004It-DE
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 09:51:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIBkl-0001fq-IY
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:48:31 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:46801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIBkj-00079c-89
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:48:31 -0500
Received: by mail-ej1-x631.google.com with SMTP id r17so3912334ejy.13
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 06:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ut45ZNUFx4I9cGZaEL3mdBFu9mwmY1NBE3AgGM/zY1s=;
 b=VJ6aht5POT1QMUZgS8+gcBJfkvfrPQJA2S6GfMKaglMmDMDcCZxeIh92Bh1GCnyT85
 htGc97DsbJTNMENlXFSnTMD8E6b+SeqDHhjwrQPSSLomDtkR6fJLYyaxWuombeO00SfF
 +c7i+73dkgTYY83y2EHvL04gePjzoJ7z5Kbcr2cIEfjpHfBJm9JkcH0nmGF+RgbRobl8
 xVII+bocu5I2H4b0T9470phS/EaX2hTgEyYKg4udEOF0eCYxgdCKFqwHpSZFHVsj9rFR
 OwNVwf4vcW3LVO3xI0IAOHvw2ObEsHtXmvgNzBt1sQVNK9a+0pWJ/R+DUzkLZDygPIg1
 ZTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ut45ZNUFx4I9cGZaEL3mdBFu9mwmY1NBE3AgGM/zY1s=;
 b=l9t1nzoqn8T/SVfAj6rY407pKDnlWvnPSBFccPDUFcCZHKgfgDLj0nYhla+eBW4CjN
 bHx38DcVxiID2vQEN3fu+joJyIAlVd2BRuiylx01qAKiM09JkzPe3GKvppoQdNYeuqaF
 ahpQJEQDCMK4vljLuwfD5KUjiT7jf0GzBI99hHPBoJU4488wtlQ512W6GjOW3r4fphvQ
 cCbkZ9lBiN59DKOXyIDCm3XeFW0kp1cbHeN/VHpUhpL/TaZJrWxfwCUuuYa7Sa7LSwks
 mL4fbb6sWC/lLNhgGcpSszCUsw/KItOd9hFuk9OgBdg66Ox4xIqE5P7CA5RKvHS40B4T
 tfoQ==
X-Gm-Message-State: AOAM533ODC+a1SfEn9jCNnbbw1cadRtrO7s8liquZ+AP+PmFFjelBzuo
 LD/sFpu//ys6QUqNBodAj8yJ+wFNTI/ylNXBmxI6eQ==
X-Google-Smtp-Source: ABdhPJxt3CP9R8R09fhYVww3yyMcdliFn0GZcmc0C0OM/K4AAuVW0FgkeXpDfLkwDVXld//eNoKKsllBEZynhecU4aQ=
X-Received: by 2002:a17:906:16ca:: with SMTP id
 t10mr2537956ejd.85.1614955707326; 
 Fri, 05 Mar 2021 06:48:27 -0800 (PST)
MIME-Version: 1.0
References: <20210211141515.8755-1-peter.maydell@linaro.org>
In-Reply-To: <20210211141515.8755-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 14:48:11 +0000
Message-ID: <CAFEAcA-yS0XcCU7CW2hDr=SLMB2WcNQbdtK=Ei8tk-86bW+i8g@mail.gmail.com>
Subject: Re: [PATCH 0/9] hw/display/pl110, pxa2xx_lcd: Tidy up template headers
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping for review?

thanks
-- PMM

On Thu, 11 Feb 2021 at 14:15, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> For a long time now the UI layer has guaranteed that the console
> surface is always 32 bits per pixel, but some older display device
> models still have the code to handle other depths.  This patchset
> cleans up that dead code for the pl110 and pxa2xx_lcd devices.  For
> the pxa2xx_lcd we can remove the template header entirely; the pl110
> still uses it to handle the wide variety of guest pixel formats that
> it has to support, but we can at least simplify it from a
> doubly-nested set of inclusions to a single layer.
>
> thanks
> -- PMM
>
> Peter Maydell (9):
>   hw/display/pl110: Remove dead code for non-32-bpp surfaces
>   hw/display/pl110: Pull included-once parts of template header into
>     pl110.c
>   hw/display/pl110: Remove use of BITS from pl110_template.h
>   hw/display/pxa2xx_lcd: Remove dead code for non-32-bpp surfaces
>   hw/display/pxa2xx_lcd: Remove dest_width state field
>   hw/display/pxa2xx: Remove use of BITS in pxa2xx_template.h
>   hw/display/pxa2xx: Apply brace-related coding style fixes to template
>     header
>   hw/display/pxa2xx: Apply whitespace-only coding style fixes to
>     template header
>   hw/display/pxa2xx: Inline template header
>
>  hw/display/pl110_template.h  | 120 +-------
>  hw/display/pxa2xx_template.h | 447 ------------------------------
>  hw/display/pl110.c           | 123 ++++++---
>  hw/display/pxa2xx_lcd.c      | 520 ++++++++++++++++++++++++++++++-----
>  4 files changed, 542 insertions(+), 668 deletions(-)
>  delete mode 100644 hw/display/pxa2xx_template.h

