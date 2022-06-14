Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D115354A8E5
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 07:49:28 +0200 (CEST)
Received: from localhost ([::1]:37726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0zQd-00046E-Ai
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 01:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dz4list@gmail.com>)
 id 1o0zN2-00030P-HF; Tue, 14 Jun 2022 01:45:48 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:40505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dz4list@gmail.com>)
 id 1o0zMx-00050D-OE; Tue, 14 Jun 2022 01:45:42 -0400
Received: by mail-pg1-x530.google.com with SMTP id f65so7567850pgc.7;
 Mon, 13 Jun 2022 22:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=FjavgecEhALbRM/9+vPk6ZFbrNo3V0Qn1/sI7N1jDuU=;
 b=lpgZ2LUKI6InqIOOD9WLjAZu6SORyfk+isjz/RO26Ppa+tLx4QO2qIGw0rh1f/zTGU
 UFpK5rWXAHIn2iWvgQtnzHTyUoGFN/fs0eplmLw6lLmHuPiFQa/IOa81IWkdNph/UXGV
 mDHd3vzw/hL0d07Kkgho3B1JtzUzQAd+NuObsI6ir1m2RQGhGwKS4KovOsB8nxVjilIV
 3OmuyS65S1oYpYIAaMmwPma9Zyzex9V2OgjiVjBb2xUwiyIh4A3aHlNq9awZmiMIm2cS
 U3tMFFGZK+cYZGAEOYfHzBkcp3CRZPZwFAls860xbSE+IlQAfksYTY6Uh8UtrvGHHpIA
 oNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=FjavgecEhALbRM/9+vPk6ZFbrNo3V0Qn1/sI7N1jDuU=;
 b=k+1r5bGVVQJLH9MJvV3zwxBAUcgiE3LcALZmyftkjw+2bAoUuBuhLB2QZjxA7tkoEo
 zU0Da9sAhOZEo7uJqXoL0os+OVV1Qp9cZQWHESA/Jj3kQ6QgpD5G4aNOSblVyYqLx5We
 unquFjq2fOhe/XAgnY3iHMc1Dey1wgEtBsZ+w2eL04JVccszgGteHOQMheWraRfL2wdL
 GT80HOZPsZZEXq6EHgSrtaW2yy2L4JNNSL4uEtxR4TidTTP+4bfooG/F277po43ff6xr
 t6t1iI41YF9NYo+O2t9w2GLGqyhMNo7kPovfYcbrXOJSHlJFhnDdHJjugCaW+wZFPZPV
 jLKw==
X-Gm-Message-State: AOAM531TjUGdelSmNAyMVDprah/TXqQfuOFLsLccdCtCOYiUZskEMToI
 b4/2FmhdgXf8ME1dZ31G+ws=
X-Google-Smtp-Source: ABdhPJwf9DWgwvLIzCsj2RYfpUXtcjuUsnv1Dez/LAyzBCVelrFXftf+Py60IPbkP1OdTH3ekSekQQ==
X-Received: by 2002:a63:4d57:0:b0:405:1ff6:382a with SMTP id
 n23-20020a634d57000000b004051ff6382amr3058280pgl.250.1655185537233; 
 Mon, 13 Jun 2022 22:45:37 -0700 (PDT)
Received: from zhdaniel-fedora-MJ0FVN0B ([2620:10d:c090:500::2:9ac3])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a170902868100b0015ea3a491a1sm6134436plo.191.2022.06.13.22.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 22:45:36 -0700 (PDT)
Date: Mon, 13 Jun 2022 22:45:34 -0700
From: Dan Zhang <dz4list@gmail.com>
To: Peter Delevoryas <pdel@fb.com>
Cc: Iris Chen <irischenlj@fb.com>,
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
 Alistair Francis <alistair@alistair23.me>,
 "kwolf@redhat.com" <kwolf@redhat.com>,
 "hreitz@redhat.com" <hreitz@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "lvivier@redhat.com" <lvivier@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Iris Chen <irischenlj@gmail.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>
Subject: Re: [PATCH v2 1/2] hw: m25p80: add WP# pin and SRWD bit for write
 protection
Message-ID: <YqggfkLuTz4ryuL8@zhdaniel-fedora-MJ0FVN0B>
References: <20220609031320.2212468-1-irischenlj@fb.com>
 <20220609192201.GC10629@fralle-msi>
 <810A50A3-E9C2-4A62-ADF9-89DCC9BBD9BB@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <810A50A3-E9C2-4A62-ADF9-89DCC9BBD9BB@fb.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=dz4list@gmail.com; helo=mail-pg1-x530.google.com
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

