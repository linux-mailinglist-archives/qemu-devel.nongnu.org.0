Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C0C3A2F72
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 17:37:07 +0200 (CEST)
Received: from localhost ([::1]:58490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrMjy-0006q6-2i
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 11:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pintu.ping@gmail.com>)
 id 1lrMhw-0001tg-9d; Thu, 10 Jun 2021 11:35:00 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:45638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pintu.ping@gmail.com>)
 id 1lrMhu-0007Xh-AV; Thu, 10 Jun 2021 11:35:00 -0400
Received: by mail-ed1-x52a.google.com with SMTP id r7so19176157edv.12;
 Thu, 10 Jun 2021 08:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uAK+m3Pb64IW/t5OyzZyrSx3CkM27j+d+i398SdgIow=;
 b=Tj9VW0xPBMQKFOHR6Qc8vMbIyjB4i0t9DLJGMcke0HvUCjCVbnUJjhnZPKgwQHiDwp
 OEWIZudf3MP82hyGOgIQIFQJoKiZ/LLxMFDbF7nkekEqLI5T4F4EoXoc5rYamSx1Gw+I
 XmSCUOqsJqsr9Q3qIJQa2ONziwS5W7a/7ThfdVXK107MrDu8ht2ZYwQ5ymR4DUQFlm0e
 SPC8KNz1cJsiKY+tfXc/eG+Pfo3vsx+dH/8g47FiGwyIrT1HotvLcbaA9HDbxtzzV4XQ
 ETt/J08GKQwkzOyBbAWlK6lM2cBUIZijz98nr17nH6iCLoLfVK97dI4gZgOHWJODXkS4
 HDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uAK+m3Pb64IW/t5OyzZyrSx3CkM27j+d+i398SdgIow=;
 b=rpK1aPO2ofYIHaYnhE1TtZazOBRFbZySBHi2il8TotcQ3VVmkJ7s0S0HVaDPSsbHhY
 pCBS/TxmITpEL67aYHt1wJUYA2SDwtDPK4HExSKFU/7veRCiGS6zFOsr5cFBfJHC/jDV
 /2JdcPkXH9Esfh9FAGbAZK/s0A3qKtWBLK4FOpxYwa5gzFTAOVDUj3zWRtqpSy49Zt6b
 jcEEqk97S0aPqjrnW+jE/3PPFVm1kbKCptbljLF5xZgGrorL8st7tcoUpdoDgc03DASi
 ss0LJvy/yG6hnpYV+HAkM0BHXPjJ6YXPqc+bBdP17kC1TgqhNWKBQ0H62/SDNIUpe2YI
 ULUg==
X-Gm-Message-State: AOAM5339azvVTNAFtVF678FMmdFOFXShjnIUBnroSyVb+kiojYLP7hnc
 ECZERNfGxzqmXPGvvE3dxtaKTXhIu51fi3cR5C8=
X-Google-Smtp-Source: ABdhPJx5dVDbvX7eNFd+7rFh7ulxngOK6Lqu3UqQQOb46FIQcdONBfUlcCySppcDmNWXsC0pK5Bmdxlk/+CO7mgRSCI=
X-Received: by 2002:a05:6402:368:: with SMTP id s8mr13769edw.129.1623339295136; 
 Thu, 10 Jun 2021 08:34:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLiRDZ9M4n3uh=i6FpHXoVEWMHpt0At8YaydrOM=LvSvdg@mail.gmail.com>
 <295072107.94766.1623262940865.JavaMail.zimbra@nod.at>
 <CAOuPNLhPiVgi5Q343VP-p7vwBtA1-A5jt8Ow4_2eF4ZwsiA+eQ@mail.gmail.com>
 <361047717.98543.1623333152629.JavaMail.zimbra@nod.at>
In-Reply-To: <361047717.98543.1623333152629.JavaMail.zimbra@nod.at>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Thu, 10 Jun 2021 21:04:43 +0530
Message-ID: <CAOuPNLguWzOPfoiutMy=zLYfH1-67=i0e-SL_MyhDgdYE70vQg@mail.gmail.com>
Subject: Re: qemu: arm: mounting ubifs using nandsim on busybox
To: Richard Weinberger <richard@nod.at>, edk2-devel <edk2-devel@lists.01.org>,
 devel@edk2.groups.io, qemu-block@nongnu.org, qemu-devel@nongnu.org, 
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=pintu.ping@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Jun 2021 at 19:22, Richard Weinberger <richard@nod.at> wrote:
>
> Pintu,
>
> ----- Urspr=C3=BCngliche Mail -----
> > Von: "Pintu Agarwal" <pintu.ping@gmail.com>
> >> nandsim works as expected. It creates a new and *erased* NAND for you.
> >> So you have no UBI volumes. Therfore UBIFS cannot be mounted.
> >> I suggest creating a tiny initramfs that creates UBI volumes before mo=
unting
> >> UBIFS on
> >> one of the freshly created (and empty) volumes.
> >>
> > oh sorry I forgot to mention this.
> > I am able to create and update volumes manually after booting the
> > system with initramfs.
> > {{{
> > Creating rootfs volume:
> > mknod /dev/ubi0 c 250 0
> > mknod /dev/ubi0_0 c 250 1
> > ubiattach /dev/ubi_ctrl -m 2
> > ubimkvol /dev/ubi0 -N rootfs -m
> > ubiupdatevol /dev/ubi0_0 ubifs-rootfs.img
> > mount -t ubifs ubi0:rootfs ubi-root/
> > }}}
> >
> > But I wanted to do all these automatically during boot time itself.
> > Also I wanted to use ubinize.cfg as is from the original system and
> > simulate everything using qemu and nadsim (if possible)
> > So I thought it must be possible by setting some parameters in qemu suc=
h as:
> > mtdparts=3Dnand:,
> > -device nand,chip_id=3D0x39,drive=3Dmtd0,
> > -drive if=3Dmtd,file=3D./ubi-boot.img,id=3Dmtd0,
> > anything else ?
>
> Well, this has nothing to do with nandsim.
> If qemu can emulate a NAND chip (plus a controller) all you need is a dri=
ver on the Linux side.
Okay let me add qemu guys here.
I am not sure which driver is required from Linux side. I thought it
is nandsim only.
Is it some existing driver, or we need to develop a new driver on our own ?
I think it is not able to find the required driver..
I see in the boot log that it is detecting Toshiba nand driver:
=3D=3D=3D> nand: Toshiba NAND 128MiB 1,8V 8-bit

