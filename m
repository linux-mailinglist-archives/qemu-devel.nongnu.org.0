Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA9D57FB26
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 10:19:55 +0200 (CEST)
Received: from localhost ([::1]:46456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFtJh-0003LA-Ig
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 04:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oFt9j-0004GQ-BG
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 04:09:35 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:34663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oFt9f-0007iF-ST
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 04:09:33 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MBltM-1oLPSK1ktg-00C8qn; Mon, 25 Jul 2022 10:09:24 +0200
Message-ID: <13b4d150-595b-4094-313a-86b2aac12ff9@vivier.eu>
Date: Mon, 25 Jul 2022 10:09:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: fr
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>
References: <20220701135207.2710488-1-iii@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] linux-user: Passthrough MADV_DONTNEED for certain file
 mappings
In-Reply-To: <20220701135207.2710488-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:i2Fwwe+8NpzwfchrZzxSuKhLEHa1DJYzh9mg1gYhSeCbLUyHf6O
 oaHMhA4mU+0Sv+0uc4T0LQslvZV6Ji+JcHt4BtsDa2MeQYvVeKKWUmXrpBX1dzFgEV9fiBw
 IcVaoQFZ1+mh5vhHVM1PlF1AZj47h5dba2vHIva4xktwItFnHHSVGtKUdl4+jNJTqqJ7GgP
 GKOxip1fAwxWDkHTudwMA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GfaVeY46DQA=:s/vP0oeAhUvGEFEcXk9YcE
 2y/1V5VmgbFm6SEvIxNAQHNpXlVy7TIxT0tegKKKp0BdtSCsPty3bAeSJAUk/X0qzxX3GPStL
 kBjSVIFVpZ97qXfH3CV7u2X/E8562VMmTQLHUYrAiGB9KRlQSrETIiwKUE8Vo6xb6QvAwIBbh
 siS+PG1BYTj2z56t9d+Rma0yzfE0Z4foq5aG0AzssAc4qbraAAalWpbEBYdZf3ogpQewdT7gm
 /OXL0lyQ5cCOpQFNlRSZOrlv7hfgY0M/NehgSS67AIoXZlMn/tdgAv9dhaVEfDdn8+1qHqZXW
 1TN3gmcZkFmlUaOa7jZ+HvwjE7U1WRtD2v5qP5bWInMpt/gZx+or3+RxTBmQsWk2CtG1u0Hlp
 xaxGXwpyp8CWpIYPBYMbXh25v81JlC8wnDRl2iDdXCT4SsT55jz5vHZ5DUADC7ZaBBh/nEBQB
 N4gCY86Zw6fK691BfXuFKxb8+PAq46mFE8fTi9aXsR4N11WbtOdlULLXTGU6gKhyPsR+Dikl1
 AWTBe9IV+cd2o4lFkMW57BhcL1J8Fd4ezPflNe92s8lEKWfF7W4opZbhMhgE8kQ18VHyHmI6o
 gUJk7P5IUQbnFJVbX8St/Vc2X2InJj3VLlK/mQ75j/NbrR/xL15zjj0esPJK9sPxpMpTrmFKG
 Q5WXYC/TL161NZNbU3xiH1ugE1tR21KXbq4cgUsoPL6Qxx40/h7yhadEcJF2IyaUvsHBLhHT/
 0QWAfqnlGoUzoPQjIUA7wA+MdLBLhGqP7hrMpQ==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 01/07/2022 à 15:52, Ilya Leoshkevich a écrit :
> This is a follow-up for commit 892a4f6a750a ("linux-user: Add partial
> support for MADV_DONTNEED"), which added passthrough for anonymous
> mappings. File mappings can be handled in a similar manner.
> 
> In order to do that, mark pages, for which mmap() was passed through,
> with PAGE_PASSTHROUGH, and then allow madvise() passthrough for these
> pages as well.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   include/exec/cpu-all.h |  6 ++++++
>   linux-user/mmap.c      | 25 +++++++++++++++++++++----
>   2 files changed, 27 insertions(+), 4 deletions(-)
> 
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index f5bda2c3ca..fbdbc0fdec 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -262,6 +262,12 @@ extern const TargetPageBits target_page;
>   #define PAGE_TARGET_1  0x0200
>   #define PAGE_TARGET_2  0x0400
>   
> +/*
> + * For linux-user, indicates that the page is mapped with the same semantics
> + * in both guest and host.
> + */
> +#define PAGE_PASSTHROUGH 0x0080

0x0080 is already PAGE_ANON, do you mean 0x0800?

> +
>   #if defined(CONFIG_USER_ONLY)
>   void page_dump(FILE *f);
>   
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index 4e7a6be6ee..58622a0c15 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -424,7 +424,8 @@ abi_ulong mmap_find_vma(abi_ulong start, abi_ulong size, abi_ulong align)
>   abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
>                        int flags, int fd, abi_ulong offset)
>   {
> -    abi_ulong ret, end, real_start, real_end, retaddr, host_offset, host_len;
> +    abi_ulong ret, end, real_start, real_end, retaddr, host_offset, host_len,
> +              passthrough_start = -1, passthrough_end = -1;
>       int page_flags, host_prot;
>   
>       mmap_lock();
> @@ -537,6 +538,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
>               host_start += offset - host_offset;
>           }
>           start = h2g(host_start);
> +        passthrough_start = start;
> +        passthrough_end = start + len;
>       } else {
>           if (start & ~TARGET_PAGE_MASK) {
>               errno = EINVAL;
> @@ -619,6 +622,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
>                        host_prot, flags, fd, offset1);
>               if (p == MAP_FAILED)
>                   goto fail;
> +            passthrough_start = real_start;
> +            passthrough_end = real_end;
>           }
>       }
>    the_end1:
> @@ -626,7 +631,18 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
>           page_flags |= PAGE_ANON;
>       }
>       page_flags |= PAGE_RESET;
> -    page_set_flags(start, start + len, page_flags);
> +    if (passthrough_start == passthrough_end) {
> +        page_set_flags(start, start + len, page_flags);
> +    } else {
> +        if (start != passthrough_start) {

it would be consistent to use "check start < passthrough_start"

> +            page_set_flags(start, passthrough_start, page_flags);
> +        }
> +        page_set_flags(passthrough_start, passthrough_end,
> +                       page_flags | PAGE_PASSTHROUGH);
> +        if (passthrough_end != start + len) {

passthrough_end < start + len

> +            page_set_flags(passthrough_end, start + len, page_flags);
> +        }
> +    }
>    the_end:
>       trace_target_mmap_complete(start);
>       if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
> @@ -845,7 +861,7 @@ static bool can_passthrough_madv_dontneed(abi_ulong start, abi_ulong end)
>       }
>   
>       for (addr = start; addr < end; addr += TARGET_PAGE_SIZE) {
> -        if (!(page_get_flags(addr) & PAGE_ANON)) {
> +        if (!(page_get_flags(addr) & (PAGE_ANON | PAGE_PASSTHROUGH))) {
>               return false;
>           }
>       }
> @@ -888,7 +904,8 @@ abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice)
>        *
>        * This breaks MADV_DONTNEED, completely implementing which is quite
>        * complicated. However, there is one low-hanging fruit: host-page-aligned
> -     * anonymous mappings. In this case passthrough is safe, so do it.
> +     * anonymous mappings or mappings that are known to have the same semantics
> +     * in the host and the guest. In this case passthrough is safe, so do it.
>        */
>       mmap_lock();
>       if ((advice & MADV_DONTNEED) &&

Thanks,
Laurent

