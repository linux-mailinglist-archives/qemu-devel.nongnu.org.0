Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A213A33309F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:07:58 +0100 (CET)
Received: from localhost ([::1]:35888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJja7-0007y5-Q7
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:07:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJj5e-00035B-Ne; Tue, 09 Mar 2021 15:36:30 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:38755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJj5a-0004H5-Fn; Tue, 09 Mar 2021 15:36:26 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MKbc2-1l396j3RnQ-00Ku01; Tue, 09 Mar 2021 21:36:02 +0100
Subject: Re: [PATCH] linux-user/elfload: do not assume MAP_FIXED_NOREPLACE
 kernel support
To: Vincent Fazio <vfazio@xes-inc.com>, qemu-devel@nongnu.org
References: <20210131061930.14554-1-vfazio@xes-inc.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <7c945f8b-2a6e-8129-ad2a-1aa610d03904@vivier.eu>
Date: Tue, 9 Mar 2021 21:36:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210131061930.14554-1-vfazio@xes-inc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:voQCvqbOCMTDtM0ebI0xHDFL1IkM+6d/UXddhJOxwY5nSVZqnwA
 xuZEH2fcsDkJDkO3aTDoMm+/CwCJ5pMO7QxdynZPZ3LChzHas7apOp87vFeRvOmXvfhbiRi
 DcUVSEkTUofCZVr/TLRTRibfLMSpxqQcfsMgac5+3x8j9mIURino00XOqNFcMfuoaaC3/UU
 A4ZXX0SIApEw9/PFCDrXg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Mlm4bKesgUM=:WzqotlKMUNAlyegRD1BDl6
 fYy7AH/U4PXPYpptk42F2U1CgRQrAO1rFfozK8Qfr0bdbkA2hyXwW7597NWspZDWk3my+pO48
 5seEVhOD/9dLrntFnZmKItagily+0eOezVsENFMRGfmy87BoZpURgJ9KX/K59odZwbLT0ZEGc
 nEz2/CwskxgYbI6qkB5wtVY4EjNyNiexMpLYtOhcnspWSv/3FLX2Jd9p3mU/T8eHeV4DyYYd/
 0yL0mxZuFuEWARJ3fw+GSZGSrMY13xqlJ7t3JxPomYDKfWhVYPb71nTYfUYQjeOafpBapijGy
 ODcP7hiHhDMMbdl2sP+WbsAgIO6HVECP+0pWlhAWtGcJGheAkd0bZnHr0w3d42MdGqcQHWtSI
 MjySdeGnX9CqS6O+qjf9XGLr/iPUGHLwOPPSpFpMPTd1WJ1c0S1sCvnywdLUYLQmiipPU72kZ
 XNSV7tc3Zg==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org, Vincent Fazio <vfazio@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 31/01/2021 à 07:19, Vincent Fazio a écrit :
> From: Vincent Fazio <vfazio@gmail.com>
> 
> Previously, pgd_find_hole_fallback assumed that if the build host's libc
> had MAP_FIXED_NOREPLACE defined that the address returned by mmap would
> match the requested address. This is not a safe assumption for Linux
> kernels prior to 4.17
> 
> Now, we always compare mmap's resultant address with the requested
> address and no longer short-circuit based on MAP_FIXED_NOREPLACE.
> 
> Fixes: 2667e069e7b5 ("linux-user: don't use MAP_FIXED in pgd_find_hole_fallback")
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---
>  linux-user/elfload.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 5f5f23d2e5..8d425f9ed0 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2217,8 +2217,7 @@ static uintptr_t pgd_find_hole_fallback(uintptr_t guest_size, uintptr_t brk,
>                                       PROT_NONE, flags, -1, 0);
>              if (mmap_start != MAP_FAILED) {
>                  munmap(mmap_start, guest_size);
> -                if (MAP_FIXED_NOREPLACE != 0 ||
> -                    mmap_start == (void *) align_start) {
> +                if (mmap_start == (void *) align_start) {
>                      return (uintptr_t) mmap_start + offset;
>                  }
>              }
> 

Applied to my linux-user-for-6.0 branch.

Thanks,
Laurent


