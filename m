Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E00D06807B5
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 09:46:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMPns-0002I1-Co; Mon, 30 Jan 2023 03:46:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMPng-0002HZ-P8
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:46:04 -0500
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMPnd-0007kt-Rr
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:46:03 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MNtCi-1p2i7y3fqq-00OGUm; Mon, 30 Jan 2023 09:45:58 +0100
Message-ID: <160286a4-c02a-8791-7012-31dbcc025fd1@vivier.eu>
Date: Mon, 30 Jan 2023 09:45:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] linux-user: Fix SO_ERROR return code of getsockopt()
Content-Language: fr
To: Helge Deller <deller@gmx.de>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221216101033.8352-1-deller@gmx.de>
 <8ec83c02-0e87-90c2-835d-e01a330b1969@vivier.eu>
 <db38ab56-d632-8cb4-9e60-aef83477ca74@gmx.de>
 <059795f6-97f0-b112-1802-fc47668986a5@vivier.eu> <Y9QzNzXg0hrzHQeo@p100>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <Y9QzNzXg0hrzHQeo@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:C9MWB+V3eq6qHaMCiarUNFWD6YLPku3w31O11byjHdc7zQ6XXGO
 dYmz4Bib+B1oYlOpnoMx/8XLoUwoJrp7+n2LdMHBs2jaBWL0R9FBo5CAxTRtQ1BNq9dbMJE
 Oz5VmrXQp/Ea6Sv/fCYB3IYZPBbNk6BIhiYxbutJNoNMv+4aKnGirG+QF/8hoIYakh4MCLy
 GjyjzhnL17FfRE86UQsXw==
UI-OutboundReport: notjunk:1;M01:P0:cWw4T9rzJmo=;sWpr29ThdTtwW4I1wWyvvOKSLTc
 +5VGmAERtgUJYHBnHlXOePblyObjcYE+AribeMhX2Rez7ld6+mKE3OkEyomwPG9ssD1V5lhNx
 q2QMSUKqOKnEEZqCXlTrd5F8IBNX1EOajPdUFlVRQpAgzoMcWTPJFY0FIACSG9idaTZALlzi8
 msh7OSjza7CWKYjm/vYZzj91xh3ldOPWHAaNCQt0ReF8SVPLugBIou01JMHHGFxPMEVX5llwc
 nkJz+No7nfLtghNeRRak8VkYimSW3aY3PV+303HEtfHRV3Te+f40ceTB4uNYoR/l3oItIK5HS
 wQX/ynXDIGImTniPf1XvNhqU+YWpQWUth0pwoN9GA+KPKiLlzXW3U3qW1RtE4DkdfZ+zS/oBu
 nG/e/8DkGmEkWQ13uiIsB14goctjTv/qJb/nLX5rMHTOlN7CvgDSqJrPijekqedgLI0Upucxt
 vXINlpMzCUH0ck9kUZ+7bM9BYr9eKh4qCCPF8W7LuD5RGgzsWagXkMQYuRXTxtYixPvswKemD
 tducic6yEM6PFgrsDL6FTtEHID1R0Wt1JRZqPgsy9ADZd9leWwL3m40E+y9sl6T2Y2J0dvwHX
 T0RPmoPEqPI1IN/GBzIX+BZ42B3M3rR+xadNcwo3xc1kHJBvQ4v8MoD8O+7inas2gsYeeUzxp
 mT3EXuMlQww9LEwvOhphPZfFJUisZbwPe7jk1t0Gnw==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 27/01/2023 à 21:25, Helge Deller a écrit :
> Add translation for the host error return code of:
>      getsockopt(19, SOL_SOCKET, SO_ERROR, [ECONNREFUSED], [4]) = 0
> 
> This fixes the testsuite of the cockpit debian package with a
> hppa-linux guest on a x86-64 host.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
> v2: Fix indenting to make checkscript.sh happy
> 
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index dac0cfe6c4..06e8612675 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -2809,8 +2809,13 @@ get_timeout:
>           ret = get_errno(getsockopt(sockfd, level, optname, &val, &lv));
>           if (ret < 0)
>               return ret;
> -        if (optname == SO_TYPE) {
> +        switch (optname) {
> +        case SO_TYPE:
>               val = host_to_target_sock_type(val);
> +            break;
> +        case SO_ERROR:
> +            val = host_to_target_errno(val);
> +            break;
>           }
>           if (len > lv)
>               len = lv;
> 

Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent


