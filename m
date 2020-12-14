Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FB82D97D8
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 13:07:09 +0100 (CET)
Received: from localhost ([::1]:34164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1komd8-0006Hk-Cx
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 07:07:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noring@nocrew.org>) id 1kombU-0005iy-Ot
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 07:05:24 -0500
Received: from ste-pvt-msa1.bahnhof.se ([213.80.101.70]:24487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noring@nocrew.org>) id 1kombS-0005yT-Kp
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 07:05:24 -0500
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 7C00A416D8;
 Mon, 14 Dec 2020 13:05:19 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Score: -1.9
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dYxC5YkPNq4A; Mon, 14 Dec 2020 13:05:18 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 35B46416A8;
 Mon, 14 Dec 2020 13:05:17 +0100 (CET)
Date: Mon, 14 Dec 2020 13:05:16 +0100
From: Fredrik Noring <noring@nocrew.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 26/26] MAINTAINERS: Add entry for MIPS Toshiba TCG
Message-ID: <X9dU/D1tbyjXer++@sx9>
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
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Dec 13, 2020 at 04:23:23PM +0100, Philippe Mathieu-Daudé wrote:
> I noticed GCC merged your patch,

By the way, the fairly new -mfix-r5900 option (implied with mipsr5900el)
is required for the R5900 hardware short loop erratum[1]. I've made a
simple tool to scan ELF objects for problems[2], as it can be tedious
to find and analyse everything manually. QEMU doesn't emulate this bug,
though. Code built for the R5900 and most other MIPS implementations
were previously mutually exclusive, but can nowadays be generic.[3]

> and Gentoo too.

Did you proceed with your RFC patches "docker: Add gentoo-mipsr5900el-cross
image"[4]? There are two new guides on how to build an R5900 cross-compiler
on the R5900 Linux wiki: with Gentoo[5] and from sources[6].

Any GNU C library (or any other) patches for n32 etc. can easily be applied
onto the standard Gentoo packages, if you want to.[7][8]

Fredrik

References:

[1] https://github.com/frno7/linux/wiki/R5900-short-loop-erratum
[2] https://github.com/frno7/linux/tree/ps2-v5.4/tools/r5900check
[3] https://lists.nongnu.org/archive/html/qemu-devel/2018-11/msg03661.html
[4] https://lists.nongnu.org/archive/html/qemu-devel/2018-11/msg03511.html
[5] https://github.com/frno7/linux/wiki/Building-an-R5900-cross-compiler-using-Gentoo-Linux
[6] https://github.com/frno7/linux/wiki/Building-an-R5900-cross-compiler-from-sources
[7] https://lists.gnu.org/archive/html/qemu-devel/2018-09/msg03944.html
[8] https://wiki.gentoo.org/wiki//etc/portage/patches

