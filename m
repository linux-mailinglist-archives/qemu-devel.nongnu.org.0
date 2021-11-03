Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BBD4443C6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:43:00 +0100 (CET)
Received: from localhost ([::1]:51912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHTf-00031n-8y
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1miHQq-0000qD-DS
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:40:04 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:34446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1miHQo-0006BI-FR
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:40:04 -0400
Received: by mail-qv1-xf36.google.com with SMTP id i13so3112297qvm.1
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IyNzSxMhj534SNMoS4+neuy1vH/BHzA/rbk3CEGN6Fo=;
 b=CjM7GmqbWPgr2agP7rV7UjY5VyG99ojYlALsJvfZ9MEyPoxy6JTFV5YNiMfYaouAnN
 KBlsAWMhWT9An4MVVGtsoEXBSAjg77pXVNl9+x1ZOnnzb3gsvjjLvS91TPZH7bVSeXIK
 7RLcAGU+HMLokjdpU7MSnFikQORXilsWd9EHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IyNzSxMhj534SNMoS4+neuy1vH/BHzA/rbk3CEGN6Fo=;
 b=zr3Olj1Jvze1h3kQuYS2ZanuBQpAEi0gXlVAiI4bgADunRImTueL4CaLIXs5Y914bN
 hc8irGDXouu183j5hZswZgWJH55eAR2pD+SVaSVrhuWI9ZxrP0YIIR8YkJ8LSMmFmM6G
 b9YPcNszy7gmXG5xeX2aKBeeImnbKpeC3TU0jwavhP94tcujwtHiWvKKDEDHjlMavmT0
 Qdpwb1xwIh78WOkwC0go04meNo7792TfG3+uAwoqnQPGWfj3kprOpQji40EAD6rLIcRT
 QKgFWpzsiAvc2TTwy2M2fMl9a+T2Pf/aFpmgEtEBDow3QqcKrfDDB4EablusFfSaq24z
 /u9Q==
X-Gm-Message-State: AOAM533IzWAqC1OJxe5qutRwVvrG+9yLKOUY+BJZG+YsBZg2vcHZ7Qk8
 AUtb+Grrmt/orvonrSiwaOVVWw==
X-Google-Smtp-Source: ABdhPJx5gjgOOxz+KJ+bG+e0MOpeYpN+NEoNsnpLyebsFew3+rcczv19oTS0muougVdMkUgUcrmmBA==
X-Received: by 2002:ad4:5747:: with SMTP id q7mr35985762qvx.19.1635950401425; 
 Wed, 03 Nov 2021 07:40:01 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-e929-65d4-8978-cf6f.res6.spectrum.com.
 [2603:6081:7b01:cbda:e929:65d4:8978:cf6f])
 by smtp.gmail.com with ESMTPSA id bk7sm1718201qkb.72.2021.11.03.07.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 07:40:00 -0700 (PDT)
Date: Wed, 3 Nov 2021 10:39:58 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v5 06/26] arm: qemu: Add a devicetree file for qemu_arm64
Message-ID: <20211103143958.GY24579@bill-the-cat>
References: <20211026002344.405160-1-sjg@chromium.org>
 <20211026002344.405160-7-sjg@chromium.org>
 <CAFEAcA-UukuQXT3ebcboiVOSn0J+88w-kzoH8jE1JVxQnoeuvQ@mail.gmail.com>
 <CAPnjgZ2C8okdUMcgKjuLgV8JdPexYY0=9NtbSOHO81dN7=2RCg@mail.gmail.com>
 <CAHFG_=XWc+Fb=m=SHC6=y4KeF533yqCNk=Ae088oAZyjOULPaw@mail.gmail.com>
 <CAPnjgZ0O56yokanMjybQKa1kBmtFHHbDfQ0sPPawrbLWtw7aDQ@mail.gmail.com>
 <20211102165718.GR24579@bill-the-cat>
 <CAPnjgZ1KYRY9a-WBeHVX-5r2O-KBNVU1-6wHRw1of0qHrCt4yA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bO/C3H35Ok2OdENj"
Content-Disposition: inline
In-Reply-To: <CAPnjgZ1KYRY9a-WBeHVX-5r2O-KBNVU1-6wHRw1of0qHrCt4yA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=trini@konsulko.com; helo=mail-qv1-xf36.google.com
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


