Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF86550034
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jun 2022 00:50:38 +0200 (CEST)
Received: from localhost ([::1]:44178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2KnV-0002y2-44
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 18:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dz4list@gmail.com>)
 id 1o2KlU-0001sg-0x; Fri, 17 Jun 2022 18:48:32 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:37439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dz4list@gmail.com>)
 id 1o2KlR-0000aI-W0; Fri, 17 Jun 2022 18:48:31 -0400
Received: by mail-pf1-x42d.google.com with SMTP id bo5so5294981pfb.4;
 Fri, 17 Jun 2022 15:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vKt6qXBy1P/VIxDQAKo3kB7r6d4pXppBGJKNlqwgA50=;
 b=bPt34i9RC6MTotERvQ9+ZIjgoTuS8MBr36x7y+ETipnLEYzwYY4xvDp5y4srD69Yg6
 oVB+DAZOcPxI4sGuGTO1Zo+tDGYVEPGQx7QbrP4U3oVVyDS1y/XQ18UuLxJEQEe3Jfln
 IWO3a2oydlOT8cLKITsvP6cNxxL/1rZmafipDZqvSaQ/xNJ4GeP3k/Cz7aZJJTohX/fm
 4wyWkukIaslXQHj63hOo02cX+Mk2gHzQLoVOEtFfegRAOIj4ONUKlnuOaqooKoMT5W4e
 gMLGWydqjKHCAmnZv4uQKp+VqddN0YVgp7r4CkXFFlZeeXTANtiNa3A/1dvYckMZQFkg
 0ypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vKt6qXBy1P/VIxDQAKo3kB7r6d4pXppBGJKNlqwgA50=;
 b=sILQr6oPvs06kKIZG+gPyBqNdrcqZYvoricfhU4IqY46/6t8sdeZK4sSBLD+hgb2Zn
 NKDndEuqiGNQPdoVdHPlvDf7kpyXesOtuz+qM7wF/iqxI27pc+4buqMPn8WxTXOAygqN
 MvZgb3BmAgU9DIMZEbJVGwXyi1Cpzv/Ia2xeXLtzlqiqZww5kf7tT1U1v/XiPf6PKjGT
 x5Oxc3huLKxGxinf5nRnyhRrUVImi9RdJWmAqpXt+ALEpBgzK1rxmPpCzRinNqcXT/cP
 k6++ar7azANToqs9lF/drKUzULkX31euRCnwmW6xT+NDlPKllnV6BLb7c8qHrqQ1N7b5
 ACTw==
X-Gm-Message-State: AJIora+zA3NMY0eosw4ViQ9Xwj6JquIYN/UDoXAMzr9lXkhiCqvjSjOC
 NyR8bWb9lmbqyE8OLJtGvs4=
X-Google-Smtp-Source: AGRyM1uBOgIdIxVZvDBxuKQhNQz3vUmjm9eq9TR5gO2DtJF1LnOe/Jr9G/lvSsC7g1P84d7bq+KoPw==
X-Received: by 2002:a63:9752:0:b0:3c6:5a7a:5bd6 with SMTP id
 d18-20020a639752000000b003c65a7a5bd6mr11149681pgo.390.1655506107349; 
 Fri, 17 Jun 2022 15:48:27 -0700 (PDT)
Received: from zhdaniel-fedora-MJ0FVN0B ([2620:10d:c090:500::2:9ac3])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a62f80c000000b005185407eda5sm4219251pfh.44.2022.06.17.15.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 15:48:26 -0700 (PDT)
Date: Fri, 17 Jun 2022 15:48:24 -0700
From: Dan Zhang <dz4list@gmail.com>
To: Iris Chen <irischenlj@fb.com>
Cc: pdel@fb.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, clg@kaod.org,
 patrick@stwcx.xyz, alistair@alistair23.me, kwolf@redhat.com,
 hreitz@redhat.com, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, thuth@redhat.com, lvivier@redhat.com,
 pbonzini@redhat.com, qemu-block@nongnu.org
Subject: Re: [PATCH v3 1/2] hw: m25p80: add WP# pin and SRWD bit for write
 protection
Message-ID: <Yq0EuPMT+c+Kad6B@zhdaniel-fedora-MJ0FVN0B>
References: <20220617220245.2285150-1-irischenlj@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617220245.2285150-1-irischenlj@fb.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=dz4list@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Fri, Jun 17, 2022 at 03:02:45PM -0700, Iris Chen wrote:
> Signed-off-by: Iris Chen <irischenlj@fb.com>
> ---
> Thanks everyone for your comments. This is a v3 patch that addresses all 
> suggestions (moving write_enable to decode_new_cmd). 
> I am waiting on some feedback from Dan's (dz4list@gmail.com) patch
> regarding adding a STATE_STANDBY state. 
The STATE_STANDBY can be use to handle the current code's potential issue:
The two data bytes of the WRSR instruction will get interprted as the
new command when abort because of HPM is on. If the data bytes coincident
be a legimtate command, the model will introduce tricky behavior when
HPM is on.

