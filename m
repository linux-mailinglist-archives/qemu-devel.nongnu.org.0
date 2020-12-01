Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 876EA2CA3A2
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 14:22:49 +0100 (CET)
Received: from localhost ([::1]:51464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk5cG-0000bo-KG
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 08:22:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk5Zo-0007aA-UT
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:20:18 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:44441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk5Zl-0003WF-4b
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:20:16 -0500
Received: by mail-ej1-x633.google.com with SMTP id m19so3983218ejj.11
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 05:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gz3Yrc58M4FtyxWzRR++tVGnggJzKQwpyPxOjGb90Kw=;
 b=eWTomMMU4RXwHoLORmSoH2GZ0LkSwU1B8oYuBMoKt1UYxCyNOIOv0xUu5d1LHnbJas
 jRDB4HRzBgr5lUA86g8K5FhXq/VIFs66ewH1HUHNVEmuQJsHmJ74c8StXkakgkBZlItU
 f+/3sTCIc4n0zRG2XjW4allMkqBwPTi60xJZcccwP0x+OBxOsoIM5qtdAqnECkY6tlOF
 5DRuDC7Xev6Li7RUE5Ht5/everdeVQZgBP5TVWqRxLZnRPfswF9Bk5mnrfz3YsOVrff4
 bUwu6cCvXiI20w5oDt2qnNrwIxSLRMIgtiZvm5lhORS/Eb3YoReixTchZcOq2oG0B8WD
 fx1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gz3Yrc58M4FtyxWzRR++tVGnggJzKQwpyPxOjGb90Kw=;
 b=ZyUIGmLOSsiO5qYxFi2NWJEPJS4AWQDlUJEHoZ1CBa3/5lHt/wH4A+khV2nhGzoJYS
 UKn3KV2SGQKjDz1cWuIvThADMpn1YlqrZ0t0zOQAriXYWGFVBpnkUMeE8gEM6yvR50AB
 is8JVIJzixMb9mKcoHA3KGTsREmalu/4TWCrt4fJqR3KJwfGzKpyzBM5GcRxoLR3eo3S
 fFTQxatW57ebNSW5bRPgadelkc0EFgPKrVjrfKljwoNnxPOGyOBwQqFQQ3os7/W7hGOo
 yFD+mg7EGWc/PsYho0Q5BortGPytZP25NWTAiZOV0QPQwLy7cSRdU4Iuux+UzI2JHS+2
 ly6Q==
X-Gm-Message-State: AOAM530hex1S4hEzkQTmkY8gaj2GGVxMuOpiD32ctNfxCAIvU3H7rT7m
 hHtPbFzK5pFtAlvvIk/jSM8HLRZNVaEJo+drHyQjmA==
X-Google-Smtp-Source: ABdhPJw8/hCDpPqHlUqxlZORSqIk1GUO3Ly/i1+m1SqiawUFGBvQHSLbwXIsgTfVVbTGLDtxY1BHvpOFz/7eGAb0DTc=
X-Received: by 2002:a17:906:2741:: with SMTP id
 a1mr2953125ejd.85.1606828811455; 
 Tue, 01 Dec 2020 05:20:11 -0800 (PST)
MIME-Version: 1.0
References: <20201124094941.485767-1-f4bug@amsat.org>
In-Reply-To: <20201124094941.485767-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 13:20:00 +0000
Message-ID: <CAFEAcA-cNX85Qkc_-ZNu5hxY29C_msHUm__J0-Ac4nodhFYGDw@mail.gmail.com>
Subject: Re: [PATCH-for-5.2? 0/4] hw/arm: Add SD bus QOM alias on the
 machine/soc
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Nov 2020 at 09:49, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Easy fix for LP#1895895 suggested by Peter.
>
> As TYPE_ASPEED_SDHCI creates SDHCI inside a controller
> (not a SoC/machine) we don't bother modifying it yet.

So how on the command line do you specify plugging the SD
card into one of the new aliases?

I tried (with the sabrelite machine):
-drive file=3D/tmp/sdcard.img,format=3Draw,id=3Dmysdcard -device
sd-card,drive=3Dmysdcard,bus=3Dsd-bus0

but QEMU gives the error:
qemu-system-arm: -device sd-card,drive=3Dmysdcard,bus=3Dsd-bus0: Bus
'sd-bus0' not found

Maybe my idea about the aliases turns out to be wrong ? :-(

thanks
-- PMM

