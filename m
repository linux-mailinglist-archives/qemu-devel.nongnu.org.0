Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE613BE075
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 03:04:56 +0200 (CEST)
Received: from localhost ([::1]:47684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0vzj-0000W9-Ub
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 21:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1m0vyP-00083b-T2
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:03:33 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:35077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1m0vyN-0003rq-BR
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:03:33 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 3A7222B00A88;
 Tue,  6 Jul 2021 21:03:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 06 Jul 2021 21:03:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=aEUViK
 a+/YzJikS/g3C1p/zMD8iSqyuerPIie1fKrOA=; b=YxWzK2deBLdfJtIjv4T7hq
 zuX+J2AFMONLNLmrpjFQg9C5vRkF+i+iH8sLlksQ7YtmRCif1MgJ3sRMmfVrff0e
 S1kFlN9ynL1hUI9Gf6dG0jPLAGJ8CaXCt88AEfznP5mj1sToClUmFAyvtUDOn0Un
 ZE3/vWNkaFsesTXlsdcVystnssVLhlRvbxRYaJNi5ZT+fPsg0KrgWWZyS0qGQoQZ
 onedhhI25sCUn5xIZKMyRPUDyUJSQKYpo9VvPKlzawHcgUUjMLT1+1xwBzKOArEu
 umcHkbszpjoxluihWvHr4Q7udCo+xFRpX2+9sTX0h+NjaDYqO7liFSuC3/TFbVZg
 ==
X-ME-Sender: <xms:Xv3kYBMHWIEz0yadHO7NWqQzGZJzPgpklJjXp5PDGQ0nlPuHesEe6g>
 <xme:Xv3kYD8xUHBNVUUqietj82c1eAub3XHmFZnfsRFzdUd4WgsAp03mBTMS5ui9ZOn9o
 qlhZvJ29Q_1WIVNXas>
X-ME-Received: <xmr:Xv3kYATq191ee6k9bMH8ryPGHvicSQ3Vksy04LKnwmqGBo1tjrjaaur1KJ8bPqQ-njEcEF5TKWuuB9n9cAOcTOuRnRVk5Lcmm8c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddugddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvufgjkfhfgggtsehmtderredttdejnecuhfhrohhmpefhihhnnhcuvfhh
 rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
 gvrhhnpedugffgudduieelgfekheegffeujeffieegheekjeeffeffffekleeiteffveeu
 ffenucffohhmrghinhepnhgvthgsshgurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdr
 ohhrgh
X-ME-Proxy: <xmx:Xv3kYNunwenllAUPCvYZ_yUJ6fnuDuaNoCtAgZQbtQ4IwBLozFtq9Q>
 <xmx:Xv3kYJf-amhv_rZRBxoHAYRtLmqIOM6so1WSGMTak7-7HcM-VcEzFA>
 <xmx:Xv3kYJ2sZLyljE2GDQGM34sNPyachFd7ADHt3EaTmm4AH5gVgIVLWA>
 <xmx:X_3kYF51zCmitwuNjvH5crFvDwJrHbdmPy3CcpCz-SfECEFJbrN2xPmoj84>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jul 2021 21:03:23 -0400 (EDT)
Date: Wed, 7 Jul 2021 11:03:18 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] tests/acceptance: Test NetBSD 5.1 on the Jazz Magnum
 machine
In-Reply-To: <b82e1528-1659-68d2-8e6f-d40e3d97a475@amsat.org>
Message-ID: <ffc2d925-7a3-701e-4126-c1b46bd6bcef@linux-m68k.org>
References: <20210705002618.745807-1-f4bug@amsat.org>
 <a71eea-5054-c4a-4632-531bb6d66b3@linux-m68k.org>
 <b82e1528-1659-68d2-8e6f-d40e3d97a475@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811774-180562082-1625619798=:24"
Received-SPF: none client-ip=64.147.123.26; envelope-from=fthain@linux-m68k.org;
 helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Kamil Rytarowski <kamil@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-180562082-1625619798=:24
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 5 Jul 2021, Philippe Mathieu-Daud=C3=A9 wrote:

