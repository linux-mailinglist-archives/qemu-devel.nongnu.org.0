Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E243016BC
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 17:21:11 +0100 (CET)
Received: from localhost ([::1]:45546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3Lev-0005Z4-Jt
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 11:21:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l3LdI-00056x-VF
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 11:19:28 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:39307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l3LdH-000714-1Z
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 11:19:28 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MHG4W-1lGbBd38fw-00DJFv; Sat, 23 Jan 2021 17:19:17 +0100
Subject: Re: [PATCH] tcg: Increase the static number of temporaries
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210121025439.1120405-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <521603eb-205f-9659-25f9-d72bb2eec01f@vivier.eu>
Date: Sat, 23 Jan 2021 17:19:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121025439.1120405-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:olRFb6IPuoJfDupMTjg7IVWRY6b97RzD9ZIxp93cnd35HryO2jB
 XEDIyLzV3MD/YHadP6C9nqpMqsyMSxpzcrHMZNnotTFB/qD19sDvEwrhE3urTbo5RIXCDGB
 tMuf1wIFjb/Cbkhipshj2NZSEVuXjBcFr4Gi4vFcdy+HNzgHluqDc8IOjghj5prWKmlkJpH
 f7i/saP/joyQqADrasbzA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gm8CihkKVBQ=:H5/g+BWWqWL+y8hjj7ZmyQ
 Q2xr5nsUh5UwhzmWI8WbkS/K269zif9WFLEHaRWEa2WKwnecu+QdmwQd2geYZJf0U1i/8DxSZ
 1s72IH/0krJb3z0nmFGv8JzEUefBsuU09kNxPU/uQzf13L75CXQSz0Z6efDDwi+IlU9SFa0Zy
 XZwrhtGRN6l/15RFPqmGk07LHQQgpviZ7ch6TpewsN22cWFlJGOzOweAuA4PsNz0hlEE/iIvi
 hZeIO90R5axITvxf5ZqrAWAkiElRqunRVQ7Kg5J98KWfbdqDFflTcZ40gNpfkeO97xvHG79tR
 NslCnxxPcx2CcqSBXAwDwGfZOmyEHpVcUZ7ZZp3AkSHlyUm9p7+Un9YQ3inW2UoYR9SvOH8be
 nbBl9sraSFI36BFbdWDJFg/NQi2u/6Tbp8PEJIymesFXdoWVpWQ89ZHiHcc8AfMc5EC41A1u7
 mdXzktOZ5A==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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
Cc: lvivier@redhat.com, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 21/01/2021 à 03:54, Richard Henderson a écrit :
> This isn't a total or permanent solution to the problem of running
> out of temporaries, but it puts off the issue for a bit.
> 
> Make the assert in tcg_temp_alloc unconditional.  If we do run out
> of temps, this can fail much later as a weird SIGSEGV, due to the
> buffer overrun of the temp array.
> 
> Remove the inlines from tcg_temp_alloc and tcg_global_alloc.
> 
> Buglink: https://bugs.launchpad.net/bugs/1912065
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> There are more bugs that need fixing in order to actually make
> the dynamic allocation scheme work.  Rather than keep this bug
> pending longer, hack around it and make the SEGV an ABRT.
> 
> r~
> 
> ---
>  include/tcg/tcg.h | 2 +-
>  tcg/tcg.c         | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
> index c5a9d65d5f..0187de1352 100644
> --- a/include/tcg/tcg.h
> +++ b/include/tcg/tcg.h
> @@ -275,7 +275,7 @@ typedef struct TCGPool {
>  
>  #define TCG_POOL_CHUNK_SIZE 32768
>  
> -#define TCG_MAX_TEMPS 512
> +#define TCG_MAX_TEMPS 1024

This seems not enough, I have:

ERROR:.../tcg/tcg.c:1210:tcg_temp_alloc: assertion failed: (n < TCG_MAX_TEMPS)
Bail out! ERROR:.../tcg/tcg.c:1210:tcg_temp_alloc: assertion failed: (n < TCG_MAX_TEMPS)

With my branch m68k-virt (68040 processor with virtio-mmio devices) booting debian sid.

Thanks,
Laurent

