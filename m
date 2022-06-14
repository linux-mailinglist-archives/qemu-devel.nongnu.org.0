Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E5F54A95D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 08:24:24 +0200 (CEST)
Received: from localhost ([::1]:60180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0zyR-00049m-08
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 02:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dz4list@gmail.com>)
 id 1o0ztZ-0002EQ-TN; Tue, 14 Jun 2022 02:19:22 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:46755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dz4list@gmail.com>)
 id 1o0ztX-00012H-Rl; Tue, 14 Jun 2022 02:19:21 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 k5-20020a17090a404500b001e8875e6242so8129852pjg.5; 
 Mon, 13 Jun 2022 23:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=jAfsXwgQUhkPTz8dcAg5d5mMyCyFN94Lq6MABw/jKHM=;
 b=JzjfPG+453tplbPavoaRlrbMTnMKn7mcrvGhPbgKeU+Bs92B9dMDFv2RWe2WpUHDcH
 qvNJWZJGSVUg7xJISCtaWfARxnKlXM/EhVIJgozNCFf6k00py/L9T+bYGqfDADzyT1iO
 PSMBPjL53FarAkLmSWW6jGRZ/mRfJceqKtZPsx9DZKP8mIbstf3dK9QPnodC5l21/+Pj
 WS8+gcIf7NkUyvKIybNAZB6pajsgDOfGGexums8wRKO7bBXff43O15sT29Oc79qiKGVf
 8k0bqW7rjhCVLkoKWBMv2yN/je6UoqXL3TLKcUK658Et/hEU9UDp5AdA9jwAXJWoAfJb
 FCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jAfsXwgQUhkPTz8dcAg5d5mMyCyFN94Lq6MABw/jKHM=;
 b=n5VfyNub1vpW17DxzrpRai4bk4ERDLFZ/cto1wZ4Hjx2sDHUavMeeEBoEsgPfJ+Jc9
 yXx3Yr6/J4SNNDnChqsApTVhpqAtMCbQcCvHojh2uBn8pZc/zJP0EbGb3HYGIMzFfWVE
 mzFk1UBTtYNNtLF+igE3rsLIq9LGAlJsH9XrPSoEjpdM2EW9mn1pYgkJeovr5EtXtp2c
 382fvOyXi5k4mQLumKJdZhewMy39nZ26Yx0KgdBUsQ1I3RyB6AQ1uLBzWt2NY5zw2HtK
 4Nh+ntp09PxclpX65naNGavwXIt48XUuobIiXRUmTuO/G4r53cCE1i+o9rg3kKCWq/rR
 G0MA==
X-Gm-Message-State: AJIora8pQxq4zow6OLW/jyUp6DIOOeTqQEdFZEnq1KfVmKBS1IllTjhj
 xTVYLh7lXp1/ECTHAfQ/T/8=
X-Google-Smtp-Source: AGRyM1vZAL2iKX0ScrjGCxLGap5dpt8JADVrkYdJPA1no5wRZ126insyv/zY7kRzEEionl315BK58g==
X-Received: by 2002:a17:90b:4f8d:b0:1e8:38f5:e199 with SMTP id
 qe13-20020a17090b4f8d00b001e838f5e199mr2885798pjb.64.1655187557683; 
 Mon, 13 Jun 2022 23:19:17 -0700 (PDT)
Received: from zhdaniel-fedora-MJ0FVN0B ([2620:10d:c090:500::2:9ac3])
 by smtp.gmail.com with ESMTPSA id
 iz19-20020a170902ef9300b001636c0b98a7sm6223077plb.226.2022.06.13.23.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 23:19:17 -0700 (PDT)
Date: Mon, 13 Jun 2022 23:19:14 -0700
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
Message-ID: <YqgoYnHIyKda07Ll@zhdaniel-fedora-MJ0FVN0B>
References: <20220609031320.2212468-1-irischenlj@fb.com>
 <20220609192201.GC10629@fralle-msi>
 <810A50A3-E9C2-4A62-ADF9-89DCC9BBD9BB@fb.com>
 <YqggfkLuTz4ryuL8@zhdaniel-fedora-MJ0FVN0B>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YqggfkLuTz4ryuL8@zhdaniel-fedora-MJ0FVN0B>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=dz4list@gmail.com; helo=mail-pj1-x102b.google.com
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

