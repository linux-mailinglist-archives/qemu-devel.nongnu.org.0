Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE541E179E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 May 2020 00:13:32 +0200 (CEST)
Received: from localhost ([::1]:48132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdLLZ-0008OR-O8
	for lists+qemu-devel@lfdr.de; Mon, 25 May 2020 18:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jdLKj-0007l9-O2; Mon, 25 May 2020 18:12:33 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:41392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jdLKi-0007iE-WA; Mon, 25 May 2020 18:12:33 -0400
Received: by mail-io1-xd42.google.com with SMTP id o5so19956037iow.8;
 Mon, 25 May 2020 15:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0ybd/vTKoMnsphUJs3gJenYD5RIMfyIS7Gf777XZfUE=;
 b=XgZpt+Ut03IhuPnpXy2q5o1yt/ITg4lGHEhioOtOe4vL/AavNK2CcZqv4wnU0v8dxJ
 reuXOUOxn1WkqKLyWKebe/wgZzLEaAkDrk/AKCVS5grnSi0l2hZzFw67+UQmDEdWd4Qa
 W5nNEBgC5XyHu7AO4cD8QjLBc8C4kEddSMx5GNQQWcPk1T6zxjYOe0yc9+mn1gEX3gev
 s1GMcYZKco1eYcSYAhbZrm4+vh2amPYvGRc9hLl7lZNNm91NM00huAhe/71hnPbHFPdq
 XGfrktQ+UqtuyDprPNA+6SgEGn+r4NKLnbyW2UQlQA5MpIi0MnJxRC+QoSJ3HutPJ5F/
 bZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0ybd/vTKoMnsphUJs3gJenYD5RIMfyIS7Gf777XZfUE=;
 b=D0wZn52Ea/6Fzz4xzC68F9sNNZdGuNBNry1AmKF9ZiI9eAQZ+NGQZPuYbSMwILjNuO
 F4+0W3NYyGXhCviNv91YckbO3j+tIu1fTzHdui7e3vesTObIF7wuOEkBLVgWdyLzOhtq
 Q6cIfklTVr8Lsj+62sfqjNjdZgfMptcJgljxFEhkPOZVSlsOB7dwOXehB9GLI3cZDiHC
 8V4asO4CWP0wGCcjtxnDY/h1cRlKz+I1m0BmSmWzTGNYK15wNRuLPyxtLIQCJRB6uK0R
 Yp8tvUzNZhBzL0wu00YaFHs5z9hWBWV6jc5hFRtGaHXTkulQFDdeCXXIHGvg28NaC4An
 fyAg==
X-Gm-Message-State: AOAM530sezWmy4peDas80X0c5/CHRIYr04znz42GiIvnitFLa5IQdZH2
 8HCtIx5hGHHkviIOT8DdG8P2ACPSE7gZf2duHpY=
X-Google-Smtp-Source: ABdhPJyfOoOoORgxo3vJUXu1jtlg2M7R5UPpvOJur6GZb8B8/Meu8nEikBNeNHQwlbFGDalDpD1kpyDoXcXh4OaZoKY=
X-Received: by 2002:a02:7009:: with SMTP id f9mr15768023jac.8.1590444750530;
 Mon, 25 May 2020 15:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200525111001.8147-1-f4bug@amsat.org>
In-Reply-To: <20200525111001.8147-1-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 25 May 2020 15:12:03 -0700
Message-ID: <CAKmqyKP+7p2Kmti_Ds68ja=gLgY96tKjMhN8ACgDfaFv+XROgA@mail.gmail.com>
Subject: Re: [PATCH v2] hw/adc/stm32f2xx_adc: Correct memory region size and
 access size
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 25, 2020 at 4:10 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> The ADC region size is 256B, split as:
>  - [0x00 - 0x4f] defined
>  - [0x50 - 0xff] reserved
>
> All registers are 32-bit (thus when the datasheet mentions the
> last defined register is 0x4c, it means its address range is
> 0x4c .. 0x4f.
>
> This model implementation is also 32-bit. Set MemoryRegionOps
> 'impl' fields.
>
> See:
>   'RM0033 Reference manual Rev 8', Table 10.13.18 "ADC register map".
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> v2: Commit staged changes... (MemoryRegionOps::impl)
> ---
>  hw/adc/stm32f2xx_adc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/adc/stm32f2xx_adc.c b/hw/adc/stm32f2xx_adc.c
> index 4f9d485ecf..01a0b14e69 100644
> --- a/hw/adc/stm32f2xx_adc.c
> +++ b/hw/adc/stm32f2xx_adc.c
> @@ -246,6 +246,8 @@ static const MemoryRegionOps stm32f2xx_adc_ops =3D {
>      .read =3D stm32f2xx_adc_read,
>      .write =3D stm32f2xx_adc_write,
>      .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .impl.min_access_size =3D 4,
> +    .impl.max_access_size =3D 4,
>  };
>
>  static const VMStateDescription vmstate_stm32f2xx_adc =3D {
> @@ -278,7 +280,7 @@ static void stm32f2xx_adc_init(Object *obj)
>      sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
>
>      memory_region_init_io(&s->mmio, obj, &stm32f2xx_adc_ops, s,
> -                          TYPE_STM32F2XX_ADC, 0xFF);
> +                          TYPE_STM32F2XX_ADC, 0x100);
>      sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
>  }
>
> --
> 2.21.3
>
>

