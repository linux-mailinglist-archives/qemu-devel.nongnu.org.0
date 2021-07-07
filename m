Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D9E3BF00D
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 21:08:42 +0200 (CEST)
Received: from localhost ([::1]:52500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1CuX-0002R2-Nu
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 15:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Ct6-0000tg-S1
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:07:12 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:59065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Ct5-00049Z-5c
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:07:12 -0400
Received: from [192.168.100.1] ([82.142.13.34]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MOzfO-1lp17P01Do-00PLNu; Wed, 07 Jul 2021 21:07:07 +0200
Subject: Re: [PATCH] linux-user: fill ppid field in /proc/self/stat
To: Andreas Schwab <schwab@suse.de>
References: <mvmwnqnef5g.fsf@suse.de>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <46c402c4-b904-8371-48a4-de43daca4ae2@vivier.eu>
Date: Wed, 7 Jul 2021 21:07:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <mvmwnqnef5g.fsf@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xZw7FITpcMnN0EOVKHAI/okacanu9euAQToOo4xbz1DweO+LqW2
 +Q0YlyUNJYJ5y7IEkUxpE2AoW0OEYskjQHGODJNXgkCKRhgbWuTde/nB/14yFMvjYeb5+aC
 8nSJW70kwH2JcDpFemaXLgjBbTBJ9mrlUFFmqqeuBcBWeg/xAv3exmyDavNCl9ttlyhVh/s
 xzZRyO0nXNkZRmrRzSoHQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/E0s1fnWYf8=:c/+YuG1YT13gdwCgBRSuQL
 tli8UUKGSzu7lTG8QadG1RUfZL1+FQ+5vbO8n1mx38EzqSTIPOW4Knn7YjtTJK+xffAu0AQ/2
 aiuXTfqDcIxT+BVuKisMrAtbZgyFTk04uJPug92Fd0TNvkKW9esgXwLE03+4fWyFU7+XnebX1
 9msXHHT7iL2ULtwuDT5ZmsB4zuRky40SKEZAR7KpXSWYX8Uow/t/tbU+rzJAnTqYAd6lWZWEu
 aoPz8V+uAGriEGi9sVH/wKu0OwnvoxpVUnkQXKlHOt8IP5fVVyGo5BABYmjwGIjg3yY1wC1aC
 eGp+U5/rLV0/KCZTVv6K3Kjj0TFGzLJ8HXcKz1/vclViZYdVR+icVyWJNbQUZTAAPiqZUCEwY
 hG/Jxz5j/L+jEAMsWrniOtbxLnkv7RbSxPoTzqRP8ROa1YMkHVHptO73FOpgA5c/RfKmVeRhC
 jfPKyuYdZ9+WUG0G+nfAQXY1FL8NsJbhKellLRakkne7ec/hXYNExzQKbaeXDOYR325n1u76B
 hUxO+EB2TTrMi4Ar2i6VAXXUtRvULm0MmrmCi5lw+exGJS5l1sFzJ93q52FQUO31gL+EFoDvD
 MjM5wSoufmS7PEf4u1b9ZhbcN1ez2hBXNdl9NxV+F0UEld9sEh6bBx+LqCqzGKInv2Fa0sroh
 +b5LNtLqzUOxhBSaS2xEfkobwmRggDE/dKSsgpDoQckN6b6t9pFiNc6Cg0PZGMwHsbXQgrCVm
 RPG5vg1qPpINsU6II+PLcokzo4Ht4zztjJWAjmNQ86dYKRMzYAbTleOcizhq/WG+xvHU+0DAQ
 vtGgDeJXO6Y51QT7HatT06HRb+5wdxR/BwlIOBZPx9rTADlz/EZsHjIe4VU9vWVmoA+OGGj
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 21/06/2021 à 11:32, Andreas Schwab a écrit :
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  linux-user/syscall.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 974dd46c9a..dababe463c 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -7940,6 +7940,9 @@ static int open_self_stat(void *cpu_env, int fd)
>              gchar *bin = g_strrstr(ts->bprm->argv[0], "/");
>              bin = bin ? bin + 1 : ts->bprm->argv[0];
>              g_string_printf(buf, "(%.15s) ", bin);
> +        } else if (i == 3) {
> +            /* ppid */
> +            g_string_printf(buf, FMT_pid " ", getppid());
>          } else if (i == 27) {
>              /* stack bottom */
>              g_string_printf(buf, TARGET_ABI_FMT_ld " ", ts->info->start_stack);
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

