Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB48E478BF2
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 14:01:45 +0100 (CET)
Received: from localhost ([::1]:55372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myCrn-0000w5-Ly
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 08:01:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1myCnj-0008Uy-7y
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 07:57:31 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:33401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1myCnh-0002xJ-DK
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 07:57:30 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MO9vD-1n9YXy28sr-00OZYa; Fri, 17 Dec 2021 13:57:23 +0100
Message-ID: <b905eba0-b724-60ad-ab3c-8033bfab0f32@vivier.eu>
Date: Fri, 17 Dec 2021 13:57:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: fr
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211216144442.2270605-1-alex.bennee@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [RFC PATCH] linux-user: don't adjust base of found hole
In-Reply-To: <20211216144442.2270605-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VbPMCC1fBgPMmUol0Z521+dEbf0WhNq8FHanu46qKmmfhOG9JrW
 m7px++fEtzcmtP6LXu2BUhAlZlgMXJNQL9VK1kQhniuSegNxtsPBdVLcaleuQYfHo6laXDU
 mhdnsy/DcV7ONB5ZQv8OVc7YrReUrjbCd47UEO7JqD9cn5Iqzh6C74cIOWcFFx9Fn7Io73o
 WYNWjY9iOpB3GaTMp0hQA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Zzxd7JGkjBo=:cT1oGx3L6ZQwDLe4hOwqz4
 cxzvOZQWhH3DRLGLTux/gvbdyhA7O4n7lFdvrXeN3TgLgbv++7VLUMcj9HJ6H8y9NmWZPna5M
 xikNccJ7kAklcGggzkvn0IiRtrcyaJr1UPxpp9KL7DwQlUZgPHXYJmgjpkLAKXG8P88I7/r+k
 7QIMtSXIoqi9JFU8C5fGvEVu0Lp7NfMjCsrus0Y/xQJFKsRSwz3V1nDWU+HMpmW/ot0uCZHej
 ab/dX5hglf3JjmT0qeiYcQm9X4IDoGzYInMBECr09hNS87pgLuUTpCuUmNNImjzVlX7aWsP6W
 nDSoI/839CgsItASz+47RUA18VQkJ9bgse3kzvPxmQlkeX8dwMjhrMe09oCYhtTNMX7+QQgl/
 aX/gpHAXgqifsBwmGXrDtlq4E73BRi9OefOAIeV12idE9H+T2XbwVB9Zn7hoMIzM/USQZDZTN
 wyY/qKnehN2CJ6+RR4Xfjg+eRDYPPlKBESRxj3xuMQ4LGGl6chWmqIcwLqVpOq/KNgoCVEurg
 OZ8YQNlVwtJGTfvh9jN79MiyLlwj5OORF+UD0+uo9K6YIrsFGLpaJqFUs7am7SSjCttThGhge
 mxQdNZJ+VpyRD65v2XM68V8BpLAMZMnEpZyYkyvisn1slBsZKVBRRIOWI2vMd0Ji4vXROqm4D
 PWjeDela1BHkkrdAcSbiotro3avwelonb47kA2bLn/B1PGT0I2awul1/G3C1pqyowfbQ=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.716,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 16/12/2021 à 15:44, Alex Bennée a écrit :
> The pgb_find_hole function goes to the trouble of taking account of
> both mmap_min_addr and any offset we've applied to decide the starting
> address of a potential hole. This is especially important for
> emulating 32bit ARM in a 32bit build as we have applied the offset to
> ensure there will be space to map the ARM_COMMPAGE bellow the main
> guest map (using wrapped arithmetic).
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/690
> ---
>   linux-user/elfload.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 238979b8b6..8d839b79fb 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2334,7 +2334,7 @@ static uintptr_t pgb_find_hole(uintptr_t guest_loaddr, uintptr_t guest_size,
>   
>           /* Record the lowest successful match. */
>           if (ret < 0) {
> -            ret = align_start - guest_loaddr;
> +            ret = align_start;
>           }
>           /* If this hole contains the identity map, select it. */
>           if (align_start <= guest_loaddr &&
> 

It seems not consistent with what we have with fallback where we substract the guest_loadaddr:

2289     if (!maps) {
2290         ret = pgd_find_hole_fallback(guest_size, brk, align, offset);
2291         return ret == -1 ? -1 : ret - guest_loaddr;
2292     }

Thanks,
Laurent

