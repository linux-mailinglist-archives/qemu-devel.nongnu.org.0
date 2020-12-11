Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D332D7731
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 14:58:31 +0100 (CET)
Received: from localhost ([::1]:33598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kniwI-0006D9-Pe
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 08:58:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knivD-0005Mi-1W
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 08:57:23 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:36221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knivB-0007uz-4g
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 08:57:22 -0500
Received: by mail-ej1-x642.google.com with SMTP id lt17so12467523ejb.3
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 05:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=erxHkoXgdmItC8gUliN46G+5Vd7viBWnNfJtTmKeqFI=;
 b=MhI2M+CdC82H47HSWSC7PZAetoQY0vmbNiXsJoUibTP0Ir639vp0+wX5VQrXLgpAgo
 TXi7fJB35NKKgjpX2Gr1O24g0eUD+a84bLSo8dPjsv5wEaJ4Tm7oxCdPY5xipQI1WJ6y
 hF8ftF6kjMFh1zbEJispdkzGJKYNp+HyOKO/sJSFkqnUxBUSJiJuuoS7IGICt7HoAJd3
 v9e5rfOjqp4miiDyYsPvxosED1zL+VaPespSmZbo7stDf0AW5wJwD9sqHCwFPgE6faO3
 luhvXjdhIEGN2b8YdOh8SND8Dt2z4wFEm0Rz/Ja09w4kDStf5K4rhLjti8xpgm1WVvZi
 5+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=erxHkoXgdmItC8gUliN46G+5Vd7viBWnNfJtTmKeqFI=;
 b=rhhCjswq7mQp/8Bf0DN0C4Hooe7Kje92lG/IyBoFOpkAfmXwUlWygh3K0ge0qPTIx7
 W6DQ+D7IFL/fJU8UGThciljA1Li1lUMuul1hO8GRYNvI3mTg1YqPvPp+b9WBm0vE3hiS
 2MAN0A3wUzSNIOTJZltu7hGReFfRTKYJCd8l1ma82xwmdmEyzvqFyCpauzFmEdn7J/Yu
 cIvzDzX8FdAhjbbCTNh1bVYa6gNzHFjeCSPsELvE6/HbXgnQ01K377bwSwyFVGpM6G4R
 CNUnzwSDYlEXyjLxywXu82m/8pJIGrtzSHn0qS0Rba/r7+X5XOfX2scxbUrFXG8vz6oG
 V1Eg==
X-Gm-Message-State: AOAM533hEXBMCuKcBiRwFEJwLSa0oKEst+polwa8n/MlSxCCLcHNN06r
 BVwDQsDPFjTXifgJwdJrq5UtJKUZuAEVnJKzzI6ZEEHaWkQ=
X-Google-Smtp-Source: ABdhPJwu55PNOkIdjaymzh78t3PyvgipsaMZaWQh1lcuqoVItWL9+cjj6Dz78N4qKrYlFFGw2pFinTuW64Ep5syJgjc=
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr11316369eja.250.1607695039229; 
 Fri, 11 Dec 2020 05:57:19 -0800 (PST)
MIME-Version: 1.0
References: <20201127225127.14770-1-peter.maydell@linaro.org>
In-Reply-To: <20201127225127.14770-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 13:57:06 +0000
Message-ID: <CAFEAcA_aMpSR39tyLOt04ZfwRyWc3PQnvXgZQqd+yLEkynAkOw@mail.gmail.com>
Subject: Re: [PATCH 0/3] target/openrisc: Move pic_cpu code into CPU object
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
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
Cc: Stafford Horne <shorne@gmail.com>, Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 27 Nov 2020 at 22:51, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The openrisc code uses an old style of interrupt handling, where a
> separate standalone set of qemu_irqs invoke a function
> openrisc_pic_cpu_handler() which signals the interrupt to the CPU
> proper by directly calling cpu_interrupt() and cpu_reset_interrupt().
> Because CPU objects now inherit (indirectly) from TYPE_DEVICE, they
> can have GPIO input lines themselves, and the neater modern way to
> implement this is to simply have the CPU object itself provide the
> input IRQ lines.
>
> The main aim of this patch series is to make that refactoring,
> which fixes a trivial memory leak reported by Coverity of the IRQs
> allocated in cpu_openrisc_pic_init(), and removes one callsite of
> the qemu_allocate_irqs() function.
>
> Patch 1 is a minor bugfix noticed along the way; patch 2 is
> there to make the change in patch 3 simpler and clearer to review.
>
> Tested with 'make check' and 'make check-acceptance'.

Now the tree is open for 6.0 development, I'll take this
via target-arm.next, since Stafford doesn't have any other
openrisc patches in a queue currently.

thanks
-- PMM

