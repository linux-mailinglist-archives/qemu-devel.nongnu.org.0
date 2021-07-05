Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5403D3BC147
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 17:57:02 +0200 (CEST)
Received: from localhost ([::1]:47100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Qxw-0007Oh-Uj
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 11:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0QwH-00065T-Cp
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 11:55:17 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:46678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0QwE-0000V1-86
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 11:55:17 -0400
Received: by mail-qt1-x831.google.com with SMTP id h2so4337406qtq.13
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 08:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BF6O0kjEEM8xyPli4XAlXsuAiHYVgtSuVEGuosDgT44=;
 b=z0HKBwMUfaXFcCQ26Yc69+0urV/vHylp+r2EphuRHuX0pd0GSyh3uCquslHPf3bpZg
 tKKba2lSnYV9oDOepA5zY6EypGp7lAOsb8lstAAfERs1BJ0+Aja70KdbwCP1d3iN997W
 m7CzW/xM5ABqIqZxdLM4An9FUZM3/zBI5/9bYxw0jyMkZJs6E34G9Nup12/0gZXMIQf1
 IZgiBQj2INnHytD8g2TSC9dBzo/t7DWznx1+j0kyaBosQmtTE9AigpeBeON0s1yMTn+U
 quRdCYzAUFmXB/7133dBuIi1l7sn4IDJB10Kc8gR0mduoI4LcTmhuE6TIFp8AWCUObmQ
 y1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BF6O0kjEEM8xyPli4XAlXsuAiHYVgtSuVEGuosDgT44=;
 b=Pk56MsN9qs9VuLV9HLb2V21y2mJ5kLas6rCmbgqYpE7PFdaihg8Mp2mk8e9nY68LBS
 dCKCnuUuKKyIlGiuRfkla2H9E2gPlm1x8L1Zj0Ony2k8Afqr1ogFcBkP8lRy49OlkhQ+
 /4PePTlMeDobwIXu+zwOeCi7DVTxN1dRSnqY2Bh2qTDMHhZHs9T8AR6NAzc1tlNg7kSv
 hTMgVv4CQaTp54LrN0ZFuHsNEpPRqIKEUl9w+KS3eDmIwxOi9L4GA1x9K14cHeahPSNT
 nlFQNnjQkls7yg1n07wlOsmcNy69eTrfwTl5lo8NOyS6Jt7VioJly3QKeKx4pzyDk2j/
 y7Bw==
X-Gm-Message-State: AOAM532D5Wki2netNXOLGxXYs0JXX7yOJNt12O2Z3+VmW52kOpwJDPhy
 o95O6VJa2eDL5oRpT5FeF2Ty9g==
X-Google-Smtp-Source: ABdhPJyWiG1WRx8S7JX6fsnJivhsOmt7w3i0ddmnJK5dX4UBHYqi7zyeZvq6wnZgd0Wb55WGTB2RSw==
X-Received: by 2002:ac8:1196:: with SMTP id d22mr13645515qtj.325.1625500511335; 
 Mon, 05 Jul 2021 08:55:11 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.gmail.com with ESMTPSA id b25sm5577895qkk.111.2021.07.05.08.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 08:55:10 -0700 (PDT)
Message-ID: <a0dca113df5b0470668095ed1f759fd7a6f102f7.camel@linaro.org>
Subject: Re: [PATCH v5 01/10] hw/intc: GICv3 ITS initial framework
From: shashi.mallela@linaro.org
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 05 Jul 2021 11:55:10 -0400
In-Reply-To: <CAFEAcA_u=3f6sborqD9opCQv1kJHQm0+Gm1ytWx2zSzjXJTd1A@mail.gmail.com>
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-2-shashi.mallela@linaro.org>
 <CAFEAcA_u=3f6sborqD9opCQv1kJHQm0+Gm1ytWx2zSzjXJTd1A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x831.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2021-07-05 at 15:58 +0100, Peter Maydell wrote:
> On Wed, 30 Jun 2021 at 16:32, Shashi Mallela <
> shashi.mallela@linaro.org> wrote:
> > Added register definitions relevant to ITS,implemented overall
> > ITS device framework with stubs for ITS control and translater
> > regions read/write,extended ITS common to handle mmio init between
> > existing kvm device and newer qemu device.
> > 
> > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > +static void gicv3_arm_its_realize(DeviceState *dev, Error **errp)
> > +{
> > +    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
> > +
> > +    gicv3_its_init_mmio(s, &gicv3_its_control_ops,
> > &gicv3_its_translation_ops);
> > +
> > +    if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {
> 
> Can you remind me why we make this check, please? When would we
> have created an ITS device but not have a GICv3 with LPI support?
This check applies to GIC's physical LPI support only as against GIC's
virtual LPI support. 
> 
> Maybe it would be better to either
> (a) simply create the ITS and assume that the board connected it up
> to a GICv3 that supports it
> (b) check every CPU for whether PLPIS is set, and if one of them does
> not have it set then return an error from the ITS realize
> 
> ?
> 
> (Found this by looking for code where we do s->gicv3->cpu-
> >something...)
> 
> > +        /* set the ITS default features supported */
> > +        s->typer = FIELD_DP64(s->typer, GITS_TYPER, PHYSICAL,
> > +                              GITS_TYPE_PHYSICAL);
> > +        s->typer = FIELD_DP64(s->typer, GITS_TYPER,
> > ITT_ENTRY_SIZE,
> > +                              ITS_ITT_ENTRY_SIZE - 1);
> > +        s->typer = FIELD_DP64(s->typer, GITS_TYPER, IDBITS,
> > ITS_IDBITS);
> > +        s->typer = FIELD_DP64(s->typer, GITS_TYPER, DEVBITS,
> > ITS_DEVBITS);
> > +        s->typer = FIELD_DP64(s->typer, GITS_TYPER, CIL, 1);
> > +        s->typer = FIELD_DP64(s->typer, GITS_TYPER, CIDBITS,
> > ITS_CIDBITS);
> > +    }
> > +}
> > +
> > +static void gicv3_its_reset(DeviceState *dev)
> > +{
> > +    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
> > +    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
> > +
> > +    if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {
> 
> Similarly here.
> 
> > +        c->parent_reset(dev);
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
> > +                                 GITS_ITT_TYPE_DEVICE);
> > +        s->baser[0] = FIELD_DP64(s->baser[0], GITS_BASER,
> > PAGESIZE,
> > +                                 GITS_BASER_PAGESIZE_64K);
> > +        s->baser[0] = FIELD_DP64(s->baser[0], GITS_BASER,
> > ENTRYSIZE,
> > +                                 GITS_DTE_SIZE - 1);
> > +
> > +        s->baser[1] = FIELD_DP64(s->baser[1], GITS_BASER, TYPE,
> > +                                 GITS_ITT_TYPE_COLLECTION);
> > +        s->baser[1] = FIELD_DP64(s->baser[1], GITS_BASER,
> > PAGESIZE,
> > +                                 GITS_BASER_PAGESIZE_64K);
> > +        s->baser[1] = FIELD_DP64(s->baser[1], GITS_BASER,
> > ENTRYSIZE,
> > +                                 GITS_CTE_SIZE - 1);
> > +    }
> > +}
> 
> thanks
> -- PMM


