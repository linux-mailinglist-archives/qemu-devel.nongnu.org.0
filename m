Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDF5559D1A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:13:46 +0200 (CEST)
Received: from localhost ([::1]:37286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4l0D-0001Fs-8M
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kus-00080Y-Kd
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:08:15 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:46700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kur-0003EJ-0T
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:08:14 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-3178ea840easo27258267b3.13
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 08:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uhAsNFJZuMxj5B48U52b+UW+vDqOA5FhHGh+CM8j8hg=;
 b=uoIX1B8Jl4wIJydiu0aq0xwqG+Js58omJPQqJcokd5ltBykNC5lR4XWynsrTs32Fsu
 GgVB1aWuaWF5xABMP6SxXI376YdiIWtVCCZIKmz3cajBolTggUEj4FI2lXl7uF+R8GD5
 uzMgrw485E1OeLYS6fqOUwbEfsHWwByL3Vgi3++agsn+Xbr0YbBdVk1OroIV+HnFO5Ny
 pTuD1oONZNCpJtNpwSX6+hpQti8Vviptk1zayvrjZ3vQaPkwcllYMSXXdiEO02L4bcOk
 5M8VaXuIAOfwneticuxMcccVA4qEyGikb9rMwkG217rrYyHND7Ncre3pn6f6dtPYZPNg
 5C0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uhAsNFJZuMxj5B48U52b+UW+vDqOA5FhHGh+CM8j8hg=;
 b=2FCfexlCK22746bkuAAd94luKMc/q8cVJeYkB2ayerFyEQWWriZQPzXBsx5vJybudk
 NMFiXmDfxF4XQEE0Nnsk2HiQqYW3af5gBAE7jB33o3fXtHRxsnR1r9oOzZWHm9J9WxG+
 hwER0g07d9zxzN1E5/GnpYm5yfLK9ECE5zU0Ibcm2LfyKu17lsaZSSQ+znBJOsnTShw8
 kqMwFB74WVfCsXbPVJr1vf0lu3tgkG1A1dpM/BH8zyIEgbrudQTQ1ugXdCh0Jev7JsLF
 d6/L/Fk4tELKjtcvpYUOefQF9Io/gDcXqDzQ9r8JfIbbg3zTlhIAvUj8PDZ2SdpJdil9
 IHPQ==
X-Gm-Message-State: AJIora/1ze6Beo9FYpamYKfaU503M8NoAA4TBdA77qEi7GZHDSkRuT0X
 6WxOd6crojDAfQDy1Nfk9nDAoRC6Nx0GoYzD8PSETQ==
X-Google-Smtp-Source: AGRyM1vog5mu85ByI/8mr+uRiavh6YYLq3Dhmy9xHMYkguCjZJ9FGlcYcRgChWcFO2ZfqKV0ppUeQ7TSFgdSKiJgwEI=
X-Received: by 2002:a81:8486:0:b0:317:a4af:4e0a with SMTP id
 u128-20020a818486000000b00317a4af4e0amr17582259ywf.455.1656083291822; Fri, 24
 Jun 2022 08:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
 <20220624134109.881989-27-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220624134109.881989-27-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 16:07:34 +0100
Message-ID: <CAFEAcA94MB-kH7ixzPz046KH49=a-JcL5yDue+zh+z6Mfnp94g@mail.gmail.com>
Subject: Re: [PATCH v2 26/54] pckbd: implement i8042_mmio_init() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, 24 Jun 2022 at 14:42, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This enables use to set the required value of extended_state directly during
> device init rather than in i8042_mm_init().
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller <deller@gmx.de>
> ---
>  hw/input/pckbd.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

