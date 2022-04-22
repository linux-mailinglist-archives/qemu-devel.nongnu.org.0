Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A194450B6A0
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:55:43 +0200 (CEST)
Received: from localhost ([::1]:56306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrt0-0004OY-OK
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:55:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhr4q-0004A0-81
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:03:52 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:37640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhr4o-0003Lk-AQ
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:03:51 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2f16645872fso81476687b3.4
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 04:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E1py9znAUw/wlU2mkFcdCURxHtihSD+N8HFYXYTLJVM=;
 b=Wrht70U9M/y9odPYOJzDovARAl+X9Njuhj9vOpzkoRs3L60vmM6M+y1Qu3jPg3SBnx
 4iabikVieMY9w0qd+E9NAelSJQcs+C+Vb0z/j4U1C4u3yWyRVoZXmAgJrq34iqh8mSDy
 J+rTcnvq0CcdQBbymLC9KwjCXoyDqIXRFj9/6v0mZat5peTdzO23+CDTGASbIVINhFda
 W8FrvsayKFKb9Az0N5unzdhskjL7l2iSM7W4O2u/IwlQlZtnSUI0tL5nRnHhNjlAsmHR
 GV7Ys6VixsvJuDbBK2U4GpWw8muGdJvRRibkgcAl5R5/wcUXq+7+I9Jo6wlmy0FZE9bk
 TANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E1py9znAUw/wlU2mkFcdCURxHtihSD+N8HFYXYTLJVM=;
 b=jFYG3KVXDLXQACLDwRqGVNo1iKfeKetDTsOke8bD9AqtKAejt75WxAiFOH2wrFrp0H
 8gNw5yS1idoMc2FQU1lUJTT/BLMEBxIHFQn0nZ1P2ZwquxCTVSVVv0Iq/QGhoe2EfGwY
 e4L68vZpz0l3x8SSZTOJgqGc8Rn3RrsqiZbzravlv1RuJPip/yuHTHEnuO7eGpwaTyC5
 VCqCyFKoPDOSos0P9ApZsFDLg0M/lk+KsujoROpf8MWestQolAnJeP0Vtc2y3of7oT5f
 jb3geDsks9QfIfVtNe49uMb/KaKsrtwqR4+rshK5kptuHFSkRd4WvFTV00L8RphspZh9
 x1hA==
X-Gm-Message-State: AOAM5330KEhoa6uKR4nWedzIo7j5V68z/6P2YCNhmVsHcWE/2IkaQUru
 KXvv537MovjpCLA1/Dw0DHfTUJtFe71P/t0t+nPkoQ==
X-Google-Smtp-Source: ABdhPJy0IzuM5sm9bretTvluMmxbPfCwVc67n2pvZUHiRmSWKAqdYp3lGps4UP8GkLgsrKcA7/K1S2miZt0e33x69Hs=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr4062330ywj.329.1650625429224; Fri, 22
 Apr 2022 04:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-44-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-44-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 12:03:38 +0100
Message-ID: <CAFEAcA9p0N7XnxC2rOBbLFwW_7bbuMzpX3VXWHnhPt2ZPYt3rA@mail.gmail.com>
Subject: Re: [PATCH v3 43/60] target/arm: Split out aa32_max_features
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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

On Sun, 17 Apr 2022 at 19:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Share the code to set AArch32 max features so that we no
> longer have code drift between qemu{-system,}-{arm,aarch64}.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h |   2 +
>  target/arm/cpu64.c     |  50 +-----------------
>  target/arm/cpu_tcg.c   | 114 ++++++++++++++++++++++-------------------
>  3 files changed, 65 insertions(+), 101 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