BRs
Dan
> 
> Currently, all tests are passing. 
>  
>  hw/block/m25p80.c | 77 ++++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 62 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 81ba3da4df..12a59ca57c 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -27,12 +27,14 @@
>  #include "hw/qdev-properties.h"
>  #include "hw/qdev-properties-system.h"
>  #include "hw/ssi/ssi.h"
> +#include "hw/irq.h"
>  #include "migration/vmstate.h"
>  #include "qemu/bitops.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
> +#include "qapi/visitor.h"
>  #include "trace.h"
>  #include "qom/object.h"
>  
> @@ -472,11 +474,13 @@ struct Flash {
>      uint8_t spansion_cr2v;
>      uint8_t spansion_cr3v;
>      uint8_t spansion_cr4v;
> +    bool wp_level;
>      bool write_enable;
>      bool four_bytes_address_mode;
>      bool reset_enable;
>      bool quad_enable;
>      bool aai_enable;
> +    bool status_register_write_disabled;
>      uint8_t ear;
>  
>      int64_t dirty_page;
> @@ -723,6 +727,8 @@ static void complete_collecting_data(Flash *s)
>          flash_erase(s, s->cur_addr, s->cmd_in_progress);
>          break;
>      case WRSR:
> +        s->status_register_write_disabled = extract32(s->data[0], 7, 1);
> +
>          switch (get_man(s)) {
>          case MAN_SPANSION:
>              s->quad_enable = !!(s->data[1] & 0x02);
> @@ -1165,22 +1171,34 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>          break;
>  
>      case WRSR:
> -        if (s->write_enable) {
> -            switch (get_man(s)) {
> -            case MAN_SPANSION:
> -                s->needed_bytes = 2;
> -                s->state = STATE_COLLECTING_DATA;
> -                break;
> -            case MAN_MACRONIX:
> -                s->needed_bytes = 2;
> -                s->state = STATE_COLLECTING_VAR_LEN_DATA;
> -                break;
> -            default:
> -                s->needed_bytes = 1;
> -                s->state = STATE_COLLECTING_DATA;
> -            }
> -            s->pos = 0;
> +        /*
> +         * If WP# is low and status_register_write_disabled is high,
> +         * status register writes are disabled.
> +         * This is also called "hardware protected mode" (HPM). All other
> +         * combinations of the two states are called "software protected mode"
> +         * (SPM), and status register writes are permitted.
> +         */
> +        if ((s->wp_level == 0 && s->status_register_write_disabled)
> +            || !s->write_enable) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "M25P80: Status register write is disabled!\n");
> +            break;
>          }
> +
> +        switch (get_man(s)) {
> +        case MAN_SPANSION:
> +            s->needed_bytes = 2;
> +            s->state = STATE_COLLECTING_DATA;
> +            break;
> +        case MAN_MACRONIX:
> +            s->needed_bytes = 2;
> +            s->state = STATE_COLLECTING_VAR_LEN_DATA;
> +            break;
> +        default:
> +            s->needed_bytes = 1;
> +            s->state = STATE_COLLECTING_DATA;
> +        }
> +        s->pos = 0;
>          break;
>  
>      case WRDI:
> @@ -1195,6 +1213,8 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>  
>      case RDSR:
>          s->data[0] = (!!s->write_enable) << 1;
> +        s->data[0] |= (!!s->status_register_write_disabled) << 7;
> +
>          if (get_man(s) == MAN_MACRONIX || get_man(s) == MAN_ISSI) {
>              s->data[0] |= (!!s->quad_enable) << 6;
>          }
> @@ -1484,6 +1504,14 @@ static uint32_t m25p80_transfer8(SSIPeripheral *ss, uint32_t tx)
>      return r;
>  }
>  
> +static void m25p80_write_protect_pin_irq_handler(void *opaque, int n, int level)
> +{
> +    Flash *s = M25P80(opaque);
> +    /* WP# is just a single pin. */
> +    assert(n == 0);
> +    s->wp_level = !!level;
> +}
> +
>  static void m25p80_realize(SSIPeripheral *ss, Error **errp)
>  {
>      Flash *s = M25P80(ss);
> @@ -1515,12 +1543,18 @@ static void m25p80_realize(SSIPeripheral *ss, Error **errp)
>          s->storage = blk_blockalign(NULL, s->size);
>          memset(s->storage, 0xFF, s->size);
>      }
> +
> +    qdev_init_gpio_in_named(DEVICE(s),
> +                            m25p80_write_protect_pin_irq_handler, "WP#", 1);
>  }
>  
>  static void m25p80_reset(DeviceState *d)
>  {
>      Flash *s = M25P80(d);
>  
> +    s->wp_level = true;
> +    s->status_register_write_disabled = false;
> +
>      reset_memory(s);
>  }
>  
> @@ -1587,6 +1621,18 @@ static const VMStateDescription vmstate_m25p80_aai_enable = {
>      }
>  };
>  
> +static const VMStateDescription vmstate_m25p80_write_protect = {
> +    .name = "m25p80/write_protect",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = false,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_BOOL(wp_level, Flash),
> +        VMSTATE_BOOL(status_register_write_disabled, Flash),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static const VMStateDescription vmstate_m25p80 = {
>      .name = "m25p80",
>      .version_id = 0,
> @@ -1618,6 +1664,7 @@ static const VMStateDescription vmstate_m25p80 = {
>      .subsections = (const VMStateDescription * []) {
>          &vmstate_m25p80_data_read_loop,
>          &vmstate_m25p80_aai_enable,
> +        &vmstate_m25p80_write_protect,
>          NULL
>      }
>  };
> -- 
> 2.30.2
> 

