Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 623D32EB395
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 20:42:41 +0100 (CET)
Received: from localhost ([::1]:36156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwsE3-0005z1-Vp
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 14:42:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kwsBd-0004pZ-ME
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 14:40:09 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:39319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kwsBb-00058A-Lt
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 14:40:09 -0500
Received: from [192.168.100.1] ([82.252.137.42]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mc06b-1kPTi745Al-00dYDQ; Tue, 05 Jan 2021 20:40:05 +0100
Subject: Re: [PATCH] linux-user: Add ETHTOOL ioctl
To: Matevz Langus <matevz.langus@borea.si>
References: <9272ff58-82a7-d687-8a33-05796c643b5b@borea.si>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ee004b9f-5c7a-41d0-5a81-252ca3d4270c@vivier.eu>
Date: Tue, 5 Jan 2021 20:40:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <9272ff58-82a7-d687-8a33-05796c643b5b@borea.si>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4PbEEQlOYeQCsbtq76kh7t5oRSJf/6emP6Yg6w6EHxSGeba9iHL
 2+w+PYeAJILZZ7yBUZHhwD+h9pOcliOmPyLxhWrrUhqIJKbxcagdL2QL/jEtpRvMjUih9sk
 EWhhJ4lGdqhMLst6xEi+O+TknFxg99v8zvFRhtdDcS7IZwCquhYAEpgTvoufv2M1KUYwhQj
 Ur4eqzslVTE3VTbBOyRpg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:W/wUJy8YWBc=:YRCZzo5W2vdFM3UfeacAx9
 P9hvu+2alHZI75fj3EifIc11W0uEV6kc1v7SjCFXmlCsGA3TPx1I7UjJwy+ghOtqkj/XRsc6U
 n/qSapCXzD4zCNGcImFFn9Jqnd3O+ddSVB4L5o29RymXPeSur1D7A69S8W3RBXd56cmO5/I/c
 DfnE5Sny4CH7ii9yTvu4GWqO5zWopNs2pMg2iCaW4qLL+uQNbaZ3s9YWHbm82y9kG70ZltOjr
 HzSPmYSzGgMR8v45tEb+2Qsvtbvq2LG7b6ilm+ASoAbjI35BXdKKqCIgvsx8sq9ncv3gz1EzD
 SSvl/9SQs12paqSket2Dr9g+YQtscQgt6El8Av3OPePDHKGBz+Z1qdx3EBDGmmaBR/mOoFFf2
 RbH6g8qmZXKe3rqovU8NgxZ+N1vyAY9ivEtiIuxF3jnfFu79JR18qiqKnXczv
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Matevz,

Le 05/01/2021 à 20:24, Matevz Langus a écrit :
> Handling of ETHTOOL ioctl was not implemented.
> 
> Signed-off-by: Matevz Langus <matevz.langus@borea.si>
> ---
>  linux-user/ioctls.h       | 1 +
>  linux-user/syscall_defs.h | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
> index 661b5daa9f..3e5c220199 100644
> --- a/linux-user/ioctls.h
> +++ b/linux-user/ioctls.h
> @@ -362,6 +362,7 @@
>    IOCTL(SIOCSIFHWADDR, IOC_W, MK_PTR(MK_STRUCT(STRUCT_sockaddr_ifreq)))
>    IOCTL(SIOCGIFTXQLEN, IOC_W | IOC_R, MK_PTR(MK_STRUCT(STRUCT_sockaddr_ifreq)))
>    IOCTL(SIOCSIFTXQLEN, IOC_W, MK_PTR(MK_STRUCT(STRUCT_sockaddr_ifreq)))
> +  IOCTL(SIOCETHTOOL, IOC_R | IOC_W, MK_PTR(MK_STRUCT(STRUCT_ptr_ifreq)))
>    IOCTL(SIOCGIFMETRIC, IOC_W | IOC_R, MK_PTR(MK_STRUCT(STRUCT_int_ifreq)))
>    IOCTL(SIOCSIFMETRIC, IOC_W, MK_PTR(MK_STRUCT(STRUCT_int_ifreq)))
>    IOCTL(SIOCGIFMTU, IOC_W | IOC_R, MK_PTR(MK_STRUCT(STRUCT_int_ifreq)))
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index a00bfc2647..d9301fecc9 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -903,6 +903,7 @@ struct target_rtc_pll_info {
> 
>  #define TARGET_SIOCGIFTXQLEN   0x8942          /* Get the tx queue length      */
>  #define TARGET_SIOCSIFTXQLEN   0x8943          /* Set the tx queue length      */
> +#define TARGET_SIOCETHTOOL     0x8946          /* Ethtool interface            */
> 
>  /* ARP cache control calls. */
>  #define TARGET_OLD_SIOCDARP    0x8950          /* old delete ARP table entry   */

Thank you for your patch but the solution is more complex.

Shu-Chun has already sent a patch last month to address the problem:

https://patchew.org/QEMU/20201218214142.3673709-1-scw@google.com/

Thanks,
Laurent

