Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D61740118A
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 22:35:05 +0200 (CEST)
Received: from localhost ([::1]:45148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMyr1-0000vw-KG
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 16:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1mMypr-0008Ca-CT
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 16:33:51 -0400
Received: from mout.gmx.net ([212.227.17.22]:53933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1mMypp-0005Nj-7K
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 16:33:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1630874024;
 bh=ItNwfd5QrlJvqaqq0YfVWS2FcHJQ8dkUltawpxzlB+g=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=MHWTu7USjHPHKwFCQLPjhCq27humXYBDYCsZLi/BAxqd79bZYvSJ4SCUOQm0RQu5S
 qcGsd9/LHT94Zah7ExwtVZ8ap5MUx9yeEKXYaeh+XLHkFCeJF/Dz4wWPdWmU3pIN65
 GlIE8vZFhYKGmYzDVdSWJy/UQCeVNoRP8ujE0wZ0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.147.61] ([80.187.121.82]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhlKy-1mrvs80abA-00dpz7; Sun, 05
 Sep 2021 22:33:44 +0200
Subject: Re: Virtualizing HP PA-RISC unix station other than B160L
To: Richard Henderson <richard.henderson@linaro.org>, thierry.briot@gmail.com
References: <00d401d7a230$56842630$038c7290$@gmail.com>
 <CAFXwXrmt-u9iO_xY3y=ite1rPsvdm77w_s3Fw1G5C=fag0KP1w@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
Message-ID: <2db9d592-8115-1206-68e4-71a9fd25b45d@gmx.de>
Date: Sun, 5 Sep 2021 22:32:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFXwXrmt-u9iO_xY3y=ite1rPsvdm77w_s3Fw1G5C=fag0KP1w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pYfO96URKeBbPpUYB4U2dTQTdCxkV6Ni/0S4zTh0eWFEv6HswXT
 W2GqWk4F3X0aYTUowcbYfEoEdFJ6DiMUyZujqFCgqF1n6PHNWkMUWEwONo3ExBW/64vfJCT
 ihFqrlPBBP+THejc50k9YdipSVcYy9IH86zgT3xMscQVa2mSXx8+WhlCiBzQrTjZj4z0WB+
 opAxH8NFnd09Ba6DcvNWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:INaeD/xMXV0=:3PAWAjyoMP5Qnw5uLJCxfb
 kFK0RB8ywG/EvA4oDiAGmoDw7uxWVGgqC4+0kJR50mq7ldHcsQnC/RZRwSd1Mlr/8/SokBx71
 fDK6b45PxCBPIwYg/j6VBy83Pgl8Uybsu62pnTiNn0W5xFfG62qXqkE7alCvuSdlkiSjA/VYp
 hh7Hb0+x2YcpAKe1pk0R1t77YI4LvGKCU6fE1mApsChPGeI0O+4K7eswH7URYajSaP8JHJBeu
 IGGnt80rMHW0b+w7VRJXsb+YmsctHvRGd9dY/VABWdE22jdnaqpLoAoAxDldKB9ZBc+8TbzMq
 ePyD/AbDa1jhAzUnOmuIFMj5YH8sjKSLlN8HNZb4xFLRBSP5limuUuvRyAcsfAPQaq7GS6H8T
 rDH+ixWbDwbzNNXnIe41B9CxdSs4JUo6Wgf9kyO8A0fS13B7lAwtzvTBkmj6rozeTXo9jnfrS
 sN7IuWyPYwa6jKwXo5l0apE/puMEGjm6ygGQMH2GWz1OlAIzFTA/8v7SdKW5tNBTd74g44FiI
 E9WI9Upq9Z+t5/ue7FcD4grl4weGdP/FU4hSWhQjoNXBkh/uJkFj6khEojZmTjStGlfDmkeuO
 ZlBNX5wlRWimrU5Xnr3Mmw6J2VYBIJdxD8j05ngiARMjTwaUXZc81Zx9oGbauJ4rayIPt6JQQ
 FQ+HCkUmYo7ZS7GqQP3OrLDVoWrhMCrx8mYz+PHltAgMv0AKREzkvPnWJI4Gb/ZHtJIVkgOVJ
 WteIIKT/NPIgb4FzZkdoyNi91cs5i+xylLGW5ep9tUWnMuAx5ck3w8GxjZMhUlb6vXzkUT0jy
 WnTdt2YyGM1ITnTcFwQdMNDZMsHtH+cWwJB94zII9tM6OgjOH8Cb81YMSHaaKkKICaQoPlaLf
 oZot/00KtURJv8ruqV8UEPDdK3B6fm/QILhnTn46Y5pT2KMQMU3KZavH1rL2imsAPGZ1tvAg7
 LVNw9qkp8YqLTV4PtUyzrytS+z78Ndz2x7PoMFC978TnH/HwFfFy3JIBaq++y6NjVe3WpmPeF
 kbcsbhZpjc4raKBsKk+vqEFJULyzy7JJQDd4nZBtTb8qGYdUUBO66qti/7X1SQRCLcHyEWLnN
 M1IqediSZVS4ZixqC/JfhMkX5FqkWAui0Y66wL4JC3KbzgBcyykrPnzyQ==
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, FREEMAIL_REPLY=1, NICE_REPLY_A=-3.832,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 linux-parisc <linux-parisc@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thierry,

On 9/5/21 3:24 PM, Richard Henderson wrote:
> On Sun, 5 Sep 2021, 10:30 , <thierry.briot@gmail.com <mailto:thierry.bri=
ot@gmail.com>> wrote:
> For my company (Nexter Systems, France), I am using qemu-system-hppa
> for virtualizing HP PA-RISC workstations. That works well. You have
> made a very good job !

Thanks.

> But my machines are other than B160L (for example B180L), and I have
> to completely reinstall HP-UX on each emulated machine.
> If I do an iso system disk image of my B180L, this iso isn't bootable
> on qemu-system-hppa.
>
> Thus, my questions are :
>
> * Is it planned to emulate other HP unix workstations than B160L (for
> example B180L) ?

Maybe at some point a 64-bit capable system, e.g. C3000, and maybe
an older 32-bit system, e.g. 715/64.
For the 64bit system additions to the emulated firmware and additional
64-bit qemu support is necessary,
and for the 715/64 we need an additional NCR710 SCSI driver.
Both are lots of work.

The B180L is exactly the same as the B160L, with just a faster CPU:
https://www.openpa.net/systems/hp-visualize_b132l_b160l_b180l.html

> * Or, what changes should I make to my iso image to do it usable ? If
> I replace the /boot filesystem of the B180L image with the B160L one,
> I get a kernel panic at boot time.

I don't know HP-UX so well. I could imagine that your physical machines
have different SCSI controller cards which are used by HP-UX, and which
aren't emulated in qemu yet. That's maybe why qemu can't boot your already
installed images.
If you post the output I maybe can give more info.

> Helge is the one that did all the hw support, I just did the CPU.
> There are no real plans to do another machine. I'm not familiar with
> the specs between the HP machines to know how much work that would
> be.

There is a very good overview of the various HP machines at openPA:
https://www.openpa.net/systems/

Helge

