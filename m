Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F08FA49E361
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 14:28:01 +0100 (CET)
Received: from localhost ([::1]:53008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD4oi-0002rn-OZ
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 08:28:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nD4gA-0005nQ-9O; Thu, 27 Jan 2022 08:19:13 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:36425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nD4g8-0002PD-2K; Thu, 27 Jan 2022 08:19:09 -0500
Received: from [192.168.100.1] ([82.142.25.174]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M5wY1-1nAZRZ0hxb-007X2e; Thu, 27 Jan 2022 14:18:58 +0100
Message-ID: <fb4f4efd-0676-51a9-dd01-50643dec1278@vivier.eu>
Date: Thu, 27 Jan 2022 14:18:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: fr
To: Serge Belyshev <belyshev@depni.sinp.msu.ru>, qemu-devel@nongnu.org
References: <8735len4jt.fsf@depni.sinp.msu.ru>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] linux-user/syscall: Do not ignore info.si_pid == 0 in
 waitid()
In-Reply-To: <8735len4jt.fsf@depni.sinp.msu.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UGTiR/EdlzwpwAPBMCkmqsQiSQfzmGuNgmYvUkqs1nKqsrb2+Az
 zLBqST568OvaklNXcXKzS033Ok7pZdve3MXSaQk+Pkia3yclxIZTc87z7ykllRttTjwc2Uo
 XaJu7fj39qkZsHt9JiMo+j0Pw17AhAaww4TMixxWLd2UmEkGMmyrVx+GHOG4lf25in73Iml
 pCPXVZlHBx3+du24/c/Dw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0psMztn+8eE=:+28bURajgk5Y8dImDjvGmE
 tDsS+JRA5SBtKht+0O/5qVMeuhfnm7SXQfRMu8KJuVpmWLlHV7TWnIrlMyn0GeCcrM60Ag9Bk
 wRzKlOhGtpeFWetQG7ew0ndoow9RaY9XM/V+TYfRS/FkVsX+f0wcNn5ARJh4KCzamI+uzGEK5
 jaZ9ag4NqKYJ2vohb9HnjJswYitm2lUd4Yhlh3ea53zz2U/xO4/calnn11/QTSv+HqUPzJ0pg
 bUB5LSx1xMWoOt7IcJym2lqqqEUHhg6OEMADJRh8l3d6bHvtRTfINh3ulhzSX0CjyuqCrHVP8
 eGbv8owfRFe20TtGH4WkkRRO4KjNQXKPwQ257xiuWT1dLF0QaLuxRmGMihPvJcnAkw4EuAx1k
 QUjGoAgmVNCgjw3gTODGR4c7pLDSPzFiXx2pptlzcW+A8YAKDMSXdem45W0xUMn4WMNUsne+m
 2dmZH3RmcpWtH6twTqXBsDW8jPd5tnt9IsmW4xswEWdE7hXGZxvcNKchouBIPk8WaoT6y1iC9
 dNNblTcksK+PfFz7LKxS+C/mcCgwow3cu6M89QU8vUdZ30LFWvkuXfanAAlxLMpuCgkHr6cuZ
 biGnqT/7UcfXc8JkhYZnCwOy60s65u1AO6upKqn8HB8gCUeNhWGExHFkYFdPDqtDHsADfPAJp
 GBp4u1mS9ucd1gq0b22vAgVj5el7mOM8Y53as4sSOtX94bbVUu25Z5ZHozoA+pYGoKgs=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 13/01/2022 à 10:37, Serge Belyshev a écrit :
> When called with WNOHANG and no child has exited, waitid returns with
> info.si_pid set to zero and thus check for info.si_pid != 0 will cause
> target siginfo structure to be uninitialized.  Fixed by removing the check.
> 
> Signed-off-by: Serge Belyshev <belyshev@depni.sinp.msu.ru>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/817
> ---
>   linux-user/syscall.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 5950222a77..b80531ac4c 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8724,9 +8724,8 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>       case TARGET_NR_waitid:
>           {
>               siginfo_t info;
> -            info.si_pid = 0;
>               ret = get_errno(safe_waitid(arg1, arg2, &info, arg4, NULL));
> -            if (!is_error(ret) && arg3 && info.si_pid != 0) {
> +            if (!is_error(ret) && arg3) {
>                   if (!(p = lock_user(VERIFY_WRITE, arg3, sizeof(target_siginfo_t), 0)))
>                       return -TARGET_EFAULT;
>                   host_to_target_siginfo(p, &info);

According to wait(2), it sounds a little bit more complicated than that.

        If WNOHANG was specified in options and there were no children in a waitable state, then
        waitid() returns 0 immediately and the state of the siginfo_t  structure  pointed  to  by
        infop  depends  on  the  implementation.   To (portably) distinguish this case from that
        where a child was in a waitable state, zero out the si_pid field before the call and check
        for a nonzero value in this field after the call returns.

        POSIX.1-2008  Technical  Corrigendum  1 (2013) adds the requirement that when WNOHANG is
        specified in options and there were no children in a waitable state, then waitid() should
        zero out the si_pid and si_signo fields of the structure.  On Linux and other implementations
        that adhere to this requirement, it is not necessary to zero out the si_pid field before
        calling waitid().  However, not all implementations follow the POSIX.1  specification  on
        this point.

Perhaps the best approach would be to copy the caller target siginfo to the host one, call host 
waitpid(), remove the "info.si_pid != 0" and copy back the host siginfo to target one?

Thanks,
Laurent

