Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA1E3A47E1
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 19:27:43 +0200 (CEST)
Received: from localhost ([::1]:45152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrkwX-0001J4-UC
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 13:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lrksN-0006Xm-8B
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 13:23:23 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:40866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lrksJ-0005cT-Ba
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 13:23:23 -0400
Received: by mail-qt1-x831.google.com with SMTP id t9so3148495qtw.7
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 10:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version; bh=4EqnEd4Aq8BGH7qXRuqj6KPkQ9FNu4veuzzwvAleME4=;
 b=V71OfkMkXm4CGAU92zvzEpl2oDN1pFxyFbBIiLFc9NeZfV3W2Qvw7vl3CVv5AEL5mX
 PkCgM9ZHGhap3Yts38t8Sx9yIHNnTMjzMsrSn+uF964RjM1uYpcI2dniEsNeDwU8EU/m
 wbWLiwEYikQIBnH1Z5n3THBxlU1H9a0DsSNVaRPRTXAl+fM4aT0ogrsgQVpg9oFtqvGP
 yOkIVFgQwmVH85MzRE0zw6v/GSbVJZevscZ4J4EN6jlHhl0l8jn4r9eLE9HHggwRFQiw
 gBNs0WNq/DNnNCa9SBZU0bcqnu5neGqUf8mktuDQSbvwClPxPaezVdc298WiTXws6Vgf
 7CrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version;
 bh=4EqnEd4Aq8BGH7qXRuqj6KPkQ9FNu4veuzzwvAleME4=;
 b=OgBL1g91v8/ZZkcVqdtxZDPchSEsBiwaTYe7kwdw4full2bhc8b9jm7q6IKtTYE0+1
 DsY7RyY5/JfFLT1jSupWxlHX7XbYGi/GLoXBTV0wrARAC+RcO4u0fSwF5fiFQxQgexXC
 MD0BHP9XMTbYMuoJaHP6FvAQ6tterczwnpm/DikeS87I1xztRlvDn51AH7fQW6dSP1X0
 iOjINPwEs5ykzQ9gKiW07Az6pbahuY93SkOipC28uRbsMGAbCdXxfPYun/5EuaAT5ITW
 xtpa5DsLkYVsrbxw9HaRIHusbBjN9LbIOESxil2/He2VWqHwnSherpq0zZw9iX4RBqKD
 yUMw==
X-Gm-Message-State: AOAM5330+S0JAxEn+vQz8ggSPxl+4eKjzQiAQ6IHAKF8/vQmrx2/XEMu
 lWaBv+2pwzrdRFcUKkq5dVE7BEHUcDauIw==
X-Google-Smtp-Source: ABdhPJzr6uR8+MJqGaMn8DMq+vmkESZ/wSVrwrSn86Ou6q723PPHUpeLcLTI0GdOsTTGHOo2we7ftg==
X-Received: by 2002:ac8:1384:: with SMTP id h4mr4951969qtj.207.1623432198120; 
 Fri, 11 Jun 2021 10:23:18 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-21-142-114-142-78.dsl.bell.ca. [142.114.142.78])
 by smtp.gmail.com with ESMTPSA id m187sm3170884qkd.131.2021.06.11.10.23.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 11 Jun 2021 10:23:17 -0700 (PDT)
Date: Fri, 11 Jun 2021 13:23:12 -0400
From: Shashi Mallela <shashi.mallela@linaro.org>
To: Eric Auger <eauger@redhat.com>
Message-ID: <C12900FB-27DF-4257-8B2F-99572027EAF5@getmailspring.com>
In-Reply-To: <91f0cc7a-69e5-7234-3f9d-4bc0df98990d@redhat.com>
References: <91f0cc7a-69e5-7234-3f9d-4bc0df98990d@redhat.com>
Subject: Re: [PATCH v4 1/8] hw/intc: GICv3 ITS initial framework
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="60c39c00_19bd3428_1617"
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x831.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "=?utf-8?Q?peter.maydell=40linaro.org?=" <peter.maydell@linaro.org>,
 "=?utf-8?Q?leif=40nuviainc.com?=" <leif@nuviainc.com>,
 "=?utf-8?Q?qemu-devel=40nongnu.org?=" <qemu-devel@nongnu.org>,
 "=?utf-8?Q?qemu-arm=40nongnu.org?=" <qemu-arm@nongnu.org>,
 "=?utf-8?Q?rad=40semihalf.com?=" <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--60c39c00_19bd3428_1617
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline



