Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACCC2D8ED5
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 17:41:13 +0100 (CET)
Received: from localhost ([::1]:37808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koUQq-00088t-Ja
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 11:41:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noring@nocrew.org>) id 1koUPv-0007cR-GE
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 11:40:16 -0500
Received: from ste-pvt-msa1.bahnhof.se ([213.80.101.70]:45704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noring@nocrew.org>) id 1koUPt-0005fz-9s
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 11:40:15 -0500
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 66CED3F5FA;
 Sun, 13 Dec 2020 17:40:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Score: -1.9
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vY7ZYO0wXanr; Sun, 13 Dec 2020 17:40:09 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 005DB3F4DE;
 Sun, 13 Dec 2020 17:40:07 +0100 (CET)
Date: Sun, 13 Dec 2020 17:40:07 +0100
From: Fredrik Noring <noring@nocrew.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 26/26] MAINTAINERS: Add entry for MIPS Toshiba TCG
Message-ID: <X9ZD50VM4ig8qOGz@sx9>
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-27-f4bug@amsat.org> <X9Tp8VFjqaayVkSy@sx9>
 <192865b5-3c62-3e04-c927-088b38e21d76@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <192865b5-3c62-3e04-c927-088b38e21d76@amsat.org>
Received-SPF: softfail client-ip=213.80.101.70; envelope-from=noring@nocrew.org;
 helo=ste-pvt-msa1.bahnhof.se
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Craig Janeczek <jancraig@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-devel@nongnu.org, "Maciej W. Rozycki" <macro@linux-mips.org>,
 Huacai Chen <chenhc@lemote.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Dec 13, 2020 at 04:23:23PM +0100, Philippe Mathieu-Daudé wrote:
> On 12/12/20 5:04 PM, Fredrik Noring wrote:
> > I may be able to help on the TX79 that is an R5900, but unless commit
> > 823f2897bdd7 ("target/mips: Disable R5900 support") is reverted, it
> > remains shut off in QEMU. To obtain n32, in addition to o32, one may
> > want to apply something similar to this:
> 
> I added o32 because these are the only binaries I could find to test
> the CPU you added. Are there n32 binaries easily available?

With a GNU C library patch:

    Yes. The only (small) changes needed for n32 are related to Glibc,
    since the R5900 does not implement DMULT etc. in hardware. The attached
    patch (see below) traps these instructions, but the Glibc patch proposal
    (not yet submitted) will instead emulate them, which is believed to be
    faster (with actual hardware; with QEMU it would most likely instead be
    significantly slower since QEMU would need to emulate this emulation).

quoted from

https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg00974.html

having this GNU C library patch for n32 attached.

> I noticed GCC merged your patch,

Yes, GCC emits R5900 o32.

> and Gentoo too.

I suppose you mean

https://github.com/frno7/gentoo.overlay/tree/master/app-emulation/qemu-mipsr5900el

that is my QEMU overlay (having this patch in the "files" directory)
for Gentoo?

> It should be enough to respin the Docker image to cross-compile and test
> the TCG tests you already added:

Sounds good, although I'm not familiar with Docker myself. A person named
TobiX has also made an image for R5900 cross-compilation:

https://github.com/frno7/linux/issues/33#issuecomment-632284209

> 8e2e5e7daca tests/tcg: mips: Test R5900 three-operand MADDU
> 84dc0712361 tests/tcg: mips: Test R5900 three-operand MADD1
> 50f299da629 tests/tcg: mips: Test R5900 three-operand MADD
> 35eb9be6bb6 tests/tcg/mips: Add tests for R5900 DIVU1
> 990aa328be4 tests/tcg/mips: Add tests for R5900 DIV1
> 4d261a6a595 tests/tcg/mips: Add tests for R5900 MTLO1 and MTHI1
> 3303f017adb tests/tcg/mips: Add tests for R5900 MFLO1 and MFHI1
> bec4d66b248 tests/tcg/mips: Add tests for R5900 three-operand MULTU1
> cb56125eea7 tests/tcg/mips: Add tests for R5900 three-operand MULT1
> 667eded2702 tests/tcg/mips: Add tests for R5900 three-operand MULTU

There are tests for the MMIs PCPYUD, PCPYLD, LQ and SQ as well

https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg02514.html

https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg02516.html

https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg02517.html

although, as previously suggested, I'm happy to postpone the MMIs.

Fredrik

