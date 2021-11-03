Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B0E44463E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 17:47:57 +0100 (CET)
Received: from localhost ([::1]:52844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJQZ-00034m-De
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 12:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1miJOL-0001Ut-Gw
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 12:45:38 -0400
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e]:38626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1miJOH-0005qP-VR
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 12:45:37 -0400
Received: by mail-vk1-xa2e.google.com with SMTP id q203so1611089vka.5
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 09:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/KEySK+UGZSB3sH60DTnUiq1GgWZcG6stlcaKj2nnTQ=;
 b=cqcbrpoHJEgRCZbzFdsnyxwjZyQf57IcyADH+SKclZQg3L2mzFtbwEd8ynnv4lZVv4
 CqtWLeEbc2mtog9p8uvyqD8Ik+F2JTODK2IoY17aa513y1CNIGliwwE9tDYBO2VUq4vA
 YjAioZ3NXIWd2s+59dQv70MVyxk3+EkNQBpXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/KEySK+UGZSB3sH60DTnUiq1GgWZcG6stlcaKj2nnTQ=;
 b=unPwLEgHbVzKBooB8wLAyzI8/yRsktJKV2+3QE+DHlZIrpMduYtUIZlABlbJb3ItzJ
 0fumgIx4l/PfASiXxsSj3y/5i5/7dylET/cyLoGEHthn65tEx+gIHTY2nJxk/BLBNKNr
 +37j5G8CHuGjmPYUyInXx57h7fE36xYEDlEztP86oH9ciA8aEZOfaZtPogUSFNNs5gCc
 6FcUoiDtri1ThUNONzthUiHY8w4APq4hoAni0sWDH8jneVcr0V5VddAmxyba0lYS2p74
 7R/NWQRvee7n+hSXB3UbvHTd2pf4G8tQs6GpXvXyYxRuMHmlzAs5voCA9o8ruRlEapPm
 I/SA==
X-Gm-Message-State: AOAM532e57ghlA8GJhgH6akjtIm69wnoSfRvSs3NsDzP+viK3ej2ZaqV
 WxEBZrVpa/yvVVThru2b6Sn0UfY79dQK0csVxZXYEg==
X-Google-Smtp-Source: ABdhPJw7A8FOqqbYpJG9B9R5LtPUf2SG8rFvGeYHvpv8auzVUvCCF1MBg5v01TkBWPm3NI2gxBub6htJ21kJmBTquaI=
X-Received: by 2002:a05:6122:8cf:: with SMTP id
 15mr50748399vkg.16.1635957932790; 
 Wed, 03 Nov 2021 09:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211026002344.405160-1-sjg@chromium.org>
 <CAHFG_=WdKL-WcaNJxwqMRHBgVQZy9SRz11mYDKJifXEnQyQSXg@mail.gmail.com>
 <CAPnjgZ0MGr+2tcSziB8DWXZPmv6Q=9ecs_6RK=N20n3-XJiL5w@mail.gmail.com>
 <CAHFG_=Vr6VkJy+d0MaPvVsoXYgvdB5xd2P5FuvF2w63bxSm4cw@mail.gmail.com>
 <CAPnjgZ3Gr+m+sTHDOpW+RFQ6rTtbriY4TpU3bjzqZB79f43Ycw@mail.gmail.com>
 <d3ca9672e7f97f07@bloch.sibelius.xs4all.nl>
 <CAPnjgZ0r04-_K+8JkXhzxDeW5pg3FSrnJbwA6Ghd_a_=jVKKeg@mail.gmail.com>
 <20211103155647.GD24579@bill-the-cat>
