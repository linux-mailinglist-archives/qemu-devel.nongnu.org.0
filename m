Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E66EA4443C5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:42:51 +0100 (CET)
Received: from localhost ([::1]:51404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHTW-0002gv-HU
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1miHQj-0000Ux-6q
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:39:57 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:45871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1miHQg-00065w-EQ
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:39:56 -0400
Received: by mail-qt1-x82e.google.com with SMTP id g13so595458qtk.12
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZWyKyuoMJ21w78j16st+GcgBdHcBy9Z7uSrc4fbpl3Q=;
 b=QFAmKLjjaFrPb0oQ/Ivmep570eCSqVdedwifXuYV/WSQDtHn2N/2Vv9am1k1TCgJJg
 WEsEBGwaHBvyGJs/kGcEJSTxLzoPefTtUpqx2cmRQmjPcWsRZyZulVD9g0FM82RdMq3J
 luGpfleZsR8HfF++XzlUJ4bIgLKGiTc4tsaDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZWyKyuoMJ21w78j16st+GcgBdHcBy9Z7uSrc4fbpl3Q=;
 b=25z67zNdgeu337dWPMqFTVOImFLLZnj3mftBx8rcJbFacrC+ko4eU5+4wFhOc046it
 58IVpHh7D9MFZZkibGkliIpWybwM0+xNEUMGan6tYEWpINu+8/R4rHydfd5dBMlFDlZa
 gdXm51Ug1rJlqqtufDRArYHhZCTu95UHQircAZG9OyhuD+E22QVAh2i5yYfcuNKy4S95
 VCpyJOlZ4JopL7ACCWKucYkyroik62MV8FH+0fBTCDf42jywPXLMcBvDOBXm6SWTyZBC
 IZi6avZp7eIfhRoPkSK/90q2iowMNustFrZ+pdwuPR7GreeqH+Dg/vTsVLD6rzYh0SOu
 rLcw==
X-Gm-Message-State: AOAM531OVPD15NHl8a15+TR9F2A6Zch1GjX3qL5KEuXPNAPcG5i2Gz87
 IlbJlCZEaogoD/djy1qc0Rquhw==
X-Google-Smtp-Source: ABdhPJxl9T93Tml130R6go3GuQK/ApiPJoHSWixmYDYcBLJHeA1fSTJ58/pcWuDtMuD2gI7xfj2yaw==
X-Received: by 2002:ac8:5fd4:: with SMTP id k20mr2940794qta.93.1635950391370; 
 Wed, 03 Nov 2021 07:39:51 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-e929-65d4-8978-cf6f.res6.spectrum.com.
 [2603:6081:7b01:cbda:e929:65d4:8978:cf6f])
 by smtp.gmail.com with ESMTPSA id q13sm1694742qtx.80.2021.11.03.07.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 07:39:50 -0700 (PDT)
Date: Wed, 3 Nov 2021 10:39:48 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v5 06/26] arm: qemu: Add a devicetree file for qemu_arm64
Message-ID: <20211103143948.GX24579@bill-the-cat>
References: <20211026002344.405160-1-sjg@chromium.org>
 <20211026002344.405160-7-sjg@chromium.org>
 <CAFEAcA-UukuQXT3ebcboiVOSn0J+88w-kzoH8jE1JVxQnoeuvQ@mail.gmail.com>
 <CAPnjgZ2C8okdUMcgKjuLgV8JdPexYY0=9NtbSOHO81dN7=2RCg@mail.gmail.com>
 <CAHFG_=XWc+Fb=m=SHC6=y4KeF533yqCNk=Ae088oAZyjOULPaw@mail.gmail.com>
 <20211101180707.GJ24579@bill-the-cat>
 <CAPnjgZ0XeFHrXwBuTZ=eoKHCo7cMSuM_gUiTfv-Sqt8o6tPOXw@mail.gmail.com>
 <20211102172833.GS24579@bill-the-cat>
 <CAPnjgZ1zDeXMCtccy6=cQzjjAz92xJZunObm2OYKZ2eyP=Sdsw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="r5dWi0AMUB6bXaTu"
