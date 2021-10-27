Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F00843D156
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 21:00:26 +0200 (CEST)
Received: from localhost ([::1]:33230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfo9x-0002Ho-8S
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 15:00:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfnTi-0003h1-91
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:16:46 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:37608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfnTf-0006oi-Ed
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:16:45 -0400
Received: by mail-qk1-x729.google.com with SMTP id bl14so3331247qkb.4
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=u1s6nIseCc7IjV9Rhe84MVfp92hPK7rUaA+g9YrfbPU=;
 b=rPDMF373QddVzBKfn5RZHnkt8JpSYD5BKanLhLI0N1mOWulHEgh+xvZJW+oaNa15et
 IctPSPtKzZaOZWEA4W2iwE9O1Om6UHaqusWZ0D5mY1HBy2WYoGGri80l6DvP3pOMNtbh
 IRnFGgv/QQXU5BXcChNwzMqrheC/RkEEtZraY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u1s6nIseCc7IjV9Rhe84MVfp92hPK7rUaA+g9YrfbPU=;
 b=w0DN74usUbRLDdLZc1j6qU4rkAzNcVgNKxefAljApoNgqTUEVhFM0565eNq0ZYVvwa
 Vjm7Tw0+P2G3Pv5VmYHJOPA0YSdh9JIYOuLjNSe8OFNW6N3xmkiNuLqC/dw9UyejxGFx
 nG2INrRtEkjkCuhUxAZbgMxmaewMPjjzITsrDSv9A52aA94Ph9yPGGZcq6gZ4bGdwhD6
 bt+SfCtvF3lJPW3NsuLHcowEO1Gtk1HPKBP4wE481Xf4juOKxvtQeZWdgfeTc/IhzvVl
 E+B6C7j56eaKcJiWETwxX5vm1d9dwSxxPoBiviRnAss6kiNOC04cHt4+BNCgPKTRqyMA
 m3DQ==
X-Gm-Message-State: AOAM5316jvsivhlBB+xiwSN2Nfh0hmpjaK5dhupmFvb9IWLzn/0UwowX
 Tj+f6TosJ9kTwV2z+6DVhYQY7Q==
X-Google-Smtp-Source: ABdhPJw6e2rVlUX3RfMsQspI16Rsh4usGyooIpFeRBss6qwfUWLyXYwwimOc8ve5IpCrl+u17NdKjg==
X-Received: by 2002:a05:620a:2442:: with SMTP id
 h2mr27114911qkn.298.1635358602183; 
 Wed, 27 Oct 2021 11:16:42 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-0044-6cb5-81ac-bb0c.res6.spectrum.com.
 [2603:6081:7b01:cbda:44:6cb5:81ac:bb0c])
 by smtp.gmail.com with ESMTPSA id y9sm512089qko.74.2021.10.27.11.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:16:41 -0700 (PDT)
Date: Wed, 27 Oct 2021 14:16:38 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v5 00/26] fdt: Make OF_BOARD a boolean option
Message-ID: <20211027181638.GF8284@bill-the-cat>
References: <20211026002344.405160-1-sjg@chromium.org>
 <CAHFG_=WdKL-WcaNJxwqMRHBgVQZy9SRz11mYDKJifXEnQyQSXg@mail.gmail.com>
 <CAPnjgZ0MGr+2tcSziB8DWXZPmv6Q=9ecs_6RK=N20n3-XJiL5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2+IiqX0tbFQDLF7Q"
Content-Disposition: inline
In-Reply-To: <CAPnjgZ0MGr+2tcSziB8DWXZPmv6Q=9ecs_6RK=N20n3-XJiL5w@mail.gmail.com>
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
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Sean Anderson <seanga2@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Mark Kettenis <mark.kettenis@xs4all.nl>,
 =?iso-8859-1?Q?Fran=E7ois?= Ozog <francois.ozog@linaro.org>,
 Stephen Warren <swarren@nvidia.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>, Jerry Van Baren <vanbaren@cideas.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Andre Przywara <andre.przywara@arm.com>, Alexander Graf <agraf@csgraf.de>,
 Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Matthias Brugger <mbrugger@suse.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Aaron Williams <awilliams@marvell.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--2+IiqX0tbFQDLF7Q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 27, 2021 at 08:08:19AM -0600, Simon Glass wrote:

> Hi Fran=E7ois,
>=20
> On Tue, 26 Oct 2021 at 00:07, Fran=E7ois Ozog <francois.ozog@linaro.org> =
wrote:
> >
> > Hi Simon
> >
> > Position unchanged on this series: adding fake dts for boards that gene=
rate their device tree in the dts directory is not good. If you have them i=
n documentation the it is acceptable.
>=20
> I think we are going to have to disagree on this one.

I'm not convinced either that we want or should have checked in device
trees for all of the platforms where the source of truth is elsewhere.

> I actually used
> the qemu one in testing/development recently. We have to have a way to
> develop in-tree with U-Boot. It does not impinge on any of your use
> cases, so far as I know.

It's certainly true that the "edit, rebuild, re-pass the dtb" cycle has
been sub-optimal since inception.  It's not even U-Boot related.  I can
count a number of times recently working with customers and just for
Linux, having to spend a number of hours on the edit, rebuild, really
make sure it gets populated where it's supposed to go, verify that yes
really our modified dtb is the one present cycle.  It's a very generic
problem.

--=20
Tom

--2+IiqX0tbFQDLF7Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmF5l4YACgkQFHw5/5Y0
tyxptAv/SBt6PjbWqO8DWZFi947/SstNdI+owia6ZUZv8GyA2+FX7QhhNJTJx3/U
ay6lj0WY6l3/une6Dhc6/kbbXtGs+BB4gOjacJZ4cUp0hZ4ud9+qmKKlLyA+H3YU
wQvoR4PdHfVSWPVK4+iaHeODSGBLey3+14AO+QhtoEepHwzT2ss+QD3jngpKHLtP
RqsdpJNHLEuBhJyKyHT4TIrKsm6uBoMbzHADbYegoKeKHJmAVt2zNNhbfMZumyZn
nRLF5LUgmS2SKhSTpJ1yWiAj5sHFfJoWl8uimMtHgyhWfBL/Tqj3lXdGYC/ICReZ
4rZLnn3prQX4hyOfvFyhMbaKoFb2cv0Wi/QdAGHL18XpgcDvDHxGo3aW1LreXooq
dAiGodYBZG510u1AsIW9bqx9vC+jfeJKwNBtk/mhHpU0YA/WbzuTAEYZOSr+TEMw
euIDuJliJVv+cc3yBFFAN9A9PuVzCLDD8GJ03nrx+pQRxOdVaXdviwyENxmC5Uho
5FMuKcIv
=cBcG
-----END PGP SIGNATURE-----

--2+IiqX0tbFQDLF7Q--

