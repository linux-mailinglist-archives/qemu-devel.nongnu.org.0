Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9312F34EB
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 17:03:14 +0100 (CET)
Received: from localhost ([::1]:38014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzM8W-0006sR-V7
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 11:03:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzM62-0005ob-6j
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:00:38 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:36494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzM60-0002Ad-EL
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:00:37 -0500
Received: by mail-ej1-x62e.google.com with SMTP id lt17so4269365ejb.3
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 08:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DfjIkZdzdlD/vkJuzL+98clXFddLOtIlz/ZDcf2SDn0=;
 b=c0B2cDrzJtDJuv6NSsL5WIVXRXs8cZaqDUXpllyKQzWDvEhBQXju6s/8aQmRyezzDi
 WuVXBjJnqnvwJE9qeqm3FQ2Ux/ZejlqOePQg5cl8JZkBZse4CxRYcz/65TImkTE1RC9E
 6VfGb6+VMeqoDdb8Le6PnXbb8/tZtijyVjAMzPm5qaDMu/G0QT+UhB58ycY2kpMH4wBp
 UMpXAhaWQlhyEju0z6pwdABbU1WG4QwCoxdkTW5Ujw7UQwQSuvznbHby6BQqBfOANDx4
 g+Jsqagsi1AW5X3GeD5A6dKdd/mvBD90+AwQGl/DbPiE+OmauFLDoTEY9M7+yM4pDYx1
 /36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DfjIkZdzdlD/vkJuzL+98clXFddLOtIlz/ZDcf2SDn0=;
 b=qFHWkRiOILNukilmw63pHaQKVnAg0lNlhajrDVjj2mCoInBxMwwUaVtpLfjLAs6qHX
 ZEi97wX5X2ABI1I8seFmqlkAnkAjUEVKoU50j0unVumvHPD7Yq7VhSytQDAvzGF624vR
 dKmKDyKCZT1yEe08CTYzrcaRnucO/kYUBuyKi5mnH+5xWpVM+vkUWOx6s6jfubV5RLWr
 cFqce4OuSZgsm/wpmC5X5TlXLpynmrUGw/nkFcLE/LvYUk8cWxSUppWE/C7xGxM0nzG/
 zNFhdOeOInYyfnX+HfjAqSOVaqDf3VXkXG+tFctZK4cfkg+PzxUOZ8Y8vAf4Abjfwa83
 drnw==
X-Gm-Message-State: AOAM532WfXQ0DYy2J7qurFBQXRMAM6xYhT8ZfM55ATgaUuWEjwFkQI2m
 amkAx1V71ozQ7TYHnWaJ4noKQoOQQzdZ2FeQarZ0kw==
X-Google-Smtp-Source: ABdhPJytCj0zYUunJIBz2Gr+5ohIOhMFAFhp3bccekjD+wACS4JtlIuOz5HgOd3VrRzuq1IdXx3rm+F1/5FxXNOY0/4=
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr3833214eja.250.1610467234324; 
 Tue, 12 Jan 2021 08:00:34 -0800 (PST)
MIME-Version: 1.0
References: <20210112143058.12159-1-maxim.uvarov@linaro.org>
 <20210112143058.12159-3-maxim.uvarov@linaro.org>
 <20210112153542.oqahdubzeoipyvun@kamzik.brq.redhat.com>
In-Reply-To: <20210112153542.oqahdubzeoipyvun@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jan 2021 16:00:23 +0000
Message-ID: <CAFEAcA9O2kHpcvoofo0v3ahXNOQtw8cxaVC2hn+AjpH6A9RciA@mail.gmail.com>
Subject: Re: [PATCHv4 2/2] arm-virt: add secure pl061 for reset/power down
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>, Jose.Marinho@arm.com,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Jan 2021 at 15:35, Andrew Jones <drjones@redhat.com> wrote:
>
> On Tue, Jan 12, 2021 at 05:30:58PM +0300, Maxim Uvarov wrote:
> > Add secure pl061 for reset/power down machine from
> > the secure world (Arm Trusted Firmware). Connect it
> > with gpio-pwr driver.

> > +    /* connect secure pl061 to gpio-pwr */
> > +    qdev_connect_gpio_out(pl061_dev, ATF_GPIO_POWEROFF,
> > +                          qdev_get_gpio_in_named(gpio_pwr_dev, "reset", 0));
> > +    qdev_connect_gpio_out(pl061_dev, ATF_GPIO_REBOOT,
> > +                          qdev_get_gpio_in_named(gpio_pwr_dev, "shutdown", 0));
>
> I don't know anything about secure world, but it seems odd that we don't
> need to add anything to the DTB.

We should be adding something to the DTB, yes. Look at
how create_uart() does this -- you set the 'status' and
'secure-status' properties to indicate that the device is
secure-world only.



> > +    if (vmc->no_secure_gpio) {
> > +        vms->secure_gpio = false;
> > +    }  else {
> > +        vms->secure_gpio = true;
> > +    }
>
> nit: vms->secure_gpio = !vmc->no_secure_gpio
>
> But do we even need vms->secure_gpio? Why not just do
>
>  if (vms->secure && !vmc->no_secure_gpio) {
>      create_gpio_secure(vms, secure_sysmem);
>  }
>
> in machvirt_init() ?

We're just following the same pattern as vmc->no_its/vms->its,
aren't we ?

thanks
-- PMM

