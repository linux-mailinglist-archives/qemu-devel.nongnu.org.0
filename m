Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3F2443436
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 18:00:00 +0100 (CET)
Received: from localhost ([::1]:51416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhx8h-0002ZX-4O
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mhx6L-0000zq-Iw
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:57:33 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:37389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mhx6A-0008HS-9G
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:57:32 -0400
Received: by mail-qk1-x732.google.com with SMTP id r8so6453722qkp.4
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 09:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qQS3kT0EbvBAxJkamp6hdX2Rw+bv9ieBat8UFCDA1eA=;
 b=CGFhk4lRq3c3bTqY0HBtW8tGrIT9PQYRYkWaAtkvZ8tPpmL6zUNo9yhHbLvx9ppMTV
 MzsXrri2olcuHTcynWsKd4rqUQoQqiYhuhhkr408/w1T/T14yY5Yi09q+T6YQ1WrzZL0
 niQvbZ+lczRGsnW6FrPbog34t9EFNBU2w4O9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qQS3kT0EbvBAxJkamp6hdX2Rw+bv9ieBat8UFCDA1eA=;
 b=ifHtEi77zfjhmT41pb0xVmuRHp5oPxHUSp8/wteOryKrZ6HvZs1jVAtZJi+SYYQlfi
 REBOiQHEg74blhgfQNotLpfs3NK0dil1rWCZyLkj9Qjex/N0Zly0CTur1UpjVCKoXBbc
 SZatdm02kkq1tEh09METFZk//OkOkeFyQhgTq5syAq7kXYvA45dqwqWkdefPHZEupnJ/
 g4zCe40xTuigLJQZatO1nbVvz3nOYlacf4yQcpLHLGLs/C3glyUbhTf+/nmB8oaq/CLy
 1YbmxxdsvY7XrAr1rG0E85RrB4xyVweakjnhIAdunkE0YraoVa6D8GUmKd4/Oqqse8ey
 paWw==
X-Gm-Message-State: AOAM533MJDcXxM9Iy5dtAWviFUf1LaMY+hJ7oQNq+l4XAUd6pb6xi/fK
 txvdskFJc95U0rAxPLiIka3Rog==
X-Google-Smtp-Source: ABdhPJxcO9jkTailvuthcKHfbtjj7IYqrmZLeg/VvphhmFY2oB4WabbJjeTUeAF0QmnkUEHkMiJ2ew==
X-Received: by 2002:a05:620a:1a93:: with SMTP id
 bl19mr11820233qkb.488.1635872241297; 
 Tue, 02 Nov 2021 09:57:21 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-e929-65d4-8978-cf6f.res6.spectrum.com.
 [2603:6081:7b01:cbda:e929:65d4:8978:cf6f])
 by smtp.gmail.com with ESMTPSA id k19sm6496864qta.82.2021.11.02.09.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 09:57:20 -0700 (PDT)
Date: Tue, 2 Nov 2021 12:57:18 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v5 06/26] arm: qemu: Add a devicetree file for qemu_arm64
Message-ID: <20211102165718.GR24579@bill-the-cat>
References: <20211026002344.405160-1-sjg@chromium.org>
 <20211026002344.405160-7-sjg@chromium.org>
 <CAFEAcA-UukuQXT3ebcboiVOSn0J+88w-kzoH8jE1JVxQnoeuvQ@mail.gmail.com>
 <CAPnjgZ2C8okdUMcgKjuLgV8JdPexYY0=9NtbSOHO81dN7=2RCg@mail.gmail.com>
 <CAHFG_=XWc+Fb=m=SHC6=y4KeF533yqCNk=Ae088oAZyjOULPaw@mail.gmail.com>
 <CAPnjgZ0O56yokanMjybQKa1kBmtFHHbDfQ0sPPawrbLWtw7aDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yY6OajYROBmoEVZC"
Content-Disposition: inline
In-Reply-To: <CAPnjgZ0O56yokanMjybQKa1kBmtFHHbDfQ0sPPawrbLWtw7aDQ@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=trini@konsulko.com; helo=mail-qk1-x732.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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


