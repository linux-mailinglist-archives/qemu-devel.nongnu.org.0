Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5412DCF26
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 11:11:43 +0100 (CET)
Received: from localhost ([::1]:54052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpqG6-0006xY-62
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 05:11:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kpqD5-0005h5-J8
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 05:08:35 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:36845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kpqD2-0008SP-TZ
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 05:08:35 -0500
Received: from [192.168.100.1] ([82.252.144.198]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M42fG-1kpqCx1RZY-0002uX; Thu, 17 Dec 2020 11:08:27 +0100
Subject: Re: [PATCH-for-5.2] docs/user: Display linux-user binaries nicely
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201119160838.1981709-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <f5682b95-fbc4-19d9-ecca-e5334e440ed0@vivier.eu>
Date: Thu, 17 Dec 2020 11:08:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201119160838.1981709-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6oqM2tuwWBA3ErGfKHNGoHAcerSYhsZezDLhKB0a/FRr19PDLla
 Wjp3A57gFEnzWPS9dLPOGJoJRR40tZYbcgipqjm+ZzE8W2uXV1pQeTpmgcfZ0522OstSxsH
 p/rtzliAUpK84YBk2r03GaTGxJyihmpnm8Uz+LqeTGWUUxDLvU2D92l/zZ5O0OWQVKD6S+t
 4EbFKr7Er4YUo/BR5xS8g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eWpYe3OFrOg=:D/9SYnZXglSocP0a+k5O9Y
 IChH5+Ra3lNj8/klLePvt/OHsiWD0tFZBRwOD8tOik0dhcUaopKks0RPXlQIpY/qW5zU9VsYm
 yc3LuzJueW9t0KAgmlrK7dhxVYTOZRnh3Qi/mzpJ87z6JGEV3Ks1b1N+lfunbCwG4ZVZGsrph
 IBZeT8caUw0JLxMHwZeecfTPnQcqxCj3K2SIHbVFZOaNsV3Mfl++eobchTca5OWaLbiXxaV4J
 Vupvf/Zjvdw7dXFPE01SoPh0lPPGY5MwsuVFOOUQ0GOHjAzRfFC5VfjKCoFybeuvZYntEBgzf
 640tlhjmSg/HjTxtwXnAFlhTbGCcEANjS44BWBy76iXpBW5rCPqpOp/XBBwMCbuG1TVKydRBj
 af5IHl704VvG9Sq8XrlKikM4p+xvx5kKs5Dcw0ikVvQgtJ6MQc6wYdRooCl5U
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 19/11/2020 à 17:08, Philippe Mathieu-Daudé a écrit :
> linux-user binaries are displayed altogether. Use the '*'
> character to force displaying them as bullet list (one list
> per architecture).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  docs/user/main.rst | 99 ++++++++++++++++++++++++++--------------------
>  1 file changed, 56 insertions(+), 43 deletions(-)
> 
> diff --git a/docs/user/main.rst b/docs/user/main.rst
> index bd99b0fdbe9..8dfe232a3af 100644
> --- a/docs/user/main.rst
> +++ b/docs/user/main.rst
> @@ -170,68 +170,81 @@ QEMU_STRACE
>  Other binaries
>  ~~~~~~~~~~~~~~
>  
> -user mode (Alpha)
> -``qemu-alpha`` TODO.
> +-  user mode (Alpha)
>  
> -user mode (Arm)
> -``qemu-armeb`` TODO.
> +   * ``qemu-alpha`` TODO.
>  
> -user mode (Arm)
> -``qemu-arm`` is also capable of running Arm \"Angel\" semihosted ELF
> -binaries (as implemented by the arm-elf and arm-eabi Newlib/GDB
> -configurations), and arm-uclinux bFLT format binaries.
> +-  user mode (Arm)
>  
> -user mode (ColdFire)
> -user mode (M68K)
> -``qemu-m68k`` is capable of running semihosted binaries using the BDM
> -(m5xxx-ram-hosted.ld) or m68k-sim (sim.ld) syscall interfaces, and
> -coldfire uClinux bFLT format binaries.
> +   * ``qemu-armeb`` TODO.
>  
> -The binary format is detected automatically.
> +   * ``qemu-arm`` is also capable of running Arm \"Angel\" semihosted ELF
> +     binaries (as implemented by the arm-elf and arm-eabi Newlib/GDB
> +     configurations), and arm-uclinux bFLT format binaries.
>  
> -user mode (Cris)
> -``qemu-cris`` TODO.
> +-  user mode (ColdFire)
>  
> -user mode (i386)
> -``qemu-i386`` TODO. ``qemu-x86_64`` TODO.
> +-  user mode (M68K)
>  
> -user mode (Microblaze)
> -``qemu-microblaze`` TODO.
> +   * ``qemu-m68k`` is capable of running semihosted binaries using the BDM
> +     (m5xxx-ram-hosted.ld) or m68k-sim (sim.ld) syscall interfaces, and
> +     coldfire uClinux bFLT format binaries.
>  
> -user mode (MIPS)
> -``qemu-mips`` executes 32-bit big endian MIPS binaries (MIPS O32 ABI).
> +   The binary format is detected automatically.
>  
> -``qemu-mipsel`` executes 32-bit little endian MIPS binaries (MIPS O32
> -ABI).
> +-  user mode (Cris)
>  
> -``qemu-mips64`` executes 64-bit big endian MIPS binaries (MIPS N64 ABI).
> +   * ``qemu-cris`` TODO.
>  
> -``qemu-mips64el`` executes 64-bit little endian MIPS binaries (MIPS N64
> -ABI).
> +-  user mode (i386)
>  
> -``qemu-mipsn32`` executes 32-bit big endian MIPS binaries (MIPS N32
> -ABI).
> +   * ``qemu-i386`` TODO.
> +   * ``qemu-x86_64`` TODO.
>  
> -``qemu-mipsn32el`` executes 32-bit little endian MIPS binaries (MIPS N32
> -ABI).
> +-  user mode (Microblaze)
>  
> -user mode (NiosII)
> -``qemu-nios2`` TODO.
> +   * ``qemu-microblaze`` TODO.
>  
> -user mode (PowerPC)
> -``qemu-ppc64abi32`` TODO. ``qemu-ppc64`` TODO. ``qemu-ppc`` TODO.
> +-  user mode (MIPS)
>  
> -user mode (SH4)
> -``qemu-sh4eb`` TODO. ``qemu-sh4`` TODO.
> +   * ``qemu-mips`` executes 32-bit big endian MIPS binaries (MIPS O32 ABI).
>  
> -user mode (SPARC)
> -``qemu-sparc`` can execute Sparc32 binaries (Sparc32 CPU, 32 bit ABI).
> +   * ``qemu-mipsel`` executes 32-bit little endian MIPS binaries (MIPS O32 ABI).
>  
> -``qemu-sparc32plus`` can execute Sparc32 and SPARC32PLUS binaries
> -(Sparc64 CPU, 32 bit ABI).
> +   * ``qemu-mips64`` executes 64-bit big endian MIPS binaries (MIPS N64 ABI).
>  
> -``qemu-sparc64`` can execute some Sparc64 (Sparc64 CPU, 64 bit ABI) and
> -SPARC32PLUS binaries (Sparc64 CPU, 32 bit ABI).
> +   * ``qemu-mips64el`` executes 64-bit little endian MIPS binaries (MIPS N64
> +     ABI).
> +
> +   * ``qemu-mipsn32`` executes 32-bit big endian MIPS binaries (MIPS N32 ABI).
> +
> +   * ``qemu-mipsn32el`` executes 32-bit little endian MIPS binaries (MIPS N32
> +     ABI).
> +
> +-  user mode (NiosII)
> +
> +   * ``qemu-nios2`` TODO.
> +
> +-  user mode (PowerPC)
> +
> +   * ``qemu-ppc64abi32`` TODO.
> +   * ``qemu-ppc64`` TODO.
> +   * ``qemu-ppc`` TODO.
> +
> +-  user mode (SH4)
> +
> +   * ``qemu-sh4eb`` TODO.
> +   * ``qemu-sh4`` TODO.
> +
> +-  user mode (SPARC)
> +
> +   * ``qemu-sparc`` can execute Sparc32 binaries (Sparc32 CPU, 32 bit ABI).
> +
> +   * ``qemu-sparc32plus`` can execute Sparc32 and SPARC32PLUS binaries
> +     (Sparc64 CPU, 32 bit ABI).
> +
> +   * ``qemu-sparc64`` can execute some Sparc64 (Sparc64 CPU, 64 bit ABI) and
> +     SPARC32PLUS binaries (Sparc64 CPU, 32 bit ABI).
>  
>  BSD User space emulator
>  -----------------------
> 

Applied to my linux-user-for-6.0 branch.

Thanks,
Laurent


