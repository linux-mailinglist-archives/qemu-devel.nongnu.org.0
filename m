Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 877D813ACB5
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 15:56:02 +0100 (CET)
Received: from localhost ([::1]:41162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irNbt-0002La-Al
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 09:56:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34819)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1irNaD-0000hN-NU
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 09:54:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1irNaB-0005p5-W8
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 09:54:17 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:46989)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1irNa9-0005no-KK
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 09:54:15 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MLAF0-1j9SQZ2myA-00IE9k; Tue, 14 Jan 2020 15:53:57 +0100
Subject: Re: [PATCH v5 20/20] linux-user: Add support for KCOV_INIT_TRACE ioctl
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>, qemu-devel@nongnu.org
References: <1578947683-21011-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1578947683-21011-21-git-send-email-aleksandar.markovic@rt-rk.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <b395ef7b-6c63-6c1f-0b11-41214c946e68@vivier.eu>
Date: Tue, 14 Jan 2020 15:53:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <1578947683-21011-21-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NwjI65mjJ80lbxwVHURhGWJIplK/2ln9I7kDphvTexgf361EfFO
 eeIXp6dLkRRYdVLo6sfV7CdOqMrJX6jIjmqbhpUYUfEfdFQaMbOFdkyrMKTgMpAj2u3CRYM
 HN5wVKQM28Vx4SDxpbfTrfZSttnDBGfjo2Q5vsZjGNMvYdZOo7puyftCATABmNBkGbo3VFZ
 W8O6ySVbRnT2z5XBmYdGw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RVn/AtqUTT4=:jKWcGkmH2Rqd7XCTbsleS4
 5UydrUze4/OumkuOBtIR1iouJDI3U7s99TL1YrBXhRJjAUD6+zfYWLd8g+TTSfHRl1yIxdiZs
 jpxB0eKslhekavVs2bmwLcs3PSBhxhguZ+i91OFwXdlh9yq9rG2NdeFjMt4OXpdLubroCSPDR
 05UJtCHPltXmjXDwfjNILijz2Yy4cVUN2XxxeTsqZIBq1m5gO63Qksyu2ZD8OJcBw7SSck1Bv
 veX06+nGHG0Iv8bwqvuzqyU0bxH96BMJF7Sd8Mvljwtv6ip0Qd+GAX+ZK67dVcI36tny1tdox
 F6RduAwO8xM3hMMky/6PmkAdpHWdxYEoAdEsjh8vlxMvNUrPNbGCfYLAcIF498Vg1Qy+BZ0CE
 f+O4NbaMg1e5rpA8xCkXObC3jASdRQSnZCFRN2zHcait/E57cpkvuVpTnVgpDP4eAL/YHW5ov
 rtso5wTGPQFSSRaIHS0WPYLlaDHn87XxqkZ2AMaR8ylH/gPuWMtST9wWIf19WqWgmw+3NUDU9
 Zs87h7o7K2x3XaqTLPsvX4Xxau0wa+tbxohWh8vQ3vlZIr8AuCVSVExy72ivUl3up9IBCGF1n
 RIqUB8mg/91+4CO2384Dq+57wu8IeYrO915Kg+XjBDT22RKeD/YHHd41NYUOLswpez2Qgfx5+
 mdzo092M6gCu+XOxJCUvk9HrvTYSCIFnAiUCeFUFQJ0wdspDsXD81h2oJ8zkPRN4xrD6190EN
 Mm68digv8yMV0sb6HqK5cTzsHJEnts2tfHVRz2OKuZEQFSyRL//s4rkBB1Qe0z1WJxzuSVdz1
 rLiLEFdd0+alMjdsrz8SAclrfzcq5u6zHUzZOxWXfd/JZ9fgAfeqmSuVw9Lk7T2g1rCjPGctV
 4Cz8X5L9CHm56ve7fzMg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.130
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
Cc: amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 13/01/2020 à 21:34, Aleksandar Markovic a écrit :
> From: Aleksandar Markovic <amarkovic@wavecomp.com>
> 
> KCOV_INIT_TRACE ioctl plays the role in kernel coverage tracing.
> This ioctl's third argument is of type 'unsigned long', and the
> implementation in QEMU is straightforward.
> 
> Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> ---
>  linux-user/ioctls.h       | 1 +
>  linux-user/syscall_defs.h | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
> index 39b3825..1da71dd 100644
> --- a/linux-user/ioctls.h
> +++ b/linux-user/ioctls.h
> @@ -556,4 +556,5 @@
>  #ifdef CONFIG_KCOV
>    IOCTL(KCOV_ENABLE, 0, TYPE_NULL)
>    IOCTL(KCOV_DISABLE, 0, TYPE_NULL)
> +  IOCTL(KCOV_INIT_TRACE, IOC_R, TYPE_ULONG)
>  #endif
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index 87e390d..209c138 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -2460,6 +2460,7 @@ struct target_mtpos {
>  /* kcov ioctls */
>  #define TARGET_KCOV_ENABLE     TARGET_IO('c', 100)
>  #define TARGET_KCOV_DISABLE    TARGET_IO('c', 101)
> +#define TARGET_KCOV_INIT_TRACE TARGET_IOR('c', 1, abi_ulong)
>  
>  struct target_sysinfo {
>      abi_long uptime;                /* Seconds since boot */
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

