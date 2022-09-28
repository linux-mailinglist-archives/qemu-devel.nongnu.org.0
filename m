Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E91D45EE83D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 23:23:08 +0200 (CEST)
Received: from localhost ([::1]:59154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odeWJ-0002Wq-Mx
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 17:23:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddkl-0008Lg-3v
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:34:01 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:53497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddki-0007ZN-8c
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:33:58 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MA7Ss-1oXXsB4C0Q-00BZIj; Wed, 28 Sep 2022 22:33:54 +0200
Message-ID: <f3a1797c-3efe-26f9-c19e-1e0ae05582f3@vivier.eu>
Date: Wed, 28 Sep 2022 22:33:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 8/8] linux-user: Log tid for strace
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220829021006.67305-1-richard.henderson@linaro.org>
 <20220829021006.67305-9-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220829021006.67305-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Gaq3myJfnD51aEEo0v3aFM2SJ8dDS5XAcVjvW3Th3N+/5ShIF8M
 lwwLdx0+4a+051bZBbnbYIYno0VZ8nkQ9nq+BwyhzRj2hvuXsglzyPfyOY8rAyS0WgWJjpv
 lWBKQqxgskQldeHnZQwDpO9phHJyFLjRKXtUZgjTG8b6/HDU2Bxyht2iPktX3LX1eVzdaBB
 DLC+3QbKeoERgHK6mv1ew==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zO/6BwYMPnU=:xnTxZinAQMRsa2Mrq131hr
 K9BjAW6w45YAjEtHtt6PidarTcYEdOmXrht2s1d48Y1VtulIkIE9rDYuzWKRgTC9xUaNu+PL2
 /J1kUEJ71UCWXGgwjn0Kz9b4kmH1o/sTJnsR3LnX54AgZqfPJ0cqf/DO7sA87g5WNNnDm4+vq
 7NPS6wHr5poC24l232plJ2U8KUE8Y+N7xrioIRHU1grIxIJP2FM1yl95xSa4LdkJi2Gujul0h
 FP/vPsYRDifQ4kmFDXTONK0HFamyJUXgEgvfC1RKsKCmLqbWjVuDXetDREtUurY51ok0dPns2
 us9q+Ay+ROWZawCk53PxTo0scKDhwlyO8LU6jeLhCCFxnYmDbh2j0P26Z/QTCJh6m6ju8Ybv4
 NQ5KqNPt+pFBSyTv6vNlcZ0JQNI75Si+1P4G6+p3apMXRnciXZ/rJtfjlnLbvfaTh0J2W8E9r
 3KjoM7T1gwjqW9Rw8q1Bz8Lk4L3Fu0XPe40FvjW+2ECJcRD5tw6IL4wg9YfX1shH7ufVoo3m4
 Z/ki2o4/X/emYM1OzpwKVf/mgVy4p3SCsYYbneeV2LWT6nFwUKhvDgzItRUTNVaLgcGbvhgls
 Z6MUh38JvJGhm1GLg35LehcX8SmTGyU7UR8xVUznoUHBo/qXv0ycW7W8UMBQrsbyUu0465G81
 S8uYzdUVR4cIntbAu+p1yRGduGx6oiEzf427OtNaOMBK/sSNDn/3eveGgc0ZkB8LdxdpmHoE9
 7JRzOkXkppcZP1O3NIeEnbzYGSEUqicVpXhqXPt9gygHTyRZs4e3Qv6DHuoa1+92EsUB71MuW
 LUEBEGw
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 29/08/2022 à 04:10, Richard Henderson a écrit :
> Printing the same pid for all threads isn't helpful.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/strace.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index c47d91bb3d..ca9d44fa7c 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -3782,7 +3782,7 @@ print_syscall(CPUArchState *cpu_env, int num,
>       if (!f) {
>           return;
>       }
> -    fprintf(f, "%d ", getpid());
> +    fprintf(f, "%d ", gettid());
>   
>       for (i = 0; i < nsyscalls; i++) {
>           if (scnames[i].nr == num) {

I've removed this patch from the PR because of a problem reported by Stefan:

cc -m64 -mcx16 -Ilibqemu-hexagon-linux-user.fa.p -I. -I..
-Itarget/hexagon -I../target/hexagon -I../common-user/host/x86_64
-I../linux-user/include/host/x86_64 -I../linux-user/include
-Ilinux-user -I../linux-user -I../linux-user/hexagon -Iqapi -Itrace
-Iui/shader -I/usr/include/capstone -I/usr/include/glib-2.0
-I/usr/lib/x86_64-linux-gnu/glib-2.0/include -fdiagnostics-color=auto
-Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g -isystem
/builds/qemu-project/qemu/linux-headers -isystem linux-headers -iquote
. -iquote /builds/qemu-project/qemu -iquote
/builds/qemu-project/qemu/include -iquote
/builds/qemu-project/qemu/tcg/i386 -pthread -U_FORTIFY_SOURCE
-D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64
-D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef
-Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common
-fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits
-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
-Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined
-Wimplicit-fallthrough=2 -Wno-missing-include-dirs
-Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE
-isystem../linux-headers -isystemlinux-headers -DNEED_CPU_H
'-DCONFIG_TARGET="hexagon-linux-user-config-target.h"'
'-DCONFIG_DEVICES="hexagon-linux-user-config-devices.h"' -MD -MQ
libqemu-hexagon-linux-user.fa.p/linux-user_strace.c.o -MF
libqemu-hexagon-linux-user.fa.p/linux-user_strace.c.o.d -o
libqemu-hexagon-linux-user.fa.p/linux-user_strace.c.o -c
../linux-user/strace.c
../linux-user/strace.c: In function 'print_syscall':
../linux-user/strace.c:3931:23: error: implicit declaration of
function 'gettid'; did you mean 'getgid'?
[-Werror=implicit-function-declaration]
fprintf(f, "%d ", gettid());
^~~~~~
getgid
../linux-user/strace.c:3931:23: error: nested extern declaration of
'gettid' [-Werror=nested-externs]

https://gitlab.com/qemu-project/qemu/-/jobs/3100018258

Thanks,
Laurent

