Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 577EB307CBF
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 18:40:55 +0100 (CET)
Received: from localhost ([::1]:53200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5BHq-0005AL-Da
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 12:40:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5BAm-0000ZI-6z
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:33:36 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:34792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5BAk-00059C-NY
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:33:35 -0500
Received: by mail-ej1-x633.google.com with SMTP id hs11so9016065ejc.1
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 09:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=peCI9eHyva00w0o1LMwcOBAo1uSTfHW3Ms1naaOzJLY=;
 b=AMYszEzN04+I/ZpilnWiA0FYENYDEoOOsCwb0UVyEr3LvgW9U2cHyYKdsPv0X9f50N
 UASkhsBlTmx4Tkgtviyif9eSSgYK8phppoiSuXsV7C75D/Xn4Uss1DdTKg+0mnGcCUMz
 HqPp9hwySZfHW/eEUjtdgjVjyyG4IxGAf20jCE0pldMzQItOQIUGfD/cWDBcgaOgrZXC
 Op8Of18z6QhCAaXHp4uxOGC8JTTyzsgJWD2GbXzrnOs6F7A0qpWEJJtCdxod9DTWLOzh
 CksK92RqesoE9NzJngjfq8vAScoDKhGWNgbSas1+22vIP1e0mUY/p0yk5I8qJyJ25zav
 KWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=peCI9eHyva00w0o1LMwcOBAo1uSTfHW3Ms1naaOzJLY=;
 b=gySZ3obw3yGoCgUQvwUDO8LfVW4QHmepMyBIPu9b8/NSQjiJYTmq9x1E70n7gxGWgJ
 tjJw799PHzfq5O/yrKcMjMThAt9wvlxI1ftnMsiN6nznfymE0kpwF+S9lTbJx4pi1IRq
 /zjcAe6y+KQzCt6NW7/DI8yJ3S8nqORDpK/awiTlgGkeS0eFYHgKSpTeV2Lk9sZ6hOOh
 NB6LT+oI/CkOXEBsCRmH69f3qoJA+m1RDsp5lEMhoJhd40RGT7KLWTC1Lm4juxDrA7tn
 MXCA6DTPJ4lY6c0PiU1M+CqpLP3K/3j1Mk7HXYf9n4K8UuhwcHqhSYwgWbslg0NXJ5wN
 OZTw==
X-Gm-Message-State: AOAM533ASKNIwurTXGMvDGVeznDJV6lyhm1gPwtK2Z5ZqtJCIJ+b5Lsg
 7G1BNxJrdq4w3UIQTbHIQ36soKyUVybej9TWQux4+w==
X-Google-Smtp-Source: ABdhPJyHF/rlsYqyDwdIxuD6PJPSupccYZg9r6evuUrI8X/QZPauu1LWDUMuBbVKWOjT5zptCo1XvyV4sdUBMQJjG4w=
X-Received: by 2002:a17:906:4002:: with SMTP id v2mr473813ejj.85.1611855213351; 
 Thu, 28 Jan 2021 09:33:33 -0800 (PST)
MIME-Version: 1.0
References: <20210126193237.1534208-1-wuhaotsh@google.com>
 <20210126193237.1534208-5-wuhaotsh@google.com>
In-Reply-To: <20210126193237.1534208-5-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 17:33:22 +0000
Message-ID: <CAFEAcA8XRQ4yG6mXVrgMdQ-65Rqn8nBV1LySOU--XLeOUaOJKQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] hw/arm: Add I2C device tree for Quanta GSJ
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Jan 2021 at 19:32, Hao Wu <wuhaotsh@google.com> wrote:
>
> Add an I2C device tree for Quanta GSJ. We only included devices with
> existing QEMU implementation, including AT24 EEPROM and temperature
> sensors.
>
> Reviewed-by: Doug Evans<dje@google.com>
> Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>

Same remarks as for patch 3 apply here too.

thanks
-- PMM

