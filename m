Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF053497D3
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 18:23:18 +0100 (CET)
Received: from localhost ([::1]:38252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPThV-00012z-Ni
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 13:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lPTcQ-000720-8l
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:18:02 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lPTcH-0004G2-BO
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:18:01 -0400
Received: by mail-wr1-x430.google.com with SMTP id z2so3071133wrl.5
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 10:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=1zdQdmjK6VkbZBDsOI+3OcegTb2sWTv9pklMuukrAwY=;
 b=Z9NeeCZ7+ZjGkGkIUXBN/DbAdwalCd7nLToaqBbjvNW56LXEZkijwQNEScXRsablpt
 E8N/8S0vwEO6wM9GOv23X0eMNLEeKjWlplyTm1h3bOpXja00c2TaU6ppGIISFytAYyNf
 KKusE2CPaUnxpDfaVB8mKKXWw/ZRKRXaobOE1meTOIjLB8jCw2bxRAPLrIZzw4807h0/
 nkhTqaZ4HhL0uSDH2NlNs7S4uT1V0mSJV4hSJiaIF0JqagWFReMPCvQuolyulX6ZbfSh
 +q045bE94sC6n66Z6e05kamgIMbRn0LM3TYheePe9ch+/0+tf3X3atW8b3+LK99PA6u2
 7gwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=1zdQdmjK6VkbZBDsOI+3OcegTb2sWTv9pklMuukrAwY=;
 b=rqli6bTNzC8gM0GBVjJPioMXlhjN1FuQwe/9LUMwo4h1MoQ3FH+Ug1eiq30wS+GXdV
 jWUjAH0t6Xn0HMCfjnBkP2P+ghgqILvT2VRhrFtdWyoAWQmv9QMx36vWhRjXxXuwylhb
 mh7/KQrnXe/8BlOllvx/By5UwDWHWAS8b3jAzrMPcCvSmq1v6agdKx12qbII/P89LNKP
 n+VzV0Ll+FrI6JINmu2Id74VnMIFRvgctDckKnFqkMLgQoEiZMQgUCviMEsvHjalFkXm
 wE8kUhHVZ6KqfuAt1aWPRbzUIbN3AySCWxyTDIc9cAY/EO7xyVpyo67p3NtD1VOXNoeX
 vTWA==
X-Gm-Message-State: AOAM530irbqQpE4RDotsFQtg6ZDORBQbTR5cO0YYmTu80PE4MJ/o2ugI
 yhySRW7O4120p7ybLqo9v+g8tg==
X-Google-Smtp-Source: ABdhPJzoEJysinpFySQ2S+pRktVhV7NnugTnaF5lN6FwhDXhwafk0p+4szZSYTfzp4Kk3kuooiR81w==
X-Received: by 2002:adf:a1ce:: with SMTP id v14mr10299708wrv.228.1616692668295; 
 Thu, 25 Mar 2021 10:17:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p27sm7646894wmi.12.2021.03.25.10.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 10:17:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6F0A41FF7E;
 Thu, 25 Mar 2021 17:17:46 +0000 (GMT)
References: <20210323041238.133835-1-shashi.mallela@linaro.org>
 <20210323041238.133835-2-shashi.mallela@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Shashi Mallela <shashi.mallela@linaro.org>
Subject: Re: [PATCH v1 1/8] hw/intc: GICv3 ITS initial framework
Date: Thu, 25 Mar 2021 16:43:24 +0000
In-reply-to: <20210323041238.133835-2-shashi.mallela@linaro.org>
Message-ID: <87r1k3gnk5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: peter.maydell@linaro.org, leif@nuviainc.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, rad@semihalf.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Shashi Mallela <shashi.mallela@linaro.org> writes:

> Added register definitions relevant to ITS,implemented overall
> ITS device framework with stubs for ITS control and translater
> regions read/write,extended ITS common to handle mmio init between
> existing kvm device and newer qemu device.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c                | 323 ++++++++++++++++++++
>  hw/intc/arm_gicv3_its_common.c         |  17 +-
>  hw/intc/arm_gicv3_its_kvm.c            |   2 +-
>  hw/intc/gicv3_internal.h               | 173 ++++++++++-
>  hw/intc/meson.build                    |   1 +
>  include/hw/intc/arm_gicv3_its_common.h |  12 +-
>  6 files changed, 520 insertions(+), 8 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> new file mode 100644
> index 0000000000..34e49b4d63
> --- /dev/null
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -0,0 +1,323 @@
> +/*
> + * ITS emulation for a GICv3-based system
> + *
> + * Copyright Linaro.org 2021
> + *
> + * Authors:
> + *  Shashi Mallela <shashi.mallela@linaro.org>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or (a=
t your
> + * option) any later version.  See the COPYING file in the top-level dir=
ectory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/intc/arm_gicv3_its_common.h"
> +#include "gicv3_internal.h"
> +#include "qom/object.h"
> +
> +typedef struct GICv3ITSClass GICv3ITSClass;
> +/* This is reusing the GICv3ITSState typedef from ARM_GICV3_ITS_COMMON */
> +DECLARE_OBJ_CHECKERS(GICv3ITSState, GICv3ITSClass,
> +                     ARM_GICV3_ITS, TYPE_ARM_GICV3_ITS)
> +
> +struct GICv3ITSClass {
> +    GICv3ITSCommonClass parent_class;
> +    void (*parent_reset)(DeviceState *dev);
> +};
> +
> +static MemTxResult its_trans_writew(GICv3ITSState *s, hwaddr offset,
> +                               uint64_t value, MemTxAttrs attrs)
> +{
> +    MemTxResult result =3D MEMTX_OK;
> +
> +    return result;
> +}
> +
> +static MemTxResult its_trans_writel(GICv3ITSState *s, hwaddr offset,
> +                               uint64_t value, MemTxAttrs attrs)
> +{
> +    MemTxResult result =3D MEMTX_OK;
> +
> +    return result;
> +}
> +
> +static MemTxResult gicv3_its_trans_write(void *opaque, hwaddr offset,
> +                               uint64_t data, unsigned size, MemTxAttrs =
attrs)
> +{
> +    GICv3ITSState *s =3D (GICv3ITSState *)opaque;
> +    MemTxResult result;
> +
> +    switch (size) {
> +    case 2:
> +        result =3D its_trans_writew(s, offset, data, attrs);
> +        break;
> +    case 4:
> +        result =3D its_trans_writel(s, offset, data, attrs);
> +        break;
> +    default:
> +        result =3D MEMTX_ERROR;
> +        break;
> +    }
> +
> +    if (result =3D=3D MEMTX_ERROR) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid guest write at offset " TARGET_FMT_plx
> +                      "size %u\n", __func__, offset, size);
> +        /*
> +         * The spec requires that reserved registers are RAZ/WI;
> +         * so use MEMTX_ERROR returns from leaf functions as a way to
> +         * trigger the guest-error logging but don't return it to
> +         * the caller, or we'll cause a spurious guest data abort.
> +         */
> +        result =3D MEMTX_OK;
> +    }
> +    return result;
> +}
> +
> +static MemTxResult gicv3_its_trans_read(void *opaque, hwaddr offset,
> +                              uint64_t *data, unsigned size, MemTxAttrs =
attrs)
> +{
> +    qemu_log_mask(LOG_GUEST_ERROR,
> +        "%s: Invalid read from transaction register area at offset "
> +        TARGET_FMT_plx "\n", __func__, offset);
> +    return MEMTX_ERROR;
> +}
> +
> +static MemTxResult its_writeb(GICv3ITSState *s, hwaddr offset,
> +                               uint64_t value, MemTxAttrs attrs)
> +{
> +    qemu_log_mask(LOG_GUEST_ERROR,
> +                "%s: unsupported byte write to register at offset "
> +                TARGET_FMT_plx "\n", __func__, offset);
> +    return MEMTX_ERROR;

unsupported should be LOG_UNIMP which makes it easier to see where QEMU
is missing something vs the guest doing something nuts.

> +}
> +
> +static MemTxResult its_readb(GICv3ITSState *s, hwaddr offset,
> +                               uint64_t *data, MemTxAttrs attrs)
> +{
> +    qemu_log_mask(LOG_GUEST_ERROR,
> +                "%s: unsupported byte read from register at offset "
> +                TARGET_FMT_plx "\n", __func__, offset);
> +    return MEMTX_ERROR;
> +}
> +
> +static MemTxResult its_writew(GICv3ITSState *s, hwaddr offset,
> +                               uint64_t value, MemTxAttrs attrs)
> +{
> +    qemu_log_mask(LOG_GUEST_ERROR,
> +        "%s: unsupported word write to register at offset "
> +        TARGET_FMT_plx "\n", __func__, offset);
> +    return MEMTX_ERROR;
> +}
> +
> +static MemTxResult its_readw(GICv3ITSState *s, hwaddr offset,
> +                               uint64_t *data, MemTxAttrs attrs)
> +{
> +    qemu_log_mask(LOG_GUEST_ERROR,
> +        "%s: unsupported word read from register at offset "
> +        TARGET_FMT_plx "\n", __func__, offset);
> +    return MEMTX_ERROR;
> +}

