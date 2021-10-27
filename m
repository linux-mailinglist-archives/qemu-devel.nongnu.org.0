Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BA343D61C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 23:56:42 +0200 (CEST)
Received: from localhost ([::1]:40912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfquY-00038H-3t
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 17:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kettenis@xs4all.nl>)
 id 1mfqqk-0001Ss-47
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 17:52:46 -0400
Received: from sibelius.xs4all.nl ([83.163.83.176]:64149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kettenis@xs4all.nl>)
 id 1mfqqb-00039X-Ng
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 17:52:45 -0400
Received: from localhost (bloch.sibelius.xs4all.nl [local])
 by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id 91f6745e;
 Wed, 27 Oct 2021 23:52:28 +0200 (CEST)
Date: Wed, 27 Oct 2021 23:52:28 +0200 (CEST)
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Simon Glass <sjg@chromium.org>
In-Reply-To: <CAPnjgZ1qJ-s7CrP-azLHhKKnGzeF5zWPfaanhToiUNx1VEacMA@mail.gmail.com>
 (message from Simon Glass on Wed, 27 Oct 2021 09:24:25 -0600)
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
References: <20211013010120.96851-1-sjg@chromium.org>
 <CAEUhbmWY5gKmqbipurcDQ0DuNJyv8cLWsnyqx5h+tFqeVng8Ag@mail.gmail.com>
 <20211013013450.GJ7964@bill-the-cat>
 <CAPnjgZ3D+h1ov2yL73iz_3zmPkJrM4mGrQLhsKL9qu9Ez0-j2A@mail.gmail.com>
 <CAHFG_=ULjFFcF_BWzknPPw23CeMX=d-Cprhad085nX_r1NhE1g@mail.gmail.com>
 <CAPnjgZ3+QP3ogPA=zKWHoctkr4C2rSos_yVmJjp_MYZ-O0sKeQ@mail.gmail.com>
 <20211014145626.GC7964@bill-the-cat>
 <CAPnjgZ3=evGbgSg-aen6pkOXZ4DCxX8vcX9cn4qswJQRNNSzLQ@mail.gmail.com>
 <20211014152801.GF7964@bill-the-cat>
 <CAPnjgZ2Y-uvmhQmhxnBN7Wa+Tz=ZL0bWpnJi6xCW-P8p+C-qCw@mail.gmail.com>
 <20211027124840.GR8284@bill-the-cat>
 <CAHFG_=U01QDd05K80-OHtJBgi01Kho1jY52QTQ-GO6mDDU7spg@mail.gmail.com>
 <d3ca937f451a8cf3@bloch.sibelius.xs4all.nl>
 <CAPnjgZ1qJ-s7CrP-azLHhKKnGzeF5zWPfaanhToiUNx1VEacMA@mail.gmail.com>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Message-ID: <d3ca95ca31eb5fa8@bloch.sibelius.xs4all.nl>
Received-SPF: softfail client-ip=83.163.83.176;
 envelope-from=mark.kettenis@xs4all.nl; helo=sibelius.xs4all.nl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: liviu.dudau@foss.arm.com, narmstrong@baylibre.com, vladimir.oltean@nxp.com,
 linus.walleij@linaro.org, bin.meng@windriver.com, kever.yang@rock-chips.com,
 seanga2@gmail.com, atish.patra@wdc.com, zong.li@sifive.com,
 swarren@wwwdotorg.org, sr@denx.de, festevam@gmail.com,
 rainer.boschung@hitachi-powergrids.com, francois.ozog@linaro.org,
 swarren@nvidia.com, oleksandr_andrushchenko@epam.com, xypron.glpk@gmx.de,
 lusus@denx.de, michal.simek@xilinx.com, marek.behun@nic.cz,
 vanbaren@cideas.com, rfried.dev@gmail.com, jagan@amarulasolutions.com,
 valentin.longchamp@hitachi-powergrids.com, hs@denx.de, pbrobinson@gmail.com,
 sinan@writeme.com, fitzsim@fitzsim.org, wd@denx.de, trini@konsulko.com,
 qemu-devel@nongnu.org, andre.przywara@arm.com, tharvey@gateworks.com,
 ashok.reddy.soma@xilinx.com, rick@andestech.com, agraf@csgraf.de,
 green.wan@sifive.com, t.karthik.reddy@xilinx.com,
 anastasiia_lukianenko@epam.com, albert.u.boot@aribaud.net, monstr@monstr.eu,
 mbrugger@suse.com, ycliang@andestech.com, kristo@kernel.org,
 u-boot@lists.denx.de, david.abdurachmanov@sifive.com, priyanka.jain@nxp.com,
 ilias.apalodimas@linaro.org, christianshewitt@gmail.com, awilliams@marvell.com,
 tuomas.tynkkynen@iki.fi, heinrich.schuchardt@canonical.com,
 tianrui-wei@outlook.com, bmeng.cn@gmail.com, pali@kernel.org,
 dimitri.ledkov@canonical.com, padmarao.begari@microchip.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Simon Glass <sjg@chromium.org>
> Date: Wed, 27 Oct 2021 09:24:25 -0600
> 
> Hi Mark,
> 
> On Wed, 27 Oct 2021 at 09:11, Mark Kettenis <mark.kettenis@xs4all.nl> wrote:
> >
> > > From: François Ozog <francois.ozog@linaro.org>
> > > Date: Wed, 27 Oct 2021 15:15:01 +0200
> > >
> > > In my view U-Boot shall be able to leverage device tree format
> > > (source and binary) to store its own data.  When you say "the"
> > > DT, I always think this is "the" DT that is passed to OS and in
> > > "that" DT, there should be no U-Boot entries.
> >
> > Why not?  As long as the device tree validates, it is perfectly fine
> > to have additional nodes and properties present.  The propertiesand
> > nodes will be simply ignored by the OS.
> >
> > OpenBSD will print:
> >
> >   "binman" not configured
> >
> > for the binman node that some of the U-Boot board targets now have,
> > but it doesn't really make a difference.  If there is a proper binding
> > for that node, I could simply filter it out.  Or we have U-Boot filter
> > it out before the DT gets passed along like Tom suggests.
> 
> Just on that point, I believe the binman falls into the same bucket
> that Tom is talking about here, in that it should be a standard
> binding. Ideally I would like this to become a standard format so that
> anything in firmware can use it to find stuff. I believe it is a good
> and extensible way to describe the structure of firmware across all
> projects.

Oh, I agree that it is a reasonable thing to have a description of the
structure of the firmware in the device tree.

> Does "not configured" mean that it did not find the compatible string?
> We could add one of those, for now, perhaps.

"not configured" just means that no device driver attached to the
node.  Usually that is because we don't have a device driver for the
device corresponding to the node yet.  But in the case of the "binman"
node it doesn't really make sense for a device driver to attach.  In
such a case we tend to filter out the node such that the "not
configured" line isn't printed.  That can be done either by name or by
compatible string.  So an "official" binding would help here and it
should either use a standardized name (that shouldn't be used for
other purposes then) or it should use defined a compatible string.

Anyway, this is not really critical.  I just brought it up to
illustrate that such nodes are mostly harmless.

