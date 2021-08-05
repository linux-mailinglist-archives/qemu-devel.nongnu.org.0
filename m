Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFC93E1273
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 12:19:40 +0200 (CEST)
Received: from localhost ([::1]:59334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBaTT-0004Aa-5K
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 06:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mBaR9-0002b5-Ic
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 06:17:15 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:40959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mBaR7-0004jY-SO
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 06:17:15 -0400
Received: from [192.168.100.1] ([82.142.21.182]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MtwpW-1n1D5R1VHw-00uFxc; Thu, 05 Aug 2021 12:17:05 +0200
Subject: Re: [PATCH] linux-user: fix guest/host address mixup in i386
 setup_rt_frame()
To: Ilya Leoshkevich <iii@linux.ibm.com>
References: <20210803171858.148394-1-iii@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <35224ebf-9b2b-d5bf-dbef-04e798d952cc@vivier.eu>
Date: Thu, 5 Aug 2021 12:17:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803171858.148394-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2Ln3YqM9r43Iz30i/TvmEa3tNPehqbhk4qLGAicyxaUAT30Ed0J
 fuky9XCsoU7zvPL4cE6UGehXb2lBvPMEPMd4yeZzEGmcSj+xVgfRF4KJ9ljqDl4k+e0+2pG
 t9GTJJeH6h/8+11sQDzbrDwNmJhPvZVDiQu/U94bUaRd+Uoyo42HaaJz5StQZ9fFZgISNlf
 iL0L9vl8Q57kJMrcOKzDg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6+8vU/7qIa0=:en7B2DGm4da1TSegCWotA9
 8Jwm2yX4oBXDBMQtdEc2QoV1J38R/0bSyAGyrkRdewFn3MToXiDD+iOITo+SsColOafmUFDEO
 cx+FSfaKO8VhM6Hn1JLJVKMUuh+gFoRSiUjguax4SJwN/0NJ7jhO+N9qHMPVsX6DFKtuZqUJS
 vPTxUO6tDCQ7dDeCgTw5p5iJB7flKLdo0lBFIw40V8hsMmpZtKIFemL9W6V4YThheKaH2dRna
 adn+2uoJCaLOP7XqG0xLeMTvj3sHcVExIm+rC+ZYyx8jGGs34lPPzMo8InIpjdX6JpNaCdnMJ
 kL+2d9nqVIQpLNdLdFslLMZA2zyXeIFaRDBem9MAjG5rWneuQ6ftUNH2POazUo/gg8rwdZpuJ
 ISVa7Z1ZlQmp0QwxUiat+wjQgC1WLE5tdFs2X+TJz8KE5tGLc31sqfhfrrc7ZrhrrS16zre9Z
 K/YAr+pPu4K60640hf7TVsc9Au2wmrnYwGVXr3emh0A+ZxNNLBsvj4ZFpOblszAOdJrQ12WKr
 34gdDar2hB41gMNGSz4cM36eddUweEDUrAdoHa92jjmvbP7QYYhxCT/2qIfDouzAQIsslOo9w
 UgDS/WxL5XKef8/k7tTSR1fZvAnm00OHc3sfAz7SYkZdeLJH8lcMwLh2sG+v8QjrckGLo+XMC
 V/dEnXEpo2kTYrNUoX/7fCMvzGv+RXmQeeEgyHX8+k/jmAR4AYc8wlF0gU1D7jmAMHxATn5nj
 Nsm+ZeTf4zunljs5jd+Zp8xBXVlcnxSly8Tsn0JtLcgKba0tKC4xJHvBPVaLbqyS0sj8zqFQ6
 vCWw0vtsU3hqV0UkLNEt25s46xEo+I5YTdgeVQnA/o+/KikgPQ+WpOS5L7CeaIcGHGlOatL
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.132,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 03/08/2021 à 19:18, Ilya Leoshkevich a écrit :
> setup_rt_frame() passes siginfo and ucontext host addresses to guest
> signal handlers, causing problems when e.g. emulating x86_64 on s390x.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  linux-user/i386/signal.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
> index 8701774e37..841cd19651 100644
> --- a/linux-user/i386/signal.c
> +++ b/linux-user/i386/signal.c
> @@ -436,13 +436,13 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>  
>  #ifndef TARGET_X86_64
>      env->regs[R_EAX] = sig;
> -    env->regs[R_EDX] = (unsigned long)&frame->info;
> -    env->regs[R_ECX] = (unsigned long)&frame->uc;
> +    env->regs[R_EDX] = frame_addr + offsetof(struct rt_sigframe, info);
> +    env->regs[R_ECX] = frame_addr + offsetof(struct rt_sigframe, uc);
>  #else
>      env->regs[R_EAX] = 0;
>      env->regs[R_EDI] = sig;
> -    env->regs[R_ESI] = (unsigned long)&frame->info;
> -    env->regs[R_EDX] = (unsigned long)&frame->uc;
> +    env->regs[R_ESI] = frame_addr + offsetof(struct rt_sigframe, info);
> +    env->regs[R_EDX] = frame_addr + offsetof(struct rt_sigframe, uc);
>  #endif
>  
>      cpu_x86_load_seg(env, R_DS, __USER_DS);
> 

Applied to my linux-user-for-6.1 branch.

Thanks,
Laurent

