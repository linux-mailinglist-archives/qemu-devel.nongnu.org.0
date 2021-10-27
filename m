Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE9B43CDC8
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 17:38:34 +0200 (CEST)
Received: from localhost ([::1]:38636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfl0b-0000y2-7o
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 11:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfkLO-0007eX-Qp
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 10:55:59 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:45586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfkLN-0004rz-7D
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 10:55:58 -0400
Received: by mail-qk1-x72b.google.com with SMTP id bp7so2628031qkb.12
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 07:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=t87NgW7+Q5+N1cjShv5lN2cUaG/InGrtraoXM/QJWZ8=;
 b=nqNZzVwiJX4bX7QrFWmuM538zjOD3ylwkngEy+BxM9TqwO+aoBc+B5mNVJGJ2Fqm1X
 lyRok8CRnak4laOny5oKrvjPyU2zYYyJrDg57kKP2GqO6BYD/qRwbkJtBhw2YoejWPI5
 oHy1/sReWrQtLITpb0cqSLORAsSbLHfJgdYs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t87NgW7+Q5+N1cjShv5lN2cUaG/InGrtraoXM/QJWZ8=;
 b=7XcBIM4cYCnFVDrpYbfk1QDsM8Cge5Ro+3RYmO7tSSN+7qABC1TjkGHZq44MzDb5qp
 9XFOtLLFOOcw6d+4UMk8K/MKMaBnjXbU1RFeC7E+nXckLsgUDa/x65qLV6azwUD4Tt9t
 +vqwrqIVLn7tH8zwlC7dxyFoBY0xM39OR6jyDdPIsJGTEqFGs9OSTnkdKzsbtwjKZeiv
 Qo1zRn9nHw5CehJ9MK5t1Lw6kdJTXsVt69ZdJo6MzxxzGtQDGWVDIC7Z4O0gmu0OdAZg
 qSOHjLIJML0Ulf7JTCcqg6yCxYOmjvd8wh9tV29p/yqIag15zplyc1j61EMWD8Z+vnS6
 LQ/Q==
X-Gm-Message-State: AOAM5309ZAxzpvgveQwfRMNOC8NPxSA5++YLUAoZu9l9+LBZY59V5mnt
 V9KfsneGi5N+l1uzUr8O10iOrw==
X-Google-Smtp-Source: ABdhPJyuUU2Pwoo3Lin3/rJ8ON4IV8f/QpZAyLtid9ugIb8P8DdglgdJE61mTTFNgJtauo+PGWsjQg==
X-Received: by 2002:ae9:e80a:: with SMTP id a10mr25083004qkg.399.1635346556288; 
 Wed, 27 Oct 2021 07:55:56 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-0044-6cb5-81ac-bb0c.res6.spectrum.com.
 [2603:6081:7b01:cbda:44:6cb5:81ac:bb0c])
 by smtp.gmail.com with ESMTPSA id h2sm131348qkf.106.2021.10.27.07.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 07:55:55 -0700 (PDT)
Date: Wed, 27 Oct 2021 10:55:52 -0400
From: Tom Rini <trini@konsulko.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
Message-ID: <20211027145552.GA8284@bill-the-cat>
References: <CAPnjgZ3D+h1ov2yL73iz_3zmPkJrM4mGrQLhsKL9qu9Ez0-j2A@mail.gmail.com>
 <CAHFG_=ULjFFcF_BWzknPPw23CeMX=d-Cprhad085nX_r1NhE1g@mail.gmail.com>
 <CAPnjgZ3+QP3ogPA=zKWHoctkr4C2rSos_yVmJjp_MYZ-O0sKeQ@mail.gmail.com>
 <20211014145626.GC7964@bill-the-cat>
 <CAPnjgZ3=evGbgSg-aen6pkOXZ4DCxX8vcX9cn4qswJQRNNSzLQ@mail.gmail.com>
 <20211014152801.GF7964@bill-the-cat>
 <CAPnjgZ2Y-uvmhQmhxnBN7Wa+Tz=ZL0bWpnJi6xCW-P8p+C-qCw@mail.gmail.com>
 <20211027124840.GR8284@bill-the-cat>
 <CAHFG_=U01QDd05K80-OHtJBgi01Kho1jY52QTQ-GO6mDDU7spg@mail.gmail.com>
 <e210136c-65c1-72f1-485f-e54a5e8248b3@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oRWDw5wXQ3uCJU7V"
Content-Disposition: inline
In-Reply-To: <e210136c-65c1-72f1-485f-e54a5e8248b3@canonical.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=trini@konsulko.com; helo=mail-qk1-x72b.google.com
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


--oRWDw5wXQ3uCJU7V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 27, 2021 at 03:23:01PM +0200, Heinrich Schuchardt wrote:

[snip]
> One passed to U-Boot for fixups and further passed to the OS. This
> devicetree may originate from a prior boot stage, from a file loaded by
> U-Boot, or from a later bootstage, e.g systemd-boot's devicetree command.

I assume systemd-boot is implementing the same logic that extlinux.conf
has used for forever, yes?

> This devicetree will not contain any U-Boot specific information.

To repeat, it must only have official bindings, yes, regardless of what
project they come from.

--=20
Tom

--oRWDw5wXQ3uCJU7V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmF5aHcACgkQFHw5/5Y0
tyztPwwAhAXbyFdKVT7XKtjQorj9h6CU8No19oSNzMjXksFnoVhLJeedZj7PGB64
2r56ZQcKWxywmWNNts2mvvhQizyZd89deakHD+CCXYpidWhTVzVFALKgg3Iga8tV
Sg9SP2cDCQA8z+/t+6xwO8yB2y/eEvLtwzzzWj8MfRh5ADhCZcNYBsWjHqPi72fe
uMbJT7YbilwMXlAlLiMauKwcHagRvKyqfg1JNXIx/R0k7eau1ZcZ2kN68VddmcQy
k7GTVHsBthrKM0BCuEyreFef4YxEVqllj27P5sGRm2plKVc53FRxMgm4TlHikON7
A7OC4ms1ei1pSoaezRF9JudyW8jR9xj7VLLtjpMFgR1Xcr3uAGmfQ1gNlWjlgzlk
9HvYpI5F3PelGTfSGPAu7JkiduAsD5ULZB/U3vUlz46rfM07sy4YQlXLlnQUUIFq
mBBtLRgj+SwQ1fwaiUQAmo8x+SRxSYG0LrSLdd8Dhh5jTHRlqegaWhjKJrYEABo4
VNs2K00Y
=MbxJ
-----END PGP SIGNATURE-----

--oRWDw5wXQ3uCJU7V--

