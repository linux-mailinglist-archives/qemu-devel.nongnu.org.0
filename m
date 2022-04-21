Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ED5509E68
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:17:41 +0200 (CEST)
Received: from localhost ([::1]:53952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhUoe-0008BH-Fl
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUc6-00044C-Mb
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:04:44 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:38470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUc4-0000AK-BV
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:04:42 -0400
Received: by mail-yb1-xb31.google.com with SMTP id w133so5395407ybe.5
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5hgpWLWmdwANyTD1HAR+waBtcTBUdinJUaIUV+UMDkU=;
 b=hFkN9T/sZhfllUH3P/xdHkqEC1EGUfzqlHajM5BBVTMlsPumLKrlZvgoTwc0gWNoUq
 2TyAEMqfmE+bCbf+2dIpA41r63mMNxSCZO3vqpG+QB7Qa82W561ab1bRTO+gtxFXS3nd
 E5wjECf+nuT3+9DlsqdXi5W9WS7tEkCSTSk+tX0vVCKN8yr0rfcwocn/3UPvpMl1UbXl
 iJKkoE0osp+6+8y/1ATuXk1/L29elLqXH658sx9bHVbNM2NeXIJCGOBJ1wDqNvPlg27A
 IVeBZKgRL9RapLCU3BYscJ3h87UtT5Sj9sHiPilN21005fPOYT3fii+ZlYGgHJJiGfUZ
 pIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5hgpWLWmdwANyTD1HAR+waBtcTBUdinJUaIUV+UMDkU=;
 b=WFgn9jlWdon49ldyXSkfXBtPUXncy6ovxXI4SeLRVubKDWTRGOKFFbo/r95LygreDO
 lnLuASVTD15ijOsqkFnk8c0d1IQYI6/Xahs3M2jkPlPDzDRITHjTZ83A/AADmvvSMPNN
 Js3xrcEkzfUID2Td2av/MEnnlBv8h5YgZVMzlscYp/R+oy8VOqHMufBElTwsgkXdCKpl
 dl1h4sgw+1SrnaAGRXdCbiO+uu7xpwjgyZlg0n6EtHMcUP3YaMJ/zGUSPfXj/czOdxZS
 IoDjlYDpoWyJhLGOv+MsCwwZxFcZcol3bNd3JySaXomZreEBgKz/Dloaap7iYPhANT0Z
 jh1Q==
X-Gm-Message-State: AOAM531/48q0d/iIpyYEngEch4WDQIVPvieV/52eN5qKGLt9vHsiQYRl
 vcBwIe2LHz+hPDsCPMFuQRPNajGDFI7XICbEpKVBTQ==
X-Google-Smtp-Source: ABdhPJxyKI3T03eR0r2ciAwc/BKFMgrwxYmV7hmmiRAGiP8vA5enWZV6EZ8bR0lfmJ9AmoGNt8pC0bM/2JQSOQP3ORw=
X-Received: by 2002:a25:ccd7:0:b0:641:7c61:de91 with SMTP id
 l206-20020a25ccd7000000b006417c61de91mr23793108ybf.288.1650539079400; Thu, 21
 Apr 2022 04:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
 <20220405223640.2595730-8-wuhaotsh@google.com>
In-Reply-To: <20220405223640.2595730-8-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 12:04:28 +0100
Message-ID: <CAFEAcA-muDgih2vboh8JRt5U+nYJKtY3H9Um5UBLsB-rdj5AFQ@mail.gmail.com>
Subject: Re: [PATCH for-7.1 07/11] hw/misc: Support 8-bytes memop in NPCM GCR
 module
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Uri.Trichter@nuvoton.com, titusr@google.com, venture@google.com,
 hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, Vishal.Soni@microsoft.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 5 Apr 2022 at 23:38, Hao Wu <wuhaotsh@google.com> wrote:
>
> The NPCM8xx GCR device can be accessed with 64-bit memory operations.
> This patch supports that.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Patrick Venture <venture@google.com>
> ---
>  hw/misc/npcm_gcr.c   | 98 +++++++++++++++++++++++++++++++++-----------
>  hw/misc/trace-events |  4 +-
>  2 files changed, 77 insertions(+), 25 deletions(-)
>
> diff --git a/hw/misc/npcm_gcr.c b/hw/misc/npcm_gcr.c
> index 14c298602a..aa81db23d7 100644
> --- a/hw/misc/npcm_gcr.c
> +++ b/hw/misc/npcm_gcr.c
> @@ -201,6 +201,7 @@ static uint64_t npcm_gcr_read(void *opaque, hwaddr offset, unsigned size)
>      uint32_t reg = offset / sizeof(uint32_t);
>      NPCMGCRState *s = opaque;
>      NPCMGCRClass *c = NPCM_GCR_GET_CLASS(s);
> +    uint64_t value;
>
>      if (reg >= c->nr_regs) {
>          qemu_log_mask(LOG_GUEST_ERROR,
> @@ -209,9 +210,23 @@ static uint64_t npcm_gcr_read(void *opaque, hwaddr offset, unsigned size)
>          return 0;
>      }
>
> -    trace_npcm_gcr_read(offset, s->regs[reg]);
> +    switch (size) {
> +    case 4:
> +        value = s->regs[reg];
> +        break;
> +
> +    case 8:
> +        value = s->regs[reg] + (((uint64_t)s->regs[reg + 1]) << 32);
> +        break;
> +
> +    default:
> +        g_assert_not_reached();
> +    }
>
> -    return s->regs[reg];
> +    if (s->regs[reg] != 0) {

Why are we now only tracing the read if it's not 0 ?

> +        trace_npcm_gcr_read(offset, value);
> +    }
> +    return value;
>  }

-- PMM

