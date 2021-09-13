Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 182C5409CD3
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 21:21:29 +0200 (CEST)
Received: from localhost ([::1]:59540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPrWC-0004Tq-6e
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 15:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mPrVH-0003gE-9T
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 15:20:32 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:43675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mPrV9-0003fj-U1
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 15:20:29 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N5VPg-1n0dOp2lUA-016slZ; Mon, 13 Sep 2021 21:20:21 +0200
Subject: Re: [PATCH] linux-user: Check lock_user result for ip_mreq_source
 sockopts
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210809155424.30968-1-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <5ec74137-ae15-a27a-5570-6ce2c791aff6@vivier.eu>
Date: Mon, 13 Sep 2021 21:20:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210809155424.30968-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GdLovE31zzbVi8igPwQMjUje4f1WiIBkpiKb7Is+qPHrj2HEY+s
 NO7zkzdcsscmzApL6ipu2qrrEDNc8UkKzZtK8usWOktSKbuXAskcWoox/cuDbBUSTp1tztl
 BSSZd5YuISKtBZg23cjvAq/05FMGC4eAXxNlhikVc2IKh4b6bEmNG6VFAA7d9qMs4FoulYj
 AbRTetKpmsVPmKd7SR0nQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aRNEJDgijlY=:NZz6yjTWlHizMccKFzc4Ld
 QnlQ8W8uHrBYw810+SvSnjlt5J1fBmpHQmyhRp3yXdD53ujYHWvJZmxfIkQ9UlyzibmYywD+x
 Q9N0P++ftOf7LeZZdGvtukiegsQTxm4oDg1lZ+WjG5hRBW4b20EGphGg85QU/ghqofczm/1vJ
 TRT4hVuUw27ymVZfO7u5cWhkGIoSkmTIIghdNPlAEPAGRRDLk/mmKvYlxazrxYnmBXw8b16ur
 wZsFTE+rWwkKykgjNm8gTjnraZXYQIBaYuk2+Eob4q+7+PKSvHW7ls6pX2K43JIFMOgQ9Y4p6
 LeI0YeuSqmxDSAS2WwpK9X+bQJzNFXjm2leZKYIEuuEWd52tzay+KPehVxB9IenPvmrq6/96D
 OvQByph0oT9PRr5DNkgcZ1gHcqN00bCxGnx/M7kSUp3/h2IC9tVecJKXXnY3ei6RaLBXuqWmL
 kW7VfjkMTAfe/rCbLj3A5/PsDtrggmSKjGW090+Dr1Y8ispQPFWkx3raHH74UJef64welT2wZ
 e3Ok/cwjmwlvE14GURUiddAbcoOBtoiPHPF8apSlCh67DWEmnXakZfhgcebGkD4sOuAqkghBJ
 w3iwGGG412NuNSci7Qo0vVvdLQ5NnjuQkdCFhyq7cA9ri1U+7PWTty3HW63AIetV8KBbZ8ZAX
 LjCRrZ1IexkwHU0q6TvXqo2Kc8lkzrpRph7bgRmtiUtknoawBYcnqrjIpiNdaEYyQwMklX5b+
 1JR3XXEQSwoT3yjwmzhUoVJjxxQI+S7syBJDOA==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.969,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 09/08/2021 à 17:54, Peter Maydell a écrit :
> In do_setsockopt(), the code path for the options which take a struct
> ip_mreq_source (IP_BLOCK_SOURCE, IP_UNBLOCK_SOURCE,
> IP_ADD_SOURCE_MEMBERSHIP and IP_DROP_SOURCE_MEMBERSHIP) fails to
> check the return value from lock_user().  Handle this in the usual
> way by returning -TARGET_EFAULT.
> 
> (In practice this was probably harmless because we'd pass a NULL
> pointer to setsockopt() and the kernel would then return EFAULT.)
> 
> Fixes: Coverity CID 1459987
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Compile-tested only; I don't have a test case to hand that
> uses these socket options.
> 
>  linux-user/syscall.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index ccd3892b2df..d2b062ea5a9 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -2121,6 +2121,9 @@ static abi_long do_setsockopt(int sockfd, int level, int optname,
>                  return -TARGET_EINVAL;
>  
>              ip_mreq_source = lock_user(VERIFY_READ, optval_addr, optlen, 1);
> +            if (!ip_mreq_source) {
> +                return -TARGET_EFAULT;
> +            }
>              ret = get_errno(setsockopt(sockfd, level, optname, ip_mreq_source, optlen));
>              unlock_user (ip_mreq_source, optval_addr, 0);
>              break;
> 

Applied to my linux-user-for-6.2 branch.

Thanks,
Laurent