--yY6OajYROBmoEVZC
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 02, 2021 at 08:59:45AM -0600, Simon Glass wrote:
> Hi Fran=E7ois,
>=20
> On Mon, 1 Nov 2021 at 11:33, Fran=E7ois Ozog <francois.ozog@linaro.org> w=
rote:
> >
> > Hi Simon
> >
> > Le lun. 1 nov. 2021 =E0 17:58, Simon Glass <sjg@chromium.org> a =E9crit=
 :
> >>
> >> Hi Peter,
> >>
> >> On Mon, 1 Nov 2021 at 04:48, Peter Maydell <peter.maydell@linaro.org> =
wrote:
> >> >
> >> > On Tue, 26 Oct 2021 at 01:33, Simon Glass <sjg@chromium.org> wrote:
> >> > >
> >> > > Add this file, generated from qemu, so there is a reference device=
tree
> >> > > in the U-Boot tree.
> >> > >
> >> > > Signed-off-by: Simon Glass <sjg@chromium.org>
> >> >
> >> > Note that the dtb you get from QEMU is only guaranteed to work if:
> >> >  1) you run it on the exact same QEMU version you generated it with
> >> >  2) you pass QEMU the exact same command line arguments you used
> >> >     when you generated it
> >>
> >> Yes, I certainly understand that. In general this is not safe, but in
> >> practice it works well enough for development and CI.
> >
> > You recognize that you hijack a product directory with development hack=
 facility. There is a test directory to keep things clear. There can be a d=
ev-dts or something similar for Dev time tools.
> > I have only seen push back on those fake dts files in the dts directory=
: I guess that unless someone strongly favors a continuation of the discuss=
ion, you may consider re-shaping the proposal to address concerns.
>=20
> As stated previously, I would like to have at least a sample DT
> in-tree for all boards. I cannot see another way to get the Kconfig

What's the point of having a sample when it's not going to always be
correct or may be actively wrong and we can tell interested developers /
users how to get the correct DTB/DTS to examine?

> options in line. If we are able to put these files somewhere else in
> the future and get them out of U-Boot, with perhaps just an overlay
> for development purposes, I'd be keen to see it. But for now, this is
> where we are, I believe.
>=20
> In this particular case, this is not just a dev hack. It is also for
> CI tests which need to use a devicetree. See for example here:
>=20
> https://patchwork.ozlabs.org/project/uboot/patch/20211101011734.1614781-1=
5-sjg@chromium.org/
> https://patchwork.ozlabs.org/project/uboot/patch/20211101011734.1614781-2=
4-sjg@chromium.org/

This example would probably be better done on vexpress_ca9x4 where we do
test in CI via QEMU but do not need to modify a device tree that is
passed on to us, we already control the source of truth DTB in this
case.

And also yes, I'm behind on reviewing things I need to review.

--=20
Tom

--yY6OajYROBmoEVZC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmGBbegACgkQFHw5/5Y0
tyxfiwv9Gec6chRk46UTVKi2cmwD2ErjMZPeMkiKwEC1p/vomcqTYFLn88eicYAN
Iuk7y6uufQisdhNV5r68IXRUCAAguN82EJM3PGe3nICO0ZDB3NJlPYWPEJtJodGy
wpUfeoekwY5Sr1Vv/UEVnIO6B7SUR0YBTi7D9TMFH+LUISbjPZBVt8FFtxdxziPW
hzmrHjAOX5MXlFS1oXM6pZuQswcmvpRhr74ZQUVjK9BV7zh8XyFkwfYku2k3VCzX
v6MKeKgYET17q9BikSaDhuyWw3SpB/B4+rwLrcC43VtZOx9jxDCoaG4PqBLb/Y1/
qeaJUyxdlxAOG6ZCoJsx+RAhjrqibJXCCbzBJWAmUdpaZHd7ofcH18Er6rtJ1MBd
4/mduDNJkTSnnWnYMGSmlk2eGDKgHC5g2RSk30wlL2bRkugZooLfabAJxSYtAcfE
joTkL7eYop/a7En21hGuLAMENmKCgfQzOsdcqMBbry7XzEWFaVk4ia0QJ2xaoUQz
OnWFfrhy
=S2mf
-----END PGP SIGNATURE-----

--yY6OajYROBmoEVZC--

