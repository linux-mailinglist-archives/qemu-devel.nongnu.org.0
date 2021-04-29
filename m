Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B09F436F2E7
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 01:39:16 +0200 (CEST)
Received: from localhost ([::1]:44342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcGFW-0003Gr-QP
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 19:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGD7-0002S6-MZ
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 19:36:45 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:44939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGD4-0001ln-Ql
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 19:36:45 -0400
Received: by mail-qk1-x736.google.com with SMTP id 190so12358972qkl.11
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 16:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7veU9ku6WjKzQTNgKrZGWNc/gqaHar14RSsOo8l5s4w=;
 b=KdwFy91q0DP3RrFhYs1RLO5CyinB0aGUmp3bX2/SR5OF9CEzH0MgmKaCDc+vfvmBaN
 IWSbaXwkN6Di08F2Qtc1WUh+bxP/b1+tfUh+qSRLHQKFo+0MYkmwgkRX8IClE1bfCK7f
 WxPcyWCZR/Xfvm1FvJjDSgFCNJ/3GdfQRyQ9k+huybtUp8tWlQt96kvq8Xs+JQpoY+LO
 6TrXsD3tJAJ2Cx9IQu071z3o5beeEv02vw/SLswGJDm3zrm9gHH7shj4k4suTL6wiHy6
 DWnRXqsncrUVBIBO6Wx0w7Aljr6M2Y86TitRRgRQa6zlonaa22n9qd/skCDQTo5upufM
 NS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7veU9ku6WjKzQTNgKrZGWNc/gqaHar14RSsOo8l5s4w=;
 b=FL+M2zzpXcJuES5a/Am7WBD3Zt9Mk1uEMLDK6xyQ3Av69QkD0LFPyTIsnSktpsKpFP
 2CF3R5rDu494vTuMBGfwOtSRJaWoFUxnZz66FPQ1Kvc6j2cXn3g7I3voJaW/qbXPnWkX
 0q9MjfYCdGSzxpru1Gf3ou7NLX1sCmQGyx+Y+F54rPzR3lb+vkCK99vUAfFSXzMAIIL6
 xsoJ+uxKd9n0mgPQWmdL40yA7dvUaDkPzMRk2wZFpvp6MudxvBAirx22S5CSUZtbe37D
 xFNbumOC5qA3Fvat5+WkUjECbATle9zlLkm9o/A63n/hXf3zLpD9c0Ht3lfLciss5Nxr
 2a+w==
X-Gm-Message-State: AOAM5332gYiHdz4sS5apLHIGPHWuswsQNzegTom8E4hrFTAPqsaebkbs
 lPHlq+MSbGnoEz/56vfAlX2Ezg==
X-Google-Smtp-Source: ABdhPJx2EM5q8tbdHpb7EGftbrWYYm8/0yWh5N77/qYp8NNdcZYU0C61eUtndnITvyhYNYHH/tg6vA==
X-Received: by 2002:a37:390:: with SMTP id 138mr2387947qkd.136.1619739400114; 
 Thu, 29 Apr 2021 16:36:40 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.gmail.com with ESMTPSA id f5sm135779qkk.12.2021.04.29.16.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 16:36:39 -0700 (PDT)
Message-ID: <6e91d0458e38b4e782dc8e61de3ee0f875f8a56a.camel@linaro.org>
Subject: Re: [PATCH v2 1/8] hw/intc: GICv3 ITS initial framework
From: shashi.mallela@linaro.org
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Apr 2021 19:36:38 -0400
In-Reply-To: <CAFEAcA8OCs-sL1Zu-PwkadTvto3pJWO8VLcxfqmH7JGHXdeQuw@mail.gmail.com>
References: <20210401024152.203896-1-shashi.mallela@linaro.org>
 <20210401024152.203896-2-shashi.mallela@linaro.org>
 <CAFEAcA8OCs-sL1Zu-PwkadTvto3pJWO8VLcxfqmH7JGHXdeQuw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x736.google.com
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2021-04-16 at 18:21 +0100, Peter Maydell wrote:
> On Thu, 1 Apr 2021 at 03:41, Shashi Mallela <
> shashi.mallela@linaro.org> wrote:
> > Added register definitions relevant to ITS,implemented overall
> > ITS device framework with stubs for ITS control and translater
> > regions read/write,extended ITS common to handle mmio init between
> > existing kvm device and newer qemu device.
> > 
> > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > ---
> >  hw/intc/arm_gicv3_its.c                | 334
> > +++++++++++++++++++++++++
> >  hw/intc/arm_gicv3_its_common.c         |  12 +-
> >  hw/intc/arm_gicv3_its_kvm.c            |   2 +-
> >  hw/intc/gicv3_internal.h               |  86 ++++++-
> >  hw/intc/meson.build                    |   1 +
> >  include/hw/intc/arm_gicv3_its_common.h |  12 +-
> >  6 files changed, 430 insertions(+), 17 deletions(-)
> >  create mode 100644 hw/intc/arm_gicv3_its.c
> 
> Overall I think the structure of the patchset and of the device
> is good, so I'm just going to dive into more detailed review
> comments.
> 
> Have accepted and addressed all the comments and will share the
> updated patch sets soon,responding to comments which need 
>  clarification in all the relevant patch sets 
> 
> > +static MemTxResult its_trans_writew(GICv3ITSState *s, hwaddr
> > offset,
> > +                               uint64_t value, MemTxAttrs attrs)
> > +{
> > +    MemTxResult result = MEMTX_OK;
> > +
> > +    return result;
> > +}
> > +
> > +static MemTxResult its_trans_writel(GICv3ITSState *s, hwaddr
> > offset,
> > +                               uint64_t value, MemTxAttrs attrs)
> > +{
> > +    MemTxResult result = MEMTX_OK;
> > +
> > +    return result;
> > +}
> > +
> > +static MemTxResult gicv3_its_translation_write(void *opaque,
> > hwaddr offset,
> > +                               uint64_t data, unsigned size,
> > MemTxAttrs attrs)
> > +{
> > +    GICv3ITSState *s = (GICv3ITSState *)opaque;
> > +    MemTxResult result;
> > +
> > +    switch (size) {
> > +    case 2:
> > +        result = its_trans_writew(s, offset, data, attrs);
> > +        break;
> > +    case 4:
> > +        result = its_trans_writel(s, offset, data, attrs);
> > +        break;
> > +    default:
> > +        result = MEMTX_ERROR;
> > +        break;
> > +    }
> > +
> > +    if (result == MEMTX_ERROR) {
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: invalid guest write at offset "
> > TARGET_FMT_plx
> > +                      "size %u\n", __func__, offset, size);
> > +        /*
> > +         * The spec requires that reserved registers are RAZ/WI;
> > +         * so use MEMTX_ERROR returns from leaf functions as a way
> > to
> > +         * trigger the guest-error logging but don't return it to
> > +         * the caller, or we'll cause a spurious guest data abort.
> > +         */
> > +        result = MEMTX_OK;
> > +    }
> > +    return result;
> > +}
> 
> There is exactly one register in the translation register frame, so
> having this generic top level write function that calls out to
> separate writew and writel functions is overkill and ends up
> with duplication of code. I would suggest you just fold the
> implementation into gicv3_its_translation_write(), which would
> end up looking something like
> 
>     switch (offset) {
>     case GITS_TRANSLATER:
>         if (s->ctlr & ITS_CTLR_ENABLED) {
>             /* 16 bit accesses behave as writes with bits [31:16]
> zero */
>             s->translater = value;
>             devid = attrs.requester_id;
>             process_int(s, s->translater, devid, NONE);
>         }
>         break;
>     default:
>         break;
>     }
>     return MEMTX_OK;
> 
> which handles both the 16 and 32 bit case. You can tell the
> core memory system code not to hand you 8 or 64 bit accesses
> using fields in the MemoryRegionOps; see below.
> 
> > +static MemTxResult gicv3_its_translation_read(void *opaque, hwaddr
> > offset,
> > +                              uint64_t *data, unsigned size,
> > MemTxAttrs attrs)
> > +{
> > +    qemu_log_mask(LOG_GUEST_ERROR,
> > +        "%s: Invalid read from translation register area at offset
> > "
> > +        TARGET_FMT_plx "\n", __func__, offset);
> > +    return MEMTX_ERROR;
> > +}
> > +
> > +static MemTxResult its_writeb(GICv3ITSState *s, hwaddr offset,
> > +                               uint64_t value, MemTxAttrs attrs)
> > +{
> > +    qemu_log_mask(LOG_UNIMP,
> > +                "%s: unsupported byte write to register at offset
> > "
> > +                TARGET_FMT_plx "\n", __func__, offset);
> > +    return MEMTX_ERROR;
> > +}
> > +
> > +static MemTxResult its_readb(GICv3ITSState *s, hwaddr offset,
> > +                               uint64_t *data, MemTxAttrs attrs)
> > +{
> > +    qemu_log_mask(LOG_UNIMP,
> > +                "%s: unsupported byte read from register at offset
> > "
> > +                TARGET_FMT_plx "\n", __func__, offset);
> > +    return MEMTX_ERROR;
> > +}
> > +
> > +static MemTxResult its_writew(GICv3ITSState *s, hwaddr offset,
> > +                               uint64_t value, MemTxAttrs attrs)
> > +{
> > +    qemu_log_mask(LOG_UNIMP,
> > +        "%s: unsupported word write to register at offset "
> > +        TARGET_FMT_plx "\n", __func__, offset);
> > +    return MEMTX_ERROR;
> > +}
> > +
> > +static MemTxResult its_readw(GICv3ITSState *s, hwaddr offset,
> > +                               uint64_t *data, MemTxAttrs attrs)
> > +{
> > +    qemu_log_mask(LOG_UNIMP,
> > +        "%s: unsupported word read from register at offset "
> > +        TARGET_FMT_plx "\n", __func__, offset);
> > +    return MEMTX_ERROR;
> > +}
> 
> Similarly, there are no byte or halfword accessible registers
> on the ITS, so these are unnecessary; just use MemoryRegionOps
> to cause the core code to reject them.
> 
> > +static MemTxResult its_writel(GICv3ITSState *s, hwaddr offset,
> > +                               uint64_t value, MemTxAttrs attrs)
> > +{
> > +    MemTxResult result = MEMTX_OK;
> > +
> > +    return result;
> > +}
> > +
> > +static MemTxResult its_readl(GICv3ITSState *s, hwaddr offset,
> > +                               uint64_t *data, MemTxAttrs attrs)
> > +{
> > +    MemTxResult result = MEMTX_OK;
> > +
> > +    return result;
> > +}
> > +
> > +static MemTxResult its_writell(GICv3ITSState *s, hwaddr offset,
> > +                               uint64_t value, MemTxAttrs attrs)
> > +{
> > +    MemTxResult result = MEMTX_OK;
> > +
> > +    return result;
> > +}
> > +
> > +static MemTxResult its_readll(GICv3ITSState *s, hwaddr offset,
> > +                               uint64_t *data, MemTxAttrs attrs)
> > +{
> > +    MemTxResult result = MEMTX_OK;
> > +
> > +    return result;
> > +}
> > +
> > +static MemTxResult gicv3_its_read(void *opaque, hwaddr offset,
> > uint64_t *data,
> > +                              unsigned size, MemTxAttrs attrs)
> > +{
> > +    GICv3ITSState *s = (GICv3ITSState *)opaque;
> > +    MemTxResult result;
> > +
> > +    switch (size) {
> > +    case 1:
> > +        result = its_readb(s, offset, data, attrs);
> > +        break;
> > +    case 2:
> > +        result = its_readw(s, offset, data, attrs);
> > +        break;
> > +    case 4:
> > +        result = its_readl(s, offset, data, attrs);
> > +        break;
> > +    case 8:
> > +        result = its_readll(s, offset, data, attrs);
> > +        break;
> > +    default:
> > +        result = MEMTX_ERROR;
> > +        break;
> > +    }
> > +
> > +    if (result == MEMTX_ERROR) {
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: invalid guest read at offset "
> > TARGET_FMT_plx
> > +                      "size %u\n", __func__, offset, size);
> > +        /*
> > +         * The spec requires that reserved registers are RAZ/WI;
> > +         * so use MEMTX_ERROR returns from leaf functions as a way
> > to
> > +         * trigger the guest-error logging but don't return it to
> > +         * the caller, or we'll cause a spurious guest data abort.
> > +         */
> > +        result = MEMTX_OK;
> > +        *data = 0;
> > +    }
> > +    return result;
> > +}
> > +
> > +static MemTxResult gicv3_its_write(void *opaque, hwaddr offset,
> > uint64_t data,
> > +                               unsigned size, MemTxAttrs attrs)
> > +{
> > +    GICv3ITSState *s = (GICv3ITSState *)opaque;
> > +    MemTxResult result;
> > +
> > +    switch (size) {
> > +    case 1:
> > +        result = its_writeb(s, offset, data, attrs);
> > +        break;
> > +    case 2:
> > +        result = its_writew(s, offset, data, attrs);
> > +        break;
> > +    case 4:
> > +        result = its_writel(s, offset, data, attrs);
> > +        break;
> > +    case 8:
> > +        result = its_writell(s, offset, data, attrs);
> > +        break;
> > +    default:
> > +        result = MEMTX_ERROR;
> > +        break;
> > +    }
> > +
> > +    if (result == MEMTX_ERROR) {
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: invalid guest write at offset "
> > TARGET_FMT_plx
> > +                      "size %u\n", __func__, offset, size);
> > +        /*
> > +         * The spec requires that reserved registers are RAZ/WI;
> > +         * so use MEMTX_ERROR returns from leaf functions as a way
> > to
> > +         * trigger the guest-error logging but don't return it to
> > +         * the caller, or we'll cause a spurious guest data abort.
> > +         */
> > +        result = MEMTX_OK;
> > +    }
> > +    return result;
> > +}
> > +
> > +static const MemoryRegionOps gicv3_its_control_ops = {
> > +    .read_with_attrs = gicv3_its_read,
> > +    .write_with_attrs = gicv3_its_write,
> > +    .endianness = DEVICE_NATIVE_ENDIAN,
> 
>        .valid.min_access_size = 4,
>        .valid.max_access_size = 8,
>        .impl.min_access_size = 4,
>        .impl.max_access_size = 8,
> 
> And then you don't need to handle 1 and 2 in your read/write fns.
> 
> 
> > +};
> > +
> > +static const MemoryRegionOps gicv3_its_translation_ops = {
> > +    .read_with_attrs = gicv3_its_translation_read,
> > +    .write_with_attrs = gicv3_its_translation_write,
> > +    .endianness = DEVICE_NATIVE_ENDIAN,
> 
> Similarly here set the valid and impl min and max to 2 and 4.
> 
> > +};
> > +
> > +static void gicv3_arm_its_realize(DeviceState *dev, Error **errp)
> > +{
> > +    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
> > +
> > +    gicv3_its_init_mmio(s, &gicv3_its_control_ops,
> > &gicv3_its_translation_ops);
> > +}
> > +
> > +static void gicv3_its_reset(DeviceState *dev)
> > +{
> > +    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
> > +    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
> > +
> > +    if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {
> > +        c->parent_reset(dev);
> > +
> > +        /* set the ITS default features supported */
> > +        s->typer = FIELD_DP64(s->typer, GITS_TYPER, PHYSICAL,
> > +                                       GITS_TYPE_PHYSICAL);
> > +        s->typer = FIELD_DP64(s->typer, GITS_TYPER,
> > ITT_ENTRY_SIZE,
> > +                                       ITS_ITT_ENTRY_SIZE);
> > +        s->typer = FIELD_DP64(s->typer, GITS_TYPER, IDBITS,
> > ITS_IDBITS);
> > +        s->typer = FIELD_DP64(s->typer, GITS_TYPER, DEVBITS,
> > ITS_DEVBITS);
> > +        s->typer = FIELD_DP64(s->typer, GITS_TYPER, CIL, 1);
> > +        s->typer = FIELD_DP64(s->typer, GITS_TYPER, CIDBITS,
> > ITS_CIDBITS);
> 
> This is a read-only constant value. Two options:
>  (1) set s->typer in realize, not in reset (this is how we handle
>      GICR_TYPER)
>  (2) don't have an s->typer at all, and just return the right
>      constant value when in the read function (this is how we
>      handle GICD_TYPER)
> Implemented option 1
> 
> > +
> > +        /*
> > +         * We claim to be an ARM r0p0 with a zero ProductID.
> > +         * This is the same as an r0p0 GIC-500.
> > +         */
> > +        s->iidr = gicv3_iidr();
> 
> IIDR is constant, so just call gicv3_iidr() to get its value directly
> in the register read function.
> 
> > +
> > +        /* Quiescent bit reset to 1 */
> > +        s->ctlr = FIELD_DP32(s->ctlr, GITS_CTLR, QUIESCENT, 1);
> > +
> > +        /*
> > +         * setting GITS_BASER0.Type = 0b001 (Device)
> > +         *         GITS_BASER1.Type = 0b100 (Collection Table)
> > +         *         GITS_BASER<n>.Type,where n = 3 to 7 are 0b00
> > (Unimplemented)
> > +         *         GITS_BASER<0,1>.Page_Size = 64KB
> > +         * and default translation table entry size to 16 bytes
> > +         */
> > +        s->baser[0] = FIELD_DP64(s->baser[0], GITS_BASER, TYPE,
> > +                                              GITS_ITT_TYPE_DEVICE
> > );
> > +        s->baser[0] = FIELD_DP64(s->baser[0], GITS_BASER,
> > PAGESIZE,
> > +                                              GITS_BASER_PAGESIZE_
> > 64K);
> > +        s->baser[0] = FIELD_DP64(s->baser[0], GITS_BASER,
> > ENTRYSIZE,
> > +                                              GITS_DTE_SIZE);
> > +
> > +        s->baser[1] = FIELD_DP64(s->baser[1], GITS_BASER, TYPE,
> > +                                              GITS_ITT_TYPE_COLLEC
> > TION);
> > +        s->baser[1] = FIELD_DP64(s->baser[1], GITS_BASER,
> > PAGESIZE,
> > +                                              GITS_BASER_PAGESIZE_
> > 64K);
> > +        s->baser[1] = FIELD_DP64(s->baser[1], GITS_BASER,
> > ENTRYSIZE,
> > +                                              GITS_CTE_SIZE);
> > +    }
> > +}
> > +
> > +static Property gicv3_its_props[] = {
> > +    DEFINE_PROP_LINK("parent-gicv3", GICv3ITSState, gicv3, "arm-
> > gicv3",
> > +                     GICv3State *),
> > +    DEFINE_PROP_END_OF_LIST(),
> > +};
> > +
> > +static void gicv3_its_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc = DEVICE_CLASS(klass);
> > +    GICv3ITSClass *ic = ARM_GICV3_ITS_CLASS(klass);
> > +
> > +    dc->realize = gicv3_arm_its_realize;
> > +    device_class_set_props(dc, gicv3_its_props);
> > +    device_class_set_parent_reset(dc, gicv3_its_reset, &ic-
> > >parent_reset);
> > +}
> > +
> > +static const TypeInfo gicv3_its_info = {
> > +    .name = TYPE_ARM_GICV3_ITS,
> > +    .parent = TYPE_ARM_GICV3_ITS_COMMON,
> > +    .instance_size = sizeof(GICv3ITSState),
> > +    .class_init = gicv3_its_class_init,
> > +    .class_size = sizeof(GICv3ITSClass),
> > +};
> > +
> > +static void gicv3_its_register_types(void)
> > +{
> > +    type_register_static(&gicv3_its_info);
> > +}
> > +
> > +type_init(gicv3_its_register_types)
> > diff --git a/hw/intc/arm_gicv3_its_common.c
> > b/hw/intc/arm_gicv3_its_common.c
> > index 66c4c6a188..80cc9ec6d8 100644
> > --- a/hw/intc/arm_gicv3_its_common.c
> > +++ b/hw/intc/arm_gicv3_its_common.c
> > @@ -50,12 +50,16 @@ static int gicv3_its_post_load(void *opaque,
> > int version_id)
> > 
> >  static const VMStateDescription vmstate_its = {
> >      .name = "arm_gicv3_its",
> > +    .version_id = 1,
> > +    .minimum_version_id = 1,
> >      .pre_save = gicv3_its_pre_save,
> >      .post_load = gicv3_its_post_load,
> >      .priority = MIG_PRI_GICV3_ITS,
> >      .fields = (VMStateField[]) {
> >          VMSTATE_UINT32(ctlr, GICv3ITSState),
> > +        VMSTATE_UINT32(translater, GICv3ITSState),
> >          VMSTATE_UINT32(iidr, GICv3ITSState),
> > +        VMSTATE_UINT64(typer, GICv3ITSState),
> 
> You cannot change a VMStateDescription like this -- you will break
> migration compatibility. Luckily, in this case there's no need:
> GITS_TYPER is read-only, so it doesn't need to be migrated, and
> GITS_TRANSLATER is not a real contains-state register (it's write-
> only),
> so there's no new state there either. Neither needs to be a new field
> in the GICv3ITSState structure either (though typer could be if you
> prefer).
> 
> >          VMSTATE_UINT64(cbaser, GICv3ITSState),
> >          VMSTATE_UINT64(cwriter, GICv3ITSState),
> >          VMSTATE_UINT64(creadr, GICv3ITSState),
> > @@ -99,15 +103,16 @@ static const MemoryRegionOps
> > gicv3_its_trans_ops = {
> >      .endianness = DEVICE_NATIVE_ENDIAN,
> >  };
> > +/**
> > + * Default features advertised by this version of ITS
> > + */
> > +/* Physical LPIs supported */
> > +#define GITS_TYPE_PHYSICAL           (1U << 0)
> > +
> > +/*
> > + * 11 bytes Interrupt translation Table Entry size
> > + * Valid = 1 bit,InterruptType = 1 bit,
> > + * Size of LPI number space[considering max 24 bits],
> > + * Size of LPI number space[considering max 24 bits],
> > + * ICID = 16 bits,
> > + * vPEID = 16 bits
> > + */
> > +#define ITS_ITT_ENTRY_SIZE            0xB
> > +
> > +/* 16 bits EventId */
> > +#define ITS_IDBITS                   GICD_TYPER_IDBITS
> > +
> > +/* 16 bits DeviceId */
> > +#define ITS_DEVBITS                   0xF
> > +
> > +/* 16 bits CollectionId */
> > +#define ITS_CIDBITS                  0xF
> > +
> > +/*
> > + * 8 bytes Device Table Entry size
> > + * Valid = 1 bit,ITTAddr = 44 bits,Size = 5 bits
> > + */
> > +#define GITS_DTE_SIZE                 (0x8ULL)
> > +
> > +/*
> > + * 8 bytes Collection Table Entry size
> > + * Valid = 1 bit,RDBase = 36 bits(considering max RDBASE)
> > + */
> > +#define GITS_CTE_SIZE                 (0x8ULL)
> > +
> 
> Is this the same data structure the in-kernel KVM ITS uses, or is
> it just one specific to the QEMU emulated implementation ?
> This is specific to QEMU emulated implementation
> 
> >  /* Special interrupt IDs */
> >  #define INTID_SECURE 1020
> >  #define INTID_NONSECURE 1021
> > diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> > index 1c299039f6..53472239f0 100644
> > --- a/hw/intc/meson.build
> > +++ b/hw/intc/meson.build
> > @@ -8,6 +8,7 @@ softmmu_ss.add(when: 'CONFIG_ARM_GIC', if_true:
> > files(
> >    'arm_gicv3_dist.c',
> >    'arm_gicv3_its_common.c',
> >    'arm_gicv3_redist.c',
> > +  'arm_gicv3_its.c',
> >  ))
> >  softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true:
> > files('etraxfs_pic.c'))
> >  softmmu_ss.add(when: 'CONFIG_HEATHROW_PIC', if_true:
> > files('heathrow_pic.c'))
> > diff --git a/include/hw/intc/arm_gicv3_its_common.h
> > b/include/hw/intc/arm_gicv3_its_common.h
> > index 5a0952b404..08bc5652ed 100644
> > --- a/include/hw/intc/arm_gicv3_its_common.h
> > +++ b/include/hw/intc/arm_gicv3_its_common.h
> > @@ -25,17 +25,24 @@
> >  #include "hw/intc/arm_gicv3_common.h"
> >  #include "qom/object.h"
> > 
> > +#define TYPE_ARM_GICV3_ITS "arm-gicv3-its"
> > +
> >  #define ITS_CONTROL_SIZE 0x10000
> >  #define ITS_TRANS_SIZE   0x10000
> >  #define ITS_SIZE         (ITS_CONTROL_SIZE + ITS_TRANS_SIZE)
> > 
> >  #define GITS_CTLR        0x0
> >  #define GITS_IIDR        0x4
> > +#define GITS_TYPER       0x8
> >  #define GITS_CBASER      0x80
> >  #define GITS_CWRITER     0x88
> >  #define GITS_CREADR      0x90
> >  #define GITS_BASER       0x100
> > 
> > +#define GITS_TRANSLATER  0x0040
> > +
> > +#define GITS_PIDR2       0xFFE8
> 
> You probably don't want an offset for GITS_PIDR2 specifically.
> Compare handling of GICD_IDREGS in the distributor emulation.
> Tried re-using the GICD_IDREGS offset for GITS_PIDR2,but from testing
> observed that the linux kernel driver and kvm-unit-tests both relied
> on using the 0xFFE8 offset instead of 0xFFD0 (used by GICD & GICR) to
> complete ITS initialization and setup
> 
> thanks
> -- PMM


