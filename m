Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C38430C585
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:28:24 +0100 (CET)
Received: from localhost ([::1]:60300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6yXP-0002at-BJ
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:28:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6yIK-0000I2-SK
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:12:48 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:41424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6yIH-0001ZB-PD
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:12:48 -0500
Received: by mail-ed1-x530.google.com with SMTP id s5so10654569edw.8
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 08:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3Z35U0jqq7f51s6wUa4I2AgwKVAY0oS+XX6xxqFC5QE=;
 b=BKn4FjPvaLur8I8Z7H1EFeTBMbA2wllJpF6ooAuKqoNVKJ+t7ZVYUMxhJh/baDyK/3
 kna7qChBIiTUJrZQaxPxB6WttIyZ7fGlJpyITWawb+q0XbqctDf1Cneivt6r04SUait0
 UqmpfzU5CVF0S9mUC9pJrVncLLv/TOi0lOmZ8BvOfIQLc3YGxlSeJL59niQ8FkCKnmQQ
 nfhuYtDcJqUxRfn52+7m6DErn4WZsZXLX3z40UaWMtfqBeSlpOgfa4IAzMK3nFhdI5Na
 VDteqbsokUNOTz3GqNuMYSyK/mA3D4nqfMm9hM1ETbY+8UOOSqL7NW4HFyybbuiIN53u
 047g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3Z35U0jqq7f51s6wUa4I2AgwKVAY0oS+XX6xxqFC5QE=;
 b=eLr7qIbvPtfvNDzC8rMNh4ptmGp6I+XcYrOQpr6pf6Ue1faL72AD1Y1RoQryjS+ehH
 pvVeMvQjekkcirhKPUyelDoIoqPM9nLXStlTa755vXHURuvIB7O1xr2rnZEgW0/rjeyM
 uAFy9Q2eoTQK6DAwsiwHAY74hOWC2ocn+rypOjG1ec4CD+anu4QyjkYD//Q6CqBcDJrP
 vds0y0s195fdl+pMI/1b4F0VKsqupDehVdEB1WageACZIJaFl7oMo0wakJjAyIhT4rVn
 rAuGteFDP0VXhRtvxf3JKUgj3c+D0Zj3qznpDz4V/96mGgnJWBqshLEzmcY/aV3xRU2p
 xhQQ==
X-Gm-Message-State: AOAM532dPJ6Vi3k+xOuATlQChosLm2aitrPMs/T+s0QDryMNZPrlhzrw
 oHghsc2Tdi5eiWzzN7DcSbf4NfPUUgPzgWvhoHmfDA==
X-Google-Smtp-Source: ABdhPJwa6XDyQBK0iO2n9WQBfnZ5KmsfHNOPya4Z4+rK3U5WSY/SdcMnDZL7emywmC2gK+fol7lMV0UDL2fYoATh7Zo=
X-Received: by 2002:aa7:c88a:: with SMTP id p10mr24314030eds.204.1612282363875; 
 Tue, 02 Feb 2021 08:12:43 -0800 (PST)
MIME-Version: 1.0
References: <20210131164406.349825-1-f4bug@amsat.org>
 <20210131164406.349825-2-f4bug@amsat.org>
In-Reply-To: <20210131164406.349825-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 16:12:32 +0000
Message-ID: <CAFEAcA9TwSMpVq366ZDU9NZDs7enY4RNAWj=PPK48rk-ACnd2g@mail.gmail.com>
Subject: Re: [PATCH 1/5] hw/arm: Use Kconfig 'default y' syntax instead of
 default-configs
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 31 Jan 2021 at 16:44, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Machines can be automatically selected using the Kconfig
> 'default y' syntax. This change allow deselecting these
> machines without having to modify default-configs/ files.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  default-configs/devices/aarch64-softmmu.mak | 3 ---
>  default-configs/devices/arm-softmmu.mak     | 2 --
>  hw/arm/Kconfig                              | 4 ++++
>  3 files changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/default-configs/devices/aarch64-softmmu.mak b/default-config=
s/devices/aarch64-softmmu.mak
> index a4202f56817..a94c7786919 100644
> --- a/default-configs/devices/aarch64-softmmu.mak
> +++ b/default-configs/devices/aarch64-softmmu.mak
> @@ -2,6 +2,3 @@
>
>  # We support all the 32 bit boards so need all their config
>  include arm-softmmu.mak
> -
> -CONFIG_XLNX_VERSAL=3Dy
> -CONFIG_SBSA_REF=3Dy
> diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/de=
vices/arm-softmmu.mak
> index 0fc80d7d6df..7d55c156bab 100644
> --- a/default-configs/devices/arm-softmmu.mak
> +++ b/default-configs/devices/arm-softmmu.mak
> @@ -3,14 +3,12 @@
>  # CONFIG_PCI_DEVICES=3Dn
>  # CONFIG_TEST_DEVICES=3Dn
>
> -CONFIG_ARM_VIRT=3Dy
>  CONFIG_CUBIEBOARD=3Dy
>  CONFIG_EXYNOS4=3Dy
>  CONFIG_REALVIEW=3Dy
>  CONFIG_VEXPRESS=3Dy
>  CONFIG_ZYNQ=3Dy
>  CONFIG_NPCM7XX=3Dy
> -CONFIG_RASPI=3Dy
>  CONFIG_SABRELITE=3Dy
>  CONFIG_FSL_IMX7=3Dy
>  CONFIG_FSL_IMX6UL=3Dy

Why are the 4 boards xlnx-versal, sbsa-ref, virt, raspi special
but not the others here ?

thanks
-- PMM

