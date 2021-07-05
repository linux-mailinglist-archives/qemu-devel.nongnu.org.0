Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF023BBE98
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 17:01:23 +0200 (CEST)
Received: from localhost ([::1]:45628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Q66-00088w-Kh
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 11:01:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0Q3j-00065s-Pr
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 10:58:56 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:33467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0Q3g-00071J-2Q
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 10:58:55 -0400
Received: by mail-ed1-x531.google.com with SMTP id eb14so2122078edb.0
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 07:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XxhRfvC8udZl3hYhocN/Z3xZfWCm0uwef16yI1Hdp6o=;
 b=V090k/XCHw/I0du2PjG10gXhbokgJwCXW9q+jP5PRumIVRieCQ9DyEfmMRDdTz8NW7
 Pcj0OXR2xZWK7FEFezkvS5FHXJIG080Tk3vqcECQZkH+mpAJKaM77YtobklZjozorbWx
 1M2xCiThwVXGPQAmJ3e6EyqPpIZZiIfud9zVaigtlPf6ATt43YSRf+cOxyNYr/vu2Jkz
 6Yk4YFelS8ew9KxkvFa46R4WsKpcdKeBnp/RjiYyb9pDPOa2OMvSuugnDzq78aqqPSKT
 hl/ngEUh+Q8y10yNxYRJmBNTPF/r2QPQrZlP7AKsTKEPwoA12Iz2Cjc/WG/g4NjbeLQf
 4fUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XxhRfvC8udZl3hYhocN/Z3xZfWCm0uwef16yI1Hdp6o=;
 b=fEf8oZ31jCVpw42nZCNeTmALWMKzhk2LptLcrbrfLKs8TB+3Uic3rFPtml0aamS+8y
 J4ToKpznuKpzeo4ei5ZZn97+STsOp2mVqEZwN+Qfs38W7QyU9zp2q/dBgTPE80sdc58w
 MpneUikJAc/C7s07mX86cYPemoatOtAamygYmerIx2wKnXRm1kzlTctB592JTVBLrc9i
 zBuwogseZTUO+0TJBrkvD8Wc/Fp/9FoP2wuPJiltbwg7Mqc98l4kjk+IlfrzKNA1TNmD
 BeEklcCllOmgjM/U4GcoutDPZQVyCsz8/f4Lss5zcX2JLvZKGQL3WuyTEyb5iUCM3wcV
 vBMw==
X-Gm-Message-State: AOAM532S65ID3mA5pDOQVC/AFlkC3d+oK9ereyRg5rVzscPtWIJYVUfm
 8O3gTm862NGUsC9bXK2QXpGqrzdw8AfiGX8tmC0OCA==
X-Google-Smtp-Source: ABdhPJxuhq5wXf6FhhKSc0PIlPrOxzSFH/NlONmSlA/2aB9j4Ey6js2ufq8KrVVcWGcOOmblxKusm8OUDGJ9IqaBHko=
X-Received: by 2002:a05:6402:848:: with SMTP id
 b8mr16711063edz.44.1625497129610; 
 Mon, 05 Jul 2021 07:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-2-shashi.mallela@linaro.org>
In-Reply-To: <20210630153156.9421-2-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jul 2021 15:58:11 +0100
Message-ID: <CAFEAcA_u=3f6sborqD9opCQv1kJHQm0+Gm1ytWx2zSzjXJTd1A@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] hw/intc: GICv3 ITS initial framework
To: Shashi Mallela <shashi.mallela@linaro.org>
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Jun 2021 at 16:32, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Added register definitions relevant to ITS,implemented overall
> ITS device framework with stubs for ITS control and translater
> regions read/write,extended ITS common to handle mmio init between
> existing kvm device and newer qemu device.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> +static void gicv3_arm_its_realize(DeviceState *dev, Error **errp)
> +{
> +    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
> +
> +    gicv3_its_init_mmio(s, &gicv3_its_control_ops, &gicv3_its_translation_ops);
> +
> +    if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {

Can you remind me why we make this check, please? When would we
have created an ITS device but not have a GICv3 with LPI support?

Maybe it would be better to either
(a) simply create the ITS and assume that the board connected it up
to a GICv3 that supports it
(b) check every CPU for whether PLPIS is set, and if one of them does
not have it set then return an error from the ITS realize

?

(Found this by looking for code where we do s->gicv3->cpu->something...)

> +        /* set the ITS default features supported */
> +        s->typer = FIELD_DP64(s->typer, GITS_TYPER, PHYSICAL,
> +                              GITS_TYPE_PHYSICAL);
> +        s->typer = FIELD_DP64(s->typer, GITS_TYPER, ITT_ENTRY_SIZE,
> +                              ITS_ITT_ENTRY_SIZE - 1);
> +        s->typer = FIELD_DP64(s->typer, GITS_TYPER, IDBITS, ITS_IDBITS);
> +        s->typer = FIELD_DP64(s->typer, GITS_TYPER, DEVBITS, ITS_DEVBITS);
> +        s->typer = FIELD_DP64(s->typer, GITS_TYPER, CIL, 1);
> +        s->typer = FIELD_DP64(s->typer, GITS_TYPER, CIDBITS, ITS_CIDBITS);
> +    }
> +}
> +
> +static void gicv3_its_reset(DeviceState *dev)
> +{
> +    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
> +    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
> +
> +    if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {

Similarly here.

> +        c->parent_reset(dev);
> +
> +        /* Quiescent bit reset to 1 */
> +        s->ctlr = FIELD_DP32(s->ctlr, GITS_CTLR, QUIESCENT, 1);
> +
> +        /*
> +         * setting GITS_BASER0.Type = 0b001 (Device)
> +         *         GITS_BASER1.Type = 0b100 (Collection Table)
> +         *         GITS_BASER<n>.Type,where n = 3 to 7 are 0b00 (Unimplemented)
> +         *         GITS_BASER<0,1>.Page_Size = 64KB
> +         * and default translation table entry size to 16 bytes
> +         */
> +        s->baser[0] = FIELD_DP64(s->baser[0], GITS_BASER, TYPE,
> +                                 GITS_ITT_TYPE_DEVICE);
> +        s->baser[0] = FIELD_DP64(s->baser[0], GITS_BASER, PAGESIZE,
> +                                 GITS_BASER_PAGESIZE_64K);
> +        s->baser[0] = FIELD_DP64(s->baser[0], GITS_BASER, ENTRYSIZE,
> +                                 GITS_DTE_SIZE - 1);
> +
> +        s->baser[1] = FIELD_DP64(s->baser[1], GITS_BASER, TYPE,
> +                                 GITS_ITT_TYPE_COLLECTION);
> +        s->baser[1] = FIELD_DP64(s->baser[1], GITS_BASER, PAGESIZE,
> +                                 GITS_BASER_PAGESIZE_64K);
> +        s->baser[1] = FIELD_DP64(s->baser[1], GITS_BASER, ENTRYSIZE,
> +                                 GITS_CTE_SIZE - 1);
> +    }
> +}

thanks
-- PMM

