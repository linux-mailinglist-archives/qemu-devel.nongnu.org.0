Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B4D2FA651
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 17:34:28 +0100 (CET)
Received: from localhost ([::1]:38116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1XU3-0003Lv-57
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 11:34:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1XQm-0001z8-TG
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:31:04 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:43714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1XQj-0001Q2-BP
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:31:04 -0500
Received: by mail-ej1-x631.google.com with SMTP id a10so7889099ejg.10
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 08:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KHDR9AoyqNQgSLghH83t8jh8D3FsnHz2a9SjFqwNyBI=;
 b=CbJcWpP721eqPAtDF1o4XpLeVq6yLSdgTmLrcosvonvOdg2TecO8g9xlB/5NWjx7Oj
 GjOJfIh2hfaXYBtvccax4gAl1Lw591qX8DYVEUbSCZKpkxkZ2/lihb+saFM3wMgOHpSe
 N7u5rjUfbjtQQmivFgrvrBVfc1ZYtrl+8vwsj4S2BytO/rl/K5l+tZx9Nj2rE1Y9i/Uj
 sa1DqcJYwCO9WEWggS65GT7jb3xV52HaX1asB6dqLr252OlXQS6crnIVwuDej/eBznqd
 4y4VGU70OsKKQsG4Sg/y1eNSeFOgh0Ldx4tj0pFE7Ii2UD+qSXrmHWI1jBwIcVSsPAWS
 UElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KHDR9AoyqNQgSLghH83t8jh8D3FsnHz2a9SjFqwNyBI=;
 b=WBM99SlgX1pVI18km0x0/yxClapfpy/bcET0vYwVugYt25BFCI8tALSILznHmRv9bi
 4/brN+IP5JmzbAzfhkL6V7uXJBpyoETj9pyLzqKvLrM+WxJ+RgAJFztNw+XfD0qpGTDt
 Co9TBP05OIPpQHBHY7ARrfEgSho0CvFdRdG/yWB2UGMXp3b92vWYUni1qmz+nTx39tZt
 gjf2cfM515rVJQNGGZJImMrhYUZzU3i9gffZJjzV8cybNfp9fAuhryVMts01n5MkK4iZ
 oK993AWsjiO5sRUVuz5r9O9cwtyOwmafJPCAS/eFxWG0JFIUXfNswVN3dd9ffNZGBdUu
 PWhQ==
X-Gm-Message-State: AOAM53280bDFcXTR7PHQYsXix0UY/MEs6rFY9AtjiZtNkSEs/R0/zIf4
 KPevSPbokpJpiAXcK48ILE/FsTz2leMs5XxarMdwhA==
X-Google-Smtp-Source: ABdhPJzAJItOl6oeJB0UNA1uJN9AXKg62jCE39h12D3V0PjE2cVMiWHIXyj0zaYEQLnWZ5p5z85IjkkGwLGk8wv8DQ0=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr353593ejd.250.1610987459636; 
 Mon, 18 Jan 2021 08:30:59 -0800 (PST)
MIME-Version: 1.0
References: <20210118113205.1915888-1-laurent@vivier.eu>
In-Reply-To: <20210118113205.1915888-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jan 2021 16:30:48 +0000
Message-ID: <CAFEAcA_Mq5rAimG63fVX7tbJ_S9xvFJ3b3nTMhS2W_gbo5PKXA@mail.gmail.com>
Subject: Re: [PULL 0/4] Trivial branch for 6.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 18 Jan 2021 at 11:34, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit e0cbcf1eea16e81f116560130a1b36da711fb102:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (=
> 2021-01-17 17:04:40 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-for-6.0-pull-request
>
> for you to fetch changes up to 580e733321511ab4eda7d6ca14ca157d71ea8728:
>
>   hw/ide/ahci: Replace fprintf() by qemu_log_mask(GUEST_ERROR) (2021-01-18 11=
> :51:26 +0100)
>
> ----------------------------------------------------------------
> Trivial patches 20210118
>
> Fix memory leaks
> Use qemu_log_mask(GUEST_ERROR) rather than error_report().
>
> ----------------------------------------------------------------
>
> Gan Qixin (2):
>   pl031: Use timer_free() in the finalize function to avoid memleaks
>   misc/mos6522: Use timer_free() in the finalize function to avoid
>     memleak
>
> Philippe Mathieu-Daud=C3=A9 (2):
>   hw/virtio-pci: Replace error_report() by qemu_log_mask(GUEST_ERROR)
>   hw/ide/ahci: Replace fprintf() by qemu_log_mask(GUEST_ERROR)

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

