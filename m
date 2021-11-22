Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9985A458A68
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 09:18:23 +0100 (CET)
Received: from localhost ([::1]:39762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp4Ws-0005tp-P4
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 03:18:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mp4V3-00041d-Nk
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 03:16:29 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:47559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mp4V1-0002An-HF
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 03:16:29 -0500
Received: from [192.168.100.1] ([82.142.2.234]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mi2eP-1mBJlI2JUH-00e27Y; Mon, 22 Nov 2021 09:16:25 +0100
Message-ID: <a05a86aa-2973-b84c-a045-c85644b4f073@vivier.eu>
Date: Mon, 22 Nov 2021 09:16:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] linux-user: fix Coverity CID 1464101
Content-Language: fr
To: qemu-devel@nongnu.org
References: <20211121151711.331653-1-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211121151711.331653-1-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xoC5E0SpUaqxkEh/rlAaio/1Pk5+A0p7tzXjz78l5cxihNmqMAM
 LPFejA55AZB7qugmv9311L51dapIkRmhthxxnSMfcnRfUX+2QANJxHmXu0rIJgu/uWRDxMY
 1BFWYlxJhbfldkn3DKn4+zRevlgfL7AmgBfODzRC2UPtmJtBMFJ+Qm6YYgRrbxA76JKpVUS
 43GRbYFLc1Ij6kKaKtbxg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:W6OsPrMdTZk=:qGmFR3gtZJ+n2FTF6SfON0
 O0FnyUp7QCzUs63nMxJFqQqSlHpXGGd5Xh2alPR1Qz7h+nSZhsQVrHkvGy+JeMkN96dZrRKRM
 wLBSxO+lqaC2LeSy5WRmkJK0nD+C84CKWefHmdBmCmdy9Jr3hI7c64+duDLiAwLH4KHO2BRxL
 tQbgVmn/K46LYrpIaEunJKbj89fDallYtVcwIii/YRXVGlsXsFStRc5t4DqMMq5Jo0kmoAbZS
 rmwh1BdU5CCpo5GRmlkZ774bmUIX2C4qiaaHZjXoWf91j9kOATLx7TCWUKSaW+LhPSrp+JK1Q
 o7Pd0iC97LaQ9Dz8Hxiq5fOcGrzIo4aLVWeLPrxFbAg48PYXuFKr9BL9rvd/3KUyy/rEICbg6
 HwYBBwkIfQ0mB33+pnTYpAmtTnLNC7PwpQQhSI0Se2f+0Q+1Lt+8s6NpJQEdyGHX2CjdTfYkn
 0wZumVXYGDZwfjsgubtP0EOcZig5QN2j69attAMrHJ4jrANz2KshBSZ3IbenUqReaZh3hXLyZ
 ZmC3lzYS9SQMR0uQB7mvsv6k8zSb4fJsdtozk+1sMPGqQLbDJn2cKRBUG8x6NEtjJ/YVheU9E
 iS+k4mhufG5UbwGYGg7KGkzU6FoQcsDdlIptdcwtaR+iVsiOrWBzO9IOl9Z+i45EPHvbXE2Gn
 HsifP7cZGGm0PbummUKW9+TIvNEX4LyLlx0Nkj4fO2/+qYJwXJ55VdfV9VYFko3Z0S5g=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 21/11/2021 à 16:17, Laurent Vivier a écrit :
> target_mmap() can fail and return -1, but we don't check for that and
> instead assume it's always valid.
> 
> Fixes: db2af69d6ba8 ("linux-user: Add infrastructure for a signal trampoline page")
> Cc: richard.henderson@linaro.org
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   linux-user/elfload.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 5da8c02d0822..767f54c76dc5 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -3254,9 +3254,13 @@ int load_elf_binary(struct linux_binprm *bprm, struct image_info *info)
>        * Otherwise, allocate a private page to hold them.
>        */
>       if (TARGET_ARCH_HAS_SIGTRAMP_PAGE) {
> -        abi_ulong tramp_page = target_mmap(0, TARGET_PAGE_SIZE,
> -                                           PROT_READ | PROT_WRITE,
> -                                           MAP_PRIVATE | MAP_ANON, -1, 0);
> +        abi_long tramp_page = target_mmap(0, TARGET_PAGE_SIZE,
> +                                          PROT_READ | PROT_WRITE,
> +                                          MAP_PRIVATE | MAP_ANON, -1, 0);
> +        if (tramp_page == -1) {
> +            return -errno;
> +        }
> +
>           setup_sigtramp(tramp_page);
>           target_mprotect(tramp_page, TARGET_PAGE_SIZE, PROT_READ | PROT_EXEC);
>       }
> 

Applied to my linux-user-for-6.2 branch.

Thanks,
Laurent


