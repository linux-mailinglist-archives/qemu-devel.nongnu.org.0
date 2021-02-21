Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 759FC320DAF
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 21:45:18 +0100 (CET)
Received: from localhost ([::1]:41508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDvbR-0001Fh-Hd
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 15:45:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDva9-0000QO-5o
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 15:43:57 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:38497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDva7-0000lQ-FK
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 15:43:56 -0500
Received: by mail-ed1-x534.google.com with SMTP id s11so19414229edd.5
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 12:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=o1UKe/QttkkB80KVffrH9Veiv+rWAAtX9Sp5KxDcYl4=;
 b=RV/J0tmQSHNMr9p7KpcwdJk5WgrQy/kEuANZOHkgUYY0vRc4T3sco+9Tfn1KlMJKh8
 vOVVCz8iVqGh/Dam2wvcb1/mlmNFB8BubI+VbQBw8Y8AXvrxMRb0ObL0VoIqdE8ccbQ3
 rmfD1d4u8lXaMmwWs1RipjUg3wkx4RJtZSyfZ7qE0bvigh/AxrS2X4B3wDzLglE+sgXk
 zDh4MjE/mCDNNlJsLuETYe1Qh3zvIDr9SZQkAufNEra3NTK/ftfCUGACCg8f6ENU9+pp
 IaZXJ/kf8D1hwCSt7naNEyvP4qOn5cQMq6ZQnp2Leqe2eqY8AUE56ZBFpN6elxkfdwT3
 xH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=o1UKe/QttkkB80KVffrH9Veiv+rWAAtX9Sp5KxDcYl4=;
 b=tO8zqd5phfepNSENhs00aXYuO9KmotGHIvmZZUfSxhq+yUvmMSYX8UpOMQpUBp2AJx
 VQ0ej5JaizIQmlQsSt7X70+zzv0WYI5vUAAjHCE5oN4xLcw21hY2/kH+icidOAsLa/WP
 Zy5wTMBUgyGhvWgnnBPGFeZN0P+XtePuwh8f6WNKquAUZjVMToX0VoPCDeQ2FUEPyGFi
 5gzij7NrIawSswskEaXb94GSDQ8IzDtrtMSppmWRAcx9phNO2FJTG6LTk5eS8tfSevvG
 ANsJYD36wL45E4MMbPFAzsDe1JAWiIPIuJQbgPZ9vX/FVsHF8AXiLhE6a18bpEdX4rwq
 dBUA==
X-Gm-Message-State: AOAM531T5PxXbxF5hdRtkUqIYcL1GZxRj1N0h3JyGAOlFtoT38uv1B8k
 J0aXz3SJCdAS41Tdrwf+gj4Zi7XpgZuEoliJCOD/IQ==
X-Google-Smtp-Source: ABdhPJwi6u/dT/g2MufL+3nHHcApCFxYhaliEmvh2I4U3OBA0Eyy9kDoLGtcXuKe0m217d10sp+XHR+BqKHTLnGmz3o=
X-Received: by 2002:aa7:c144:: with SMTP id r4mr7417909edp.251.1613940233616; 
 Sun, 21 Feb 2021 12:43:53 -0800 (PST)
MIME-Version: 1.0
References: <20210221200249.2536247-1-f4bug@amsat.org>
 <20210221200249.2536247-3-f4bug@amsat.org>
In-Reply-To: <20210221200249.2536247-3-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 21 Feb 2021 20:43:42 +0000
Message-ID: <CAFEAcA8jY6x2_4NXZZmOpy2SBNJQ=bE_XFH8M24jxjo+fEiokQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] hw/sh4: Add missing Kconfig dependency on SH7750
 for the R2D board
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Qemu-block <qemu-block@nongnu.org>, Magnus Damm <magnus.damm@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 21 Feb 2021 at 20:03, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> r2d_init() calls sh7750_init() so depends on SH7750.Harmless
> at the moment because nothing actually uses CONFIG_SH7750
> (hw/sh4/meson.build always compiles sh7750.c and sh7750_regnames.c
> unconditionally).
>
> Fixes: 7ab58d4c841 ("sh4-softmmu.mak: express dependencies with Kconfig")
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/sh4/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/sh4/Kconfig b/hw/sh4/Kconfig
> index 4cbce3a0ed5..0452b4624ae 100644
> --- a/hw/sh4/Kconfig
> +++ b/hw/sh4/Kconfig
> @@ -10,6 +10,7 @@ config R2D
>      select PCI
>      select SM501
>      select SH4
> +    select SH7750

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

