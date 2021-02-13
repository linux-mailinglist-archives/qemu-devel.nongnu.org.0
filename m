Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 216C031AAB5
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 11:11:36 +0100 (CET)
Received: from localhost ([::1]:53050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lArtm-000538-Kx
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 05:11:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@diablo.13thmonkey.org>)
 id 1lArnV-00046f-Oi
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 05:05:05 -0500
Received: from 13thmonkey.org ([80.100.255.32]:65529
 helo=diablo.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@diablo.13thmonkey.org>) id 1lArnU-0001rS-1M
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 05:05:05 -0500
Received: by diablo.13thmonkey.org (Postfix, from userid 103)
 id BC5C6C13ADB; Sat, 13 Feb 2021 11:05:00 +0100 (CET)
Date: Sat, 13 Feb 2021 11:05:00 +0100
From: Reinoud Zandijk <reinoud@NetBSD.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Qemu mipssim patches, mips malta and virtio bugs
Message-ID: <YCekTE6Aik0OoLLg@diablo.13thmonkey.org>
References: <20210211153746.GA25676@dropje.13thmonkey.org>
 <acf26892-c47c-7059-f3d1-8ef5bdcdcb8b@amsat.org>
 <2951213f-7610-857d-c20c-12bc26877490@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zrYFeCPl43k3+Xuw"
Content-Disposition: inline
In-Reply-To: <2951213f-7610-857d-c20c-12bc26877490@amsat.org>
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Reinoud Zandijk <reinoud@NetBSD.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--zrYFeCPl43k3+Xuw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 12, 2021 at 10:44:55AM +0100, Philippe Mathieu-Daud=E9 wrote:
> >> i'd like to get the following simple patches to the MIPS/mipssim targe=
t adding
> >> virtio-mmio devices to it.
>=20
> Please submit your patches as a series so we can review them on
> the list:
> https://wiki.qemu.org/Contribute/SubmitAPatch#Use_git_format-patch

Oh thanks, i didn't know that; i've created a new patch with the OR gate you
suggested. We deliberated about the change here and we'll at least keep it
here locally for testing and profiling code until a real `virt' platform is
developed for MIPS. Until then it would IMHO be a good expansion to mipssim.
I'll try to get a proper patch posted on the list :)

As for the Malta target, its missing its BIOS and thus its PCI bus is not
initialised correctly for NetBSD to run on when its passed with -kernel. Li=
nux
seems to bodge around this somewhere but if no BIOS is found it would be
better if it was initialised as the BIOS would leave it before handing over=
 to
the kernel.

There are also a few Qemu virtio-pci and virtio-mmio bugs we encountered on
Aarch64 and Sparc64, how can I best file those? Or should I try to contact =
ppl
directly?

With regards,
Reinoud Zandijk


--zrYFeCPl43k3+Xuw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEELRHWktq6GkG74/X0gpw3AEPIqmgFAmAnpEkACgkQgpw3AEPI
qmgq/QgArt+ViTQa/sEhGvi2BxFQr2MTHP1Rtat1zxrK7YoOjv4/P7yr6lYqpWr1
rPUYiEvZ+e7nKb3/GRhqJwkaz9+IohnY6LJ6qRsyN+aP1XSF3TuZKvrFkAqIPoaD
2M61ph84yoqBxouNUocZK3qlj+RsJNCyv43BgdP0yH6kHFi+sMG6b+Dao4Z0rp1O
DEN6iQ2usjORaZi0jzasdnhAOhMeFmtuZMALBm8VYV7Qr4yu7pnqB2doyxCAt8GG
zBTuyzJjfeOlfnT5DyCQhRPNdhEnYsrNBE2EAefas2AwQb2FE5Jk17aHMBeCTGmR
N5tJX8M4ciVws6bIwNfqfpPhiTfu5Q==
=IwxZ
-----END PGP SIGNATURE-----

--zrYFeCPl43k3+Xuw--

