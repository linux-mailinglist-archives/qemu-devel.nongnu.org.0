Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2632D8545
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 09:30:55 +0100 (CET)
Received: from localhost ([::1]:44024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ko0Io-0008GG-Bc
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 03:30:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noring@nocrew.org>) id 1ko0Hb-0007pp-0m
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 03:29:39 -0500
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:41648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noring@nocrew.org>) id 1ko0HY-0002iY-Qu
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 03:29:38 -0500
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 8A0093F85C;
 Sat, 12 Dec 2020 09:29:33 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Score: -1.901
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8xv1lJCzStJv; Sat, 12 Dec 2020 09:29:32 +0100 (CET)
Received: by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 042EF3F683;
 Sat, 12 Dec 2020 09:29:30 +0100 (CET)
Date: Sat, 12 Dec 2020 09:29:30 +0100
From: Fredrik Noring <noring@nocrew.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 3/4] default-configs: Support o32 ABI with 64-bit MIPS CPUs
Message-ID: <X9R/auP3JwP8kI6Z@sx9>
References: <20201119161710.1985083-1-f4bug@amsat.org>
 <20201119161710.1985083-4-f4bug@amsat.org>
 <alpine.LFD.2.21.2011191634540.656242@eddie.linux-mips.org>
 <85288d49-70a1-a213-0390-d9cfd428f0be@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85288d49-70a1-a213-0390-d9cfd428f0be@amsat.org>
Received-SPF: softfail client-ip=79.136.2.40; envelope-from=noring@nocrew.org;
 helo=pio-pvt-msa1.bahnhof.se
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: David Daney <ddaney.cavm@gmail.com>, Mathieu Malaterre <malat@debian.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, YunQiang Su <wzssyqa@gmail.com>,
 James Cowgill <james410@cowgill.org.uk>,
 "Maciej W. Rozycki" <macro@linux-mips.org>,
 =?utf-8?Q?J=C3=BCrgen?= Urban <JuergenUrban@gmx.de>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

[ My apologies for the late reply, somehow this thread was treated as spam. ]

On Thu, Nov 19, 2020 at 06:13:20PM +0100, Philippe Mathieu-Daudé wrote:
> Hi Maciej,
> 
> On 11/19/20 5:45 PM, Maciej W. Rozycki wrote:
> > On Thu, 19 Nov 2020, Philippe Mathieu-Daudé wrote:
> > 
> >> MIPS o32 ABI on 64-bit CPUs looks like a ILP32-on-64bit data
> >> model, allowing 64-bit arithmetic and data movement instructions.
> >>
> >> This is the default ABI used by the "Sony Linux Toolkit for
> >> Playstation 2".
> > 
> >  Please don't, not at least with a generic configuration (i.e. make it 
> > unambiguous that this is R5900-specific).  This only works with R5900 
> > because it does not implement the MIPS ISA correctly (e.g. see what $ra is 
> > set to with JAL/JALR/etc. in the kernel mode), and it is not supported by 
> > the standard Linux ABI.  Use n32 instead, which has the same functionality 
> > and is standard (and is also a better ABI in terms of performance).
> 
> I think there are 2 different interests with the R5900. Fredrik sent a
> series to run recent userland/kernel on a PS2. For QEMU, it would be
> easier if these uses the n32 ABI indeed.

Modern (4.x and 5.x) R5900 Linux kernels only support o32, due to R5900
complications with n32. The plan is to reintroduce n32 once o32 is usable.
The R5900 MMI set is another complication for both ABIs (not mentioning
its vector coprocessors).

> This series allows me to run unmodified binaries from the PS2 (built
> maybe 20 years ago, apparently for a kernel 2.2).

Programs in the Debian Black Rhino distribution? I have the impression that
there are at least some R5900 specific instructions in some of them, no?

The 2.x R5900 Linux kernel does (to some degree) support both o32 and n32,
but the implementation had to be reworked (almost entirely) to update it
through Linux 3.x, 4.x and 5.x, and n32 was provisionally dropped to
simplify this. The GNU C library will have to be updated for n32 too.

I'm presently implementing device drivers, that involve the companion
MIPS 3000A I/O processor.

> >  You'd probably need to implement all the R5900 addressing quirks for your 
> > proposed hack to match hardware, or otherwise you'll end up with emulation 
> > that creates its own reality.
> 
> QEMU doesn't model well non-MIPS32 ISA, so the R5900 needs work indeed.
> 
> Laurent, maybe instead of 'mips64o32el-linux-user' we can call this
> target 'r5900o32-linux-user', 'ps2-linux-user' or even 'r5900-ps2-user'
> as Maciej said "it is not supported by the standard Linux ABI."

Would "ps2" in the name imply emulating all PlayStation 2 hardware, as
opposed to "r5900" that is only its main processor? There are also two
interesting vector coprocessors (VPU0 and VPU1) to go with it. :)

> Also I'll see to mark it deprecated so it isn't built by default.

Presently o32 is the main use case for modern 5.x R5900 Linux, and so
regardless of deprecation I have a copy of QEMU supporting it here:

https://github.com/frno7/qemu

We are building modern Gentoo Linux for the R5900, as described in

https://github.com/frno7/linux/issues/33

where R5900 QEMU having o32 is a requirement.

Fredrik

