Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B72E43D046
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 20:07:12 +0200 (CEST)
Received: from localhost ([::1]:33592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfnKR-0001fE-1h
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 14:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfnHU-0008Tw-Ar
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:04:09 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:34488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfnHS-0003EY-4m
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:04:07 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id t1so2365020qvb.1
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2gdSlHONiFzgghgs/HvBPVU0WoCiZzjA9CjD0LvZ8Qk=;
 b=kqpiZgfDv+VEyBiAU2k+LjyX4Yd7DMa+wYzS2KD0PMQbbfYJYKZMrTzJKja/D7oOVE
 7dj3E/Iw9k/7XtJVGD5uaNTayxYMD/YeywhzvxUC4aO5ToMEvX0wy6F+mUO4MUF1NcuF
 cj18ljKrUjvoTt/Dtgfg6/TkCmQDxJ+kALUR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2gdSlHONiFzgghgs/HvBPVU0WoCiZzjA9CjD0LvZ8Qk=;
 b=BGjSEQFBoRKkD9X7duBo5KYSGHMxr4Y9kzOKdWuVQDyvL3JOWi86S90mQzPZVUyIlh
 BMISD2IZzWpTRvBpcir6qr8hT56j09mN3aQQZdzhThAisIDNDMSVhdzvYEegoG6SB46/
 kCmm92MTT0LyrI+92/cwpRxWa0mz1h4a0gZcYnhmOVuAfDYJ/iAbYS+/elQllTNQio+4
 hMAcU4czqXoppEMS+T7Iwwc13HGu4ObFBqM2+A/sRLWoS8Fs5W308clZj3K4IQxtuPp6
 xZJWK4sOOCaemqkwEZ1rvFZAkxAHWz4dGfuPzKDxhNFqf83f/g+MMK9TEEX3CQFdxizK
 frQQ==
X-Gm-Message-State: AOAM532Uqm4MGgspolgGdiHpwyLeC+VqHQCzEljLzpenk4j/hh2RXe78
 n5/OzxU25iNScXgzn7xCPT0uEQ==
X-Google-Smtp-Source: ABdhPJxN04H5wrRBOl6lEAhsIaueMuTHmBgUEqdsP66SXenDOmeB5fmso1sZgE9CycncZnDkKItqww==
X-Received: by 2002:ad4:5d69:: with SMTP id fn9mr15053219qvb.67.1635357845053; 
 Wed, 27 Oct 2021 11:04:05 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-0044-6cb5-81ac-bb0c.res6.spectrum.com.
 [2603:6081:7b01:cbda:44:6cb5:81ac:bb0c])
 by smtp.gmail.com with ESMTPSA id bl4sm456689qkb.44.2021.10.27.11.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:04:04 -0700 (PDT)
Date: Wed, 27 Oct 2021 14:04:00 -0400
From: Tom Rini <trini@konsulko.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
Message-ID: <20211027180400.GD8284@bill-the-cat>
References: <CAPnjgZ3+QP3ogPA=zKWHoctkr4C2rSos_yVmJjp_MYZ-O0sKeQ@mail.gmail.com>
 <20211014145626.GC7964@bill-the-cat>
 <CAPnjgZ3=evGbgSg-aen6pkOXZ4DCxX8vcX9cn4qswJQRNNSzLQ@mail.gmail.com>
 <20211014152801.GF7964@bill-the-cat>
 <CAPnjgZ2Y-uvmhQmhxnBN7Wa+Tz=ZL0bWpnJi6xCW-P8p+C-qCw@mail.gmail.com>
 <20211027124840.GR8284@bill-the-cat>
 <CAHFG_=U01QDd05K80-OHtJBgi01Kho1jY52QTQ-GO6mDDU7spg@mail.gmail.com>
 <e210136c-65c1-72f1-485f-e54a5e8248b3@canonical.com>
 <20211027145552.GA8284@bill-the-cat>
 <51292fc6-e9a9-015a-34ac-f7cbcf18f203@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dOtxUVmLoGkyu1PA"
Content-Disposition: inline
In-Reply-To: <51292fc6-e9a9-015a-34ac-f7cbcf18f203@canonical.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=trini@konsulko.com; helo=mail-qv1-xf2e.google.com
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
 =?iso-8859-1?Q?Fran=E7ois?= Ozog <francois.ozog@linaro.org>,
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
 Tianrui Wei <tianrui-wei@outlook.com>, Bin Meng <bmeng.cn@gmail.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
 Padmarao Begari <padmarao.begari@microchip.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--dOtxUVmLoGkyu1PA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 27, 2021 at 05:02:39PM +0200, Heinrich Schuchardt wrote:
> On 10/27/21 16:55, Tom Rini wrote:
> > On Wed, Oct 27, 2021 at 03:23:01PM +0200, Heinrich Schuchardt wrote:
> >=20
> > [snip]
> > > One passed to U-Boot for fixups and further passed to the OS. This
> > > devicetree may originate from a prior boot stage, from a file loaded =
by
> > > U-Boot, or from a later bootstage, e.g systemd-boot's devicetree comm=
and.
> >=20
> > I assume systemd-boot is implementing the same logic that extlinux.conf
> > has used for forever, yes?
>=20
> It is loading the file and then calls U-Boot's implementation of the EFI
> Device Tree Fixup Protocol for fixups before passing the device-tree to t=
he
> OS.

So it's using https://systemd.io/BOOT_LOADER_SPECIFICATION/ OK.

> > > This devicetree will not contain any U-Boot specific information.
> >=20
> > To repeat, it must only have official bindings, yes, regardless of what
> > project they come from.
> >=20
>=20
> Don't expect prior firmware stages to provide any U-Boot specific stuff
> whatever official or non-official U-Boot specific bindings exist.

Failure to implement official bindings may result in failure to boot,
which would be pretty silly.

--=20
Tom

--dOtxUVmLoGkyu1PA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmF5lIwACgkQFHw5/5Y0
tyyQIQv+O8QUAbOZ/sUoy42JcX5EvXwzWpwbS+WfNXSJyNSejD7eJhjtHuqSvEXw
O1QEkIwYbWHPrXd8iueK6ERLjExKpsfz0V0Wfn950QMipKDsFdzXGQWQrioErDGd
ZqAHnA9a41m5DP44vh9eO42MUi91hC2WayrBMM7pQZlb4AWkNVPc7gmqinlWBa/i
RhJoZMjfij/BaL0tGL0BYXFzFw1NyEjxVPsro6uln/pFpcaYEOvkGu1ax7iE/13e
lv8mC1G2qBwfQ/Jfj9Q3E+k1rTorLen5iwC2XpTGCi+kEollWhzevXerDlfGLblD
9Da8HS0XX1DI68iSSzNaIbInCzCKvSF+91FVhZMVzHyyGsM5BSn4POc2kTV+Q/Cf
OcwfjNILDqD94x32MVfc2vh83F7acSVYBWbaITIJvsLDsoHNhtjqubphDC24PE7Y
tA1RTF1nPz/ulEiWuKezomeTNO0EEIHEg/GeZJ0cZiY3CJ/JEpi2iUSlk1Yb96XB
nhKVYIEZ
=Y/6Y
-----END PGP SIGNATURE-----

--dOtxUVmLoGkyu1PA--

