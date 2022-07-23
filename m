Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DF357F1DE
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jul 2022 00:24:09 +0200 (CEST)
Received: from localhost ([::1]:54358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFNXb-0007uy-UX
	for lists+qemu-devel@lfdr.de; Sat, 23 Jul 2022 18:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oFNWM-0006Lf-8F
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 18:22:50 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:47829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oFNWK-0008Ih-IE
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 18:22:49 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MeCYx-1ng2dT3afX-00bMKX; Sun, 24 Jul 2022 00:22:40 +0200
Message-ID: <45c6558e-0c90-8822-ee97-71447e061044@vivier.eu>
Date: Sun, 24 Jul 2022 00:22:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] linux-user: Use target abi_int type for pipefd[1] in
 pipe()
Content-Language: fr
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <YtQ3Id6z8slpVr7r@p100>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <YtQ3Id6z8slpVr7r@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:180sz50JCnXvXrXpO6DRTlvzgDxaB6WG1/6XeW7Od4pOH/TquPx
 mHMcIdIzCqscEVPyq1RpJ9gEXdwt776ATN5yS7Z4sF9DttPXrSEHcmPpBdkhOcD8ncUVLdN
 tzGkAYPqFt7DO3RzUjOUHyG4o5y2fcTUQ8jkVHkES5bF22bLp/VOTy8tKvujorLO1vPU+bS
 BId/LrUvjyqnZYeJOloag==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OiJxranWWdg=:nU3fXTezJrUybXR2Dch3uK
 DlXbEft5QYdfJjUIRdxeBdAwxr+AheSQlhwsKyNpn0nFUYlsbaL+aUwArzkCe4TnrVEDMPCh7
 GmjESJ2Ys3/dV0KVHfWRCQ5jlpva/J6qmv0OMHd/b94Vhi9SPlaqi6SGM38579V7tNs0Uc3/8
 vOZkzGhRp0ABwmXw+CnyhcCvQtU+N0F5dZNpewbXmwb0xGRjwuC+MFUCJ5cG7kJpuvm7SzICy
 yGmvjWVN9tCI2FBFWyBFi38dAwfbARL+ia3eL9h9nQQ3Pi/bfAdWbfiXOEyy2VSpa7sER/ofX
 y554xE8Jajm7fsh9A8NWHQFBvpxKtF3mp/e3QeUdxmlpfrzNyRgfShPeJ8Kng4mlCNPGR8DKG
 OBQ611SInhRqcVrpTp11QA1HE7qLiDbcnWlp/jLmJkSEfMUNEI6mYvrFYkFdye5XjZeYWHCmU
 Vl5ATHo5QsKIa6Jxk00S5AwQ6u/7lx65oNQhEBnx4FAtBhN0VIIEmsSxOmnctQm/LDOuWMjvo
 9LxZAkVClStc61FWW75hCBeMSVjDg7/jeyez2VvfJSOpCx71k5UgflFDpDj84QCT7gp+l+PHq
 XMaZvOWOUvHl+b4nBw/Gs7XMms1Bo8KqroSQcMBXcjieNKTpK0XrPu4IPvkbgCGBdCid50vAz
 SyCeUOn5zW6cvExia/d/PanxQDAgzdBMhlXmUPRsVnE18vs0JFljGYWCti45ld0vaY17M6hB2
 FinPa4zTkfL8PXV0WgwXhTyt+alVriaohMnP7A==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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

Le 17/07/2022 à 18:21, Helge Deller a écrit :
> When writing back the fd[1] pipe file handle to emulated userspace
> memory, use sizeof(abi_int) as offset insted of the hosts's int type.
> There is no functional change in this patch.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 991b85e6b4..1e6e814871 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -1624,7 +1624,7 @@ static abi_long do_pipe(CPUArchState *cpu_env, abi_ulong pipedes,
>       }
> 
>       if (put_user_s32(host_pipe[0], pipedes)
> -        || put_user_s32(host_pipe[1], pipedes + sizeof(host_pipe[0])))
> +        || put_user_s32(host_pipe[1], pipedes + sizeof(abi_int)))
>           return -TARGET_EFAULT;
>       return get_errno(ret);
>   }
> 

Applied to my linux-user-for-7.1 branch.

Thanks,
Laurent