Content-Disposition: inline
In-Reply-To: <CAPnjgZ1zDeXMCtccy6=cQzjjAz92xJZunObm2OYKZ2eyP=Sdsw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=trini@konsulko.com; helo=mail-qt1-x82e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 =?iso-8859-1?Q?Fran=E7ois?= Ozog <francois.ozog@linaro.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Sean Anderson <seanga2@gmail.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Mark Kettenis <mark.kettenis@xs4all.nl>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--r5dWi0AMUB6bXaTu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 02, 2021 at 07:29:54PM -0600, Simon Glass wrote:
> Hi Tom,
>=20
> On Tue, 2 Nov 2021 at 11:28, Tom Rini <trini@konsulko.com> wrote:
> >
> > On Tue, Nov 02, 2021 at 09:00:53AM -0600, Simon Glass wrote:
> > > Hi Tom,
> > >
> > > On Mon, 1 Nov 2021 at 12:07, Tom Rini <trini@konsulko.com> wrote:
> > > >
> > > > On Mon, Nov 01, 2021 at 06:33:35PM +0100, Fran=E7ois Ozog wrote:
> > > > > Hi Simon
> > > > >
> > > > > Le lun. 1 nov. 2021 =E0 17:58, Simon Glass <sjg@chromium.org> a =
=E9crit :
> > > > >
> > > > > > Hi Peter,
> > > > > >
> > > > > > On Mon, 1 Nov 2021 at 04:48, Peter Maydell <peter.maydell@linar=
o.org>
> > > > > > wrote:
> > > > > > >
> > > > > > > On Tue, 26 Oct 2021 at 01:33, Simon Glass <sjg@chromium.org> =
wrote:
> > > > > > > >
> > > > > > > > Add this file, generated from qemu, so there is a reference=
 devicetree
> > > > > > > > in the U-Boot tree.
> > > > > > > >
> > > > > > > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > > > > >
> > > > > > > Note that the dtb you get from QEMU is only guaranteed to wor=
k if:
> > > > > > >  1) you run it on the exact same QEMU version you generated i=
t with
> > > > > > >  2) you pass QEMU the exact same command line arguments you u=
sed
> > > > > > >     when you generated it
> > > > > >
> > > > > > Yes, I certainly understand that. In general this is not safe, =
but in
> > > > > > practice it works well enough for development and CI.
> > > > >
> > > > > You recognize that you hijack a product directory with developmen=
t hack
> > > > > facility. There is a test directory to keep things clear. There c=
an be a
> > > > > dev-dts or something similar for Dev time tools.
> > > > > I have only seen push back on those fake dts files in the dts dir=
ectory: I
> > > > > guess that unless someone strongly favors a continuation of the d=
iscussion,
> > > > > you may consider re-shaping the proposal to address concerns.
> > > >
> > > > Yes.  We need to document how to make development easier.  But I'm =
still
> > > > not on board with the notion of including DTS files for platforms w=
here
> > > > the source of truth for the DTB is elsewhere.  That's going to brin=
g us
> > > > a lot more pain.
> > >
> > > Are you talking about QEMU specifically, or Raspberry Pi?
> >
> > I was using two of the more common and readily available platforms where
> > the source of truth for the DTS/DTB is not (and will not be) U-Boot.
> >
> > > How can we get this resolved? I very much want to get to just having
> > > OF_SEPARATE and OF_EMBED as the only available build-time options,
> > > with OF_BOARD (and perhaps OF_PASSAGE) as something we can enable for
> > > runtime support. I feel that separating the build-time and run-time
> > > behaviour is very important. Over time perhaps we will have some
> > > success in upstreaming bindings, but for now we have what we have.
> > > There is still a lot of pushback on U-Boot having things in the
> > > devicetree, although I do see that softening somewhat.
> >
> >
> > To reiterate, the uniform bit of feedback on this series has been that
> > everyone else disagrees with your notion that we _must_ have a dts
> > in-tree.
>=20
> [I would like everyone to take a deep breath and think about what this
> actually impacts. I argue the impact outside U-Boot is approximately
> zero. What are we actually discussing here?]

We're discussing what the point of these files even is.  And ensuring
that it doesn't lead to some sort of "feature creep" or similar where
they do become required to use.

> A few have responded that they can just add the files. I think that is

Yes, you've asked a number of people to do something, and given your
position with the community they just said OK.

