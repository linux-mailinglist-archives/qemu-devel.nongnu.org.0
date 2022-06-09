Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A240544DB9
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:32:36 +0200 (CEST)
Received: from localhost ([::1]:54622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzIH4-0007MB-SC
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzGBQ-0000Qk-VB
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:18:40 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:40835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzGBO-0003EI-GB
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:18:36 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-30c2f288f13so237270847b3.7
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 04:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gJKUTd63tpf6HZVWqwf6cv40NQZYq8+b+3+Ks9emEmY=;
 b=R9CzZSurBjMDw4DWHthGoouXawYeBgPVvOvEl1S9CEEpNfakysz2pdjVXFpr9IxHx0
 98E6tBBMjt/8ONsyZef0/0Nv36ImKEuzR+od5G7Mgsb+5AyukEtcRiM8YZ/KM1KPqWVJ
 5BBURzLOCiC9HPJmUnU/Y0g3vIpLSY4JYdXuJh291ByLZEAIP6fFhV7/cBrR/001yFF0
 6RfAUajbk97utRNPJEBXURYEdT0ufIp4LTD2/yRct7UP6aVRpDIhNu9lgkdqzywLerPj
 tw0ATlepTeXDPNsrjfX0181Cf9Ll1A8FH9Iz4695ptFAVjs8c1hUvBctPNpKqluxKHz8
 CsPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gJKUTd63tpf6HZVWqwf6cv40NQZYq8+b+3+Ks9emEmY=;
 b=dFxYAXaLcCD33eMIYitrPqvl0ItpD4eqi7L0JXBcJZEyNBOG5kunl2hZgZ7Qq6i1JN
 S1KMbScWF7yvw6N6ur1MPF+UA80sup5PYrSZm1m2F5SnpeWE5zradliTTsQEXWmYIJgz
 wK8yET/yc9GedHxyOCrBJdBocSAuBIXLSK6Gr1GbUtjVEsrGc+EMmMUk0WezJBuJieAa
 /IZvFznWpwkJ4pVhjN4fWqYs2x+ccwtcwRhxchEoctuIbnwAKX068Dd6KPhwBii4XdZm
 NTO8mTtPlF0DAb9u4Vm6WbWff6KWUk2VaD04VnXenfUXHyGoQi3osq5CdLO4kyG8m/pE
 dIJA==
X-Gm-Message-State: AOAM530vhAQYnS1Qb6hMg7nhCAee/4SsIio8imXrrYXvGJplVbCBwhDk
 D/Jg3VvpdYbIh6pHYCp6EJmXurcBj+5lZiqhFcOdWw==
X-Google-Smtp-Source: ABdhPJx1B4s988fZJdiNIyhyTo63XEwfKqRGT6GxfODOlC6r8dhzSDuOHfmCp7Lc/ockbxgJawDW4RKaAeavpCLJZWo=
X-Received: by 2002:a05:690c:808:b0:30c:4f5c:b319 with SMTP id
 bx8-20020a05690c080800b0030c4f5cb319mr40890026ywb.64.1654773513344; Thu, 09
 Jun 2022 04:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-46-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-46-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 12:18:23 +0100
Message-ID: <CAFEAcA9CxLKNZzfvaoUFSRtykEymu23er+zj=7GA1V2nRtcU9A@mail.gmail.com>
Subject: Re: [PATCH 45/50] lasips2: use qdev gpio for output IRQ
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This enables the IRQ to be wired up using qdev_connect_gpio_out() in
> lasips2_initfn().
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/lasips2.c         | 8 ++++----
>  include/hw/input/lasips2.h | 2 ++
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
> index 6849b71e5c..644cf70955 100644
> --- a/hw/input/lasips2.c
> +++ b/hw/input/lasips2.c
> @@ -247,16 +247,14 @@ static void lasips2_port_set_irq(void *opaque, int level)
>
>  LASIPS2State *lasips2_initfn(hwaddr base, qemu_irq irq)
>  {
> -    LASIPS2State *s;
>      DeviceState *dev;
>
>      dev = qdev_new(TYPE_LASIPS2);
>      qdev_prop_set_uint64(dev, "base", base);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> -    s = LASIPS2(dev);
> +    qdev_connect_gpio_out(dev, LASIPS2_IRQ, irq);
>
> -    s->irq = irq;
> -    return s;
> +    return LASIPS2(dev);
>  }
>
>  static void lasips2_realize(DeviceState *dev, Error **errp)
> @@ -285,6 +283,8 @@ static void lasips2_init(Object *obj)
>
>      sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->kbd.reg);
>      sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mouse.reg);
> +
> +    qdev_init_gpio_out(DEVICE(obj), &s->irq, 1);
>  }
>
>  static Property lasips2_properties[] = {
> diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
> index 7e4437b925..d3e9719d65 100644
> --- a/include/hw/input/lasips2.h
> +++ b/include/hw/input/lasips2.h
> @@ -22,6 +22,8 @@ typedef struct LASIPS2Port {
>      bool irq;
>  } LASIPS2Port;
>
> +#define LASIPS2_IRQ    0

If you find yourself #defining names for IRQ lines then this is
probably a sign you should be using named GPIO lines :-)

Alternatively, maybe use sysbus_init_irq()? By convention the
only sysbus IRQ on a device is generally "its IRQ line".

-- PMM

