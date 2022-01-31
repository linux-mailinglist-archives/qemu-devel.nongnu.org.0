Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D3B4A3F42
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 10:29:53 +0100 (CET)
Received: from localhost ([::1]:44550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nET0S-0002E2-Ba
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 04:29:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nESxo-0000Um-D9; Mon, 31 Jan 2022 04:27:08 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:44061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nESxk-00077o-BT; Mon, 31 Jan 2022 04:27:07 -0500
Received: from [192.168.100.1] ([82.142.10.94]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MLR5f-1mw6jP0Cnr-00ITaM; Mon, 31 Jan 2022 10:27:00 +0100
Message-ID: <8cf4a787-8517-9f65-417b-41378c5b6b79@vivier.eu>
Date: Mon, 31 Jan 2022 10:26:59 +0100
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
X-Provags-ID: V03:K1:N1b/jROfOTiY7bP5iaQPegCm4xURnwcDx/dSTJIoHC4+vTS0HY9
 JsnGmJssX7eXNPl+GMjUH91bjv9O7LpSGwfQiaIi7OnSPxXTX2PWHId5hi2fPYJhIShoJMQ
 zZRk5fdrV9uxQBpIg2FMPvXEhfqdnsMvOGF1ihN2iOd74kDCbhbe4L7PqDADbLe8q4dRWAr
 /aK/V5jyHfcFAi774kaXQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:52NVN5MkmXc=:fOxzmbg3QvfPb+MBnQ+DgI
 3s5gY97jw6iXWhMoCE4cxZTYiCrHxn+3mgIXayVJ7qJlkRd1/tgQ4AqFsmp423Rq+nRch77so
 Va6V84eEnOmp3yD4Op08V5rlADpV6zzJENw/5vAgRf9XTsqFT0jAhLJJu6P7m7pXyJF/TdrKK
 s7jqWbGKUomaLE+ZdOjtVX9S+hmklsoeghYkFbjLXFCqANHQJNGs+hUwARqYqATQ/cI/1IGKl
 8s/4aCwBGaDio024AZV165J0OTogu+91gN17pv7aCEzDVviZmCrf5VGU5LxhfzykgvAIR5iBP
 g75sOAgL1g1eWjQtMP+xCEPL17GaKqEamxJdecjnNaabK5q2FEKr0x3jPJHTrW7M+YSMH7Qme
 L/LT7W+3QXxmKfnBz2n8vbqotcFsVpD2fEALedQcPln1ZKuUHlTEXPaj59yyp+muOPAOPf2HL
 6xyY2Lz1zZsCQc3XJlIdBdMRNfa29qg+P5k6yMkUH/moA0740ZwjT+vk2SrZfvT7tBW8vjoHI
 O8opMDXD2AwSHS7fjZQwqmiCD5BYVd1GVf+TJhYSn/kdJD6nNrV7i2cN1RFtWS/U9Vh3rBJcx
 628Nxb/Vg4VvtbJZ0QXA8qqhQG9i9VRy60kAvTzXQZY7Ra1MD6muXK/J7TEq4oLdKdTmj770Y
 SztTx3loduc3CdyC9tSQ/IaXJ9n4h8m8sukKrJyqyrMGQYVWwJa3KsxnIq2+rFQBIxnU=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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

