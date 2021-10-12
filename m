Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FF8429D88
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 08:13:13 +0200 (CEST)
Received: from localhost ([::1]:60226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maB2G-00070H-9f
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 02:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1maB1D-0006LK-Ke
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 02:12:07 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:34589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1maB1B-0004qw-Ha
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 02:12:07 -0400
Received: from [192.168.100.1] ([82.142.24.54]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MeTwa-1n8PN52AMO-00aUbo; Tue, 12 Oct 2021 08:11:59 +0200
Subject: Re: [PATCH 4/9] linux-user/elfload: Rename ARM_COMMPAGE to HI_COMMPAGE
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211001153347.1736014-1-richard.henderson@linaro.org>
 <20211001153347.1736014-7-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <4ba40aeb-dd14-8fd4-8edd-0e2421d7acd1@vivier.eu>
Date: Tue, 12 Oct 2021 08:11:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211001153347.1736014-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jQRNd5treyZ48/JxkXJxDcsE75hlzzcWVODNUuHFyy8yk2KKr+L
 g2wr03H8ExhVGVdDz0odClyslLATSO7gcq47w422NcRaCu0e4KHpbUxBXLibf+uPR4Omvbl
 IJzFAzSz8tv/uJqPwrnCbSex4H0h3hL+ivbaaCMMEQ9zyT4y6y/Bj1o8JBG1rMsEV0o9o+w
 774ggpyFNX5xHis9PWOiQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lA9lRGUnL2I=:rlC21BRu4Ycr5kk9W2kqOB
 uWxfvnsjDSZmvWL8zpAESuhg+m3i0nilKwZEu+0qNEEU6cBkIPDKhMgJ2yyAwpaBNGSOWrvfT
 2LgK417bCS0gqrzxa8g//843YYyTmcGOk9gQX6ZdgElnqoErqiT08lprxUOSSc7j2U+vaFOuH
 QjmknpQnoDxPmm4lV0i9p3IA8D2juvMlySJbmI30A2oDyqoFCRIOkoGdX9FCeqkcXOYOr27Gd
 VJ5gzqBwqkt6iFcOq97A+9cVeuvhkJI5EkrdU2A/AerzWA/BhqCSjx4dGK1LN1Z9QCJWXqRu+
 fszctNQNoQhGeHuW8Y43L/fd+p1e75Wy5W431mzeauCcYpkvhv3swyKp89xzx1X+WZla0xpIF
 sdgKmT3BLVUcsBtl8UQIz9iJ37oRwToFS2MqR/N/9+kH0V86HggW7j8/v+E+Aw7V7ZZrQF7bT
 VGRSBvN93Juf9lmQEchTuCNhprQeb7kCTkTgXbCmOoAmamwS6Mn+8tjoPbzJmzUAPzhk4k+Ak
 gNTTJ5Sw6rUqRu6Qc6Ip5Jt8CHzW9HEqeRzD7dm/js9ILF1/DD5oVrI55+9DbCat9S1ZhI50O
 1Ii3BSI4oFqfaKpU4itUlLnhaO3hYUCEs4Cyh661C/W7ylYY65Umj6DF0NQl+Sl162FmtODm4
 1kaXB7hbvz7b7gaVN+aq3lwneOgVIkKHHH74/LUibFQbtMO5yUO19RO574I1+f42N/BpU8TR6
 0OY6THq8t0ty2M/XlE1gFvM0B5NCoeLgRLP7TQ==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: marex@denx.de, crwulff@gmail.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 01/10/2021 à 17:33, Richard Henderson a écrit :
> Arm will no longer be the only target requiring a commpage,
> but it will continue to be the only target placing the page
> at the high end of the address space.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/elfload.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 5f9e2141ad..dc4ababedd 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -388,11 +388,11 @@ enum {
>  
>  /* The commpage only exists for 32 bit kernels */
>  
> -#define ARM_COMMPAGE (intptr_t)0xffff0f00u
> +#define HI_COMMPAGE (intptr_t)0xffff0f00u
>  
>  static bool init_guest_commpage(void)
>  {
> -    void *want = g2h_untagged(ARM_COMMPAGE & -qemu_host_page_size);
> +    void *want = g2h_untagged(HI_COMMPAGE & -qemu_host_page_size);
>      void *addr = mmap(want, qemu_host_page_size, PROT_READ | PROT_WRITE,
>                        MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, -1, 0);
>  
> @@ -2160,8 +2160,8 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
>      return sp;
>  }
>  
> -#ifndef ARM_COMMPAGE
> -#define ARM_COMMPAGE 0
> +#ifndef HI_COMMPAGE
> +#define HI_COMMPAGE 0
>  #define init_guest_commpage() true
>  #endif
>  
> @@ -2361,7 +2361,7 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
>      }
>  
>      loaddr &= -align;
> -    if (ARM_COMMPAGE) {
> +    if (HI_COMMPAGE) {
>          /*
>           * Extend the allocation to include the commpage.
>           * For a 64-bit host, this is just 4GiB; for a 32-bit host we
> @@ -2372,14 +2372,14 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
>          if (sizeof(uintptr_t) == 8 || loaddr >= 0x80000000u) {
>              hiaddr = (uintptr_t) 4 << 30;
>          } else {
> -            offset = -(ARM_COMMPAGE & -align);
> +            offset = -(HI_COMMPAGE & -align);
>          }
>      }
>  
>      addr = pgb_find_hole(loaddr, hiaddr - loaddr, align, offset);
>      if (addr == -1) {
>          /*
> -         * If ARM_COMMPAGE, there *might* be a non-consecutive allocation
> +         * If HI_COMMPAGE, there *might* be a non-consecutive allocation
>           * that can satisfy both.  But as the normal arm32 link base address
>           * is ~32k, and we extend down to include the commpage, making the
>           * overhead only ~96k, this is unlikely.
> @@ -2400,7 +2400,7 @@ static void pgb_dynamic(const char *image_name, long align)
>       * All we need is a commpage that satisfies align.
>       * If we do not need a commpage, leave guest_base == 0.
>       */
> -    if (ARM_COMMPAGE) {
> +    if (HI_COMMPAGE) {
>          uintptr_t addr, commpage;
>  
>          /* 64-bit hosts should have used reserved_va. */
> @@ -2410,7 +2410,7 @@ static void pgb_dynamic(const char *image_name, long align)
>           * By putting the commpage at the first hole, that puts guest_base
>           * just above that, and maximises the positive guest addresses.
>           */
> -        commpage = ARM_COMMPAGE & -align;
> +        commpage = HI_COMMPAGE & -align;
>          addr = pgb_find_hole(commpage, -commpage, align, 0);
>          assert(addr != -1);
>          guest_base = addr;
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

