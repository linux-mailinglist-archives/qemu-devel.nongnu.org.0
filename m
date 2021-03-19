Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 294A3341A2D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 11:37:04 +0100 (CET)
Received: from localhost ([::1]:42192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNCV5-0007JC-8r
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 06:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNCUB-00066J-GA
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:36:07 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:34589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNCU7-0005f4-Jd
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:36:07 -0400
Received: by mail-ed1-x52f.google.com with SMTP id y6so10174090eds.1
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 03:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GufcECr4mtD8y5rvmA/2Z4lvHMT1MO/VWODA9HUx4kM=;
 b=azg4CIlELdG56SczWwmlUG3h8SiwYSVmELnrKU2qFClMpyeFITChE+CCPxVsYFv8Y5
 QDFTeXy6u1O1EOd7snWUam9Q6FZc5FIOZglgbusRJHZpV0AAMEp+jOhw0FfqAzPwsDYi
 gFIQw/WhkvafHFiNs3zNUdWAyXo3j5QVgVx7dMHo9GLVFA3EiIAV3lqn+YO+BoyW2v2k
 GUY2U7UFr75CK43z1pMGoB4zyY2QOQkNUMW56JWPlHn1MY5f4Z6CCundLwfELHOEJNl8
 FzOqt2deMJESZjlHD2DiaHFaTDcVtZ0f8cCfOyWXVQaTz8YO2DnrqH2q1FjBxayoqDqV
 FT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GufcECr4mtD8y5rvmA/2Z4lvHMT1MO/VWODA9HUx4kM=;
 b=kRm3iTbf5Z3eD5fxIVgbG16baMgFbGO0+H1IlJC2AvvMqOCcDc3kUe/yk5k9DZIEbU
 yr5BgY/RIrqhhGSNk3tHUKrVUb7Vp6ggEX7nVlylNg3W1Xf6IvctksNoP8clh1a9OvPx
 t+wMQQBfTYR68gVoLSRX+kMixlM6psQ1XrWmi15hbxw5OgRHQtqC9qmaXrRTp3IAHFLk
 vBNM+ncmMbULs8GyMfz0RMHBAv3WvQ/Ok6lXBxqVkANdyvmruRztZAYzZaJgybFrlU7A
 E5ruuE/gc5eJ2egzH/sO42RghtHpWEc4QHD4phInynFPvdRxm7J4jSs1QwV7cyRYwubk
 NpUQ==
X-Gm-Message-State: AOAM532o8E0z+v3mDndfsJwzaV9HFjfS4TMKTndkXqBEHsrBD2XbmmgL
 rRejvgZjducswbf23aWie4I7iKAh4YrZUFWad0Va5Q==
X-Google-Smtp-Source: ABdhPJyMVZb1z6SgBFLHZgciqcT9JzggGRPctZslJxMVVZsiVcHv539eHn5wGvGGpKNMcgfRCzTupgv80Ds7XPHMkF4=
X-Received: by 2002:a05:6402:1713:: with SMTP id
 y19mr7593741edu.52.1616150161825; 
 Fri, 19 Mar 2021 03:36:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210313170131.2116837-1-f4bug@amsat.org>
In-Reply-To: <20210313170131.2116837-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Mar 2021 10:35:36 +0000
Message-ID: <CAFEAcA_RYO0yqKvBk-VuJTkbdC+ZOFb0m+h7ecEeEzjpHndZMw@mail.gmail.com>
Subject: Re: [PATCH] hw/display/bcm2835_fb: Remove DeviceReset() call in
 DeviceRealize()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 13 Mar 2021 at 17:01, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> When QDev objects have their DeviceReset handler set, they
> shouldn't worry about calling it at realization stage (it
> is handled by hw/core/qdev.c::device_set_realized).
>
> Remove the pointless/confusing bcm2835_fb_reset() call.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/display/bcm2835_fb.c | 2 --


Applied to target-arm.next, thanks.

-- PMM

