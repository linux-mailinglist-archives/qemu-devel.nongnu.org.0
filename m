Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B75545221
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 18:38:46 +0200 (CEST)
Received: from localhost ([::1]:36506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzLBF-00011D-6e
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 12:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzK8y-0007Bg-Pf
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:32:21 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:34425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzK8n-0001yR-7A
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:32:20 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-30fdbe7467cso209833887b3.1
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K0MmzcTAnLuQmLhQJBkv3ZzgszfNXrCyZhjaDXSf8Rs=;
 b=klQ8EMtNJbMD+KdUfRalp/YEfgOpXaHWyLVG4wfcynSWsPz/3c8iwzb6jY+331yvNL
 rir8PKwWcz/Q4s2SQrvYxEmteHxWUG93tas8oF6sz/aF+/aN5Pr0wPo+O/0mmTLdTklc
 lG2gwi5E/MqQtq9mn/OMP/qbOAiiZzpUo6lkY9IpmcmVrXJn6kMvjen3FAQyDaka3Tvp
 DpXMs0pRYjv+sWfIon2qQddeGHubu15RGoEufxCDGaRs8fqaP5yoUqgUq/WTDkGkX2MW
 quq4rTEAv0fkNUGXYQs9GSNH6D/8oVZE6U0CyKbCp/CFjymZwAj5o3NzD+oSYhggoWL0
 bAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K0MmzcTAnLuQmLhQJBkv3ZzgszfNXrCyZhjaDXSf8Rs=;
 b=2UrYQ90zDGOPDCU1t4JmEsTF0fWvrq9/HUQEYHLWLt9SujXi/5CksUcB+XVO0/OjF8
 TrcEpaw7EA/qhp4tzNe/e+I4Lk+Jphz3Pzffc1RwI3D7oAt/IHnl8skBCsd6hQuy32dc
 EEk2Y6R5CXuTH0GmFB+unsxElnmU9pXXHvxf1nmQrDfwf0IsLmcfEVlUTb9NBr3L4BiW
 ivYg+cab49ZfKmGw70gOgfsQnDalxw1AMj7GLMdxmifrkoXlBse5JbceQaNwIOT0zgnc
 ShGv4laJyMNMKhU+38dbcbZvEq/N57YTIvZHHLALErAtw0M0+ekXxLI6Tc2NELbSzx2a
 smFA==
X-Gm-Message-State: AOAM53101D4h4BUGy4d42xeK97WvGJa9RnYtIYRbfAiuc8MM+y3BkDw8
 bUgzKJb6cMKuEOYywLfb+jVoYZqFBrYVC1tHAiKNjA==
X-Google-Smtp-Source: ABdhPJzo/q++6Uv9ZIRqqL7N0xq5jgXtPT09wzTxctZAodJE7TDz4eDwfhv50E+i771viEeIi0vsU07urZhEqGKCLrI=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr44396886ywf.347.1654788727673; Thu, 09
 Jun 2022 08:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220607203306.657998-1-richard.henderson@linaro.org>
 <20220607203306.657998-36-richard.henderson@linaro.org>
In-Reply-To: <20220607203306.657998-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 16:31:57 +0100
Message-ID: <CAFEAcA8+rcYiXOEbppQH9V5wF2Jk3xKocFkg+MVdFLqqwRk4UQ@mail.gmail.com>
Subject: Re: [PATCH v2 35/71] target/arm: Move arm_cpu_*_finalize to
 internals.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 7 Jun 2022 at 21:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Drop the aa32-only inline fallbacks,
> and just use a couple of ifdefs.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h       | 6 ------
>  target/arm/internals.h | 3 +++
>  target/arm/cpu.c       | 2 ++
>  3 files changed, 5 insertions(+), 6 deletions(-)

I'm not a huge fan of ifdefs in functions, but I guess so.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