On Jun 11 2021, at 12:21 pm, Eric Auger <eauger@redhat.com> wrote:
> Hi,
>
> On 6/2/21 8:00 PM, Shashi Mallela wrote:
> > Added register definitions relevant to ITS,implemented overall
> > ITS device framework with stubs for ITS control and translater
> > regions read/write,extended ITS common to handle mmio init between
> > existing kvm device and newer qemu device.
> >
> > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > ---
> > hw/intc/arm_gicv3_its.c | 240 +++++++++++++++++++++++++
> > hw/intc/arm_gicv3_its_common.c | 8 +-
> > hw/intc/arm_gicv3_its_kvm.c | 2 +-
> > hw/intc/gicv3_internal.h | 88 +++++++--
> > hw/intc/meson.build | 1 +
> > include/hw/intc/arm_gicv3_its_common.h | 9 +-
> > 6 files changed, 331 insertions(+), 17 deletions(-)
> > create mode 100644 hw/intc/arm_gicv3_its.c
> >
> > diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> > new file mode 100644
> > index 0000000000..545cda3665
> > --- /dev/null
> > +++ b/hw/intc/arm_gicv3_its.c
> > @@ -0,0 +1,240 @@
> > +/*
> > + * ITS emulation for a GICv3-based system
> > + *
> > + * Copyright Linaro.org 2021
> > + *
> > + * Authors:
> > + * Shashi Mallela <shashi.mallela@linaro.org>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or (at your
> > + * option) any later version. See the COPYING file in the top-level directory.
> > + *
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/log.h"
> > +#include "hw/qdev-properties.h"
> > +#include "hw/intc/arm_gicv3_its_common.h"
> > +#include "gicv3_internal.h"
> > +#include "qom/object.h"
> > +
> > +typedef struct GICv3ITSClass GICv3ITSClass;
> > +/* This is reusing the GICv3ITSState typedef from ARM_GICV3_ITS_COMMON */
> > +DECLARE_OBJ_CHECKERS(GICv3ITSState, GICv3ITSClass,
> > + ARM_GICV3_ITS, TYPE_ARM_GICV3_ITS)
> > +
> > +struct GICv3ITSClass {
> > + GICv3ITSCommonClass parent_class;
> > + void (*parent_reset)(DeviceState *dev);
> > +};
> > +
> > +static MemTxResult gicv3_its_translation_write(void *opaque, hwaddr offset,
> > + uint64_t data, unsigned size,
> > + MemTxAttrs attrs)
> > +{
> > + MemTxResult result = MEMTX_OK;
> > +
> > + return result;
> > +}
> > +
> > +static MemTxResult its_writel(GICv3ITSState *s, hwaddr offset,
> > + uint64_t value, MemTxAttrs attrs)
> > +{
> > + MemTxResult result = MEMTX_OK;
> > +
> > + return result;
> > +}
> > +
> > +static MemTxResult its_readl(GICv3ITSState *s, hwaddr offset,
> > + uint64_t *data, MemTxAttrs attrs)
> > +{
> > + MemTxResult result = MEMTX_OK;
> > +
> > + return result;
> > +}
> > +
> > +static MemTxResult its_writell(GICv3ITSState *s, hwaddr offset,
> > + uint64_t value, MemTxAttrs attrs)
> > +{
> > + MemTxResult result = MEMTX_OK;
> > +
> > + return result;
> > +}
> > +
> > +static MemTxResult its_readll(GICv3ITSState *s, hwaddr offset,
> > + uint64_t *data, MemTxAttrs attrs)
> > +{
> > + MemTxResult result = MEMTX_OK;
> > +
> > + return result;
> > +}
> > +
> > +static MemTxResult gicv3_its_read(void *opaque, hwaddr offset, uint64_t *data,
> > + unsigned size, MemTxAttrs attrs)
> > +{
> > + GICv3ITSState *s = (GICv3ITSState *)opaque;
> > + MemTxResult result;
> > +
> > + switch (size) {
> > + case 4:
> > + result = its_readl(s, offset, data, attrs);
> > + break;
> > + case 8:
> > + result = its_readll(s, offset, data, attrs);
> > + break;
> > + default:
> > + result = MEMTX_ERROR;
> > + break;
> > + }
> > +
> > + if (result == MEMTX_ERROR) {
> > + qemu_log_mask(LOG_GUEST_ERROR,
> > + "%s: invalid guest read at offset " TARGET_FMT_plx
> > + "size %u\n", __func__, offset, size);
> > + /*
> > + * The spec requires that reserved registers are RAZ/WI;
> > + * so use MEMTX_ERROR returns from leaf functions as a way to
> > + * trigger the guest-error logging but don't return it to
> > + * the caller, or we'll cause a spurious guest data abort.
> > + */
> > + result = MEMTX_OK;
> > + *data = 0;
> > + }
> > + return result;
> > +}
> > +
> > +static MemTxResult gicv3_its_write(void *opaque, hwaddr offset, uint64_t data,
> > + unsigned size, MemTxAttrs attrs)
> > +{
> > + GICv3ITSState *s = (GICv3ITSState *)opaque;
> > + MemTxResult result;
> > +
> > + switch (size) {
> > + case 4:
> > + result = its_writel(s, offset, data, attrs);
> > + break;
> > + case 8:
> > + result = its_writell(s, offset, data, attrs);
> > + break;
> > + default:
> > + result = MEMTX_ERROR;
> > + break;
> > + }
> > +
> > + if (result == MEMTX_ERROR) {
> > + qemu_log_mask(LOG_GUEST_ERROR,
> > + "%s: invalid guest write at offset " TARGET_FMT_plx
> > + "size %u\n", __func__, offset, size);
> > + /*
> > + * The spec requires that reserved registers are RAZ/WI;
> > + * so use MEMTX_ERROR returns from leaf functions as a way to
> > + * trigger the guest-error logging but don't return it to
> > + * the caller, or we'll cause a spurious guest data abort.
> > + */
> > + result = MEMTX_OK;
> > + }
> > + return result;
> > +}
> > +
> > +static const MemoryRegionOps gicv3_its_control_ops = {
> > + .read_with_attrs = gicv3_its_read,
> > + .write_with_attrs = gicv3_its_write,
> > + .valid.min_access_size = 4,
> > + .valid.max_access_size = 8,
> > + .impl.min_access_size = 4,
> > + .impl.max_access_size = 8,
> > + .endianness = DEVICE_NATIVE_ENDIAN,
> > +};
> > +
> > +static const MemoryRegionOps gicv3_its_translation_ops = {
> > + .write_with_attrs = gicv3_its_translation_write,
> > + .valid.min_access_size = 2,
> > + .valid.max_access_size = 4,
> > + .impl.min_access_size = 2,
> > + .impl.max_access_size = 4,
> > + .endianness = DEVICE_NATIVE_ENDIAN,
> > +};
> > +
> > +static void gicv3_arm_its_realize(DeviceState *dev, Error **errp)
> > +{
> > + GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
> > +
> > + gicv3_its_init_mmio(s, &gicv3_its_control_ops, &gicv3_its_translation_ops);
> > +
> > + if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {
> > + /* set the ITS default features supported */
> > + s->typer = FIELD_DP64(s->typer, GITS_TYPER, PHYSICAL,
> > + GITS_TYPE_PHYSICAL);
> > + s->typer = FIELD_DP64(s->typer, GITS_TYPER, ITT_ENTRY_SIZE,
> > + ITS_ITT_ENTRY_SIZE - 1);
> > + s->typer = FIELD_DP64(s->typer, GITS_TYPER, IDBITS, ITS_IDBITS);
> > + s->typer = FIELD_DP64(s->typer, GITS_TYPER, DEVBITS, ITS_DEVBITS);
> > + s->typer = FIELD_DP64(s->typer, GITS_TYPER, CIL, 1);
> > + s->typer = FIELD_DP64(s->typer, GITS_TYPER, CIDBITS, ITS_CIDBITS);
> > + }
> > +}
> > +
> > +static void gicv3_its_reset(DeviceState *dev)
> > +{
> > + GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
> > + GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
> > +
> > + if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {
> > + c->parent_reset(dev);
> > +
> > + /* Quiescent bit reset to 1 */
> > + s->ctlr = FIELD_DP32(s->ctlr, GITS_CTLR, QUIESCENT, 1);
> > +
> > + /*
> > + * setting GITS_BASER0.Type = 0b001 (Device)
> > + * GITS_BASER1.Type = 0b100 (Collection Table)
> > + * GITS_BASER<n>.Type,where n = 3 to 7 are 0b00 (Unimplemented)
> > + * GITS_BASER<0,1>.Page_Size = 64KB
> > + * and default translation table entry size to 16 bytes
> > + */
> > + s->baser[0] = FIELD_DP64(s->baser[0], GITS_BASER, TYPE,
> > + GITS_ITT_TYPE_DEVICE);
> > + s->baser[0] = FIELD_DP64(s->baser[0], GITS_BASER, PAGESIZE,
> > + GITS_BASER_PAGESIZE_64K);
> > + s->baser[0] = FIELD_DP64(s->baser[0], GITS_BASER, ENTRYSIZE,
> > + GITS_DTE_SIZE - 1);
> > +
> > + s->baser[1] = FIELD_DP64(s->baser[1], GITS_BASER, TYPE,
> > + GITS_ITT_TYPE_COLLECTION);
> > + s->baser[1] = FIELD_DP64(s->baser[1], GITS_BASER, PAGESIZE,
> > + GITS_BASER_PAGESIZE_64K);
> > + s->baser[1] = FIELD_DP64(s->baser[1], GITS_BASER, ENTRYSIZE,
> > + GITS_CTE_SIZE - 1);
> > + }
> > +}
> > +
> > +static Property gicv3_its_props[] = {
> > + DEFINE_PROP_LINK("parent-gicv3", GICv3ITSState, gicv3, "arm-gicv3",
> > + GICv3State *),
> > + DEFINE_PROP_END_OF_LIST(),
> > +};
> > +
> > +static void gicv3_its_class_init(ObjectClass *klass, void *data)
> > +{
> > + DeviceClass *dc = DEVICE_CLASS(klass);
> > + GICv3ITSClass *ic = ARM_GICV3_ITS_CLASS(klass);
> > +
> > + dc->realize = gicv3_arm_its_realize;
> > + device_class_set_props(dc, gicv3_its_props);
> > + device_class_set_parent_reset(dc, gicv3_its_reset, &ic->parent_reset);
> > +}
> > +
> > +static const TypeInfo gicv3_its_info = {
> > + .name = TYPE_ARM_GICV3_ITS,
> > + .parent = TYPE_ARM_GICV3_ITS_COMMON,
> > + .instance_size = sizeof(GICv3ITSState),
> > + .class_init = gicv3_its_class_init,
> > + .class_size = sizeof(GICv3ITSClass),
> > +};
> > +
> > +static void gicv3_its_register_types(void)
> > +{
> > + type_register_static(&gicv3_its_info);
> > +}
> > +
> > +type_init(gicv3_its_register_types)
> > diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
> > index 66c4c6a188..f1657c84e0 100644
> > --- a/hw/intc/arm_gicv3_its_common.c
> > +++ b/hw/intc/arm_gicv3_its_common.c
> > @@ -50,6 +50,8 @@ static int gicv3_its_post_load(void *opaque, int version_id)
> >
> > static const VMStateDescription vmstate_its = {
> > .name = "arm_gicv3_its",
> > + .version_id = 1,
> > + .minimum_version_id = 1,
> > .pre_save = gicv3_its_pre_save,
> > .post_load = gicv3_its_post_load,
> > .priority = MIG_PRI_GICV3_ITS,
> > @@ -99,14 +101,15 @@ static const MemoryRegionOps gicv3_its_trans_ops = {
> > .endianness = DEVICE_NATIVE_ENDIAN,
> > };
> >
> > -void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops)
> > +void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops,
> > + const MemoryRegionOps *tops)
> > {
> > SysBusDevice *sbd = SYS_BUS_DEVICE(s);
> >
> > memory_region_init_io(&s->iomem_its_cntrl, OBJECT(s), ops, s,
> > "control", ITS_CONTROL_SIZE);
> > memory_region_init_io(&s->iomem_its_translation, OBJECT(s),
> > - &gicv3_its_trans_ops, s,
> > + tops ? tops : &gicv3_its_trans_ops, s,
> > "translation", ITS_TRANS_SIZE);
> >
> > /* Our two regions are always adjacent, therefore we now combine them
> > @@ -129,7 +132,6 @@ static void gicv3_its_common_reset(DeviceState *dev)
> > s->cbaser = 0;
> > s->cwriter = 0;
> > s->creadr = 0;
> > - s->iidr = 0;
> > memset(&s->baser, 0, sizeof(s->baser));
> > }
> >
> > diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
> > index b554d2ede0..0b4cbed28b 100644
> > --- a/hw/intc/arm_gicv3_its_kvm.c
> > +++ b/hw/intc/arm_gicv3_its_kvm.c
> > @@ -106,7 +106,7 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
> > kvm_arm_register_device(&s->iomem_its_cntrl, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
> > KVM_VGIC_ITS_ADDR_TYPE, s->dev_fd, 0);
> >
> > - gicv3_its_init_mmio(s, NULL);
> > + gicv3_its_init_mmio(s, NULL, NULL);
> >
> > if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
> > GITS_CTLR)) {
> > diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> > index 05303a55c8..e0b06930a7 100644
> > --- a/hw/intc/gicv3_internal.h
> > +++ b/hw/intc/gicv3_internal.h
> > @@ -24,6 +24,7 @@
> > #ifndef QEMU_ARM_GICV3_INTERNAL_H
> > #define QEMU_ARM_GICV3_INTERNAL_H
> >
> > +#include "hw/registerfields.h"
> > #include "hw/intc/arm_gicv3_common.h"
> >
> > /* Distributor registers, as offsets from the distributor base address */
> > @@ -67,6 +68,9 @@
> > #define GICD_CTLR_E1NWF (1U << 7)
> > #define GICD_CTLR_RWP (1U << 31)
> >
> > +/* 16 bits EventId */
> > +#define GICD_TYPER_IDBITS 0xf
> > +
> > /*
> > * Redistributor frame offsets from RD_base
> > */
> > @@ -122,18 +126,6 @@
> > #define GICR_WAKER_ProcessorSleep (1U << 1)
> > #define GICR_WAKER_ChildrenAsleep (1U << 2)
> >
> > -#define GICR_PROPBASER_OUTER_CACHEABILITY_MASK (7ULL << 56)
> > -#define GICR_PROPBASER_ADDR_MASK (0xfffffffffULL << 12)
> > -#define GICR_PROPBASER_SHAREABILITY_MASK (3U << 10)
> > -#define GICR_PROPBASER_CACHEABILITY_MASK (7U << 7)
> > -#define GICR_PROPBASER_IDBITS_MASK (0x1f)
> > -
> > -#define GICR_PENDBASER_PTZ (1ULL << 62)
> > -#define GICR_PENDBASER_OUTER_CACHEABILITY_MASK (7ULL << 56)
> > -#define GICR_PENDBASER_ADDR_MASK (0xffffffffULL << 16)
> > -#define GICR_PENDBASER_SHAREABILITY_MASK (3U << 10)
> > -#define GICR_PENDBASER_CACHEABILITY_MASK (7U << 7)
> > -
> > #define ICC_CTLR_EL1_CBPR (1U << 0)
> > #define ICC_CTLR_EL1_EOIMODE (1U << 1)
> > #define ICC_CTLR_EL1_PMHE (1U << 6)
> > @@ -239,6 +231,78 @@
> > #define ICH_VTR_EL2_PREBITS_SHIFT 26
> > #define ICH_VTR_EL2_PRIBITS_SHIFT 29
> >
> > +/* ITS Registers */
> > +
> > +FIELD(GITS_BASER, SIZE, 0, 8)
> > +FIELD(GITS_BASER, PAGESIZE, 8, 2)
> > +FIELD(GITS_BASER, SHAREABILITY, 10, 2)
> > +FIELD(GITS_BASER, PHYADDR, 12, 36)
> > +FIELD(GITS_BASER, PHYADDRL_64K, 16, 32)
> > +FIELD(GITS_BASER, PHYADDRH_64K, 48, 4)
> Isn't it FIELD(GITS_BASER, PHYADDRH_64K, 12, 4)
> hum actually it is fixed in next patch ;-) The right value can be put
> here directly
> > +FIELD(GITS_BASER, ENTRYSIZE, 48, 5)
> > +FIELD(GITS_BASER, OUTERCACHE, 53, 3)
> > +FIELD(GITS_BASER, TYPE, 56, 3)
> > +FIELD(GITS_BASER, INNERCACHE, 59, 3)
> > +FIELD(GITS_BASER, INDIRECT, 62, 1)
> > +FIELD(GITS_BASER, VALID, 63, 1)
> > +
> > +FIELD(GITS_CTLR, QUIESCENT, 31, 1)
> > +
> > +FIELD(GITS_TYPER, PHYSICAL, 0, 1)
> > +FIELD(GITS_TYPER, ITT_ENTRY_SIZE, 4, 4)
> > +FIELD(GITS_TYPER, IDBITS, 8, 5)
> > +FIELD(GITS_TYPER, DEVBITS, 13, 5)
> > +FIELD(GITS_TYPER, SEIS, 18, 1)
> > +FIELD(GITS_TYPER, PTA, 19, 1)
> > +FIELD(GITS_TYPER, CIDBITS, 32, 4)
> > +FIELD(GITS_TYPER, CIL, 36, 1)
> > +
> > +#define GITS_BASER_PAGESIZE_4K 0
> > +#define GITS_BASER_PAGESIZE_16K 1
> > +#define GITS_BASER_PAGESIZE_64K 2
> > +
> > +#define GITS_ITT_TYPE_DEVICE 1ULL
> > +#define GITS_ITT_TYPE_COLLECTION 4ULL
> you may rename into GITS_BASER_TYPE_DEVICE and COLLECTION?
> > +
> > +/**
> > + * Default features advertised by this version of ITS
> > + */
> > +/* Physical LPIs supported */
> > +#define GITS_TYPE_PHYSICAL (1U << 0)
> > +
> > +/*
> > + * 12 bytes Interrupt translation Table Entry size
> > + * ITE Lower 8 Bytes
> > + * Valid = 1 bit,InterruptType = 1 bit,
> > + * Size of LPI number space[considering max 24 bits],
> > + * Size of LPI number space[considering max 24 bits],
> repeated
> > + * ITE Higher 4 Bytes
> > + * ICID = 16 bits,
> > + * vPEID = 16 bits
>
> for info the ABI used by the kernel can be found in linux
> Documentation/virt/kvm/devices/arm-vgic-its.rst
>
> The ITE there is 8 bytes.
> Have you considered the same?

> The implementation defines ITE size of max 12 bytes (based on Table 5-3 ITE entries in GICv3 spec) by considering max LPI number space of 24 bits (for each of Interrupt_Number-pIntid field & Interrupt_Number-HypervisorID field) .
> + */
> +#define ITS_ITT_ENTRY_SIZE 0xC
> +
> +/* 16 bits EventId */
> +#define ITS_IDBITS GICD_TYPER_IDBITS
> +
> +/* 16 bits DeviceId */
> +#define ITS_DEVBITS 0xF
> +
> +/* 16 bits CollectionId */
> +#define ITS_CIDBITS 0xF
> +
> +/*
> + * 8 bytes Device Table Entry size
> + * Valid = 1 bit,ITTAddr = 44 bits,Size = 5 bits
> + */
> +#define GITS_DTE_SIZE (0x8ULL)
> +
> +/*
> + * 8 bytes Collection Table Entry size
> + * Valid = 1 bit,RDBase = 36 bits(considering max RDBASE)
> + */
> +#define GITS_CTE_SIZE (0x8ULL)
> +
> /* Special interrupt IDs */
> #define INTID_SECURE 1020
> #define INTID_NONSECURE 1021
> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> index 6e52a166e3..4dcfea6aa8 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -8,6 +8,7 @@ softmmu_ss.add(when: 'CONFIG_ARM_GIC', if_true: files(
> 'arm_gicv3_dist.c',
> 'arm_gicv3_its_common.c',
> 'arm_gicv3_redist.c',
> + 'arm_gicv3_its.c',
> ))
> softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_pic.c'))
> softmmu_ss.add(when: 'CONFIG_HEATHROW_PIC', if_true: files('heathrow_pic.c'))
> diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
> index 5a0952b404..65d1191db1 100644
> --- a/include/hw/intc/arm_gicv3_its_common.h
> +++ b/include/hw/intc/arm_gicv3_its_common.h
> @@ -25,17 +25,22 @@
> #include "hw/intc/arm_gicv3_common.h"
> #include "qom/object.h"
>
> +#define TYPE_ARM_GICV3_ITS "arm-gicv3-its"
> +
> #define ITS_CONTROL_SIZE 0x10000
> #define ITS_TRANS_SIZE 0x10000
> #define ITS_SIZE (ITS_CONTROL_SIZE + ITS_TRANS_SIZE)
>
> #define GITS_CTLR 0x0
> #define GITS_IIDR 0x4
> +#define GITS_TYPER 0x8
> #define GITS_CBASER 0x80
> #define GITS_CWRITER 0x88
> #define GITS_CREADR 0x90
> #define GITS_BASER 0x100
>
> +#define GITS_TRANSLATER 0x0040
> +
> struct GICv3ITSState {
> SysBusDevice parent_obj;
>
> @@ -52,6 +57,7 @@ struct GICv3ITSState {
> /* Registers */
> uint32_t ctlr;
> uint32_t iidr;
> + uint64_t typer;
> uint64_t cbaser;
> uint64_t cwriter;
> uint64_t creadr;
> @@ -62,7 +68,8 @@ struct GICv3ITSState {
>
> typedef struct GICv3ITSState GICv3ITSState;
>
> -void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops);
> +void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops,
> + const MemoryRegionOps *tops);
>
> #define TYPE_ARM_GICV3_ITS_COMMON "arm-gicv3-its-common"
> typedef struct GICv3ITSCommonClass GICv3ITSCommonClass;
>
Thanks

Eric
--60c39c00_19bd3428_1617
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<br><br><div class=3D=22gmail=5Fquote=5Fattribution=22>On Jun 11 2021, at=
 12:21 pm, Eric Auger &lt;eauger=40redhat.com&gt; wrote:</div><blockquote=
><div><div>Hi,</div><br><div>On 6/2/21 8:00 PM, Shashi Mallela wrote:</di=
v><div>&gt; Added register definitions relevant to ITS,implemented overal=
l</div><div>&gt; ITS device framework with stubs for ITS control and tran=
slater</div><div>&gt; regions read/write,extended ITS common to handle mm=
io init between</div><div>&gt; existing kvm device and newer qemu device.=
</div><div>&gt;</div><div>&gt; Signed-off-by: Shashi Mallela &lt;shashi.m=
allela=40linaro.org&gt;</div><div>&gt; ---</div><div>&gt; hw/intc/arm=5Fg=
icv3=5Fits.c =7C 240 +++++++++++++++++++++++++</div><div>&gt; hw/intc/arm=
=5Fgicv3=5Fits=5Fcommon.c =7C 8 +-</div><div>&gt; hw/intc/arm=5Fgicv3=5Fi=
ts=5Fkvm.c =7C 2 +-</div><div>&gt; hw/intc/gicv3=5Finternal.h =7C 88 ++++=
+++--</div><div>&gt; hw/intc/meson.build =7C 1 +</div><div>&gt; include/h=
w/intc/arm=5Fgicv3=5Fits=5Fcommon.h =7C 9 +-</div><div>&gt; 6 files chang=
ed, 331 insertions(+), 17 deletions(-)</div><div>&gt; create mode 100644 =
hw/intc/arm=5Fgicv3=5Fits.c</div><div>&gt;</div><div>&gt; diff --git a/hw=
/intc/arm=5Fgicv3=5Fits.c b/hw/intc/arm=5Fgicv3=5Fits.c</div><div>&gt; ne=
w file mode 100644</div><div>&gt; index 0000000000..545cda3665</div><div>=
&gt; --- /dev/null</div><div>&gt; +++ b/hw/intc/arm=5Fgicv3=5Fits.c</div>=
<div>&gt; =40=40 -0,0 +1,240 =40=40</div><div>&gt; +/*</div><div>&gt; + *=
 ITS emulation for a GICv3-based system</div><div>&gt; + *</div><div>&gt;=
 + * Copyright Linaro.org 2021</div><div>&gt; + *</div><div>&gt; + * Auth=
ors:</div><div>&gt; + * Shashi Mallela &lt;shashi.mallela=40linaro.org&gt=
;</div><div>&gt; + *</div><div>&gt; + * This work is licensed under the t=
erms of the GNU GPL, version 2 or (at your</div><div>&gt; + * option) any=
 later version. See the COPYING file in the top-level directory.</div><di=
v>&gt; + *</div><div>&gt; + */</div><div>&gt; +</div><div>&gt; +=23includ=
e =22qemu/osdep.h=22</div><div>&gt; +=23include =22qemu/log.h=22</div><di=
v>&gt; +=23include =22hw/qdev-properties.h=22</div><div>&gt; +=23include =
=22hw/intc/arm=5Fgicv3=5Fits=5Fcommon.h=22</div><div>&gt; +=23include =22=
gicv3=5Finternal.h=22</div><div>&gt; +=23include =22qom/object.h=22</div>=
<div>&gt; +</div><div>&gt; +typedef struct GICv3ITSClass GICv3ITSClass;</=
div><div>&gt; +/* This is reusing the GICv3ITSState typedef from ARM=5FGI=
CV3=5FITS=5FCOMMON */</div><div>&gt; +DECLARE=5FOBJ=5FCHECKERS(GICv3ITSSt=
ate, GICv3ITSClass,</div><div>&gt; + ARM=5FGICV3=5FITS, TYPE=5FARM=5FGICV=
3=5FITS)</div><div>&gt; +</div><div>&gt; +struct GICv3ITSClass =7B</div><=
div>&gt; + GICv3ITSCommonClass parent=5Fclass;</div><div>&gt; + void (*pa=
rent=5Freset)(DeviceState *dev);</div><div>&gt; +=7D;</div><div>&gt; +</d=
iv><div>&gt; +static MemTxResult gicv3=5Fits=5Ftranslation=5Fwrite(void *=
opaque, hwaddr offset,</div><div>&gt; + uint64=5Ft data, unsigned size,</=
div><div>&gt; + MemTxAttrs attrs)</div><div>&gt; +=7B</div><div>&gt; + Me=
mTxResult result =3D MEMTX=5FOK;</div><div>&gt; +</div><div>&gt; + return=
 result;</div><div>&gt; +=7D</div><div>&gt; +</div><div>&gt; +static MemT=
xResult its=5Fwritel(GICv3ITSState *s, hwaddr offset,</div><div>&gt; + ui=
nt64=5Ft value, MemTxAttrs attrs)</div><div>&gt; +=7B</div><div>&gt; + Me=
mTxResult result =3D MEMTX=5FOK;</div><div>&gt; +</div><div>&gt; + return=
 result;</div><div>&gt; +=7D</div><div>&gt; +</div><div>&gt; +static MemT=
xResult its=5Freadl(GICv3ITSState *s, hwaddr offset,</div><div>&gt; + uin=
t64=5Ft *data, MemTxAttrs attrs)</div><div>&gt; +=7B</div><div>&gt; + Mem=
TxResult result =3D MEMTX=5FOK;</div><div>&gt; +</div><div>&gt; + return =
result;</div><div>&gt; +=7D</div><div>&gt; +</div><div>&gt; +static MemTx=
Result its=5Fwritell(GICv3ITSState *s, hwaddr offset,</div><div>&gt; + ui=
nt64=5Ft value, MemTxAttrs attrs)</div><div>&gt; +=7B</div><div>&gt; + Me=
mTxResult result =3D MEMTX=5FOK;</div><div>&gt; +</div><div>&gt; + return=
 result;</div><div>&gt; +=7D</div><div>&gt; +</div><div>&gt; +static MemT=
xResult its=5Freadll(GICv3ITSState *s, hwaddr offset,</div><div>&gt; + ui=
nt64=5Ft *data, MemTxAttrs attrs)</div><div>&gt; +=7B</div><div>&gt; + Me=
mTxResult result =3D MEMTX=5FOK;</div><div>&gt; +</div><div>&gt; + return=
 result;</div><div>&gt; +=7D</div><div>&gt; +</div><div>&gt; +static MemT=
xResult gicv3=5Fits=5Fread(void *opaque, hwaddr offset, uint64=5Ft *data,=
</div><div>&gt; + unsigned size, MemTxAttrs attrs)</div><div>&gt; +=7B</d=
iv><div>&gt; + GICv3ITSState *s =3D (GICv3ITSState *)opaque;</div><div>&g=
t; + MemTxResult result;</div><div>&gt; +</div><div>&gt; + switch (size) =
=7B</div><div>&gt; + case 4:</div><div>&gt; + result =3D its=5Freadl(s, o=
ffset, data, attrs);</div><div>&gt; + break;</div><div>&gt; + case 8:</di=
v><div>&gt; + result =3D its=5Freadll(s, offset, data, attrs);</div><div>=
&gt; + break;</div><div>&gt; + default:</div><div>&gt; + result =3D MEMTX=
=5FERROR;</div><div>&gt; + break;</div><div>&gt; + =7D</div><div>&gt; +</=
div><div>&gt; + if (result =3D=3D MEMTX=5FERROR) =7B</div><div>&gt; + qem=
u=5Flog=5Fmask(LOG=5FGUEST=5FERROR,</div><div>&gt; + =22%s: invalid guest=
 read at offset =22 TARGET=5F=46MT=5Fplx</div><div>&gt; + =22size %u=5Cn=22=
, =5F=5Ffunc=5F=5F, offset, size);</div><div>&gt; + /*</div><div>&gt; + *=
 The spec requires that reserved registers are RAZ/WI;</div><div>&gt; + *=
 so use MEMTX=5FERROR returns from leaf functions as a way to</div><div>&=
gt; + * trigger the guest-error logging but don't return it to</div><div>=
&gt; + * the caller, or we'll cause a spurious guest data abort.</div><di=
v>&gt; + */</div><div>&gt; + result =3D MEMTX=5FOK;</div><div>&gt; + *dat=
a =3D 0;</div><div>&gt; + =7D</div><div>&gt; + return result;</div><div>&=
gt; +=7D</div><div>&gt; +</div><div>&gt; +static MemTxResult gicv3=5Fits=5F=
write(void *opaque, hwaddr offset, uint64=5Ft data,</div><div>&gt; + unsi=
gned size, MemTxAttrs attrs)</div><div>&gt; +=7B</div><div>&gt; + GICv3IT=
SState *s =3D (GICv3ITSState *)opaque;</div><div>&gt; + MemTxResult resul=
t;</div><div>&gt; +</div><div>&gt; + switch (size) =7B</div><div>&gt; + c=
ase 4:</div><div>&gt; + result =3D its=5Fwritel(s, offset, data, attrs);<=
/div><div>&gt; + break;</div><div>&gt; + case 8:</div><div>&gt; + result =
=3D its=5Fwritell(s, offset, data, attrs);</div><div>&gt; + break;</div><=
div>&gt; + default:</div><div>&gt; + result =3D MEMTX=5FERROR;</div><div>=
&gt; + break;</div><div>&gt; + =7D</div><div>&gt; +</div><div>&gt; + if (=
result =3D=3D MEMTX=5FERROR) =7B</div><div>&gt; + qemu=5Flog=5Fmask(LOG=5F=
GUEST=5FERROR,</div><div>&gt; + =22%s: invalid guest write at offset =22 =
TARGET=5F=46MT=5Fplx</div><div>&gt; + =22size %u=5Cn=22, =5F=5Ffunc=5F=5F=
, offset, size);</div><div>&gt; + /*</div><div>&gt; + * The spec requires=
 that reserved registers are RAZ/WI;</div><div>&gt; + * so use MEMTX=5FER=
ROR returns from leaf functions as a way to</div><div>&gt; + * trigger th=
e guest-error logging but don't return it to</div><div>&gt; + * the calle=
r, or we'll cause a spurious guest data abort.</div><div>&gt; + */</div><=
div>&gt; + result =3D MEMTX=5FOK;</div><div>&gt; + =7D</div><div>&gt; + r=
eturn result;</div><div>&gt; +=7D</div><div>&gt; +</div><div>&gt; +static=
 const MemoryRegionOps gicv3=5Fits=5Fcontrol=5Fops =3D =7B</div><div>&gt;=
 + .read=5Fwith=5Fattrs =3D gicv3=5Fits=5Fread,</div><div>&gt; + .write=5F=
with=5Fattrs =3D gicv3=5Fits=5Fwrite,</div><div>&gt; + .valid.min=5Facces=
s=5Fsize =3D 4,</div><div>&gt; + .valid.max=5Faccess=5Fsize =3D 8,</div><=
div>&gt; + .impl.min=5Faccess=5Fsize =3D 4,</div><div>&gt; + .impl.max=5F=
access=5Fsize =3D 8,</div><div>&gt; + .endianness =3D DEVICE=5FNATIVE=5FE=
NDIAN,</div><div>&gt; +=7D;</div><div>&gt; +</div><div>&gt; +static const=
 MemoryRegionOps gicv3=5Fits=5Ftranslation=5Fops =3D =7B</div><div>&gt; +=
 .write=5Fwith=5Fattrs =3D gicv3=5Fits=5Ftranslation=5Fwrite,</div><div>&=
gt; + .valid.min=5Faccess=5Fsize =3D 2,</div><div>&gt; + .valid.max=5Facc=
ess=5Fsize =3D 4,</div><div>&gt; + .impl.min=5Faccess=5Fsize =3D 2,</div>=
<div>&gt; + .impl.max=5Faccess=5Fsize =3D 4,</div><div>&gt; + .endianness=
 =3D DEVICE=5FNATIVE=5FENDIAN,</div><div>&gt; +=7D;</div><div>&gt; +</div=
><div>&gt; +static void gicv3=5Farm=5Fits=5Frealize(DeviceState *dev, Err=
or **errp)</div><div>&gt; +=7B</div><div>&gt; + GICv3ITSState *s =3D ARM=5F=
GICV3=5FITS=5FCOMMON(dev);</div><div>&gt; +</div><div>&gt; + gicv3=5Fits=5F=
init=5Fmmio(s, &amp;gicv3=5Fits=5Fcontrol=5Fops, &amp;gicv3=5Fits=5Ftrans=
lation=5Fops);</div><div>&gt; +</div><div>&gt; + if (s-&gt;gicv3-&gt;cpu-=
&gt;gicr=5Ftyper &amp; GICR=5FTYPER=5FPLPIS) =7B</div><div>&gt; + /* set =
the ITS default features supported */</div><div>&gt; + s-&gt;typer =3D =46=
IELD=5FDP64(s-&gt;typer, GITS=5FTYPER, PHYSICAL,</div><div>&gt; + GITS=5F=
TYPE=5FPHYSICAL);</div><div>&gt; + s-&gt;typer =3D =46IELD=5FDP64(s-&gt;t=
yper, GITS=5FTYPER, ITT=5FENTRY=5FSIZE,</div><div>&gt; + ITS=5FITT=5FENTR=
Y=5FSIZE - 1);</div><div>&gt; + s-&gt;typer =3D =46IELD=5FDP64(s-&gt;type=
r, GITS=5FTYPER, IDBITS, ITS=5FIDBITS);</div><div>&gt; + s-&gt;typer =3D =
=46IELD=5FDP64(s-&gt;typer, GITS=5FTYPER, DEVBITS, ITS=5FDEVBITS);</div><=
div>&gt; + s-&gt;typer =3D =46IELD=5FDP64(s-&gt;typer, GITS=5FTYPER, CIL,=
 1);</div><div>&gt; + s-&gt;typer =3D =46IELD=5FDP64(s-&gt;typer, GITS=5F=
TYPER, CIDBITS, ITS=5FCIDBITS);</div><div>&gt; + =7D</div><div>&gt; +=7D<=
/div><div>&gt; +</div><div>&gt; +static void gicv3=5Fits=5Freset(DeviceSt=
ate *dev)</div><div>&gt; +=7B</div><div>&gt; + GICv3ITSState *s =3D ARM=5F=
GICV3=5FITS=5FCOMMON(dev);</div><div>&gt; + GICv3ITSClass *c =3D ARM=5FGI=
CV3=5FITS=5FGET=5FCLASS(s);</div><div>&gt; +</div><div>&gt; + if (s-&gt;g=
icv3-&gt;cpu-&gt;gicr=5Ftyper &amp; GICR=5FTYPER=5FPLPIS) =7B</div><div>&=
gt; + c-&gt;parent=5Freset(dev);</div><div>&gt; +</div><div>&gt; + /* Qui=
escent bit reset to 1 */</div><div>&gt; + s-&gt;ctlr =3D =46IELD=5FDP32(s=
-&gt;ctlr, GITS=5FCTLR, QUIESCENT, 1);</div><div>&gt; +</div><div>&gt; + =
/*</div><div>&gt; + * setting GITS=5FBASER0.Type =3D 0b001 (Device)</div>=
<div>&gt; + * GITS=5FBASER1.Type =3D 0b100 (Collection Table)</div><div>&=
gt; + * GITS=5FBASER&lt;n&gt;.Type,where n =3D 3 to 7 are 0b00 (Unimpleme=
nted)</div><div>&gt; + * GITS=5FBASER&lt;0,1&gt;.Page=5FSize =3D 64KB</di=
v><div>&gt; + * and default translation table entry size to 16 bytes</div=
><div>&gt; + */</div><div>&gt; + s-&gt;baser=5B0=5D =3D =46IELD=5FDP64(s-=
&gt;baser=5B0=5D, GITS=5FBASER, TYPE,</div><div>&gt; + GITS=5FITT=5FTYPE=5F=
DEVICE);</div><div>&gt; + s-&gt;baser=5B0=5D =3D =46IELD=5FDP64(s-&gt;bas=
er=5B0=5D, GITS=5FBASER, PAGESIZE,</div><div>&gt; + GITS=5FBASER=5FPAGESI=
ZE=5F64K);</div><div>&gt; + s-&gt;baser=5B0=5D =3D =46IELD=5FDP64(s-&gt;b=
aser=5B0=5D, GITS=5FBASER, ENTRYSIZE,</div><div>&gt; + GITS=5FDTE=5FSIZE =
- 1);</div><div>&gt; +</div><div>&gt; + s-&gt;baser=5B1=5D =3D =46IELD=5F=
DP64(s-&gt;baser=5B1=5D, GITS=5FBASER, TYPE,</div><div>&gt; + GITS=5FITT=5F=
TYPE=5FCOLLECTION);</div><div>&gt; + s-&gt;baser=5B1=5D =3D =46IELD=5FDP6=
4(s-&gt;baser=5B1=5D, GITS=5FBASER, PAGESIZE,</div><div>&gt; + GITS=5FBAS=
ER=5FPAGESIZE=5F64K);</div><div>&gt; + s-&gt;baser=5B1=5D =3D =46IELD=5FD=
P64(s-&gt;baser=5B1=5D, GITS=5FBASER, ENTRYSIZE,</div><div>&gt; + GITS=5F=
CTE=5FSIZE - 1);</div><div>&gt; + =7D</div><div>&gt; +=7D</div><div>&gt; =
+</div><div>&gt; +static Property gicv3=5Fits=5Fprops=5B=5D =3D =7B</div>=
<div>&gt; + DE=46INE=5FPROP=5FLINK(=22parent-gicv3=22, GICv3ITSState, gic=
v3, =22arm-gicv3=22,</div><div>&gt; + GICv3State *),</div><div>&gt; + DE=46=
INE=5FPROP=5FEND=5FO=46=5FLIST(),</div><div>&gt; +=7D;</div><div>&gt; +</=
div><div>&gt; +static void gicv3=5Fits=5Fclass=5Finit(ObjectClass *klass,=
 void *data)</div><div>&gt; +=7B</div><div>&gt; + DeviceClass *dc =3D DEV=
ICE=5FCLASS(klass);</div><div>&gt; + GICv3ITSClass *ic =3D ARM=5FGICV3=5F=
ITS=5FCLASS(klass);</div><div>&gt; +</div><div>&gt; + dc-&gt;realize =3D =
gicv3=5Farm=5Fits=5Frealize;</div><div>&gt; + device=5Fclass=5Fset=5Fprop=
s(dc, gicv3=5Fits=5Fprops);</div><div>&gt; + device=5Fclass=5Fset=5Fparen=
t=5Freset(dc, gicv3=5Fits=5Freset, &amp;ic-&gt;parent=5Freset);</div><div=
>&gt; +=7D</div><div>&gt; +</div><div>&gt; +static const TypeInfo gicv3=5F=
its=5Finfo =3D =7B</div><div>&gt; + .name =3D TYPE=5FARM=5FGICV3=5FITS,</=
div><div>&gt; + .parent =3D TYPE=5FARM=5FGICV3=5FITS=5FCOMMON,</div><div>=
&gt; + .instance=5Fsize =3D sizeof(GICv3ITSState),</div><div>&gt; + .clas=
s=5Finit =3D gicv3=5Fits=5Fclass=5Finit,</div><div>&gt; + .class=5Fsize =3D=
 sizeof(GICv3ITSClass),</div><div>&gt; +=7D;</div><div>&gt; +</div><div>&=
gt; +static void gicv3=5Fits=5Fregister=5Ftypes(void)</div><div>&gt; +=7B=
</div><div>&gt; + type=5Fregister=5Fstatic(&amp;gicv3=5Fits=5Finfo);</div=
><div>&gt; +=7D</div><div>&gt; +</div><div>&gt; +type=5Finit(gicv3=5Fits=5F=
register=5Ftypes)</div><div>&gt; diff --git a/hw/intc/arm=5Fgicv3=5Fits=5F=
common.c b/hw/intc/arm=5Fgicv3=5Fits=5Fcommon.c</div><div>&gt; index 66c4=
c6a188..f1657c84e0 100644</div><div>&gt; --- a/hw/intc/arm=5Fgicv3=5Fits=5F=
common.c</div><div>&gt; +++ b/hw/intc/arm=5Fgicv3=5Fits=5Fcommon.c</div><=
div>&gt; =40=40 -50,6 +50,8 =40=40 static int gicv3=5Fits=5Fpost=5Fload(v=
oid *opaque, int version=5Fid)</div><div>&gt;</div><div>&gt; static const=
 VMStateDescription vmstate=5Fits =3D =7B</div><div>&gt; .name =3D =22arm=
=5Fgicv3=5Fits=22,</div><div>&gt; + .version=5Fid =3D 1,</div><div>&gt; +=
 .minimum=5Fversion=5Fid =3D 1,</div><div>&gt; .pre=5Fsave =3D gicv3=5Fit=
s=5Fpre=5Fsave,</div><div>&gt; .post=5Fload =3D gicv3=5Fits=5Fpost=5Fload=
,</div><div>&gt; .priority =3D MIG=5FPRI=5FGICV3=5FITS,</div><div>&gt; =40=
=40 -99,14 +101,15 =40=40 static const MemoryRegionOps gicv3=5Fits=5Ftran=
s=5Fops =3D =7B</div><div>&gt; .endianness =3D DEVICE=5FNATIVE=5FENDIAN,<=
/div><div>&gt; =7D;</div><div>&gt;</div><div>&gt; -void gicv3=5Fits=5Fini=
t=5Fmmio(GICv3ITSState *s, const MemoryRegionOps *ops)</div><div>&gt; +vo=
id gicv3=5Fits=5Finit=5Fmmio(GICv3ITSState *s, const MemoryRegionOps *ops=
,</div><div>&gt; + const MemoryRegionOps *tops)</div><div>&gt; =7B</div><=
div>&gt; SysBusDevice *sbd =3D SYS=5FBUS=5FDEVICE(s);</div><div>&gt;</div=
><div>&gt; memory=5Fregion=5Finit=5Fio(&amp;s-&gt;iomem=5Fits=5Fcntrl, OB=
JECT(s), ops, s,</div><div>&gt; =22control=22, ITS=5FCONTROL=5FSIZE);</di=
v><div>&gt; memory=5Fregion=5Finit=5Fio(&amp;s-&gt;iomem=5Fits=5Ftranslat=
ion, OBJECT(s),</div><div>&gt; - &amp;gicv3=5Fits=5Ftrans=5Fops, s,</div>=
<div>&gt; + tops =3F tops : &amp;gicv3=5Fits=5Ftrans=5Fops, s,</div><div>=
&gt; =22translation=22, ITS=5FTRANS=5FSIZE);</div><div>&gt;</div><div>&gt=
; /* Our two regions are always adjacent, therefore we now combine them</=
div><div>&gt; =40=40 -129,7 +132,6 =40=40 static void gicv3=5Fits=5Fcommo=
n=5Freset(DeviceState *dev)</div><div>&gt; s-&gt;cbaser =3D 0;</div><div>=
&gt; s-&gt;cwriter =3D 0;</div><div>&gt; s-&gt;creadr =3D 0;</div><div>&g=
t; - s-&gt;iidr =3D 0;</div><div>&gt; memset(&amp;s-&gt;baser, 0, sizeof(=
s-&gt;baser));</div><div>&gt; =7D</div><div>&gt;</div><div>&gt; diff --gi=
t a/hw/intc/arm=5Fgicv3=5Fits=5Fkvm.c b/hw/intc/arm=5Fgicv3=5Fits=5Fkvm.c=
</div><div>&gt; index b554d2ede0..0b4cbed28b 100644</div><div>&gt; --- a/=
hw/intc/arm=5Fgicv3=5Fits=5Fkvm.c</div><div>&gt; +++ b/hw/intc/arm=5Fgicv=
3=5Fits=5Fkvm.c</div><div>&gt; =40=40 -106,7 +106,7 =40=40 static void kv=
m=5Farm=5Fits=5Frealize(DeviceState *dev, Error **errp)</div><div>&gt; kv=
m=5Farm=5Fregister=5Fdevice(&amp;s-&gt;iomem=5Fits=5Fcntrl, -1, KVM=5FDEV=
=5FARM=5FVGIC=5FGRP=5FADDR,</div><div>&gt; KVM=5FVGIC=5FITS=5FADDR=5FTYPE=
, s-&gt;dev=5Ffd, 0);</div><div>&gt;</div><div>&gt; - gicv3=5Fits=5Finit=5F=
mmio(s, NULL);</div><div>&gt; + gicv3=5Fits=5Finit=5Fmmio(s, NULL, NULL);=
</div><div>&gt;</div><div>&gt; if (=21kvm=5Fdevice=5Fcheck=5Fattr(s-&gt;d=
ev=5Ffd, KVM=5FDEV=5FARM=5FVGIC=5FGRP=5FITS=5FREGS,</div><div>&gt; GITS=5F=
CTLR)) =7B</div><div>&gt; diff --git a/hw/intc/gicv3=5Finternal.h b/hw/in=
tc/gicv3=5Finternal.h</div><div>&gt; index 05303a55c8..e0b06930a7 100644<=
/div><div>&gt; --- a/hw/intc/gicv3=5Finternal.h</div><div>&gt; +++ b/hw/i=
ntc/gicv3=5Finternal.h</div><div>&gt; =40=40 -24,6 +24,7 =40=40</div><div=
>&gt; =23ifndef QEMU=5FARM=5FGICV3=5FINTERNAL=5FH</div><div>&gt; =23defin=
e QEMU=5FARM=5FGICV3=5FINTERNAL=5FH</div><div>&gt;</div><div>&gt; +=23inc=
lude =22hw/registerfields.h=22</div><div>&gt; =23include =22hw/intc/arm=5F=
gicv3=5Fcommon.h=22</div><div>&gt;</div><div>&gt; /* Distributor register=
s, as offsets from the distributor base address */</div><div>&gt; =40=40 =
-67,6 +68,9 =40=40</div><div>&gt; =23define GICD=5FCTLR=5FE1NW=46 (1U &lt=
;&lt; 7)</div><div>&gt; =23define GICD=5FCTLR=5FRWP (1U &lt;&lt; 31)</div=
><div>&gt;</div><div>&gt; +/* 16 bits EventId */</div><div>&gt; +=23defin=
e GICD=5FTYPER=5FIDBITS 0xf</div><div>&gt; +</div><div>&gt; /*</div><div>=
&gt; * Redistributor frame offsets from RD=5Fbase</div><div>&gt; */</div>=
<div>&gt; =40=40 -122,18 +126,6 =40=40</div><div>&gt; =23define GICR=5FWA=
KER=5FProcessorSleep (1U &lt;&lt; 1)</div><div>&gt; =23define GICR=5FWAKE=
R=5FChildrenAsleep (1U &lt;&lt; 2)</div><div>&gt;</div><div>&gt; -=23defi=
ne GICR=5FPROPBASER=5FOUTER=5FCACHEABILITY=5FMASK (7ULL &lt;&lt; 56)</div=
><div>&gt; -=23define GICR=5FPROPBASER=5FADDR=5FMASK (0xfffffffffULL &lt;=
&lt; 12)</div><div>&gt; -=23define GICR=5FPROPBASER=5FSHAREABILITY=5FMASK=
 (3U &lt;&lt; 10)</div><div>&gt; -=23define GICR=5FPROPBASER=5FCACHEABILI=
TY=5FMASK (7U &lt;&lt; 7)</div><div>&gt; -=23define GICR=5FPROPBASER=5FID=
BITS=5FMASK (0x1f)</div><div>&gt; -</div><div>&gt; -=23define GICR=5FPEND=
BASER=5FPTZ (1ULL &lt;&lt; 62)</div><div>&gt; -=23define GICR=5FPENDBASER=
=5FOUTER=5FCACHEABILITY=5FMASK (7ULL &lt;&lt; 56)</div><div>&gt; -=23defi=
ne GICR=5FPENDBASER=5FADDR=5FMASK (0xffffffffULL &lt;&lt; 16)</div><div>&=
gt; -=23define GICR=5FPENDBASER=5FSHAREABILITY=5FMASK (3U &lt;&lt; 10)</d=
iv><div>&gt; -=23define GICR=5FPENDBASER=5FCACHEABILITY=5FMASK (7U &lt;&l=
t; 7)</div><div>&gt; -</div><div>&gt; =23define ICC=5FCTLR=5FEL1=5FCBPR (=
1U &lt;&lt; 0)</div><div>&gt; =23define ICC=5FCTLR=5FEL1=5FEOIMODE (1U &l=
t;&lt; 1)</div><div>&gt; =23define ICC=5FCTLR=5FEL1=5FPMHE (1U &lt;&lt; 6=
)</div><div>&gt; =40=40 -239,6 +231,78 =40=40</div><div>&gt; =23define IC=
H=5FVTR=5FEL2=5FPREBITS=5FSHI=46T 26</div><div>&gt; =23define ICH=5FVTR=5F=
EL2=5FPRIBITS=5FSHI=46T 29</div><div>&gt;</div><div>&gt; +/* ITS Register=
s */</div><div>&gt; +</div><div>&gt; +=46IELD(GITS=5FBASER, SIZE, 0, 8)</=
div><div>&gt; +=46IELD(GITS=5FBASER, PAGESIZE, 8, 2)</div><div>&gt; +=46I=
ELD(GITS=5FBASER, SHAREABILITY, 10, 2)</div><div>&gt; +=46IELD(GITS=5FBAS=
ER, PHYADDR, 12, 36)</div><div>&gt; +=46IELD(GITS=5FBASER, PHYADDRL=5F64K=
, 16, 32)</div><div>&gt; +=46IELD(GITS=5FBASER, PHYADDRH=5F64K, 48, 4)</d=
iv><div>Isn't it =46IELD(GITS=5FBASER, PHYADDRH=5F64K, 12, 4)</div><div>h=
um actually it is fixed in next patch ;-) The right value can be put</div=
><div>here directly</div><div>&gt; +=46IELD(GITS=5FBASER, ENTRYSIZE, 48, =
5)</div><div>&gt; +=46IELD(GITS=5FBASER, OUTERCACHE, 53, 3)</div><div>&gt=
; +=46IELD(GITS=5FBASER, TYPE, 56, 3)</div><div>&gt; +=46IELD(GITS=5FBASE=
R, INNERCACHE, 59, 3)</div><div>&gt; +=46IELD(GITS=5FBASER, INDIRECT, 62,=
 1)</div><div>&gt; +=46IELD(GITS=5FBASER, VALID, 63, 1)</div><div>&gt; +<=
/div><div>&gt; +=46IELD(GITS=5FCTLR, QUIESCENT, 31, 1)</div><div>&gt; +</=
div><div>&gt; +=46IELD(GITS=5FTYPER, PHYSICAL, 0, 1)</div><div>&gt; +=46I=
ELD(GITS=5FTYPER, ITT=5FENTRY=5FSIZE, 4, 4)</div><div>&gt; +=46IELD(GITS=5F=
TYPER, IDBITS, 8, 5)</div><div>&gt; +=46IELD(GITS=5FTYPER, DEVBITS, 13, 5=
)</div><div>&gt; +=46IELD(GITS=5FTYPER, SEIS, 18, 1)</div><div>&gt; +=46I=
ELD(GITS=5FTYPER, PTA, 19, 1)</div><div>&gt; +=46IELD(GITS=5FTYPER, CIDBI=
TS, 32, 4)</div><div>&gt; +=46IELD(GITS=5FTYPER, CIL, 36, 1)</div><div>&g=
t; +</div><div>&gt; +=23define GITS=5FBASER=5FPAGESIZE=5F4K 0</div><div>&=
gt; +=23define GITS=5FBASER=5FPAGESIZE=5F16K 1</div><div>&gt; +=23define =
GITS=5FBASER=5FPAGESIZE=5F64K 2</div><div>&gt; +</div><div>&gt; +=23defin=
e GITS=5FITT=5FTYPE=5FDEVICE 1ULL</div><div>&gt; +=23define GITS=5FITT=5F=
TYPE=5FCOLLECTION 4ULL</div><div>you may rename into GITS=5FBASER=5FTYPE=5F=
DEVICE and COLLECTION=3F</div><div>&gt; +</div><div>&gt; +/**</div><div>&=
gt; + * Default features advertised by this version of ITS</div><div>&gt;=
 + */</div><div>&gt; +/* Physical LPIs supported */</div><div>&gt; +=23de=
