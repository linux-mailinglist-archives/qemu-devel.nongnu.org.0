Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B32D5628E50
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:28:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouijv-0004WG-Pz; Mon, 14 Nov 2022 18:19:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1ouieb-00039s-RO; Mon, 14 Nov 2022 18:14:14 -0500
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1oudGl-0003rh-Qz; Mon, 14 Nov 2022 12:29:17 -0500
Received: by mail-vs1-xe29.google.com with SMTP id k67so12164929vsk.2;
 Mon, 14 Nov 2022 09:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GxvDZeEJg9boR28NKE16peI7UQyIFf8KNc89TO+F7ts=;
 b=fJq2AInM2ibIWqR4NaA9Oe9UicRMvU/AG7K5pcgFlOp94NflXYIzYooKSoj0gKkENA
 AE+ciS0s+G0n+YUvMDsUKQHjVZfdpVPAM4SvIXTzg7/EBszAy6e4rq0wesswhJ7TEoP3
 OZVnFwgJsIZJKsDZN1VBulCO7cvlP8et+625aW6adCH9BoEmKD670zyUiWjQOw+3FqwB
 p2Xc0jE8MTbTdiVJEbClAS2mQBj7utIjz1ktEKSfOho/ZvENSS4KdcYzwsE4l67Np7NI
 rt63FDU2lhWzkYgNe5ZEJ7i5SclRrflOu0W4W+Yp2IhsD5uVONr3NCQ6jzPEFIG4EONY
 fwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GxvDZeEJg9boR28NKE16peI7UQyIFf8KNc89TO+F7ts=;
 b=5N9dvAwbFIJP2RUFvN+DlmDabf8diBFkg5DrnHY2NZJ4rz+inljeCgorR6ABttRI+M
 jxhxoksikgDOBU/8GpDa+mr0H4xe905Pt0YfVpqun9Z/SMUbq6JDosuWE2hAzTEu0SNU
 6w23VIpywtrowk7eda/vJj7veLUVHGHI3SUm1uMn9/wEPjuGFmAVTmHKSGFdOaybnrQN
 4rHxR7mc+9ItH1iPrd9BLoLatUHHeSm9L4DFCI/0syv8OHQHnusYKkfrycV+K31qhJYU
 8pH/4qgKZP9aTAcPWaMfsAkPJUussUGK8HcHys0maJpGAgcqFg9ba0dbWRYiOi/z7bRS
 vHIg==
X-Gm-Message-State: ANoB5pmZ/XktVeV/q3q8mP1NP54eHLCs86hwAOTfDg9EjTXHoxBCctEn
 mGfSqiT6VQ7XCb/QL/lbEfPi38yKNQQNtz4AAaw=
X-Google-Smtp-Source: AA0mqf6IXsPdm7NAVOjP83ThSMuySC/0O4XI0DQCpZR9Y5RXI81ILsIkHsTyCYX/wZkNo9xJRnKQbBQbpLVQPP03maU=
X-Received: by 2002:a05:6102:38cb:b0:3aa:255b:4704 with SMTP id
 k11-20020a05610238cb00b003aa255b4704mr6065160vst.38.1668446953548; Mon, 14
 Nov 2022 09:29:13 -0800 (PST)
MIME-Version: 1.0
References: <20221112214900.24152-1-strahinja.p.jankovic@gmail.com>
 <CAFEAcA_F0jcjviRGjgmb4J_Kos22+UE0vPbcXoTbPCP7xz-nXA@mail.gmail.com>
In-Reply-To: <CAFEAcA_F0jcjviRGjgmb4J_Kos22+UE0vPbcXoTbPCP7xz-nXA@mail.gmail.com>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Mon, 14 Nov 2022 18:29:01 +0100
Message-ID: <CABtshVRnwQiTypOFaOqVE69+1wbVoVJEy_x7ELez8Mo6aXT=Yg@mail.gmail.com>
Subject: Re: [PATCH] hw/sd: Fix sun4i allwinner-sdhost for U-Boot
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Beniamino Galvani <b.galvani@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-vs1-xe29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

Thank you for your reply.

