Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B9D486650
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:49:56 +0100 (CET)
Received: from localhost ([::1]:44824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5U5T-0000Ql-MT
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:49:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5Tx6-000748-Hh
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 09:41:17 -0500
Received: from [2a00:1450:4864:20::335] (port=52055
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5Tx4-00023V-EC
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 09:41:15 -0500
Received: by mail-wm1-x335.google.com with SMTP id e5so1938220wmq.1
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 06:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N4hx1D89yk/kP8TBdoEUU8XYGOoGc+3vSy2t6/HgNyY=;
 b=dT7aUrsyNyfsAvoZ3Rgs+fhhL1ZCkVH/UIhyiG8mnqpuVLNL1VPdBmUi1IY/hEYfZK
 QfO/hQS+g4THpF21vNoNVdZuI4Bjb51EFxDkGfiImB6tqnZbVtlAhRaLdhBiurJRz2bk
 wGn0JAY/UcgXSmWttHugEJ82/NnjKTwyv7OG1ZndeoS5l4e+fZ/zNJjpMNryV3k+SXhT
 Bx3PPtadMFTEAiR6bjd4wi+S2iRx2KeLRxi2wqnM7QIVrPRZgbvBwgYD7lWCyT9AMxt+
 aEJd/jFQOGSxnEzQB+wqi25Av9qxL78PBa619ke97QdfAv2zGDx/uGNP49r9dGtMjhC2
 1Jag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N4hx1D89yk/kP8TBdoEUU8XYGOoGc+3vSy2t6/HgNyY=;
 b=xzt5QIe9pSjQZ9V3cO2JGfb4eK9gfbWTlAB8Kes2C1DX78kAuwY3E2yLWVGhvocQgV
 Yeb9fCO+8YLn6aQkg2ayxQtM2TURAbzRI8mTtvHK6OY0rqHJtwV3TRWYdASKeI15b2Ga
 N7MU3vqaHe+lU92Pc9q6hezJQVO5CfoQJAnI0Cu2Olr8TARE4d+JKrlS/Y8QgxCdLlx2
 Ht6d7wO2JOoKDIlT1ZjL7fZZqmMtzSy+rZH+achIOhQrQJnjpJMk/WJG1opEXPkBjtKY
 sGLSy8HA698rVH+aJjkYNyZbrC1m8q7WW53pFGBa77Lal3kpSSYHZQNelEG/Qvv5oufV
 MTqg==
X-Gm-Message-State: AOAM533PFJHigRHp5cS8/3YHt284I3Ff2MjlAGa5VweNlfDWIGCq+qGy
 YGBQktuAKDCwmY7whamsPHNbQXgkjZIOCtAeqekXWw==
X-Google-Smtp-Source: ABdhPJzF4jlkPDdNmUNICVkl3nBWNtrrqvGQ1W4KUGyKwJXazIgrN+3nlZkPduii9NlecMBkqK4iP8B39zdUl0wdIl4=
X-Received: by 2002:a05:600c:220e:: with SMTP id
 z14mr470563wml.37.1641480072922; 
 Thu, 06 Jan 2022 06:41:12 -0800 (PST)
MIME-Version: 1.0
References: <20220104021543.396571-1-richard.henderson@linaro.org>
 <20220104021543.396571-3-richard.henderson@linaro.org>
In-Reply-To: <20220104021543.396571-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Jan 2022 14:41:01 +0000
Message-ID: <CAFEAcA9iWBjZ+ibYfpVHmy8B6kp0q6WhtGzCwbO6BhwMJt=zfQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] tcg/aarch64: Support raising sigbus for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: git@xen0n.name, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 4 Jan 2022 at 02:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