ditto as above

> +
> +static MemTxResult its_writel(GICv3ITSState *s, hwaddr offset,
> +                               uint64_t value, MemTxAttrs attrs)
> +{
> +    MemTxResult result =3D MEMTX_OK;
> +
> +    return result;
> +}
> +
> +static MemTxResult its_readl(GICv3ITSState *s, hwaddr offset,
> +                               uint64_t *data, MemTxAttrs attrs)
> +{
> +    MemTxResult result =3D MEMTX_OK;
> +
> +    return result;
> +}
> +
> +static MemTxResult its_writell(GICv3ITSState *s, hwaddr offset,
> +                               uint64_t value, MemTxAttrs attrs)
> +{
> +    MemTxResult result =3D MEMTX_OK;
> +
> +    return result;
> +}
> +
> +static MemTxResult its_readll(GICv3ITSState *s, hwaddr offset,
> +                               uint64_t *data, MemTxAttrs attrs)
> +{
> +    MemTxResult result =3D MEMTX_OK;
> +
> +    return result;
> +}
> +
> +static MemTxResult gicv3_its_read(void *opaque, hwaddr offset, uint64_t =
*data,
> +                              unsigned size, MemTxAttrs attrs)
> +{
> +    GICv3ITSState *s =3D (GICv3ITSState *)opaque;
> +    MemTxResult result;
> +
> +    switch (size) {
> +    case 1:
> +        result =3D its_readb(s, offset, data, attrs);
> +        break;
> +    case 2:
> +        result =3D its_readw(s, offset, data, attrs);
> +        break;
> +    case 4:
> +        result =3D its_readl(s, offset, data, attrs);
> +        break;
> +    case 8:
> +        result =3D its_readll(s, offset, data, attrs);
> +        break;
> +    default:
> +        result =3D MEMTX_ERROR;
> +        break;
> +    }
> +
> +    if (result =3D=3D MEMTX_ERROR) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid guest read at offset " TARGET_FMT_plx
> +                      "size %u\n", __func__, offset, size);
> +        /*
> +         * The spec requires that reserved registers are RAZ/WI;
> +         * so use MEMTX_ERROR returns from leaf functions as a way to
> +         * trigger the guest-error logging but don't return it to
> +         * the caller, or we'll cause a spurious guest data abort.
> +         */
> +        result =3D MEMTX_OK;
> +        *data =3D 0;
> +    }
> +    return result;
> +}
> +
> +static MemTxResult gicv3_its_write(void *opaque, hwaddr offset, uint64_t=
 data,
> +                               unsigned size, MemTxAttrs attrs)
> +{
> +    GICv3ITSState *s =3D (GICv3ITSState *)opaque;
> +    MemTxResult result;
> +
> +    switch (size) {
> +    case 1:
> +        result =3D its_writeb(s, offset, data, attrs);
> +        break;
> +    case 2:
> +        result =3D its_writew(s, offset, data, attrs);
> +        break;
> +    case 4:
> +        result =3D its_writel(s, offset, data, attrs);
> +        break;
> +    case 8:
> +        result =3D its_writell(s, offset, data, attrs);
> +        break;
> +    default:
> +        result =3D MEMTX_ERROR;
> +        break;
> +    }
> +
> +    if (result =3D=3D MEMTX_ERROR) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid guest write at offset " TARGET_FMT_plx
> +                      "size %u\n", __func__, offset, size);
> +        /*
> +         * The spec requires that reserved registers are RAZ/WI;
> +         * so use MEMTX_ERROR returns from leaf functions as a way to
> +         * trigger the guest-error logging but don't return it to
> +         * the caller, or we'll cause a spurious guest data abort.
> +         */
> +        result =3D MEMTX_OK;
> +    }
> +    return result;
> +}
> +
> +static const MemoryRegionOps gicv3_its_control_ops =3D {
> +    .read_with_attrs =3D gicv3_its_read,
> +    .write_with_attrs =3D gicv3_its_write,
> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +};
> +
> +static const MemoryRegionOps gicv3_its_trans_ops =3D {
> +    .read_with_attrs =3D gicv3_its_trans_read,
> +    .write_with_attrs =3D gicv3_its_trans_write,
> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +};
> +
> +static void gicv3_arm_its_realize(DeviceState *dev, Error **errp)
> +{
> +    GICv3ITSState *s =3D ARM_GICV3_ITS_COMMON(dev);
> +
> +    gicv3_its_init_mmio(s, &gicv3_its_control_ops,
> &gicv3_its_trans_ops);

Ahh I got confused later on because we have two local static structures
for &gicv3_its_trans_ops. Could we give them differentiated names
please?

> +}
> +
> +static void gicv3_its_reset(DeviceState *dev)
> +{
> +    GICv3ITSState *s =3D ARM_GICV3_ITS_COMMON(dev);
> +    GICv3ITSClass *c =3D ARM_GICV3_ITS_GET_CLASS(s);
> +
> +    if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {
> +        c->parent_reset(dev);
> +
> +        /* set the ITS default features supported */
> +        s->typer =3D GITS_TYPER_PHYSICAL | (GITS_TYPER_ITT_ENTRY_SIZE <<
> +                   GITS_TYPER_ITT_ENTRY_OFFSET) | (GITS_TYPER_IDBITS <<
> +                   GITS_TYPER_IDBITS_OFFSET) | GITS_TYPER_DEVBITS |
> +                   GITS_TYPER_CIL | GITS_TYPER_CIDBITS;
> +
> +        /*
> +         * We claim to be an ARM r0p0 with a zero ProductID.
> +         * This is the same as an r0p0 GIC-500.
> +         */
> +        s->iidr =3D gicv3_iidr();
> +
> +        /* Quiescent bit reset to 1 */
> +        s->ctlr =3D (1U << 31);

I see s->ctlr is set variously with deposit32, manual shift/mask/or and
here with a hard-coded 1 << 31. We generally prefer symbolic names for
register bits. I suspect it might be worth converting the ctlr symbols
to a set of REG32/FIELD descriptors, i.e.:

REG32(GICD_CTLR,                0x0)
    FIELD(GICD_CTLR, EN_GRP0, 0, 1)
    FIELD(GICD_CTLR, EN_GRP1, 1, 1)
    FIELD(GICD_CTLR, RESET,  31, 1)

which would make it:

  s->ctlr =3D FIELD_DP32(0, GICD_CTLR, RESET, 1);

or

  s->ctlr =3D (1U << R_GICD_CTLR_RESET_SHIFT);

if the DP32 seems a little over-kill (but probably not). I see bits of
the GIC code have already been converted.

> +
> +        /*
> +         * setting GITS_BASER0.Type =3D 0b001 (Device)
> +         *         GITS_BASER1.Type =3D 0b100 (Collection Table)
> +         *         GITS_BASER<n>.Type,where n =3D 3 to 7 are 0b00 (Unimp=
lemented)
> +         *         GITS_BASER<0,1>.Page_Size =3D 64KB
> +         * and default translation table entry size to 16 bytes
> +         */
> +        s->baser[0] =3D (GITS_ITT_TYPE_DEVICE << GITS_BASER_TYPE_OFFSET)=
 |
> +                      (GITS_BASER_PAGESIZE_64K << GITS_BASER_PAGESIZE_OF=
FSET) |
> +                      (GITS_DTE_SIZE << GITS_BASER_ENTRYSIZE_OFFSET);
> +        s->baser[1] =3D (GITS_ITT_TYPE_COLLECTION << GITS_BASER_TYPE_OFF=
SET) |
> +                      (GITS_BASER_PAGESIZE_64K << GITS_BASER_PAGESIZE_OF=
FSET) |
> +                      (GITS_CTE_SIZE << GITS_BASER_ENTRYSIZE_OFFSET);
> +    }
> +}
> +
> +static Property gicv3_its_props[] =3D {
> +    DEFINE_PROP_LINK("parent-gicv3", GICv3ITSState, gicv3, "arm-gicv3",
> +                     GICv3State *),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void gicv3_its_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    GICv3ITSClass *ic =3D ARM_GICV3_ITS_CLASS(klass);
> +
> +    dc->realize =3D gicv3_arm_its_realize;
> +    device_class_set_props(dc, gicv3_its_props);
> +    device_class_set_parent_reset(dc, gicv3_its_reset, &ic->parent_reset=
);
> +}
> +
> +static const TypeInfo gicv3_its_info =3D {
> +    .name =3D TYPE_ARM_GICV3_ITS,
> +    .parent =3D TYPE_ARM_GICV3_ITS_COMMON,
> +    .instance_size =3D sizeof(GICv3ITSState),
> +    .class_init =3D gicv3_its_class_init,
> +    .class_size =3D sizeof(GICv3ITSClass),
> +};
> +
> +static void gicv3_its_register_types(void)
> +{
> +    type_register_static(&gicv3_its_info);
> +}
> +
> +type_init(gicv3_its_register_types)
> diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_commo=
n.c
> index 66c4c6a188..c18fe23fae 100644
> --- a/hw/intc/arm_gicv3_its_common.c
> +++ b/hw/intc/arm_gicv3_its_common.c
> @@ -55,7 +55,9 @@ static const VMStateDescription vmstate_its =3D {
>      .priority =3D MIG_PRI_GICV3_ITS,
>      .fields =3D (VMStateField[]) {
>          VMSTATE_UINT32(ctlr, GICv3ITSState),
> +        VMSTATE_UINT32(translater, GICv3ITSState),
>          VMSTATE_UINT32(iidr, GICv3ITSState),
> +        VMSTATE_UINT64(typer, GICv3ITSState),
>          VMSTATE_UINT64(cbaser, GICv3ITSState),
>          VMSTATE_UINT64(cwriter, GICv3ITSState),
>          VMSTATE_UINT64(creadr, GICv3ITSState),

I think you need to bump:

    .version_id =3D 1,
    .minimum_version_id =3D 1,

here so we don't attempt to migrate in an incompatible VMstate from a
pre-ITS migration. Are these fields always used now? If not we might
want to jump a few more hoops to preserve compatibility and make the
fields optional.

> @@ -99,15 +101,21 @@ static const MemoryRegionOps gicv3_its_trans_ops =3D=
 {
>      .endianness =3D DEVICE_NATIVE_ENDIAN,
>  };
>=20=20
> -void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops)
> +void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops,
> +     const MemoryRegionOps *tops)
>  {
>      SysBusDevice *sbd =3D SYS_BUS_DEVICE(s);
>=20=20
>      memory_region_init_io(&s->iomem_its_cntrl, OBJECT(s), ops, s,
>                            "control", ITS_CONTROL_SIZE);
> -    memory_region_init_io(&s->iomem_its_translation, OBJECT(s),
> -                          &gicv3_its_trans_ops, s,
> -                          "translation", ITS_TRANS_SIZE);
> +    if (tops =3D=3D NULL) {
> +        memory_region_init_io(&s->iomem_its_translation, OBJECT(s),
> +                              &gicv3_its_trans_ops, s,
> +                              "translation", ITS_TRANS_SIZE);
> +    } else {
> +        memory_region_init_io(&s->iomem_its_translation, OBJECT(s),
> +                              tops, s, "translation", ITS_TRANS_SIZE);
> +    }

You might as well short-circuit it one line as it's the only difference,
i.e.:

   memory_region_init_io(&s->iomem_its_translation, OBJECT(s),
                         tops ? tops : &gicv3_its_trans_ops, s,
                         "translation", ITS_TRANS_SIZE);

but see bellow.

>      /* Our two regions are always adjacent, therefore we now combine them
>       * into a single one in order to make our users' life easier.
> @@ -130,6 +138,7 @@ static void gicv3_its_common_reset(DeviceState *dev)
>      s->cwriter =3D 0;
>      s->creadr =3D 0;
>      s->iidr =3D 0;
> +    s->translater =3D 0;
>      memset(&s->baser, 0, sizeof(s->baser));
>  }
>=20=20
> diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
> index b554d2ede0..0b4cbed28b 100644
> --- a/hw/intc/arm_gicv3_its_kvm.c
> +++ b/hw/intc/arm_gicv3_its_kvm.c
> @@ -106,7 +106,7 @@ static void kvm_arm_its_realize(DeviceState *dev, Err=
or **errp)
>      kvm_arm_register_device(&s->iomem_its_cntrl, -1, KVM_DEV_ARM_VGIC_GR=
P_ADDR,
>                              KVM_VGIC_ITS_ADDR_TYPE, s->dev_fd, 0);
>=20=20
> -    gicv3_its_init_mmio(s, NULL);
> +    gicv3_its_init_mmio(s, NULL, NULL);
>=20=20
>      if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
>          GITS_CTLR)) {
> diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> index 05303a55c8..7c6bc33e97 100644
> --- a/hw/intc/gicv3_internal.h
> +++ b/hw/intc/gicv3_internal.h
> @@ -67,6 +67,12 @@
>  #define GICD_CTLR_E1NWF             (1U << 7)
>  #define GICD_CTLR_RWP               (1U << 31)
>=20=20
> +#define GICD_TYPER_LPIS_OFFSET         17
> +#define GICD_TYPER_IDBITS_OFFSET       19
> +#define GICD_TYPER_IDBITS_MASK       0x1f
> +/* 16 bits EventId */
> +#define GICD_TYPER_IDBITS            0xf
> +
>  /*
>   * Redistributor frame offsets from RD_base
>   */
> @@ -123,14 +129,17 @@
>  #define GICR_WAKER_ChildrenAsleep    (1U << 2)
>=20=20
>  #define GICR_PROPBASER_OUTER_CACHEABILITY_MASK (7ULL << 56)
> -#define GICR_PROPBASER_ADDR_MASK               (0xfffffffffULL << 12)
> +#define GICR_PROPBASER_ADDR_OFFSET               12
> +#define GICR_PROPBASER_ADDR_MASK               ((1ULL << 40) - 1)
>  #define GICR_PROPBASER_SHAREABILITY_MASK       (3U << 10)
>  #define GICR_PROPBASER_CACHEABILITY_MASK       (7U << 7)
>  #define GICR_PROPBASER_IDBITS_MASK             (0x1f)
> +#define GICR_PROPBASER_IDBITS_THRESHOLD          0xd

More candidates for REG/FIELD conversion.

>=20=20
>  #define GICR_PENDBASER_PTZ                     (1ULL << 62)
>  #define GICR_PENDBASER_OUTER_CACHEABILITY_MASK (7ULL << 56)
> -#define GICR_PENDBASER_ADDR_MASK               (0xffffffffULL << 16)
> +#define GICR_PENDBASER_ADDR_OFFSET               16
> +#define GICR_PENDBASER_ADDR_MASK               ((1ULL << 36) - 1)
>  #define GICR_PENDBASER_SHAREABILITY_MASK       (3U << 10)
>  #define GICR_PENDBASER_CACHEABILITY_MASK       (7U << 7)
>=20=20
> @@ -239,11 +248,171 @@
>  #define ICH_VTR_EL2_PREBITS_SHIFT 26
>  #define ICH_VTR_EL2_PRIBITS_SHIFT 29
>=20=20
> +#define GITS_CTLR_ENABLED             (1U << 0)  /* ITS Enabled or not */
> +#define GITS_CTLR_QUIESCENT           (1U << 31) /* Quiescent bit */
> +
> +#define GITS_BASER_SIZE                     (0xff)
> +#define GITS_BASER_PAGESIZE_OFFSET            8
> +#define GITS_BASER_PAGESIZE_MASK             0x3
> +#define GITS_BASER_SHAREABILITY_OFFSET        10
> +#define GITS_BASER_SHAREABILITY_MASK         0x3
> +#define GITS_BASER_PHYADDR_OFFSET             12
> +#define GITS_BASER_PHYADDR_MASK             ((1ULL << 36) - 1)
> +#define GITS_BASER_PHYADDR_OFFSETL_64K        16
> +#define GITS_BASER_PHYADDR_MASKL_64K        ((1ULL << 32) - 1)
> +#define GITS_BASER_PHYADDR_OFFSETH_64K        48
> +#define GITS_BASER_PHYADDR_MASKH_64K        ((1ULL << 4) - 1)
> +#define GITS_BASER_ENTRYSIZE_OFFSET           48
> +#define GITS_BASER_ENTRYSIZE_MASK           ((1U << 5) - 1)
> +#define GITS_BASER_OUTERCACHE_OFFSET          53
> +#define GITS_BASER_OUTERCACHE_MASK            0x7
> +#define GITS_BASER_TYPE_OFFSET                56
> +#define GITS_BASER_TYPE_MASK                  0x7
> +#define GITS_BASER_INNERCACHE_OFFSET          59
> +#define GITS_BASER_INNERCACHE_MASK            0x7
> +#define GITS_BASER_INDIRECT_OFFSET            62
> +#define GITS_BASER_INDIRECT_MASK              0x1
> +#define GITS_BASER_VALID                      63
> +#define GITS_BASER_VALID_MASK                 0x1
> +
> +#define GITS_BASER_VAL_MASK                 ((0x7ULL << 56) | (0x1fULL <=
< 48))
> +
> +#define GITS_BASER_PAGESIZE_4K                0
> +#define GITS_BASER_PAGESIZE_16K               1
> +#define GITS_BASER_PAGESIZE_64K               2
> +
> +#define GITS_ITT_TYPE_DEVICE                  1ULL
> +#define GITS_ITT_TYPE_COLLECTION              4ULL
> +
> +#define GITS_CBASER_SIZE                    (0xff)
> +#define GITS_CBASER_SHAREABILITY_OFFSET       10
> +#define GITS_CBASER_SHAREABILITY_MASK        0x3
> +#define GITS_CBASER_PHYADDR_OFFSET            12
> +#define GITS_CBASER_PHYADDR_MASK       ((1ULL << 40) - 1)
> +#define GITS_CBASER_OUTERCACHE_OFFSET         53
> +#define GITS_CBASER_OUTERCACHE_MASK          0x7
> +#define GITS_CBASER_INNERCACHE_OFFSET         59
> +#define GITS_CBASER_INNERCACHE_MASK          0x7
> +#define GITS_CBASER_VALID_OFFSET              63
> +#define GITS_CBASER_VALID_MASK               0x1
> +
> +#define GITS_CREADR_STALLED           (1U << 0)
> +#define GITS_CREADR_OFFSET             5
> +#define GITS_CREADR_OFFSET_MASK       ((1U << 15) - 1)
> +
> +#define GITS_CWRITER_RETRY            (1U << 0)
> +#define GITS_CWRITER_OFFSET             5
> +#define GITS_CWRITER_OFFSET_MASK      ((1U << 15) - 1)
> +
> +#define GITS_TYPER_DEVBITS_OFFSET       13
> +#define GITS_TYPER_DEVBITS_MASK        0x1f
> +#define GITS_TYPER_IDBITS_OFFSET        8
> +#define GITS_TYPER_IDBITS_MASK         0x1f
> +#define GITS_TYPER_CIDBITS_OFFSET       32
> +#define GITS_TYPER_CIDBITS_MASK        0xf
> +#define GITS_TYPER_CIL_OFFSET           36
> +#define GITS_TYPER_CIL_MASK             0x1
> +#define GITS_TYPER_PTA_OFFSET           19
> +#define GITS_TYPER_PTA_MASK             0x1
> +#define GITS_TYPER_SEIS_OFFSET          18
> +#define GITS_TYPER_SEIS_MASK            0x1

