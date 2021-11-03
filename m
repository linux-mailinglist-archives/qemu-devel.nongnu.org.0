Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2CA444514
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:58:22 +0100 (CET)
Received: from localhost ([::1]:38378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miIeb-0003Y4-7l
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1miIdD-0002OT-Vb
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:56:55 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:37700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1miIdC-0004bC-2W
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:56:55 -0400
Received: by mail-qt1-x82c.google.com with SMTP id o12so1308151qtv.4
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UxvmRoWg44HPTy/dFmIBXIcm3NkM9L8NhwEC1h8+xpc=;
 b=nWFL1CKrsYsGMOrnt4yOXLEX+cbk05+609wBab9LXGxSIOYv7UeT6l/3VDlYbiYHn+
 ggSdNz49AweNHwmjV+kRdk0epp1OWXHXlBn9gd1M6T44B/YsmJ3pJ/xQuHq7dsohDicF
 pZ39240e4H/NdpBHcIh7XqM08QdQ3U/uuJJE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UxvmRoWg44HPTy/dFmIBXIcm3NkM9L8NhwEC1h8+xpc=;
 b=l/Rrul+ohhhXAFhspniGfLuzd65UBZBGxjis/G/1DYQ9fH0a5Ru0iReIfJ9vVRySHl
 leKKhHHhQlIr9ZAQTr4nSQBEPpwPsDdvY8ac9SvAAb079X2WSCJ02hkHyN695R4qATuu
 +UNv6wlLpIJdRhDlfB6UfhxDFjXtaousEWcStrDIXJRV+w9+xInBcNdBHkOFf7Bu8WC2
 duD+3CrW8N1NXwBh3ryw/ioFPZiBgZLDmtuDq86veqfSY1Y2JLiYif5Yw1Xd7HElEZF+
 6WeWEj0HY2ffeFTC1DF2nWEcnvBKJjltTm8gwMZmnU5gFTZY5QqHW4ZHdeKvMzFG/T4y
 AOJw==
X-Gm-Message-State: AOAM532A+jf/BGneKCrSY2R7HiDdMkh+o9hSROotKQK/2yzI04zLbnyB
 ayYO1lwADXEB+DbMCJnuJVzngw==
X-Google-Smtp-Source: ABdhPJxlkzsrrGxFBgCXE/+hry1y3OLvHXepD5mCebry+jHweXvUCV/jaluV1gpZTG1hsYTD7FxNaA==
X-Received: by 2002:a05:622a:1006:: with SMTP id
 d6mr46640970qte.259.1635955013006; 
 Wed, 03 Nov 2021 08:56:53 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-e929-65d4-8978-cf6f.res6.spectrum.com.
 [2603:6081:7b01:cbda:e929:65d4:8978:cf6f])
 by smtp.gmail.com with ESMTPSA id 201sm1726976qkm.1.2021.11.03.08.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:56:49 -0700 (PDT)
Date: Wed, 3 Nov 2021 11:56:47 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v5 00/26] fdt: Make OF_BOARD a boolean option
Message-ID: <20211103155647.GD24579@bill-the-cat>
References: <20211026002344.405160-1-sjg@chromium.org>
 <CAHFG_=WdKL-WcaNJxwqMRHBgVQZy9SRz11mYDKJifXEnQyQSXg@mail.gmail.com>
 <CAPnjgZ0MGr+2tcSziB8DWXZPmv6Q=9ecs_6RK=N20n3-XJiL5w@mail.gmail.com>
 <CAHFG_=Vr6VkJy+d0MaPvVsoXYgvdB5xd2P5FuvF2w63bxSm4cw@mail.gmail.com>
 <CAPnjgZ3Gr+m+sTHDOpW+RFQ6rTtbriY4TpU3bjzqZB79f43Ycw@mail.gmail.com>
 <d3ca9672e7f97f07@bloch.sibelius.xs4all.nl>
 <CAPnjgZ0r04-_K+8JkXhzxDeW5pg3FSrnJbwA6Ghd_a_=jVKKeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="p7Jy7isCirGQ9JA8"
