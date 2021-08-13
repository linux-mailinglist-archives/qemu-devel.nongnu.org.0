Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D98C93EAE24
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 03:28:28 +0200 (CEST)
Received: from localhost ([::1]:56694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mELzn-0005Y7-VR
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 21:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mELyf-0004Om-7C; Thu, 12 Aug 2021 21:27:18 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:41544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mELyZ-0003KP-6X; Thu, 12 Aug 2021 21:27:13 -0400
Received: by mail-io1-xd34.google.com with SMTP id 188so11112550ioa.8;
 Thu, 12 Aug 2021 18:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7Ks+v6YrCK4UNYcF37weOYK4eOTQy/Wk04GAEvfjnKs=;
 b=Tg0uDpJPCvA/pyhvhugfzSb1zYX2BHpelODa071ppxEtpGi9pJtmJF6YbMD5xkQ/GF
 Rm3WsL4S+k0pUPSK+cmb+8wFzEdfENKJ0LI3I+md9qvBs/nXyhXU24xnlpg4XQpWzw1S
 Lx+4ftBKNkwzUosKLn/XeoBfCKxUt985IwUC9CoGZdq9GQiMjoPsociWQzdkuEGftE1j
 TPYpeFmUhaweRplFq/Fdh0ArTrn9ON+8czzwS1eMGzFezb2SeL3KN3Sjj1D93DMRbGuU
 BGaezJHyA/IM9i00ysq3XD7NZcH7b7Eu7mxdAdBO0/oRPu/W5FTKQMsmpT28959HqjL2
 RxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Ks+v6YrCK4UNYcF37weOYK4eOTQy/Wk04GAEvfjnKs=;
 b=gmYsewjJOMwXGdiCJTY++zKcQP3useW8QjLSFT7uG2/Smg+wD/5HQfhSUrQ0qc8meN
 24ZhQCluR8EcXaGfGyebvlNBZ6iL5tFUIjO/s3DWO/GE47kQYkZfFPDKxpJMWLkwXnqw
 q4EHzz/k7toyAx4PY6QYOmrpSnWFBL8FeZHcEOnrfhUKs269zyOs7N3HqB33pdtwJX0G
 nhNLwDSqCJL1Hmz14Qo50t0eVIoIezqGhzhGIbkx4sgKYzHcS1YeYocc08VxxzlPQ65Y
 KZkpkzS6G0ARIT7vfDMLw4bVUrqZ8m046XT7GkKZPtxHmxnje9RgEyYSBBgVRv5EWxGG
 avPQ==
X-Gm-Message-State: AOAM533yLocVUkK2Suql3bk9yyuye/6Vh+Nq+jF0CruxGoHMhna3Mydu
 XOPRx8gnz8evjA/VK1a4CEhiet4fNZtwXawrLWM=
X-Google-Smtp-Source: ABdhPJzs8AX72MOHWMykTS+TnztQRuiWb7gPfem6dKSbTLm3nqslO7RUBnFD2kGPIbgVZVJ1xtfzb0Juw9Fq4hsEg20=
X-Received: by 2002:a02:90d0:: with SMTP id c16mr6295442jag.106.1628818029749; 
 Thu, 12 Aug 2021 18:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-5-peter.maydell@linaro.org>
In-Reply-To: <20210812093356.1946-5-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 13 Aug 2021 11:26:43 +1000
Message-ID: <CAKmqyKNkB=w8yQeepKbYZwHb-n5tZAN-bLjn4DwTjj_kwsPJXA@mail.gmail.com>
Subject: Re: [PATCH for-6.2 04/25] hw/timer/armv7m_systick: Add usual QEMU
 interface comment
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
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

On Thu, Aug 12, 2021 at 7:34 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Add the usual-style QEMU interface comment documenting what
> properties, etc, this device exposes.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/timer/armv7m_systick.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/include/hw/timer/armv7m_systick.h b/include/hw/timer/armv7m_systick.h
> index 84496faaf96..685fc5bc0d7 100644
> --- a/include/hw/timer/armv7m_systick.h
> +++ b/include/hw/timer/armv7m_systick.h
> @@ -20,6 +20,13 @@
>
>  OBJECT_DECLARE_SIMPLE_TYPE(SysTickState, SYSTICK)
>
> +/*
> + * QEMU interface:
> + *  + sysbus MMIO region 0 is the register interface (covering
> + *    the registers which are mapped at address 0xE000E010)
> + *  + sysbus IRQ 0 is the interrupt line to the NVIC
> + */
> +
>  struct SysTickState {
>      /*< private >*/
>      SysBusDevice parent_obj;
> --
> 2.20.1
>
>

