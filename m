Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C323C2153
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 11:16:06 +0200 (CEST)
Received: from localhost ([::1]:49496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1mc9-0002TC-Dw
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 05:16:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1m1mZn-0000PG-7j
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 05:13:39 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:49213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1m1mZk-0005uu-9y
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 05:13:39 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1F7EF5C0115;
 Fri,  9 Jul 2021 05:13:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 09 Jul 2021 05:13:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=7+kfKq
 UC6RKGYsoTiHbpDVjPs22jpUsXWPdaKMbf5fY=; b=rweEVKGIE1jx/j9QRJtulM
 klNc7irM3yISpnOotne1kDKQdNdlTgKxmlEtgo8TbJwZarUrchg713rmJ8gNBhoI
 IrRY2XO4tmOhuje4cnaOV7331rhKEWZG9yh9NjI8kyXUD89SH5igWZsfPDINiLly
 4GR+mfhWpCPlAbj7zASvc9DysWdNUhLK1LuXxc8rQGQ4GTB4Gypfy2i1sEpnqqcI
 3gpFNbs2Qnbkven4VGD5Vw/Dg84PhxKp1IseykPTmcN4TuHScqoVCd5chZ8j/Cf8
 bNVVxG+7FcTbmrFxlxCK6ijKf+Ga5L6AOVZGgfKYafldSuOATF0dZfRmTiM5Cb+A
 ==
X-ME-Sender: <xms:OhPoYG3ssplAEYc98uhF2SyCPeJrZU34Y-rFEgjFNvfz9Jp2BXMeiA>
 <xme:OhPoYJG0CvQyyeLdO1I8d6KIJ8kDi09e3yZ8xzUr3HyMCIFuL09xwSlx5AKe66ofe
 JhjQnD3IHOlv6fZu2A>
X-ME-Received: <xmr:OhPoYO5_1bHaFWzkw2eaUf5x9YEy1tvP-HYT-45cOjsDfQ8JmYGrHcncNIyPPfEM5EL_ixQxleMYXuuq64NxCVB4vOTb8U_VJe8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdeigddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhh
 rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
 gvrhhnpeffudffffetvddvtdduhfevtdehieehleetfeevtdehtdefhfeffefhgfetgefh
 hfenucffohhmrghinhepjhgrihhsthdrrggtrdhjphdplhgrnhgulhgvhidrnhgvthdpug
 gvsghirghnrdhorhhgpdhgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgnecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnse
 hlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:OhPoYH24IiHN19vqg5UCQpTelGIwslQgWLB_FinHY9hWwlYPpMFSiQ>
 <xmx:OhPoYJGfCAOIw-_C9UHGzv5nO_nhYHI4uV4oVgGBdmt0arhxypFOag>
 <xmx:OhPoYA_TmmINYLW4TbxnHTcRWgBeKxybElImPk6deIz4YFFvZ349NA>
 <xmx:OxPoYOSt95pXDwkcIgbe7psjI_DnYI7oysYy4FymSeEOFbjZ-VCsLw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jul 2021 05:13:27 -0400 (EDT)
Date: Fri, 9 Jul 2021 19:13:14 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [RFC PATCH 6/6] dp8393x: Rewrite dp8393x_get() / dp8393x_put()
In-Reply-To: <0ca7c6e7-08e5-fd18-4af8-880d6a3b1da6@ilande.co.uk>
Message-ID: <7aacc8bd-f4ea-11f1-1dfc-994c81863474@linux-m68k.org>
References: <20210703141947.352295-1-f4bug@amsat.org>
 <20210703141947.352295-7-f4bug@amsat.org>
 <d95b2ae6-c849-1b79-36f0-25c5133cca7a@ilande.co.uk>
 <b2cbdfbf-398-3530-b37b-5416aa612af9@linux-m68k.org>
 <d44ae2a3-112a-a84e-5900-bdfa7594cd1c@ilande.co.uk>
 <50e27af7-894f-8eb-426-1b3483fa3345@linux-m68k.org>
 <0ca7c6e7-08e5-fd18-4af8-880d6a3b1da6@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=66.111.4.28; envelope-from=fthain@linux-m68k.org;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Jul 2021, Mark Cave-Ayland wrote:

> > You don't need a rootfs to see the jazzsonic driver messages. But if 
> > you still want one, you could try the mipsel builds from these distros 
> > (not the 64-bit ones):
> > 
> > https://ftp.jaist.ac.jp/pub/Linux/Gentoo/experimental/mips/stages/

When I tried following my own advice I ran into ABI compatibility 
problems. It looks like my kernel build doesn't like those binaries, but 
maybe it's a limitation of the Magnum CPU...

...
Run /bin/sh as init process
request_module: kmod_concurrent_max (0) close to 0 (max_modprobes: 50), for module binfmt-464c, throttling...
request_module: modprobe binfmt-464c cannot be processed, kmod busy with 50 threads for more than 5 seconds now
Kernel panic - not syncing: Requested init /bin/sh failed (error -8).

> > https://landley.net/aboriginal/downloads/binaries/

The binaries from Aboriginal Linux work okay (that is, rootfs.cpio.gz 
found in system-image-mipsel.tar.gz). I got a shell prompt using 
init=/bin/sh but there's no networking support in this minimal busybox 
build unfortunately.

Those binaries have the same ABI as the ones in my busybox build:

$ file busybox
busybox: ELF 32-bit LSB executable, MIPS, MIPS-I version 1 (SYSV), statically linked, stripped

Whereas, Debian/mipsel binaries (like the Gentoo ones) look like this:

$ file busybox
busybox: ELF 32-bit LSB pie executable, MIPS, MIPS32 rel2 version 1 (SYSV), dynamically linked, interpreter /lib/ld.so.1, for GNU/Linux 3.2.0, BuildID[sha1]=febe1809f2ad8dacb067dfd74505b19c6c69ba65, stripped

Eventually I found this page, https://wiki.debian.org/MIPSPort 
which explains that the Debian/mipsel port switched ABI between Debian 8 
and Debian 9.

Unfortunately, the Debian 7 and 8 installer ISO images have no initrd so 
they are no use. I got them from this archive:
https://cdimage.debian.org/cdimage/archive/

Anyway, the Debian 8 binaries look like this, and they work too:

# file bin/dash
bin/dash: ELF 32-bit LSB shared object, MIPS, MIPS-II version 1 (SYSV), dynamically linked, interpreter /lib/ld.so.1, for GNU/Linux 2.6.32, BuildID[sha1]=44f7c1d61d9941db2b1de5dd9629c99e06c30ea8, stripped

> 
> That's true, but then this wouldn't enable testing of Phil's proposed 
> CRC changes. Having a simple shell with ping and wget/curl is a real 
> help here.
> 

To generate network traffic you can get the kernel to configure the NIC 
over DHCP but that does require a different kernel config (see below).

> > > If you can provide me with a link to your vmlinux and rootfs with 
> > > busybox or similar in it, I can take a look to see what is happening 
> > > here. Otherwise it's almost impossible for me to understand and 
> > > debug the problem you are seeing on your setup.
> > > 
> > 
> > Uploading kernels is a hassle (for me) as it brings a trust question 
> > and requires a file hosting service. I really should use PGP and 
> > organise a web of trust but that's very difficult given my rural 
> > location.
> 
> Given that these are only running in a VM I'm not too worried about 
> trust.

Well, untrusted images are okay as long as we are talking about debugging 
QEMU issues that are not exploitable...

With a bit of searching I was able to find a Debian/mipsel 8 rootfs at 
https://github.com/jubinson/debian-rootfs

I can't vouch for it though. It appears to be a page of links to tar files 
in someone's dropbox.

$ sha256sum mipsel-rootfs-20170318T103423Z.tar.gz 
e6ed1871b29317c85170a07621966a013951ced1c5fb8d679b7519996b803fe8  mipsel-rootfs-20170318T103423Z.tar.gz

> I also have a VPS with scp access that I could temporarily grant you 
> access via an SSH public key if that helps?
> 

Thanks for the offer. But that wouldn't help anyone else reading this.

In anycase, I wanted to see whether a real distro could be used. So my 
plan was to cross-compile a Linux kernel and debootstrap a Debian/mipsel 
rootfs disk image. The first stage of a debootstrap installation runs on 
the host...


sudo -s
truncate -s 1G jessie-mipsel.img
mke2fs jessie-mipsel.img 
mount -o loop jessie-mipsel.img /mnt

wget -q -O- https://ftp-master.debian.org/keys/release-8.asc | gpg --import --no-default-keyring --keyring ./debian-release-8.gpg

debootstrap --keyring=./debian-release-8.gpg --foreign --arch=mipsel jessie /mnt http://archive.debian.org/debian/

umount /mnt
exit

git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
cd linux
git checkout linux-5.10.y
make ARCH=mips CROSS_COMPILE=mipsel-linux-gnu- clean jazz_defconfig
scripts/config -d IPV6 -d WIRELESS -d WLAN -d DEBUG_KERNEL -d EXPERT -d CC_OPTIMIZE_FOR_PERFORMANCE -e CC_OPTIMIZE_FOR_SIZE -e ISO9660_FS -m EXT3_FS -e NFS_FS -e IP_PNP -e ROOT_NFS -e NFS_V2 -e IP_PNP_DHCP -e CMDLINE_BOOL -e MIPS_CMDLINE_BUILTIN_EXTEND --set-str CMDLINE "console=ttyS0 root=/dev/nfs rw"
make ARCH=mips CROSS_COMPILE=mipsel-linux-gnu- olddefconfig vmlinux

mkisofs -o vmlinux.iso -J -iso-level 3 vmlinux

qemu-system-mips64el -M magnum -L . -drive if=scsi,unit=0,format=raw,file=jessie-mipsel.img -drive if=scsi,unit=2,readonly=y,media=cdrom,format=raw,file=vmlinux.iso -drive if=scsi,unit=4,readonly=y,media=cdrom,format=raw,file=NetBSD-9.2-arc.iso -global ds1225y.filename=nvram -serial mon:stdio -serial null -net nic,model=dp83932,addr=00:00:00:aa:bb:cc -net bridge


 Actions:

     Start Windows NT 
->   Run a program
     Run setup


scsi(0)cdrom(4)fdisk(0)boot scsi(0)cdrom(2)fdisk(0)vmlinux root=/dev/sda init=/bin/sh


This boots to a shell prompt. Well, so far, so good. Now the rest of the 
debootstrap installation can be completed by the guest...


mount -t devtmpfs none /dev
mount -t proc none /proc
mount -t sysfs none /sys

/debootstrap/debootstrap --second-stage


Unfortunately, this produced a badly corrupted root filesystem and the 
installation failed. Seems to be a bug in either Linux/mipsel or QEMU. 
(Has anyone tried a NetBSD installation?)

I was able to avoid all that block IO entirely by using NFS. That way, the 
installation completed successfully...


mount -o loop jessie-mipsel.img /export/jessie-mipsel
echo "/export/jessie-mipsel 192.168.66.0/24(sync,rw,insecure,no_root_squash,no_subtree_check)" >> /etc/exports
/etc/init.d/nfs start

qemu-system-mips64el -M magnum -L . -drive if=scsi,unit=2,readonly=y,media=cdrom,format=raw,file=vmlinux.iso -drive if=scsi,unit=4,readonly=y,media=cdrom,format=raw,file=NetBSD-9.2-arc.iso -global ds1225y.filename=nvram -serial mon:stdio -serial null -net nic,model=dp83932,addr=00:00:00:aa:bb:cc -net bridge


 Actions:

     Start Windows NT 
->   Run a program
     Run setup


scsi(0)cdrom(4)fdisk(0)boot scsi(0)cdrom(2)fdisk(0)vmlinux ip=dhcp nfsroot=192.168.66.1:/export/jessie-mipsel init=/bin/sh


NetBSD/arc Bootstrap, Revision 1.1 (Wed May 12 13:15:55 UTC 2021)
devopen: scsi(0)cdrom(2)fdisk(0) type disk file vmlinux
5706728+198952 [840960+1017335]=0x767d14
Linux version 5.10.47 (fthain@nippy) (mipsel-linux-gnu-gcc (btc) 6.4.0, GNU ld (btc) 2.28) #2 Fri Jul 9 16:28:12 AEST 2021
ARCH: Microsoft-Jazz
PROMLIB: ARC firmware Version 1 Revision 2
CPU0 revision is: 00000400 (R4000PC)
FPU revision is: 00000500
Primary instruction cache 8kB, VIPT, direct mapped, linesize 16 bytes.
Primary data cache 8kB, direct mapped, VIPT, cache aliases, linesize 16 bytes
Zone ranges:
  DMA      [mem 0x0000000000000000-0x0000000000ffffff]
  Normal   [mem 0x0000000001000000-0x0000000007ffffff]
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000000000000-0x0000000007ffffff]
Initmem setup node 0 [mem 0x0000000000000000-0x0000000007ffffff]
Built 1 zonelists, mobility grouping on.  Total pages: 32512
Kernel command line: console=ttyS0 root=/dev/nfs rw scsi(0)cdrom(2)fdisk(0)vmlinux ip=dhcp nfsroot=192.168.66.1:/export/jessie-mipsel init=/bin/sh
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes, linear)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes, linear)
mem auto-init: stack:off, heap alloc:off, heap free:off
Memory: 123668K/131072K available (4249K kernel code, 234K rwdata, 928K rodata, 212K init, 135K bss, 7404K reserved, 0K cma-reserved)
NR_IRQS: 256
random: get_random_bytes called from start_kernel+0x300/0x4b0 with crng_init=0
Console: colour dummy device 80x25
sched_clock: 32 bits at 100 Hz, resolution 10000000ns, wraps every 21474836475000000ns
Calibrating delay loop... 1404.10 BogoMIPS (lpj=7020544)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
devtmpfs: initialized
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
futex hash table entries: 256 (order: -1, 3072 bytes, linear)
NET: Registered protocol family 16
VDMA: R4030 DMA pagetables initialized.
SCSI subsystem initialized
NET: Registered protocol family 2
IP idents hash table entries: 2048 (order: 2, 16384 bytes, linear)
tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 4096 bytes, linear)
TCP established hash table entries: 1024 (order: 0, 4096 bytes, linear)
TCP bind hash table entries: 1024 (order: 0, 4096 bytes, linear)
TCP: Hash tables configured (established 1024 bind 1024)
UDP hash table entries: 256 (order: 0, 4096 bytes, linear)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes, linear)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
workingset: timestamp_bits=30 max_order=15 bucket_order=0
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
io scheduler mq-deadline registered
io scheduler kyber registered
Console: switching to colour frame buffer device 100x37
Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
printk: console [ttyS0] disabled
serial8250.0: ttyS0 at MMIO 0xe0006000 (irq = 32, base_baud = 115200) is a 16550A
printk: console [ttyS0] enabled
serial8250.0: ttyS1 at MMIO 0xe0007000 (irq = 33, base_baud = 115200) is a 16550A
jazz_esp jazz_esp.0: esp0: regs[(ptrval):0] irq[29]
jazz_esp jazz_esp.0: esp0: is a FAS100A, 40 MHz (ccf=0), SCSI ID 7
random: fast init done
scsi host0: esp
PDC20230-C/20630 VLB ATA controller detected.
scsi host1: pata_legacy
ata1: PATA max PIO2 cmd 0x1f0 ctl 0x3f6 irq 14
scsi 0:0:2:0: CD-ROM            QEMU     QEMU CD-ROM      2.5+ PQ: 0 ANSI: 5
scsi target0:0:2: Beginning Domain Validation
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
scsi target0:0:2: Domain Validation skipping write tests
scsi target0:0:2: Ending Domain Validation
VDMA: Channel 0: Memory error!
scsi 0:0:4:0: CD-ROM            QEMU     QEMU CD-ROM      2.5+ PQ: 0 ANSI: 5
scsi target0:0:4: Beginning Domain Validation
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
scsi target0:0:4: Domain Validation skipping write tests
scsi target0:0:4: Ending Domain Validation
VDMA: Channel 0: Memory error!
scsi host1: pata_legacy
ata2: PATA max PIO4 cmd 0x170 ctl 0x376 irq 15
scsi host1: pata_legacy
ata3: PATA max PIO4 cmd 0x1e8 ctl 0x3ee irq 11
scsi host1: pata_legacy
ata4: PATA max PIO4 cmd 0x168 ctl 0x36e irq 10
scsi host1: pata_legacy
ata5: PATA max PIO4 cmd 0x1e0 ctl 0x3e6 irq 8
scsi host1: pata_legacy
ata6: PATA max PIO4 cmd 0x160 ctl 0x366 irq 12
SONIC ethernet @e0001000, MAC 52:54:00:12:34:56, IRQ 28
serio: i8042 KBD port at 0xe0005000,0xe0005001 irq 30
serio: i8042 AUX port at 0xe0005000,0xe0005001 irq 31
input: AT Raw Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
Sending DHCP requests ., OK
IP-Config: Got DHCP answer from 192.168.66.1, my address is 192.168.66.112
IP-Config: Complete:
     device=eth0, hwaddr=52:54:00:12:34:56, ipaddr=192.168.66.112, mask=255.255.255.0, gw=192.168.66.1
     host=192.168.66.112, domain=local, nis-domain=(none)
     bootserver=0.0.0.0, rootserver=192.168.66.1, rootpath=
     nameserver0=139.130.4.4