Content-Disposition: inline
In-Reply-To: <CAPnjgZ0r04-_K+8JkXhzxDeW5pg3FSrnJbwA6Ghd_a_=jVKKeg@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=trini@konsulko.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--p7Jy7isCirGQ9JA8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 02, 2021 at 07:20:51PM -0600, Simon Glass wrote:
> Hi Mark,
>=20
> On Wed, 27 Oct 2021 at 16:30, Mark Kettenis <mark.kettenis@xs4all.nl> wro=
te:
> >
> > > From: Simon Glass <sjg@chromium.org>
> > > Date: Wed, 27 Oct 2021 12:23:21 -0600
> > >
> > > Hi Fran=E7ois,
> > >
> > > On Wed, 27 Oct 2021 at 09:14, Fran=E7ois Ozog <francois.ozog@linaro.o=
rg> wrote:
> > > >
> > > >
> > > >
> > > > On Wed, 27 Oct 2021 at 16:08, Simon Glass <sjg@chromium.org> wrote:
> > > >>
> > > >> Hi Fran=E7ois,
> > > >>
> > > >> On Tue, 26 Oct 2021 at 00:07, Fran=E7ois Ozog <francois.ozog@linar=
o.org> wrote:
> > > >> >
> > > >> > Hi Simon
> > > >> >
> > > >> > Position unchanged on this series: adding fake dts for boards th=
at generate their device tree in the dts directory is not good. If you have=
 them in documentation the it is acceptable.
> > > >>
> > > >> I think we are going to have to disagree on this one. I actually u=
sed
> > > >> the qemu one in testing/development recently. We have to have a wa=
y to
> > > >> develop in-tree with U-Boot. It does not impinge on any of your use
> > > >> cases, so far as I know.
> > > >
> > > > I am not the only one in disagreement... You just saw Alex B=E9n=E9=
e from Qemu saying the same thing.
> > > > I understand the advanced debug/development scenario you mention.
> > > > But locating the DT files in the dts directory is mis-leading the c=
ontributors to think that they need to compile the DT for the targeted plat=
forms.
> > > > For your advanced scenario, you can still have the dts in the docum=
entation area, or whatever directory (except dts). compile it and supply to=
 U-Boot.
> > >
> > > We have this situation with rpi 1, 2 and 3 and I don't believe anyone
> > > has noticed. U-Boot handles the build automatically. If you turn off
> > > OF_BOARD, it will use the U-Boot devicetree always so you know what is
> > > going on.
> >
> > Until.  The Raspberry Pi foundation releases a new firmware that
> > configures the hardware differently such that the addresses in the
> > U-Boot devicetree are wrong and nothing works anymore.  Can't speak
> > for the rpi 1, but this has happened in the past for the rpi 2 and 3
> > as well as more recently on the rpi 4.
>=20
> So I update my SD card with a new private-binary bootloader and things
> stop working? I think I can narrow that one down :-)

Well, wait, no, this is the point.  You can just not update your board.
But that all of the users running a more recent release are now broken
is the problem.  It's already an opt-in thing to use U-Boot on Pis and
if we make it even more annoying to be recent, there'll be even less
reason to use U-Boot over over the Pi+TianoCore if you want anything
more fancy that direct-to-Linux booting.

--=20
Tom

--p7Jy7isCirGQ9JA8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmGCsTwACgkQFHw5/5Y0
tywowwwAjh/I2ESKoXGKfn8tdSOJkwkm76+IQMDKUUA9w5hGPosNr3PFkljQEEao
7u7wQ6fWpBHQvvJR0alLSQJsC/Mc33svclejrOFxB8QgBIUCELweBSkTlzpMxV3f
jULksNSnkSTGFgavE9mcohqXPfEEC0i5MlHw8COljvYYdleRIYPCVSrOJHcWFtqc
MNH5wn33ZSwrgzILUsOTdHGV54f/YvGjnTAN/FeLOB2rCp4BAGzUZCaxngKvdRIk
0j4IY5qOokXM/z/MyUBKmDynG+Ml0IUp+LGK8IPxQR8DBXwLZfFmhehdImAqW93S
m/Ug1Dh0kFER4AJN6aLXiXgIedOipLPWiBGsVpvHS5+2viMiN9aniXaJvSqG8cuE
rAYD2wdcCtIhCnrru/Dn3G/ZhRlutINX387jmCcKGr63Wl641Pf0fotK/5750Low
wQoegNquYbZlDXNK891AZVKA5tCSpD4UwCFY5YhqKp8G+D/6zBUn7WpVzMLbJsVB
VVv2wJ8A
=Gg7j
-----END PGP SIGNATURE-----

--p7Jy7isCirGQ9JA8--

