Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F284CA640
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:45:29 +0100 (CET)
Received: from localhost ([::1]:38390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPPIG-0000E1-6G
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:45:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPOPc-0003fD-TQ
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:49:05 -0500
Received: from [2607:f8b0:4864:20::1132] (port=44221
 helo=mail-yw1-x1132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPOPa-0005Zp-Qb
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:49:00 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2d07ae0b1c4so15717947b3.11
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 04:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/0J7sKtmtWfgFaK74bxIGdQo97w0ppvazTxAIKQh/uY=;
 b=Vw0wHEsY1Klk51Slw/d6EDK+VHdFGrNS+3JHsq8yhN+7uC+yZPVwHzOYFebmVCZxp9
 4qJ7wNDla0UxTlk1lzsOgZbMCBFUzsy2ToL4Ug9OrWBYLVbTJEQsBrBJRrIoTjJ+vV5d
 brwjN8t8WLER2VhgseqBjswQc7/FdtZEBfW+WK2A/Cs/2IMroYl5AkJtmaH8lzPRee+p
 u2iDpPGF9oM3iFU4rEL/3ZzxbJX8BzaI/54S+d03dKqMoxgkTSQX5yswLheIrzvrNnCV
 Ya37oRdT6vBJCQttuW/09Co9ugmVKcRvG4pKLvHCuoOZTrOTlLzT668+nZfQqVUvoTCq
 98/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/0J7sKtmtWfgFaK74bxIGdQo97w0ppvazTxAIKQh/uY=;
 b=LkMc5y+QzoVkiHhxDuEi3d8jA24sRK0xLB+kHRkqFTpJgtCuOgL9Qdual9oyYZJuYS
 YGO6lbhCqr6qDCwypYMNyepEYZnYtiH2qkpbeCGaC6mUNwwpp8slWlC/7aPKG0kcQX+z
 fN7FEx4vVY9twQuJNN7HYqg1kZBCHlt1ONAynW+AkbFFR9YqyS92/bU/xop1TqGIqujR
 zsh6WlMnLvDx5DxcsmBnqRQZv19oyUxsGfKpTeQgJOuaMcgj3Ci1Mhq9jFHHkJ6mC08Z
 2yt7eS0kRz7G1FwqDUEyL1mMBqWZ77kZO28uBW0rHJ3/TBgaIkm7b8IUl3iHw3f7ytvv
 os7w==
X-Gm-Message-State: AOAM530FFnzoc/FgGYMvWbg1bnRPIqPidTo66cUmqGBZKV7Xsy3iDVAa
 Jyf1O7NN27XQpRulghsjjmw42UtGrVra7m5BoQDtwA==
X-Google-Smtp-Source: ABdhPJzg67TLOHBlT+HxloDN9KQS3EAhEr8AziTqzr0hL6ArNKdQh48rfEUG3nAwcYweeRYefBf8iPdzDM87qoes434=
X-Received: by 2002:a0d:f603:0:b0:2d1:57e5:234 with SMTP id
 g3-20020a0df603000000b002d157e50234mr31029805ywf.469.1646225337761; Wed, 02
 Mar 2022 04:48:57 -0800 (PST)
MIME-Version: 1.0
References: <20220227182125.21809-1-richard.henderson@linaro.org>
 <20220227182125.21809-3-richard.henderson@linaro.org>
In-Reply-To: <20220227182125.21809-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Mar 2022 12:48:46 +0000
Message-ID: <CAFEAcA-psQWM2LBqytK7rZsDjr7viXBt5Lpf9aLi5cLRKExtAw@mail.gmail.com>
Subject: Re: [PATCH 2/7] target/nios2: Replace MMU_LOG with tracepoints
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
Cc: amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 27 Feb 2022 at 18:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  meson.build               |  1 +
>  target/nios2/mmu.c        | 96 ++++++++++++---------------------------
>  target/nios2/trace-events | 10 ++++
>  3 files changed, 39 insertions(+), 68 deletions(-)
>  create mode 100644 target/nios2/trace-events

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

