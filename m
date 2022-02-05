Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F05734AA9B9
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 16:41:51 +0100 (CET)
Received: from localhost ([::1]:38500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGNC7-0005jK-RE
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 10:41:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nGNA0-0004zl-AA
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 10:39:36 -0500
Received: from [2a00:1450:4864:20::432] (port=35626
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nGN9y-0007HO-4A
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 10:39:35 -0500
Received: by mail-wr1-x432.google.com with SMTP id m27so2933466wrb.2
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 07:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BwvSn64phJsm2K1sAVISmxc07Ar/ulzsyiceJBSRuew=;
 b=Xr0cus4tCwOAJhF0cxfLTnehLzTSxGxOQlRYAdh+TGXk8Es5PeqwkDZ0hg7lrf0IOO
 v6qPKOlyl4NWaUZUG4+gB6OCAyR0HQYLmX5RxXUTix2+YujcfDv1GH/7wwCMpVZ9M6vc
 oyZJP+nn1Oy/900N90g4TglRqhikewq8GbyoDKI8DAqb27LKG5xvDhO6y+PHCYDX1Pfv
 FcTazKGM7JbKJlpDoBpOJHddLu3TZpXb66MD71Mrd0N1hBieuazj+BJURKcjbEy2kNXS
 1DQOT7h8n9bvvDWOsXJ3JGdez/N35gHQx5C0jjIK+YJDIQfwS/1drGpm5D6MBsegnXVP
 AXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BwvSn64phJsm2K1sAVISmxc07Ar/ulzsyiceJBSRuew=;
 b=oyZAUQo9EEOWecVRoDYm1It5uhUApntbe43/aOVbvWTtxjHc54vx02ucJ5mY/vaJlz
 6ffq77eC2NQF/ex4GV1DZIbRe3rJtfoOulcAi9pqpdYvBdeTUA0SMwOZDe4SeyldTisD
 pQ87oFRyZGcL4FdO3VvQALrknb//NvrSTtAe3OB7Z25r2h7mRDgF+mlle1oLPVrjUXtB
 9odQ1TOuGwOcojOyKeV8Akr3NMSYyFHN9irCDUcOJE3yibYXugk6lM3VLXuWD0linbfI
 YYBdszJtkiemzGq5XIRa8kiVaNwWefob5A82P1JMgE0Jm7N3N0xCsMq1RieDNHkf7t62
 nQzg==
X-Gm-Message-State: AOAM532Pb/KZ0p0c5VKP30OdKKsiIGXrKZ1bGAD/x30ckwJ384W/D/ns
 Ce60IbzoO1A9EOVJN/cUYGVy1XlRLUkBSFeWQs2MCw==
X-Google-Smtp-Source: ABdhPJxT5z2FIpUMd7pu24p2srqJWa3UxwaNBazv2rFcOg9uLr2orbQNYI2h/0+ZvVCRQ8gzovVjcIcKFYVLcuHcv4M=
X-Received: by 2002:adf:e18d:: with SMTP id az13mr2973934wrb.521.1644075568726; 
 Sat, 05 Feb 2022 07:39:28 -0800 (PST)
MIME-Version: 1.0
References: <20220203000550.36711-1-f4bug@amsat.org>
 <3ba67c7d-f10b-ae22-61f4-962164ba37b4@ilande.co.uk>
 <63bd68c2-2ae7-726d-616b-893afc71df0@eik.bme.hu>
In-Reply-To: <63bd68c2-2ae7-726d-616b-893afc71df0@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 5 Feb 2022 15:39:17 +0000
Message-ID: <CAFEAcA820MLMqW4k89sgxiyzYdYajnTLfwQg3JoszuTMMSA3uA@mail.gmail.com>
Subject: Re: [PATCH v2] hw/display/tcx: Mark the VRAM dirty upon reset
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, Andreas Gustafsson <gson@gson.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 5 Feb 2022 at 14:24, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> On Sat, 5 Feb 2022, Mark Cave-Ayland wrote:
> > On 03/02/2022 00:05, Philippe Mathieu-Daud=C3=A9 via wrote:
> >
> >> When resetting we don't want to *reset* the dirty bitmap,
> >> we want to *set* it to mark the entire VRAM dirty due to
> >> the memset() call.
> >>
> >> Replace memory_region_reset_dirty() by tcx_set_dirty()
> >> which conveniently set the correct ranges dirty.
> >>
> >> Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> >> -    memory_region_reset_dirty(&s->vram_mem, 0, MAXX * MAXY * (1 + 4 +=
 4),
> >> -                              DIRTY_MEMORY_VGA);
> >> +    tcx_set_dirty(s, 0, MAXX * MAXY);
> >>       s->dac_index =3D 0;
> >>       s->dac_state =3D 0;
> >>       s->cursx =3D 0xf000; /* Put cursor off screen */
> >
> > I don't think the size calculation of MAXX * MAXY is correct when compa=
ring
> > with above? I think it's easiest just to use the same approach as
>
> Xonsidering that the memset has the same length it should be correct as
> that's what has been changed (assuming tcx_set_dirty works correctly), bu=
t
> maybe there's some trick here I don't know about.

The memset chosen size seems odd -- MAXX and MAXY are
constants, but the size of the memory block here is
s->vram_size * 9, which might be smaller than MAXX * MAXY...

> > update_palette_entries() here e.g.
> >
> >    tcx_set_dirty(s, 0, memory_region_size(&s->vram_mem));
>
> This may be an overkill. Although probably does not matter but it's still
> cleaner to only set dirty what has been changed otherwise you've just
> disabled dirty tracking. On the other hand, if this is a reset routine do
> you only want to clear the displayable part of vram or the whole vram?

I think we should clear the whole of the vram -- it ought to go
back to the same state as when the device was completed. If I'm
reading the sun4m board code correctly, the other parts of
the vram are mapped into the guest address space too.

So I would go for
    memset(s->vram, 0, memory_region_size(&s->vram_mem));
    memory_region_set_dirty(&s->vram_mem, 0, memory_region_size(&s->vram_me=
m),
                            DIRTY_MEMORY_VGA);

We can then delete the MAXX and MAXY defines, which were
previously used only in these two lines and which don't actually
have any relationship to the maximum size of the framebuffer.

The handling of the vram buffer seems weird in this device overall,
though -- the memory block is divided into three parts
 * main vram, one byte per pixel
 * vram24, four bytes per pixel
 * cplane, four bytes per pixel

As far as I can see, only if depth=3D24 (fixed at device creation
time) do we use the vram24 and cplane parts. But we create the
memory block at the same size regardless of depth and we expose
the vram24 and cplane parts to the guest as sysbus MMIO regions
that are mapped into guest memory regardless of depth...

-- PMM

