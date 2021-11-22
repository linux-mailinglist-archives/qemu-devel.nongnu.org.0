Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4A84595EA
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 21:07:34 +0100 (CET)
Received: from localhost ([::1]:58302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpFbB-0002kf-2h
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 15:07:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mpFZt-00020k-AW
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 15:06:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mpFZg-00036q-Ot
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 15:06:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637611558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P3GfJZLWF8SNYuLvKpxCPHDqdOw6YBf4GCP+kqVHw5Y=;
 b=A/BRv9sQTBnbwRviYHUxYFS+Zy50wa1BDuyl2BMDxXf30K6c/pUhLu3kheKNNGhS4xbqT5
 OqpKWb0n8QGBcCLhAL3pWOiifPFHsvS0M8ngsj0IzQGJh0DWVerz9cMvu3T4hbB6AVQfUc
 Sm9uZ4ymBjMOiTzOhYbSlBfRKiXB88U=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-SMrzIdLUPpWMZICLaaPR8Q-1; Mon, 22 Nov 2021 15:05:51 -0500
X-MC-Unique: SMrzIdLUPpWMZICLaaPR8Q-1
Received: by mail-pj1-f70.google.com with SMTP id
 n6-20020a17090a670600b001a9647fd1aaso123420pjj.1
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 12:05:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P3GfJZLWF8SNYuLvKpxCPHDqdOw6YBf4GCP+kqVHw5Y=;
 b=usDUVWoY5bRAkiY9UJXsmYpuarUKaoj2ilXjs9nW2idzXXOYlVi57TLIDeqXjEsQvI
 OcRtNOwT9GhQHRZCTi7/oYcokIn87OjOS8MJnf9f1PrhB+ddirguEOS4wLaqq9bwJoaB
 AOHYCDeKVRWyKN/KQdefS9iS+5tocDRDupAE4AseK4BGcFiF9BE1idAmtGp0vRnT/ith
 xERgAylx4aoni7ZShVLqZTKhyc3pahj4ei8m4WGyHrcGA5G+obub74166M21Ak0lsru0
 owdwomxfZ8zbyd1O78yL7pY9Tb7ZUIiWxq02BIQHrL6343BAxHVZjQEFDeROMY/Pvzt2
 471g==
X-Gm-Message-State: AOAM530F0pL5mQE3Y+tJqVrrEK2XEHWG21kC6PnogN80sBtyw4m7Zec9
 VmujzREaozTQJWgmn10hZss3BgjSvGP6CU4LsjDX7PCq9o0s7iLvKHBiU6/HOL5QRVW43yNO7hh
 XxDNH2Go3XLwmqD74Pyt0BjrYn2ziH+0=
X-Received: by 2002:a65:6a47:: with SMTP id o7mr35029148pgu.439.1637611550467; 
 Mon, 22 Nov 2021 12:05:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrvvkAWBxXKYvYCXCpFGF1+K5Ka0riBuweoIapiAxfOKb6u6dx+mJJigi6C11Fu5WOeegNBLleaOkRBV51Qws=
X-Received: by 2002:a65:6a47:: with SMTP id o7mr35029102pgu.439.1637611550000; 
 Mon, 22 Nov 2021 12:05:50 -0800 (PST)
MIME-Version: 1.0
References: <20211119171202.458919-1-f4bug@amsat.org>
 <20211119171202.458919-6-f4bug@amsat.org>
In-Reply-To: <20211119171202.458919-6-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 22 Nov 2021 17:05:23 -0300
Message-ID: <CAKJDGDY_7x3cnC8XPUioihmRK68YrA24KOrNuoD2YP_oxePqPg@mail.gmail.com>
Subject: Re: [NOTFORMERGE PATCH 5/5] tests/avocado: Test NetBSD 9.2 on the
 Jazz Magnum machine
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, Finn Thain <fthain@linux-m68k.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 19, 2021 at 2:29 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Test NetBSD 9.2 on the Jazz Magnum machine. As the firmware is not
> redistributable, it has to be extracted from the floppy configuration
> disk coming with a Mips Magnum 4000 system, then the NTPROM_BIN_PATH
> environment variable has to be set. For convenience a NVRAM pre-
> initialized to boot NetBSD is included. The test can be run as:
>
>   $ NTPROM_BIN_PATH=3D/path/to/ntprom.bin \
>     avocado --show=3Dapp,console \
>     run -t machine:magnum tests/avocado/
>   Fetching asset from tests/avocado/machine_mips_jazz.py:MipsJazz.test_ma=
gnum_netbsd_9_2
>    (1/1) tests/avocado/machine_mips_jazz.py:MipsJazz.test_magnum_netbsd_9=
_2:
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
>   console: NetBSD/arc Bootstrap, Revision 1.1 (Wed May 12 13:15:55 UTC 20=
21)
>   console: devopen: scsi(0)cdrom(2)fdisk(0) type disk file netbsd
>   console: NetBSD 9.2 (RAMDISK) #0: Wed May 12 13:15:55 UTC 2021
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
>   console: # ifconfig
>   console: sn0: flags=3D0x8802<BROADCAST,SIMPLEX,MULTICAST> mtu 1500
>   console: ec_capabilities=3D1<VLAN_MTU>
>   console: ec_enabled=3D0
>   console: address: 00:00:00:02:03:04
>   console: lo0: flags=3D0x8048<LOOPBACK,RUNNING,MULTICAST> mtu 33160
>   console: #
>   console: # ifconfig sn0 10.0.2.3/24
>   console: #
>   console: # ping -c 3 10.0.2.2
>   console: PING 10.0.2.2 (10.0.2.2): 56 data bytes
>   console: 64 bytes from 10.0.2.2: icmp_seq=3D0 ttl=3D255 time=3D12.526 m=
s
>   console: 64 bytes from 10.0.2.2: icmp_seq=3D1 ttl=3D255 time=3D2.324 ms
>   console: 64 bytes from 10.0.2.2: icmp_seq=3D2 ttl=3D255 time=3D0.608 ms
>   console: ----10.0.2.2 PING Statistics----
>   console: 3 packets transmitted, 3 packets received, 0.0% packet loss
>   console: # shutdown -r now
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
>   PASS (49.27 s)
>   RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 =
| CANCEL 0
>   JOB TIME   : 49.70 s
>
> Inspired-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> v2:
> - Test NetBSD 9.2 (Finn, Mark)
> - Drop '-global ds1225y.size=3D8200' (Mark)
> - Mention "Run a program" option (Mark)
> - Check ARP (Finn)
>
> Not for merge until nvram.bin is generated.
>
> Cc: Finn Thain <fthain@linux-m68k.org>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  .../avocado/machine_mips_jazz.d/nvram.bin.xz  | Bin 0 -> 700 bytes
>  tests/avocado/machine_mips_jazz.py            |  99 ++++++++++++++++++
>  2 files changed, 99 insertions(+)
>  create mode 100644 tests/avocado/machine_mips_jazz.d/nvram.bin.xz
>  create mode 100644 tests/avocado/machine_mips_jazz.py
>
> diff --git a/tests/avocado/machine_mips_jazz.d/nvram.bin.xz b/tests/avoca=
do/machine_mips_jazz.d/nvram.bin.xz
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
>
> literal 0
> HcmV?d00001
>
> diff --git a/tests/avocado/machine_mips_jazz.py b/tests/avocado/machine_m=
ips_jazz.py
> new file mode 100644
> index 00000000000..1441b7fe5bb
> --- /dev/null
> +++ b/tests/avocado/machine_mips_jazz.py
> @@ -0,0 +1,99 @@
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
> +from avocado_qemu import QemuSystemTest
> +from avocado_qemu import exec_command
> +from avocado_qemu import exec_command_and_wait_for_pattern
> +from avocado_qemu import interrupt_interactive_console_until_pattern
> +from avocado_qemu import wait_for_console_pattern
> +
> +from tesseract_utils import tesseract_available, tesseract_ocr
> +
> +class MipsJazz(QemuSystemTest):
> +
> +    timeout =3D 60
> +
> +    @skipUnless(os.getenv('NTPROM_BIN_PATH'), 'NTPROM_BIN_PATH not avail=
able')
> +    def test_magnum_netbsd_9_2(self):
> +        """
> +        :avocado: tags=3Darch:mips64el
> +        :avocado: tags=3Dmachine:magnum
> +        :avocado: tags=3Dos:netbsd
> +        :avocado: tags=3Ddevice:sonic
> +        :avocado: tags=3Ddevice:esp
> +        """
> +        drive_url =3D ('http://cdn.netbsd.org/pub/NetBSD/'
> +                     'NetBSD-9.2/images/NetBSD-9.2-arc.iso')
> +        drive_hash =3D '409c61aee5459e762cdb120d2591ed2e'
> +        drive_path =3D self.fetch_asset(drive_url, asset_hash=3Ddrive_ha=
sh,
> +                                      algorithm=3D'md5')
> +        ntprom_hash =3D '316de17820192c89b8ee6d9936ab8364a739ca53'
> +        ntprom_path =3D self.fetch_asset('file://' + os.getenv('NTPROM_B=
IN_PATH'),
> +                                       asset_hash=3Dntprom_hash, algorit=
hm=3D'sha1')
> +        nvram_size =3D 8200
> +        nvram_path =3D 'nvram.bin'
> +        nvram_xz_hash =3D '3d4565124ff2369706b97e1d0ef127a68c23d418'
> +        nvram_xz_path =3D os.path.dirname(os.path.abspath(__file__)) \
> +                        + '/machine_mips_jazz.d/nvram.bin.xz'

If I understood correctly, you will not need this block when the
nvram.bin is built. Anyway, Avocado has libraries to handle files
needed by the tests. You can create a folder called
'test_name.py.data' and put your files there. Then, just use the
'get_data()' to get your file location without the need to handle the
paths.

The documentation about the data folder is here:
https://avocado-framework.readthedocs.io/en/latest/guides/writer/chapters/w=
riting.html?highlight=3Ddata#accessing-test-data-files

> +        nvram_xz_path =3D self.fetch_asset('file://' + nvram_xz_path,
> +                                         asset_hash=3Dnvram_xz_hash,
> +                                         algorithm=3D'sha1')
> +        mac =3D '00:00:00:02:03:04'
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
> +                         '-nic', 'user,model=3Ddp83932,mac=3D' + mac)
> +        self.vm.launch()
> +
> +        console_pattern =3D 'ARC Multiboot Version 174 (SGI Version 2.6)=
'
> +        wait_for_console_pattern(self, console_pattern)
> +
> +        wait_for_console_pattern(self, 'Use the arrow keys to select.')
> +
> +        # Press cursor control 'Down' to select the "Run a program" menu
> +        exec_command(self, '\x1b[B')
> +
> +        program =3D 'scsi(0)cdrom(2)fdisk(0)boot scsi(0)cdrom(2)fdisk(0)=
netbsd'
> +        exec_command(self, program)
> +        wait_for_console_pattern(self, 'NetBSD/arc Bootstrap, Revision 1=
.1')
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
> +        exec_command_and_wait_for_pattern(self, 'ifconfig', 'address: ' =
+ mac)
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

Nice!

Except for the nvram.bin.xz,

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


