Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63EC42B24E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 03:36:39 +0200 (CEST)
Received: from localhost ([::1]:44446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maTC9-0007jG-Vy
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 21:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1maTAY-0006eX-JT
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 21:34:58 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:44008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1maTAW-000622-Jn
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 21:34:58 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id v10so775936qvb.10
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 18:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=n39yBeYi4eETwOh8NyyC9Q/ZCYW/A5CZ/MYE/8mHQqQ=;
 b=VXV6WJeIihkEHMQE0DJu/ayQoxaJA7H/efXiAKhJ8Un2kDaS45inuCtJNutZnRKpav
 DseCjMMALA3kxbn7Ee+cqqWkktf/L7NKSdoE+Mh1iYy3g7ZXqqdwxY3JCmHDnid9B+qY
 QWBFlg0dmXOA6h2n/ZwdZUQ+whWI9u37CTdPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n39yBeYi4eETwOh8NyyC9Q/ZCYW/A5CZ/MYE/8mHQqQ=;
 b=B0xTTmh1KIZN31ZREGsCOQ7mrWWU4K7K6aDIrzypVY4dXExxuQ3j5gdzdzBGBVBp7G
 hOfcThYQd5YfyucVHkNdoHgqKfT0mDPCsHL8LLQLS0OSdqVBs92hLjlvb+BuhChhl8gW
 fRV50AT/1vrB+OF7dn+9OqaEuJWQwr9vJG6GEM2i068n8aMRwnX8rsMD4J3bqcvqW7I/
 BsmsWPYdhR4zz5PvaCsuc0HFI3ZkECd8u4CC4rv7NCuK0sVa5YMBETUk4au5hBSXSs3a
 ocamms/0BSq7tGkoKXtGTP974WTE4+llGx2xCTdnfO6QDVbQmURl21BupjT8JhOAwruq
 567A==
X-Gm-Message-State: AOAM533Tn3WV+JCtsISHdVc90lAr9tCuIzH0Ws7noDMSOj5kyQ9qXmMo
 dMkn4emCsgIoPHCz6VsX9po0sA==
X-Google-Smtp-Source: ABdhPJzf5ajxC8wzWZXl1gEsr2W9UYL35KtLQY/qyg6xa9U4R4yQK+IaV+9PqnKB13Vy+w4HZiFZvw==
X-Received: by 2002:ad4:4b0c:: with SMTP id r12mr33231934qvw.20.1634088895127; 
 Tue, 12 Oct 2021 18:34:55 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-e98d-c49f-f596-1fb5.res6.spectrum.com.
 [2603:6081:7b01:cbda:e98d:c49f:f596:1fb5])
 by smtp.gmail.com with ESMTPSA id d64sm5799364qke.62.2021.10.12.18.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 18:34:54 -0700 (PDT)
Date: Tue, 12 Oct 2021 21:34:50 -0400
From: Tom Rini <trini@konsulko.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
Message-ID: <20211013013450.GJ7964@bill-the-cat>
References: <20211013010120.96851-1-sjg@chromium.org>
 <CAEUhbmWY5gKmqbipurcDQ0DuNJyv8cLWsnyqx5h+tFqeVng8Ag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+OXQCtB1ffO4fety"
