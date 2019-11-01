Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4678DEC14E
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Nov 2019 11:37:14 +0100 (CET)
Received: from localhost ([::1]:37470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iQUIr-0004bD-BP
	for lists+qemu-devel@lfdr.de; Fri, 01 Nov 2019 06:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45828)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <programmingkidx@gmail.com>) id 1iQUGf-0002b8-SS
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 06:34:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <programmingkidx@gmail.com>) id 1iQUGe-0003u8-7Y
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 06:34:57 -0400
Received: from mail-yw1-xc32.google.com ([2607:f8b0:4864:20::c32]:37399)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <programmingkidx@gmail.com>)
 id 1iQUGd-0003tV-VW
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 06:34:56 -0400
Received: by mail-yw1-xc32.google.com with SMTP id v84so3312920ywc.4
 for <qemu-devel@nongnu.org>; Fri, 01 Nov 2019 03:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:date:references
 :to:in-reply-to:message-id;
 bh=mWJBb30/VHnm4uKxtWGtYNB+CyZGyOXRfZ9dnNq4V8w=;
 b=ldmw9TVpfENLOitB2J52JxSTQxIqKPmnlaRfMAs0CDKgd/N9FA+p7ZZrNxzfTS7jpF
 5IjbKsZXh06E1gyIqhr6EdVyPmFUVjBXiVUi2HwneEZPOa18LFIcP/mKn/Vb9eWBGhtg
 muo5Qrj9QPuWBI55ZI96IukxCh2QLM26HoOvdagYWs146NmkA5oqVG80pEnSrZrBKpJq
 yvAd8oPmwMfsARC5fLPX54Y2lMBRfPZ32/ysVCGM03kQK5ovUWKCYmq9G8coVR2EcqSd
 Xzfc6Ys/ckZUEZEF4iZgvl9Rp+ME6abWtiyCeDS1roWdQZPyqj1+zerfa3BED2bQe4g/
 60Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:date:references:to:in-reply-to:message-id;
 bh=mWJBb30/VHnm4uKxtWGtYNB+CyZGyOXRfZ9dnNq4V8w=;
 b=N+8QaLtQy6Lgi3HE25NT56ZU+FxWN98hBuLFn3wn9sH5W9nDOnfzYrK6/dqLn7myQR
 Zm9mX0dnNcrOr0+GwXV+x0gIcby3yJbRTrii9TP/IwpI3L3/JFKMeLCgUNyoBL6lpu0H
 CJAfgeiXllTlLZQt88t8nn33m2nNOvqnIxHnh6Mf1e1MtlMZk1UJ08ElENS7QarUepTx
 gu+XKXZXHG+pGuCu1UYvR3czC4Dt8Glc1ZaR1ByB/3GUmiYpCjz29fCqNLmccUgAGEL+
 HbulDcdAVwFxpoGKoUc611RqNFHJDz/OiCTNvrcsR9cFeLnphmLf2ketmcAhmv1upa97
 3QFw==
X-Gm-Message-State: APjAAAVwP+BlmB74Y6Ko5+0wa27t+BRHjGOBFK/DgSirWOhhV9II9hII
 Ob/VukYGUR3Cjc06gCLa1ou22RhO
X-Google-Smtp-Source: APXvYqxWIrq+iZzmbeXK4TuRdjUN0ns5i+ZAUt71nsRcGWWblwLWtTbXBf8wKo/wGWShquPZKamDWw==
X-Received: by 2002:a0d:cc91:: with SMTP id o139mr7895296ywd.373.1572604495050; 
 Fri, 01 Nov 2019 03:34:55 -0700 (PDT)
Received: from [192.168.0.7] (d14-69-20-184.try.wideopenwest.com.
 [69.14.184.20])
 by smtp.gmail.com with ESMTPSA id k188sm2939775ywe.41.2019.11.01.03.34.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 01 Nov 2019 03:34:54 -0700 (PDT)
From: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [Bug 1850570] Re: Cannot use usb-host on Mac OS
Date: Fri, 1 Nov 2019 06:34:53 -0400
References: <mailman.214.1572564951.13345.qemu-devel@nongnu.org>
To: qemu Developers <qemu-devel@nongnu.org>,
 1850570@bugs.launchpad.net
