Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 411543EAE2B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 03:33:42 +0200 (CEST)
Received: from localhost ([::1]:36260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEM4r-0002i6-AU
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 21:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mEM1a-0000NS-R0; Thu, 12 Aug 2021 21:30:19 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:34312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mEM1Z-0005OC-Fw; Thu, 12 Aug 2021 21:30:18 -0400
Received: by mail-io1-xd2e.google.com with SMTP id i7so11175060iow.1;
 Thu, 12 Aug 2021 18:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rEkimaagXnKJW2H7fOFOrnyCBM/ctJ5gyvXKtevLuIg=;
 b=IhByNC3VFlz2TgxwTZARHQzYPSGb/kdIS0TZksfr1F5ViZYBBPZrXlK+XH3HcMYDYH
 BstaxSeUSYYc6ywLlSUoB73Lxu3x7llkAUxErSQmm8jpZT9hHvmuzBKvkx6TXnZZlXA+
 6aeL2HCFpcFNrU/80KH7Gm79+DWoc96PVI7NQTcgpLCcjV+2lFDXIeoUOrhVir5htD1z
 dkHgDOzw8CYiMnvBd9opaKaSnNVmOjYKQQ7Hc377l0r39yI5SNwd7Wxy11xQM72C+v0w
 1ptaCI+nBrpqY4NHx3gpbt+ZCZzrdxOdakkEph1o3zroX7glBXQcFivVUJ1DmSIHndnC
 nCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rEkimaagXnKJW2H7fOFOrnyCBM/ctJ5gyvXKtevLuIg=;
 b=mGdmK6sFAoTxVP7U18p7n+jyv2F+xRzSCAGmwemYjUIgPnYxL41QxsRFNMVOXceiTp
 7Cd7Dsq61G8Xu2t1paU/0J7Eqe22bfw8cWgaqIj2EYkLAO5Nbad7bkdPt+cLOYNccWa3
 BCSITHSTJFnquqA7Z8CUVNg5nFdPjZsldFqPRPpvQrOkOGR2Dg/naZg7CSmwxSW69sDg
 q/Msfj2Se9za5bVL92gYM/sSMXoFM5UW3sHfHhYxVkFkLgDu4MKmCNdUyW4Xyu63W9p1
 TX6akNEJnScMFXh/RQj9Qkfe8N5ZNRGjS6kGk7vX9ZPyV+RKkiGl54wrtYp3tNFxOj7/
 3wRQ==
X-Gm-Message-State: AOAM531DGKk48YKR/0Xb9QVd0Td9eID1ttj5GfG8JwnniyB7igu8HPTT
 ZWtTZqUsP823ELodL877sNl+/n6WNOJDNHtMyTM=
X-Google-Smtp-Source: ABdhPJxiJQ6Ytwx77bQjb526lOUQ3PIux+YZ5QDN9Bp1qZLPPfxFtuBka++BUiAshVBXh3buvQoBBaAuLXGVTaNjQPI=
X-Received: by 2002:a05:6638:240d:: with SMTP id
 z13mr6468053jat.8.1628818215199; 
 Thu, 12 Aug 2021 18:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-8-peter.maydell@linaro.org>
In-Reply-To: <20210812093356.1946-8-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 13 Aug 2021 11:29:49 +1000
Message-ID: <CAKmqyKN+04OGZ7Az+pOhvwOGfYdDLQQep_xSAFtkg3MhN4rf7A@mail.gmail.com>
Subject: Re: [PATCH for-6.2 07/25] armsse: Wire up systick cpuclk clock
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 12, 2021 at 7:42 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Wire up the cpuclk for the systick devices to the SSE object's
> existing mainclk clock.
>
> We do not wire up the refclk because the SSE subsystems do not
> provide a refclk.  (This is documented in the IoTKit and SSE-200
> TRMs; the SSE-300 TRM doesn't mention it but we assume it follows the
> same approach.) When we update the systick device later to honour "no
> refclk connected" this will fix a minor emulation inaccuracy for the
> SSE-based boards.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/armsse.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
> index a1456cb0f42..70b52c3d4b9 100644
> --- a/hw/arm/armsse.c
> +++ b/hw/arm/armsse.c
> @@ -995,6 +995,9 @@ static void armsse_realize(DeviceState *dev, Error **errp)
>          int j;
>          char *gpioname;
>
> +        qdev_connect_clock_in(cpudev, "cpuclk", s->mainclk);
> +        /* The SSE subsystems do not wire up a systick refclk */
> +
>          qdev_prop_set_uint32(cpudev, "num-irq", s->exp_numirq + NUM_SSE_IRQS);
>          /*
>           * In real hardware the initial Secure VTOR is set from the INITSVTOR*
> --
> 2.20.1
>
>

