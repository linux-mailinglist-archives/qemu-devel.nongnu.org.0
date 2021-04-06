Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26603556F7
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 16:48:34 +0200 (CEST)
Received: from localhost ([::1]:38712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTn0L-00072b-SW
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 10:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lTmxI-0005BC-1R
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 10:45:24 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:41409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lTmxF-0004EM-E7
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 10:45:23 -0400
Received: from [192.168.100.1] ([82.142.14.126]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MMGVE-1lBZZw2sMg-00JKGe; Tue, 06 Apr 2021 16:45:18 +0200
To: Richard Henderson <richard.henderson@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
 <20210216161658.29881-3-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PULL 02/40] linux-user: Introduce PAGE_ANON
Message-ID: <3e335288-b018-1c4f-af56-3cd53fda81a2@vivier.eu>
Date: Tue, 6 Apr 2021 16:45:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210216161658.29881-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:i96TFS8Ob+PGMZqU6xtVCGXvHOmTUvOZgqhdWIk322hxI93NzqL
 wYkrHabssZKhUvKn2E+te9825FKpJwuFHYqgfHfmEH8nw+So3HnreyJt9++AoNpt9KiGDOt
 pdZly4vBAphBlKrObis31Lk/5i6KSptVse129RFopvgSEnP48WgKioiRE4J95mP8c991wWc
 pEhTxHjkBCpHHLN5a3+jw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:54HW+Uy0Pn0=:waXRbb7ZsNGk7N21cNGL0o
 3XPs24MU9k++tbVWQ/A4HWC1Nf4IwxP5b0rUKLGOxZSE1TiQEryZL+uR2xIguROwvVUgv46i4
 tJnWjsWPDKZOm0tVcn25hWSzi8Xg2Yj9CvYVyJTEfLw5EQBvEKXkZ7X2UjniZES4uu8/bxgsq
 FNWlLYlG3hQFF29pkoQPZcFZD1YmJi8m68SBj/0pTf2u/b0Ro3CuZY1Y+VQW6XDbv0iWUmSTU
 u3vv2/U8TtO0HU6fXJw9WIcmDqm24eIIrCSo6Yfc38B18cz/bcSSAXq4st+191iH2kqV6X5m5
 E8F/5SuKf0OrVNSqhFmh7UxTQXub/RQSxVUtJIBWNElYF5vmfmUr/DbQ0wmqR4ufCzAX6mZf7
 qsJTSfhULDL9MiEtaVn7UutHLT+LN7iCACGZhy7fg1wzyyd9AFX1EV/RN4SSJ5G/pXruD4VZp
 lXgvpHEn2CWBoPbSH4UHhNp7x13KrPXbq5Z5BaDyjREESn5OwJX/
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Le 16/02/2021 à 17:16, Peter Maydell a écrit :
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Record whether the backing page is anonymous, or if it has file
> backing.  This will allow us to get close to the Linux AArch64
> ABI for MTE, which allows tag memory only on ram-backed VMAs.
> 
> The real ABI allows tag memory on files, when those files are
> on ram-backed filesystems, such as tmpfs.  We will not be able
> to implement that in QEMU linux-user.
> 
> Thankfully, anonymous memory for malloc arenas is the primary
> consumer of this feature, so this restricted version should
> still be of use.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Message-id: 20210212184902.1251044-3-richard.henderson@linaro.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/exec/cpu-all.h | 2 ++
>  linux-user/mmap.c      | 3 +++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index 6421892830c..aedf5345449 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -267,6 +267,8 @@ extern intptr_t qemu_host_page_mask;
>  #define PAGE_WRITE_INV 0x0020
>  /* For use with page_set_flags: page is being replaced; target_data cleared. */
>  #define PAGE_RESET     0x0040
> +/* For linux-user, indicates that the page is MAP_ANON. */
> +#define PAGE_ANON      0x0080
>  
>  #if defined(CONFIG_BSD) && defined(CONFIG_USER_ONLY)
>  /* FIXME: Code that sets/uses this is broken and needs to go away.  */
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index ac0624f31ac..c52b60482e1 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -599,6 +599,9 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
>          }
>      }
>   the_end1:
> +    if (flags & MAP_ANONYMOUS) {
> +        page_flags |= PAGE_ANON;
> +    }
>      page_flags |= PAGE_RESET;
>      page_set_flags(start, start + len, page_flags);
>   the_end:
> 

Richard,

the new flag seems to break something.

See https://bugs.launchpad.net/qemu/+bug/1922617

Thanks,
Laurent

