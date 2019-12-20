Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBEE1274A5
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 05:32:21 +0100 (CET)
Received: from localhost ([::1]:50640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ii9xc-0006w8-Dw
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 23:32:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58030)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@telegraphics.com.au>) id 1ii9qM-0004aq-QM
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 23:24:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>) id 1ii9qL-00059m-JM
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 23:24:50 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:34570)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>)
 id 1ii9qL-00058O-D5; Thu, 19 Dec 2019 23:24:49 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id 6735A2290B;
 Thu, 19 Dec 2019 23:24:47 -0500 (EST)
Date: Fri, 20 Dec 2019 15:24:48 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>, 
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>
Subject: Re: [PATCH 00/10] Fixes for DP8393X SONIC device emulation
In-Reply-To: <CAL1e-=iTBxqCsNCbGpONdewE4uTDG=OAV36fF_Cq9=i6KQhMaA@mail.gmail.com>
Message-ID: <alpine.LNX.2.21.1.1912200912360.8@nippy.intranet>
References: <cover.1576286757.git.fthain@telegraphics.com.au>
 <CAL1e-=gwxSDa1NSevcCbjG1r5vg6A49Kg_FP2EL1jW+BMn7Ghw@mail.gmail.com>
 <alpine.LNX.2.21.1.1912150915460.8@nippy.intranet>
 <CAL1e-=hRs0EMz7ZTt+GXMfyHW8arq-h-m1Dzd3jz+vqP82+zjA@mail.gmail.com>
 <CAL1e-=iTBxqCsNCbGpONdewE4uTDG=OAV36fF_Cq9=i6KQhMaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 98.124.60.144
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
Cc: Jason Wang <jasowang@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 15 Dec 2019, Aleksandar Markovic wrote:

> 
> Herve,
> 
> Is there any way for us to come up with an equivalent or at least
> approximate scenario for Jazz machines?
> 
> Regards,
> Aleksandar
> 

That would be useful in general, but in this case I think it might be 
better to test NetBSD, since I have already tested Linux. (I had to fix 
some bugs in the Linux sonic driver.)

I tried to boot NetBSD/arc but failed. I got a blue screen when I typed 
"cd:boot" at the "Run A Program" prompt in the ARC menu.

$ ln -s NTPROM.RAW mipsel_bios.bin
$ mips64el-softmmu/qemu-system-mips64el -M magnum -L . 
-drive if=scsi,unit=2,media=cdrom,format=raw,file=NetBSD-8.1-arc.iso 
-global ds1225y.filename=nvram -global ds1225y.size=8200
qemu-system-mips64el: g364: invalid read at [0000000000102000]
$ 

Any help would be appreciated.

