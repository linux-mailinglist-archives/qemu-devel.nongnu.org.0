Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 392245131C2
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 12:57:18 +0200 (CEST)
Received: from localhost ([::1]:40378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk1pl-00070m-AL
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 06:57:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk17V-0001x4-Li
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:11:35 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:36822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk17T-0003kv-H3
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:11:32 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id f38so8142377ybi.3
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k5TuOxiyQm6qvQ60UMEvgpz6IVAjnYnTYGiGPKJzv5w=;
 b=mIfUT7e9IQ1vxy2v9gtiIYZQxTObvhH5JDhtdrh+fwrDTbA/4WjFnaof1qbOOHCZHH
 OCVaBLI8HEeoVi1vaaGPD/xuAIkIdQSipKNc47ORGnUbFm7vo7WH5i7SpBvmxK+2dt4/
 s1oK+rY7dFsc+ZXO+r6Ykb3wb/vLPY2QxYlDGHH/LPQv/v/6sIdJWpQpnFJJyec3rhvo
 V8jsZml7jDnSEB6jF5HbtqHqUixHlUhIa+/J5Fu+26Xpt2xB5ndH/JbD6oy9LDbx505p
 XNYOrNdIP4Fi6frGS3XSWNucoAQfSkG3Cjc66kKvWdU7yIG80nqStrrIzBZZEV15xYBt
 jHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k5TuOxiyQm6qvQ60UMEvgpz6IVAjnYnTYGiGPKJzv5w=;
 b=NZFU7XIk6GJxDAFWUVWO9/GfO+FWWvIC8bYCGbYJC8BM1JqlKSkdRUn4KAjrp1kvVC
 gMc5s/tWQPt+EMFLS3LNAFwbXzCzbftwAo7+wIg82N0waDe7ZYEBF2THrgSxkh0jAHee
 i8Zn5wiHuARs0mM6phTNxOeD+tIv+s0ZkvI20QhUioBKclOgPltw0MGxWUJ+734XJEra
 im4m5AZf9NMNwrHTtLOO4/YvgJnbmtn+OoyY5uPUXIl2cmQQPC7ncggY3moET9ZsmtRZ
 Id709Ka0YC0hc+49mL2Q/l5Zxk6TfJfC2xf/DrFyXgXP5GLqbdP9k+0u3eHkjKMREiim
 TILg==
X-Gm-Message-State: AOAM530jo1dit0K+U94b6OgacdRFLhMxkljMqKcavLXgbrlc9ytPl9Xn
 7oj0MZAsULNlDsVAnvSqWCdXh62ELQsLv1E/mxsgWg==
X-Google-Smtp-Source: ABdhPJyb9G1GRb+beOhsvrC2nyDA1iGxlboOn/Vertjm9MXHf4NXgA5xSDCEcht0/IqwtGWOMDIwO+tcz2OmUrV02xo=
X-Received: by 2002:a25:cf4d:0:b0:645:755c:a5af with SMTP id
 f74-20020a25cf4d000000b00645755ca5afmr28799237ybg.140.1651140690120; Thu, 28
 Apr 2022 03:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-21-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:11:19 +0100
Message-ID: <CAFEAcA8Jb-BLbq0V0kJg0tBg-ts63WQWpbR7NAvGVF0Sge8Mgw@mail.gmail.com>
Subject: Re: [PATCH 20/47] target/arm: Use tcg_constant in 2misc expanders
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 at 17:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 40 ++++++++++----------------------------
>  1 file changed, 10 insertions(+), 30 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

