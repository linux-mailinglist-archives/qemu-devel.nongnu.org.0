Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B670A4A6A17
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 03:44:40 +0100 (CET)
Received: from localhost ([::1]:34272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF5dP-0005gD-S6
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 21:44:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF0qO-0002kp-Tn
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:37:51 -0500
Received: from [2607:f8b0:4864:20::635] (port=40847
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF0qL-0004gY-GV
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:37:43 -0500
Received: by mail-pl1-x635.google.com with SMTP id y17so16490979plg.7
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 13:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pbF6bZvkaKkOAknK/FWA52et5zWNS8x+xQwUbipBDNc=;
 b=VuoVL13v7O0AK1pwpWTbc3kZxepMNd9VZjCwer73L4CuCH58kYkSHXpehbjR7RVvJe
 S+eIM+0FwtOyEIr5n7iVOKXixFcXW952HxcmLaZbrAiUbxZh0GcdTM+oAd60mvs1ze3S
 Mg5Z0qA0z73ReKgvvryuF4u/r/GDTAF0oHzdBwStK6WIT4vFGrIY8Qxyir4TTP77lMBz
 ZuUMPwFgOBZZ9jIsygAkpzBjVSkBqL0GJIILey0gWHzfvT6Jj1g6xWGxJAMnnf11fUCe
 5AoV4YaQSj0k7a3AiMR0Rl1f66vt+HLH8/Kr/kiaw6CvPegnE9hGpjZfB1pWP6JsmfWx
 Hb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pbF6bZvkaKkOAknK/FWA52et5zWNS8x+xQwUbipBDNc=;
 b=5YKIOBnEFMSZ/IrHGc5jIXej6IK7zEok5d8Gh5QYQvVFUqUs1k28D5rnAPf6jA39AC
 9G7i+6dsgID0gp3cefMyeyQ2kv5aI2BILNsKLsrKHFiExRRz+LCLtxfCFZ4vqIcSIWZZ
 b+NgtZ69mQpQWvVpjY0mQAocKTAxvfMkj3nSLvFy5NPyddNODBiQ5/4sHSDi1CtYpC3Y
 WvS8nLWDt7wZbRLIJR/bvgdUbGnvRkdjhgAmNv9EFOCAdfwEmQ9p3B7FLX+43dEH7LP8
 KT7W/wcDQitghxuYrUPjIv3FMgxIRcth9AWsxu20INXqjwbmblxChbuRZrnJXpI0kLFD
 1kTg==
X-Gm-Message-State: AOAM533qlou6Udp6G3O4xXSWTAzqPGnrIEl6/rZkPViuCjv55Yan5Wbf
 uMI/Ed5P2xyx2BNzirVhyNrDGQ==
X-Google-Smtp-Source: ABdhPJxtDe6aEb5EzeTjjubjt//fR0+Uoh1LnAetgE0lYo/ktxDiVJigNKDk+hp7yEKXzwIw6pBD8A==
X-Received: by 2002:a17:902:6b06:: with SMTP id
 o6mr27035376plk.162.1643751458212; 
 Tue, 01 Feb 2022 13:37:38 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:4f14:faaf:dae:66e4?
 ([2001:8003:3a49:fd00:4f14:faaf:dae:66e4])
 by smtp.gmail.com with ESMTPSA id a3sm22451493pfk.73.2022.02.01.13.37.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 13:37:37 -0800 (PST)
Message-ID: <9863981c-9040-6eff-27e6-6629d94069a5@linaro.org>
Date: Wed, 2 Feb 2022 08:37:30 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 20/22] bsd-user/bsd-file.h: Add implementations for read, 
 pread, readv and preadv
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-21-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201111455.52511-21-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stacey Son <sson@FreeBSD.org>,
 arrowd@FreeBSD.org, Kyle Evans <kevans@freebsd.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/22 22:14, Warner Losh wrote:
> Implement do_bsd_{read,pread,readv,preadv}. Connect them to the system
> call table.
> 
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/bsd-file.h           | 79 +++++++++++++++++++++++++++++++++++
>   bsd-user/freebsd/os-syscall.c | 24 +++++++++++
>   2 files changed, 103 insertions(+)
> 
> diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
> index 2f743db38e1..5934cbd5612 100644
> --- a/bsd-user/bsd-file.h
> +++ b/bsd-user/bsd-file.h
> @@ -36,4 +36,83 @@ extern struct iovec *lock_iovec(int type, abi_ulong target_addr, int count,
>   extern void unlock_iovec(struct iovec *vec, abi_ulong target_addr, int count,
>           int copy);
>   
> +ssize_t safe_read(int fd, void *buf, size_t nbytes);
> +ssize_t safe_pread(int fd, void *buf, size_t nbytes, off_t offset);
> +ssize_t safe_readv(int fd, const struct iovec *iov, int iovcnt);
> +ssize_t safe_preadv(int fd, const struct iovec *iov, int iovcnt, off_t offset);
> +
> +/* read(2) */
> +static inline abi_long do_bsd_read(abi_long arg1, abi_long arg2, abi_long arg3)
> +{
> +    abi_long ret;
> +    void *p;
> +
> +    p = lock_user(VERIFY_WRITE, arg2, arg3, 0);
> +    if (p == NULL) {
> +        return -TARGET_EFAULT;
> +    }
> +    ret = get_errno(safe_read(arg1, p, arg3));
> +    unlock_user(p, arg2, ret);
> +
> +    return ret;
> +}
> +
> +/* pread(2) */
> +static inline abi_long do_bsd_pread(void *cpu_env, abi_long arg1,
> +    abi_long arg2, abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
> +{
> +    abi_long ret;
> +    void *p;
> +
> +    p = lock_user(VERIFY_WRITE, arg2, arg3, 0);
> +    if (p == NULL) {
> +        return -TARGET_EFAULT;
> +    }
> +    if (regpairs_aligned(cpu_env) != 0) {
> +        arg4 = arg5;
> +        arg5 = arg6;
> +    }

This would be clearer if you had started labeling from arg0.

But either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> +    ret = get_errno(safe_pread(arg1, p, arg3, target_arg64(arg4, arg5)));
> +    unlock_user(p, arg2, ret);
> +
> +    return ret;
> +}
> +
> +/* readv(2) */
> +static inline abi_long do_bsd_readv(abi_long arg1, abi_long arg2, abi_long arg3)
> +{
> +    abi_long ret;
> +    struct iovec *vec = lock_iovec(VERIFY_WRITE, arg2, arg3, 0);
> +
> +    if (vec != NULL) {
> +        ret = get_errno(safe_readv(arg1, vec, arg3));
> +        unlock_iovec(vec, arg2, arg3, 1);
> +    } else {
> +        ret = -host_to_target_errno(errno);
> +    }
> +
> +    return ret;
> +}
> +
> +/* preadv(2) */
> +static inline abi_long do_bsd_preadv(void *cpu_env, abi_long arg1,
> +    abi_long arg2, abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
> +{
> +    abi_long ret;
> +    struct iovec *vec = lock_iovec(VERIFY_WRITE, arg2, arg3, 1);
> +
> +    if (vec != NULL) {
> +        if (regpairs_aligned(cpu_env) != 0) {
> +            arg4 = arg5;
> +            arg5 = arg6;
> +        }
> +        ret = get_errno(safe_preadv(arg1, vec, arg3, target_arg64(arg4, arg5)));
> +        unlock_iovec(vec, arg2, arg3, 0);
> +    } else {
> +        ret = -host_to_target_errno(errno);
> +    }
> +
> +    return ret;
> +}
> +
>   #endif /* !BSD_FILE_H_ */
> diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
> index fcfa6221182..dda79af53de 100644
> --- a/bsd-user/freebsd/os-syscall.c
> +++ b/bsd-user/freebsd/os-syscall.c
> @@ -42,6 +42,14 @@
>   
>   #include "bsd-file.h"
>   
> +/* I/O */
> +safe_syscall3(ssize_t, read, int, fd, void *, buf, size_t, nbytes);
> +safe_syscall4(ssize_t, pread, int, fd, void *, buf, size_t, nbytes, off_t,
> +    offset);
> +safe_syscall3(ssize_t, readv, int, fd, const struct iovec *, iov, int, iovcnt);
> +safe_syscall4(ssize_t, preadv, int, fd, const struct iovec *, iov, int, iovcnt,
> +    off_t, offset);
> +
>   void target_set_brk(abi_ulong new_brk)
>   {
>   }
> @@ -212,6 +220,22 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
>       }
>   
>       switch (num) {
> +
> +        /*
> +         * File system calls.
> +         */
> +    case TARGET_FREEBSD_NR_read: /* read(2) */
> +        ret = do_bsd_read(arg1, arg2, arg3);
> +        break;
> +
> +    case TARGET_FREEBSD_NR_pread: /* pread(2) */
> +        ret = do_bsd_pread(cpu_env, arg1, arg2, arg3, arg4, arg5, arg6);
> +        break;
> +
> +    case TARGET_FREEBSD_NR_readv: /* readv(2) */
> +        ret = do_bsd_readv(arg1, arg2, arg3);
> +        break;
> +
>       default:
>           gemu_log("qemu: unsupported syscall: %d\n", num);
>           ret = -TARGET_ENOSYS;


