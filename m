Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C36A2FBB8C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:48:23 +0100 (CET)
Received: from localhost ([::1]:33758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1tF0-0007E9-Bs
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:48:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1syo-0008JX-IP
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:31:38 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:43368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1syk-0004DR-Lv
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:31:36 -0500
Received: by mail-ed1-x529.google.com with SMTP id n6so6928077edt.10
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fROPoyn+S6iVmTIWxNZ0OPsGElJjfHGqee8B7EKmEDM=;
 b=qrsOCGVHJhKRAIiql5CpoQx/LBBCUXwI+DapNBvedSN7F7BSAGNpBkjbg4YKAZLHOf
 tkSB6lISfjAbLy6XWAlJzyIkcwI4KZ9xjoX/MM4bnx9mFl4i5mcZ27feW3m0xdsx7uvW
 xpr4vEd/3D3OgiqZUQ+GOcPrL+6tNW3CS58ZRlE3krHci6cuhTNbg6lj+jSYuo/Gh2AH
 EgISoOvc5uOf6E1Ile1Y0W923mbVfyT0zQBqBeWEizz7a1USbsLq82jadNv8ebCyJSLr
 iY2fvnagUOBSNI5650HNP0+aBCdS7Xs26QZaJCziXvxnUMxGSLKFBu3l6v1+zD+gjmy/
 cqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fROPoyn+S6iVmTIWxNZ0OPsGElJjfHGqee8B7EKmEDM=;
 b=fUh4UbTdxp3TD3CLDWLvGJQjtr0jhRquuzuiiDpahokZPP/67Vx+MRLBDR+NAudVGo
 YapRU/gq8UAx5oGMY90p2Q/LZRWwJlvh5vMHGSCpN5rG++RfklD3XziTd1AymxCvQYGM
 xNH+CcMullB0lqgh2P/WPXyOdPCx/Gl/pQ9TpJH523BT+Qan5QfUvWOHnVGMOD7d5MG7
 YWWWV4fYTeOYDqOskzxNi0J/pQy8fXJ17CPuhIiZH4gPtqwVjoMuagI7zUJhFFafcUw6
 ZCuM1jQFetZxqVMgJoGmsUrvFKMhBsWVzmU2h5ybocPjXvSB4B64Of52b2bBAH4lbn/X
 8dLw==
X-Gm-Message-State: AOAM530K3CLidheew+DzaBwtqHnkwy01AGvBUdAZ1YXHO8PgxMO3wfnM
 CTIrAorTBy3qGShAyo796+eCUBk2g+bpN7tTGOFFPg==
X-Google-Smtp-Source: ABdhPJx+9uDd9VWcGW22GA16xqqKdSiDmwMH7hbEaIBYw0jPLiKjwC0x6fxr3a5p1TNy+1zJo7jQoZkTVtGuZr3l1NI=
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr3737226edv.100.1611070292029; 
 Tue, 19 Jan 2021 07:31:32 -0800 (PST)
MIME-Version: 1.0
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-15-richard.henderson@linaro.org>
In-Reply-To: <20210115210456.1053477-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 15:31:20 +0000
Message-ID: <CAFEAcA_8POe+vvXJqbJTxjNXqPU67Asm-JQJwQvzLBhmOyZpgg@mail.gmail.com>
Subject: Re: [PATCH v2 14/22] tcg/aarch64: Split out constraint sets to
 tcg-target-con-set.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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

On Fri, 15 Jan 2021 at 21:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/aarch64/tcg-target-con-set.h | 36 +++++++++++++
>  tcg/aarch64/tcg-target.h         |  1 +
>  tcg/aarch64/tcg-target.c.inc     | 86 +++++++++++---------------------
>  3 files changed, 65 insertions(+), 58 deletions(-)
>  create mode 100644 tcg/aarch64/tcg-target-con-set.h

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

