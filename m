Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 554314E3DAE
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 12:36:03 +0100 (CET)
Received: from localhost ([::1]:48702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWcny-0002uD-Fo
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 07:36:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nWcmM-0001eW-Dl
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:34:22 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:32889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nWcmK-0003Ci-Tf
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:34:22 -0400
Received: from [192.168.100.1] ([82.142.12.150]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MG9wg-1nIHI507o4-00GYAD; Tue, 22 Mar 2022 12:34:17 +0100
Message-ID: <4ef073dc-850c-fe1c-cd25-879f5bb7d3da@vivier.eu>
Date: Tue, 22 Mar 2022 12:34:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] linux-user: Fix missing space in error message
Content-Language: fr
To: Patrick Venture <venture@google.com>
References: <20220310192148.1696486-1-venture@google.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220310192148.1696486-1-venture@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4gemmenv9rSW+Cj29fzQXt48NvJbBpW663kwCmMX4KJU2yo2b6n
 xn+VGbEHlN/IdnU4CnKLBSTPR4L8Fw2BTWbQliAAo6zMi/q/+ICuvE44rzzPQguSD2PlReB
 LA+pmk2bOZr9O2EO3yoeJTiPvZdoONPK39z21H0ZQz9mWdkid1dq1PlXC/aVKdgl2FAnc1J
 liyBTBc4l6jE6w40FaG/A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0QQVka4tPO4=:e+6Pt4VGt6xd3XDEoKsAqO
 EwchXRH/qrhwBiLr6ssVBoN+z2CXs/3ZZkImUuimXgxTs0CIb0z6yQWOutq3SQIIUpvlbK5DU
 JnIFOP/bdfci0CqLZ3vtossk7LYCCpRA+BvRgA/bmvhn6u9q38CiJ0653BqFQThC1RcUTyiYW
 6kp1Yk4WOVYwEW5DSMLA5jPkGoxc0zEcQfxxrBJtAT3CHBwjWttMawUmwdYQXIiVnkYKZfOpy
 8X+DblG7COqZs2RlQkcpnDvJmpnyzI371CraDa5grFejDkeuldUAIHJFQdOOPddxm1qjiznFs
 BYArh6IiTZDL4vfnyx3NgEXUqNiMpBVL36dSwMgXV45o8quYzvf/TPvLniUO4qX5p3/5r0N4u
 fs/gEVJMcuMGdupn+5ykK5pdFfFsUrCz3WXKoS5hTEZ+R2YMGDkfuh2qDduGGPiTHj9r3ogAR
 JwnmhHIypGTZPEtnKjkZfvcd+dBe2CsFNBC30ld1t7cfd1D0PFczHTAOJ7scpERAiF2gAXQ4W
 a/8fhWRD0QfMi4YjuTykWICpB38Kj5G4vjeRcfIJqKZpCczDjWRTFQusB7dHiQZSZbbaOuxEf
 Ynz/IkG6jehuivrSiEMyaOE9wJdX2rCd1ic6oDv05SdZCnlgTxHjvmNYGepJHEb3Zh5YN7dtZ
 vtvDCKcro3ziOQkccDmCGGOu+aEFgS0cUd6XxgmXk2kYTjhYBpn0E+yz0kf+nULrwE8w=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Fergus Henderson <fergus@google.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 10/03/2022 à 20:21, Patrick Venture a écrit :
> From: Fergus Henderson <fergus@google.com>
> 
> Signed-off-by: Fergus Henderson <fergus@google.com>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>   linux-user/elfload.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 9628a38361..c45da4d633 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2504,7 +2504,7 @@ static void pgb_reserved_va(const char *image_name, abi_ulong guest_loaddr,
>       addr = mmap(test, reserved_va, PROT_NONE, flags, -1, 0);
>       if (addr == MAP_FAILED || addr != test) {
>           error_report("Unable to reserve 0x%lx bytes of virtual address "
> -                     "space at %p (%s) for use as guest address space (check your"
> +                     "space at %p (%s) for use as guest address space (check your "
>                        "virtual memory ulimit setting, min_mmap_addr or reserve less "
>                        "using -R option)", reserved_va, test, strerror(errno));
>           exit(EXIT_FAILURE);


Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent

