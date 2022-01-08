Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE16488527
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 18:58:42 +0100 (CET)
Received: from localhost ([::1]:39444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6FzF-0002x2-0E
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 12:58:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6Fxo-0002Fk-W6
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 12:57:13 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:36403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6Fxn-0000yK-EQ
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 12:57:12 -0500
Received: from [192.168.100.1] ([82.142.12.178]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MQuLB-1mlYPf011L-00Nvgf; Sat, 08 Jan 2022 18:57:04 +0100
Message-ID: <dec78285-91c3-967e-59a8-d8a7e6e82ef3@vivier.eu>
Date: Sat, 8 Jan 2022 18:57:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/2] linux-user/arm: Move target_oabi_flock64 out of
 target_structs.h
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220107042600.149852-1-richard.henderson@linaro.org>
 <20220107042600.149852-2-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220107042600.149852-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uP7ytHZ5EkV23woUfSx/uf8SKdayzEeUbCmKt3GAs5YZpJEy0pz
 gZ+71Lhi6544B3iBHYdhaDnCEEhY2zH7y97JNDRP0QPCciYfcXupn4RfqKbCi+cuO1y2FJL
 cEOWFjozlPPeasP0lH/IOw+LyS+IVXSjEAiG4LsNnyRS4CJDvC13qJ/G5Bwwyw3c/s9O2DW
 uKw5feb8WrPI3ab6J7wQg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VuOoFKfFcUA=:8IVbejqSVYM8dFvbXPvyx1
 JP/Qu3BzZdWyE8zMF5ibz30Z+iFBQqTM7/SwIiUKqu3q1OZ5o7IoUJgGxPmTLNxWemzn6NS80
 BY+oq2uxbyNiEDAeZVh9fpoeM/QKIiSF13B7N/aiqL/ToLVSiFlVkGP12VTvCCRxg7KrLSp4m
 +HxAPSaNjlpQpXxC09uCYid5BiCIP9pOH57KgwTGU7mD1TtrkVhPi88/omHHhpW4PKHaOZYhR
 v5rcrUmDBoA642zRnVAZ+WG/AbmDXrgyrrFH/+CmVa3nhc+wSGiRaSRAS0CRXXH9QdsA2Ujte
 mGMT3iEFHVaeQfhqjGFDyGTkPtgxjZfYk5nj/YyKzOcmID51I7QDX8P4JKSUDtpaJhr1orAYk
 bNjrvQMJFtpwteU7GCgRVLKejpQj48G77Oi6j2o1zwdEZGjnypOE2cW1TFGqA2oSNHpbbnQPc
 fl1uXM1tcOFnfkp5r92/V4yQor3SN2++LghR2jg0XzvsrExq/2smALZABIg1WIW3bd4CECGzA
 mw54ZSrlESm0qnF9HR2WEcTtOo7UdcJe/1r1r0EzKYe5LPaIrHQaqYAjVV3FMXkZlp63BPJ3v
 v0rJlQA2XH8DX26yi3+1OczjRcljdEWC3kBVJI835Eng77Z+ptyvE4Zaqv4rawQcmydVOhpEV
 w+2KztOQ48Ai1OLMfZoX7qNtRaBm1ADLqmIjOlQmFGAG5taRJzJs5sFGuwGm0TTcSxI4=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.199,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 07/01/2022 à 05:25, Richard Henderson a écrit :
> Place it next to copy_from/to_user_oabi_flock64, the only users,
> inside the existing target-specific ifdef.  This leaves only
> generic ipc structs in target_structs.h.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/arm/target_structs.h | 8 --------
>   linux-user/syscall.c            | 8 ++++++++
>   2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/linux-user/arm/target_structs.h b/linux-user/arm/target_structs.h
> index 339b070bf1..25bf8dd3a5 100644
> --- a/linux-user/arm/target_structs.h
> +++ b/linux-user/arm/target_structs.h
> @@ -48,12 +48,4 @@ struct target_shmid_ds {
>       abi_ulong __unused4;
>       abi_ulong __unused5;
>   };
> -
> -struct target_oabi_flock64 {
> -    abi_short l_type;
> -    abi_short l_whence;
> -    abi_llong l_start;
> -    abi_llong l_len;
> -    abi_int   l_pid;
> -} QEMU_PACKED;
>   #endif
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index ce9d64896c..ca6e0b8fb0 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -6927,6 +6927,14 @@ typedef abi_long from_flock64_fn(struct flock64 *fl, abi_ulong target_addr);
>   typedef abi_long to_flock64_fn(abi_ulong target_addr, const struct flock64 *fl);
>   
>   #if defined(TARGET_ARM) && TARGET_ABI_BITS == 32
> +struct target_oabi_flock64 {
> +    abi_short l_type;
> +    abi_short l_whence;
> +    abi_llong l_start;
> +    abi_llong l_len;
> +    abi_int   l_pid;
> +} QEMU_PACKED;
> +
>   static inline abi_long copy_from_user_oabi_flock64(struct flock64 *fl,
>                                                      abi_ulong target_flock_addr)
>   {

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent


