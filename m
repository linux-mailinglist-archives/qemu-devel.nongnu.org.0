Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A713348852C
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 19:02:06 +0100 (CET)
Received: from localhost ([::1]:43162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6G2X-0005fP-Q5
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 13:02:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6Fza-00044n-9n
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 12:59:02 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:41535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6FzY-00015p-Lx
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 12:59:02 -0500
Received: from [192.168.100.1] ([82.142.12.178]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M1qbm-1n4487330K-002E8H; Sat, 08 Jan 2022 18:58:55 +0100
Message-ID: <aa3c8147-0c6d-0ffc-4986-4723f0de3833@vivier.eu>
Date: Sat, 8 Jan 2022 18:58:54 +0100
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
X-Provags-ID: V03:K1:NeSFAwgB0tq1zi4uH/Uo6cYZGvqBCImrv08CywX5e4RtUt60vSU
 F1IWtkUdyadrceiDOqib2Y0v2qNAhAx1PIR4xmBtleepnLzowwltw2EURJFv8lm48P66nx1
 aZJ9mVJSKe4uQvq0ijZvZ/aapnWzmAYl8yE6Oy9gwlnPWKjqYrYf5C91JlVQ7VlDeYuzIRs
 wsqiBnOhDBL58mR19z7uw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yzaEj6BXdGs=:f2ISbARAGsMyDx3jvlYzUL
 esW5MRgDwDDYhSr09/y5F73EUMriYjPkvqDjxIR2Ob1omX5AbnClLjf2rXCrCJsxZgdm1bMaV
 m52sYrsraGKkleiXyzs2kPkbBZCQ8/8LpUHYdwE46KrVHAqcN0dgT2alOwyT5faIIWf/VUvoH
 yu/IUufksSSUGUEYAZY2BomsbnQKTXIb3rqLh5pSAsPA6TVluXyi4nV5vr68h1+22dNw3FX5t
 rzlIRIYnhOgYOBfZDKqW19QFnbbxxcU+NrsaEbRt6IuGAxwUrL96XyosUBEG/UYQCvOFVBiMY
 Dp4exXK3sYoLTZyot/67rvcfVDMZS6YGczUWU7FW03DqVO8NJDWXIQjC583DzEDJOwkMnCc3h
 4hXXofcaNgqobG8CA2yxmPvXCOdFpy2cJ61lkC62M37qfzuNqGr/V9nxW2o6MjrifX66Ha5hG
 r+dvOXxTtJQqyu6NFXFD4flPCr0Ns9itaa1TOHHKo/QwdH8Xi/1vhrQ9ZRqSFta4Z4ArF1KP6
 +WlCci92SxC7V2Oqjnm+sPqY5JLpGPP0LNEseVNe/Kw2hI6Eo4t4cD92l0S7wfxW8jJTOo6R6
 exZRN2e8Jeg4NAWNgupJRZLCMT7wjIZZm5RwV2HTIF3Fb9fmS2fnLR5Re2LprIDEyd8DK2Z8G
 9Zjm+iHcLiVpDUSBc+H83OgBLUQNqzdMMuskYp0SCCiQ9nZiMZ/O7Jal12YdXoRBfoso=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

