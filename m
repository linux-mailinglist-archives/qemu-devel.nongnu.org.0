Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1952589B59
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 14:01:18 +0200 (CEST)
Received: from localhost ([::1]:48236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJZXR-00010F-JV
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 08:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oJZLL-0001Bo-Pk; Thu, 04 Aug 2022 07:48:47 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:48597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oJZLK-0003HD-27; Thu, 04 Aug 2022 07:48:47 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N2V8Z-1nHxRS18v9-013wJx; Thu, 04 Aug 2022 13:48:37 +0200
Message-ID: <8f51855f-376d-39e7-72f0-850442afd3fb@vivier.eu>
Date: Thu, 4 Aug 2022 13:48:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ppc: Remove redundant macro MSR_BOOK3S_MASK.
Content-Language: fr
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 qemu-trivial@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
References: <20220728201135.223-1-luoyonggang@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220728201135.223-1-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ej/QQ1XXBwgMFNoytAiWp5+i8cXr21nFvC0sGl6h/W9qxX3Dv1j
 ZQB5DR4qSj2Xb+0dgidk+hT4b9qtV3iWUQvmI+YjmqIoDdPE5KhvyoKkRSYtK8nyEPRM4z9
 8u7yc8dEB+EnVOxiNGLxTGIOwb9LtS2B5scF/RQgqoPEWPaFri7n4eoiKTIrpuvSRF2l9OG
 aGTkb3OaEWXQpdjDbF9iA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1WUE8TvlsG8=:2NJSyavcHnnkuEIsJ47BbW
 dscvh3tTbfVzW/YT19PO+7O39xIN8LCdKvsSDvJvZ5J+thLfpf+wi8tkkhPdBxndSwpvqMkLg
 2og057q4hEtPFsOxqfs9CJPxaai/aYHI4XHXd0VHcynr3qdW3K6GAb+sUFAVsHK4oVqcYOz8k
 tRUFyVRLPG8aK0+8n2Dwu6F2BCyUkU/i9WxUjQbYSzqMIoAlkpMUc7wg+49SpwkEN1tU8oLjw
 zCBFAf0KWFL3NQaq5WYVvynvyyrSiYgTVcFp4RZIbwo5cXldB+ZQfxkeXg4CIp+s2dyBIqita
 WkXdu0yXPQhOajcDFtkiqi+5BhLvaQs+bxtVbR4phgLr2iewjxe17URMrEP3+d2w4n6DH2QOO
 nc5XtH/2KLEkzV2DK4TjxeucWGzz59ME5hffz2N4Sk/y2TNjsExARFC2rRfuOyhFfr5gnVJaJ
 2hlnkAfmPC3K89EVBq8+WXDLHV2FxUbg0Uca5pJc2NpvkX5L3OupttWI/yfWZJh00BhEBL9uJ
 Hb3tDR02LNLVcH89vXBPHpaxNmLdRogO7ZkmZAY3OFP7v+kkJnfEzxHgwz73UBFfTf0I2XQOp
 gl5TvLIflbF5+Q2EstP7bqerYdkmHATo5Bt/ucXXaKfbswsThXpvtjfofxW6M8GCOW6I3fAw6
 Sgr6Rg1Z4lhwGMETLw7UIGnowt2miYGMUyLGBfJhxvrtaqPIzhDhh7CibkJKqXTo9iQU6VF00
 nMij+smEJn6qlDQFk+t3cD8Nrq7A8odFdfRi3g==
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

Le 28/07/2022 à 22:11, Yonggang Luo a écrit :
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>   target/ppc/excp_helper.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index cb752b184a..7550aafed6 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -2015,7 +2015,6 @@ void helper_rfi(CPUPPCState *env)
>       do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1] & 0xfffffffful);
>   }
>   
> -#define MSR_BOOK3S_MASK
>   #if defined(TARGET_PPC64)
>   void helper_rfid(CPUPPCState *env)
>   {

Applied to my trivial-patches branch.

Thanks,
Laurent