> On 7/5/21 2:58 AM, Finn Thain wrote:
> > On Mon, 5 Jul 2021, Philippe Mathieu-Daud=C3=A9 wrote:
> >=20
> >> Test NetBSD 5.1 on the Jazz Magnum machine. As the firmware is not
> >> redistributable, it has to be extracted from the floppy configuration
> >> disk coming with a Mips Magnum 4000 system, then the NTPROM_BIN_PATH
> >> environment variable has to be set. For convenience a NVRAM pre-
> >> initialized to boot NetBSD is included. The test can be run as:
> >>
> >>   $ NTPROM_BIN_PATH=3D/path/to/ntprom.bin \
> >>     avocado --show=3Dapp,console \
> >>     run -t machine:magnum tests/acceptance/
> >>   Fetching asset from tests/acceptance/machine_mips_jazz.py:MipsJazz.t=
est_magnum_netbsd_5_1
> >>    (1/1) tests/acceptance/machine_mips_jazz.py:MipsJazz.test_magnum_ne=
tbsd_5_1:
> >>   console: EISA Bus 0 Initialization In Progress... Direct Memory Acce=
ss (DMA) System Control Port B Timer 1 OK.
> >>   console: ARC Multiboot Version 174 (SGI Version 2.6)
> >>   console: Copyright (c) 1991,1992  Microsoft Corporation
> >>   console: Actions:
> >>   console: Start Windows NT
> >>   console: Run a program
> >>   console: Run setup
> >>   console: Use the arrow keys to select.
> >>   console: Press Enter to choose.
> >>   console: Program to run:
> >>   console: scsi(0)cdrom(2)fdisk(0)boot scsi(0)cdrom(2)fdisk(0)netbsd
> >>   console: NetBSD/arc Bootstrap, Revision 1.1
> >>   console: (builds@b7.netbsd.org, Sat Nov  6 14:06:36 UTC 2010)
> >>   console: devopen: scsi(0)cdrom(2)fdisk(0) type disk file netbsd
> >>   console: NetBSD 5.1 (RAMDISK) #0: Sat Nov  6 14:17:36 UTC 2010
> >>   console: builds@b7.netbsd.org:/home/builds/ab/netbsd-5-1-RELEASE/arc=
/201011061943Z-obj/home/builds/ab/netbsd-5-1-RELEASE/src/sys/arch/arc/compi=
le/RAMDISK
> >>   console: MIPS Magnum
>=20
> >> +class MipsJazz(Test):
> >> +
> >> +    timeout =3D 60
> >> +
> >> +    @skipUnless(os.getenv('NTPROM_BIN_PATH'), 'NTPROM_BIN_PATH not av=
ailable')
> >> +    def test_magnum_netbsd_5_1(self):
> >> +        """
> >> +        :avocado: tags=3Darch:mips64el
> >> +        :avocado: tags=3Dmachine:magnum
> >> +        :avocado: tags=3Dos:netbsd
> >> +        :avocado: tags=3Ddevice:sonic
> >> +        :avocado: tags=3Ddevice:esp
> >> +        """
> >> +        drive_url =3D ('http://archive.netbsd.org/pub/NetBSD-archive/=
'
> >> +                     'NetBSD-5.1/iso/arccd-5.1.iso')
> >=20
> > This can be updated to NetBSD 9.2 (the regressions in NetBSD have been=
=20
> > fixed).
>=20
> Indeed, with this change:
>=20
> -- >8 --
> diff --git a/tests/acceptance/machine_mips_jazz.py
> b/tests/acceptance/machine_mips_jazz.py
> index 0b6640edc12..54968959372 100644
> --- a/tests/acceptance/machine_mips_jazz.py
> +++ b/tests/acceptance/machine_mips_jazz.py
> @@ -33,13 +33,11 @@ def test_magnum_netbsd_5_1(self):
>          :avocado: tags=3Ddevice:sonic
>          :avocado: tags=3Ddevice:esp
>          """
> -        drive_url =3D ('http://archive.netbsd.org/pub/NetBSD-archive/'
> -                     'NetBSD-5.1/iso/arccd-5.1.iso')
> -        drive_hash =3D ('c91a57fb373636247d1f1ce283a610ba529e208604a'
> -                      'f2a9e0237551fb3d25459c7697775af8c8d35a9764e'
> -                      'fca87cfb591f363643e93417cfdb8857215ceb405e')
> +        drive_url =3D ('http://cdn.netbsd.org/pub/NetBSD/'
> +                     'NetBSD-9.2/images/NetBSD-9.2-arc.iso')
> +        drive_hash =3D '409c61aee5459e762cdb120d2591ed2e'
>          drive_path =3D self.fetch_asset(drive_url, asset_hash=3Ddrive_ha=
sh,
> -                                      algorithm=3D'sha512')
> +                                      algorithm=3D'md5')
>          ntprom_hash =3D '316de17820192c89b8ee6d9936ab8364a739ca53'
>          ntprom_path =3D self.fetch_asset('file://' +
> os.getenv('NTPROM_BIN_PATH'),
>                                         asset_hash=3Dntprom_hash,
> algorithm=3D'sha1')
> ---
>=20
> I get:
>=20
> console: [   1.0000000] NetBSD 9.2 (RAMDISK) #0: Wed May 12 13:15:55 UTC
> 2021
> console: [   1.0000000]
> mkrepro@mkrepro.NetBSD.org:/usr/src/sys/arch/arc/compile/RAMDISK
> console: [   1.0000000] MIPS Magnum
> ...
> console: # [   6.1232105]
> pmap_tlb_update_addr(0x87eb5f60,0x69a000,0x1ee59e, 0)
> ...
> console: [  20.2174752] rebooting...
> PASS (48.98 s)
>=20
> >> +        nvram_path =3D 'nvram.bin'
> >=20
> > Does the test work when nvram.bin is uninitialized by the ARC firmware?
>=20
> No, because the serial is not used by default.
>=20
> > Perhaps the default MAC address (from the SONIC PROM) would be more=20
> > appropriate? Alternatively, if you want to check that '00:00:00:02:03:0=
4'=20
> > actually got used, you can do this:
> >=20
> > erase ^H, werase ^W, kill ^U, intr ^C, status ^T
> > Terminal type? [vt100]=20
> > Erase is backspace.                                                    =
=20
> > (I)nstall, (S)hell or (H)alt ? s
> > # ifconfig
> > sn0: flags=3D0x8802<BROADCAST,SIMPLEX,MULTICAST> mtu 1500
> >         ec_capabilities=3D1<VLAN_MTU>
> >         ec_enabled=3D0
> >         address: 00:00:00:02:03:04
> > lo0: flags=3D0x8048<LOOPBACK,RUNNING,MULTICAST> mtu 33160
> > #=20
>=20
> I noticed it was not working, maybe I'm missing one of Mark's patches.
>=20

That's strange. The MAC address is correct on mainline (as at 711c0418c8,=
=20
at least) for NetBSD and Linux guests hosted on my x86 machine.

> Thanks for the review,
>=20
> Phil.
>=20
---1463811774-180562082-1625619798=:24--

