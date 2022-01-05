Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2206F485124
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 11:30:39 +0100 (CET)
Received: from localhost ([::1]:56276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n53Yz-0004YA-Tx
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 05:30:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53NA-0002wb-LN
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:18:26 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:34263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53N7-0006YI-VE
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:18:23 -0500
Received: from [192.168.100.1] ([82.142.30.62]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mk178-1mgy1543qa-00kOnS; Wed, 05 Jan 2022 11:18:20 +0100
Message-ID: <bb1a8883-d0cc-7ac2-0331-d6f6404bffcf@vivier.eu>
Date: Wed, 5 Jan 2022 11:18:19 +0100
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
X-Provags-ID: V03:K1:yfhBoF2qB34LCS3kWw1ypAYPcE3bzb54jyrXtR4VpwOB3QFlmOs
 F79VHHZhr1Vvu/nBwvhjt4vh0Yh9Lbfxd/10NXVh6Uf0Ml1mHjBFFC7Kpauv4Bl7xej3b24
 mAQFDbV5mJX/Df3nS9xdrjI7PnKNKAW+ljn/GFENLU1y6Rj54flca3Mims+i3GlUJz7P8hk
 sNcEnLgtavjkeUedfa8eg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:foJQH4pywWc=:/E31X9anTIdKOvVVm3ENEU
 cOgSdZJ7hCmwErgoqNI/qtZT4olWR/ifayny8MZfsvnleTuFAzYLQ8Op8U4me7o+mzrpCnnBv
 FtwBHpukIKvl6n4+YxSiamV4rL5oiZjMX7emY+wVlNd4FGWDB/Y428gkBzXGG1bL/+HvNxoQA
 mxlv0tsLmf4nhJ+7Ybygo1mUEREaF8fN8A/kFtQ9iWqTX/tUTeq5x/8jw3jhdNX+0VGAdr70X
 CwZYgKeGNjDh8sVLdHNYJCrrlWxBBAlMK63F1+MD5lpQfymNx39GnHWJnchjexdF5pnG1/48x
 AULLokWBXyQvA53tXHWVA9cE09tzzatzRSHTNWYNxo6x4rMiNhuThH+p/gkVCz7rAebHxupEP
 SyAofGu0uOY2gr08AWu/lpWQ7EqILx7x+skzzgK7CiLvXK4BuxOPNXaqB7UKbLtDRZFHd91l7
 FoYSTmCj0I6HDh2E/bVXp2oc+FjeXq4PENqLczbaTlQimV+2HHKrx+FwQIPwS1B5ag3JQcL+C
 UJb0FS3tLuXnW0fZhkD1Y7IC7Wtg6aio9Gi/W5GehQxL9YhWu5GjRIQupRk+xZtxw/eSknXtA
 Lz2zSxttoHvGLrUbPFtQIaI5AhAkf8GqMxFPQExF4M5Zeh7DWS3q8RSmnrvjYDhhL06FC3Xfb
 WRSwk71LOzxz8WKfmWjlWWQxggXXWc1XXIKMu5emTbEFbIXbJZHQANupPWnTpfBQwKOM=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.057,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent


