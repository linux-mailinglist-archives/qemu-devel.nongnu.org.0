Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B09531D4D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 23:04:22 +0200 (CEST)
Received: from localhost ([::1]:55670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntFDx-0002Pi-8m
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 17:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntEyG-0000MI-CZ
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:48:08 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:39361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntEy8-00053f-HL
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:48:08 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MEFfB-1o2psD1kIP-00AI9D; Mon, 23 May 2022 22:47:52 +0200
Message-ID: <86d08093-1754-a176-4c6d-2aee660ea219@vivier.eu>
Date: Mon, 23 May 2022 22:47:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 0/3] linux-user: Use CPUArchState* instead of void*
 when possible
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220509205728.51912-1-philippe.mathieu.daude@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220509205728.51912-1-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZpikAMTMue2/ODI0w5M7fVE3JHxyPr9cMlvdSeXxVhEPx2f/UX6
 9K9T6w8AH8DMJSD17F3Cqskjr7ywuHFI/HSgyEICQpWJrSov45ClNxG1KlAfDMeWCAa2Ul7
 gxgOn5jsBi6ZDn0wtIy49XD2GBNfXbY0Q4iH4BxpDZUgFdB3vEFNA5gGIkd/O7nDeMJY4Y0
 trl5j2IyfYIj0Ga5Y/ePQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nK+wtBboT3A=:kQJU/YCDNHjMnNWh+rU4ML
 CzObhpkxetHyUAaFGjechPvISthKAHCbv2fc8O3UmMsns07nVOvA1CwYute5zi23lmhkhYLa6
 bRvSLeeZ/2Tot/M1TFqOQW37WQ5TjWzvLmrWo97MWkvDr6KLaDpnda1aurCpiMyhO0jH7w+YR
 gYMyyP+iUtl8NT9zPgshwXXLgHzPi0krwrU+6L+4qIAhs13mAzKdi8b1n/MXpb8y2VbL19lEw
 V64CP/iDcyPLcBXQNlHWOto+nrwQiMUj3ZS9aFCROQlnHuevFsbWbnLkpKRBKX3zdOQoY6DsA
 eOOR0GlwshzwlWU3Ci84FTKvjODe80ySX1OB1nkHS5UJSWx0MlzuIkdrilAy15bHzn6GKS+af
 WI+JfWzUJCxUDSsrsdRKsS17uHufO5NouZZRN728UBtEbjVzKbZUOl9BxrWi7tkD57/wtkKKB
 guI+1/PeNqJpJ/TJhhxGhC0Y7Wy6rcMBX+wro47q4DOyQkmmLhRVG4coo/VKfZ0w51ICJfMwy
 ahgW1CNYmw+pEiWZ9kX2PO2tdPQ/xOBGqWP+JgF0bhPb9x66Pe/jJp0556QOVSyip3Rb76xOa
 lG6rPc70PC7nkxSRrh4SZJBI7yGFZW3aZ0wDrJacy/NmiS87PvSho84XB9+frq0qznunFaoTZ
 senwS8+aL5s6o6wcQTVUs4zcqF93o58oGaelukd3RdA1hVZWFnf2Lrhm+SdMuk6hIsbK8pMnk
 GJ/Q3Q6HAj7boWiVslvS17oEBbVOlJrWlj3xUw==
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

Le 09/05/2022 à 22:57, Philippe Mathieu-Daudé a écrit :
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Since v1:
> - Rebased
> 
> v1: https://lore.kernel.org/qemu-devel/20220306234005.52511-1-philippe.mathieu.daude@gmail.com/
> 
> Philippe Mathieu-Daudé (3):
>    linux-user/elfload: Remove pointless non-const CPUArchState cast
>    linux-user: Have do_syscall() use CPUArchState* instead of void*
>    linux-user: Remove pointless CPU{ARCH}State casts
> 
>   linux-user/elfload.c        |   2 +-
>   linux-user/strace.c         | 202 ++++++++++++++++++------------------
>   linux-user/strace.h         |   4 +-
>   linux-user/syscall.c        |  81 +++++++--------
>   linux-user/uname.c          |   4 +-
>   linux-user/uname.h          |   2 +-
>   linux-user/user-internals.h |  18 ++--
>   7 files changed, 155 insertions(+), 158 deletions(-)
> 

Series applied to my linux-user-for-7.1 branch.

Thanks,
Laurent

