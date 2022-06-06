Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EDF53E418
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 12:38:50 +0200 (CEST)
Received: from localhost ([::1]:44966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyA8G-0002iS-Pd
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 06:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyA1E-0008HG-Oe
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 06:31:32 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:35703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyA1D-0007N9-69
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 06:31:32 -0400
Received: by mail-yb1-xb35.google.com with SMTP id t31so24905961ybi.2
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 03:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GF801lxgKy2IqPNapJc+TQ0bgVuyR2rhdMcRQ1CUmQU=;
 b=iStF/c1kmn4iaug8Izs+dnpKGJfuD+YuwsOsHx+peaY77U8bH/ceYRgpF9WtD40tja
 /PxYkGKpaymRveOG/cXoMyJiU+Chq+mahrC7ShF9IE3MGOBJmTE9iiMzTRoW85PvvzFn
 rSPFhrAp1MqYO1yfuZY9p6PLaK4KkibJNEJ9wLb0B/RdCBl5mUXcBFLNX/lgEVdWfZDD
 j97/GPTKBzjc2VWHT9puaNWiGSh4WJ08oKe/gbHC9vOsqNdu6GjyXFp+kHSvjgHc/X+S
 wKa1BULASZEsArFGEGiARxT8ukjTugW36lowxSdhe7Anonz/Y/0SYxgy9rYC+py253gA
 PnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GF801lxgKy2IqPNapJc+TQ0bgVuyR2rhdMcRQ1CUmQU=;
 b=J9/5WSvZN5fXVkSgB9UkP9UbzEg6ZgcoWUAgbzJH71rAEdt7dxKunNtODQigSbT+R0
 OQobNZQvDY5NDXknk/uiTkIZ8g0/rDy6eZRb53V21qttMTwP2pfLfBhGav8W9RoQU+W0
 2vUIi09uPKctPx/3w7eAyj61kYBjnrCXMKhrAbyEkKq+OsBjABPoSL9+Fy+x3Tp0XLhf
 fqJN+3M/CFnqFYckQm1ECBfedk7c949z9P2AgN2ntWA47O0WpHvcV0n25wJ3XE67HPfn
 cn1yrBDxST0R0HkRO/R2cONiRENRY39ozfqJq41GhFmvHGcS3uWdFx4CFNCVlc7vI4hu
 sVQw==
X-Gm-Message-State: AOAM533uIQdw6Op0y2ntgqmbkYVBskaTxJqZLp3pEwNXiChu3jqZKl+P
 V9oV5i4aodIfYDXz81nMiOtSkLjmUtVGRzlWf+eBSw==
X-Google-Smtp-Source: ABdhPJwv5zCkG/Qfb6/LoRVJvQOXFwKmjHrsZ1Uf3eZchOQMDjNzBUOBWbhb/0G1K415/nKXTG5DubfuRpLPHIznRrs=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr24422139ybq.67.1654511478728; Mon, 06
 Jun 2022 03:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-3-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 11:31:08 +0100
Message-ID: <CAFEAcA8wNJu7ACvA5WHQQic2LEB3cBcHBM4GLmBd=GtZoz5WZQ@mail.gmail.com>
Subject: Re: [PATCH 02/71] linux-user/aarch64: Introduce sve_vq_cached
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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

On Thu, 2 Jun 2022 at 22:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add an interface function to extract the digested vector length
> rather than the raw zcr_el[1] value.  This fixes an incorrect
> return from do_prctl_set_vl where we didn't take into account
> the set of vector lengths supported by the cpu.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Add sve_vq_cached rather than directly access hflags.
> ---
>  linux-user/aarch64/target_prctl.h | 20 +++++++++++++-------
>  target/arm/cpu.h                  | 11 +++++++++++
>  linux-user/aarch64/signal.c       |  4 ++--
>  3 files changed, 26 insertions(+), 9 deletions(-)


> +/**
> + * sve_vq_cached
> + * @env: the cpu context
> + *
> + * Return the VL cached within env->hflags, in units of quadwords.
> + */

I think the fact that the VQ is cached is an implementation
detail -- we could in theory calculate it here from
zcr_el[] if we wanted. So I think we should name the function
just sve_vq().

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

