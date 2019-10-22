Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A7FDF97B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 02:33:44 +0200 (CEST)
Received: from localhost ([::1]:49024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMi7L-0006sF-CR
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 20:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33503)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <hanetzer@startmail.com>) id 1iMi5z-0005ty-9X
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 20:32:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <hanetzer@startmail.com>) id 1iMi5y-00030c-3T
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 20:32:19 -0400
Received: from mx-out1.startmail.com ([145.131.90.139]:46424)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <hanetzer@startmail.com>)
 id 1iMi5x-00030O-FF; Mon, 21 Oct 2019 20:32:17 -0400
Date: Mon, 21 Oct 2019 19:32:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=startmail.com;
 s=2017-11; t=1571704334;
 bh=UkJrT356XBwU+N3RfpXtRwOe+8l68KERxFlYJELupk4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hu1k3VACq9hoMGWa1vgLLnA+hgsdHh4uPfI49/6XbQYVj6Wiwb+1a/XzfUAewDNYT
 zns7AWTAOwIOKtvLYkfdLhTZkxYey6klCePlcW4iwGOANLiqMaVkZ/fmY6Vkh2h27d
 lucvDa5vzjB5evcB6Rg8eYQ/QIImbDE0mFv6EY7pYBw07+0eWC5WLLKMax0IOtCvL6
 Bpdp302riAf1dKFFDSWLNXWvkUwR0k0NKK0GR2Arujujqo3GtcYhylWaxQNaEty5Ug
 yQZOF7F3Q5MKMfrs3kTYcaOQm5R8q8SnqiMDRngUJFakuHgR0lKZYKzip2yiFa9Q40
 uJWxKoSbed71A==
From: "Marty E. Plummer" <hanetzer@startmail.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: qemu/powernv: coreboot support?
Message-ID: <20191022003209.6ssq2ojiv57ixeyd@proprietary-killer>
References: <20191018172622.kz4smemh5cwesfit@proprietary-killer>
 <21ba3404-dcd3-fe06-7725-d58e249f9fd2@kaod.org>
 <20191019153108.gkupn3tnihspq7th@proprietary-killer>
 <1cbd1882-15c8-5471-cd65-1c84c2920ba8@kaod.org>
 <20191019160933.fizoc6tpu5jday4o@proprietary-killer>
 <20191020062842.GI1960@umbus.fritz.box>
 <0a7cbd9b-2c46-259d-4e0d-9084ee2875a3@kaod.org>
 <20191021053439.GA6439@umbus.fritz.box>
 <f196a1a6-fcbf-f409-e7e7-95b42135c0be@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <f196a1a6-fcbf-f409-e7e7-95b42135c0be@kaod.org>
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 145.131.90.139
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
Cc: Joel Stanley <joel@jms.id.au>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 21, 2019 at 02:46:59PM +0200, C=E9dric Le Goater wrote:
> On 21/10/2019 07:34, David Gibson wrote:
> > On Sun, Oct 20, 2019 at 08:51:47AM +0200, C=E9dric Le Goater wrote:
> >> On 20/10/2019 08:28, David Gibson wrote:
> >>>
> >>> Ok.  Note that the qemu emulated machine doesn't model the hardware
> >>> right down to the level of hostboot.  That's wy we're just loading
> >>> skiboot and jumping straight into it usually.  I guess clg's stuff =
to
> >>> load pnor images gets us a little closer to the hardware behaviour,
> >>> but I think it's still only a rough approximation.
> >>
On that note, is qemu-ppc64 currently capable of running LE firmware? My
coreboot port has currently reached a hitch in that part of the firmware
headers mapping stuff out is saved in LE mode while the cpu (real or emu)
is running in BE mode (FMAP headers are saved LE but CBFS headers are
saved BE)
> >> It's really tied to the OpenPOWER firmwares using the HIOMAP protoco=
l
> >> to discuss with the BMC and load the flash. We could loosen how QEMU=
=20
> >> interprets the MTD device and use a property to inform QEMU that thi=
s
> >> is an OpenPOWER  PNOR file and that skiboot and can be loaded from i=
t.
> >> Something to discuss.
> >=20
> > Right.  I'm guessing one significant issue here is that to fully mode=
l
> > the BMC, with *its* firmware and comms channels with the main host
> > would be quite a lot of work, hence cheating a bit to bypass that.
>=20
> In fact, we are not cheating that much. We use the IPMI BT interface of=
=20
> QEMU to handle the HIOMAP communication with the BMC and this model is=20
> quite precise.=20
>=20
> The mapping of the PNOR is simply mapped on the LPC FW address space.=20
> The underlying access are simplified because we don't have a LPC model
> but we could generate all the SPI transaction using the Aspeed models.=20
> I had experiments in that sense for P8.=20
>=20
Honestly getting the coreboot.rom into the lpc fw addr space in the same
way you do pnor images would be a useful sim, as that's more or less how
its going to be done on existing hardware.
> I will sense the patches I have on the topic.
>=20
> C.=20

