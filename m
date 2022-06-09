Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E8B544F98
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:42:18 +0200 (CEST)
Received: from localhost ([::1]:51204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJMX-0006uF-4i
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzHf3-0005Lg-9j
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:53:17 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:56106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzHev-0003iu-NS
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:53:10 -0400
Received: by mail-pj1-x1031.google.com with SMTP id e9so10738980pju.5
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 05:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QX7WSOmfdAj+2a76Ls2sUy1xnxRT9B8UXZTQolxAxBs=;
 b=uI/vbidic7dE019LE9d24kUwWbq82wrBKPv2yRUh9NxP5NF3WnFlj9SYppRkTWlVcA
 S2VrYOI64B3W3kh6evEqlDFvrYBqPJf5D2AoNsNl5tbcpl/XY7FWbwknUwaYurBR9L23
 ncZinSSsAcUSRmBjjzX1tcrK2Fmq8Y8nD0YS2ccg1bSWjImiB1v1myQcNETNDRm8MAoO
 kfgxRnOAknvVT0RIssiopK1C+FnG/07yQ4vLrcqpUu1GLekXXI11YhIIxW3NnWH4+oFZ
 c2viN5SICaO6cFuC61P1hvFmNHJ96EZ7LAm5iqlsM+Y7VLJoJlsxQs6DVeyjwCophVXw
 WfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QX7WSOmfdAj+2a76Ls2sUy1xnxRT9B8UXZTQolxAxBs=;
 b=ktILbluTuRaC9bEtQQ4ebLm/RufWrQtMK6zbJc+rgCiwcHMk32PqXFMpGSFO0kricU
 k0KjbumGUs9BYBmESdqr9987zcN0OhaN0bExQykfk4kRaw9SGEfaNdpHQUM0dwrY5I2P
 uk4h7KmzMNoOvpL8OWKNwKgmXgKlSkgr4d98nIWaAW6JR2UHpYxFexy5fWToVWm0cZKn
 zSvDdZLdD+ZWEsm4MetfgLkQ5HB/zPJgukyRcqarYLr+Ezo5Kx2Fsi73ICURDLX0s1m3
 KBoS6oaZnvzlZn5c+wXUrktdk9AJYQoUnP4vjsTpuTR8jf2V2fdlIjCoXZ5iqPvgus4+
 UrSQ==
X-Gm-Message-State: AOAM533AJMGIO/v+XsQrAoD2CQLQxk0UDwcbferaWKWZrJ2rk+2WkqFM
 iCpTt2CFlTauKbZ7Q8D3abOqlrsi42smmWSiBi/STw==
X-Google-Smtp-Source: ABdhPJyIS0KURCG4tzTYiNH3eJekdj3ODSAI/cD4zlByl5/Sn62AjkYKYQpGA5mdv1K+9rFSJGssHwi3UdzDnoyyKmg=
X-Received: by 2002:a17:902:e80d:b0:167:5e77:e695 with SMTP id
 u13-20020a170902e80d00b001675e77e695mr28344121plg.144.1654779188165; Thu, 09
 Jun 2022 05:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-50-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-50-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 13:52:57 +0100
Message-ID: <CAFEAcA_zHBc1FTYa6++8jtOJ42rsedcF01ryk-_3zYgLr=Ptug@mail.gmail.com>
Subject: Re: [PATCH 49/50] pckbd: switch I8042 device from update_irq()
 function to PS2 device gpio
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1031.google.com
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
> Define a new qdev input gpio for handling incoming PS2 IRQs, and then wire up the
> PS2 keyboard and mouse devices to use it. At the same time set update_irq() and
> update_arg to NULL in ps2_kbd_init() and ps2_mouse_init() to ensure that any
> accidental attempt to use the legacy update_irq() function will cause a NULL
> pointer dereference.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/pckbd.c | 27 +++++++++++++++++++++++----
>  1 file changed, 23 insertions(+), 4 deletions(-)
>
> diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
> index b2fdd1c999..f1eeab9952 100644
> --- a/hw/input/pckbd.c
> +++ b/hw/input/pckbd.c
> @@ -801,6 +801,18 @@ static const MemoryRegionOps i8042_cmd_ops = {
>      .endianness = DEVICE_LITTLE_ENDIAN,
>  };
>
> +static void i8042_set_irq(void *opaque, int n, int level)
> +{
> +    ISAKBDState *s = I8042(opaque);
> +    KBDState *ks = &s->kbd;
> +
> +    if (n) {
> +        kbd_update_aux_irq(ks, level);
> +    } else {
> +        kbd_update_kbd_irq(ks, level);
> +    }
> +}
> +
>  static void i8042_reset(DeviceState *dev)
>  {
>      ISAKBDState *s = I8042(dev);
> @@ -820,6 +832,9 @@ static void i8042_initfn(Object *obj)
>                            "i8042-cmd", 1);
>
>      qdev_init_gpio_out_named(DEVICE(obj), &s->a20_out, I8042_A20_LINE, 1);
> +
> +    qdev_init_gpio_out(DEVICE(obj), s->irqs, 2);
> +    qdev_init_gpio_in(DEVICE(obj), i8042_set_irq, 2);
>  }

named gpio inputs, otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

