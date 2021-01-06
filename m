Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A62622EC0AB
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 16:53:38 +0100 (CET)
Received: from localhost ([::1]:36010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxB7x-0007oK-7O
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 10:53:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxB6L-0006mM-ML
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 10:51:57 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:43365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxB6J-0004RZ-L4
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 10:51:57 -0500
Received: by mail-ej1-x62f.google.com with SMTP id jx16so5583802ejb.10
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 07:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zY2zsmEx0ULg8So7yv9tggzNieN6Jy2zjE+Hd0SH2lo=;
 b=yePLbs+UggXhedVbaBj0+jUZpuZdphGrLkoLfgeRpHH9+5X6u3wZR0UqZT8CpNfyOX
 5QWZlPlziqNhNsADQGLboP96USRpOcnKnpnR/P/EPDCIM4C6l+948amsdy8jvTYy049O
 P74ESgNdEVXaeGBOCJGQ+pVTCBDJLxoC/ezcsb9MVo1csj5qrtoZK5IAqOceV+/pinoz
 2QFQnT+FZRruKH2nM8/bAn9opbMaVyEcZVcywm7gI4WjXOSjT3aTXngvL1wrBCR1AHdN
 NOOjXFrMDscrppZLUtyfOarnbna7BEjkZtwD09PJwsiXhjoHCcXenLp+bRK53p94Y2gr
 1gYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zY2zsmEx0ULg8So7yv9tggzNieN6Jy2zjE+Hd0SH2lo=;
 b=Fs8voO9jJzRJHrEPNmGxi2Pm4P71slvPaOqLjbTZta0uYFGYrlr4uUuyHYUfMnLw83
 oUl++MNmyxV/xVaUeMtBXiWNnStlW1MZnGRi7Kqr3mA51ZEnm826pXnvjizp9GEaZMin
 itWSHgNpBIJZXLx6m2dyWIFV1AzUlsLvUZ+//nNp+YqGEkZt34xHTVVfwJJDsaen2qmN
 lR3NF7OyI10y4hY/q9v0cbWNTmUW/Z+qFTZMFcpi/Lesl0AJH1lhEUwTc0JpO+HJ8Iwm
 vntp5ji/D3WUmZwd+cYdLYHHQkL/jRAFXAjtYo1cbbuewy5CxDuAEzMuCmTyKkLyfQfT
 Pb6A==
X-Gm-Message-State: AOAM533OAxnKUSQNviB4uMMc6NbiIpJ8bHf1R5VwTdQv9na51kKjbYYy
 SlxAk3TTJ94bLmZayxQtZWSwvZwv6GSzOEFSq8G1rg==
X-Google-Smtp-Source: ABdhPJzOCt1VaL7pvXaH4sR2AzdceKR2Jofkjg8c2G6+6CjJ4LE+yuLJcCXKx4XvKuHY4HhlZVaO4KzAXonyrGEr7n4=
X-Received: by 2002:a17:906:195a:: with SMTP id
 b26mr3237556eje.4.1609948313782; 
 Wed, 06 Jan 2021 07:51:53 -0800 (PST)
MIME-Version: 1.0
References: <20210106120526.29857-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20210106120526.29857-1-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Jan 2021 15:51:42 +0000
Message-ID: <CAFEAcA8-DUxoZY6WC+XDrDLTRYn8o9L+uV3qXm0sVV23CrePPg@mail.gmail.com>
Subject: Re: [PULL 0/4] qemu-sparc queue 20210106
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 6 Jan 2021 at 12:05, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The following changes since commit 2e0b5bbe813930021b2baab03c9d424c1c52d18b:
>
>   Merge remote-tracking branch 'remotes/philmd-gitlab/tags/mips-20210104' into staging (2021-01-05 21:06:42 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/mcayland/qemu.git tags/qemu-sparc-20210106
>
> for you to fetch changes up to a879306ca14de576d3a5dd51f830ebf89753e223:
>
>   sun4m: don't connect two qemu_irqs directly to the same input (2021-01-06 11:41:37 +0000)
>
> ----------------------------------------------------------------
> qemu-sparc queue
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