> the case for everything except QEMU, right? I think even Fran=E7ois
> agrees with the documentation argument. There is no real burden in
> adding the files so we can see what is going on, add a binman node,
> SPL nodes, etc.

I know Fran=E7ois already replied, so I'm replying for myself here.  What
is the point of these files, if they are not going to ever be used,
other than as documentation?  So that people that don't have a given
platform can more easily browse the device tree for it?  That's a
documentation fix (doc/board/... should note where to go to find it).

> So I am going to stand my ground on that one. It affects:
>=20
> - highbank
> - qemu-ppce500
> - rpi_4
> - xilinx_versal_virt
> - octeontx
> - xenguest_arm64
> - juno
>=20
> So that is just 7 boards that I want to add devicetree files for. I
> think that is reasonable and not a burden on these maintainers.

It effects every board where the source of truth for the DT is not the
one we're embedding because the hardware doesn't ship with one on it.
That's all of the QEMU targets, all of the Pi targets and a growing list
of newer hardware too, due to the push for "the hardware should come
with the device tree, not the linux kernel" portion of how DT has been
intended to work since forever getting realized more often.

> Let me deal with QEMU.
>=20
> Let's imagine that we were in the state that I am proposing here,
> which we would be if I were a better devicetree maintainer for U-Boot
> and had not taken my eye off the ball, basically with my review of
> [1], where I should have pushed to get a response on the questions
> before it was applied. That might have triggered me to think about the
> implications of this at the time.
>=20
> Anyway, in the state that I am proposing, what problems would we have?
>=20
> 1. QEMU has a DT which only matches the 'standard' invocation as
> documented at [2]
>=20
> 2. QEMU may get out of date if there is a new release.
>=20
> I don't think (1) is really a problem. People will have to remove
> CONFIG_OF_BOARD from configs/qemu_arm_spl_defconfig (or the like) to
> get into this state, and we have a message now that prints out where
> the devicetree comes from ("separate" in this case):
>=20
> Core:  42 devices, 11 uclasses, devicetree: separate
>=20
> For (2), I tested QEMU 6.1.50 and the only difference from 4.2.1 (a
> year old) is:
>=20
> kaslr-seed =3D <0x2037f53d 0x42c279e8>;
>=20
> It doesn't affect anything here. It boots the lastest image fine.
>=20
> Just for interest I went back to 2.5.0 which is nearly 6 years old!
> There are a few differences like dma-coherent and gpio-keys being
> added, but again it boots fine.
>=20
> So in practice that doesn't seem to be a problem from what I can tell.
>=20
> 3. Anything else?

Yes, a TPM (or not) existing.

> For qemu_arm_spl, it *does not boot* unless the U-Boot SPL properties
> are present. There is no easy way to fix this. If we merge them into
> qemu with dumpdtb, etc. we are assuming that the node we want to
> update is present, so this is not really any better than having the
> devicetree in U-Boot. Actually I think it is worse, since who knows
> what changes might happen to the devicetree in QEMU which will stop
> U-Boot from working.
>=20
> QEMU cannot make changes that don't follow the bindings. U-Boot uses
> the bindings, so we are good.
>=20
> It just seems very clear to me that this approach is far superior to
> U-Boot to the wonky business that we have today.

We also need to be clear what the point of QEMU virtual machine support
is.  It's to enable testing of features that we also want to test on
real hardware, to the extent possible.  The follow up to that point is
when we use QEMU to emulate real hardware to again test U-Boot to the
extent possible.  Given the list of hardware on
https://qemu.readthedocs.io/en/latest/system/target-arm.html (and to be
clear, I've not validated every possible board there) I would be hopeful
that we can cover all of the features we need on real hardware by
emulating specific targets in CI.

Where the source of truth for the device tree is provided to us at run
time when we start executing (so yes, the dtb that the Pi firmware
assembles from files on the SD card or the one QEMU passes or the one
that exists on SPI flash somewhere or ...) we must use that tree.  We
must not build a full separate tree because that would never be used at
run time.

That may mean that some features are not going to be supported right
there (so yes, SPL in QEMU virtual machine on ARM) ever, or without some
additional reasoning and work because it's useful to end users (figuring
out a good way to generate a .dtbo so that the Pi firmware could still
have a flawed but possibly better than nothing verified boot flow).