In-Reply-To: <20211103155647.GD24579@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 3 Nov 2021 10:45:21 -0600
Message-ID: <CAPnjgZ38AQvH+zKdEdxJWwM9kXVw3s2usoeOveLndTZVkwbZzA@mail.gmail.com>
Subject: Re: [PATCH v5 00/26] fdt: Make OF_BOARD a boolean option
To: Tom Rini <trini@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=sjg@google.com; helo=mail-vk1-xa2e.google.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: linus.walleij@linaro.org, fitzsim@fitzsim.org, qemu-devel@nongnu.org,
 seanga2@gmail.com, u-boot@lists.denx.de,
 Mark Kettenis <mark.kettenis@xs4all.nl>, francois.ozog@linaro.org,
 swarren@nvidia.com, Oleksandr_Andrushchenko@epam.com, xypron.glpk@gmx.de,
 michal.simek@xilinx.com, vanbaren@cideas.com, swarren@wwwdotorg.org,
 andre.przywara@arm.com, agraf@csgraf.de, Anastasiia_Lukianenko@epam.com,
 albert.u.boot@aribaud.net, mbrugger@suse.com, ilias.apalodimas@linaro.org,
 awilliams@marvell.com, tuomas.tynkkynen@iki.fi, bmeng.cn@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Tom,

On Wed, 3 Nov 2021 at 09:56, Tom Rini <trini@konsulko.com> wrote:
>
> On Tue, Nov 02, 2021 at 07:20:51PM -0600, Simon Glass wrote:
> > Hi Mark,
> >
> > On Wed, 27 Oct 2021 at 16:30, Mark Kettenis <mark.kettenis@xs4all.nl> w=
rote:
> > >
> > > > From: Simon Glass <sjg@chromium.org>
> > > > Date: Wed, 27 Oct 2021 12:23:21 -0600
> > > >
> > > > Hi Fran=C3=A7ois,
> > > >
> > > > On Wed, 27 Oct 2021 at 09:14, Fran=C3=A7ois Ozog <francois.ozog@lin=
aro.org> wrote:
> > > > >
> > > > >
> > > > >
> > > > > On Wed, 27 Oct 2021 at 16:08, Simon Glass <sjg@chromium.org> wrot=
e:
> > > > >>
> > > > >> Hi Fran=C3=A7ois,
> > > > >>
> > > > >> On Tue, 26 Oct 2021 at 00:07, Fran=C3=A7ois Ozog <francois.ozog@=
linaro.org> wrote:
> > > > >> >
> > > > >> > Hi Simon
> > > > >> >
> > > > >> > Position unchanged on this series: adding fake dts for boards =
that generate their device tree in the dts directory is not good. If you ha=
ve them in documentation the it is acceptable.
> > > > >>
> > > > >> I think we are going to have to disagree on this one. I actually=
 used
> > > > >> the qemu one in testing/development recently. We have to have a =
way to
> > > > >> develop in-tree with U-Boot. It does not impinge on any of your =
use
> > > > >> cases, so far as I know.
> > > > >
> > > > > I am not the only one in disagreement... You just saw Alex B=C3=
=A9n=C3=A9e from Qemu saying the same thing.
> > > > > I understand the advanced debug/development scenario you mention.
> > > > > But locating the DT files in the dts directory is mis-leading the=
 contributors to think that they need to compile the DT for the targeted pl=
atforms.
> > > > > For your advanced scenario, you can still have the dts in the doc=
umentation area, or whatever directory (except dts). compile it and supply =
to U-Boot.
> > > >
> > > > We have this situation with rpi 1, 2 and 3 and I don't believe anyo=
ne
> > > > has noticed. U-Boot handles the build automatically. If you turn of=
f
> > > > OF_BOARD, it will use the U-Boot devicetree always so you know what=
 is
> > > > going on.
> > >
> > > Until.  The Raspberry Pi foundation releases a new firmware that
> > > configures the hardware differently such that the addresses in the
> > > U-Boot devicetree are wrong and nothing works anymore.  Can't speak
> > > for the rpi 1, but this has happened in the past for the rpi 2 and 3
> > > as well as more recently on the rpi 4.
> >
> > So I update my SD card with a new private-binary bootloader and things
> > stop working? I think I can narrow that one down :-)
>
> Well, wait, no, this is the point.  You can just not update your board.
> But that all of the users running a more recent release are now broken
> is the problem.  It's already an opt-in thing to use U-Boot on Pis and
> if we make it even more annoying to be recent, there'll be even less
> reason to use U-Boot over over the Pi+TianoCore if you want anything
> more fancy that direct-to-Linux booting.

This is all totally in the weeds at this point. What are you referring to?

I'm talking about turning off OF_BOARD in my private build of U-Boot
so that it picks up the devicetree built with U-Boot. I thought that
was what Mark was saying...?

Regards,
Simon

