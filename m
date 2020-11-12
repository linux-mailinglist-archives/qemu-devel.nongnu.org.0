Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDA82B088E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 16:39:11 +0100 (CET)
Received: from localhost ([::1]:54368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdEgo-0003Xp-Pi
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 10:39:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdEfV-0002S9-AQ
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 10:37:49 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:37572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdEfR-0007zJ-Lp
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 10:37:49 -0500
Received: by mail-ej1-x643.google.com with SMTP id f20so8465820ejz.4
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 07:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EtEI5Q4U/QascOeY/zwdZKd6fPB1Koi4hWWnSw3WvWY=;
 b=Y6J/KXi9zL7zY+koy8kAnEgbg+SUhvgs7w5OFWW0LKvVerbpb/5gGLAoNHa+bXnXiP
 EfX1hbBHg8fkk92SD+/Va899gUXexjZT1eeo1Y46HDEkq/RypBkan7FH0iJyxa2Y7H18
 HtK11MsfWQ6IRELm3Q51/lKZnDhXd3Uc6eojZj/MPiDt7Hjf5Xap0YBth7/qlR4Y9qTX
 RhaNicl1EIS3TPa/pJVB1PW7CykuqXO1U2k8TkLl0JoeVP4l1RJus9Z9UZ0fgZ77+xyj
 WR5npjkQf4Yp/pcM8Nkh4PJQ9gPeNaw0OSBwbYmnxDgX7iDIoxBNmg4arsuRYdjZaytz
 D1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EtEI5Q4U/QascOeY/zwdZKd6fPB1Koi4hWWnSw3WvWY=;
 b=VF+pIsfYf+jifdpZvxeCUF/B3fiawXp05yEPfj1TEkNCK05kyAUQez/rh+TRhq+PYe
 ZNrCg8HGEASB5li3ElzRFUAy4W6hGWmv0kpv0ONP14ffD9Vr15W99sdJ9sEGRHcI+N4V
 lUX8Xfseln1IK0CxX8ByuSVoiMLJ4LkE/la9CDnsv2LpHpHSgtNw+49C2pGVNcagsZD/
 jKK+MWAX5+A6uJrYScOU+E/5f4Il9jbsh/FVR9GxrOs2yWNsZCodr50c3e6+LtvA5A7Y
 C3NXLS402YwYNGAv37SHq8XhcfHVc8cxuXwSSEyuJxuWHo+mPrNCbtDOe78z4qk1u1Le
 gU0g==
X-Gm-Message-State: AOAM531rHJe7k7hXIoGDL5m/Fk9+ivwsWN1nrzblQdtU55XPrVT0lE4z
 zdQ8qX//GfLJCG9OQV0uiNUx0pTxf5QtjVFY6IhvAvHV8d8=
X-Google-Smtp-Source: ABdhPJwqEJWPj7/8thjmpMHwl3tdxAeENsyJxhdfjzd1eZ2UuMutpkIae9nhtLvPFscqlEI/qDkNcMCPsn4xn0Qr9HI=
X-Received: by 2002:a17:906:6949:: with SMTP id
 c9mr30730830ejs.482.1605195464150; 
 Thu, 12 Nov 2020 07:37:44 -0800 (PST)
MIME-Version: 1.0
References: <20201101133258.4240-1-peter.maydell@linaro.org>
In-Reply-To: <20201101133258.4240-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Nov 2020 15:37:32 +0000
Message-ID: <CAFEAcA8ypMwheOKZ5MYdjNK8osD98n5eFVFHb9Xx2Dsd2=1Fsg@mail.gmail.com>
Subject: Re: [PATCH] hw/input/ps2.c: Remove remnants of printf debug
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 1 Nov 2020 at 13:33, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In commit 5edab03d4040 we added tracepoints to the ps2 keyboard
> and mouse emulation. However we didn't remove all the debug-by-printf
> support. In fact there is only one printf() remaining, and it is
> redundant with the trace_ps2_write_mouse() event next to it.
> Remove the printf() and the now-unused DEBUG* macros.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org

I'll take this via target-arm.next since I'm putting
a pullreq together anyway.

thanks
-- PMM