> > > > It is important to make sure our "develop our project" workflow is =
sane
> > > > and relatively pain free.  But that needs to not come by making
> > > > sacrifices to the "use our project" outcome.  I would hope for exam=
ple
> > > > that the new Pi zero platform is just dtb changes, as far as the li=
nux
> > > > kernel is concerned which means that for rpi_arm64 (which uses run =
time
> > > > dtb) it also just works.  And that's what we want to see.
> > >
> > > So long as OF_BOARD is enabled then the flow should work as you expec=
t.
> >
> > Then we need to get things spun such that we can build the platforms
> > where the dtb is given to us, complete and correct, at run time, to not
> > require an in-tree dts that's not going to be used.  Documentation
> > (another area we have much improved on these past few years and for
> > which I am grateful for all of the effort behind!) is how we make the
> > developer use-case for those platforms better.
>=20
> I did not expect everyone to love this; this is how we got into the
> mess we are in. A few people thinking it would be expedient to just do
> their own thing. But I have come to this after an enormous amount of
> thought and much discussion. I think sometimes people imagine that I
> just throw things over the wall to get a reaction. That is not the
> case.

I don't think anyone thinks you're doing this just to see what everyone
else thinks.  Especially since the feedback has been consistent and
uniform disagreement.  I also agree that what we're doing today isn't
quite what I'd like to see.  But that's because when the source of truth
for the device tree is external to us, we are not consistent.  And we
didn't push hard enough earlier on to get bindings we need upstream.  Or
pushed back hard enough on ourselves to come up with a way to solve some
of the problems without the bindings we added.

> We need some way to put U-Boot properties in there, at least until
> things change upstream and within U-Boot. That envisages tooling that
> is clearly not going to be in place for the upcoming release.
>=20
> For the test, how about I create a separate qemu build (which I have
> done, actually, qemu_arm_spl) and control the QEMU flags so we know it
> will boot. It is for CI so we can keep it in sync and deal with any
> breakages if people change things in QEMU (as above, this seems to be
> a theoretical problem).
>=20
> Again, please take a deep breath and consider how much this actually
> affects TF-A, QEMU, etc. I'd argue not at all. We are talking about a
> build-time devicetree in the U-Boot tree. We are not talking about
> disabling OF_BOARD or removing that option.

The problem I still have here is that if the source of truth for the
device tree on a platform is given to us at run time we must use it.
That you've noted the QEMU tree has changed only a little bit isn't
super re-assuring.  And the Pi platforms show more cases where it's an
active problem.  And since we should be using the true device tree, not
a just for reference tree, why have the copy in tree at all?

--=20
Tom

--r5dWi0AMUB6bXaTu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmGCnzAACgkQFHw5/5Y0
tyyg+gv/XA1o3fxMq9IQ0OKvC0vXGLAvaJwntSZaQ3niQ2pbB9LXGZri1XYaVqbS
GW5gRCJlEUi5/Zubx/HdKrszIgPUDSGwkKXlTkWpZh9Zt589PAosZc/qpJuH6D8n
qe1nRAEXMDBnI+zRrvGJLGjpLjRwvwp0C1khOUbO3IJGurLv8LI88LHQMBRaYT7m
Pj2CtYFudIM8+Ek3EKUBW0ewyXpOgIo1re1paJY0RIxwQCUq1OQTLrkSqHIN5Vik
ZQwAf6bxHCiFGemMCfE7itCRqWsvrRN4WxeaFMr0N18/1rmlabcPdPWoJMZwOtvJ
AJ1afF9miXMu8VRno04V4Fq7T0cpxaVGIlAglKj3nW50Opix6n/6QgYuX3MCdBZC
kprXkQI1SgV83YDG3Avw2YpmwiZryFNs/i0Gb+U0Ry+gu424Wz9e1wpA2lwXY1uc
zmevivMpdDKOyL8dTPAHZWfVnS5mtRDOG+js4DP6+E5hzSgMNRrOgp+U0aTP8AGc
uPthza+n
=ARmr
-----END PGP SIGNATURE-----

--r5dWi0AMUB6bXaTu--

