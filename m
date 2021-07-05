Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BB23BC2ED
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 21:00:49 +0200 (CEST)
Received: from localhost ([::1]:55106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Tpn-00085y-Ju
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 15:00:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0ToN-0007Eh-Mm
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 14:59:19 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:37566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0ToL-0007IA-Qd
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 14:59:19 -0400
Received: by mail-ej1-x635.google.com with SMTP id i20so29948531ejw.4
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 11:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cacRlNpMicAiVr7jihNhSfqcJbPgUQl99Kfl1OiWAsI=;
 b=Rducqz2jFKrr2l5HI8PxE5urFDYodn5R0Kpk33Eh/vlw/Egs6ecpqKMaSNrDDXeejM
 olEQMUh+dkkGsQemqVKJ38PrA5VqDpvMEXSFUjcD+3OXoUDwM1eA6jgkeerjJ9+1uMvV
 XCI3wK+pCJLs3j37pFA5hGZLoivqoIW9ZeN/KfFo0zfKGxX/VrkYXOwsBtsuMoyMPbrO
 +Mvw2WUQKulNfREFsT3dNZ1gE7bNn9oytu5JJTOk/aT7qnrwWF09FiEqCIBKg7wa4Qm2
 /b7k+0k5fZ2JO9G2O1Tutm2AtOMszAOFIgpR7641bgnODlkRbm1zxfRaQPIwH1dU9OoZ
 vfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cacRlNpMicAiVr7jihNhSfqcJbPgUQl99Kfl1OiWAsI=;
 b=RvoSIUXFrWX6ja+aEsbWsxPYNH5+BzkSQ7IH5rrWxKiurYkHRSWJeY/Tdu2Noqiny5
 nO/bYHclv1c3J6iLMy4xUUqVIOms21SFvb5Ea/CSt96b394R8awUNl7vPqTPeZTyufI1
 0xQWp2WP+HLjyloEGVzabqW2c0ky8JOiQQ33U8NHINTgQ1R1YDZsA+bvpb7swlulMaxs
 pPY7UvFcgx3rg1W2Be8HswIvfkljRJv8KX36TgSk33s+lEhVD+imnbvbi2NbrS5lQCp+
 ZgNc87D1WB/Z97eaV+DcVXSB/ixS+1C/dIk1/r3hp5HAUSBtCLOc4vUsT6NXPYn8PpfX
 WS5Q==
X-Gm-Message-State: AOAM5319blpU4NBerilbLXDAzbhKqKYr5ej2GEfcmqQ4Jt1DQU8iVCE1
 IINBlWybBC6r2367qX/wMp3Lg60MA+lqpFhJX4ebew==
X-Google-Smtp-Source: ABdhPJxpmRV5jh+SCvxwb2rJKY8JJe1jf41MypXv6GRQwWKDEFLsM9/lLFmhlfE0AK3JltaY/z+Xw1tHdVpTJd390iI=
X-Received: by 2002:a17:907:9701:: with SMTP id
 jg1mr3306376ejc.56.1625511555904; 
 Mon, 05 Jul 2021 11:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-2-shashi.mallela@linaro.org>
 <CAFEAcA_u=3f6sborqD9opCQv1kJHQm0+Gm1ytWx2zSzjXJTd1A@mail.gmail.com>
 <a0dca113df5b0470668095ed1f759fd7a6f102f7.camel@linaro.org>
 <CAFEAcA_vuHRWRjg-aQ4yk4UT6h_9bPdTT4wJS5SMLyPdADZVaw@mail.gmail.com>
 <916a2c2eb368835dbd17fe0b90be541abbebde93.camel@linaro.org>
In-Reply-To: <916a2c2eb368835dbd17fe0b90be541abbebde93.camel@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jul 2021 19:58:37 +0100
Message-ID: <CAFEAcA_s+8DGZ0pJ2pj4-BT2W07UXGUEGcWjTSYk9DRdgX6rEg@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] hw/intc: GICv3 ITS initial framework
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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

On Mon, 5 Jul 2021 at 18:04, <shashi.mallela@linaro.org> wrote:
>
> On Mon, 2021-07-05 at 17:25 +0100, Peter Maydell wrote:
> > On Mon, 5 Jul 2021 at 16:55, <shashi.mallela@linaro.org> wrote:
> > > On Mon, 2021-07-05 at 15:58 +0100, Peter Maydell wrote:
> > > > On Wed, 30 Jun 2021 at 16:32, Shashi Mallela <
> > > > shashi.mallela@linaro.org> wrote:
> > > > > Added register definitions relevant to ITS,implemented overall
> > > > > ITS device framework with stubs for ITS control and translater
> > > > > regions read/write,extended ITS common to handle mmio init
> > > > > between
> > > > > existing kvm device and newer qemu device.
> > > > >
> > > > > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > > > > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > > > > +static void gicv3_arm_its_realize(DeviceState *dev, Error
> > > > > **errp)
> > > > > +{
> > > > > +    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
> > > > > +
> > > > > +    gicv3_its_init_mmio(s, &gicv3_its_control_ops,
> > > > > &gicv3_its_translation_ops);
> > > > > +
> > > > > +    if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {
> > > >
> > > > Can you remind me why we make this check, please? When would we
> > > > have created an ITS device but not have a GICv3 with LPI support?
> > > This check applies to GIC's physical LPI support only as against
> > > GIC's
> > > virtual LPI support.
> >
> > Right, but when would we have a GIC with no physical LPI support
> > but an ITS is present ?
> If we only support Direct injection of virtual interrupts (which can
> have their own vPEID and the vPE table),then the ITS present could havejust virtual LPI support

This patchset does not support a virtual-LPI-only ITS, though:
it doesn't support virtual LPIs at all.
If you use it with CPUs without physical LPI support , this code will skip
entirely setting GITS_TYPER and will make reset do nothing, and then the
rest of the ITS implementation will misbehave.

I think what we should do is:
 * in realize, check every CPU to make sure its redistributor
   supports physical LPIs, and return an error from realize if not
 * in reset, don't check anything

If we add virtual-LPI-only ITS support later, we can always update
this code appropriately.

thanks
-- PMM

