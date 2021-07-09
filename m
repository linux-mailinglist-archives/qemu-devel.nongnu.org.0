Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FC03C2151
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 11:15:58 +0200 (CEST)
Received: from localhost ([::1]:49470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1mc1-0002SC-Nk
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 05:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1mZk-0000Lp-Cd; Fri, 09 Jul 2021 05:13:36 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:53263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1mZi-0005wE-J6; Fri, 09 Jul 2021 05:13:36 -0400
Received: from [192.168.100.1] ([82.142.13.34]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Moewz-1lMQGd1g0P-00p4ME; Fri, 09 Jul 2021 11:13:26 +0200
Subject: Re: [PATCH] target/xtensa/xtensa-semi: Fix compilation problem on
 Haiku
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>
References: <20210706081822.1316551-1-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <45ee3be4-4227-2ba6-c797-411c470ddbb9@vivier.eu>
Date: Fri, 9 Jul 2021 11:13:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706081822.1316551-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:a0/OZgC4+j5MVpFRmMwARILp2AtfYsV0kJXe0N+ZYMWSBF1Fj3A
 ryXqf4ZmprBNfjRmUZxwA1sFokf2z8Jls+s0HW4RVBOoafH7BCH7fXAQLU+60YiOwJNmo5y
 L51sWosumS0ZGaWJ6NctPLR21vdYltNC6Kjv1mdpOyqH/rfIcGPNNHkt6+TdFJTk/dv3hqE
 u0sYteJ1RuwCRg+JRxKqQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sY5AdNninDw=:+cHVO/sfg7aDdZFHFdooVJ
 XinywokpBdXoYqmOdp8tD/ruNfXqPbLQ0Fvo7TaXTk0hK7oV2tvkNrwR1WH+NZ+1H1sskqTsx
 1+2VYbZagDVbKLRd7+WMEhLYX/JmJtkgVp9hfixz8OP/mVchXKypAgFHum1vHMWhpSetYXgqi
 0ehB8ImmK6QenWYIJ3sphZIhBXvz/gC6wDp3iBwvMlCjd5a+/G32MG8YD+kV8LIzLiUbImV8W
 jY/270sP7BnWCHI3Pn0k02+iqYr8S3IFhPJopmoXjgMPovqP2baylZBOcl7A7LreNSFExR83H
 uXqBtyQ/RTaj3qExyikotfyCTD9I6bvUvUfoPUSgJ/xROpxW18Zt0o8+leh6gfeuAVn13UFIK
 xYVv58tWLv/rUo64HuV1tr06K3I6GoxMs2ENsA3A4nj+D+ahkjDWODuzgj6rBrrGqLy5xidyF
 gxGN6lUDovN9L7PnFODB5gKm28PH1GQM3ZvZYmsN0f+nEViwA6UXtroIcztOKakRc271EWb98
 BvtfisyBvQ3beorAwnKAVi7882DvEOKiCTC6FfjCll8ZQFOGChY0LfJi/wzomlzTwZFfe2kJb
 tdXC62pLaH/2X8xS5v5EQqOGuQfTKvxfZ6x4shEQZk5/UUbul7pLU6SbYIrx6OeOBOoeaSqB2
 XViw1Jl+Fe1YDlb5T08n5ngHJ4NvyNbXTeleTiQuSSYDqxheXYAKJ6uGCzn6pGrKLhre78ViQ
 9bVJKWk7HSffhfqzX8z/2Rpc+V+aTZPruaTqumadVNfJUk6PcKQOKJYnWGuYaia6iyiBylmej
 DzM3Ha4tMymJGi4E8htJUHIuTb8bHlZvFYIvXV3SXiq/6pBKCH7dsbbqXpB7UfRusW5fqjg
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Richard Zak <richard.j.zak@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 06/07/2021 à 10:18, Thomas Huth a écrit :
> The errno numbers are very large on Haiku, so the linking currently
> fails there with a "final link failed: memory exhausted" error
> message. We should not use the errno number as array indexes here,
> thus convert the code to a switch-case statement instead. A clever
> compiler should be able to optimize this code in a similar way
> anway.
> 
> Reported-by: Richard Zak <richard.j.zak@gmail.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  target/xtensa/xtensa-semi.c | 84 +++++++++++++++++--------------------
>  1 file changed, 39 insertions(+), 45 deletions(-)
> 
> diff --git a/target/xtensa/xtensa-semi.c b/target/xtensa/xtensa-semi.c
> index 79f2b043f2..fa21b7e11f 100644
> --- a/target/xtensa/xtensa-semi.c
> +++ b/target/xtensa/xtensa-semi.c
> @@ -95,59 +95,53 @@ enum {
>  
>  static uint32_t errno_h2g(int host_errno)
>  {
> -    static const uint32_t guest_errno[] = {
> -        [EPERM]         = TARGET_EPERM,
> -        [ENOENT]        = TARGET_ENOENT,
> -        [ESRCH]         = TARGET_ESRCH,
> -        [EINTR]         = TARGET_EINTR,
> -        [EIO]           = TARGET_EIO,
> -        [ENXIO]         = TARGET_ENXIO,
> -        [E2BIG]         = TARGET_E2BIG,
> -        [ENOEXEC]       = TARGET_ENOEXEC,
> -        [EBADF]         = TARGET_EBADF,
> -        [ECHILD]        = TARGET_ECHILD,
> -        [EAGAIN]        = TARGET_EAGAIN,
> -        [ENOMEM]        = TARGET_ENOMEM,
> -        [EACCES]        = TARGET_EACCES,
> -        [EFAULT]        = TARGET_EFAULT,
> +    switch (host_errno) {
> +    case 0:         return 0;
> +    case EPERM:     return TARGET_EPERM;
> +    case ENOENT:    return TARGET_ENOENT;
> +    case ESRCH:     return TARGET_ESRCH;
> +    case EINTR:     return TARGET_EINTR;
> +    case EIO:       return TARGET_EIO;
> +    case ENXIO:     return TARGET_ENXIO;
> +    case E2BIG:     return TARGET_E2BIG;
> +    case ENOEXEC:   return TARGET_ENOEXEC;
> +    case EBADF:     return TARGET_EBADF;
> +    case ECHILD:    return TARGET_ECHILD;
> +    case EAGAIN:    return TARGET_EAGAIN;
> +    case ENOMEM:    return TARGET_ENOMEM;
> +    case EACCES:    return TARGET_EACCES;
> +    case EFAULT:    return TARGET_EFAULT;
>  #ifdef ENOTBLK
> -        [ENOTBLK]       = TARGET_ENOTBLK,
> +    case ENOTBLK:   return TARGET_ENOTBLK;
>  #endif
> -        [EBUSY]         = TARGET_EBUSY,
> -        [EEXIST]        = TARGET_EEXIST,
> -        [EXDEV]         = TARGET_EXDEV,
> -        [ENODEV]        = TARGET_ENODEV,
> -        [ENOTDIR]       = TARGET_ENOTDIR,
> -        [EISDIR]        = TARGET_EISDIR,
> -        [EINVAL]        = TARGET_EINVAL,
> -        [ENFILE]        = TARGET_ENFILE,
> -        [EMFILE]        = TARGET_EMFILE,
> -        [ENOTTY]        = TARGET_ENOTTY,
> +    case EBUSY:     return TARGET_EBUSY;
> +    case EEXIST:    return TARGET_EEXIST;
> +    case EXDEV:     return TARGET_EXDEV;
> +    case ENODEV:    return TARGET_ENODEV;
> +    case ENOTDIR:   return TARGET_ENOTDIR;
> +    case EISDIR:    return TARGET_EISDIR;
> +    case EINVAL:    return TARGET_EINVAL;
> +    case ENFILE:    return TARGET_ENFILE;
> +    case EMFILE:    return TARGET_EMFILE;
> +    case ENOTTY:    return TARGET_ENOTTY;
>  #ifdef ETXTBSY
> -        [ETXTBSY]       = TARGET_ETXTBSY,
> +    case ETXTBSY:   return TARGET_ETXTBSY;
>  #endif
> -        [EFBIG]         = TARGET_EFBIG,
> -        [ENOSPC]        = TARGET_ENOSPC,
> -        [ESPIPE]        = TARGET_ESPIPE,
> -        [EROFS]         = TARGET_EROFS,
> -        [EMLINK]        = TARGET_EMLINK,
> -        [EPIPE]         = TARGET_EPIPE,
> -        [EDOM]          = TARGET_EDOM,
> -        [ERANGE]        = TARGET_ERANGE,
> -        [ENOSYS]        = TARGET_ENOSYS,
> +    case EFBIG:     return TARGET_EFBIG;
> +    case ENOSPC:    return TARGET_ENOSPC;
> +    case ESPIPE:    return TARGET_ESPIPE;
> +    case EROFS:     return TARGET_EROFS;
> +    case EMLINK:    return TARGET_EMLINK;
> +    case EPIPE:     return TARGET_EPIPE;
> +    case EDOM:      return TARGET_EDOM;
> +    case ERANGE:    return TARGET_ERANGE;
> +    case ENOSYS:    return TARGET_ENOSYS;
>  #ifdef ELOOP
> -        [ELOOP]         = TARGET_ELOOP,
> +    case ELOOP:     return TARGET_ELOOP;
>  #endif
>      };
>  
> -    if (host_errno == 0) {
> -        return 0;
> -    } else if (host_errno > 0 && host_errno < ARRAY_SIZE(guest_errno) &&
> -            guest_errno[host_errno]) {
> -        return guest_errno[host_errno];
> -    } else {
> -        return TARGET_EINVAL;
> -    }
> +    return TARGET_EINVAL;
>  }
>  
>  typedef struct XtensaSimConsole {
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


