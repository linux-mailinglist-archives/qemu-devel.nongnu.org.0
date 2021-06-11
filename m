Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 797FF3A499C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 21:50:05 +0200 (CEST)
Received: from localhost ([::1]:40166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrnAK-0004bE-HT
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 15:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pauldzim@gmail.com>)
 id 1lrn8x-0003gT-SR
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 15:48:39 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:40794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pauldzim@gmail.com>)
 id 1lrn8v-00063Q-Pi
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 15:48:39 -0400
Received: by mail-il1-x12c.google.com with SMTP id b14so6211613ilq.7
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 12:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SEii9K2Y1Q4NJuxPdchLfGN1+kdHTiKc1K25VPKvmhE=;
 b=JCM1qXnvN8YbPnUmeuqdxRy1Wv3r2wm+ZEuBD3S5QnZU6i+dgzaf8uOFhOsgJmQCcQ
 U7mBqfqhMTtD0MV8GE7bnyzMPQxr/v4cwud+kkj5Fcjd1/a/9C7786GID/WqzvqagUIG
 AiwL2cY8or1/CYKot5cgW1udjGjsiZQUCqzb+3IxSGtQu5MB/VrPsUOodpXDXon4xhON
 vbEROf6vJLrMW49JQu3ZicIygPwVRC9HiGniWFDwkmkseqdSm9yQ7Gdw5t16fY08y6td
 bTrq3DypmZkKtI0ssLSmVcZRwU2o33B6+GZPfCDDcIkEc8ZZZ6YKjFnGCkLenbjLFAAb
 CbRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SEii9K2Y1Q4NJuxPdchLfGN1+kdHTiKc1K25VPKvmhE=;
 b=YlS1ljVo7LgYFLm+CQJtcS17rjlBPQ2pEeq2F2Et/kDzavOMTjz6LKegLkCXwU6Eka
 b6ftyblt/EspsNV4ncCPyJxrjjINhxNC00XaJLH22VuOyIcudKon8H4eIJYCwKdf5daz
 ebxxyPgEzmSvRKgdk6KdP9gskUwzQdQu+vjI4Tr6HMLEEV7XrAWipo64nveXJh0lPcfV
 PzgnRE70KwqFG8OkuOQZ9KgmHjjC/GdTLnGqvRCgZgvW1d80s7Nixzs7xf1p9PuZK2pn
 GlRY499ID9ZU+wRbJK5yBpDk174tZ9rn+3m98ynE5JjLFqSQKoe6RPJNdiJlf1KsIgcT
 4vHQ==
X-Gm-Message-State: AOAM5314YzkaBcbAtulxc/ve7vyLSG+xai+/7Ok0zZvlQkJ/b6U6ML8P
 rbqzxTT49RB8R3CvIWk2Oi4/1ztDvPjkf8anod4=
X-Google-Smtp-Source: ABdhPJxhpV4S1xaouaDZRX7rocS04CXlKrIfjhnnTu7YNueLD7In4Kk8qvFw8M6J5b9+MqeEPZE8I4ncGXYDjkMs5Fw=
X-Received: by 2002:a92:d1c3:: with SMTP id u3mr4557843ilg.190.1623440915616; 
 Fri, 11 Jun 2021 12:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <reply-a8857b5ced579c7499da46ef969a0b87@gitlab.com>
 <issue_86599308@gitlab.com> <note_597531265@gitlab.com>
 <note_598004557@gitlab.com>
 <CAAdtpL4utd6p3_Rg+h3rFt=V2sKv288G11dNqjDU21YitC2q-A@mail.gmail.com>
In-Reply-To: <CAAdtpL4utd6p3_Rg+h3rFt=V2sKv288G11dNqjDU21YitC2q-A@mail.gmail.com>
From: Paul Zimmerman <pauldzim@gmail.com>
Date: Fri, 11 Jun 2021 12:48:10 -0700
Message-ID: <CADBGO7-KMxXA4sXGdztNfoK2h6Jim6Kyi=yuLLC083jAv_sppw@mail.gmail.com>
Subject: Re: QEMU | USB Ethernet device (RNDIS) does not work on several
 tested operating systems (#198)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=pauldzim@gmail.com; helo=mail-il1-x12c.google.com
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, QEMU / QEMU
 <incoming+a8857b5ced579c7499da46ef969a0b87@incoming.gitlab.com>,
 Paul Zimmerman <paulz@synopsys.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I will take a look. Might take me a couple of days to get to it though.

On Fri, Jun 11, 2021 at 4:10 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Cc'ing Paul Zimmerman for the hcd-dwc2 model.
>
> On Thu, Jun 10, 2021 at 2:10 PM programmingkidx (@programmingkidx) wrote:
> > =E8=99=8E=E6=B8=B8 commented:
> >
> > The same problem occurred in my Raspberry Pi 3b+ emulation.
> >
> > Host: Debian 10 x86_64. Guest rootfs: https://download.canaan-creative.=
com/avalon921/openwrt/latest/rpi3-modelb/openwrt-brcm2708-bcm2710-rpi-3-ext=
4-sdcard.img.gz Guest kernel & dtd: https://github.com/dhruvvyas90/qemu-rpi=
-kernel/tree/master/native-emulation
> >
> > Command:
> >
> > /usr/local/bin/qemu-system-aarch64 -M raspi3 -append "rw earlyprintk lo=
glevel=3D8 console=3DttyAMA0,115200 dwc_otg.lpm_enable=3D0 root=3D/dev/mmcb=
lk0p2 rootdelay=3D1" -dtb ../qemu-rpi-kernel/native-emulation/dtbs/bcm2710-=
rpi-3-b-plus.dtb -drive file=3Davalon.img,format=3Draw,if=3Dsd,id=3Droot -k=
ernel ../qemu-rpi-kernel/native-emulation/5.4.51\ kernels/kernel8.img -m 1G=
 -smp 4 -usb -device usb-mouse -device usb-kbd -nographic -no-reboot -devic=
e usb-net,netdev=3Deth0 -netdev tap,id=3Deth0,ifname=3Davalon,script=3Dno,d=
ownscript=3Dno Output:
> >
> > [ 0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034] [ 0=
.000000] Linux version 5.4.51-v8+ (dom@buildbot) (gcc version 5.4.0 2016060=
9 (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.9)) #1333 SMP PREEMPT Mon Aug 10 16:5=
8:35 BST 2020 [ 0.000000] Machine model: Raspberry Pi 3 Model B+
> >
> > ...
> >
> > usbnet: failed control transaction: request 0x8006 value 0x600 index 0x=
0 length 0xa usbnet: failed control transaction: request 0x8006 value 0x600=
 index 0x0 length 0xa usbnet: failed control transaction: request 0x8006 va=
lue 0x600 index 0x0 length 0xa [ 3.688532] usb 1-1.3: New USB device found,=
 idVendor=3D0525, idProduct=3Da4a2, bcdDevice=3D 0.00 [ 3.688739] usb 1-1.3=
: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D10 [ 3.68945=
4] usb 1-1.3: Product: RNDIS/QEMU USB Network Device [ 3.689563] usb 1-1.3:=
 Manufacturer: QEMU [ 3.689639] usb 1-1.3: SerialNumber: 1-1.3
> >
> > ...
> >
> > root@OpenWrt:/# ifconfig -a lo Link encap:Local Loopback inet addr:127.=
0.0.1 Mask:255.0.0.0 UP LOOPBACK RUNNING MTU:65536 Metric:1 RX packets:156 =
errors:0 dropped:0 overruns:0 frame:0 TX packets:156 errors:0 dropped:0 ove=
rruns:0 carrier:0 collisions:0 txqueuelen:1000 RX bytes:9836 (9.6 KiB) TX b=
ytes:9836 (9.6 KiB)
> >
> > root@OpenWrt:/# ip a 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqu=
eue state UNKNOWN qlen 1000 link/loopback 00:00:00:00:00:00 brd 00:00:00:00=
:00:00 inet 127.0.0.1/8 scope host lo valid_lft forever preferred_lft forev=
er Finally, there is no nic available in guest OS.

