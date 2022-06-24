Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B47305599F9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 14:56:34 +0200 (CEST)
Received: from localhost ([::1]:46888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4irR-0002HW-Ks
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 08:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4ipn-0000z2-5w
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 08:54:51 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:45925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4ipl-00053l-LM
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 08:54:50 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-3177e60d980so23510707b3.12
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 05:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vQlWdG5JIHIWW7qivUVgYsRVtF7mRlU/FVvCrQK6W6U=;
 b=u0n8TV8iSRx9NgHamWSmnuEsqXq1PuajMFOds3nh+dBUzDpC9VrJMEIVoFWla0Gakt
 8oW1vBRnph3DF8xIiep3/b9VbjXqvr+CNLq1Zqz44+IZbhvfMFbudmk+zq2pDN/Q0fvu
 tbWO6QFGAs+YhBZanMCUlPS8/ZwmEmw8iaAJOeZmTJlm+6PvqPzGzgk3QKWUYKf7CDPt
 5EUedFFcVyoO5vRIyFUycTPolPj/hcORtCcx8yxlbdPCj3OTzRRpbFl+ldslXlLP2kF6
 xsM39ev/7Ucq0SNWD63czqtF1ZZDJJ7pEmqlLnJ+gOaDGyPIdSbvLEz9QQfYsSr+Spzq
 h+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vQlWdG5JIHIWW7qivUVgYsRVtF7mRlU/FVvCrQK6W6U=;
 b=YBFIaU32CK5Afw75bUF0acFdyjxydVjE7wXKKhaQIMTVWpzBMGm7PsntZvYQ19w+rO
 cWl+xzHbGDayvK9FbvYm5kNp6ARvYOuzDmS98/l7xMzzT7l/+OuXcW40iyELaqnwy8RS
 Ujv4OEnW4lVXDuEqxKgUA1/6yl6Njb7OdlrRk3ROVQ98pvRrfd7CgY5sEz+wn1MsDN6g
 pvaKIIPd24eLmegyPC5oYWVo8LaGgLbLLAWeHP2jQEq6BTEPRdMf86yjrZtGRk0tjojo
 kmHqb6G2zzPDUYG4ZFnpljcfddyCE2uYESMotohlmvJqYI95w59i2I89v35W3nsb4tjp
 +Jmg==
X-Gm-Message-State: AJIora8dPTj/+/dZgfmLh6XwLCrKbi0fBj1z1Cmj3ISW10E/GUYGsX6v
 yTyKiICBTbLBGulZ5z7nz0BoZNby6OY8mL8//wZcMw==
X-Google-Smtp-Source: AGRyM1tMyiWKwmLhl2TUvegalfx6SHmJ5CfBls85hLBRQawrPbn6y20tF08l21EsAgYr2LceKf4hhGfbmCZs+jZ/M20=
X-Received: by 2002:a0d:ca0f:0:b0:317:a2cc:aa2 with SMTP id
 m15-20020a0dca0f000000b00317a2cc0aa2mr17341329ywd.347.1656075288682; Fri, 24
 Jun 2022 05:54:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-36-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 13:54:11 +0100
Message-ID: <CAFEAcA9n4th_DNLF_aNOAkYy0k7aCa+5MVdq_bz-uioth1T75w@mail.gmail.com>
Subject: Re: [PATCH v3 35/51] target/arm: Implement REVD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 Jun 2022 at 19:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Again, commit message could note that this is an SVE insn that's
only present with SME implemented.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

