Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E73B3B05EE
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 15:38:24 +0200 (CEST)
Received: from localhost ([::1]:50144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvgbf-0003Ii-Fb
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 09:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvgaK-0001Ym-An
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 09:37:00 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:36752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvgaG-0005Rh-SE
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 09:36:59 -0400
Received: by mail-ed1-x52c.google.com with SMTP id h2so10186059edt.3
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 06:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qp8j2fvjNO4DcxlQ5XSR5SpAQr/mYMxxui9H1d1WR3s=;
 b=I+KMAVO4LKUod758XrqRiePeVSmzON7NL6eUChfvn4Erf2Kk5oF1kIDYAexqDH5mw3
 /I5q85jNX92d34Ipw4H+8cgeTmP2yGgadhZcoQ4fjZNSPbYb3lD92xzA8c0Qi4cSzzBE
 c85VqJdUDvoRG/ZTrWf/OuBrkaaiMkyWMlpcYy6+rSwuZ70JrJiXqjhmSy3rBO3evYV4
 tVtxqBhz4EGw3qDK4+HIAzmeCYOkdoAcCZL9abvo+6L4X4tQD19CsTOgTWCIdooInl++
 Md1bWrTT2SXGg2AB5Uib4zgkQSNfC13pjnET+A8APLcAYMTcdECsKq7Kmn323ZqdSO1Y
 GlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qp8j2fvjNO4DcxlQ5XSR5SpAQr/mYMxxui9H1d1WR3s=;
 b=QYJg4N4H4Wo346yWNlvdFeaR9OloRf/HammbXm64QPZjUwVUVVywz5koXix6YNQN8N
 N13ZRPC3YmgRDAN6jvCu+MGUtaqnkbu9snGOAOqKnciExiShUJSB6daWwkSH0xwErB4t
 zPqaAbG3zTWlgypGNV83nfQ/pOtxZrjxobqCruXQnyOk3NyL0x3SOtjog/8+dGbCaDwL
 fbAD8f6XKyNKx1vTMcrTuO4iAavIP/kBKdAaeSezp0vyZtkapX+Vi4gbF9ZiQP3IZwrD
 qDqEppDTgQXTvN1cuXRhePeObnea7TgyUdun6KzRXFXQA/arWctgo1y192YDB4OX6eiK
 DJSg==
X-Gm-Message-State: AOAM533cqMew5sDj53VxMhUb/wHbc9igUATCRBscBWkgnoEUClT/OpWq
 jEuVroPo6pyG9A1RHm0b0Y+MzGDiLOr+7WHuzxDmxw==
X-Google-Smtp-Source: ABdhPJwSNlMwiQjPAIRSH50IJ1qxLjmH4VEb+Km4NBb6DBkTeTGTSKRPODroFjSX28hUCO9lJn4CWEy7XOaAjkzOzsY=
X-Received: by 2002:a50:fd0a:: with SMTP id i10mr4946150eds.251.1624369015291; 
 Tue, 22 Jun 2021 06:36:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210620042559.1236022-1-richard.henderson@linaro.org>
In-Reply-To: <20210620042559.1236022-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Jun 2021 14:36:19 +0100
Message-ID: <CAFEAcA_M95faWmbcR_3DHMt9GSnboH+keJY1UH0zgRpofjF-zA@mail.gmail.com>
Subject: Re: [PULL v2 00/33] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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

On Sun, 20 Jun 2021 at 05:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 3ccf6cd0e3e1dfd663814640b3b18b55715d7a75:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/audio-20210617-pull-request' into staging (2021-06-18 09:54:42 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210619-2
>
> for you to fetch changes up to 1c9638667b7068539dc5783c9428d588b14162ea:
>
>   util/oslib-win32: Fix fatal assertion in qemu_try_memalign (2021-06-19 14:51:51 -0700)
>
> ----------------------------------------------------------------
> TCI cleanup and re-encoding
> Fixes for #367 and #390.
> Move TCGCond to tcg/tcg-cond.h.
> Fix for win32 qemu_try_memalign.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

