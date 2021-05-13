Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5C437FC2F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:14:18 +0200 (CEST)
Received: from localhost ([::1]:39294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhEuf-0006KY-BH
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhEij-0004jO-W0; Thu, 13 May 2021 13:02:01 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:57009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhEiW-0005EN-AS; Thu, 13 May 2021 13:01:56 -0400
Received: from [192.168.100.1] ([82.142.31.78]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MQMdz-1lu4bZ1ppp-00MLfD; Thu, 13 May 2021 19:01:28 +0200
Subject: Re: [PATCH] target/sh4: Return error if
 CPUClass::get_phys_page_debug() fails
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210505161046.1397608-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <c3913d7b-ad34-ac50-26d9-e737fb0e847b@vivier.eu>
Date: Thu, 13 May 2021 19:01:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210505161046.1397608-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JmNIjp3OxSnSHvRFvWrsTQKtyNttDe0r6i6agqGNvkuXzkebLsJ
 xTuQutpOnh2DHHGsZ4i7X/LjtKU1dFI3FlWU/6KXv8BYN/5E4GkgM5vuHgWmyd8pfpNN78F
 DWRbDFkrfKqzbn4ZXpXrSRDVDAs2Tw77h97UySW83Jgqj0pIsHWxvUf0MAY7ppZcuUfBniW
 JWXJS9L9wSTuQ1Pk0vGNg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PPVmHdL2nyQ=:uhFdmVl/TCAxLpFzetjaI6
 epjq/KMhpmUlFUz2cVaGtNZjRSW7dLKgJ7+crGHgb9SAjE8ccTVNtt4t+yiys54IeX2M0nMKF
 HY39dRSUZ4BUqQ4r/rsaU4HBA0wxjG2l9j/KhcHhfDGOFIbnXDjNMnSsvoEckQoESGfBLg9BO
 0sRz5gWvmcCX3BxIkOqrpaGd8WFsoejtqBs4v1zu01BXNlz2Uok8sgyHHX4tD4BfqyYPjER9B
 ntkTj88f0rpISlI5aeBANx+8S2RbZMX0plwkQxSsMm5nBKX+fr2cwZ91rpnfF7ZkY/BHgqJpV
 HFZVJynZfFqeMOXBWdXcYyzyEcR54wiNbWgf4SueUTZQQfNweDWMs9nef4qV8c9WpE8cNAdbC
 GGgsE9bSp3h2u8IykoSL1aZAIYNQEQHDE43xqQVK0Qw4zJ8SVH6/5hweaZu6Nbd0CTGcj9Zgy
 jlYoX1zZb+F0SmKH23EPl2cfacPbAendvpJ4KwSepDqbNHXK7Iiql2So/aq0hYD8nG0wRUaay
 wOanbwrbPyyeTQS/fuV85M=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 05/05/2021 à 18:10, Philippe Mathieu-Daudé a écrit :
> If the get_physical_address() call fails, the SH4 get_phys_page_debug()
> handler returns an uninitialized address. Instead return -1, which
> correspond to "no page found" (see cpu_get_phys_page_debug() doc
> string).
> 
> This fixes a warning emitted when building with CFLAGS=-O3
> (using GCC 10.2.1 20201125):
> 
>   target/sh4/helper.c: In function ‘superh_cpu_get_phys_page_debug’:
>   target/sh4/helper.c:446:12: warning: ‘physical’ may be used uninitialized in this function [-Wmaybe-uninitialized]
>     446 |     return physical;
>         |            ^~~~~~~~
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/sh4/helper.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/target/sh4/helper.c b/target/sh4/helper.c
> index bd8e034f174..2d622081e85 100644
> --- a/target/sh4/helper.c
> +++ b/target/sh4/helper.c
> @@ -441,9 +441,12 @@ hwaddr superh_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>      target_ulong physical;
>      int prot;
>  
> -    get_physical_address(&cpu->env, &physical, &prot, addr, MMU_DATA_LOAD);
> +    if (get_physical_address(&cpu->env, &physical, &prot, addr, MMU_DATA_LOAD)
> +            == MMU_OK) {
> +        return physical;
> +    }
>  
> -    return physical;
> +    return -1;
>  }
>  
>  void cpu_load_tlb(CPUSH4State * env)
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