In-Reply-To: <mailman.214.1572564951.13345.qemu-devel@nongnu.org>
Message-Id: <47A92732-E94E-4DD9-8D47-E8DCF4E364B1@gmail.com>
X-Mailer: Apple Mail (2.3273)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c32
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


> On Oct 31, 2019, at 7:35 PM, qemu-devel-request@nongnu.org wrote:
>=20
> Message: 10
> Date: Thu, 31 Oct 2019 18:39:11 -0000
> From: John Canada <1850570@bugs.launchpad.net>
> To: qemu-devel@nongnu.org
> Subject: [Bug 1850570] Re: Cannot use usb-host on Mac OS
> Message-ID:
> 	<157254715118.3076.2379100780378521691.malone@gac.canonical.com>
> Content-Type: text/plain; charset=3D"utf-8"
>=20
> Yes, I tried running as root.  I also tried it on a different computer
> that is running Mac OS 10.13, and it gave the same errors.
>=20
> --=20
> You received this bug notification because you are a member of qemu-
> devel-ml, which is subscribed to QEMU.
> https://bugs.launchpad.net/bugs/1850570
>=20
> Title:
>  Cannot use usb-host on Mac OS
>=20
> Status in QEMU:
>  New
>=20
> Bug description:
>  Usb-host will not work on Mac OS 10.15.  Qemu runs, though it gives
>  these errors and the drive does not show up.  Also, when Qemu is
>  starting the drive ejects and remounts twice. Qemu built with
>  ./configure --target-list=3Di386-softmmu,x86_64-softmmu --enable-sdl
>  --disable-cocoa --enable-sdl-image.
>=20
>  qemu-system-i386 image.qcow -usb -device usb-kbd  -device =
usb-host,vendorid=3D0x0781,productid=3D0x5571
>  libusb: error [darwin_claim_interface] USBInterfaceOpen: another =
process has device opened for exclusive access
>  libusb: error [darwin_claim_interface] interface not found
>  libusb: error [darwin_claim_interface] interface not found
>  libusb: error [darwin_claim_interface] interface not found
>  libusb: error [darwin_claim_interface] interface not found
>  libusb: error [darwin_claim_interface] interface not found
>  libusb: error [darwin_claim_interface] interface not found
>  libusb: error [darwin_claim_interface] interface not found
>  libusb: error [darwin_claim_interface] interface not found
>  libusb: error [darwin_claim_interface] interface not found
>  libusb: error [darwin_claim_interface] interface not found
>  libusb: error [darwin_claim_interface] interface not found
>  libusb: error [darwin_claim_interface] interface not found
>  libusb: error [darwin_claim_interface] interface not found
>  libusb: error [darwin_claim_interface] interface not found
>  libusb: error [darwin_claim_interface] interface not found
>  libusb: error [darwin_claim_interface] USBInterfaceOpen: another =
process has device opened for exclusive access
>  libusb: error [darwin_claim_interface] interface not found
>  libusb: error [darwin_claim_interface] interface not found
>  libusb: error [darwin_claim_interface] interface not found
>  libusb: error [darwin_claim_interface] interface not found
>  libusb: error [darwin_claim_interface] interface not found
>  libusb: error [darwin_claim_interface] interface not found
>  libusb: error [darwin_claim_interface] interface not found
>  libusb: error [darwin_claim_interface] interface not found
>  libusb: error [darwin_claim_interface] interface not found
>  libusb: error [darwin_claim_interface] interface not found
>  libusb: error [darwin_claim_interface] interface not found
>  libusb: error [darwin_claim_interface] interface not found
>  libusb: error [darwin_claim_interface] interface not found
>  libusb: error [darwin_claim_interface] interface not found
>  libusb: error [darwin_claim_interface] interface not found
>=20
> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1850570/+subscriptions


Try this. Unplug the USB device. Plug it back in, and as fast as you can =
start QEMU.=20

My theory is another program might be using the device. This could be =
Spotlight trying to index the drive.

Another possibility is libusb is not compatible with Mac OS 10.13 yet.

Do you have another computer that runs Mac OS 10.12 or under that you =
can test on?



