Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 314CD3BB494
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 03:00:31 +0200 (CEST)
Received: from localhost ([::1]:50702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0CyM-0007Lt-0H
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 21:00:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1m0CxA-0006Bf-3T
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 20:59:16 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:36685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1m0Cx7-0004o4-1w
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 20:59:15 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id E56B4580786;
 Sun,  4 Jul 2021 20:59:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sun, 04 Jul 2021 20:59:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=+LNcYr
 nauXX6x9FDOXPuxQ7rqnljzX+6FjWtKdCgtJo=; b=kPR/TdOpr32JzIvuQ0eMob
 NGO/Dv64YxNzp06Yp1/lmMJQLLvmR3iXteB54MmePrH52xzPmMWcGcC/wS/kS0EI
 qkYdXHlhHPT2+cmxiOj8PbAMpeAYL2lniqk8EKEciKnJJu8ec/iqpft5uHO8A0kK
 KgPskUOCfNqIYjP6bpI1FcNus/ZpR5tbYNzoCW0vwBY/A+BXE5glc4Ac+vhPh2yx
 fder9h34a5oUmWu1zvE2iTzaCXFGFlCZl5T0lBjcP+9zi3y6quHmBKRb2TEhlG8s
 /DVIGY1YFznuTeIO5CVQ50E8pWtH2Se41n5Mz9YOPODK+TPRfVnggxmzI/2nSdPQ
 ==
X-ME-Sender: <xms:XFniYK9oYBEqsnMHqNYw7F0uxiif-zgaFLXkJwB81KlcLuROSyRXXA>
 <xme:XFniYKvoY4-5HX_Yk6V6LoqLVFU1anYYuMvX-QIJcN1hggMFwwa3I3MPopqvIBKV7
 BpeGaJ3YtV8P5_fuq4>
X-ME-Received: <xmr:XFniYAALmI9SlziBWaNSruUh8NWdc-ZbnZwUPg-Uzi5YrXJRA67Qa1mBTZrOS_eSg8MVGyvsMxVJfQi6Ufrdq1gXXhcSxq3eiAk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejfedgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesmhdtreertddtjeenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepudfggfduudeilefgkeehgeffueejffeigeehkeejfeefffffkeelieetffev
 ueffnecuffhomhgrihhnpehnvghtsghsugdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehk
 rdhorhhg
X-ME-Proxy: <xmx:XFniYCcbgiYRShHyQKtiWuBvgIds2jI53DEMv4VU_DNBjaL4KV5-lg>
 <xmx:XFniYPNdAmBRb15ZU-12i32dfWZ2_zQW08gxW-BWMekp9ypgePh_7A>
 <xmx:XFniYMnuVNgHDQskjT1mwt96pk6X667HkNEVqJkmF8VdwZ-ntCUl3w>
 <xmx:XVniYAFT2KeK2C6Z9LXxkfpnX-dwrVSXBMqBIKQFEay-3mw34kTPfg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 4 Jul 2021 20:59:05 -0400 (EDT)
Date: Mon, 5 Jul 2021 10:58:44 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] tests/acceptance: Test NetBSD 5.1 on the Jazz Magnum
 machine
In-Reply-To: <20210705002618.745807-1-f4bug@amsat.org>
Message-ID: <a71eea-5054-c4a-4632-531bb6d66b3@linux-m68k.org>
References: <20210705002618.745807-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811774-1014458348-1625446724=:6"
Received-SPF: none client-ip=66.111.4.230; envelope-from=fthain@linux-m68k.org;
 helo=new4-smtp.messagingengine.com
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

---1463811774-1014458348-1625446724=:6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 5 Jul 2021, Philippe Mathieu-Daud=C3=A9 wrote:

