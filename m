Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C173B531128
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 15:43:14 +0200 (CEST)
Received: from localhost ([::1]:52560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt8L3-0001vb-Nx
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 09:43:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt8I2-0008DP-Rc
 for qemu-devel@nongnu.org; Mon, 23 May 2022 09:40:06 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:35585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt8Hx-0001C4-2R
 for qemu-devel@nongnu.org; Mon, 23 May 2022 09:40:06 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2ff155c239bso148632297b3.2
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 06:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nkwEjLcQkrGgS5UGKyF7YPAAYS/1198/PGElxyItX7E=;
 b=LwNvtV1WpA8TsRUy26s1xZfJ4SWak1BRaWJosB6H2/EbKQq3oB8a/XKSd8GLM6NEda
 GqfJyhjp/1K2jXfiWjqk0BKP3ZgUpG+GjhYn8hihEflaMt/8f3Xl899BA9+/dGfoP4Wo
 ltUUnnHy0bZNA5UG0KAsxNo/4GjlixwoBLW/L9Smz7N34sCg/eAqOzGlEcZXaZN7zVdy
 3CMcB5sXXHW+B2Sh2XyPcAKPiZTnlUaK+4xI8ylZcUMouXWUL/UtvuBc7lIDRTq5weOm
 AUEzVy4Y5URv0F897s3kT6583vXOgCEskBt8uME64mqKwUTLw3es5/gLSoHezTPZQVtJ
 J6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nkwEjLcQkrGgS5UGKyF7YPAAYS/1198/PGElxyItX7E=;
 b=bBfO6frRbZpblxyCU0uaLw1MLJ/iM85ZmrbLKW1TyLW5Vvo771mZ2Jwm8oMz5Qln4E
 cuTcjQnNXsL1pkLf2xNtHmK7oDBmGuqJK/sLEj7nJGjJx/pFRWcEm3fBpJbYqw8kLEIm
 kwof4uXrQwyAALgQMcy7IJ48OizNajHc9STBNrXkXxvWC78j14JfXfJSZ3cXzeBLb5QQ
 qmmWaVSTyMnaFlNtrEindAYSC2rDK99GJrOihg1xfjmyTwPx8g0qDyXII5213XOXBXHs
 e4lJVHQZtiynyL5WWNlwSb1r9y6HyPGKBYs5e0xYWnhMyxXpVB6Bp7P6cgiKSii908ox
 bb9A==
X-Gm-Message-State: AOAM531U90IU2e3k+oy5lt57Qx+oQN3rwTadHJxRFiaFVz9KJQBO266o
 Xoi22g4CdxjF8tTicRVZ8zrBjs7ZBE00Ss+SoASJHg==
X-Google-Smtp-Source: ABdhPJxI+imXL4ZbtQyLTB4bQr+aC+rXDwDuaWRDPb9xswo8/b8ArzGBJxh+jBhFfmx6CVQQ3u27nGcbImwjiD2CLgs=
X-Received: by 2002:a0d:d4d0:0:b0:2fe:b86b:472d with SMTP id
 w199-20020a0dd4d0000000b002feb86b472dmr24529081ywd.469.1653313200087; Mon, 23
 May 2022 06:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-39-richard.henderson@linaro.org>
In-Reply-To: <20220521000400.454525-39-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 14:39:49 +0100
Message-ID: <CAFEAcA_0f5qkS98mFOPZS7YJ_hV+CXD18bdaqV9Wu7v3SsRojA@mail.gmail.com>
Subject: Re: [PATCH v3 38/49] semihosting: Pass CPUState to
 qemu_semihosting_console_inc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sat, 21 May 2022 at 01:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We don't need CPUArchState, and we do want the CPUState of the
> thread performing the operation -- use this instead of current_cpu.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

