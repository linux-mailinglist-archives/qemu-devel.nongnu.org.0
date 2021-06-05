Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D9739CAB2
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 21:15:24 +0200 (CEST)
Received: from localhost ([::1]:46788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpblT-0001oM-4A
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 15:15:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lpbk2-0000SZ-7x; Sat, 05 Jun 2021 15:13:54 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:42205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lpbk0-0006ua-EU; Sat, 05 Jun 2021 15:13:53 -0400
Received: from [192.168.100.1] ([82.142.12.38]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MyK9S-1lSJ431BFM-00yh5M; Sat, 05 Jun 2021 21:13:47 +0200
Subject: Re: [PATCH v2] linux-user/syscall: Constify bitmask_transtbl
 fcntl/mmap flags_tlb[]
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210517055243.830491-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <04d15030-721a-2e5f-61cb-92f2c6ae55d1@vivier.eu>
Date: Sat, 5 Jun 2021 21:13:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210517055243.830491-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jW1L6VQKNGQEwSBu9WsBhg5rnhQLTpHKm/W6fSeL7unpwjJ8iUi
 Xb1zeEmSHX4vI9jP42HM3M+VJjwmi6KoKymej2PssJGsANQh7AFkS4EQfrQMBR41MDqt2H3
 e4redo5d0fHBw3sPqDGwU3Lfq7Gt19xfxFNHnFDYIxGxbOAWDOZAHJfDa6eiKwkqPkqIERY
 8qpZiairQB/iLdViL8MkQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:k+apq9XIDsE=:i+vOpXtr8DhCgLtDuWCkmF
 4hFqNQV6CRFIxfzhvt9OwQ/Trd2ySJdco4ttIqO+WVG9qyzgQ0tqaTnnR6O7NR0D/3ayzshe4
 Riw9+GZgSgejYkStaesBHT6r6hH+T9FgVuxTIt1Wxi16Vksil5if4V161mWAqhIW0c6RImC+B
 US0wa/QtQ/GgOx9ja1WH8xtjTjE0br9lIhJj1y3kFpTdrMltcEmfgXhJWhw4Y44Bl+VNxqkd9
 W2OtJCi1BvHeQLmbGQYnM8jnsZztRNoSq4Zbdd9j2JNS54g3Oty0Zi3fGGQc13j+d0/+Zgmyd
 tQsoVxJVXdYCR1oEqKv2M/PTc1pTYnpUJ6Wp0pkalnRCv+M6mdMc3V4MjXXdauekFf5mtBNXs
 eXyTuUWwk5S9uqzfsUfBXRhAZT3t/Vk/5oxOceSLztwr33/2iWTg2p36jcYryty6taK4KUNR4
 oij4VPkkgaDiPrsjPe0CYbnJSZiGlZdRSqXyDbP3kZ6QmEU8Tgss6d8cItSYZFeEbuCRalNTY
 iFqa1ZxQj23e8iojTrfpCA=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.59,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Bin Meng <bmeng.cn@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 17/05/2021 à 07:52, Philippe Mathieu-Daudé a écrit :
> Keep bitmask_transtbl in .rodata by marking the arrays const.
> 
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/syscall.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 95d79ddc437..64f486743a9 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -365,7 +365,7 @@ _syscall5(int, sys_statx, int, dirfd, const char *, pathname, int, flags,
>  _syscall2(int, membarrier, int, cmd, int, flags)
>  #endif
>  
> -static bitmask_transtbl fcntl_flags_tbl[] = {
> +static const bitmask_transtbl fcntl_flags_tbl[] = {
>    { TARGET_O_ACCMODE,   TARGET_O_WRONLY,    O_ACCMODE,   O_WRONLY,    },
>    { TARGET_O_ACCMODE,   TARGET_O_RDWR,      O_ACCMODE,   O_RDWR,      },
>    { TARGET_O_CREAT,     TARGET_O_CREAT,     O_CREAT,     O_CREAT,     },
> @@ -6062,7 +6062,7 @@ static const StructEntry struct_termios_def = {
>      .print = print_termios,
>  };
>  
> -static bitmask_transtbl mmap_flags_tbl[] = {
> +static const bitmask_transtbl mmap_flags_tbl[] = {
>      { TARGET_MAP_SHARED, TARGET_MAP_SHARED, MAP_SHARED, MAP_SHARED },
>      { TARGET_MAP_PRIVATE, TARGET_MAP_PRIVATE, MAP_PRIVATE, MAP_PRIVATE },
>      { TARGET_MAP_FIXED, TARGET_MAP_FIXED, MAP_FIXED, MAP_FIXED },
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

