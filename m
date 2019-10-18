Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D864EDCC18
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 18:59:17 +0200 (CEST)
Received: from localhost ([::1]:43398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLVau-0000yk-QD
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 12:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54521)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iLVYY-00008o-0T
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 12:56:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iLVYW-00037H-Ue
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 12:56:49 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:38026)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iLVYW-000371-Q3
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 12:56:48 -0400
Received: by mail-oi1-x242.google.com with SMTP id d140so1485171oib.5
 for <qemu-devel@nongnu.org>; Fri, 18 Oct 2019 09:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sOWtQrHTKjxi6eKLrTm4FD/JgZSHaFrNufEN4q1uYrU=;
 b=iE58Of0t2+AvOHWyPemnQIHExeYDZxkd4GLafIgQzAPsqjza6GS3oB8wjZMrbM5BS7
 NIFUq23W85HyiQ3RaXql24PYhiyhyHs0/FH6h9L3e3Yd1ZX1hWm6KIowoI+PIeSVoroo
 d/Z+yUaJEneRkbIdXZBw22KIdqoc7SfPSpi8IDnzuJlJ11bAaFswKsG2Nx6+R2G9AZjj
 2uWMNxABl+s1US1uws0Yn9EVGR7rqwACZddBLoTAfiIo7JjAS9qBVSXqtAAvqRKB3uFZ
 CJyKZSoY0vYA6DMqf92Qucja7ZNSM2vuSQMq1m5AOJwBElNQLO4RHRBHNfyULPaPxcHn
 Toug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sOWtQrHTKjxi6eKLrTm4FD/JgZSHaFrNufEN4q1uYrU=;
 b=cMz+QAcu7hTTZyf4jP4MbteUTmdh5qTAC6J6J3c0aiCswjzVPq081UeKLpDX4+9XmT
 L+EGJ1Dd9MnOamEdIhYvukwpuGSEr7u1k6JOs/c9/DfcAbu0adwYsBZdZvPxhVBDw5Ub
 iUzOtHpwKkkb+WqzhARJVPjGOKvwQKVdOhMFcg3hLFO1Jq66P80OdA/2cN44GpBmmopy
 XxhD5w+8E+QxauOhC6+bDkt+YeQ+HILuhzT2jQQgF+GYcKKdPgonXH5qgg6KZFQ/y8qC
 uvB86P8gVO3Z8O07LPgoJ8/Rex4ib9BQUPNuclOW9wkH6V0dVJi1E5QQZypYDbP75jQ0
 vgCQ==
X-Gm-Message-State: APjAAAWCgV8QALeudBZDwBM+d9MLtnsG6j9FPlcr0W9wGJgGcnIg2Zlu
 ichD3/hvJYBUMwl8D7eip25O9q686hnJVzqg6epwUg==
X-Google-Smtp-Source: APXvYqy1zS/NZE10SW/9vK+nT59xepGv6Ve4UEurAz0nq672FuqoyvVZOEMD3qeAv2h2h7e9eMZoLmOvG9lTu8a+H/Q=
X-Received: by 2002:aca:3b41:: with SMTP id i62mr8487090oia.48.1571417808015; 
 Fri, 18 Oct 2019 09:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20191018154212.13458-1-marcandre.lureau@redhat.com>
 <20191018154212.13458-12-marcandre.lureau@redhat.com>
In-Reply-To: <20191018154212.13458-12-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Oct 2019 17:56:36 +0100
Message-ID: <CAFEAcA-L8iEkcJwDnTK5fw6PS30fGgk2z0OZoa0EfdBM7K2rKA@mail.gmail.com>
Subject: Re: [PATCH 11/14] omap-i2c: remove PROP_PTR
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Oct 2019 at 16:43, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Since clock are not QOM objects, replace PROP_PTR of clocks with
> setters methods.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---

> --- a/include/hw/arm/omap.h
> +++ b/include/hw/arm/omap.h
> @@ -77,6 +77,15 @@ typedef struct omap_intr_handler_s omap_intr_handler;
>  void omap_intc_set_iclk(omap_intr_handler *intc, omap_clk clk);
>  void omap_intc_set_fclk(omap_intr_handler *intc, omap_clk clk);
>
> +/* omap_i2c.c */
> +#define TYPE_OMAP_I2C "omap_i2c"
> +#define OMAP_I2C(obj) OBJECT_CHECK(OMAPI2CState, (obj), TYPE_OMAP_I2C)
> +
> +typedef struct OMAPI2CState OMAPI2CState;
> +
> +void omap_i2c_set_iclk(OMAPI2CState *i2c, omap_clk clk);
> +void omap_i2c_set_fclk(OMAPI2CState *i2c, omap_clk clk);
> +

With a similar TODO header comment (or perhaps this is close
enough to the one from the previous patch that it doesn't
need repeating)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