On Mon, Nov 14, 2022 at 4:42 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sat, 12 Nov 2022 at 21:49, Strahinja Jankovic
> <strahinjapjankovic@gmail.com> wrote:
> >
> > Trying to run U-Boot for Cubieboard (Allwinner A10) fails because it cannot
> > access SD card. The problem is that FIFO register in current
> > allwinner-sdhost implementation is at the address corresponding to
> > Allwinner H3, but not A10.
> > Linux kernel is not affected since Linux driver uses DMA access and does
> > not use FIFO register for reading/writing.
> >
> > This patch adds new class parameter `is_sun4i` and based on that
> > parameter uses register at offset 0x100 either as FIFO register (if
> > sun4i) or as threshold register (if not sun4i; in this case register at
> > 0x200 is FIFO register).
> >
> > Tested with U-Boot and Linux kernel image built for Cubieboard and
> > OrangePi PC.
> >
> > Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> > ---
> >  hw/sd/allwinner-sdhost.c         | 67 ++++++++++++++++++++++----------
> >  include/hw/sd/allwinner-sdhost.h |  1 +
> >  2 files changed, 47 insertions(+), 21 deletions(-)
> >
> > diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
> > index 455d6eabf6..51e5e90830 100644
> > --- a/hw/sd/allwinner-sdhost.c
> > +++ b/hw/sd/allwinner-sdhost.c
> > @@ -65,7 +65,7 @@ enum {
> >      REG_SD_DLBA       = 0x84,  /* Descriptor List Base Address */
> >      REG_SD_IDST       = 0x88,  /* Internal DMA Controller Status */
> >      REG_SD_IDIE       = 0x8C,  /* Internal DMA Controller IRQ Enable */
> > -    REG_SD_THLDC      = 0x100, /* Card Threshold Control */
> > +    REG_SD_THLDC      = 0x100, /* Card Threshold Control / FIFO (sun4i only)*/
> >      REG_SD_DSBD       = 0x10C, /* eMMC DDR Start Bit Detection Control */
> >      REG_SD_RES_CRC    = 0x110, /* Response CRC from card/eMMC */
> >      REG_SD_DATA7_CRC  = 0x114, /* CRC Data 7 from card/eMMC */
> > @@ -415,10 +415,29 @@ static void allwinner_sdhost_dma(AwSdHostState *s)
> >      }
> >  }
> >
> > +static uint32_t allwinner_sdhost_fifo_read(AwSdHostState *s)
> > +{
> > +    uint32_t res = 0;
> > +
> > +    if (sdbus_data_ready(&s->sdbus)) {
> > +        sdbus_read_data(&s->sdbus, &res, sizeof(uint32_t));
> > +        le32_to_cpus(&res);
> > +        allwinner_sdhost_update_transfer_cnt(s, sizeof(uint32_t));
> > +        allwinner_sdhost_auto_stop(s);
> > +        allwinner_sdhost_update_irq(s);
> > +    } else {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: no data ready on SD bus\n",
> > +                      __func__);
> > +    }
> > +
> > +    return res;
> > +}
> > +
> >  static uint64_t allwinner_sdhost_read(void *opaque, hwaddr offset,
> >                                        unsigned size)
> >  {
> >      AwSdHostState *s = AW_SDHOST(opaque);
> > +    AwSdHostClass *sc = AW_SDHOST_GET_CLASS(s);
> >      uint32_t res = 0;
> >
> >      switch (offset) {
> > @@ -508,8 +527,12 @@ static uint64_t allwinner_sdhost_read(void *opaque, hwaddr offset,
> >      case REG_SD_IDIE:      /* Internal DMA Controller Interrupt Enable */
> >          res = s->dmac_irq;
> >          break;
> > -    case REG_SD_THLDC:     /* Card Threshold Control */
> > -        res = s->card_threshold;
> > +    case REG_SD_THLDC:     /* Card Threshold Control or FIFO register (sun4i) */
> > +        if (sc->is_sun4i) {
> > +            res = allwinner_sdhost_fifo_read(s);
> > +        } else {
> > +            res = s->card_threshold;
> > +        }
> >          break;
> >      case REG_SD_DSBD:      /* eMMC DDR Start Bit Detection Control */
> >          res = s->startbit_detect;
> > @@ -531,16 +554,7 @@ static uint64_t allwinner_sdhost_read(void *opaque, hwaddr offset,
> >          res = s->status_crc;
> >          break;
> >      case REG_SD_FIFO:      /* Read/Write FIFO */
> > -        if (sdbus_data_ready(&s->sdbus)) {
> > -            sdbus_read_data(&s->sdbus, &res, sizeof(uint32_t));
> > -            le32_to_cpus(&res);
> > -            allwinner_sdhost_update_transfer_cnt(s, sizeof(uint32_t));
> > -            allwinner_sdhost_auto_stop(s);
> > -            allwinner_sdhost_update_irq(s);
> > -        } else {
> > -            qemu_log_mask(LOG_GUEST_ERROR, "%s: no data ready on SD bus\n",
> > -                          __func__);
> > -        }
> > +        res = allwinner_sdhost_fifo_read(s);
>
> Does the sun4i really have the FIFO at both addresses, or should
> this one do something else for sun4i ?

The sun4i sdhost actually has no registers with offset higher than
0x100 (offset of REG_SD_THLDC in patch), so REG_SD_DSBD, all
REG_SD_*_CRC, REG_SD_CRC_STA and REG_SD_FIFO@0x200 should not be
accessed from application code meant to run on sun4i. That is why I
only changed the FIFO/THLDC (offset 0x100) register behavior, since
that change makes U-Boot work.

I could update the patch so all of these registers with offset bigger
than 0x100 log error if sun4i is selected, so that is more clear.
Would that be ok?

Best regards,
Strahinja


>
> thanks
> -- PMM

