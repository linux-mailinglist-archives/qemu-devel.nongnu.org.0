Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE74751323B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:16:05 +0200 (CEST)
Received: from localhost ([::1]:45202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk27x-0006BB-00
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:16:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1aX-0002Eb-Gq
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:41:34 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:45162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1aV-00010p-S1
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:41:33 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2f7bb893309so47748757b3.12
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NHMISA5X+5WeccuzUPahuL2uEIkrVlHe1KeVAn2ErWs=;
 b=ZOqHd+QVHbt4qXsDrNkHH7ly6x1CiLabWPwNAm6589AO8gdrEBsuT2OpdNGAqwWu3K
 d6n0hw2Xo3yJV+OsoS2I0dae3wsbt31DZpiLFwfYvfQzS008KRuDnpsCZjDKtRUVSbuT
 78FKs7Bb4AvXO86wKae4R5BTZCUCT/+/GcS1Ekr+/q0qXbs8pQ5cO3jLtAc0m/5Yk3Il
 NSp3ch1POgfqlfbu5e8bLIV6d8xW6QPGQOWlImuaLgKB+O0iSrBtsf/eYNbbTJo2LYrL
 eW3I2uGpFUh4+FiH/7HtNkKBl8uj3egjSikXWk2q4NsQQecxKi8hTtxwBOL0UjRcsafr
 urRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NHMISA5X+5WeccuzUPahuL2uEIkrVlHe1KeVAn2ErWs=;
 b=ukfCJ+PX8ClnfS6VLx3+E/7Lx28VoM9GPEeXATnck+HfRgwMnQzctiK1xUeHiRtM0Q
 pZw/2FHWqTKiKio91GjYT5+GB+lkqqv8EtuR2x9PkY0jDyWshsVDNyJ/w97VyICuBaMl
 A+t22dnC2+5LTT/xyBaxsk9DvLmFeWxbxUR32o6K4N4V20vdYmQpPtXtpUa7QT00Ztsv
 JrKy0V1otuqHstXICNknAKConMcvJkKiZ0QSutc1brp9JASacHz4VC+H/sGTc2kfHzER
 /l6/uWpOx2qrGIuMAeOKrAxi7tND0KUCk0uEO87luZCbBbBmdxNHa+gTNvC55SrbQ/n1
 sudw==
X-Gm-Message-State: AOAM5301EJ37hYxMYIM31yo35Q0hRFxTk6iW2oWUqZSsPPy9AK6COEqs
 24OuPzD+7IhhN+LD23LVHn/mloTQ3dse5zV6Tk+Tlw==
X-Google-Smtp-Source: ABdhPJwmextcNOd+jLSzzyJhO+iT2hWYFy/YhksHaCfB6GOgox75fKvNcOZuTboi/iOOSuTnYcJZT9cTbCyEhWOZpNM=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr31828672ywj.329.1651142490626; Thu, 28
 Apr 2022 03:41:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-38-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-38-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:41:19 +0100
Message-ID: <CAFEAcA92J9F3+fKWo=MRub5DAmxPe=mcYXw1VYQBhKrwc-9TVw@mail.gmail.com>
Subject: Re: [PATCH 37/47] target/arm: Use tcg_constant in SINCDEC, INCDEC
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 at 17:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

