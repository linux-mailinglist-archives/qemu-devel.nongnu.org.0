Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AA5485134
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 11:37:41 +0100 (CET)
Received: from localhost ([::1]:41250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n53fo-00054a-Cq
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 05:37:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53Sg-0000L3-Ky
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:24:07 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:38855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53Se-0007UM-0R
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:24:06 -0500
Received: from [192.168.100.1] ([82.142.30.62]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M8QNy-1n0dcH3mpE-004SqB; Wed, 05 Jan 2022 11:24:02 +0100
Message-ID: <e83c75a1-a1c0-633e-f6ef-0842e5caaca2@vivier.eu>
Date: Wed, 5 Jan 2022 11:24:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 3/7] linux-user/elfload: Rename ARM_COMMPAGE to
 HI_COMMPAGE
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211221025012.1057923-1-richard.henderson@linaro.org>
 <20211221025012.1057923-4-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211221025012.1057923-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lcNIEtq6Uq71qO21QiXj0D8iGOgZ12ETMK+Prt9jfELKI1EyNvv
 TkA5SADCA1eKzQAEZyAevrsUQeCzjr9+NCzA0ye2DzkebDckcl6NLsH9sHLTsmitUb2wskj
 Y8nnkLRnWBqbVwbnFPWTOEUziV34St3Nad3HAu8gMZt1l9++cHXUwUsLA2oznncV7PSP16O
 iDttF9GsAxJipVR6hF6xg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5k/CMu1Evdw=:vfJnomAkOBXIi3oYDjLnih
 oiwkk+RZYndqN6xp74o0ojA4TT/H4VS825MqkaR9WADBYHgjQhLchXyOeg+U/cnBDDZw10taO
 qfWRYajrRcsZ77faelaGhCr98jE9AcrRRSXV6MvDGQc14fkixsuROYS0/MjCuy33Dy/YIv5Sj
 4ytSRmE75qu3Mb8hHOV/zT0gMR06yLPJrlmKbXzB2yKxMVZGkA6zFq2OAGJ49hnI5AQABQz+u
 8ItFGNltZBoDZC2b/QSzGX7tQ8vgO35NE31H6aH4//SkZCpT9DT7AAIYz5EFlaxieg+IDic4n
 zA7uyI7SMrw+YFXNj1njIcHBUfwVr07Ksmk7bbjzlOGfFHCL4VD7aUYK8EN7cJhgjYQDYBrgk
 DeWLNgQ3ZKcsX14mPhDlcjXxtCt1tJ6pVZfDNHqySEe3NLNLcXEWl3P7mXErtzZEzmucKHZmw
 hlZ/3M5NpkFnKJ/jBjUjGb9KqM/QS9gn22N2HmTxusZwbHK+1wdA6Xp2oPYZQL+ZHumTkFT9+
 x5enoLLP1L92pbweAPOFciw8naBHVeFKRJ4zCl7/iAcXpToSuWBZjrmL1qhxWnO+p+5JjdcSX
 bUWklfF8eBBgMEzfnxeSspbWkx2TXV0uaYk67PE7WK2sdZsAWji16F55UFfUhVJtDe+rcxWKU
 SxHDpv0pLbdLIu+Rnk4KEbDP8GR/AIZTIb7uRLgYv9R+frH9vu5QAooBATG8upCBJNy4=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.057,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 21/12/2021 à 03:50, Richard Henderson a écrit :
> Arm will no longer be the only target requiring a commpage,
> but it will continue to be the only target placing the page
> at the high end of the address space.
> 
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/elfload.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 767f54c76d..d34cd4fe43 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -390,11 +390,11 @@ enum {
>   
>   /* The commpage only exists for 32 bit kernels */
>   
> -#define ARM_COMMPAGE (intptr_t)0xffff0f00u
> +#define HI_COMMPAGE (intptr_t)0xffff0f00u
>   
>   static bool init_guest_commpage(void)
>   {
> -    void *want = g2h_untagged(ARM_COMMPAGE & -qemu_host_page_size);
> +    void *want = g2h_untagged(HI_COMMPAGE & -qemu_host_page_size);
>       void *addr = mmap(want, qemu_host_page_size, PROT_READ | PROT_WRITE,
>                         MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, -1, 0);
>   
> @@ -2160,8 +2160,8 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
>       return sp;
>   }
>   
> -#ifndef ARM_COMMPAGE
> -#define ARM_COMMPAGE 0
> +#ifndef HI_COMMPAGE
> +#define HI_COMMPAGE 0
>   #define init_guest_commpage() true
>   #endif
>   
> @@ -2361,7 +2361,7 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
>       }
>   
>       loaddr &= -align;
> -    if (ARM_COMMPAGE) {
> +    if (HI_COMMPAGE) {
>           /*
>            * Extend the allocation to include the commpage.
>            * For a 64-bit host, this is just 4GiB; for a 32-bit host we
> @@ -2372,14 +2372,14 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
>           if (sizeof(uintptr_t) == 8 || loaddr >= 0x80000000u) {
>               hiaddr = (uintptr_t) 4 << 30;
>           } else {
> -            offset = -(ARM_COMMPAGE & -align);
> +            offset = -(HI_COMMPAGE & -align);
>           }
>       }
>   
>       addr = pgb_find_hole(loaddr, hiaddr - loaddr, align, offset);
>       if (addr == -1) {
>           /*
> -         * If ARM_COMMPAGE, there *might* be a non-consecutive allocation
> +         * If HI_COMMPAGE, there *might* be a non-consecutive allocation
>            * that can satisfy both.  But as the normal arm32 link base address
>            * is ~32k, and we extend down to include the commpage, making the
>            * overhead only ~96k, this is unlikely.
> @@ -2400,7 +2400,7 @@ static void pgb_dynamic(const char *image_name, long align)
>        * All we need is a commpage that satisfies align.
>        * If we do not need a commpage, leave guest_base == 0.
>        */
> -    if (ARM_COMMPAGE) {
> +    if (HI_COMMPAGE) {
>           uintptr_t addr, commpage;
>   
>           /* 64-bit hosts should have used reserved_va. */
> @@ -2410,7 +2410,7 @@ static void pgb_dynamic(const char *image_name, long align)
>            * By putting the commpage at the first hole, that puts guest_base
>            * just above that, and maximises the positive guest addresses.
>            */
> -        commpage = ARM_COMMPAGE & -align;
> +        commpage = HI_COMMPAGE & -align;
>           addr = pgb_find_hole(commpage, -commpage, align, 0);
>           assert(addr != -1);
>           guest_base = addr;

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent


