Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A256A0D8A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 17:06:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVE6T-0005t2-RY; Thu, 23 Feb 2023 11:05:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVE5p-0005hW-W1
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:05:15 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVE5o-0006ao-IQ
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:05:13 -0500
Received: by mail-pl1-x62b.google.com with SMTP id h14so13609207plf.10
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 08:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hsFXdpy3bTS8cQtgTUf21vjRr8/o0taLuUU1NoIpCT0=;
 b=GPnWv9zTJ36kMV1QoXo4SeIY7CqwfLb0jusm5yq6iFeOW4HA0IO+eCTohlc8Xvpebb
 6Vd0GDVDLw2NifvGj7YlfvDHecycHeAHY4w1COtH4dcqqyksFC6ynmwdjAKQyOhhQ9c3
 ZtlUJQ+MZYNIXPinrZ0kkuKIxXEmGsLYD6EmI6s5nRLEJKAPLErj96XdpCAHn3U9KFJs
 /nBKq6w7YoGD6dGtY/7u7mCqtVNpW899mffPZu2v/imbEqjP18SOL+kS0eG1Qf5y81TW
 4a1WbPpWZ5JXd+qDoEDvEtyXgmHKevbE0Acd5Bbm8xUDs7ESMtMrI4Tx+XQBtfng/T4P
 lk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hsFXdpy3bTS8cQtgTUf21vjRr8/o0taLuUU1NoIpCT0=;
 b=gsPH+ANcm8ffzmZIXuEtYDQWhq/uXN6E4SKyGi2qi/okYib/X/VdrTNZcX3aKgRzNe
 BBbxs0BkkmNFq0GgHOTehyhUn2SYT36qSuQhUoQh7wYb8bHufaNH3nzpouFPExdSkVcQ
 +38ZZFj49FeK9AnMpnBYoKFn/qlUZy9On2orw7pii33nueOoYPjVxVjtfM5/zZnqJzvd
 6rSIaviacLtmKrL/AYGSfDwNvhjc7SCBb1wpRQp8FmMRywJGa5wQzPSlPm478uWFOsdq
 t6PEz7ledLpZoSX7htMu0yCUehR4JYWcj8E3stqIYu63KyCNrpalLGNZiFMeY5jEsI3I
 0ZVQ==
X-Gm-Message-State: AO0yUKVnOMki0eoz8DjItJn/AmwH+5102YFgZ3csdMt0PLdvtZiV9vZz
 fIG3dk8i5MR36sFE969gU07oDjrZbgTvp/UCkRXivg==
X-Google-Smtp-Source: AK7set+wov/fTGfT/L72xaFmhabuTpT2Mql6Bc5LOGB08XwWKx+4g1xMuX1jfIVavKGvUCERWPw2giL+dlYbsb1AyPY=
X-Received: by 2002:a17:90b:4d04:b0:237:50b6:984c with SMTP id
 mw4-20020a17090b4d0400b0023750b6984cmr1244165pjb.137.1677168311025; Thu, 23
 Feb 2023 08:05:11 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-12-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 16:04:59 +0000
Message-ID: <CAFEAcA_dE=HGWnnGYs1UZKeqVk41sUZ0eNBYkUezVGDPCm2jFA@mail.gmail.com>
Subject: Re: [PATCH v1 11/19] target/arm: Hoist finalize_memop out of
 do_fp_{ld, st}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 16 Feb 2023 at 03:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We are going to need the complete memop beforehand,
> so let's not compute it twice.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 42 +++++++++++++++++---------------------
>  1 file changed, 19 insertions(+), 23 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

