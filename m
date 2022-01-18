Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BB1492533
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 12:50:17 +0100 (CET)
Received: from localhost ([::1]:38892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9n0C-00041v-C6
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 06:50:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n9mtI-0003jy-Jl; Tue, 18 Jan 2022 06:43:10 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:47999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n9mtC-0002nX-QA; Tue, 18 Jan 2022 06:43:07 -0500
Received: from [192.168.100.1] ([82.142.13.186]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MbRXd-1mcvyn0ydd-00bwah; Tue, 18 Jan 2022 12:43:00 +0100
Message-ID: <11f9cfb4-138d-01e1-df55-e82eaaf1fb96@vivier.eu>
Date: Tue, 18 Jan 2022 12:42:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 3/3] linux-user: Return void from queue_signal()
Content-Language: fr
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20220114153732.3767229-1-peter.maydell@linaro.org>
 <20220114153732.3767229-4-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220114153732.3767229-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Q2VrI5PDh/LaBPSgezUvMuOi6oaZmJ161YFgl5CQ1VkT1Boj2tr
 yLCyfw9JH/0f+aDDI3tYGQooNMfxcVR5Gbg9IscDYYV9xsCgzvgsR3fFuwsuNh69DA337Sf
 6ylASZNveQx/TZOyWFQBz8U3Vi+pdjLBTrYgbHSK8JbpVhq2NQ8SGW/OLwl2vs8y8Yn5sSW
 hla1Jzwt4uWelWXgFeI9w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5IhZgSvuImA=:P3eWMt6OQ7vZmtMPsW9G/h
 MC2/H7YgkL/vyGDUjTWXBAhzmwq80TR3TvKTEI93VpGArfhyO7iaqUKnHilom5l4ZgxnDrPsc
 WM0/HgOI7BddzGul0EcaYiEprQZc541dscbxXwTEXBc62QT2l8k/p8isM5dEAXg7Etw4E0UCq
 K+IrqOKcvC3fSnYxraV84RjaUPiKFT3wx/QB2xHD83xzcqW8QDWxxHDGkwNm80QdU5xJ361EJ
 uLfBNK2Otyd3n2oNwRBLOeXGNuu6x4lJItW1vKtd71u5kpKf5ueSKILSM8Zl+45XXpSIezPNV
 7C6uplKqw6h93ARNS7Fwcot+TeIOSPeEM+nIIxHZIGXfl6HiqgOMokPt465ZPKmZ01J9mKMM0
 tO3ZOZUWqQtE5DhPzIgO4ty4UsI/ZKBwmYnuyhsvShdx0FZ4xF6BJpJPHIfGWXQCTc7VqxLRb
 4MOdT00VLz147CgnqoOMmsgFPhVo7XXY+nClDYZgwKNE4HPNGp8gzD1a1xdkBCKLz686awiXU
 gTbGeq1sUUenRVbCRp/BYn9rzQIAYTwafOmUoabUvVaPknlf33DFkLeQjfi0agprwCy+tfAZe
 R8hpkLXjy5qEWJ/1IxlU7dr2PTycRxnWFlAIQyjH/WwuEdVVYQdvRwIq2KirqX4nZslwAK/aA
 yFYQxBdi5O2DnETlIzo8+RehutZi+e7JSX1WVLIs9JJIwxfRZwbUDS7uc0JbY/Lxpoto=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 14/01/2022 à 16:37, Peter Maydell a écrit :
> The linux-user queue_signal() function always returns 1, and none of
> its callers check the return value.  Give it a void return type
> instead.
> 
> The return value is a leftover from the old pre-2016 linux-user
> signal handling code, which really did have a queue of signals and so
> might return a failure indication if too many signals were queued at
> once.  The current design avoids having to ever have more than one
> signal queued via queue_signal() at once, so it can never fail.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   linux-user/signal-common.h | 4 ++--
>   linux-user/signal.c        | 5 ++---
>   2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
> index 42aa479080b..2113165a758 100644
> --- a/linux-user/signal-common.h
> +++ b/linux-user/signal-common.h
> @@ -59,8 +59,8 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>   
>   void process_pending_signals(CPUArchState *cpu_env);
>   void signal_init(void);
> -int queue_signal(CPUArchState *env, int sig, int si_type,
> -                 target_siginfo_t *info);
> +void queue_signal(CPUArchState *env, int sig, int si_type,
> +                  target_siginfo_t *info);
>   void host_to_target_siginfo(target_siginfo_t *tinfo, const siginfo_t *info);
>   void target_to_host_siginfo(siginfo_t *info, const target_siginfo_t *tinfo);
>   int target_to_host_signal(int sig);
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index bfbbeab9ad2..32854bb3752 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -780,8 +780,8 @@ static void QEMU_NORETURN dump_core_and_abort(int target_sig)
>   
>   /* queue a signal so that it will be send to the virtual CPU as soon
>      as possible */
> -int queue_signal(CPUArchState *env, int sig, int si_type,
> -                 target_siginfo_t *info)
> +void queue_signal(CPUArchState *env, int sig, int si_type,
> +                  target_siginfo_t *info)
>   {
>       CPUState *cpu = env_cpu(env);
>       TaskState *ts = cpu->opaque;
> @@ -794,7 +794,6 @@ int queue_signal(CPUArchState *env, int sig, int si_type,
>       ts->sync_signal.pending = sig;
>       /* signal that a new signal is pending */
>       qatomic_set(&ts->signal_pending, 1);
> -    return 1; /* indicates that the signal was queued */
>   }
>   
>   

Applied to my trivial-patches branch.

Thanks,
Laurent