And here.

> +
> +/* Default features advertised by this version of ITS */
> +/* Physical LPIs supported */
> +#define GITS_TYPER_PHYSICAL           (1U << 0)
> +/*
> + * 11 bytes Interrupt translation Table Entry size
> + * Valid =3D 1 bit,InterruptType =3D 1 bit,
> + * Size of LPI number space[considering max 24 bits],
> + * Size of LPI number space[considering max 24 bits],
> + * ICID =3D 16 bits,
> + * vPEID =3D 16 bits
> + */
> +#define GITS_TYPER_ITT_ENTRY_OFFSET     4
> +#define GITS_TYPER_ITT_ENTRY_SIZE       0xB
> +#define GITS_TYPER_IDBITS_OFFSET        8
> +
> +/* 16 bits EventId */
> +#define GITS_TYPER_IDBITS             GICD_TYPER_IDBITS
> +/* 16 bits DeviceId */
> +#define GITS_TYPER_DEVBITS            (0xf << 13)
> +/* Collection ID Limit indicated by CIDbits(next) */
> +#define GITS_TYPER_CIL                (1ULL << 36)
> +/* 16 bits CollectionId */
> +#define GITS_TYPER_CIDBITS            (0xfULL << 32)
> +/*
> + * 8 bytes Device Table Entry size
> + * Valid =3D 1 bit,ITTAddr =3D 44 bits,Size =3D 5 bits
> + */
> +#define GITS_DTE_SIZE                 (0x8ULL)
> +/*
> + * 8 bytes Collection Table Entry size
> + * Valid =3D 1 bit,RDBase =3D 36 bits(considering max RDBASE)
> + */
> +#define GITS_CTE_SIZE                 (0x8ULL)
> +
>  /* Special interrupt IDs */
>  #define INTID_SECURE 1020
>  #define INTID_NONSECURE 1021
>  #define INTID_SPURIOUS 1023
>=20=20
> +/* ITS Commands */
> +#define GITS_CMD_CLEAR            0x04
> +#define GITS_CMD_DISCARD          0x0F
> +#define GITS_CMD_INT              0x03
> +#define GITS_CMD_MAPC             0x09
> +#define GITS_CMD_MAPD             0x08
> +#define GITS_CMD_MAPI             0x0B
> +#define GITS_CMD_MAPTI            0x0A
> +#define GITS_CMD_SYNC             0x05

Although looking at this patch I suspect the definition of registers
should come in when they are first used.

> +
> +#define GITS_ITT_PAGE_SIZE_0      0x1000
> +#define GITS_ITT_PAGE_SIZE_1      0x4000
> +#define GITS_ITT_PAGE_SIZE_2      0x10000
> +
> +#define GITS_CMDQ_ENTRY_SIZE               32
> +#define GITS_CMDQ_MAX_ENTRIES_PER_PAGE     128
> +#define NUM_BYTES_IN_DW                     8
> +
> +#define CMD_MASK                  0xff
> +
> +/* MAPC command fields */
> +#define ICID_LEN                  16
> +#define ICID_MASK                 ((1U << ICID_LEN) - 1)
> +#define RDBASE_LEN                32
> +#define RDBASE_OFFSET             16
> +#define RDBASE_MASK               ((1ULL << RDBASE_LEN) - 1)
> +#define RDBASE_PROCNUM_LEN        16
> +#define RDBASE_PROCNUM_MASK       ((1ULL << RDBASE_PROCNUM_LEN) - 1)
> +
> +#define DEVID_OFFSET              32
> +#define DEVID_LEN                 32
> +#define DEVID_MASK                ((1ULL << DEVID_LEN) - 1)
> +
> +/* MAPD command fields */
> +#define ITTADDR_LEN               44
> +#define ITTADDR_OFFSET            8
> +#define ITTADDR_MASK              ((1ULL << ITTADDR_LEN) - 1)
> +#define SIZE_MASK                 0x1f
> +
> +/* MAPI command fields */
> +#define EVENTID_MASK              ((1ULL << 32) - 1)
> +
> +/* MAPTI command fields */
> +#define pINTID_OFFSET              32
> +#define pINTID_MASK               ((1ULL << 32) - 1)
> +
> +#define VALID_SHIFT               63
> +#define VALID_MASK                0x1
> +
> +#define L1TABLE_ENTRY_SIZE         8
> +
> +#define LPI_CTE_ENABLE_OFFSET      0
> +#define LPI_CTE_ENABLED          VALID_MASK
> +#define LPI_CTE_PRIORITY_OFFSET    2
> +#define LPI_CTE_PRIORITY_MASK     ((1U << 6) - 1)
> +#define LPI_PRIORITY_MASK         0xfc
> +
>  /* Functions internal to the emulated GICv3 */
>=20=20
>  /**
> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> index 1c299039f6..53472239f0 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -8,6 +8,7 @@ softmmu_ss.add(when: 'CONFIG_ARM_GIC', if_true: files(
>    'arm_gicv3_dist.c',
>    'arm_gicv3_its_common.c',
>    'arm_gicv3_redist.c',
> +  'arm_gicv3_its.c',
>  ))
>  softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_pic.c'))
>  softmmu_ss.add(when: 'CONFIG_HEATHROW_PIC', if_true: files('heathrow_pic=
.c'))
> diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm=
_gicv3_its_common.h
> index 5a0952b404..08bc5652ed 100644
> --- a/include/hw/intc/arm_gicv3_its_common.h
> +++ b/include/hw/intc/arm_gicv3_its_common.h
> @@ -25,17 +25,24 @@
>  #include "hw/intc/arm_gicv3_common.h"
>  #include "qom/object.h"
>=20=20
> +#define TYPE_ARM_GICV3_ITS "arm-gicv3-its"
> +
>  #define ITS_CONTROL_SIZE 0x10000
>  #define ITS_TRANS_SIZE   0x10000
>  #define ITS_SIZE         (ITS_CONTROL_SIZE + ITS_TRANS_SIZE)
>=20=20
>  #define GITS_CTLR        0x0
>  #define GITS_IIDR        0x4
> +#define GITS_TYPER       0x8
>  #define GITS_CBASER      0x80
>  #define GITS_CWRITER     0x88
>  #define GITS_CREADR      0x90
>  #define GITS_BASER       0x100
>=20=20
> +#define GITS_TRANSLATER  0x0040
> +
> +#define GITS_PIDR2       0xFFE8
> +
>  struct GICv3ITSState {
>      SysBusDevice parent_obj;
>=20=20
> @@ -52,6 +59,8 @@ struct GICv3ITSState {
>      /* Registers */
>      uint32_t ctlr;
>      uint32_t iidr;
> +    uint32_t translater;
> +    uint64_t typer;
>      uint64_t cbaser;
>      uint64_t cwriter;
>      uint64_t creadr;
> @@ -62,7 +71,8 @@ struct GICv3ITSState {
>=20=20
>  typedef struct GICv3ITSState GICv3ITSState;
>=20=20
> -void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops);
> +void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops,
> +                   const MemoryRegionOps *tops);
>=20=20
>  #define TYPE_ARM_GICV3_ITS_COMMON "arm-gicv3-its-common"
>  typedef struct GICv3ITSCommonClass GICv3ITSCommonClass;


--=20
Alex Benn=C3=A9e

