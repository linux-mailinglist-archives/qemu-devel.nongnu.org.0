Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 640A93C3584
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 18:25:57 +0200 (CEST)
Received: from localhost ([::1]:39092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2Fng-0001CU-13
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 12:25:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2Fmb-0000XV-Cw
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 12:24:49 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:34578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2FmZ-0002aY-Mt
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 12:24:49 -0400
Received: by mail-ed1-x531.google.com with SMTP id l2so19120744edt.1
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 09:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MCpTpOUMl5BQkG/3DsdC2knKJsRJh5XaaGIVHEGdCes=;
 b=s3QamOvWcvNvVpPujFJYZ/AZOfXZcFMa7TMoexN4QQMzxWjQwky+7ssDOhH8I7r1DZ
 69NcEwS+ImY/U0ZGEid6ay5UzpS9OAtgyGLiNVUdnw8vwFs/qMvneZIBqosOQg9dIbFJ
 aaANbFG2e5x+S0xGB36eeL3eyNxMgKT0HWaB9wL9zEnRNnx645Hs6FqurdNrAL8IOWu3
 YkqrSq6xGk7bfE2HNXYelgaHpzepAiRpiVCCWwAGnLCcjlml22X/BPB55rFxPjyh0P5h
 9fcfX5DIczqhowrgGAN4fuoCfGgnMDYnNb2Y2WBKG4G+M3HlIJW2ZOJAmRfacyByNu2o
 AbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MCpTpOUMl5BQkG/3DsdC2knKJsRJh5XaaGIVHEGdCes=;
 b=bAkddm5k5y+lcjISJATPWXi6+9aaiuouiQw7vzAJQ48R7Yk4xYuMdDaqr72bftit03
 jQ9dkLKZHOmmjmhIYwWpzKJI6chT4FQ1M1wfEnFZCO0Y/8KW/MLctopDXnEd7RZp45vp
 vLuGSIuySXMFMhq7pR59SY3q+ptVIk9T6eeuj4KNbYfntRQnEeFm8AVO+QmxX5N4V27Q
 wuBsiHTjjDwnITcqVrBiZCZqNEL+PCLQSaFvlSUsk0zewD6X6xiwJ+9zjtnndQKTXWgU
 kd1HSN6LBeWSiKzRZmqf4CloATkeOQdZ7hxHjR7mCWPfyH3z9ftrKmbHn73DVxyAWcFs
 1X+g==
X-Gm-Message-State: AOAM531Y45ihKZaTiR2+sMt3VQ0PGXAXLVHS7t+B6Ab07N5F2lPwNZaM
 KxMSZD7Iv0DHDLGByip7YNegTaDwz3iz+LCJJQWwTg==
X-Google-Smtp-Source: ABdhPJzE5/R4lJCODVgonrmi9Pj34RqosMZaod0DrQOHAAVdn9LEmoQpB6PdUTbG5zeF+RLz9uBJdzge73V6LIfOhB4=
X-Received: by 2002:a05:6402:697:: with SMTP id
 f23mr32950604edy.44.1625934285675; 
 Sat, 10 Jul 2021 09:24:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 10 Jul 2021 17:24:06 +0100
Message-ID: <CAFEAcA_27xmAsRqTU6x6biqkPFZqHNT+LM2Q92HkSMW5OdFoJA@mail.gmail.com>
Subject: Re: [PATCH 00/41] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 10 Jul 2021 at 16:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 05de778b5b8ab0b402996769117b88c7ea5c7c61:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-07-09 14:30:01 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210710
>
> for you to fetch changes up to ad1a706f386c2281adb0b09257d892735e405834:
>
>   cpu: Add breakpoint tracepoints (2021-07-09 21:31:11 -0700)
>
> ----------------------------------------------------------------
> Add translator_use_goto_tb.
> Cleanups in prep of breakpoint fixes.
> Misc fixes.
>
> ----------------------------------------------------------------

Is this intended as a pullreq despite the "PATCH" in the subject?

thanks
-- PMM

