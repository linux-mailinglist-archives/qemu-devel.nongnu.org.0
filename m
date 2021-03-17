Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D67C33F553
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:20:04 +0100 (CET)
Received: from localhost ([::1]:58462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYtv-0003kz-0o
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:20:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@diablo.13thmonkey.org>)
 id 1lMYlb-0004wA-1Y
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:11:27 -0400
Received: from 13thmonkey.org ([80.100.255.32]:65372
 helo=diablo.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@diablo.13thmonkey.org>) id 1lMYlZ-0002tG-9A
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:11:26 -0400
Received: by diablo.13thmonkey.org (Postfix, from userid 103)
 id CC3E9C13ADD; Wed, 17 Mar 2021 17:11:22 +0100 (CET)
Date: Wed, 17 Mar 2021 17:11:22 +0100
From: Reinoud Zandijk <reinoud@NetBSD.org>
To: qemu-devel@nongnu.org
Subject: Win10 always takes 100% cpu power even when idle
Message-ID: <YFIqKhlRclmy+kwN@diablo.13thmonkey.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wgUTGuAO1SrmD61b"
Content-Disposition: inline
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--wgUTGuAO1SrmD61b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

when executing Qemu with

  qemu-system-x86_64 -m 4G -smp cores=2 -M q35 -snapshot \
    -drive file=/home/reinoud/Downloads/Win10-demo.raw,format=raw \
    -rtc base=localtime,clock=host -spice port=5924,disable-ticketing=on \
    -vga qxl -usb -device usb-tablet -net nic -net tap,ifname=tap0,script=no

my cpu usage in Windows10 *allways* reports 100% cpu usage. On the host system
its always 190%+ ie it is really taking two cores completely.

Using our NVMM accelerator makes it run a whole lot faster, as good as native
speed, but it always takes up the whole two processors too! Windows10 also
*allways* reports 100% cpu usage. Its not a startup thing for even when
letting it run for quite some time never reduces the cpu time.

In contrast, running NetBSD in the VM takes no CPU time at all when idle.

When Googling about this, I saw this come by quite often. Is there something
Qemu can do about this? What makes it spin like this and why is it Windows10
specific? This is a specific VM aware version too if I may believe it saying
so. I already replaced drivers to virtio etc but to no avail. Always 100% CPU
time for all CPUs.

Could this also be an ACPI thing?

With regards,
Reinoud


--wgUTGuAO1SrmD61b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEELRHWktq6GkG74/X0gpw3AEPIqmgFAmBSKigACgkQgpw3AEPI
qmg+WAgArfKMPZSa+R+S5c1ff+5Y/hgztTu/+/14MD8lIkoYY/hI7ZX7HIPBP9r8
5BbdZ9Hvzpy/v4RZtlj16Blikm1FjiYyS5qa7viYvzjdG//+a5W1TXkNRk5rtncc
SHclb0Nd6FtNOafi139OSgfkyK2vIoZsPdhiHaj9293aQ1b2LMbFfnILYfQ+ACpx
kFPF2IdjeHXAs4z8nlN9WEhviZTG6VzvavaQwGRu1UArgiDjyc7ckTqYtoLkWPqV
9o3mHQsB2GSUjBtFUH7heyOrErisK5PK9B4GjjG7vuEWjB/v6SSKStfYkeZyCVmk
RiYSCrrCmzrFESPF8xtpN2uwUU6B1w==
=Nt7K
-----END PGP SIGNATURE-----

--wgUTGuAO1SrmD61b--

