Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5408543304A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 09:58:44 +0200 (CEST)
Received: from localhost ([::1]:56764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mck1D-0003Wy-DP
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 03:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mcjqV-0007zM-SQ; Tue, 19 Oct 2021 03:47:39 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:57945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mcjqU-0001JC-6B; Tue, 19 Oct 2021 03:47:39 -0400
Received: from [192.168.100.1] ([82.142.24.54]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1McpeM-1nBWhK10V8-00ZuzB; Tue, 19 Oct 2021 09:47:32 +0200
Subject: Re: [PATCH] softmmu/physmem.c: Fix typo in comment
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <163429018454.1146856.3429437540871060739.stgit@bahia.huguette>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <e0196d8b-77f8-0af3-8286-a1ec4c535830@vivier.eu>
Date: Tue, 19 Oct 2021 09:47:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <163429018454.1146856.3429437540871060739.stgit@bahia.huguette>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wmF9ofYxbTdp/ce56/HQ3cnyyU+EzcZOW1b6kb0mBqZidQ5bzbY
 g0MyUmjRp85q81/ONMPrcTRSkTzU+qea2HLFBs8cq7YqXFu0MGoWZndeh9Bjn0ZSsD4P+Pu
 H9XumO4xNiDNlxlakM+gfYLzeXyAo2cWSneDzznR0YH687TkcG1pZb37+Ww1RCetYxbuUIH
 XndegE26Rt4x/etg2sx7g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NuGSIAd7zh4=:seheQNCytEX/JDiL7McP7S
 L+icPqMFClnOUkiR9xyxkrmVN3kBfyhrED8PZ+XA/HYvis2mbiAc6s6RYLvjKtgLSeC6qOcB8
 XeQxFsRbolY6Y1RFA/JVL5Hl74HrtzAiqRs9kl0H6C+ZnBFZzi8g019NQ3a25rVCpAipurhq3
 cViKnaMWa1HA/NNBgAwr9IngSVrsyeY5ifDyWtcXGFQmmOXePtP3kfsDFMbUW2fg3pi/YQY5b
 qG+H7ZZHOYxhmVzFax/t8ZsBWF/7ke3wXjpe4fiF/lNq3Amtp+JrK/sLyqIzzxM6O94Lkrzt+
 Ob7hbRu/OS2tdoU5p1jre+qQFj7ynN/S8cGaxLaBWmtmNUc7yK2n9XBMqRUN0ZKlAS34r7m20
 bM+xh1WwXQ4ZtmSuD11s3hIHhoALwXEKB2hMeoL/GvhKWl+xnX2Q3O3PYeL3uwHJJzlH3JBRW
 zgQFH1N3Od8FAclJIBJsMTbse9bCCPPKCpW7XhL4SbwKfru5yjg3y+Di+mygBdTzuQ6YwloXb
 YmLzZRSujjlampKZl0wfog1UeAA6XWExQRJsK2yOZJZDbNlMc6EGrVnLbOpez+VnJNF18+06L
 93M1blfC+bkuUGCobGt/yq3H9vZsJCk9iooBBBlNW15ik15io4A7iLcYUqFd+UJ8SRyw0vS+S
 tvo4HoBahkLymdiA7lp4nxk0rwg2joVxNCdkzthC3zQWSqsG/Uwoc6BdlhQFIhESkdNjdvFiu
 Lbea5P5hTrlfBZ7k3R1uwFzds9BzHdKGsKh3jA==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 15/10/2021 à 11:29, Greg Kurz a écrit :
> Fix the comment to match what the code is doing, as explained in
> the changelog of commit 86cf9e154632cb28d749db0ea47946fba8cf3f09
> that introduced the change:
> 
>     Commit 9458a9a1df1a4c719e24512394d548c1fc7abd22 added synchronization
>     of vCPU and migration operations through calling run_on_cpu operation.
>     However, in replay mode this synchronization is unneeded, because
>     I/O and vCPU threads are already synchronized.
>     This patch disables such synchronization for record/replay mode.
> 
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  softmmu/physmem.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index f67ad2998121..555c907f6743 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -2633,7 +2633,7 @@ static void tcg_log_global_after_sync(MemoryListener *listener)
>           * In record/replay mode this causes a deadlock, because
>           * run_on_cpu waits for rr mutex. Therefore no races are possible
>           * in this case and no need for making run_on_cpu when
> -         * record/replay is not enabled.
> +         * record/replay is enabled.
>           */
>          cpuas = container_of(listener, CPUAddressSpace, tcg_as_listener);
>          run_on_cpu(cpuas->cpu, do_nothing, RUN_ON_CPU_NULL);
> 
> 
> 
Applied to my trivial-patches branch.

Thanks,
Laurent