--bO/C3H35Ok2OdENj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 02, 2021 at 07:32:54PM -0600, Simon Glass wrote:
> Hi Tom,
>=20
> On Tue, 2 Nov 2021 at 10:57, Tom Rini <trini@konsulko.com> wrote:
> >
> > On Tue, Nov 02, 2021 at 08:59:45AM -0600, Simon Glass wrote:
> > > Hi Fran=E7ois,
> > >
> > > On Mon, 1 Nov 2021 at 11:33, Fran=E7ois Ozog <francois.ozog@linaro.or=
g> wrote:
> > > >
> > > > Hi Simon
> > > >
> > > > Le lun. 1 nov. 2021 =E0 17:58, Simon Glass <sjg@chromium.org> a =E9=
crit :
> > > >>
> > > >> Hi Peter,
> > > >>
> > > >> On Mon, 1 Nov 2021 at 04:48, Peter Maydell <peter.maydell@linaro.o=
rg> wrote:
> > > >> >
> > > >> > On Tue, 26 Oct 2021 at 01:33, Simon Glass <sjg@chromium.org> wro=
te:
> > > >> > >
> > > >> > > Add this file, generated from qemu, so there is a reference de=
vicetree
> > > >> > > in the U-Boot tree.
> > > >> > >
> > > >> > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > >> >
> > > >> > Note that the dtb you get from QEMU is only guaranteed to work i=
f:
> > > >> >  1) you run it on the exact same QEMU version you generated it w=
ith
> > > >> >  2) you pass QEMU the exact same command line arguments you used
> > > >> >     when you generated it
> > > >>
> > > >> Yes, I certainly understand that. In general this is not safe, but=
 in
> > > >> practice it works well enough for development and CI.
> > > >
> > > > You recognize that you hijack a product directory with development =
hack facility. There is a test directory to keep things clear. There can be=
 a dev-dts or something similar for Dev time tools.
> > > > I have only seen push back on those fake dts files in the dts direc=
tory: I guess that unless someone strongly favors a continuation of the dis=
cussion, you may consider re-shaping the proposal to address concerns.
> > >
> > > As stated previously, I would like to have at least a sample DT
> > > in-tree for all boards. I cannot see another way to get the Kconfig
> >
> > What's the point of having a sample when it's not going to always be
> > correct or may be actively wrong and we can tell interested developers /
> > users how to get the correct DTB/DTS to examine?
> >
> > > options in line. If we are able to put these files somewhere else in
> > > the future and get them out of U-Boot, with perhaps just an overlay
> > > for development purposes, I'd be keen to see it. But for now, this is
> > > where we are, I believe.
> > >
> > > In this particular case, this is not just a dev hack. It is also for
> > > CI tests which need to use a devicetree. See for example here:
> > >
> > > https://patchwork.ozlabs.org/project/uboot/patch/20211101011734.16147=
81-15-sjg@chromium.org/
> > > https://patchwork.ozlabs.org/project/uboot/patch/20211101011734.16147=
81-24-sjg@chromium.org/
> >
> > This example would probably be better done on vexpress_ca9x4 where we do
> > test in CI via QEMU but do not need to modify a device tree that is
> > passed on to us, we already control the source of truth DTB in this
> > case.
>=20
> But that board:
>=20
> - uses OF_EMBED, which it should not
> - does not use SPL, which I need

Check out the other hardware then that we emulate today, and or maybe
something off of
https://qemu.readthedocs.io/en/latest/system/target-arm.html that we
could add.  My point is that by picking the QEMU targets for where to
test this feature you've gone with "I've introduced this feature so now
I need to introduce this other change I've been arguing for too" in an
artificial manner as it would only be used like that for testing.

--=20
Tom

--bO/C3H35Ok2OdENj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmGCnz4ACgkQFHw5/5Y0
tywungv7BWGQIZSvSKo/F1aSo16f2c8azQyYXDd4pUzPSPs+hSi+p58WgttFOgFz
LbKK4ZzpiVnQ5fAJvudB4XK7905NXVBAjDVtOvzhECKOW7jWEfI3Ufg2d5g61fNF
bWGZxGt7o7XzoN23/blqVwuAuyVvlYZ8dR1vBcoEBZfPhlhpdA50x6vHmZfUe2z9
5u+xOyAdQT5EGebDi99YFyttwsxXCSQnGju4JEy4RQI9ulWiCgZN22gcjKH55x2l
iw3K9w7I1Icu8K511sRtPGmrwv0SLIfkENHLFNjbwqvDxC5ixI49U33Nzn3vAeDg
YsU4nklFRKtu9IlPv+ZDrEVmMnYWP8bFEUfv80C9Nwyz4+kn3XNuZMfvQgHiyKcD
Y0SH4S1UnPyKQpFvaTYFkA4Mxe9bvu14GX9n2MhdU0QKh/06FavmxKhMGom/MQ66
PhPzRW7KcOKpjMdeWr7CluthmAt6UqMxzYehnDeSMZDE8vXjdftSumNrrC3/IX1F
9aR3vuaL
=GDkE
-----END PGP SIGNATURE-----

--bO/C3H35Ok2OdENj--

