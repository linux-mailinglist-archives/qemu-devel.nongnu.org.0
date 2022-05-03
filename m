Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27BE518AE1
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 19:15:51 +0200 (CEST)
Received: from localhost ([::1]:50142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlw7q-0006d7-O1
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 13:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlw4m-0002Qf-G8
 for qemu-devel@nongnu.org; Tue, 03 May 2022 13:12:40 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:38344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlw4l-0004hY-3B
 for qemu-devel@nongnu.org; Tue, 03 May 2022 13:12:40 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2f7d7e3b5bfso186992057b3.5
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 10:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qskZz+HwSHwzT1Ly7EOjisqEUw//QhfFSfAXHv+fWak=;
 b=NXNDrZm/P3AZgbI4+Qk7Gmja6wYGf4kYTIWKOyT5M2Q5pU1okqzFSzc2dEkUfOr2FA
 p3hAReA9st3IvtqdxRAUoXUjR8EqZniI+DPqJ+jWimFEuGTlWJku9vzKytlfhwYSHiaW
 ySuumIdNPWSc3xUtN7w1RXUjeLu0h95aa4SF0nlx0G817zPjc68/2DEbOjCvpwDlaieQ
 Iazvn1fmz93FyzFYUDsrIWEqS/tkt4cM7Y3shK4luHTxkhUBG3TQ7Z0/qoeyfJt2EhbU
 YWsYVzAS0BYr1xEbzV4BeXuBJnCQwi1tMMbTGHntlEcVz8MdmK5QoNEAR/poV4jpLorA
 41RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qskZz+HwSHwzT1Ly7EOjisqEUw//QhfFSfAXHv+fWak=;
 b=6h3sg2buQOmhQ1UG1aJG9bZH5L0nskKONvMWlZGjYVoiaP88yDGfEJWJMASA7sIfQ1
 2pyWAfrr34A5oof0RjZyOUWrrg3TAYu10LXKMUg+vBdThdOUZdQkIkhJxW0MuZPUG1pO
 RZMhAYXheXIiwFXADDkMd14aQioiLF/UKynTgRb25rPVfvATIoX07Jxm5shsn6cflXwk
 WL6vlQKBz2DaA1L0FuFFxTY9R3Ek8zKLlI9zogrE9oAjK5iBnP8Jl/aNBBpd5o5wpGGV
 33oy73ZhKXlGNHrVO0UxzZbFSj4b1EHHx4HkMrGJDcmxEK1xWqQvoycDaaUeslqxDvUG
 ONeA==
X-Gm-Message-State: AOAM530Zty1o7Y3FztrDi26LBWLJfYk4EBk/3hIQ9nLdsXAeMkt5a7TK
 1KJI4GqGyPaRsT4mBLQVw2nbeaOqVTHm0FriH/4BjA==
X-Google-Smtp-Source: ABdhPJyX8XTVSbD/eQQGZVVumidFVk9yV5IGz5FVDGTI4KBA/obLaVfcs7b/bNYfpjOYq6n4dbVvORiXD2joq5rlxBQ=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr16405052ywb.257.1651597958115; Tue, 03
 May 2022 10:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-23-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 18:12:26 +0100
Message-ID: <CAFEAcA9fgq7NK7_sGkk8X5SNF1qcuEPWUvezJ4YCg-rbO7-A4w@mail.gmail.com>
Subject: Re: [PATCH v4 22/45] target/arm: Merge zcr reginfo
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Sun, 1 May 2022 at 07:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Drop zcr_no_el2_reginfo and merge the 3 registers into one array,
> now that ZCR_EL2 can be squashed to RES0 and ZCR_EL3 dropped
> while registering.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 55 ++++++++++++++-------------------------------
>  1 file changed, 17 insertions(+), 38 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

