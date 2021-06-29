Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 132463B722C
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 14:35:21 +0200 (CEST)
Received: from localhost ([::1]:38368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyCxU-0004kP-5Z
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 08:35:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyCwK-00044H-FQ
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 08:34:08 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:46931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyCwH-00021d-5J
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 08:34:08 -0400
Received: by mail-ed1-x531.google.com with SMTP id s15so31001970edt.13
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 05:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lHYZjNuZE9dh4aZx9QuutQCr1oERqUY5Ds+uaWUozFg=;
 b=unUB0XZJxFhquKKFKm9oKmj1gMfYwJjU+qSEKU+nQtXfutPeCsPvMerCPP9s5YGcgV
 R2Sd7Tj+qowKG6zDydZRLtaLwC5D5q17IK6ySDDQZ4feUuEahOrL99mhXTY3K30dJ++U
 x6WpOlLkrkHNoydwnOEqYsi8QagxHpwDN6O19WpajdIvx+hpn2iNkJaGY58X/Vqj64DU
 F+FAmYpNxxp0kpw5h0u/I6CwRhor3u7smWF3/MYxYK62GCSFtOCGrJph5exIlsbJogXy
 boRCBLGChrLp59/nl6Z/sEUCX254yEQWrtTbYUf42CLauvK1a88/N/BpwJfcVTLJEXrh
 ScDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lHYZjNuZE9dh4aZx9QuutQCr1oERqUY5Ds+uaWUozFg=;
 b=mc8iPxhdGF9NRAtAqCessZdQgPClJbsiTN+UkDCIeqQFsxDlYp3EWbU+KO84qmfvT1
 ZDwH9LZrFunQm8lhBCFpccZYxEs7P81CisFNez8UKJGAWIvXXZwXExD2q/V3V3rQ9Z8i
 79OLridORT6uci/DgHyajXrw44cHmX7wh1yhMAxY09QkNy/v/m0HnCQOmBBzRwXjn/yp
 9McHD/7qiSNSisZecQ9WdrQ3FCltw82InMhQNMbOiGtvIohgBXpEt7YWdjvshWhSx0X9
 kQM2AS4ZtRdP3KIaIzBE7UoubfJnPTTtSa2kh/1FfbBBR1wrVLPwEyEqmqBiXb0hvLAL
 8w5A==
X-Gm-Message-State: AOAM531MhERJHW8e3HmfYGEJKyrLvrV2MV5MZgVk3cctnFAfXCpH3EFW
 mHk6hibsYeSMd/g5CcMmDIXbbPUO8EnxOL5acaIhBzQoFHrh6g==
X-Google-Smtp-Source: ABdhPJztoqyBfFY2KXxT85X8Y/Ax7OzGQertwY9h8JpgU+l7DcAbqW0BwwvD3rZa3QG3r33gQqo4nkFENVJpAox8N24=
X-Received: by 2002:aa7:c644:: with SMTP id z4mr39520824edr.204.1624970042680; 
 Tue, 29 Jun 2021 05:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210616091244.33049-1-ysato@users.sourceforge.jp>
 <20210616091244.33049-2-ysato@users.sourceforge.jp>
In-Reply-To: <20210616091244.33049-2-ysato@users.sourceforge.jp>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 13:33:25 +0100
Message-ID: <CAFEAcA8GM0g3bq46avRV3Na1xEW3wqkRaTSm=opWPN+_JFsw6w@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/char: renesas_sci: Refactor for merge all SCI
 variant..
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Jun 2021 at 10:22, Yoshinori Sato <ysato@users.sourceforge.jp> wrote:
>
> In order to handle unified all of the SCI, SCIa and SCIF in one part,
> to separate the transmission and reception portion and a register portion.
>
> RenesasSCIBase - common registers operation and event handling.
> RenesasSCIA - SCIa specific reigisters / functions.
>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  include/hw/char/renesas_sci.h |  80 ++++-
>  include/hw/rx/rx62n.h         |   2 +-
>  hw/char/renesas_sci.c         | 568 +++++++++++++++++++++++-----------
>  hw/rx/rx62n.c                 |   2 +-
>  4 files changed, 457 insertions(+), 195 deletions(-)

I'm not going to ask you to split it up any further, but this patch
was really painful to review because it's making so many changes
which are changing multiple different things at once (which is part
of why I've been putting it off for two weeks). It should probably
have been at least four or five different patches. For future
contributions, if you make them as more, smaller, self-contained
commits as you go along they will likely be much easier to review.
(Personally I find that writing them that way to start with is much
easier than trying to split up a larger commit afterwards.)

> +typedef struct RenesasSCIBaseState {
>      /*< private >*/
>      SysBusDevice parent_obj;
> -    /*< public >*/
>
>      MemoryRegion memory;
> -    QEMUTimer timer;
> +    QEMUTimer *event_timer;
> +
> +    /*< public >*/
> +    uint64_t input_freq;
> +    int64_t etu;
> +    int64_t trtime;
> +    int64_t tx_start_time;
> +    Fifo8 rxfifo;
> +    int regshift;
> +    uint32_t unit;
>      CharBackend chr;
>      qemu_irq irq[SCI_NR_IRQ];
> +    struct {
> +        int64_t time;
> +        int64_t (*handler)(struct RenesasSCIBaseState *sci);

At least in this series, these handler function pointers seem
to be set in the device init function and never changed. Could
they be pointers in the class struct instead ?

> +    } event[NR_SCI_EVENT];
>
> +    /* common SCI register */
>      uint8_t smr;
>      uint8_t brr;
>      uint8_t scr;
>      uint8_t tdr;
> -    uint8_t ssr;
> -    uint8_t rdr;
> +    uint16_t Xsr;
> +} RenesasSCIBaseState;
> +
> +struct RenesasSCIAState {
> +    RenesasSCIBaseState parent_obj;
> +
> +    /* SCIa specific register */
>      uint8_t scmr;
>      uint8_t semr;
> -
> -    uint8_t read_ssr;
> -    int64_t trtime;
> -    int64_t rx_next;
> -    uint64_t input_freq;
>  };
>
> +typedef struct RenesasSCIBaseClass {
> +    SysBusDeviceClass parent;
> +
> +    const struct MemoryRegionOps *ops;
> +    void (*irq_fn)(struct RenesasSCIBaseState *sci, int request);
> +    int (*divrate)(struct RenesasSCIBaseState *sci);
> +} RenesasSCIBaseClass;
> +
> +typedef struct RenesasSCIAClass {
> +    RenesasSCIBaseClass parent;
> +
> +    void (*p_irq_fn)(struct RenesasSCIBaseState *sci, int request);
> +    int (*p_divrate)(struct RenesasSCIBaseState *sci);

These two fields seem to never be used. (If they can be removed,
then you don't need a class struct at all for RenesasSCIA.)

> +} RenesasSCIAClass;
> +
>  #endif
> diff --git a/include/hw/rx/rx62n.h b/include/hw/rx/rx62n.h
> index 3ed80dba0d..d6e6e168f9 100644
> --- a/include/hw/rx/rx62n.h
> +++ b/include/hw/rx/rx62n.h
> @@ -57,7 +57,7 @@ struct RX62NState {
>      RXICUState icu;
>      RTMRState tmr[RX62N_NR_TMR];
>      RCMTState cmt[RX62N_NR_CMT];
> -    RSCIState sci[RX62N_NR_SCI];
> +    RenesasSCIAState sci[RX62N_NR_SCI];
>
>      MemoryRegion *sysmem;
>      bool kernel;
> diff --git a/hw/char/renesas_sci.c b/hw/char/renesas_sci.c
> index 1c63467290..c1126b7817 100644
> --- a/hw/char/renesas_sci.c
> +++ b/hw/char/renesas_sci.c
> @@ -4,7 +4,7 @@
>   * Datasheet: RX62N Group, RX621 Group User's Manual: Hardware
>   *            (Rev.1.40 R01UH0033EJ0140)
>   *
> - * Copyright (c) 2019 Yoshinori Sato
> + * Copyright (c) 2020 Yoshinori Sato
>   *
>   * SPDX-License-Identifier: GPL-2.0-or-later
>   *
> @@ -23,15 +23,22 @@
>
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
> +#include "qapi/error.h"
> +#include "qemu-common.h"
> +#include "hw/hw.h"
>  #include "hw/irq.h"
> +#include "hw/sysbus.h"
>  #include "hw/registerfields.h"
> -#include "hw/qdev-properties.h"
>  #include "hw/qdev-properties-system.h"
>  #include "hw/char/renesas_sci.h"
>  #include "migration/vmstate.h"
> +#include "qemu/error-report.h"
>
> -/* SCI register map */
> -REG8(SMR, 0)
> +/*
> + * SCI register map
> + * SCI(a) register size all 8bit.
> + */
> +REG32(SMR, 0) /* 8bit */
>    FIELD(SMR, CKS,  0, 2)
>    FIELD(SMR, MP,   2, 1)
>    FIELD(SMR, STOP, 3, 1)
> @@ -39,263 +46,447 @@ REG8(SMR, 0)
>    FIELD(SMR, PE,   5, 1)
>    FIELD(SMR, CHR,  6, 1)
>    FIELD(SMR, CM,   7, 1)
> -REG8(BRR, 1)
> -REG8(SCR, 2)
> -  FIELD(SCR, CKE,  0, 2)
> +REG32(BRR, 4) /* 8bit */
> +REG32(SCR, 8)
> +  FIELD(SCR, CKE, 0, 2)

This is an unnecessary whitespace change. In the old code, these FIELD()
macro lines have been set up so that the bitnumber arguments align.
I don't have a strong opinion on whether that's better or worse than
just having one space after every comma. But if you want to change it
then please:
(1) do that change in its own patch
(2) do it consistently -- here you have changed CKE but left RE, TE, etc
alone. Similarly below you change the line for SRR.ERR but leave
SRR.MPB alone.

>    FIELD(SCR, TEIE, 2, 1)
>    FIELD(SCR, MPIE, 3, 1)
> +  FIELD(SCR, REIE, 3, 1)
>    FIELD(SCR, RE,   4, 1)
>    FIELD(SCR, TE,   5, 1)
>    FIELD(SCR, RIE,  6, 1)
>    FIELD(SCR, TIE,  7, 1)
> -REG8(TDR, 3)
> -REG8(SSR, 4)
> +REG32(TDR, 12) /* 8bit */
> +REG32(SSR, 16) /* 8bit */
>    FIELD(SSR, MPBT, 0, 1)
>    FIELD(SSR, MPB,  1, 1)
>    FIELD(SSR, TEND, 2, 1)
> -  FIELD(SSR, ERR,  3, 3)
> +  FIELD(SSR, ERR, 3, 3)
>      FIELD(SSR, PER,  3, 1)
>      FIELD(SSR, FER,  4, 1)
>      FIELD(SSR, ORER, 5, 1)
>    FIELD(SSR, RDRF, 6, 1)
>    FIELD(SSR, TDRE, 7, 1)
> -REG8(RDR, 5)
> -REG8(SCMR, 6)
> +REG32(RDR, 20) /* 8bit */
> +REG32(SCMR, 24) /* 8bit */
>    FIELD(SCMR, SMIF, 0, 1)
>    FIELD(SCMR, SINV, 2, 1)
>    FIELD(SCMR, SDIR, 3, 1)
>    FIELD(SCMR, BCP2, 7, 1)
> -REG8(SEMR, 7)
> +REG8(SEMR, 28)
>    FIELD(SEMR, ACS0, 0, 1)
>    FIELD(SEMR, ABCS, 4, 1)


>
> -static void rsci_realize(DeviceState *dev, Error **errp)
> +static void rsci_common_realize(DeviceState *dev, Error **errp)
>  {
> -    RSCIState *sci = RSCI(dev);
> +    RenesasSCIBaseState *sci = RENESAS_SCI_BASE(dev);
> +    int r;
>
> -    if (sci->input_freq == 0) {
> +    r = sci->regshift;
> +    if ((r % 8) != 0 || ((r / 8) >> 1) > 2) {
>          qemu_log_mask(LOG_GUEST_ERROR,
> -                      "renesas_sci: input-freq property must be set.");
> +                      "renesas_sci: Invalid register size.");
>          return;
>      }
> -    qemu_chr_fe_set_handlers(&sci->chr, can_receive, receive,
> -                             sci_event, NULL, sci, NULL, true);
> +    sci->regshift = (r / 8) >> 1;
> +    sci->smr = sci->scr = 0x00;
> +    sci->brr = 0xff;
> +    sci->tdr = 0xff;
> +    sci->Xsr = 0x84;

realize functions shouldn't generally set state fields like
this -- instead that should be done in the device's reset function.
(These devices seem to all be missing a reset function.)

> +    update_trtime(sci);
> +
>  }


>  static const VMStateDescription vmstate_rsci = {
> @@ -303,49 +494,74 @@ static const VMStateDescription vmstate_rsci = {
>      .version_id = 1,
>      .minimum_version_id = 1,
>      .fields = (VMStateField[]) {
> -        VMSTATE_INT64(trtime, RSCIState),
> -        VMSTATE_INT64(rx_next, RSCIState),
> -        VMSTATE_UINT8(smr, RSCIState),
> -        VMSTATE_UINT8(brr, RSCIState),
> -        VMSTATE_UINT8(scr, RSCIState),
> -        VMSTATE_UINT8(tdr, RSCIState),
> -        VMSTATE_UINT8(ssr, RSCIState),
> -        VMSTATE_UINT8(rdr, RSCIState),
> -        VMSTATE_UINT8(scmr, RSCIState),
> -        VMSTATE_UINT8(semr, RSCIState),
> -        VMSTATE_UINT8(read_ssr, RSCIState),
> -        VMSTATE_TIMER(timer, RSCIState),
>          VMSTATE_END_OF_LIST()

This change seems to have lost all the migration support.

>      }
>  };

thanks
-- PMM

