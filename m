Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EA6513449
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 14:57:51 +0200 (CEST)
Received: from localhost ([::1]:38526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk3iQ-0006fo-H1
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 08:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk3h7-0005gQ-Kt
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:56:29 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:41907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk3h5-0002Kw-TZ
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:56:29 -0400
Received: by mail-yb1-xb34.google.com with SMTP id s30so8842907ybi.8
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 05:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eZDV6ma1eYefpVj/w7G4fwGabiA/6CKg5rkn0ky9OYk=;
 b=HwEg0yXft+qtFX8XYLero0Cj6t0YI4HLsNVWcMy8ZzG8wqqvGmM1Es1UgiRGQsjp/X
 lXewRB9zguYCdjjhqAQsHJIalgD5TuXh89CrIc8+TklqgnpnsWRCcAEGdtAb9OnOuG9S
 ooyr4tf2DP7/VH3/CjelSQisVPO0Ik7ZxRFB1bQZrj22l+e+o3nuRC6gdqsXrsn1HYVY
 T3GYzRpBL3aFqiwRMKb5aielyjilc4o4Fa1fygEaHco3XQ09mGNi//l3cq2qauhdXqgO
 5xyrPPJVYYGfb3seBLRtLJJLfz9gBzEsD+9WZZeSiWXBl4MmE4cl38R0DC6RXTmYdTuh
 pH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eZDV6ma1eYefpVj/w7G4fwGabiA/6CKg5rkn0ky9OYk=;
 b=ulrycGadjEluVwCXv95F+QXbOCD6LR4srW0nfQEaFcM9/9rmKcOiZNpcABJkYXbwBk
 mdT+dPwahvmIAEu41oDCk1cLiOa9pMbDq7BBx5bVLXC1M7rjVEmmOBVz3Q5TL9NanXKU
 pcZf1Sven5hbo6XBzUd/ADI0FtM7LSI9bD5d6YqQ5JCJQVp9vwywIS4+7Zb9e//2sU8T
 6TFVjqzwMhGM+dCuoo2WvfRTMzOMwdcX5v9G+B0JPfSgb79XsaRaB8WEY4aLBPTr1LYl
 +SYeoOTaeNmPaf94UlCAygLpxgsfQB9/xoAzxdHB5qziH0yRSoRfAlfpzJFwn5GDdsn/
 zofQ==
X-Gm-Message-State: AOAM532qgkfBycehmfGLY4ToK+IfncY0O/ILiJCBmjhuTgOOs6tlqGwV
 5P4K1jjQW7ZS0zS2O+HtScumjv8mpYvOq90PYAI3vA==
X-Google-Smtp-Source: ABdhPJwrIL6kNHFwH6I9rUhkTZGWkhnUV9QRBEKdvbRmMYVMILvRWJu6eSkap71vrS+0HC4W2G/JfbDR/Yf8iv22nYY=
X-Received: by 2002:a25:40c4:0:b0:645:88a3:eb8b with SMTP id
 n187-20020a2540c4000000b0064588a3eb8bmr28754744yba.193.1651150586781; Thu, 28
 Apr 2022 05:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220427042312.294300-1-richard.henderson@linaro.org>
In-Reply-To: <20220427042312.294300-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 13:56:15 +0100
Message-ID: <CAFEAcA-636wFtzEF56y8PcjcZy2J9RuNaw1nHMQ4Nsn_55ndCw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Enable SCTLR_EL1.BT0 for aarch64-linux-user
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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

On Wed, 27 Apr 2022 at 05:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This controls whether the PACI{A,B}SP instructions trap with BTYPE=3
> (indirect branch from register other than x16/x17).  The linux kernel
> sets this in bti_enable().
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/998
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> --- a/tests/tcg/aarch64/Makefile.target
> +++ b/tests/tcg/aarch64/Makefile.target
> @@ -26,11 +26,11 @@ run-plugin-pauth-%: QEMU_OPTS += -cpu max
>  endif
>
>  # BTI Tests
> -# bti-1 tests the elf notes, so we require special compiler support.
> +# bti-1 test the elf notes, so we require special compiler support.

Did you intend to edit this comment line ?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