Content-Disposition: inline
In-Reply-To: <CAEUhbmWY5gKmqbipurcDQ0DuNJyv8cLWsnyqx5h+tFqeVng8Ag@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=trini@konsulko.com; helo=mail-qv1-xf2f.google.com
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
Cc: Liviu Dudau <liviu.dudau@foss.arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 Atish Patra <atish.patra@wdc.com>, Zong Li <zong.li@sifive.com>,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Rainer Boschung <rainer.boschung@hitachi-powergrids.com>,
 Stephen Warren <swarren@nvidia.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Niel Fourie <lusus@denx.de>,
 Michal Simek <michal.simek@xilinx.com>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
 Jerry Van Baren <vanbaren@cideas.com>, Ramon Fried <rfried.dev@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Longchamp <valentin.longchamp@hitachi-powergrids.com>,
 Heiko Schocher <hs@denx.de>, Peter Robinson <pbrobinson@gmail.com>,
 Sinan Akman <sinan@writeme.com>, Thomas Fitzsimmons <fitzsim@fitzsim.org>,
 Wolfgang Denk <wd@denx.de>, Stephen Warren <swarren@wwwdotorg.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Andre Przywara <andre.przywara@arm.com>, Tim Harvey <tharvey@gateworks.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>, Rick Chen <rick@andestech.com>,
 Alexander Graf <agraf@csgraf.de>, Green Wan <green.wan@sifive.com>,
 T Karthik Reddy <t.karthik.reddy@xilinx.com>,
 Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>, Michal Simek <monstr@monstr.eu>,
 Matthias Brugger <mbrugger@suse.com>, Leo <ycliang@andestech.com>,
 Tero Kristo <kristo@kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Aaron Williams <awilliams@marvell.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Tianrui Wei <tianrui-wei@outlook.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
 Padmarao Begari <padmarao.begari@microchip.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+OXQCtB1ffO4fety
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 13, 2021 at 09:29:14AM +0800, Bin Meng wrote:
> Hi Simon,
>=20
> On Wed, Oct 13, 2021 at 9:01 AM Simon Glass <sjg@chromium.org> wrote:
> >
> > With Ilias' efforts we have dropped OF_PRIOR_STAGE and OF_HOSTFILE so
> > there are only three ways to obtain a devicetree:
> >
> >    - OF_SEPARATE - the normal way, where the devicetree is built and
> >       appended to U-Boot
> >    - OF_EMBED - for development purposes, the devicetree is embedded in
> >       the ELF file (also used for EFI)
> >    - OF_BOARD - the board figures it out on its own
> >
> > The last one is currently set up so that no devicetree is needed at all
> > in the U-Boot tree. Most boards do provide one, but some don't. Some
> > don't even provide instructions on how to boot on the board.
> >
> > The problems with this approach are documented at [1].
> >
> > In practice, OF_BOARD is not really distinct from OF_SEPARATE. Any board
> > can obtain its devicetree at runtime, even it is has a devicetree built
> > in U-Boot. This is because U-Boot may be a second-stage bootloader and =
its
> > caller may have a better idea about the hardware available in the machi=
ne.
> > This is the case with a few QEMU boards, for example.
> >
> > So it makes no sense to have OF_BOARD as a 'choice'. It should be an
> > option, available with either OF_SEPARATE or OF_EMBED.
> >
> > This series makes this change, adding various missing devicetree files
> > (and placeholders) to make the build work.
>=20
> Adding device trees that are never used sounds like a hack to me.
>=20
> For QEMU, device tree is dynamically generated on the fly based on
> command line parameters, and the device tree you put in this series
> has various hardcoded <phandle> values which normally do not show up
> in hand-written dts files.
>=20
> I am not sure I understand the whole point of this.

I am also confused and do not like the idea of adding device trees for
platforms that are capable of and can / do have a device tree to give us
at run time.

--=20
Tom

--+OXQCtB1ffO4fety
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFmN7cACgkQFHw5/5Y0
tyzNyQwAhCAwwrL9Ewxnh9vCzy4ggAHTNK4+3kywIkKrs4h00KGNW2z3KRpqUeWv
+jBCG17OYaTWdXVdNEoTVLGlq7N/FSfNVwQRfONvpJwWtuFldJ78apiOcqEsq4NV
9cHNGoYOM9BhdAzilwmO/i/F3OdNscqTQcprbBg2Jblzolg/IOqVOUZCI1eBAlNb
4VCAb0YitjjgPnpYmj6+Dw4sbaEc5rvEF++olpIIEsrovprXbDv8M2OLvkvkpi7t
wsyGybHNXSUhqknbXNNkvzHtCep9lvyAlmBXNSA35T1uidxO/uxlRyWnvZAgsJwp
2TAx+7iIQIvdFcG3pSUH53fR0KCPxur4F8mqzqs0hx/y4wAHB++aorlq4PPqwIeR
5Sm2n7cVdGaYh+XJHphJkcBiUqe14z4zZcYkioNugJoNCrgPEqZOK0//wl+BRcdG
h+MZZE4asNtQFG+dcWrK1Baao7GymkFfgpYiVm3YTl5JaU3/YOmGOnkK8asiLEao
Ho1cq9Pt
=7osX
-----END PGP SIGNATURE-----

--+OXQCtB1ffO4fety--

