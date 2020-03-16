Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D51E1187127
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 18:30:26 +0100 (CET)
Received: from localhost ([::1]:44142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDtZJ-0003QJ-LF
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 13:30:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34940)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aurelien@aurel32.net>) id 1jDszJ-0007Zl-K1
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 12:53:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aurelien@aurel32.net>) id 1jDszH-0001P9-VH
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 12:53:13 -0400
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1]:38202)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aurelien@aurel32.net>)
 id 1jDszH-0006ID-MX
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 12:53:11 -0400
Received: from aurel32 by hall.aurel32.net with local (Exim 4.92)
 (envelope-from <aurelien@aurel32.net>)
 id 1jDsyx-0001e3-F7; Mon, 16 Mar 2020 17:52:51 +0100
Date: Mon, 16 Mar 2020 17:52:51 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Subject: Re: [PATCH 1/3] MAINTAINERS: Adjust maintainer's status for some
 MIPS items
Message-ID: <20200316165251.GA30703@aurel32.net>
References: <1584061252-16635-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1584061252-16635-2-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1584061252-16635-2-git-send-email-aleksandar.markovic@rt-rk.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:bc8:30d7:100::1
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020-03-13 02:00, Aleksandar Markovic wrote:
> From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
> 
> Aurelien has been and will forever remain an idol in QEMU for
> MIPS world. However, since he decided to move on to other projects,
> acknowledge the reality, and formally releive him from maintainer's
> duties for QEMU for MIPS items. Aurelien is though welcome to come
> back at any time. Some empty spots caused by this are filled in by
> Aleksandar.
> 
> CC: Aurelien Jarno <aurelien@aurel32.net>
> Signed-off-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
> ---
>  MAINTAINERS | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Acked-by: Aurelien Jarno <aurelien@aurel32.net>

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 32867bc..4fba8b8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -209,8 +209,8 @@ F: hw/microblaze/
>  F: disas/microblaze.c
>  
>  MIPS TCG CPUs
> -M: Aurelien Jarno <aurelien@aurel32.net>
>  M: Aleksandar Markovic <amarkovic@wavecomp.com>
> +R: Aurelien Jarno <aurelien@aurel32.net>
>  R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
>  S: Maintained
>  F: target/mips/
> @@ -1036,7 +1036,8 @@ F: hw/mips/mips_mipssim.c
>  F: hw/net/mipsnet.c
>  
>  R4000
> -M: Aurelien Jarno <aurelien@aurel32.net>
> +M: Aleksandar Markovic <amarkovic@wavecomp.com>
> +R: Aurelien Jarno <aurelien@aurel32.net>
>  R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
>  S: Obsolete
>  F: hw/mips/mips_r4k.c
> @@ -2507,7 +2508,8 @@ F: tcg/i386/
>  F: disas/i386.c
>  
>  MIPS TCG target
> -M: Aurelien Jarno <aurelien@aurel32.net>
> +M: Aleksandar Markovic <amarkovic@wavecomp.com>
> +R: Aurelien Jarno <aurelien@aurel32.net>
>  R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
>  S: Maintained
>  F: tcg/mips/
> -- 
> 2.7.4
> 
> 

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

