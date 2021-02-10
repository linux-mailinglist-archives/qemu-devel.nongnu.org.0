Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01215315C64
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 02:39:15 +0100 (CET)
Received: from localhost ([::1]:49902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9eTJ-00054f-HI
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 20:39:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9eS5-0004W3-Mo; Tue, 09 Feb 2021 20:37:57 -0500
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:44182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9eRz-0008G4-6Y; Tue, 09 Feb 2021 20:37:57 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id r2so388572ybk.11;
 Tue, 09 Feb 2021 17:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FETkbte72qoeeB6GI0rKJabMhZ+yPq39YGItjst3D38=;
 b=Ye2C850TvkO6PSLPHagppitKIv2qxbKbi/KVL5bduurRdAIN+sruafV1PFg0/a+yWm
 3Qtw+uw+CHIXcFFrnqUa208BAjCYZCH31LOkhwcE5yV0vCmNAKH3Dtey0k9RvvpPtopJ
 BhoavNJ4K6p44EUJyKWQB8CAZMnGo+P81Ql5ZnVhH2aLeGjmp0ShroxhDpuhcZyW3gAq
 0XbVkLO8V9JiA5HaYtz6zFM06tTb+dtwcfUJkxH9/0CG4UWVE3rMhu4Ch38pUnhZtug9
 LDuvuSILXVo6FlLPdeUgMPi+Rh4rkgvOWSBw6Q3+phTUyC/BZqbY+Q33zE0NS9ZYRD0Z
 QztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FETkbte72qoeeB6GI0rKJabMhZ+yPq39YGItjst3D38=;
 b=o24MFmBqcZdQoePwRmRgMDg5R2z8LDxMnx0I+Qa/osi7EVHdrmWBylgaHnDzeqCPeQ
 /Pm/yTQjAB7G2oj1mSJdOBNA1CMHn0W8y4AbPKgMX5XcJC+jLV8XIEvBj1BfNImQrWoZ
 xRGIHI4FzpXa0ns5fmIClvxQGWsfbzHDaLBrs7sJu8LP0ZAotK90XZKZT6LiCEoNGbA/
 nKZyM5NPZoTr5ZXlx+/QxWdXfZSXqvlLO3E1WskgbxsOeS8A9SjlklG17HZh5jrGkuGH
 AkdPI3Zn8sfFkGi38AprisCA6GAD8dIhCK/5ZN6Z13Aqm61JJdRkru1ifWQ/Hy5A4Fac
 HNOQ==
X-Gm-Message-State: AOAM533Fxq29GNyqTVaYF/3lHP0xSW17KkB/EJAh2v9x4U/ttZUteXFl
 OvV2oENE5Y9uAT6mnql1UH6Tqr/IbQKzDAMy6I8=
X-Google-Smtp-Source: ABdhPJwNyHDNLn5V2Q/7mnx1nn2ZOv3+OXzo06Ip3n02AZ19qqQzvXGCXsw8nR2QVYE02PvE6WQRYO/LEYOagpAxoHE=
X-Received: by 2002:a25:3bc5:: with SMTP id i188mr982859yba.332.1612921069899; 
 Tue, 09 Feb 2021 17:37:49 -0800 (PST)
MIME-Version: 1.0
References: <1612833761-43234-1-git-send-email-bmeng.cn@gmail.com>
 <CAFEAcA-yPsHpq+q7osCKTGGJ7LiHdMWFxuxJN9Gyey5dJvjWcw@mail.gmail.com>
 <20210210001151.GC4450@yekko.fritz.box>
In-Reply-To: <20210210001151.GC4450@yekko.fritz.box>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 10 Feb 2021 09:37:38 +0800
Message-ID: <CAEUhbmUJe2A8P5_nYvdpG0vV4of-bH9L7S8R2aDMkO2BHb-P0w@mail.gmail.com>
Subject: Re: [PATCH v2] hw/net: fsl_etsec: Reverse the RCTRL.RSF logic
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi David, Peter,

On Wed, Feb 10, 2021 at 9:16 AM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Tue, Feb 09, 2021 at 09:48:18AM +0000, Peter Maydell wrote:
> > On Tue, 9 Feb 2021 at 01:22, Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > Per MPC8548ERM [1] chapter 14.5.3.4.1:
> > >
> > > When RCTRL.RSF is 1, frames less than 64 bytes are accepted upon
> > > a DA match. But currently QEMU does the opposite.
> > >
> > > When RCTRL.RSF is 0, short frames are silently dropped, however
> > > we cannot drop such frames in QEMU as of today, due to both slirp
> > > and tap networking do not pad short frames (e.g.: an ARP packet)
> > > to the minimum frame size of 60 bytes.
> > >
> > > If eTSEC is programmed to reject short frames, ARP requests will be
> > > dropped, preventing the guest from becoming visible on the network.
> > >
> > > The same issue was reported on e1000 and vmxenet3 before, see:
> > >
> > > commit 78aeb23eded2 ("e1000: Pad short frames to minimum size (60 bytes)")
> > > commit 40a87c6c9b11 ("vmxnet3: Pad short frames to minimum size (60 bytes)")
> > >
> > > Ideally this should be fixed on the slirp/tap networking side to
> > > pad short frames to the minimum frame length, but I am not sure
> > > whether that's doable.
> > >
> > > This commit reverses the RCTRL.RSF testing logic to match the spec.
> > > The log message is updated to mention the reject short frames
> > > functionality is unimplemented.
> > >
> > > [1] https://www.nxp.com/docs/en/reference-manual/MPC8548ERM.pdf
> > >
> > > Fixes: eb1e7c3e5146 ("Add Enhanced Three-Speed Ethernet Controller (eTSEC)")
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> >
> > > -    if ((etsec->regs[RCTRL].value & RCTRL_RSF) && (size < 60)) {
> > > +    /*
> > > +     * Both slirp and tap networking do not pad short frames
> > > +     * (e.g.: an ARP packet) to the minimum frame size of 60 bytes.
> > > +     *
> > > +     * If eTSEC is programmed to reject short frames, ARP requests
> > > +     * will be dropped, preventing the guest from becoming visible
> > > +     * on the network.
> > > +     */
> > > +    if (!(etsec->regs[RCTRL].value & RCTRL_RSF) && (size < 60)) {
> > >          /* CRC is not in the packet yet, so short frame is below 60 bytes */
> > > -        RING_DEBUG("%s: Drop short frame\n", __func__);
> > > -        return -1;
> > > +        RING_DEBUG("%s: Drop short frame not implemented\n", __func__);
> > >      }
> >
> > This change is doing two things at once.
>
> Oops, I missed that.
>
> > One of them is an entirely uncontroversial bug fix: we
> > got the sense of the RCTRL_RSF test the wrong way round.
> >
> > The other is different: it is working around a bug elsewhere in QEMU.
> >
> > If there's a problem with packets that should not be short
> > frames being presented to ethernet devices as short frames,
> > please fix that bug at the source. I don't think we should
> > take any more device-model workarounds for it. We have lots
> > and lots of ethernet device models: it will be much more
> > effort to try to fix them all one by one as people encounter
> > this bug than it would be to just fix the code that's creating
> > bogus short frames.
> >
> > David, could you drop this from your queue, please ?
>
> Done.

OK, I will only do the reverse then.

Regards,
Bin

