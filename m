Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F30443490
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 18:29:53 +0100 (CET)
Received: from localhost ([::1]:37530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhxbc-00073H-DP
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 13:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mhxaS-0006Mn-OD
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:28:40 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:34729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mhxaQ-0004p4-JS
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:28:40 -0400
Received: by mail-qk1-x729.google.com with SMTP id bq14so8889553qkb.1
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 10:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WiUjNsKDNIjLUmcFwAoh+THfgb15KURgF5S9D/92Z9c=;
 b=d9QmkPGKW3q2nhjO7TF0qCf20QZuyuhLFlsXFl3M/gGTMquXsX6rSAE2bgJPmiBuw9
 8tTKe6XQzkIuBPvViCa5tuFpeMayjThSh+UCrDrpCBzwgBD0jOrGQzWTJoouovhNtKTJ
 K/Dd5WlQmitJnZJn/boBM542O7dlFNYhXlP1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WiUjNsKDNIjLUmcFwAoh+THfgb15KURgF5S9D/92Z9c=;
 b=Sc6Mqxj/6sT3ahOwxiJkwtYGbviYbnUGRBMKGIBKkbfev9w9FWC/oxqTKk2Ey0aYRe
 lj1+A4/i4DHuxvZn/TJVUWFhGEHHcvjM2FEwQ2Iug5jF7qTu5G6yny4NXRryNtY+KU1Z
 bf6UUd4w8CunnE6btAPk6oDyVV8HhSxSu61uVNXXQl+gbYwfhziLMVYX2TUO91g5UL9Z
 93lXqi2ve8I/TFOsqC2W10uYaCjy63s8w+vvVWpBlXKresIagz/rqkUmOSBScBsiwcN8
 FpEI5b10/FiNqUZn7xjS2MjHNsCyHTTTGZRwPW+4dVUW6AhYjl0TmbgMYPmaMx3gcIN3
 3m4w==
X-Gm-Message-State: AOAM530aLEoCYX5v94sd8zz3bTUpMBaq7FRj07iQ/xaIajvm2lY+fDQi
 dLd04/UtnT063D83O3mAWdsnpw==
X-Google-Smtp-Source: ABdhPJwf1Ap4ax4mJfQ3PgUdfvD4lpO5bVh00IFZ1HVWs9l9Ty3OvRjRJNvtFJM+R0n99F4SDGaOLg==
X-Received: by 2002:a37:a6d8:: with SMTP id p207mr1983615qke.268.1635874117554; 
 Tue, 02 Nov 2021 10:28:37 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-e929-65d4-8978-cf6f.res6.spectrum.com.
 [2603:6081:7b01:cbda:e929:65d4:8978:cf6f])
 by smtp.gmail.com with ESMTPSA id s10sm11899135qkp.132.2021.11.02.10.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 10:28:35 -0700 (PDT)
Date: Tue, 2 Nov 2021 13:28:33 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v5 06/26] arm: qemu: Add a devicetree file for qemu_arm64
Message-ID: <20211102172833.GS24579@bill-the-cat>
References: <20211026002344.405160-1-sjg@chromium.org>
 <20211026002344.405160-7-sjg@chromium.org>
 <CAFEAcA-UukuQXT3ebcboiVOSn0J+88w-kzoH8jE1JVxQnoeuvQ@mail.gmail.com>
 <CAPnjgZ2C8okdUMcgKjuLgV8JdPexYY0=9NtbSOHO81dN7=2RCg@mail.gmail.com>
 <CAHFG_=XWc+Fb=m=SHC6=y4KeF533yqCNk=Ae088oAZyjOULPaw@mail.gmail.com>
 <20211101180707.GJ24579@bill-the-cat>
 <CAPnjgZ0XeFHrXwBuTZ=eoKHCo7cMSuM_gUiTfv-Sqt8o6tPOXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FvI60RJo/OoThODE"
Content-Disposition: inline
In-Reply-To: <CAPnjgZ0XeFHrXwBuTZ=eoKHCo7cMSuM_gUiTfv-Sqt8o6tPOXw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=trini@konsulko.com; helo=mail-qk1-x729.google.com
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


