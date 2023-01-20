Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5651F675CAA
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 19:24:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIw2s-0002cD-PW; Fri, 20 Jan 2023 13:23:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIw2p-0002bY-Pa
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 13:23:19 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIw2o-0000J9-8I
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 13:23:19 -0500
Received: by mail-pg1-x52f.google.com with SMTP id 36so4754107pgp.10
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 10:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8Xve2DpNuJzB5MZhk2rmkr0AbxyM9O49g9VOgWGryps=;
 b=q3F6kUYtR+cbPPq3svvKtB+bSGdjaGAeOaSPFYQsusrBBywx+ejh1b0Sqta7nQGSyq
 ughKtZXXdWhUgJqSUFQqhLkhayadDcHi4l1QZXach6a6bsgALplKjW6xSBYCYC0/98tg
 gqzJn7ms/8C/NjCrYrB88yJpbNnMTPbOamOSeBkKC8uDp9BChhraToFPYLGKeFM3jic0
 wS9N+vs57uK8F9Ahf3liz/INWI3RKvejh8nNKCAJK7p25YpWtUn8lobTD21iMVc8nKKJ
 8Sijl1pW3DAiz5WJZT3GPnrAUUT24ftUyWzgIJVc7LXYcIdymJuDGIgi7EeI5KplQ7GY
 XZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8Xve2DpNuJzB5MZhk2rmkr0AbxyM9O49g9VOgWGryps=;
 b=Sev3iVR5nyU8r0mXQ0Si/hKGIyPZeDw64SROJt39QyyJLJ6V3XAB5EjGzeqmW2YxS9
 a8wpBrx9H0jPCoquws5/fnOQ5jW93XmaTjNHuv00LzeFBgysLlang0FPkvWjSU7eqaVq
 ynPvAM39JUTb+cy/Cluy/XYQnBPdPx/lP04hwnOFHqwg/T6KjNIrIk/iRSbYllkIi5uI
 BkunOrhTsW51LFZowCOVuiVNrdShyBTj4f9zkdTEqUsFHbfBMFZQNCFh2mZzmQ1VGlRZ
 QoK+9NgM24xHkz0379RNe95OUL93vwfIonzPKPqK7srwEt7etg2lesydAp2fJxMLbG+L
 B5Ig==
X-Gm-Message-State: AFqh2koxspIUltpx+X3LTv3RwkXQlbLO3ArMI5/l6vdfeC1wt7rZl00b
 hUYm30YIYG471PyloYv2d75JcusZmWl4xrvYYkohfg==
X-Google-Smtp-Source: AMrXdXtGu4eTFhIZjhLgahYqwDVUeWGhcLKs9xV6m2sofBcHFkI1UUJLcP1kkD6nkwmMppkHkbGmgAPQNcux5gPMgRM=
X-Received: by 2002:a62:61c4:0:b0:58b:e9af:948b with SMTP id
 v187-20020a6261c4000000b0058be9af948bmr1678065pfb.26.1674238996583; Fri, 20
 Jan 2023 10:23:16 -0800 (PST)
MIME-Version: 1.0
References: <20230120155447.31702-1-eiakovlev@linux.microsoft.com>
 <20230120155447.31702-2-eiakovlev@linux.microsoft.com>
In-Reply-To: <20230120155447.31702-2-eiakovlev@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Jan 2023 18:23:05 +0000
Message-ID: <CAFEAcA-nXTerPhPPYWAiwMQK651xFOcttiPrbPp3Xgsiq668Dw@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] hw/char/pl011: refactor FIFO depth handling code
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52f.google.com
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

On Fri, 20 Jan 2023 at 15:54, Evgeny Iakovlev
<eiakovlev@linux.microsoft.com> wrote:
>
> PL011 can be in either of 2 modes depending guest config: FIFO and
> single register. The last mode could be viewed as a 1-element-deep FIFO.
>
> Current code open-codes a bunch of depth-dependent logic. Refactor FIFO
> depth handling code to isolate calculating current FIFO depth.
>
> One functional (albeit guest-invisible) side-effect of this change is
> that previously we would always increment s->read_pos in UARTDR read
> handler even if FIFO was disabled, now we are limiting read_pos to not
> exceed FIFO depth (read_pos itself is reset to 0 if user disables FIFO).
>
> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

