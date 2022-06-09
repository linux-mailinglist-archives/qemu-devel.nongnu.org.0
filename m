Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6707F544D8F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:26:10 +0200 (CEST)
Received: from localhost ([::1]:41314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzIAr-0005Ie-Do
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFjF-00032z-E8
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:49:29 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:37517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFjB-0005Ma-L5
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:49:28 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id r1so12516183ybd.4
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 03:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L1l2AkFeu+46U5Eyndc4iecTzpW3aS/bGOrPHDFYJqQ=;
 b=KGvl45rNXTpuFr0aX2YeKlojBV84v2+/vY0pRUILeRr7whZIek/T4IGLO3Gl1VrcLt
 j7pPbwSx/KBlSzVWesTZOZNns9cWYvRdcud6VZ1vCvIP7QvQrfoncc+lUTZrMlL1w3bv
 +XgjjcWxI5Xc1RBdMuhUMOOR0r0WswtLt3Nu2+pI9BL3b3jhJvvd6O/HmGF1CTgTIMV0
 bJKVTftckaQ6UD9s/UgdOhH7ypVJNGDKOSrePXE5akcEWgdh9q1UHoxwLbG9sxkWNX0n
 E863/mVsS1NwqgIpjUa4oDAqWuafUAExGRZTfHKiu9sDIW2jd9jO/qQTND815ZMMt6+V
 HNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L1l2AkFeu+46U5Eyndc4iecTzpW3aS/bGOrPHDFYJqQ=;
 b=ntv0mdCfJPtxD6KPdnNNCrjx2HCnZ7gSgQgTk6g6FFfqPtqanBGrg2m3jbu45a2cWb
 6g96JWnF+6PgD/Dd8Dc9oYtuaE7FUQ/j/b095zb4WHA6eA6DjNB6pi92iXeV2ugvxxhr
 KLdrjQW3H5Z7N9l5ZKsg14CkIy+w9RI0+djin9aKjfZbd9spcNuryoHPB6MDicTzVlhj
 ddSgHMAJo76qKrF9CdHbphxqgjrk5yd2h1ld5idEtamoglMD3633f8sByuij7eRsRhDO
 Ry319dLzoKFqewjPW0by+4fioMjgdY+c1wo31rvDUkqV4Wf8a54Q2diZRI5nzJWtmncf
 bJgw==
X-Gm-Message-State: AOAM533yrBhAJdlmmzbRWRcHlO3+DTeF/xo+Uq4F295f7LPjTsEiolzC
 ZQfR9LYRHuPfroNvyvAiM51rAiUqtHaA/azt+X3cLQ==
X-Google-Smtp-Source: ABdhPJxQfDSOjqjpnQRoRRRRALHzvgKq8GsqBw1CLjRS0P9ht2xKkX5JZ8YUajK/M9CF78/tv5McZo5t8EwUXseU28A=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr39616759ybq.67.1654771764515; Thu, 09
 Jun 2022 03:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-23-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-23-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 11:49:14 +0100
Message-ID: <CAFEAcA9UcEHGE0BL5Dz3mVC+T9Z4XrMidhxFGWR92sMQ-0rrEA@mail.gmail.com>
Subject: Re: [PATCH 22/50] pckbd: implement i8042_mmio_reset() for I8042_MMIO
 device
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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

On Sun, 22 May 2022 at 19:19, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This allows the I8042_MMIO reset function to be registered directly within the
> DeviceClass rather than using qemu_register_reset() directly.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/pckbd.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
> index bbdd3bc568..df443aaff2 100644
> --- a/hw/input/pckbd.c
> +++ b/hw/input/pckbd.c
> @@ -665,10 +665,20 @@ static const MemoryRegionOps i8042_mmio_ops = {
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>
> +static void i8042_mmio_reset(DeviceState *dev)
> +{
> +    MMIOKBDState *s = I8042_MMIO(dev);
> +    KBDState *ks = &s->kbd;
> +
> +    ks->extended_state = true;
> +    kbd_reset(ks);
> +}

extended_state is not runtime guest-changeable state, it's a
device property that's set at device creation time. So we
shouldn't be setting it to 'true' here, but instead in the
device init or realize function.

thanks
-- PMM

