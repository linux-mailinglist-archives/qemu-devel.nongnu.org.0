Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F25DB534424
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 21:19:32 +0200 (CEST)
Received: from localhost ([::1]:57394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntwXb-0006Q1-KE
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 15:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntwWR-0005bX-8x
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:18:19 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:41901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntwWP-00024e-Ly
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:18:19 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MbjBo-1nGlx22ZKw-00dHYA; Wed, 25 May 2022 21:18:14 +0200
Message-ID: <f2abc2c5-5e8a-e29c-a730-875b71ba6e52@vivier.eu>
Date: Wed, 25 May 2022 21:18:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 04/17] linux-user/m68k: Handle EXCP_TRAP1 through
 EXCP_TRAP15
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220430175342.370628-1-richard.henderson@linaro.org>
 <20220430175342.370628-5-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220430175342.370628-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:222qy9Zge/vNZd55vAqZx8ENOKN0n8YQ/NAuZ5tK7IIzQhqouBM
 SddD5krjuw+MUNXvrHAMShR3qHUU4YcNjt3XRoh4W/o6FMmdBc6jlLjf2XET/JghcS8LxPb
 RT6pq0uzUR0zpjYFTM72dhL7olxCYYWJ+L4TZJyy2dXV1Aeu2MQonlkTWwuryktoI/Hbgkk
 54nk3urLHF4aVchCOXVlg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rkIMfl3HStk=:90zhJxz0qMeH3s3IULhm/h
 rp0seGMnCIi2MHCUql27VeEQPZmG5VSfgCONvdJ9UgJJfwRZK1qS8DLK4IE215u6gyCfnTVwN
 97RcBvIeaO8N76ljH0RAKvI4D/FhnGYUcdRTOtq5nQl3yW+qa3pATZgC77yN0OnwU5puWufxj
 R0YNiGRnx+U6ND6Bv3IEZlOpXvdr2J3N68Lqu9WB/AjMbu17ifuKbspS6RyMmd1MJ6JbwKXXv
 y0dpDgWw/NNaCSWDK7gJ/Y0nt8IWG/Q2XSJYKK3Bamy2orwT+MKrMytwkdo9Prsajdo35zeeI
 7nKrlwPQykBccgNt7PQUbXpYBW1Tcs5XMrHVVGD95gC14e+9QHOd+32Ug2f2hNbD5x6iNYMjV
 M3+a98PsrsEXje3REWveCT4QB8wxwZU4/TugSIs7HRbyAgyXDy7+6I+mNMRQd8JA7E82czcES
 EVLNxAGs9uscp+MJgdsCgr0dFHQS0J+R3A7MOThT+bVQj+fzFgL3TUnhCxIPeVcW1MgbHhVoF
 +RnhQCxGtsFbM+w28oA0fJMS0aETarD5SxzVdiPKqb/RZDARmQ8Z8+Hkwws+FZbQUjJPnqhW5
 RlmmKp5DdA6aYSjQnHhmrkXtZyTHm0uu6jS9DIlfBHhkWVz8LNEW/iqkGuPgAkWj6rUgVRBw+
 ePDz0ZEKRXYy67ZTx/dBgYKFO4edaOMhNaiC/AQ+f+RrLQYyL9AzKxjSeXfZORkH0aqskR3Ia
 9aWMLkXv6SzbC8SOZ6Lg8UMjGUZC/u+1EyJU0A==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 30/04/2022 à 19:53, Richard Henderson a écrit :
> These are raised by guest instructions, and should not
> fall through into the default abort case.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/m68k/cpu_loop.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
> index 56417f7401..6ca3e1e63a 100644
> --- a/linux-user/m68k/cpu_loop.c
> +++ b/linux-user/m68k/cpu_loop.c
> @@ -44,6 +44,7 @@ void cpu_loop(CPUM68KState *env)
>           case EXCP_ILLEGAL:
>           case EXCP_LINEA:
>           case EXCP_LINEF:
> +        case EXCP_TRAP0 + 1 ... EXCP_TRAP0 + 14:
>               force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->pc);

In kernel, VEC_TRAP1 to VEC_TRAP14 use ILL_ILLTRP for si_code.

Thanks,
Laurent

