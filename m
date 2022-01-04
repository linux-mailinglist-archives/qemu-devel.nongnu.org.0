Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA222484137
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 12:51:27 +0100 (CET)
Received: from localhost ([::1]:34204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4iLe-00027m-Qu
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 06:51:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n4iK1-0000TX-8j
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 06:49:45 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:34561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n4iJz-0000B1-Fx
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 06:49:44 -0500
Received: from [192.168.100.1] ([82.142.30.62]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1My2lr-1mBdgw32rP-00zXw0; Tue, 04 Jan 2022 12:49:41 +0100
Message-ID: <afd0f3f4-eac2-59f5-91db-b55148578f35@vivier.eu>
Date: Tue, 4 Jan 2022 12:49:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] linux-user/signal: Map exit signals in SIGCHLD siginfo_t
Content-Language: fr
To: Matthias Schiffer <mschiffer@universe-factory.net>
References: <81534fde7cdfc6acea4889d886fbefdd606630fb.1635019124.git.mschiffer@universe-factory.net>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <81534fde7cdfc6acea4889d886fbefdd606630fb.1635019124.git.mschiffer@universe-factory.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VzW6OBd5EvFTfPlhiuVbJ01CZPPnc1hWeEZlyTPl9vq6ZZsnTA7
 zyhdyv3PrSTjVNB3NDo1IBV1vrjHAZMYt9a8s2l3k8/JlF8fmF1Mg/Kcng4g7M/BSY7kRqA
 2EGyKvHZIY/O3HDKOOWgQb4hxQ523oeQRnF0gEPGC+ZjEMJB3Ex+1dPBcapPUHGimuW3lxJ
 l6MEjmfje5uh4m/KCus6Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XcEzMP/f1EI=:dhm/JgBh+Iuu1hg4DLyGxO
 dvUi/UPR6URERAoBXFMY3gtqWZ8NCN2N67QQqyYzveVuAtmK3pvCIwCmbvoD/6T80olX1P3Mi
 HOu2xOpm5fI+TdJb8/0aGkYKl1BmpTXlorluFSbu38cjYUAdhkTx13slX3iTipWJunfpUYa33
 YOtmKtXhFzIt9nb+YxRV6rXNbwgzUjmX4/IZZRbetDuKyMftRq0HlYKDAOrR7N38XCm00oXkt
 9bZZVoeqN5Sy84nGefYWCWlNzJ7/p62jH4OS4i+iGNAUJFPm0IgfVwq9xOD4+XvE3SRyg1ylf
 tvTATFU5lluWagoUUj9dbSfSAUitaWZYTzMT1d9zNeh3tASoF5r1v3zehXfjJ+d56mXIZB4zi
 vzYErrTn1ADpvCs4uJx1PV2xJHRKc9vI03PrinlFXkni0g4CLhJEVy9RQ2uz9/+HZKoxEp5sp
 KHYoXfO2+rPc8SNJ6aKqyG4tnt2BU026b99Svovg+dkfgKY9Lntr2GhmdgQLkDIk6GP55lKms
 T60lZoy+A8eUbvSIN3AYDCl27CK6CeuvtL8AFnuJ6I3qimPUOlvRL7vIUvHMu6JmhBUfQcoNI
 lfVD6ziHfRXpIinyeg3WJQg4xqh18+yxHPQTQk2pba5wUtsiTGBpCpGEBwV0nGETn6lBZWrxD
 Y0rhT9j8EmP2ZgaDUio2WU338KSY5BCcaqia4L66xpKSZKlmm4kvMc5KJaz2lZxn3r4A=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 23/10/2021 à 21:59, Matthias Schiffer a écrit :
> When converting a siginfo_t from waitid(), the interpretation of si_status
> depends on the value of si_code: For CLD_EXITED, it is an exit code and
> should be copied verbatim. For other codes, it is a signal number
> (possibly with additional high bits from ptrace) that should be mapped.
> 
> This code was previously changed in commit 1c3dfb506ea3
> ("linux-user/signal: Decode waitid si_code"), but the fix was
> incomplete.
> 
> Tested with the following test program:
> 
>      #include <stdio.h>
>      #include <stdlib.h>
>      #include <unistd.h>
>      #include <sys/wait.h>
> 
>      int main() {
>      	pid_t pid = fork();
>      	if (pid == 0) {
>      		exit(12);
>      	} else {
>      		siginfo_t siginfo = {};
>      		waitid(P_PID, pid, &siginfo, WEXITED);
>      		printf("Code: %d, status: %d\n", (int)siginfo.si_code, (int)siginfo.si_status);
>      	}
> 
>      	pid = fork();
>      	if (pid == 0) {
>      		raise(SIGUSR2);
>      	} else {
>      		siginfo_t siginfo = {};
>      		waitid(P_PID, pid, &siginfo, WEXITED);
>      		printf("Code: %d, status: %d\n", (int)siginfo.si_code, (int)siginfo.si_status);
>      	}
>      }
> 
> Output with an x86_64 host and mips64el target before 1c3dfb506ea3
> (incorrect: exit code 12 is translated like a signal):
> 
>      Code: 1, status: 17
>      Code: 2, status: 17
> 
> After 1c3dfb506ea3 (incorrect: signal number is not translated):
> 
>      Code: 1, status: 12
>      Code: 2, status: 12
> 
> With this patch:
> 
>      Code: 1, status: 12
>      Code: 2, status: 17
> 
> Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
> ---
>   linux-user/signal.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 14d8fdfde152..8e3af98ec0a7 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -403,7 +403,12 @@ static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
>           case TARGET_SIGCHLD:
>               tinfo->_sifields._sigchld._pid = info->si_pid;
>               tinfo->_sifields._sigchld._uid = info->si_uid;
> -            tinfo->_sifields._sigchld._status = info->si_status;
> +            if (si_code == CLD_EXITED)
> +                tinfo->_sifields._sigchld._status = info->si_status;
> +            else
> +                tinfo->_sifields._sigchld._status
> +                    = host_to_target_signal(info->si_status & 0x7f)
> +                        | (info->si_status & ~0x7f);
>               tinfo->_sifields._sigchld._utime = info->si_utime;
>               tinfo->_sifields._sigchld._stime = info->si_stime;
>               si_type = QEMU_SI_CHLD;

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