Just find out how to use mutt to reply all in the thread.
repeat the previous comments. Add STATE_HIZ to handle decode_new_command
aborting gracefully. 

On Thu, Jun 09, 2022 at 08:06:00PM +0000, Peter Delevoryas wrote:
> 
> 
> > On Jun 9, 2022, at 12:22 PM, Francisco Iglesias <frasse.iglesias@gmail.com> wrote:
> > 
> > Hi Iris,
> > 
> > Looks good some, a couple of comments below.
> > 
> > On [2022 Jun 08] Wed 20:13:19, Iris Chen wrote:
> >> From: Iris Chen <irischenlj@gmail.com>
> >> 
> >> Signed-off-by: Iris Chen <irischenlj@gmail.com>
> >> ---
> >> Addressed all comments from V1. The biggest change: removed object_class_property_add.
> >> 
> >> hw/block/m25p80.c             | 37 +++++++++++++++++++++++++++++++++++
> >> tests/qtest/aspeed_smc-test.c |  2 ++
> >> 2 files changed, 39 insertions(+)
> >> 
> >> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> >> index 81ba3da4df..1a20bd55d4 100644
> >> --- a/hw/block/m25p80.c
> >> +++ b/hw/block/m25p80.c
> >> @@ -27,12 +27,14 @@
> >> #include "hw/qdev-properties.h"
> >> #include "hw/qdev-properties-system.h"
> >> #include "hw/ssi/ssi.h"
> >> +#include "hw/irq.h"
> >> #include "migration/vmstate.h"
> >> #include "qemu/bitops.h"
> >> #include "qemu/log.h"
> >> #include "qemu/module.h"
> >> #include "qemu/error-report.h"
> >> #include "qapi/error.h"
> >> +#include "qapi/visitor.h"
> >> #include "trace.h"
> >> #include "qom/object.h"
> >> 
> >> @@ -472,11 +474,13 @@ struct Flash {
> >>     uint8_t spansion_cr2v;
> >>     uint8_t spansion_cr3v;
> >>     uint8_t spansion_cr4v;
> >> +    bool wp_level;
> >>     bool write_enable;
> >>     bool four_bytes_address_mode;
> >>     bool reset_enable;
> >>     bool quad_enable;
> >>     bool aai_enable;
> >> +    bool status_register_write_disabled;
> >>     uint8_t ear;
> >> 
> >>     int64_t dirty_page;
> >> @@ -723,6 +727,21 @@ static void complete_collecting_data(Flash *s)
> >>         flash_erase(s, s->cur_addr, s->cmd_in_progress);
> >>         break;
> >>     case WRSR:
> >> +        /*
> >> +         * If WP# is low and status_register_write_disabled is high,
> >> +         * status register writes are disabled.
> >> +         * This is also called "hardware protected mode" (HPM). All other
> >> +         * combinations of the two states are called "software protected mode"
> >> +         * (SPM), and status register writes are permitted.
> >> +         */
> >> +        if ((s->wp_level == 0 && s->status_register_write_disabled)
> >> +            || !s->write_enable) {
> > 
> > 'write_enable' needs to be true in 'decode_new_cmd' when issueing the WRSR
> > command, otherwise the state machinery will not advance to this function
> > (meaning that above check for !s->write_enable will never hit as far as I can
> > tell). A suggestion is to move the check for wp_level and
> > status_reg_wr_disabled into 'decode_new_cmd' to for keeping it consistent.
> 
> Oh good catch! Yes actually, in our fork, we also removed the write_enable
> guard in decode_new_cmd. We either need both checks in decode_new_cmd,
> or both checks in complete_collecting_data.
> 
> I think we had some difficulty deciding whether to block command decoding,
> or to decode and ignore the command if restrictions are enabled.
> 
> The reason being that, in the qtest, the WRSR command code gets ignored, and
> then the subsequent write data gets interpreted as some random command code.
> We had elected to decode and ignore the command, but I think the
> datasheet actually describes that the command won’t be decoded successfully,
> so you’re probably right, we should put this logic in decode_new_cmd.
> 
> Most likely, the qtest will also need to be modified to reset the transfer
> state machine after a blocked write command. I can’t remember if
> exiting and re-entering user mode is sufficient for that, but something
> like that is probably possible.
> 
> Thanks for catching this!
> Peter
> 

I am proposing add a CMDState: STATE_HIZ to handle command decode fail
situation. When decode_new_command need abort the decoding and ignore
following
on input bytes of this transaction, set the state to STATE_HIZ.
And m25p80_transfer8() will ignore all the following on byte when in
this state.

This is to simulating the real device operation behavior
i.e. Macronix MX66L1G45G data sheet section 8 DEVICE OPERATION described
```
2. When an incorrect command is written to this device, it enters
standby mode and stays in standby mode until the next CS# falling edge.
In standby mode, This device's SO pin should be High-Z.
``` 
BRs
Dan Zhang
> > 
> >> +            qemu_log_mask(LOG_GUEST_ERROR,
> >> +                          "M25P80: Status register write is disabled!\n");
> >> +            break;
> >> +        }
> >> +        s->status_register_write_disabled = extract32(s->data[0], 7, 1);
> >> +
> >>         switch (get_man(s)) {
> >>         case MAN_SPANSION:
> >>             s->quad_enable = !!(s->data[1] & 0x02);
> >> @@ -1195,6 +1214,8 @@ static void decode_new_cmd(Flash *s, uint32_t value)
> >> 
> >>     case RDSR:
> >>         s->data[0] = (!!s->write_enable) << 1;
> >> +        s->data[0] |= (!!s->status_register_write_disabled) << 7;
> >> +
> >>         if (get_man(s) == MAN_MACRONIX || get_man(s) == MAN_ISSI) {
> >>             s->data[0] |= (!!s->quad_enable) << 6;
> >>         }
> >> @@ -1484,6 +1505,14 @@ static uint32_t m25p80_transfer8(SSIPeripheral *ss, uint32_t tx)
> >>     return r;
> >> }
> >> 
> >> +static void m25p80_write_protect_pin_irq_handler(void *opaque, int n, int level)
> >> +{
> >> +    Flash *s = M25P80(opaque);
> >> +    /* WP# is just a single pin. */
> >> +    assert(n == 0);
> >> +    s->wp_level = !!level;
> >> +}
> >> +
> >> static void m25p80_realize(SSIPeripheral *ss, Error **errp)
> >> {
> >>     Flash *s = M25P80(ss);
> >> @@ -1515,12 +1544,18 @@ static void m25p80_realize(SSIPeripheral *ss, Error **errp)
> >>         s->storage = blk_blockalign(NULL, s->size);
> >>         memset(s->storage, 0xFF, s->size);
> >>     }
> >> +
> >> +    qdev_init_gpio_in_named(DEVICE(s),
> >> +                            m25p80_write_protect_pin_irq_handler, "WP#", 1);
> >> }
> >> 
> >> static void m25p80_reset(DeviceState *d)
> >> {
> >>     Flash *s = M25P80(d);
> >> 
> >> +    s->wp_level = true;
> >> +    s->status_register_write_disabled = false;
> >> +
> >>     reset_memory(s);
> >> }
> >> 
> >> @@ -1601,6 +1636,8 @@ static const VMStateDescription vmstate_m25p80 = {
> >>         VMSTATE_UINT8(needed_bytes, Flash),
> >>         VMSTATE_UINT8(cmd_in_progress, Flash),
> >>         VMSTATE_UINT32(cur_addr, Flash),
> >> +        VMSTATE_BOOL(wp_level, Flash),
> >> +        VMSTATE_BOOL(status_register_write_disabled, Flash),
> > 
> > Above needs to be added through a subsection, you can see commit 465ef47abe3
> > for an example an also read about this in docs/devel/migration.rst.
> > 
> > Thank you,
> > Best regads,
> > Francisco Iglesias
> > 
> > 
> >>         VMSTATE_BOOL(write_enable, Flash),
> >>         VMSTATE_BOOL(reset_enable, Flash),
> >>         VMSTATE_UINT8(ear, Flash),
> >> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
> >> index ec233315e6..c5d97d4410 100644
> >> --- a/tests/qtest/aspeed_smc-test.c
> >> +++ b/tests/qtest/aspeed_smc-test.c
> >> @@ -56,7 +56,9 @@ enum {
> >>     BULK_ERASE = 0xc7,
> >>     READ = 0x03,
> >>     PP = 0x02,
> >> +    WRSR = 0x1,
> >>     WREN = 0x6,
> >> +    SRWD = 0x80,
> >>     RESET_ENABLE = 0x66,
> >>     RESET_MEMORY = 0x99,
> >>     EN_4BYTE_ADDR = 0xB7,
> >> -- 
> >> 2.30.2
> >> 
> >> 
> 

