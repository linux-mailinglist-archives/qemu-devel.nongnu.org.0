Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF6F2D895A
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 19:49:19 +0100 (CET)
Received: from localhost ([::1]:57010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ko9xG-000197-Uh
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 13:49:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noring@nocrew.org>) id 1ko9hU-0002LR-Ho
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:33:00 -0500
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:53974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noring@nocrew.org>) id 1ko9hS-00079V-JU
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:33:00 -0500
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 0C5A43F4C0;
 Sat, 12 Dec 2020 17:04:05 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Score: -1.9
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tgr0y8Ln5aoY; Sat, 12 Dec 2020 17:04:04 +0100 (CET)
Received: by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 982AA3F40E;
 Sat, 12 Dec 2020 17:04:02 +0100 (CET)
Date: Sat, 12 Dec 2020 17:04:01 +0100
From: Fredrik Noring <noring@nocrew.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 26/26] MAINTAINERS: Add entry for MIPS Toshiba TCG
Message-ID: <X9Tp8VFjqaayVkSy@sx9>
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-27-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201120210844.2625602-27-f4bug@amsat.org>
Received-SPF: softfail client-ip=79.136.2.41; envelope-from=noring@nocrew.org;
 helo=pio-pvt-msa2.bahnhof.se
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
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 20, 2020 at 10:08:44PM +0100, Philippe Mathieu-Daudé wrote:
> Add an entry for the TCG core related to Toshiba TXx9.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Adding Fredrik Noring in case he wants to be notified of changes,
> patch conditional to his approval.

I may be able to help on the TX79 that is an R5900, but unless commit
823f2897bdd7 ("target/mips: Disable R5900 support") is reverted, it
remains shut off in QEMU. To obtain n32, in addition to o32, one may
want to apply something similar to this:

diff --git a/linux-user/mips64/target_elf.h b/linux-user/mips64/target_elf.h
index ec55d8542a..5f2f2df29f 100644
--- a/linux-user/mips64/target_elf.h
+++ b/linux-user/mips64/target_elf.h
@@ -12,6 +12,9 @@ static inline const char *cpu_get_model(uint32_t eflags)
     if ((eflags & EF_MIPS_ARCH) == EF_MIPS_ARCH_64R6) {
         return "I6400";
     }
+    if ((eflags & EF_MIPS_MACH) == EF_MIPS_MACH_5900) {
+        return "R5900";
+    }
     return "5KEf";
 }
 #endif

> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b6d98b95c47..d97f0f1d66e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -253,6 +253,12 @@ R: Craig Janeczek <jancraig@amazon.com>
>  S: Odd Fixes
>  F: target/mips/vendor-xburst*
>  
> +MIPS TCG CPUs (Toshiba TX)
> +M: Philippe Mathieu-Daudé <f4bug@amsat.org>
> +R: Fredrik Noring <noring@nocrew.org>
> +S: Odd Fixes
> +F: target/mips/vendor-tx*
> +
>  MIPS TCG CPUs (nanoMIPS ISA)
>  S: Orphan
>  F: disas/nanomips.*
> -- 
> 2.26.2
> 

Fredrik