fine GITS=5FTYPE=5FPHYSICAL (1U &lt;&lt; 0)</div><div>&gt; +</div><div>&g=
t; +/*</div><div>&gt; + * 12 bytes Interrupt translation Table Entry size=
</div><div>&gt; + * ITE Lower 8 Bytes</div><div>&gt; + * Valid =3D 1 bit,=
InterruptType =3D 1 bit,</div><div>&gt; + * Size of LPI number space=5Bco=
nsidering max 24 bits=5D,</div><div>&gt; + * Size of LPI number space=5Bc=
onsidering max 24 bits=5D,</div><div>repeated</div><div>&gt; + * ITE High=
er 4 Bytes</div><div>&gt; + * ICID =3D 16 bits,</div><div>&gt; + * vPEID =
=3D 16 bits</div><br><div>for info the ABI used by the kernel can be foun=
d in linux</div><div>Documentation/virt/kvm/devices/arm-vgic-its.rst</div=
><br><div>The ITE there is 8 bytes.</div><br><div>Have you considered the=
 same=3F</div></div></blockquote><div><br><div>&gt; The implementation de=
fines ITE size of max 12 bytes (based on Table 5-3 ITE entries in GICv3 s=
pec)&nbsp; by considering max LPI number space of 24 bits (for each of In=
terrupt=5FNumber-pIntid field &amp; Interrupt=5FNumber-HypervisorID field=
) .</div><br><div>&gt; + */</div><div>&gt; +=23define ITS=5FITT=5FENTRY=5F=
SIZE 0xC</div><div>&gt; +</div><div>&gt; +/* 16 bits EventId */</div><div=
>&gt; +=23define ITS=5FIDBITS GICD=5FTYPER=5FIDBITS</div><div>&gt; +</div=
><div>&gt; +/* 16 bits DeviceId */</div><div>&gt; +=23define ITS=5FDEVBIT=
S 0x=46</div><div>&gt; +</div><div>&gt; +/* 16 bits CollectionId */</div>=
<div>&gt; +=23define ITS=5FCIDBITS 0x=46</div><div>&gt; +</div><div>&gt; =
+/*</div><div>&gt; + * 8 bytes Device Table Entry size</div><div>&gt; + *=
 Valid =3D 1 bit,ITTAddr =3D 44 bits,Size =3D 5 bits</div><div>&gt; + */<=
/div><div>&gt; +=23define GITS=5FDTE=5FSIZE (0x8ULL)</div><div>&gt; +</di=
v><div>&gt; +/*</div><div>&gt; + * 8 bytes Collection Table Entry size</d=
iv><div>&gt; + * Valid =3D 1 bit,RDBase =3D 36 bits(considering max RDBAS=
E)</div><div>&gt; + */</div><div>&gt; +=23define GITS=5FCTE=5FSIZE (0x8UL=
L)</div><div>&gt; +</div><div>&gt; /* Special interrupt IDs */</div><div>=
&gt; =23define INTID=5FSECURE 1020</div><div>&gt; =23define INTID=5FNONSE=
CURE 1021</div><div>&gt; diff --git a/hw/intc/meson.build b/hw/intc/meson=
.build</div><div>&gt; index 6e52a166e3..4dcfea6aa8 100644</div><div>&gt; =
--- a/hw/intc/meson.build</div><div>&gt; +++ b/hw/intc/meson.build</div><=
div>&gt; =40=40 -8,6 +8,7 =40=40 softmmu=5Fss.add(when: 'CON=46IG=5FARM=5F=
GIC', if=5Ftrue: files(</div><div>&gt; 'arm=5Fgicv3=5Fdist.c',</div><div>=
&gt; 'arm=5Fgicv3=5Fits=5Fcommon.c',</div><div>&gt; 'arm=5Fgicv3=5Fredist=
.c',</div><div>&gt; + 'arm=5Fgicv3=5Fits.c',</div><div>&gt; ))</div><div>=
&gt; softmmu=5Fss.add(when: 'CON=46IG=5FETRAX=46S', if=5Ftrue: files('etr=
axfs=5Fpic.c'))</div><div>&gt; softmmu=5Fss.add(when: 'CON=46IG=5FHEATHRO=
W=5FPIC', if=5Ftrue: files('heathrow=5Fpic.c'))</div><div>&gt; diff --git=
 a/include/hw/intc/arm=5Fgicv3=5Fits=5Fcommon.h b/include/hw/intc/arm=5Fg=
icv3=5Fits=5Fcommon.h</div><div>&gt; index 5a0952b404..65d1191db1 100644<=
/div><div>&gt; --- a/include/hw/intc/arm=5Fgicv3=5Fits=5Fcommon.h</div><d=
iv>&gt; +++ b/include/hw/intc/arm=5Fgicv3=5Fits=5Fcommon.h</div><div>&gt;=
 =40=40 -25,17 +25,22 =40=40</div><div>&gt; =23include =22hw/intc/arm=5Fg=
icv3=5Fcommon.h=22</div><div>&gt; =23include =22qom/object.h=22</div><div=
>&gt;</div><div>&gt; +=23define TYPE=5FARM=5FGICV3=5FITS =22arm-gicv3-its=
=22</div><div>&gt; +</div><div>&gt; =23define ITS=5FCONTROL=5FSIZE 0x1000=
0</div><div>&gt; =23define ITS=5FTRANS=5FSIZE 0x10000</div><div>&gt; =23d=
efine ITS=5FSIZE (ITS=5FCONTROL=5FSIZE + ITS=5FTRANS=5FSIZE)</div><div>&g=
t;</div><div>&gt; =23define GITS=5FCTLR 0x0</div><div>&gt; =23define GITS=
=5FIIDR 0x4</div><div>&gt; +=23define GITS=5FTYPER 0x8</div><div>&gt; =23=
define GITS=5FCBASER 0x80</div><div>&gt; =23define GITS=5FCWRITER 0x88</d=
iv><div>&gt; =23define GITS=5FCREADR 0x90</div><div>&gt; =23define GITS=5F=
BASER 0x100</div><div>&gt;</div><div>&gt; +=23define GITS=5FTRANSLATER 0x=
0040</div><div>&gt; +</div><div>&gt; struct GICv3ITSState =7B</div><div>&=
gt; SysBusDevice parent=5Fobj;</div><div>&gt;</div><div>&gt; =40=40 -52,6=
 +57,7 =40=40 struct GICv3ITSState =7B</div><div>&gt; /* Registers */</di=
v><div>&gt; uint32=5Ft ctlr;</div><div>&gt; uint32=5Ft iidr;</div><div>&g=
t; + uint64=5Ft typer;</div><div>&gt; uint64=5Ft cbaser;</div><div>&gt; u=
int64=5Ft cwriter;</div><div>&gt; uint64=5Ft creadr;</div><div>&gt; =40=40=
 -62,7 +68,8 =40=40 struct GICv3ITSState =7B</div><div>&gt;</div><div>&gt=
; typedef struct GICv3ITSState GICv3ITSState;</div><div>&gt;</div><div>&g=
t; -void gicv3=5Fits=5Finit=5Fmmio(GICv3ITSState *s, const MemoryRegionOp=
s *ops);</div><div>&gt; +void gicv3=5Fits=5Finit=5Fmmio(GICv3ITSState *s,=
 const MemoryRegionOps *ops,</div><div>&gt; + const MemoryRegionOps *tops=
);</div><div>&gt;</div><div>&gt; =23define TYPE=5FARM=5FGICV3=5FITS=5FCOM=
MON =22arm-gicv3-its-common=22</div><div>&gt; typedef struct GICv3ITSComm=
onClass GICv3ITSCommonClass;</div><div>&gt;</div><div>Thanks</div><br><di=
v>Eric</div></div><img class=3D=22mailspring-open=22 alt=3D=22Sent from M=
ailspring=22 width=3D=220=22 height=3D=220=22 style=3D=22border:0; width:=
0; height:0;=22 src=3D=22https://link.getmailspring.com/open/C12900=46B-2=
7D=46-4257-8B2=46-99572027EA=465=40getmailspring.com=3Fme=3D2a4b90d6&amp;=
recipient=3DcWVtdS1kZXZlbEBub25nbnUub3Jn=22>
--60c39c00_19bd3428_1617--