Also the root volume seems empty.
=3D=3D=3D> ubi0: empty MTD device detected
How to fill the root volume at boot time ?


These are the commands I am using:
$ mkfs.ubifs -r _install -m 512 -e 15872 -c 5000 -o ubifs-rootfs.img
$ ubinize -o ubi-boot.img -m 512 -p 16KiB -s 256 ubiconfig.cfg
$ qemu-system-arm -M vexpress-a9 -m 512M -kernel
linux/arch/arm/boot/zImage -dtb
linux/arch/arm/boot/dts/vexpress-v2p-ca9.dtb -append
"console=3DttyAMA0,115200 ubi.mtd=3D2 root=3D/dev/mtdblock2 rootfstype=3Dub=
ifs
mtdparts=3Dnand:-(rootfs)" -device nand,chip_id=3D0x39,drive=3Dmtd0 -drive
if=3Dmtd,file=3D./ubi-boot.img,id=3Dmtd0 -nographic -smp 4

Any corrections here ?

$ cat ubiconfig.cfg
[rootfs]
mode=3Dubi
image=3D./ubifs-rootfs.img
vol_id=3D0
vol_type=3Ddynamic
vol_name=3Drootfs
vol_alignment=3D1
vol_flags=3Dautoresize


But I am still getting this error:
{{{
List of all partitions:
1f00          131072 mtdblock0
 (driver?)
1f01           32768 mtdblock1
 (driver?)
1f02          131072 mtdblock2
 (driver?)
No filesystem could mount root, tried:
 ubifs
Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(3=
1,2)
[...]
}}}

Some log references below:
[....]
Using buffer write method
Concatenating MTD devices:
(0): "40000000.flash"
(1): "40000000.flash"
into device "40000000.flash"
physmap-flash 48000000.psram: physmap platform flash device: [mem
0x48000000-0x49ffffff]
[nandsim] warning: read_byte: unexpected data output cycle, state is
STATE_READY return 0x0
[nandsim] warning: read_byte: unexpected data output cycle, state is
STATE_READY return 0x0
[nandsim] warning: read_byte: unexpected data output cycle, state is
STATE_READY return 0x0
[nandsim] warning: read_byte: unexpected data output cycle, state is
STATE_READY return 0x0
[nandsim] warning: read_byte: unexpected data output cycle, state is
STATE_READY return 0x0
[nandsim] warning: read_byte: unexpected data output cycle, state is
STATE_READY return 0x0
nand: device found, Manufacturer ID: 0x98, Chip ID: 0x39
nand: Toshiba NAND 128MiB 1,8V 8-bit
nand: 128 MiB, SLC, erase size: 16 KiB, page size: 512, OOB size: 16
flash size: 128 MiB
page size: 512 bytes
OOB area size: 16 bytes
sector size: 16 KiB
pages number: 262144
pages per sector: 32
bus width: 8
bits in sector size: 14
bits in page size: 9
bits in OOB size: 4
flash size with OOB: 135168 KiB
page address bytes: 4
sector address bytes: 3
options: 0x42
Scanning device for bad blocks
Creating 1 MTD partitions on "NAND 128MiB 1,8V 8-bit":
0x000000000000-0x000008000000 : "NAND simulator partition 0"
[nandsim] warning: CONFIG_MTD_PARTITIONED_MASTER must be enabled to
expose debugfs stuff
[....]
ubi0: attaching mtd2
ubi0: scanning is finished
ubi0: empty MTD device detected
ubi0: attached mtd2 (name "NAND simulator partition 0", size 128 MiB)
ubi0: PEB size: 16384 bytes (16 KiB), LEB size: 15872 bytes
ubi0: min./max. I/O unit sizes: 512/512, sub-page size 256
ubi0: VID header offset: 256 (aligned 256), data offset: 512
ubi0: good PEBs: 8192, bad PEBs: 0, corrupted PEBs: 0
ubi0: user volume: 0, internal volumes: 1, max. volumes count: 92
ubi0: max/mean erase counter: 0/0, WL threshold: 4096, image sequence
number: 2149713893
ubi0: available PEBs: 8028, total reserved PEBs: 164, PEBs reserved
for bad PEB handling: 160
[...]

Thanks,
Pintu

