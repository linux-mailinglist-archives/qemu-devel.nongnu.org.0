Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E183143DC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:35:48 +0100 (CET)
Received: from localhost ([::1]:36826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9G4J-0006kI-Or
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:35:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9D3P-0001Sy-R2
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:22:41 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:40198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9D3N-0004lk-BZ
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:22:39 -0500
Received: by mail-ej1-x62e.google.com with SMTP id i8so27320777ejc.7
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 12:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XHpyWSpQwFZpE0QtFaiGrMasCpZLkqhY1AZGZa9GW+s=;
 b=F/khAc1q6YZDVI8crXsa8HqawqOm9R0BeXxEDaPK76fIydHp9I4KSKjD9QH7kXzFJ9
 vKKOUSb78E5uj27UFNyJlOw/yuqqNMwWjZwZAvK8kpgjYijAu3+ONe2Iu7H8u9s263Wt
 So53mZlT7Sqji8dTDmivEF0dGmt8qNJEN8gNeGsAPrahHYJKUruxMxTxA3wi5NONwl+i
 g0OzZTG3NnIRzNPCMyk06E5eEZ5IberO6awYHqvFHUVjUyIfqwNSADG291uQFUabylCR
 opYg3n3KbZgxeWpMMo9wX73GqeidJzQ1YDZosRT8K/X953iC10SWz5IhbYBGVkhOb+CJ
 VQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XHpyWSpQwFZpE0QtFaiGrMasCpZLkqhY1AZGZa9GW+s=;
 b=HoResUMSk1B4ZcOuvEWdSKjOMAO8Ia9c9wN2M/uNv7L+bPgshjr35VRRt70WuiZrSg
 EEpRvljtMBi8P06s0RdN+EwZJ02YlPnEG8yKjhV6tXZjSr/cER8DrdGTGgLGsLEkB1em
 KlhJRTHCiU280897WyvhxqmE60LYxhVovmvH1K0a7qdbnpazIjXcnKV51tIn7OUBJlN9
 zRGVRjvaPvO8Ww+lOu/Y/tjaONRLMptQQHe5gTTqwgn2v+1V8djVf2wCQEBvxsLENM+r
 uvsPUK5gly9iG/aRmVgaQhp0JOBOPiSquF7g09U4pD+unAu+bgmXdiWJueNur0fLMU1p
 Hpgw==
X-Gm-Message-State: AOAM530QOvca1v4P4yhLpifXkcox3HngDHv/xBG35jzKus10A+nQ1j7Z
 QKjnD6AYUxkc5JHEWR11Inj78Ue948I9GTtsIpeSQg==
X-Google-Smtp-Source: ABdhPJyyJ5y9HDJZdp/+MZuwIT1y0fbQroUoCBpW1gu+ixQwalEN4s5QlkKFUMjfygDIhHsZTmyp2QqcSzOw14PU21Y=
X-Received: by 2002:a17:906:184e:: with SMTP id
 w14mr10162546eje.56.1612815755816; 
 Mon, 08 Feb 2021 12:22:35 -0800 (PST)
MIME-Version: 1.0
References: <20210208135048.2601693-1-f4bug@amsat.org>
 <20210208135048.2601693-2-f4bug@amsat.org>
In-Reply-To: <20210208135048.2601693-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 20:22:24 +0000
Message-ID: <CAFEAcA-CYk2XpngH_r3adYmb2t=39wfJA0pae8jmcOPCgofOvw@mail.gmail.com>
Subject: Re: [PATCH 1/4] hw/sh4/Kconfig: Rename CONFIG_SH4 ->
 CONFIG_SH4_DEVICES
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Michael Walle <michael@walle.cc>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Feb 2021 at 20:04, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> We want to be able to use the 'SH4' config for architecture
> specific features. As CONFIG_SH4 is only used to select
> peripherals, rename it CONFIG_SH4_DEVICES.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/block/meson.build | 2 +-
>  hw/char/meson.build  | 2 +-
>  hw/intc/meson.build  | 2 +-
>  hw/sh4/Kconfig       | 6 +++---
>  hw/timer/meson.build | 2 +-
>  5 files changed, 7 insertions(+), 7 deletions(-)

We could if we wished be more fine-grained about this, eg by
adding new CONFIG options for each device:
 CONFIG_TC58128
 CONFIG_SH_SERIAL
 CONFIG_SH_INTC
 CONFIG_SH_TIMER
 CONFIG_SH_PCI

and then in hw/sh4/Kconfig
 * config SH7750:
   add 'select SH_SERIAL', 'select SH_INTC', 'select SH_TIMER'
 * config R2D:
   add 'select SH7750' (it's a pre-existing bug that it doesn't, since
   r2d.c has a call to sh7750_init(). Harmless at the moment because
   nothing actually uses CONFIG_SH7750 -- hw/sh4/meson.build always
   compiles sh7750.c and sh7750_regnames.c unconditionally...)
   add 'select SH_PCI' (and make hw/sh4/meson.build build sh_pci.c
   only if it is set...)
 * config SHIX
   add 'select TC58128'

Do we have a general preference for how fine-grained we go with the
Kconfig switches ? Looking at the arm code, in some cases we have
a CONFIG_ for the SoC that uses 'select' to turn on a separate
CONFIG_ for each device (the STM32 SoCs are done this way), and
in some cases we just have the meson.build use the SoC's CONFIG_*
to control whether we compile its devices (the Xilinx and Exynos4
SoCs are done this way). When reviewing new code it would be helpful
to know whether to suggest doing it one way or the other :-)

thanks
-- PMM