input: ImExPS/2 Generic Explorer Mouse as /devices/platform/i8042/serio1/input/input2
VFS: Mounted root (nfs filesystem) on device 0:12.
Freeing prom memory: 376k freed
Freeing prom memory: 60k freed
Freeing prom memory: 4k freed
Freeing unused kernel memory: 212K
This architecture does not have kernel memory protection.
Run /bin/sh as init process
process '/bin/dash' started with executable stack
/bin/sh: 0: can't access tty; job control turned off
# mount -t devtmpfs none /dev
# mount -t proc none /proc
# mount -t sysfs none /sys
# /debootstrap/debootstrap --second-stage
...
# ping -c3 192.168.66.1
PING 192.168.66.1 (192.168.66.1) 56(84) bytes of data.
64 bytes from 192.168.66.1: icmp_seq=1 ttl=64 time=10.0 ms
64 bytes from 192.168.66.1: icmp_seq=2 ttl=64 time=0.000 ms
64 bytes from 192.168.66.1: icmp_seq=3 ttl=64 time=0.000 ms

--- 192.168.66.1 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2030ms
rtt min/avg/max/mdev = 0.000/3.333/10.000/4.714 ms
# 

After the debootstrap command completes, the last steps are manual 
configuration, as per the usual debootstrap procedure:
https://wiki.debian.org/Debootstrap
https://gist.github.com/varqox/42e213b6b2dde2b636ef

Note that this only _barely_ works. A slightly larger vmlinux breaks the 
bootloader, and a slightly longer boot command breaks ARC.