--FvI60RJo/OoThODE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 02, 2021 at 09:00:53AM -0600, Simon Glass wrote:
> Hi Tom,
>=20
> On Mon, 1 Nov 2021 at 12:07, Tom Rini <trini@konsulko.com> wrote:
> >
> > On Mon, Nov 01, 2021 at 06:33:35PM +0100, Fran=E7ois Ozog wrote:
> > > Hi Simon
> > >
> > > Le lun. 1 nov. 2021 =E0 17:58, Simon Glass <sjg@chromium.org> a =E9cr=
it :
> > >
> > > > Hi Peter,
> > > >
> > > > On Mon, 1 Nov 2021 at 04:48, Peter Maydell <peter.maydell@linaro.or=
g>
> > > > wrote:
> > > > >
> > > > > On Tue, 26 Oct 2021 at 01:33, Simon Glass <sjg@chromium.org> wrot=
e:
> > > > > >
> > > > > > Add this file, generated from qemu, so there is a reference dev=
icetree
> > > > > > in the U-Boot tree.
> > > > > >
> > > > > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > > >
> > > > > Note that the dtb you get from QEMU is only guaranteed to work if:
> > > > >  1) you run it on the exact same QEMU version you generated it wi=
th
> > > > >  2) you pass QEMU the exact same command line arguments you used
> > > > >     when you generated it
> > > >
> > > > Yes, I certainly understand that. In general this is not safe, but =
in
> > > > practice it works well enough for development and CI.
> > >
> > > You recognize that you hijack a product directory with development ha=
ck
> > > facility. There is a test directory to keep things clear. There can b=
e a
> > > dev-dts or something similar for Dev time tools.
> > > I have only seen push back on those fake dts files in the dts directo=
ry: I
> > > guess that unless someone strongly favors a continuation of the discu=
ssion,
> > > you may consider re-shaping the proposal to address concerns.
> >
> > Yes.  We need to document how to make development easier.  But I'm still
> > not on board with the notion of including DTS files for platforms where
> > the source of truth for the DTB is elsewhere.  That's going to bring us
> > a lot more pain.
>=20
> Are you talking about QEMU specifically, or Raspberry Pi?

I was using two of the more common and readily available platforms where
the source of truth for the DTS/DTB is not (and will not be) U-Boot.

> How can we get this resolved? I very much want to get to just having
> OF_SEPARATE and OF_EMBED as the only available build-time options,
> with OF_BOARD (and perhaps OF_PASSAGE) as something we can enable for
> runtime support. I feel that separating the build-time and run-time
> behaviour is very important. Over time perhaps we will have some
> success in upstreaming bindings, but for now we have what we have.
> There is still a lot of pushback on U-Boot having things in the
> devicetree, although I do see that softening somewhat.

To reiterate, the uniform bit of feedback on this series has been that
everyone else disagrees with your notion that we _must_ have a dts
in-tree.

> > It is important to make sure our "develop our project" workflow is sane
> > and relatively pain free.  But that needs to not come by making
> > sacrifices to the "use our project" outcome.  I would hope for example
> > that the new Pi zero platform is just dtb changes, as far as the linux
> > kernel is concerned which means that for rpi_arm64 (which uses run time
> > dtb) it also just works.  And that's what we want to see.
>=20
> So long as OF_BOARD is enabled then the flow should work as you expect.

Then we need to get things spun such that we can build the platforms
where the dtb is given to us, complete and correct, at run time, to not
require an in-tree dts that's not going to be used.  Documentation
(another area we have much improved on these past few years and for
which I am grateful for all of the effort behind!) is how we make the
developer use-case for those platforms better.

--=20
Tom

--FvI60RJo/OoThODE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmGBdT4ACgkQFHw5/5Y0
tyxekAv/X6Sq0XQCop5h+BKaapq19hLwwZYoPMpf590hN3CxNghHpF0nTb6dESx2
ufqvlnLjhW8pNLr9GnlLcwjnyZoUQSGiKON1Dm8MbwdDj21otlrpZFCDl6LdW6SL
MlA7043au7keU52PXnVBaEOqlEHj0GgQSRprpaD+nhVcs411USqW1Q58K6sxZ6X9
qS+HZhYK7ZGgD08f9JmvOvsFgsT3M+MG49LZlJYJ0rhdHaToUcw1x1owWsOlX4y+
Ah9r2Sg6JkBIGhzH9YP9yj3xmLXQ4AKzApR1WCHOAB37TIQdKfLMMEwaxy8cq8uV
zybUbSVjdik2X51f6HK+hZyoB7CxPLIWa5o/LDiGHHywMDj5CxaTAvaN5fzScs+/
OLyW0Ik4zAni5UaVh1TlUGwecWO4wN10lGQhyaZG9Ju/WgPrdPMaAOiGG3IGv0sm
HUGwcSUYPHoVGxYS6skWj9VKwCf8GU6bVIZeVqfGcqBS1GIXyQU48ooTah4iLqlQ
mFu67ECA
=sIeI
-----END PGP SIGNATURE-----

--FvI60RJo/OoThODE--

