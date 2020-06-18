Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AE41FEFF3
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 12:51:22 +0200 (CEST)
Received: from localhost ([::1]:43334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jls8f-0004MD-IB
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 06:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jls7d-00031f-JQ
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 06:50:17 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:39385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jls7c-0001wB-2j
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 06:50:17 -0400
Received: by mail-oi1-x242.google.com with SMTP id d67so4646768oig.6
 for <qemu-devel@nongnu.org>; Thu, 18 Jun 2020 03:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UDGvjHy243m5K5tUi55Zs4HyAuG/d2zMvqvez3DQz6Q=;
 b=B0S8WLTLmYvA+HW/jOLl+nmu/NvnwXLwpww3Ya9v3QBv5nJr8NDQtGu8FoPEDRE9Vw
 xkNsd+RRE0HclKLZE1CESk1VrD+ufZAQKGokICss6Pyr59gBD8TEuNNptU3TWXvZbxRl
 p0LCaJ2pME2710k29fwWMSTqM3mU+xyKQET8MBbWsY7vxnOSAvB/TMxw3S5/YHIvZD6x
 73Zw/uEYnRcI5SAzj8dXZQGnb4O4hPijbbMu0VKwFrREhE1AP04G6t5cV5ukoRxVbiqR
 /AUjEN88xTaMunr+nK3sWDfRAsFmBdE7HtelRb21qZ680B6r2v+Tf0TSbRUa8xKCQuz1
 m0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UDGvjHy243m5K5tUi55Zs4HyAuG/d2zMvqvez3DQz6Q=;
 b=XZD7t3NhZOmpCK/8Cm6gtaGzHjkEn8HCGqhCio2BIBWdWYFdEyAeBEZgaqvqocPG/M
 Gii8Z1C0yr734GX80YavRLbAbWRyXLOktSuLgoapP4c8133uyNadP188jwQXs8h5ZxlV
 ty8vomTrDBetkqFp5h/pdNhBK6YrsIYRlujSF9GCfhzXpK3zvMm2TF2ROmvWTc4MHTmh
 IAleSpx7GYMl2PvellunH7N1k0cMfJGyTQrfOMN2Dr3jRK/uS6G8rUczBiAnIPWHI0XQ
 DbeLKAb1oE9cKqysqPhtxC7lx/222LRA5A9vCQg7HiPJUn9WnAE8miij4DlWF1Us0qbm
 LqRw==
X-Gm-Message-State: AOAM533hF5ICl3vowW2v0JdQQH3W6IVi52aeu8DKo0CdKQAIytQCZCRQ
 AuX7L9e1gAhGJgrdbKxTWPqJi2mQH8nYnbw4EvPmww==
X-Google-Smtp-Source: ABdhPJy2lSzpQVgQEny5vWDAvUU/xPY56D/a5Wl/Pt/I9U1OSkcEcNKflcnlHS/H/7Rma8z1VJlcCp5KAm027H4tARQ=
X-Received: by 2002:aca:5152:: with SMTP id f79mr2269797oib.146.1592477414514; 
 Thu, 18 Jun 2020 03:50:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-2-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 11:50:03 +0100
Message-ID: <CAFEAcA8fuxsCi13wagPvXnT5VAp8D4DSD-LzjAp=_k-QjdLCkg@mail.gmail.com>
Subject: Re: [PATCH v7 01/42] target/arm: Add isar tests for mte
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