> Test NetBSD 5.1 on the Jazz Magnum machine. As the firmware is not
> redistributable, it has to be extracted from the floppy configuration
> disk coming with a Mips Magnum 4000 system, then the NTPROM_BIN_PATH
> environment variable has to be set. For convenience a NVRAM pre-
> initialized to boot NetBSD is included. The test can be run as:
>=20
>   $ NTPROM_BIN_PATH=3D/path/to/ntprom.bin \
>     avocado --show=3Dapp,console \
>     run -t machine:magnum tests/acceptance/
>   Fetching asset from tests/acceptance/machine_mips_jazz.py:MipsJazz.test=
_magnum_netbsd_5_1
>    (1/1) tests/acceptance/machine_mips_jazz.py:MipsJazz.test_magnum_netbs=
d_5_1:
>   console: EISA Bus 0 Initialization In Progress... Direct Memory Access =
(DMA) System Control Port B Timer 1 OK.
>   console: ARC Multiboot Version 174 (SGI Version 2.6)
>   console: Copyright (c) 1991,1992  Microsoft Corporation
>   console: Actions:
>   console: Start Windows NT
>   console: Run a program
>   console: Run setup
>   console: Use the arrow keys to select.
>   console: Press Enter to choose.
>   console: Program to run:
>   console: scsi(0)cdrom(2)fdisk(0)boot scsi(0)cdrom(2)fdisk(0)netbsd
>   console: NetBSD/arc Bootstrap, Revision 1.1
>   console: (builds@b7.netbsd.org, Sat Nov  6 14:06:36 UTC 2010)
>   console: devopen: scsi(0)cdrom(2)fdisk(0) type disk file netbsd
>   console: NetBSD 5.1 (RAMDISK) #0: Sat Nov  6 14:17:36 UTC 2010
>   console: builds@b7.netbsd.org:/home/builds/ab/netbsd-5-1-RELEASE/arc/20=
1011061943Z-obj/home/builds/ab/netbsd-5-1-RELEASE/src/sys/arch/arc/compile/=
RAMDISK
>   console: MIPS Magnum
>   console: total memory =3D 128 MB
>   console: avail memory =3D 117 MB
>   console: mainbus0 (root)
>   console: cpu0 at mainbus0: MIPS R4000 CPU (0x400) Rev. 0.0 with MIPS R4=
010 FPC Rev. 0.0
>   console: cpu0: 8KB/16B direct-mapped L1 Instruction cache, 48 TLB entri=
es
>   console: cpu0: 8KB/16B direct-mapped write-back L1 Data cache
>   console: jazzio0 at mainbus0
>   console: timer0 at jazzio0 addr 0xe0000228
>   console: mcclock0 at jazzio0 addr 0xe0004000: mc146818 compatible time-=
of-day clock
>   console: LPT1 at jazzio0 addr 0xe0008000 intr 0 not configured
>   console: fdc0 at jazzio0 addr 0xe0003000 intr 1
>   console: fd0 at fdc0 drive 1: 1.44MB, 80 cyl, 2 head, 18 sec
>   console: MAGNUM at jazzio0 addr 0xe000c000 intr 2 not configured
>   console: VXL at jazzio0 addr 0xe0800000 intr 3 not configured
>   console: sn0 at jazzio0 addr 0xe0001000 intr 4: SONIC Ethernet
>   console: sn0: Ethernet address 00:00:00:00:00:00
>   console: asc0 at jazzio0 addr 0xe0002000 intr 5: NCR53C94, 25MHz, SCSI =
ID 7
>   console: scsibus0 at asc0: 8 targets, 8 luns per target
>   console: pckbc0 at jazzio0 addr 0xe0005000 intr 6
>   console: pckbd0 at pckbc0 (kbd slot)
>   console: wskbd0 at pckbd0 (mux ignored)
>   console: pms at jazzio0 addr 0xe0005000 intr 7 not configured
>   console: com0 at jazzio0 addr 0xe0006000 intr 8: ns16550a, working fifo
>   console: com0: txfifo disabled
>   console: com0: console
>   console: com1 at jazzio0 addr 0xe0007000 intr 9: ns16550a, working fifo
>   console: com1: txfifo disabled
>   console: jazzisabr0 at mainbus0
>   console: isa0 at jazzisabr0
>   console: isapnp0 at isa0 port 0x279: ISA Plug 'n Play device support
>   console: scsibus0: waiting 2 seconds for devices to settle...
>   console: cd0 at scsibus0 target 2 lun 0: <QEMU, QEMU CD-ROM, 2.5+> cdro=
m removable
>   console: boot device: <unknown>
>   console: root on md0a dumps on md0b
>   console: root file system type: ffs
>   console: WARNING: preposterous TOD clock time
>   console: WARNING: using filesystem time
>   console: WARNING: CHECK AND RESET THE DATE!
>   console: erase ^H, werase ^W, kill ^U, intr ^C, status ^T
>   console: Terminal type? [vt100]
>   console: Erase is backspace.
>   console: S
>   console: (I)nstall, (S)hell or (H)alt ?
>   console: #
>   console: # ifconfig sn0 10.0.2.3/24
>   console: # # #
>   console: # ping -c 3 10.0.2.2
>   console: # # # # # PING 10.0.2.2 (10.0.2.2): 56 data bytes
>   console: 64 bytes from 10.0.2.2: icmp_seq=3D0 ttl=3D255 time=3D12.526 m=
s
>   console: 64 bytes from 10.0.2.2: icmp_seq=3D1 ttl=3D255 time=3D2.324 ms
>   console: 64 bytes from 10.0.2.2: icmp_seq=3D2 ttl=3D255 time=3D0.608 ms
>   console: ----10.0.2.2 PING Statistics----
>   console: 3 packets transmitted, 3 packets received, 0.0% packet loss
>   console: shutdown -r now
>   console: round-trip min/avg/max/stddev =3D 0.608/5.153/12.526/6.443 ms
>   console: # Shutdown NOW!
>   console: shutdown: [pid 14]
>   console: # sh: /usr/bin/wall: not found
>   console: reboot by root:
>   console: System shutdown time has arrived
>   console: About to run shutdown hooks...
>   console: .: Can't open /etc/rc.shutdown
>   console: Done running shutdown hooks.
>   console: syncing disks... done
>   console: unmounting file systems... done
>   console: rebooting...
>   PASS (39.06 s)
>   RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 =
| CANCEL 0
>   JOB TIME   : 39.54 s
>=20
> Inspired-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .../machine_mips_jazz.d/nvram.bin.xz          | Bin 0 -> 700 bytes
>  tests/acceptance/machine_mips_jazz.py         |  96 ++++++++++++++++++
>  2 files changed, 96 insertions(+)
>  create mode 100644 tests/acceptance/machine_mips_jazz.d/nvram.bin.xz
>  create mode 100644 tests/acceptance/machine_mips_jazz.py
>=20
> diff --git a/tests/acceptance/machine_mips_jazz.d/nvram.bin.xz b/tests/ac=
ceptance/machine_mips_jazz.d/nvram.bin.xz
> new file mode 100644
> index 0000000000000000000000000000000000000000..4648bb31a75bd1a6ee06818a1=
bf0f2109203ced3
> GIT binary patch
> literal 700
> zcmV;t0z>`%H+ooF000E$*0e?f03iV!0000G&sfah5B~ysT>t=3DTewJhU2JbgNgw@93
> z9ne@Of$dv11>H(&qfaP~{?QVNDD*)y9o<}llIpWo;zi4K%|O3oZX7;e0I%^w=3D#ho%
> zm*3>5KcVeDb)hM{s=3D^@xl3*6CLiEr>=3Do;i$-UTTwy=3D`4vF_aQ@AM-}hS_gfV?dXL~
> zr6}Ck7jr0Pd6X49Gycxm@5wylC8aWC%NAZ^DQmjk9v0R)a7u1hsY5)le9~S_G;wnI
> zNEhT-#4+m{FhwCCTK#>itkJ+zGLq(>iH&;ourQ75=3D5X0GCmKgT34hXv`!lNS@Vv~9
> z#dTZb1?<x%e;6UaEZ?$JT@1SBP5my9l7&XSs?W+Ufr||*z035xw~`at6Ee$`W+96+
> z+GJc@N)TzeY@b#YPn@xQT6#fKq_~pFo)=3D4ZKP9K_BO1_^7pVTQNp$u}nKgZ>DkCrj
> z^?l-ksd=3D`Q%7w&-3CkM)A-1nkM@y=3D-6N=3DHiA4b<WBKS^=3D)!oj-ZC_{*DGqZD2VzX=
1
> zK{*4jgOsj!UPEwQ?*VD-2^<k{1^m(NV;8Ya)p-pwGWqQ7CAgX4w5vWiB095j=3Dyfi%
> zkXq_?C-K4b7)51+8S-t@;sSpTEtU7x1UZ|?WWEp59W6%y5<X+<RS_F7)N!aN8Lm!&
> z-jRJ50VM#t_NLVKQ`#MuEWzq1$^|tn4L1MW?!$H&fc<(y1QHv6-#@=3DcN*d%QYMaA0
> z+L!W3-k!*7dONwgWwK{?$5Yf5d8TRJIgw7WHR@zI6hLrbArpq|%Ax#6+d)m|&Wh%|
> z!pU{tbl$cCNXE=3DB0Pf|j?*P-9X*vQHCH?48MX**q?{Zss*9HdGiu@Se*+j_z00023
> i?D;I-mde`z0hR@TAOHX;UY-@P#Ao{g000001X)@jNK0n`
>=20
> literal 0
> HcmV?d00001
>=20
> diff --git a/tests/acceptance/machine_mips_jazz.py b/tests/acceptance/mac=
hine_mips_jazz.py
> new file mode 100644
> index 00000000000..0b6640edc12
> --- /dev/null
> +++ b/tests/acceptance/machine_mips_jazz.py
> @@ -0,0 +1,96 @@
> +# Functional tests for the Jazz machines.
> +#
> +# Copyright (c) 2021 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or lat=
er.
> +# See the COPYING file in the top-level directory.
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import os
> +import lzma
> +import shutil
> +
> +from avocado import skipUnless
> +from avocado_qemu import Test
> +from avocado_qemu import exec_command
> +from avocado_qemu import exec_command_and_wait_for_pattern
> +from avocado_qemu import interrupt_interactive_console_until_pattern
> +from avocado_qemu import wait_for_console_pattern
> +
> +from tesseract_utils import tesseract_available, tesseract_ocr
> +
> +class MipsJazz(Test):
> +
> +    timeout =3D 60
> +
> +    @skipUnless(os.getenv('NTPROM_BIN_PATH'), 'NTPROM_BIN_PATH not avail=
able')
> +    def test_magnum_netbsd_5_1(self):
> +        """
> +        :avocado: tags=3Darch:mips64el
> +        :avocado: tags=3Dmachine:magnum
> +        :avocado: tags=3Dos:netbsd
> +        :avocado: tags=3Ddevice:sonic
> +        :avocado: tags=3Ddevice:esp
> +        """
> +        drive_url =3D ('http://archive.netbsd.org/pub/NetBSD-archive/'
> +                     'NetBSD-5.1/iso/arccd-5.1.iso')

This can be updated to NetBSD 9.2 (the regressions in NetBSD have been=20
fixed).

> +        drive_hash =3D ('c91a57fb373636247d1f1ce283a610ba529e208604a'
> +                      'f2a9e0237551fb3d25459c7697775af8c8d35a9764e'
> +                      'fca87cfb591f363643e93417cfdb8857215ceb405e')
> +        drive_path =3D self.fetch_asset(drive_url, asset_hash=3Ddrive_ha=
sh,
> +                                      algorithm=3D'sha512')
> +        ntprom_hash =3D '316de17820192c89b8ee6d9936ab8364a739ca53'
> +        ntprom_path =3D self.fetch_asset('file://' + os.getenv('NTPROM_B=
IN_PATH'),
> +                                       asset_hash=3Dntprom_hash, algorit=
hm=3D'sha1')
> +        nvram_size =3D 8200

This nvram_size setting can be omitted now that Mark's recent patches have=
=20
resolved the SONIC PROM issues in mainline.

You would need the extra 8 bytes of NVRAM only if you wanted to alter the=
=20
stored MAC address after starting the guest. The configuration function in=
=20
the ARC firmware allows for that but this test doesn't need it.

> +        nvram_path =3D 'nvram.bin'

Does the test work when nvram.bin is uninitialized by the ARC firmware?

> +        nvram_xz_hash =3D '3d4565124ff2369706b97e1d0ef127a68c23d418'
> +        nvram_xz_path =3D os.path.dirname(os.path.abspath(__file__)) \
> +                        + '/machine_mips_jazz.d/nvram.bin.xz'
> +        nvram_xz_path =3D self.fetch_asset('file://' + nvram_xz_path,
> +                                         asset_hash=3Dnvram_xz_hash,
> +                                         algorithm=3D'sha1')
> +
> +        with lzma.open(nvram_xz_path, 'rb') as f_in:
> +            with open(nvram_path, 'wb') as f_out:
> +                shutil.copyfileobj(f_in, f_out)
> +                f_out.seek(nvram_size)
> +                f_out.write(b'\0')
> +
> +        self.vm.set_console()
> +        self.vm.add_args('-bios', ntprom_path,
> +                         '-drive', 'if=3Dscsi,unit=3D2,media=3Dcdrom,for=
mat=3Draw,file=3D'
> +                                   + drive_path,
> +                         '-global', 'ds1225y.filename=3D' + nvram_path,
> +                         '-global', 'ds1225y.size=3D' + str(nvram_size),
> +                         '-nic', 'user,model=3Ddp83932,mac=3D00:00:00:02=
:03:04')

Perhaps the default MAC address (from the SONIC PROM) would be more=20
appropriate? Alternatively, if you want to check that '00:00:00:02:03:04'=
=20
actually got used, you can do this:

erase ^H, werase ^W, kill ^U, intr ^C, status ^T
Terminal type? [vt100]=20
Erase is backspace.                                                    =20
(I)nstall, (S)hell or (H)alt ? s
# ifconfig
sn0: flags=3D0x8802<BROADCAST,SIMPLEX,MULTICAST> mtu 1500
        ec_capabilities=3D1<VLAN_MTU>
        ec_enabled=3D0
        address: 00:00:00:02:03:04
lo0: flags=3D0x8048<LOOPBACK,RUNNING,MULTICAST> mtu 33160
#=20

> +        self.vm.launch()
> +
> +        console_pattern =3D 'ARC Multiboot Version 174 (SGI Version 2.6)=
'
> +        wait_for_console_pattern(self, console_pattern)
> +
> +        wait_for_console_pattern(self, 'Use the arrow keys to select.')
> +        exec_command(self, '\x1b[B') # Cursor Control 'Down'
> +
> +        program =3D 'scsi(0)cdrom(2)fdisk(0)boot scsi(0)cdrom(2)fdisk(0)=
netbsd'
> +        exec_command(self, program)
> +        wait_for_console_pattern(self, 'NetBSD/arc Bootstrap, Revision 1=
=2E1')
> +
> +        # Terminal type? [vt100]
> +        console_pattern =3D 'erase ^H, werase ^W, kill ^U, intr ^C, stat=
us ^T'
> +        wait_for_console_pattern(self, console_pattern)
> +
> +        # (I)nstall, (S)hell or (H)alt
> +        exec_command_and_wait_for_pattern(self, '', 'Erase is backspace.=
')
> +        exec_command(self, 'S')
> +        interrupt_interactive_console_until_pattern(self, '#')
> +
> +        exec_command(self, 'ifconfig sn0 10.0.2.3/24')
> +        interrupt_interactive_console_until_pattern(self, '#')
> +
> +        exec_command_and_wait_for_pattern(self, 'ping -c 3 10.0.2.2',
> +                '3 packets transmitted, 3 packets received, 0.0% packet =
loss')
> +
> +        exec_command_and_wait_for_pattern(self, 'shutdown -r now',
> +                                          'rebooting...')
>=20
---1463811774-1014458348-1625446724=:6--

