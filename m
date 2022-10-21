Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CB4607A35
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 17:11:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oltgK-0003KQ-Tw
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 11:11:33 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oltft-0004Hu-05
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 11:11:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oltfV-0001hK-OS
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 11:10:42 -0400
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oltfQ-0000Bz-4R
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 11:10:40 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MdeOl-1pLEYD0R0L-00Zd33 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022
 17:10:32 +0200
Message-ID: <669e0ccf-097e-9730-17cf-88a340717388@vivier.eu>
Date: Fri, 21 Oct 2022 17:10:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 1/2] linux-user: handle /proc/self/exe with execve()
 syscall
Content-Language: fr
To: qemu-devel@nongnu.org
References: <20220927124357.688536-1-laurent@vivier.eu>
 <20220927124357.688536-2-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220927124357.688536-2-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nWgMZXKV3xU6osQPAFmy8ne1M0WKzeU6f9oWpoVtMNQuTDTbU9V
 cURulKg7+6ApR6HfqoOtNbidS/jin/XQ9n+AE9FDvJ1OEd3jseTYJxeARsc1AdYDhcQ2QFW
 lfTaWB7wDzCFX5Uttl5XpoPqH80OIfSVclrUIBnaTjauVGCOMSD8Z+5/2BDup6ZvkJrfQvM
 WDb/YJaG6Cjdz5fJ7nk6g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:01n/kysLgbc=:jUDryKv95O64GKgzBkwrR1
 3xrPaxr6LSUA4v0yI05FNMcjyp5HAY2eqxn+4ATSwDVHZSdBCL5AfDiijAi8F10hqU+h9t0dE
 VdZHMFcKz+uLQxPC6iO69j+fbluK321fWHAYSRwnrGPVtD7JDI68R8CpXMrg22tSXAEtTCIAl
 bNmbQ++oaGXnwjhStbT+j+4CTuERF2RtAvWkRMpDBN9NkVVxR+DXsLDjQDEz8XOX6GWXtKGBt
 hT4uamrbfXhywGRju2GmgMggk2ACZhoUWBv6kdN2csWUcD/eERmuKRUPayllP6xn3COSa1Bhz
 yIj6xArSkBhm/f+6dWX9DwSuHtKgDTwi95nIaCIqcRICOb5WfEwJNg8JE9uYOKLzmUbSKkFsm
 PxhhvJCDGRcNAI1exjyLL/E5t6GOFaUoOpxrxs8PDvVsLOP9Lgpgxim6L4CXbHqTW0qiKzrHk
 7EGrLGeHNL7biENXBd0fdkNp2gwagM81edInPa5vkRSTI8mZXszKJJqF80KT5fypXPQqN3Bro
 VSpJvX0Hayb4CEHc8kRQO6nINxJ+pySo01M0n9gv+xWrCh+NUP7OtmFdv7w+1jh6v4cCisWW4
 nU/NMtnZnBb/PFV47NRadCw3PrWC6LBpUbuyKXBC2xTh5TnxP7XElorzFsgYVf8QlOIo8uIv0
 n8vnLwGEAwjxzHGilHLtvOnRzPboYzb0ezv7THL9cET090FnprxXlB3Y44F+Ha9cUOrW2v8H8
 V7bdSSpKcOuVfzUI6qcFhjVRolyAHT3mPPwCa3ZKvc7Ob26/Oh0HzVyVAmizsIJ4VpRLQVf2O
 2VoP7Ys
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

Le 27/09/2022 à 14:43, Laurent Vivier a écrit :
> If path is /proc/self/exe, use the executable path
> provided by exec_path.
> 
> Don't use execfd as it is closed by loader_exec() and otherwise
> will survive to the exec() syscall and be usable child process.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   linux-user/syscall.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index f4091212027c..ddf09d7eb61a 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8843,7 +8843,11 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>                * before the execve completes and makes it the other
>                * program's problem.
>                */
> -            ret = get_errno(safe_execve(p, argp, envp));
> +            if (is_proc_myself(p, "exe")) {
> +                ret = get_errno(safe_execve(exec_path, argp, envp));
> +            } else {
> +                ret = get_errno(safe_execve(p, argp, envp));
> +            }
>               unlock_user(p, arg1, 0);
>   
>               goto execve_end;

Applied to my linux-user-for-7.2 branch.

Thanks,
Laurent

