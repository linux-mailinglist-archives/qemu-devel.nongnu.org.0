Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 823C257A5E9
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 19:58:07 +0200 (CEST)
Received: from localhost ([::1]:51642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDrTy-0005Nl-5b
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 13:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oDrMz-0007Sm-5f
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 13:50:53 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:49385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oDrMx-0001Vb-FV
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 13:50:52 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MEFnP-1oLnRi2jIb-00AEKi; Tue, 19 Jul 2022 19:50:47 +0200
Message-ID: <a413b64c-ae5d-dc0a-7238-2a385c3b7392@vivier.eu>
Date: Tue, 19 Jul 2022 19:50:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] linux-user: Unconditionally use pipe2() syscall
Content-Language: fr
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <YtbZ2ojisTnzxN9Y@p100>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <YtbZ2ojisTnzxN9Y@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:T+dSi8z8A37GK0mr4re+0vX5ZYDk3Te7470xPaVSMCOtNhdV2Aj
 jBWTlPQBwWNuZSpFk+ectr3mkCAJt5mPeb3RWiHv5xwjpBoU39KDpICheNr73tEAylUw4iw
 DyBun+bgvNY+as+fjPlzicMrYL2iBbdGbgw5Y2JsXJbVY988nZP5mhWTCYwsplkbDAcuHH6
 wV+AW9nLQl+y6flpcgWtg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YsQ5o/Ch9mM=:eAwZWxo2kxgWuT7TGuP7fm
 J1xNPkeWE1gyCP4rpRLuMkOufNU6HvJo1vxOPLF2dZXNpjxP52ZYRgpxQ2YQ17tOW+60HozW8
 lVj0JNhtYnqCA+DTZIYnUfMpqJjDVLcHyKPSwdpFXXA4fwZqN1dbTvRrIhvRhL/Rv6CTHNpp8
 NFEXzNKP0KYb2ZtyDbSrsQ0Afxwe6sBOwCKbK3WXaSyFVIMkB98y6FQ/3kKLf8AixVmRWpqP7
 Co6WT7kpoiiA9UNjhg8JrPnZitvmZS7CMAKo6mNPSfY+uKmVb94att6MPWbPJOODP/ZH3f4Lo
 KeQFzq0xV7mTar8KtLja6w7K7QuN1/HjxjawBjHgRYN6FoKy3czVIrhkeJs/P/rkApykJFMEU
 coHmsKSRmBHTQzfekhYsf6oVxSCvBNbEBnTAbdfYwyBIIauoU9nlwcHuj6a/T2LShrl0DjgBT
 WisvN3W39efhURuUCmrMeO78+/fCwB8l0FQOkZVHZLQe+TNqo6JJCIwWFnw/fGyYwHm2jRf//
 YZ2VeCgnmFen7I6SvVr0N9bo5aSK8rJ6/RXIfoKk//BhSy60Zz55UNETxeZ1/eAHURW7FCxW1
 C8wMhepw/TmThz29ZI3c4EOUIFYElcM6dhMiX0RaT1tXy0TlP1QCN663XGsljGNQJIh89Ezb/
 iyIU2l+LzDhQVlAhGF0WTlYYro2+jaeohVSdIBYeXX6BOEu4GOtac8Fi1DKOvL+Quf8bsxTne
 msatevYvynDQ6JjyOALMRDzWQW6ZdbX6d0m3og==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 19/07/2022 à 18:20, Helge Deller a écrit :
> The pipe2() syscall is available on all Linux platforms since kernel
> 2.6.27, so use it unconditionally to emulate pipe() and pipe2().
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Changes in v2:
> - added Reviewed-by: from Peter
> - new diff against git head
> - no functional changes
> 
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 991b85e6b4..4f89184d05 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -1586,21 +1586,12 @@ static abi_long do_ppoll(abi_long arg1, abi_long arg2, abi_long arg3,
>   }
>   #endif
> 
> -static abi_long do_pipe2(int host_pipe[], int flags)
> -{
> -#ifdef CONFIG_PIPE2
> -    return pipe2(host_pipe, flags);
> -#else
> -    return -ENOSYS;
> -#endif
> -}
> -
>   static abi_long do_pipe(CPUArchState *cpu_env, abi_ulong pipedes,
>                           int flags, int is_pipe2)
>   {
>       int host_pipe[2];
>       abi_long ret;
> -    ret = flags ? do_pipe2(host_pipe, flags) : pipe(host_pipe);
> +    ret = pipe2(host_pipe, flags);
> 
>       if (is_error(ret))
>           return get_errno(ret);
> diff --git a/meson.build b/meson.build
> index 8a8c415fc1..75aaca8462 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2026,15 +2026,6 @@ config_host_data.set('CONFIG_OPEN_BY_HANDLE', cc.links(gnu_source_prefix + '''
>     #else
>     int main(void) { struct file_handle fh; return open_by_handle_at(0, &fh, 0); }
>     #endif'''))
> -config_host_data.set('CONFIG_PIPE2', cc.links(gnu_source_prefix + '''
> -  #include <unistd.h>
> -  #include <fcntl.h>
> -
> -  int main(void)
> -  {
> -      int pipefd[2];
> -      return pipe2(pipefd, O_CLOEXEC);
> -  }'''))
>   config_host_data.set('CONFIG_POSIX_MADVISE', cc.links(gnu_source_prefix + '''
>     #include <sys/mman.h>
>     #include <stddef.h>

Applied to my linux-user-for-7.1 branch.

Thanks,
Laurent


