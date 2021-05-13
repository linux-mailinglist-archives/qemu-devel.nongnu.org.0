Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BDE37FE2D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 21:33:48 +0200 (CEST)
Received: from localhost ([::1]:48862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhH5f-0005sN-HD
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 15:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhH4o-00051Z-4h
 for qemu-devel@nongnu.org; Thu, 13 May 2021 15:32:54 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:36522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhH4m-00034L-MX
 for qemu-devel@nongnu.org; Thu, 13 May 2021 15:32:53 -0400
Received: by mail-ej1-x631.google.com with SMTP id c20so6026730ejm.3
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 12:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j9SGZbB1OzgyJEb4kcA6Zdi+g7wB2nC4OBfOakPZ4Iw=;
 b=CIHT2MOWIIaCBPD+L2O1qSnao53Kp1IkTggedh+yTcj6kGGeJc9Gg2Uu4oCERrBMiS
 5Lgk54xtUhMcYiI1SAi4CogqnuABYQmww9luF7kFpQowv2gIKiiuUTnXKviDWnuwiMLs
 lhbGMPyA4IekEcure+/x/jEZNmHr86kuS814+/B761Wk4tCgetgehflQVhwwh6b9Jl9v
 QY4VdM4yZRWMwgArJK4OWLTIn+F4N9dqXYfLu2zriNzkc7tThMflFS1inwBKthBUH1GC
 tur1yigvr5xTA2NSUwnUuHvV19ZSSz5c7RVg8b1YCZoP+7F9W9kbOjt1X/A5BZf/N683
 rE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j9SGZbB1OzgyJEb4kcA6Zdi+g7wB2nC4OBfOakPZ4Iw=;
 b=pq1Nh16VHaD+eNkHoY+vAzZY/jWA02lQTkWGJqU/VhSfhz30O3z9PpMktWHdcR7JmM
 +1nKdGgelLfTgULq5U8M97B39uBbYwoUNAYLH+S6aVFlZp8LvSaCD4vKe292gEG4koZ8
 0RizlTb/OYKCXe0HQEQ9b4j6mt6yzlTZTHs8ZCe2HbUk9haRVVW+OYRTRvLoQUe2Ne1V
 DUfkj16bfKg7Ytj01DYL2HoaWsSIN7czfR2+flmyQ+DPtWDc/YRrMGHED6VESzU5fj0k
 4bISE3sA9mg2muM+P9kr26SkHkMk+bz3+yH1b5/h4WJALl9k1UBkgIOd2ckbAKZKYfkq
 QJ9w==
X-Gm-Message-State: AOAM530ao1bqyHgcLYh6VequjvWQ3h5ha61b38d69qxHA9eYt+vJn6sZ
 5Fov2hWhNi3IxFQ013bdvWvalAUl08cw6KVoNSvI+Q==
X-Google-Smtp-Source: ABdhPJxkgakKjd3wTkPkGjtGFfHb0TnFSDsr+O6Ewxypv0KlCHdE/4vTcmDt9B37KeQjze0t1aI1qKxptdA/fCqVLoQ=
X-Received: by 2002:a17:906:b74f:: with SMTP id
 fx15mr6322412ejb.85.1620934371014; 
 Thu, 13 May 2021 12:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-80-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-80-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 20:32:39 +0100
Message-ID: <CAFEAcA99Mufd5uke47XJbNjG251JnU6oZQNDTQxL1zkorGpfEQ@mail.gmail.com>
Subject: Re: [PATCH v6 79/82] target/arm: Implement aarch32 VSUDOT, VUSDOT
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 22:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h              |  5 +++++
>  target/arm/neon-shared.decode |  6 ++++++
>  target/arm/translate-neon.c   | 27 +++++++++++++++++++++++++++
>  3 files changed, 38 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

