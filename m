Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 635313A40E6
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 13:11:22 +0200 (CEST)
Received: from localhost ([::1]:44846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrf4L-00086q-DU
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 07:11:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lrf3d-0007MP-0D
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 07:10:37 -0400
Received: from mail-oi1-f174.google.com ([209.85.167.174]:36597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lrf3b-0004xF-8y
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 07:10:36 -0400
Received: by mail-oi1-f174.google.com with SMTP id r16so5094743oiw.3
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 04:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yJowsVTkyQI2Afien57O2Vl9Aiz5cRblSNzrEhjg618=;
 b=KlbwnETqISXB2xAiufmTM8qThzHRC7TNZcfJIq7InivQxPLDQBc7cyJCBl8O9EwfhF
 0ZlPY05hzk4mEDoa8ufqraxHZDUB+rcTUpdAd5IbAynF8ycM4hvx8ifgkGjEU1uLnwsF
 38jW116lh61fcTUUmWCfrDphFHp5cEkeJ1CroCV3K/iv0hxBgvj9bgjDbDp2m+KQAbfl
 p0AbTQ9gpF3cDa5psM1Sz/uRmeKpXrmL6ve+m0iCp7WDzS23gAwd6qOof8L1s7P+05BG
 XOBmI8KWNqfX73UcFnB+r77XMbZoajvL9/IMiMhwNsDwDco67abf5tlkCeQoi6JxEY/e
 nqzA==
X-Gm-Message-State: AOAM533CqxvIP2jhsiVb8P53ICv75IbaoI7j9fgPRRlhVwUIdlMuE9FI
 izGGU2WzHw8Xk3t2A9ZozF+2Fs8Ogc6HKQBPptKSaQUWEmw=
X-Google-Smtp-Source: ABdhPJwrKn9WbKwXbo2mBQaJ/Z8aPPTBs+KdbMzZ/RJOJkL9gZzvHyE1b/cV5mTHtxKN449mpuoIkdc4fu6bZIDEb/I=
X-Received: by 2002:aca:fd44:: with SMTP id b65mr13469848oii.175.1623409834010; 
 Fri, 11 Jun 2021 04:10:34 -0700 (PDT)
MIME-Version: 1.0
References: <reply-a8857b5ced579c7499da46ef969a0b87@gitlab.com>
 <issue_86599308@gitlab.com> <note_597531265@gitlab.com>
 <note_598004557@gitlab.com>
In-Reply-To: <note_598004557@gitlab.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Fri, 11 Jun 2021 13:10:22 +0200
Message-ID: <CAAdtpL4utd6p3_Rg+h3rFt=V2sKv288G11dNqjDU21YitC2q-A@mail.gmail.com>
Subject: Re: QEMU | USB Ethernet device (RNDIS) does not work on several
 tested operating systems (#198)
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.174;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f174.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paul Zimmerman <paulz@synopsys.com>, QEMU / QEMU
 <incoming+a8857b5ced579c7499da46ef969a0b87@incoming.gitlab.com>,
 Paul Zimmerman <pauldzim@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Paul Zimmerman for the hcd-dwc2 model.

On Thu, Jun 10, 2021 at 2:10 PM programmingkidx (@programmingkidx) wrote:
> =E8=99=8E=E6=B8=B8 commented:
>
> The same problem occurred in my Raspberry Pi 3b+ emulation.
>
> Host: Debian 10 x86_64. Guest rootfs: https://download.canaan-creative.co=
m/avalon921/openwrt/latest/rpi3-modelb/openwrt-brcm2708-bcm2710-rpi-3-ext4-=
sdcard.img.gz Guest kernel & dtd: https://github.com/dhruvvyas90/qemu-rpi-k=
ernel/tree/master/native-emulation
>
> Command:
>
> /usr/local/bin/qemu-system-aarch64 -M raspi3 -append "rw earlyprintk logl=
evel=3D8 console=3DttyAMA0,115200 dwc_otg.lpm_enable=3D0 root=3D/dev/mmcblk=
0p2 rootdelay=3D1" -dtb ../qemu-rpi-kernel/native-emulation/dtbs/bcm2710-rp=
i-3-b-plus.dtb -drive file=3Davalon.img,format=3Draw,if=3Dsd,id=3Droot -ker=
nel ../qemu-rpi-kernel/native-emulation/5.4.51\ kernels/kernel8.img -m 1G -=
smp 4 -usb -device usb-mouse -device usb-kbd -nographic -no-reboot -device =
usb-net,netdev=3Deth0 -netdev tap,id=3Deth0,ifname=3Davalon,script=3Dno,dow=
nscript=3Dno Output:
>
> [ 0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034] [ 0.0=
00000] Linux version 5.4.51-v8+ (dom@buildbot) (gcc version 5.4.0 20160609 =
(Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.9)) #1333 SMP PREEMPT Mon Aug 10 16:58:=
35 BST 2020 [ 0.000000] Machine model: Raspberry Pi 3 Model B+
>
> ...
>
> usbnet: failed control transaction: request 0x8006 value 0x600 index 0x0 =
length 0xa usbnet: failed control transaction: request 0x8006 value 0x600 i=
ndex 0x0 length 0xa usbnet: failed control transaction: request 0x8006 valu=
e 0x600 index 0x0 length 0xa [ 3.688532] usb 1-1.3: New USB device found, i=
dVendor=3D0525, idProduct=3Da4a2, bcdDevice=3D 0.00 [ 3.688739] usb 1-1.3: =
New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D10 [ 3.689454]=
 usb 1-1.3: Product: RNDIS/QEMU USB Network Device [ 3.689563] usb 1-1.3: M=
anufacturer: QEMU [ 3.689639] usb 1-1.3: SerialNumber: 1-1.3
>
> ...
>
> root@OpenWrt:/# ifconfig -a lo Link encap:Local Loopback inet addr:127.0.=
0.1 Mask:255.0.0.0 UP LOOPBACK RUNNING MTU:65536 Metric:1 RX packets:156 er=
rors:0 dropped:0 overruns:0 frame:0 TX packets:156 errors:0 dropped:0 overr=
uns:0 carrier:0 collisions:0 txqueuelen:1000 RX bytes:9836 (9.6 KiB) TX byt=
es:9836 (9.6 KiB)
>
> root@OpenWrt:/# ip a 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueu=
e state UNKNOWN qlen 1000 link/loopback 00:00:00:00:00:00 brd 00:00:00:00:0=
0:00 inet 127.0.0.1/8 scope host lo valid_lft forever preferred_lft forever=
 Finally, there is no nic available in guest OS.

