Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31148580427
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 20:41:58 +0200 (CEST)
Received: from localhost ([::1]:46116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG31f-000593-4V
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 14:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oG2y8-0003HE-PQ
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 14:38:16 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:40761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oG2xr-0000qc-PG
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 14:38:14 -0400
Received: by mail-pg1-x52e.google.com with SMTP id f11so11132400pgj.7
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 11:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ch+xhTNmjpdgt5Y7HNAROZ071hdfO36ctCng3FsoPK0=;
 b=mvI9X1gZrWTCUPqNU/V8qI+hiEqiudyKC8OVjMNmbHjvPqzzVN+ygzCe8BmPKElKeQ
 niG0195AigRSxA3pabCYNA66t13YA36YnSmwtJjOdr4u14xtUwKd2+0vKqcOivg4nsqQ
 0Jl1n48U4+UPz/id8o7Bve8LPwp+dugFimjkb2RV4bjWJ/K3r04AX2gp0/tu7fOz3xfS
 nFbNm4puQAw+x6LmznwhcSZjE5DdH0ejJLYaMzpU0602Iz0lWYj8TNPLRXpQT2X6RwFB
 9S0bZFF+98fs+zthMNBq+cjGJK5+HXkrnMHSWitGjxrnCkkRooR4he5Wekg+rb9rv6Zy
 dvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ch+xhTNmjpdgt5Y7HNAROZ071hdfO36ctCng3FsoPK0=;
 b=rAt3PamK8yuG3w7+ibDZpavMMsziTwfhl15zGnEZmpL2VsT+8c2rtrkb19nFUH9qvN
 rxCd17b4igDwSryni0TREKUGxRkzOBL/uzoHTYEnqKWdvC/yC7RZVpBjeE0nayy+C5YK
 RIKIEL/fFmFLxZJOIlOUeA9zUlGIVjEZO9AM7B4c2Z9F09vnb1oAkRxRKdLW+z7OAwt6
 Humaq3OGTMlPgAzQMvUaL0J+YEwMGM6XbwokUUNKb56fEsIK5DDqpB8HYpViSsNXKZnc
 f3TXI+u4Gmc3Y8lKnHsFcLtJhu7gMyMvShyczmFEs6K1W2pP9vxnnTlKPi2OJQSqpO0z
 6Uxg==
X-Gm-Message-State: AJIora9mc2iwkEMayu/+6SlH6U1HvdVm3qruHnkbbTZc3HmIZnkDk0nu
 3267s19sj7uLE/q4CY6ssQi+jg==
X-Google-Smtp-Source: AGRyM1sC2BuvxYE8YWPvczj67Nk4w/VjOXgNzyAUi0N0YFgIgKBoCjWF2r8yoG+wJIpvu47CRF43ng==
X-Received: by 2002:a63:ec17:0:b0:41a:716a:9365 with SMTP id
 j23-20020a63ec17000000b0041a716a9365mr11936395pgh.204.1658774277295; 
 Mon, 25 Jul 2022 11:37:57 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:30c1:2484:a853:233d?
 ([2602:ae:1549:801:30c1:2484:a853:233d])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a631c0f000000b0040c74f0cdb5sm8666144pgc.6.2022.07.25.11.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 11:37:56 -0700 (PDT)
Message-ID: <bfaad452-fd69-3e79-787d-cec1de8d0147@linaro.org>
Date: Mon, 25 Jul 2022 11:37:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] linux-user: Use memfd for open syscall emulation
Content-Language: en-US
To: =?UTF-8?Q?Rainer_M=c3=bcller?= <raimue@codingfarm.de>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
References: <20220725162811.87985-1-raimue@codingfarm.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220725162811.87985-1-raimue@codingfarm.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 7/25/22 09:28, Rainer Müller wrote:
> For certain paths in /proc, the open syscall is intercepted and the
> returned file descriptor points to a temporary file with emulated
> contents.
> 
> If TMPDIR is not accessible or writable for the current user (for
> example in a read-only mounted chroot or container) tools such as ps
> from procps may fail unexpectedly. Trying to read one of these paths
> such as /proc/self/stat would return an error such as ENOENT or EROFS.
> 
> To relax the requirement on a writable TMPDIR, use memfd_create()
> instead to create an anonymous file and return its file descriptor.
> 
> Signed-off-by: Rainer Müller <raimue@codingfarm.de>
> ---
>   linux-user/syscall.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 991b85e6b4..3e4af930ad 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8265,9 +8265,11 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, int
>       }
>   
>       if (fake_open->filename) {
> +        int fd, r;
> +
> +#ifndef CONFIG_MEMFD
>           const char *tmpdir;
>           char filename[PATH_MAX];
> -        int fd, r;
>   
>           /* create temporary file to map stat to */
>           tmpdir = getenv("TMPDIR");
> @@ -8279,6 +8281,12 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, int
>               return fd;
>           }
>           unlink(filename);
> +#else
> +        fd = memfd_create("qemu-open", 0);
> +        if (fd < 0) {
> +            return fd;
> +        }
> +#endif

Even without CONFIG_MEMFD, we will have the memfd_create function available in util/.
I think you should drop the ifdefs like so:

#include "qemu/memfd.h"

     fd = memfd_create(...);
     if (fd < 0) {
         if (errno != ENOSYS) {
             return fd;
         }
         // tmpdir fallback
     }


r~

