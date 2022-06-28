Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1324355E5F1
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 18:24:45 +0200 (CEST)
Received: from localhost ([::1]:48350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6E16-0001uS-0c
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 12:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1o6DzP-0000XJ-Je; Tue, 28 Jun 2022 12:22:59 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:33344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1o6DzN-0007xE-WD; Tue, 28 Jun 2022 12:22:59 -0400
Received: by mail-lf1-x133.google.com with SMTP id a4so9634614lfm.0;
 Tue, 28 Jun 2022 09:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=6bfNHjcWTLZx+fqrsKoC4Sp6/TjBURynx+DBZM4iFBo=;
 b=QT0SZYM+tVtHBXIcMOt8pHn38pPl7K/vqa75PrIxKQJHYMpLtWTCRX1D/07oLH2v7Q
 ZHOi36S4OIolDQsyQu7nPa9QIBDWbTcHtH14Cgei6L3NZkV6vDdsAeCJX9FOwGOBzpKQ
 r6kZNwwH9q7+0EQ6URCdEpxP3a7aVHOTo8yyVADOHNmiyjBlBpYLz3frI2PiuVcYMqvL
 bWJo/osHLXLrVSad5kEbwT4fVlke3KIVVk6CAlgtl6bK8Af9L8TBMZwD5P9cBbHqTGTs
 3vqNQgX2Qe4NBZHnuEBUE5cR7ymYmeXrt7cB9D2LP3hRDqVl3X2tax2MefFdjjtO0wJ3
 34/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=6bfNHjcWTLZx+fqrsKoC4Sp6/TjBURynx+DBZM4iFBo=;
 b=f87YYjxhtyCrb7wFoqmJN1t+5yZDcctOChBHBER3trrGT5MnXJTeM9b0rHJE1++zZr
 DaoW/Iv149XBk/YMdOw9A2SlvEMRXbJhxlZgms0C5zdasS5SADAlU2WM/5+ygihotGdo
 tgSAs1CWuxsPxfOr+bb3ExKVumkPumt+ZprbyDJIao/U7yj2XhRDzh4icu38mkeO5hYr
 8zxrnl8dPdluAVErIzf/drGpdcDYUrpP0QdwkKdC530CtPJNK/sUZm7I81bBfk/juD93
 2vyztzmatDVFT+PavtfNz817h4FzseIzQEXaFJ5ZfP7V2sIy11dDZ95QHziDvS+ESP7K
 4INQ==
X-Gm-Message-State: AJIora/jze9ipz5uBEGcE0vzb01X5suWsg0rpt7ELcBAA+6KP7rudnjz
 k5Nur4SYAqME+bndU395m/g=
X-Google-Smtp-Source: AGRyM1vO01DPpFelhA5wdTCv5mrxEaD1BmKo9hFrIrsfPmZwre9FzlycR3Gk2NU38YijUaAhCpp/3w==
X-Received: by 2002:a05:6512:130a:b0:47d:b429:79fb with SMTP id
 x10-20020a056512130a00b0047db42979fbmr13071284lfu.559.1656433373694; 
 Tue, 28 Jun 2022 09:22:53 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 bf27-20020a2eaa1b000000b0025911ee8411sm1857972ljb.14.2022.06.28.09.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 09:22:52 -0700 (PDT)
Date: Tue, 28 Jun 2022 18:22:50 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: Iris Chen <irischenlj@fb.com>, pdel@fb.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, patrick@stwcx.xyz, alistair@alistair23.me,
 kwolf@redhat.com, hreitz@redhat.com, peter.maydell@linaro.org,
 andrew@aj.id.au, joel@jms.id.au, thuth@redhat.com,
 lvivier@redhat.com, pbonzini@redhat.com, qemu-block@nongnu.org,
 dz4list@gmail.com, Iris Chen <irischenlj@gmail.com>
Subject: Re: [PATCH v4] hw: m25p80: add WP# pin and SRWD bit for write
 protection
Message-ID: <20220628162249.GA10966@fralle-msi>
References: <20220621202427.2680413-1-irischenlj@fb.com>
 <20220622094542.GE10629@fralle-msi>
 <61a77a3a-ca38-f4d1-8c18-5d240360e0ba@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <61a77a3a-ca38-f4d1-8c18-5d240360e0ba@kaod.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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

On [2022 Jun 28] Tue 17:52:50, Cédric Le Goater wrote:
> Alistair, Francisco,
> 
> On 6/22/22 11:45, Francisco Iglesias wrote:
> > On [2022 Jun 21] Tue 13:24:27, Iris Chen wrote:
> > > From: Iris Chen <irischenlj@gmail.com>
> > > 
> > > Signed-off-by: Iris Chen <irischenlj@gmail.com>
> > 
> > Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
> 
> I am planning to include this patch in the next aspeed PR if that's
> OK with you.

Sounds good to me Cédric!

Best regards,
Francisco

> 
> Thanks,
> 
> C.
> 
> > 
> > > ---
> > > Fixed .needed for subsection and suggestions from Francisco
> > > 
> > >   hw/block/m25p80.c | 82 ++++++++++++++++++++++++++++++++++++++---------
> > >   1 file changed, 67 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> > > index 81ba3da4df..3045dda53b 100644
> > > --- a/hw/block/m25p80.c
> > > +++ b/hw/block/m25p80.c
> > > @@ -472,11 +472,13 @@ struct Flash {
> > >       uint8_t spansion_cr2v;
> > >       uint8_t spansion_cr3v;
> > >       uint8_t spansion_cr4v;
> > > +    bool wp_level;
> > >       bool write_enable;
> > >       bool four_bytes_address_mode;
> > >       bool reset_enable;
> > >       bool quad_enable;
> > >       bool aai_enable;
> > > +    bool status_register_write_disabled;
> > >       uint8_t ear;
> > >       int64_t dirty_page;
> > > @@ -723,6 +725,8 @@ static void complete_collecting_data(Flash *s)
> > >           flash_erase(s, s->cur_addr, s->cmd_in_progress);
> > >           break;
> > >       case WRSR:
> > > +        s->status_register_write_disabled = extract32(s->data[0], 7, 1);
> > > +
> > >           switch (get_man(s)) {
> > >           case MAN_SPANSION:
> > >               s->quad_enable = !!(s->data[1] & 0x02);
> > > @@ -1165,22 +1169,34 @@ static void decode_new_cmd(Flash *s, uint32_t value)
> > >           break;
> > >       case WRSR:
> > > -        if (s->write_enable) {
> > > -            switch (get_man(s)) {
> > > -            case MAN_SPANSION:
> > > -                s->needed_bytes = 2;
> > > -                s->state = STATE_COLLECTING_DATA;
> > > -                break;
> > > -            case MAN_MACRONIX:
> > > -                s->needed_bytes = 2;
> > > -                s->state = STATE_COLLECTING_VAR_LEN_DATA;
> > > -                break;
> > > -            default:
> > > -                s->needed_bytes = 1;
> > > -                s->state = STATE_COLLECTING_DATA;
> > > -            }
> > > -            s->pos = 0;
> > > +        /*
> > > +         * If WP# is low and status_register_write_disabled is high,
> > > +         * status register writes are disabled.
> > > +         * This is also called "hardware protected mode" (HPM). All other
> > > +         * combinations of the two states are called "software protected mode"
> > > +         * (SPM), and status register writes are permitted.
> > > +         */
> > > +        if ((s->wp_level == 0 && s->status_register_write_disabled)
> > > +            || !s->write_enable) {
> > > +            qemu_log_mask(LOG_GUEST_ERROR,
> > > +                          "M25P80: Status register write is disabled!\n");
> > > +            break;
> > > +        }
> > > +
> > > +        switch (get_man(s)) {
> > > +        case MAN_SPANSION:
> > > +            s->needed_bytes = 2;
> > > +            s->state = STATE_COLLECTING_DATA;
> > > +            break;
> > > +        case MAN_MACRONIX:
> > > +            s->needed_bytes = 2;
> > > +            s->state = STATE_COLLECTING_VAR_LEN_DATA;
> > > +            break;
> > > +        default:
> > > +            s->needed_bytes = 1;
> > > +            s->state = STATE_COLLECTING_DATA;
> > >           }
> > > +        s->pos = 0;
> > >           break;
> > >       case WRDI:
> > > @@ -1195,6 +1211,8 @@ static void decode_new_cmd(Flash *s, uint32_t value)
> > >       case RDSR:
> > >           s->data[0] = (!!s->write_enable) << 1;
> > > +        s->data[0] |= (!!s->status_register_write_disabled) << 7;
> > > +
> > >           if (get_man(s) == MAN_MACRONIX || get_man(s) == MAN_ISSI) {
> > >               s->data[0] |= (!!s->quad_enable) << 6;
> > >           }
> > > @@ -1484,6 +1502,14 @@ static uint32_t m25p80_transfer8(SSIPeripheral *ss, uint32_t tx)
> > >       return r;
> > >   }
> > > +static void m25p80_write_protect_pin_irq_handler(void *opaque, int n, int level)
> > > +{
> > > +    Flash *s = M25P80(opaque);
> > > +    /* WP# is just a single pin. */
> > > +    assert(n == 0);
> > > +    s->wp_level = !!level;
> > > +}
> > > +
> > >   static void m25p80_realize(SSIPeripheral *ss, Error **errp)
> > >   {
> > >       Flash *s = M25P80(ss);
> > > @@ -1515,12 +1541,18 @@ static void m25p80_realize(SSIPeripheral *ss, Error **errp)
> > >           s->storage = blk_blockalign(NULL, s->size);
> > >           memset(s->storage, 0xFF, s->size);
> > >       }
> > > +
> > > +    qdev_init_gpio_in_named(DEVICE(s),
> > > +                            m25p80_write_protect_pin_irq_handler, "WP#", 1);
> > >   }
> > >   static void m25p80_reset(DeviceState *d)
> > >   {
> > >       Flash *s = M25P80(d);
> > > +    s->wp_level = true;
> > > +    s->status_register_write_disabled = false;
> > > +
> > >       reset_memory(s);
> > >   }
> > > @@ -1587,6 +1619,25 @@ static const VMStateDescription vmstate_m25p80_aai_enable = {
> > >       }
> > >   };
> > > +static bool m25p80_wp_level_srwd_needed(void *opaque)
> > > +{
> > > +    Flash *s = (Flash *)opaque;
> > > +
> > > +    return !s->wp_level || s->status_register_write_disabled;
> > > +}
> > > +
> > > +static const VMStateDescription vmstate_m25p80_write_protect = {
> > > +    .name = "m25p80/write_protect",
> > > +    .version_id = 1,
> > > +    .minimum_version_id = 1,
> > > +    .needed = m25p80_wp_level_srwd_needed,
> > > +    .fields = (VMStateField[]) {
> > > +        VMSTATE_BOOL(wp_level, Flash),
> > > +        VMSTATE_BOOL(status_register_write_disabled, Flash),
> > > +        VMSTATE_END_OF_LIST()
> > > +    }
> > > +};
> > > +
> > >   static const VMStateDescription vmstate_m25p80 = {
> > >       .name = "m25p80",
> > >       .version_id = 0,
> > > @@ -1618,6 +1669,7 @@ static const VMStateDescription vmstate_m25p80 = {
> > >       .subsections = (const VMStateDescription * []) {
> > >           &vmstate_m25p80_data_read_loop,
> > >           &vmstate_m25p80_aai_enable,
> > > +        &vmstate_m25p80_write_protect,
> > >           NULL
> > >       }
> > >   };
> > > -- 
> > > 2.30.2
> > > 
> > > 
> 

