Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9945733F672
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 18:19:24 +0100 (CET)
Received: from localhost ([::1]:56014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZpL-0003Gm-8M
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 13:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@diablo.13thmonkey.org>)
 id 1lMZXG-0000Aa-5Y
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 13:00:43 -0400
Received: from 13thmonkey.org ([80.100.255.32]:65350
 helo=diablo.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@diablo.13thmonkey.org>) id 1lMZXE-0008Rj-60
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 13:00:41 -0400
Received: by diablo.13thmonkey.org (Postfix, from userid 103)
 id B46CFC13ADD; Wed, 17 Mar 2021 18:00:37 +0100 (CET)
Date: Wed, 17 Mar 2021 18:00:37 +0100
From: Reinoud Zandijk <reinoud@NetBSD.org>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: Win10 always takes 100% cpu power even when idle
Message-ID: <YFI1tThW/xpwNOsc@diablo.13thmonkey.org>
References: <YFIqKhlRclmy+kwN@diablo.13thmonkey.org>
 <YFIr7YJvjGXURoRl@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="a1MG1ykjdTLTpYSo"
Content-Disposition: inline
In-Reply-To: <YFIr7YJvjGXURoRl@redhat.com>
Received-SPF: none client-ip=80.100.255.32;
 envelope-from=reinoud@diablo.13thmonkey.org; helo=diablo.13thmonkey.org
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--a1MG1ykjdTLTpYSo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 17, 2021 at 04:18:53PM +0000, Daniel P. Berrang=E9 wrote:
> On Wed, Mar 17, 2021 at 05:11:22PM +0100, Reinoud Zandijk wrote:
> > when executing Qemu with
> >=20
> >   qemu-system-x86_64 -m 4G -smp cores=3D2 -M q35 -snapshot \
> >     -drive file=3D/home/reinoud/Downloads/Win10-demo.raw,format=3Draw \
> >     -rtc base=3Dlocaltime,clock=3Dhost -spice port=3D5924,disable-ticke=
ting=3Don \
> >     -vga qxl -usb -device usb-tablet -net nic -net tap,ifname=3Dtap0,sc=
ript=3Dno
> >=20
> > my cpu usage in Windows10 *allways* reports 100% cpu usage. On the host=
 system
> > its always 190%+ ie it is really taking two cores completely.

> IIRC,  "-usb" still adds a USB-1 controller and that's known to be bad for
> causing high load in Windows guests in particular. So before debugging
> anything else, I'd suggest configuring a USB-3 controller instead - see
> docs/usb2.txt XHCI info.

I tried that and added `-device qemu-xhci' instead of the `-usb' and it ind=
eed
showed an USB 3 interface. It didn't help though; its still consuming 100% =
CPU
=66rom both configured CPUs.

When I completely remove USB, i get the jagged mouse again but it makes no
difference :-/

Reinoud


--a1MG1ykjdTLTpYSo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEELRHWktq6GkG74/X0gpw3AEPIqmgFAmBSNbMACgkQgpw3AEPI
qmjAmQf7Bsa3I9an5UBbIFxcyY2HRZi197DOWFe9hOvq4X99UxkAkFKR9D2PX2eU
h1nkGQIXmmaRZnwpVXreYFUGz3OXtztQJy2W7WiHm1nGRst8Rs45npgmSrpXQCfQ
YSYPDmahlEUZa40ZOtN6lD+LR27SIbR3vKvRz7nPIQ2p0ITb86uTLNRmeaByVJ1m
1/H1Ln9CVMzqDtEjGCmjyLDbDTKkRgRwDPtMYLBfZYov32CTtRjkgfBpoRPMntuA
ihb7SK1p4px8yiNkZQf4VtPSqIay2CB2rhb1NOV3J2yzAj4zD2vLwCeJz1augv6w
0sX3dKe8pFk5R1zVJTQgWnqKqK0sXQ==
=iUMY
-----END PGP SIGNATURE-----

--a1MG1ykjdTLTpYSo--