On Mon, Jun 13, 2022 at 10:45:34PM -0700, Dan Zhang wrote:
> Just find out how to use mutt to reply all in the thread.
> repeat the previous comments. Add STATE_HIZ to handle decode_new_command
> aborting gracefully. 
> 
> On Thu, Jun 09, 2022 at 08:06:00PM +0000, Peter Delevoryas wrote:
> > 
> > 
> > > On Jun 9, 2022, at 12:22 PM, Francisco Iglesias <frasse.iglesias@gmail.com> wrote:
> > > 
> > > Hi Iris,
> > > 
> > > Looks good some, a couple of comments below.
> > > 
> > > On [2022 Jun 08] Wed 20:13:19, Iris Chen wrote:
> > >> From: Iris Chen <irischenlj@gmail.com>
> > >> 
> > >> Signed-off-by: Iris Chen <irischenlj@gmail.com>
> > >> ---
> > >> Addressed all comments from V1. The biggest change: removed object_class_property_add.
> > >> 
> > >> hw/block/m25p80.c             | 37 +++++++++++++++++++++++++++++++++++
> > >> tests/qtest/aspeed_smc-test.c |  2 ++
> > >> 2 files changed, 39 insertions(+)
> > >> 
> > >> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> > >> index 81ba3da4df..1a20bd55d4 100644
> > >> --- a/hw/block/m25p80.c
> > >> +++ b/hw/block/m25p80.c
> > >> @@ -27,12 +27,14 @@
> > >> #include "hw/qdev-properties.h"
> > >> #include "hw/qdev-properties-system.h"
> > >> #include "hw/ssi/ssi.h"
> > >> +#include "hw/irq.h"
> > >> #include "migration/vmstate.h"
> > >> #include "qemu/bitops.h"
> > >> #include "qemu/log.h"
> > >> #include "qemu/module.h"
> > >> #include "qemu/error-report.h"
> > >> #include "qapi/error.h"
> > >> +#include "qapi/visitor.h"
> > >> #include "trace.h"
> > >> #include "qom/object.h"
> > >> 
> > >> @@ -472,11 +474,13 @@ struct Flash {
> > >>     uint8_t spansion_cr2v;
> > >>     uint8_t spansion_cr3v;
> > >>     uint8_t spansion_cr4v;
> > >> +    bool wp_level;
> > >>     bool write_enable;
> > >>     bool four_bytes_address_mode;
> > >>     bool reset_enable;
> > >>     bool quad_enable;
> > >>     bool aai_enable;
> > >> +    bool status_register_write_disabled;
> > >>     uint8_t ear;
> > >> 
> > >>     int64_t dirty_page;
> > >> @@ -723,6 +727,21 @@ static void complete_collecting_data(Flash *s)
> > >>         flash_erase(s, s->cur_addr, s->cmd_in_progress);
> > >>         break;
> > >>     case WRSR:
> > >> +        /*
> > >> +         * If WP# is low and status_register_write_disabled is high,
> > >> +         * status register writes are disabled.
> > >> +         * This is also called "hardware protected mode" (HPM). All other
> > >> +         * combinations of the two states are called "software protected mode"
> > >> +         * (SPM), and status register writes are permitted.
> > >> +         */
> > >> +        if ((s->wp_level == 0 && s->status_register_write_disabled)
> > >> +            || !s->write_enable) {
> > > 
> > > 'write_enable' needs to be true in 'decode_new_cmd' when issueing the WRSR
> > > command, otherwise the state machinery will not advance to this function
> > > (meaning that above check for !s->write_enable will never hit as far as I can
> > > tell). A suggestion is to move the check for wp_level and
> > > status_reg_wr_disabled into 'decode_new_cmd' to for keeping it consistent.
> > 
> > Oh good catch! Yes actually, in our fork, we also removed the write_enable
> > guard in decode_new_cmd. We either need both checks in decode_new_cmd,
> > or both checks in complete_collecting_data.
> > 
> > I think we had some difficulty deciding whether to block command decoding,
> > or to decode and ignore the command if restrictions are enabled.
> > 
> > The reason being that, in the qtest, the WRSR command code gets ignored, and
> > then the subsequent write data gets interpreted as some random command code.
> > We had elected to decode and ignore the command, but I think the
> > datasheet actually describes that the command won’t be decoded successfully,
> > so you’re probably right, we should put this logic in decode_new_cmd.
> > 
> > Most likely, the qtest will also need to be modified to reset the transfer
> > state machine after a blocked write command. I can’t remember if
> > exiting and re-entering user mode is sufficient for that, but something
> > like that is probably possible.
> > 
> > Thanks for catching this!
> > Peter
> > 
> 
> I am proposing add a CMDState: STATE_HIZ to handle command decode fail
> situation. When decode_new_command need abort the decoding and ignore
> following
> on input bytes of this transaction, set the state to STATE_HIZ.
> And m25p80_transfer8() will ignore all the following on byte when in
> this state.
> 
> This is to simulating the real device operation behavior
> i.e. Macronix MX66L1G45G data sheet section 8 DEVICE OPERATION described
> ```
> 2. When an incorrect command is written to this device, it enters
> standby mode and stays in standby mode until the next CS# falling edge.
> In standby mode, This device's SO pin should be High-Z.
> ``` 
If don't want to consider WRSR command when HPM activated is "incorrect
command" and enter into standby mode, then according to data sheet in WRSR section
```
The WRSR instruction cannot be executed once the Hardware Protected Mode (HPM) is entered.
```
the best place to check HPM is before the command execution in function
complete_collecting_data(). This can help avoiding decode the WRSR input
data as new command.

BTW, maybe STATE_STANDBY is better than STATE_HIZ, much easy to
understand.
> BRs
> Dan Zhang
> > > 
> > >> +            qemu_log_mask(LOG_GUEST_ERROR,
> > >> +                          "M25P80: Status register write is disabled!\n");
> > >> +            break;
> > >> +        }
> > >> +        s->status_register_write_disabled = extract32(s->data[0], 7, 1);
> > >> +
> > >>         switch (get_man(s)) {
> > >>         case MAN_SPANSION:
> > >>             s->quad_enable = !!(s->data[1] & 0x02);
> > >> @@ -1195,6 +1214,8 @@ static void decode_new_cmd(Flash *s, uint32_t value)
> > >> 
> > >>     case RDSR:
> > >>         s->data[0] = (!!s->write_enable) << 1;
> > >> +        s->data[0] |= (!!s->status_register_write_disabled) << 7;
> > >> +
> > >>         if (get_man(s) == MAN_MACRONIX || get_man(s) == MAN_ISSI) {
> > >>             s->data[0] |= (!!s->quad_enable) << 6;
> > >>         }
> > >> @@ -1484,6 +1505,14 @@ static uint32_t m25p80_transfer8(SSIPeripheral *ss, uint32_t tx)
> > >>     return r;
> > >> }
> > >> 
> > >> +static void m25p80_write_protect_pin_irq_handler(void *opaque, int n, int level)
> > >> +{
> > >> +    Flash *s = M25P80(opaque);
> > >> +    /* WP# is just a single pin. */
> > >> +    assert(n == 0);
> > >> +    s->wp_level = !!level;
> > >> +}
> > >> +
> > >> static void m25p80_realize(SSIPeripheral *ss, Error **errp)
> > >> {
> > >>     Flash *s = M25P80(ss);
> > >> @@ -1515,12 +1544,18 @@ static void m25p80_realize(SSIPeripheral *ss, Error **errp)
> > >>         s->storage = blk_blockalign(NULL, s->size);
> > >>         memset(s->storage, 0xFF, s->size);
> > >>     }
> > >> +
> > >> +    qdev_init_gpio_in_named(DEVICE(s),
> > >> +                            m25p80_write_protect_pin_irq_handler, "WP#", 1);
> > >> }
> > >> 
> > >> static void m25p80_reset(DeviceState *d)
> > >> {
> > >>     Flash *s = M25P80(d);
> > >> 
> > >> +    s->wp_level = true;
> > >> +    s->status_register_write_disabled = false;
> > >> +
> > >>     reset_memory(s);
> > >> }
> > >> 
> > >> @@ -1601,6 +1636,8 @@ static const VMStateDescription vmstate_m25p80 = {
> > >>         VMSTATE_UINT8(needed_bytes, Flash),
> > >>         VMSTATE_UINT8(cmd_in_progress, Flash),
> > >>         VMSTATE_UINT32(cur_addr, Flash),
> > >> +        VMSTATE_BOOL(wp_level, Flash),
> > >> +        VMSTATE_BOOL(status_register_write_disabled, Flash),
> > > 
> > > Above needs to be added through a subsection, you can see commit 465ef47abe3
> > > for an example an also read about this in docs/devel/migration.rst.
> > > 
> > > Thank you,
> > > Best regads,
> > > Francisco Iglesias
> > > 
> > > 
> > >>         VMSTATE_BOOL(write_enable, Flash),
> > >>         VMSTATE_BOOL(reset_enable, Flash),
> > >>         VMSTATE_UINT8(ear, Flash),
> > >> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
> > >> index ec233315e6..c5d97d4410 100644
> > >> --- a/tests/qtest/aspeed_smc-test.c
> > >> +++ b/tests/qtest/aspeed_smc-test.c
> > >> @@ -56,7 +56,9 @@ enum {
> > >>     BULK_ERASE = 0xc7,
> > >>     READ = 0x03,
> > >>     PP = 0x02,
> > >> +    WRSR = 0x1,
> > >>     WREN = 0x6,
> > >> +    SRWD = 0x80,
> > >>     RESET_ENABLE = 0x66,
> > >>     RESET_MEMORY = 0x99,
> > >>     EN_4BYTE_ADDR = 0xB7,
> > >> -- 
> > >> 2.30.2
> > >> 
> > >> 
> > 

