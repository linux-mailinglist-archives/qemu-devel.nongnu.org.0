Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B50D65844BF
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 19:19:53 +0200 (CEST)
Received: from localhost ([::1]:47138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH7Au-0004xQ-GP
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 13:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oH797-0003T0-H9
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 13:18:07 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:57739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oH795-0004WI-NY
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 13:18:01 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MXY2Z-1ny8AW2avn-00Z1JG; Thu, 28 Jul 2022 19:17:55 +0200
Message-ID: <5886bdc6-95bd-bfb6-dea3-3bc18076b170@vivier.eu>
Date: Thu, 28 Jul 2022 19:17:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.1] linux-user/flatload.c: Fix setting of
 image_info::end_code
Content-Language: fr
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220728151406.2262862-1-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220728151406.2262862-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ku5yWSjxhasfOJvltfJKbjD33E9FLIJH9QH04U2JoETdoXxL3qk
 FdbnuJxai4ZDRpM1fceOB4UbJXpsYCT3Y1I+zFGi5yoDmlDMNxs1SLnvLWkrUVZqveNJLgK
 HAc4EPCttKNQSz7ubfyUJ5SCRCtOG/J9t/GSxsH02PnHHkPf95Sn2ijJNDqUDW8TcNdbya9
 Ck069JGeqWDCXu1YFRmOQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BrHAMBzQgE8=:sulkvOdd5UhiC4+KmbQWNi
 RTzWgQ/agwHIORjTtTy0zqDEJJneE/IJSW5CX1sq60bGnRQVmxHs07LHoj2gKz1nOGp7tNcXC
 qAxasuOmunsAyFyx1CqJa2NV6UYnfEJaLmV0mnzFoAIwX+pRhNHZAKjMuRFSwfbcBQHFjkUnb
 bEbGW/3LucVHf7hnW3lXNzzGOAfpVJ7LLZDFFUuGUcxuuud2wWH0ukHBFeFHEKHr6JtUlg3MY
 wmj3ixUwgLMM+JIlV1iUG+lxDamUoHNHGuHRFS+iJJJ8tT4LCbRqJ3U5bfQnSyOQ13n8FvxIT
 KdyNl5oALvUEvd0BLB+enfDJeY0hnU6pjegWvOVw5eGdPp+HIFUb4kGlVkU9ib0x6WTgTdUeR
 /Ws/e2SVCir/lVe/gMvofU528OHBKDAwiW4Z+/7uVIal7rsq4e5/W4eFwmIrFgTuu+ugm2hSS
 hixQ8anIdY08O2krBfSbWcBGV2iMKgpx9S89V9AKLW0tHRQcDPC6yPCs3wMPjUZDPUNID/Yb6
 u03m6DWewoLsPvlbykMaVHF5WUBXZLwbB2KODDPXLp62nXSKwmr9GSCbt0XLMmuXml7hNHU6g
 8J79YWGqV5MThEuII0be0xkzBr4OkJIOg3+j7wJXfSTw8gClgI+maoJHi3olAiXIjk5QGgI+L
 c+VlW7/MeeFEVoZXJeEqFOtmFSP7mtwJUypfPajbnP5svDawlIkEcyZumfwbwvvRit3g00YEU
 YPF1EgHmHH8k5eWmjCNUvi2NgRfTR8czzVoKwQ==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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

Le 28/07/2022 à 17:14, Peter Maydell a écrit :
> The flatload loader sets the end_code field in the image_info struct
> incorrectly, due to a typo.
> 
> This is a very long-standing bug (dating all the way back to when
> the bFLT loader was added in 2006), but has gone unnoticed because
> (a) most people don't use bFLT binaries
> (b) we don't actually do anything with the end_code field, except
>      print it in debugging traces and pass it to TCG plugins
> 
> Fix the typo.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1119
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   linux-user/flatload.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/flatload.c b/linux-user/flatload.c
> index e4c2f89a226..e99570ca182 100644
> --- a/linux-user/flatload.c
> +++ b/linux-user/flatload.c
> @@ -808,7 +808,7 @@ int load_flt_binary(struct linux_binprm *bprm, struct image_info *info)
>   
>       /* Stash our initial stack pointer into the mm structure */
>       info->start_code = libinfo[0].start_code;
> -    info->end_code = libinfo[0].start_code = libinfo[0].text_len;
> +    info->end_code = libinfo[0].start_code + libinfo[0].text_len;
>       info->start_data = libinfo[0].start_data;
>       info->end_data = libinfo[0].end_data;
>       info->start_brk = libinfo[0].start_brk;

Applied to my linux-user-for-7.1 branch.

Thanks,
Laurent


