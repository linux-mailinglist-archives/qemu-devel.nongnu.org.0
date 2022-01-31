Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E93054A3F74
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 10:42:56 +0100 (CET)
Received: from localhost ([::1]:54200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nETD5-0000tw-DY
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 04:42:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nET9t-0007JY-Nh; Mon, 31 Jan 2022 04:39:38 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:43077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nET9n-0000Kz-3B; Mon, 31 Jan 2022 04:39:37 -0500
Received: from [192.168.100.1] ([82.142.10.94]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MjjSt-1mXfMJ24NP-00lGNn; Mon, 31 Jan 2022 10:39:20 +0100
Message-ID: <d559d8ee-2433-bf87-1530-01ceb9c20fd1@vivier.eu>
Date: Mon, 31 Jan 2022 10:39:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] linux-user/syscall: Translate TARGET_RLIMIT_RTTIME
Content-Language: fr
To: Serge Belyshev <belyshev@depni.sinp.msu.ru>
References: <87y236lpwb.fsf@depni.sinp.msu.ru>
 <4e110850-a303-d0a4-158b-6186367aa739@vivier.eu>
 <87ilu2l473.fsf@depni.sinp.msu.ru> <87ee4ql3yk.fsf_-_@depni.sinp.msu.ru>
 <87a6fel3w8.fsf_-_@depni.sinp.msu.ru>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <87a6fel3w8.fsf_-_@depni.sinp.msu.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6J38ln81Pct2rWX3V4xFWMSIb0SaG99uhDfONmVZGMXfWSAXNqM
 KVHZHAu2+MaReTACrf3eIdmnugw0MJnq0TjRfxVyv96VrMVVOV3NtRENHB0Fb3VKLgHzQvy
 0f6frGGwsxGL2E9cIIIy9P0U+AcyApGPCjBwJlPl8Qc/VFq0AeX7v1oBN2kVAwXd9hGh/dt
 fppMFsndr/IeKjPIb23Ow==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aDjWgExZfhE=:82jzUeJ8eCgDdBYDBUj2fm
 2TL0gH2+UGK/frYL/GzXGqjEbUe2vlMT5FaqxO76Pm0JrJEub6h9igLzhCDd847Jkxl/CQEkF
 aQ1lrNbo6CYKm8BQ/si2eBq40V8MNNcE6ze1aktARImsv0eiZAyLD/arqx3jqdeyMRXCfu0vy
 h6JfrQhPtmkNOIhWTubvaXuwoC3ccpAWP8MoXtxsZqQSc9rbqCCDQYwa4oj/XrSnSBFiXqbow
 3x1NOq2Xw6YH9gBgu5rsSr1kaRCgy/4xJP6LkT7vSPsP93YrSC5yJJaQlSVEZnwXtKyfjRioD
 2MVu0ogGAZildbY6gteD1bE5LWSUpZWmR8bVCdzj8Nk/CNG0u/tFdxsT6Z0/q8CrfpfFb0sdD
 rbgKqEc79Da225V1I/88dIhj7nJIswzS+kljMnmRl3lv4ToyiwgYS8386L7J//UjMV7f8RRN5
 yzyLyrBS6WZkWP5Qdt2sKlyquaFpVhKekZg9B8zyvUuqamdeCwtsn0tZyPfWnI6nGPiQpQzOf
 5t75WtdEDSqnheJqZDfGl8y5t6inOgb1ovIR8gG5e0t6szcFXOv7NF32mD1IqlvGjfQXpLqbU
 qSbOfQCrI5WWgAGXWz7XmfUWAIHwJEU2L14lVjTYnvPXzUylUyCZTHRJYkle2nAMtMTI6a+OJ
 p9qCVTuAoI1aDxwnBOiiKaE4uZ9I/sEcX12MAtuoAJsgRHhJxktfgassn2nRLM8ulLqg=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 29/01/2022 à 20:48, Serge Belyshev a écrit :
> 
> Signed-off-by: Serge Belyshev <belyshev@depni.sinp.msu.ru>
> ---
>   linux-user/generic/target_resource.h | 1 +
>   linux-user/syscall.c                 | 2 ++
>   2 files changed, 3 insertions(+)
> 
> diff --git a/linux-user/generic/target_resource.h b/linux-user/generic/target_resource.h
> index f04c93b125..539d8c4677 100644
> --- a/linux-user/generic/target_resource.h
> +++ b/linux-user/generic/target_resource.h
> @@ -33,5 +33,6 @@ struct target_rlimit64 {
>   #define TARGET_RLIMIT_MSGQUEUE          12
>   #define TARGET_RLIMIT_NICE              13
>   #define TARGET_RLIMIT_RTPRIO            14
> +#define TARGET_RLIMIT_RTTIME            15
>   
>   #endif
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 5950222a77..6d41a741ac 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -1083,6 +1083,8 @@ static inline int target_to_host_resource(int code)
>           return RLIMIT_RSS;
>       case TARGET_RLIMIT_RTPRIO:
>           return RLIMIT_RTPRIO;
> +    case TARGET_RLIMIT_RTTIME:
> +        return RLIMIT_RTTIME;
>       case TARGET_RLIMIT_SIGPENDING:
>           return RLIMIT_SIGPENDING;
>       case TARGET_RLIMIT_STACK:

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

