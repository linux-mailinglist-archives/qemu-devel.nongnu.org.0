Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D383126040
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 11:15:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38949 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTNLQ-0003J3-0S
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 05:15:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hTNJH-0002IN-RY
	for qemu-devel@nongnu.org; Wed, 22 May 2019 05:13:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hTNJF-0005l4-Td
	for qemu-devel@nongnu.org; Wed, 22 May 2019 05:13:19 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:53179)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1hTNJD-0005fE-S1
	for qemu-devel@nongnu.org; Wed, 22 May 2019 05:13:17 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
	1MrhHm-1gopwE2jjg-00nhjx; Wed, 22 May 2019 11:12:03 +0200
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>, qemu-devel@nongnu.org
References: <1558282527-22183-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1558282527-22183-2-git-send-email-aleksandar.markovic@rt-rk.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <3415aa17-debe-8a2b-150a-e84255210b60@vivier.eu>
Date: Wed, 22 May 2019 11:11:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1558282527-22183-2-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:9n+Y0dPup6pldM8CNsgmpw1J5ObDn8fni+C4Mq972sr6M2SuwGy
	rzFUPsBTkRDmFTq8d1FgVVGrqfhvUFotsoubqux12gQzGDpIbYTay07IdYBBZmhMAGbirPy
	pHApayOPlTlkD53loI8vTnsXCLpBQp7VflKKfiOvYZabLMtOjNmwThKtdzSmyNohy84j9zo
	33OqK/tn7kkuL5oPbYnPA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gZ73Pj4fmyE=:rdYIINLYMso9sMDL1U7lIa
	2PU+t/saRR5XBLuvXVkuZyVM48sgWh9n+ePYDRMv8XuKQ3HNTWewRRzRWU8KqY04Kfe+lqGTZ
	2TL5QTCzJkKiP7IQVjbvSPvMQKrwSnU9/aTYgvPZsjrvpz3s37+czWZvdcj1lxpTcOrcGM42K
	DDpYwUANPOm6mOZbq4q3Fy87+W6L74OUcVpIIb14R1bCg2tpa4VfTUFAtSDGQPwVnSd8u2yjQ
	ovjSDcRVApz6sSQscVIxN3FO18Hf3MQF5lO7FV0M0mAQMUFoFKxHBQ6Qg1rSWH3dVpz6W5Nyf
	cH6sVpiJJ6qsZF/Ay47oLwiG8pomVtrcUix4R9sZSZGTTRszjZ3GqAr6VeATeOnmSVOmzlH7g
	GxqtaPPJnme+Dn58vNoeuGE1W1Xwvf99g86xm8e7W4o8TmPGhWSdjXq9p7mqP6zZpEy0jY7le
	9P7pL2CAdxyxEypPgxpBafmBXaj1z5O3WRj/5QiA4rIWp4/LsXqM4u9HARNvr4gN84xz3VcPc
	7sD11q4CShlpH5zo4kBtR7iBqbVpAV06US8BIHB7yF5baqZuFpei4ePrxaAjs5XafweGlmgnX
	uAqLaSADh68AqkwvrSy5DlPP2yfNeKOMN2A3W1QZnmyofLIM1WHTD+quK/zdMG01jUw/v39lu
	7dPEqWkfLbuTUD/8zN6+ilvUQ4u4uXQJHpqSl9zOT53AM165DphOLl19cvAOY3X8eyQnP5YGk
	cxH8eiOSHNMQpjB3YIc/7FUn4Y8CeJ2hxaW11PcIYGzkHlFGqt/Ew7bdmow=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
Subject: Re: [Qemu-devel] [PATCH v6 1/6] linux-user: Fix support for
 SIOCATMARK and SIOCGPGRP ioctls for xtensa
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, thuth@redhat.com, daniel.santos@pobox.com,
	arikalo@wavecomp.com, jcmvbkbc@gmail.com, amarkovic@wavecomp.com,
	nchen@wavecomp.com, philmd@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/05/2019 18:15, Aleksandar Markovic wrote:
> From: Aleksandar Markovic <amarkovic@wavecomp.com>
> 
> Fix support for the SIOCATMARK and SIOCGPGRP ioctls for xtensa by
> correcting corresponding macro definition.
> 
> Values for TARGET_SIOCATMARK and TARGET_SIOCGPGRP are determined by
> Linux kernel. Following relevant lines (obtained by grep) are from
> the kernel source tree:
> 
> arch/ia64/include/uapi/asm/sockios.h:#define SIOCATMARK    0x8905
> arch/mips/include/uapi/asm/sockios.h:#define SIOCATMARK    _IOR('s', 7, int)
> arch/parisc/include/uapi/asm/sockios.h:#define SIOCATMARK  0x8905
> arch/sh/include/uapi/asm/sockios.h:#define SIOCATMARK      _IOR('s', 7, int)
> arch/xtensa/include/uapi/asm/sockios.h:#define SIOCATMARK  _IOR('s', 7, int)
> arch/alpha/include/uapi/asm/sockios.h:#define SIOCATMARK   _IOR('s', 7, int)
> arch/sparc/include/uapi/asm/sockios.h:#define SIOCATMARK   0x8905
> include/uapi/asm-generic/sockios.h:#define SIOCATMARK	   0x8905
> 
> arch/ia64/include/uapi/asm/sockios.h:#define SIOCGPGRP     0x8904
> arch/mips/include/uapi/asm/sockios.h:#define SIOCGPGRP     _IOR('s', 9, pid_t)
> arch/parisc/include/uapi/asm/sockios.h:#define SIOCGPGRP   0x8904
> arch/sh/include/uapi/asm/sockios.h:#define SIOCGPGRP       _IOR('s', 9, pid_t)
> arch/xtensa/include/uapi/asm/sockios.h:#define SIOCGPGRP   _IOR('s', 9, pid_t)
> arch/alpha/include/uapi/asm/sockios.h:#define SIOCGPGRP    _IOR('s', 9, pid_t)
> arch/sparc/include/uapi/asm/sockios.h:#define SIOCGPGRP    0x8904
> include/uapi/asm-generic/sockios.h:#define SIOCGPGRP       0x8904
> 
> It is visible from above that xtensa should have the same definitions
> as alpha, mips and sh4 already do. This patch brings QEMU to the accurate
> state wrt these two ioctls.
> 
> Acked-by: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   linux-user/syscall_defs.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index 12c8407..1e86fb9 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -736,7 +736,8 @@ struct target_pollfd {
>   #define TARGET_KDSETLED        0x4B32	/* set led state [lights, not flags] */
>   #define TARGET_KDSIGACCEPT     0x4B4E
>   
> -#if defined(TARGET_ALPHA) || defined(TARGET_MIPS) || defined(TARGET_SH4)
> +#if defined(TARGET_ALPHA) || defined(TARGET_MIPS) || defined(TARGET_SH4) ||    \
> +       defined(TARGET_XTENSA)
>   #define TARGET_SIOCATMARK      TARGET_IOR('s', 7, int)
>   #define TARGET_SIOCGPGRP       TARGET_IOR('s', 9, pid_t)
>   #else
> 


Applied to my linux-user branch.

Thanks,
Laurent

