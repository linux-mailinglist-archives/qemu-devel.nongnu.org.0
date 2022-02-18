Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D262D4BBE4D
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 18:25:27 +0100 (CET)
Received: from localhost ([::1]:41304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL70Y-0004bO-Gd
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 12:25:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL6yj-0003ki-En
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 12:23:34 -0500
Received: from [2607:f8b0:4864:20::b29] (port=33297
 helo=mail-yb1-xb29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL6yV-0004PK-G4
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 12:23:21 -0500
Received: by mail-yb1-xb29.google.com with SMTP id j2so21037974ybu.0
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 09:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tvmE9xhwZhb9FM3CbnTka50hsOAYwBTZ7MJapqnkBU0=;
 b=LJkY+R6MgMI+us5Vjjmqjg3+vhcS8qXVGd/kI8nn+UokYuXQwkH9kEwIeeSeUWegUq
 8GDbHdcHS6Vw19x1qTmgMQFRkXP+69xCrN3hlo5zsxLOfXiWdhSsCOv5h6xh6dGMihL8
 AKqYU+HtNAMsn7ekpMTjeBhrxsbHpAG+iCufTpx/T8IacWFMIdHVfFzYss8DZnGdhsjG
 M24vNetTSeBelndiTvwg1ep2GIHPiQGWAYZfgSG7S88iQw46E2LOCVieADbTYIwaFTBo
 PuD1/ifLK+ns1XgRqk4bP79+CKfe2A1FbUOZZacnHmMHZGGQqtyKzmjSu2XbKejDMGer
 am3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tvmE9xhwZhb9FM3CbnTka50hsOAYwBTZ7MJapqnkBU0=;
 b=YbPrMMnb1AzFmK6enRe5gOwW2NgPHhXpZZgfT4YqCwy3z8j1vzxRF6viMEpHoXzW/G
 r0tnFIkDWyMcvaITXCpGOZ6/7hf4fWfvU672K+T67GdM+5qFKfM6vp6Ng4tuWKmhxqzp
 izeuz8cYtMCmvJfVusVYzdKeU7LZwbbz2sKh92utogG1ZULCCifBkCtWtgRHiHjbfVUr
 nGw6q9Apjuy+bIhyczN6o93HEjUcK+iu0A1LIDYQVjDnoKMucYCNKvcqDmx6r4KQJOTg
 z/B/5kYTddGW3lRMcBygzLQQn3A9+/DhtTTrFM8p3o1ugFSr9QRioTP8kC6mxkVYMxGw
 fUpw==
X-Gm-Message-State: AOAM533Y/xx9pcBqJK97d26w4Ae7e3VYzECxIFRdyS+4PAR4eivVBEx8
 kALkuzV2zeSQHmKs1rVoR8BBuQTZs1rSVFo/VSMhVw==
X-Google-Smtp-Source: ABdhPJwebUhM16X2JAdDF6tCik+08LtWHPIosvMcE5Ug5OJ6P+5c6SezDQ3GwcsOEOOmG2aCDxcB5+L2MR1ab+zDfrw=
X-Received: by 2002:a25:69c4:0:b0:624:4ee4:a142 with SMTP id
 e187-20020a2569c4000000b006244ee4a142mr2315049ybc.85.1645204998372; Fri, 18
 Feb 2022 09:23:18 -0800 (PST)
MIME-Version: 1.0
References: <20220218164646.132112-1-damien.hedde@greensocs.com>
 <20220218164646.132112-2-damien.hedde@greensocs.com>
In-Reply-To: <20220218164646.132112-2-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Feb 2022 17:23:07 +0000
Message-ID: <CAFEAcA_xtf-LtvhNqxMEtZs1Z6NePkVKOp6Kh+tN_HZTkFiuTQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] hw/riscv/riscv_hart: free the harts array when the
 object is finalized
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Feb 2022 at 16:53, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> The array is dynamically allocated by realize() depending on the
> number of harts.
>
> This clean-up removes memory leaks which would happen in the
> 'init->finalize' life-cycle use-case (happening when user creation
> is allowed).

If the allocation happens in realize, then it won't hapen
in an init->finalize cycle, only in init->realize->unrealize->finalize...

-- PMM

