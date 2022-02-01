Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE944A6A16
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 03:44:33 +0100 (CET)
Received: from localhost ([::1]:33984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF5dI-0005Tg-Gh
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 21:44:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF0Wl-0001by-1x
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:17:27 -0500
Received: from [2607:f8b0:4864:20::102f] (port=45632
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF0Wi-0001O0-80
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:17:26 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 g15-20020a17090a67cf00b001b7d5b6bedaso3932173pjm.4
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 13:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=De6IIe3KMzuSpddoPfFJu3iw1r6Xx/AMA5I8+A69b4U=;
 b=MJwFVU7eyFqL6Xi5xnyp7d1hakJ/s+UO98Epm/+3EbG6oc1/UzoA9AkJFOMWffa+kg
 sxb5X1Zw2SLQRUAl158AJJBV2a2Gq7C/fjDv7hL9e3ulU6rc+q2/dd+oy6c60pGM9Dyt
 l7hdtJM+5E0J0fxyG+R9/7jYhigcxrXwVV78DjGtJ4fuYFeNR5c8MgLBUgVqvolpHU+l
 M0qIw9RIm4bolNC+xs3Do2S4RztMW1vCr8hagVRUeauix3k6TsFBrTif2vWIASaR85Et
 N4QE2SM/6iiFI1ai1vr3WNwQxWgX6m+JpNFi2M67cufcx4mBBZYaqoqWJ3IOVr34XDTu
 4W9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=De6IIe3KMzuSpddoPfFJu3iw1r6Xx/AMA5I8+A69b4U=;
 b=hp/4bJXd9XOTjx8AUyMKG9QOYdL5MQKIa+v6F2YMpwKANkCR5WqJ4UXLgmbMjHf2YK
 LQkiFDbBtjThZLYY1a2+E+3JHpuxzeL3OoGvCmqtLdWvN8we+keDMXBwoZqh3sCwEQ1x
 /AS+MtcLiN7qm0cGS0eQUSraHAR5brCQE8tX8LB8eqMPVPHsSfNYoUZ9JBiTzxC6vyIQ
 5S6Vt6y7RsQq4SlL6madXQmb9rhZFAPsbCprtJWsJbiOYw5hJ9XpLTzo8ZD4+86KOSjb
 Uv+QoJqGvU2nP61ITkQtlC/ioE8Wx8qDOzcUCacHDVwM1k9haauHZYqYAN9o7yVyBm1U
 ZK6g==
X-Gm-Message-State: AOAM533bCeKjLVYyzueW9LYfHKbtNyKxOPkdXPj9nVeVsZ5zjBH/SLB/
 va0LDbN9pdUMnbwrjCx6Sd9kZQ==
X-Google-Smtp-Source: ABdhPJzXnbbsIjslNKQf3Wmc5gGW7CjP9nAhoF6h+Ri4UN/H9V66LlUbP3HowkYdMrkTv8v0bd8e+w==
X-Received: by 2002:a17:90a:5982:: with SMTP id
 l2mr4492923pji.100.1643750214365; 
 Tue, 01 Feb 2022 13:16:54 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:4f14:faaf:dae:66e4?
 ([2001:8003:3a49:fd00:4f14:faaf:dae:66e4])
 by smtp.gmail.com with ESMTPSA id q17sm23224030pfk.108.2022.02.01.13.16.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 13:16:53 -0800 (PST)
Message-ID: <3f3af9ba-513e-6f69-7010-9eafd0720180@linaro.org>
Date: Wed, 2 Feb 2022 08:16:47 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 14/22] bsd-user/freebsd/os-syscall.c: lock_iovec
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-15-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201111455.52511-15-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>, def@FreeBSD.org, jrtc27@FreeBSD.org,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/22 22:14, Warner Losh wrote:
> lock_iovec will lock an I/O vec and the memory to which it referrs and
> create a iovec in the host space that referrs to it, with full error
> unwinding.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/freebsd/os-syscall.c | 92 +++++++++++++++++++++++++++++++++++
>   1 file changed, 92 insertions(+)
> 
> diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
> index 060134a9ecd..c21759ae7ce 100644
> --- a/bsd-user/freebsd/os-syscall.c
> +++ b/bsd-user/freebsd/os-syscall.c
> @@ -75,6 +75,98 @@ bool is_error(abi_long ret)
>       return (abi_ulong)ret >= (abi_ulong)(-4096);
>   }
>   
> +struct iovec *lock_iovec(int type, abi_ulong target_addr,
> +        int count, int copy)
> +{
> +    struct target_iovec *target_vec;
> +    struct iovec *vec;
> +    abi_ulong total_len, max_len;
> +    int i;
> +    int err = 0;
> +    bool bad_address = false;
> +
> +    if (count == 0) {
> +        errno = 0;
> +        return NULL;
> +    }
> +    if (count < 0 || count > IOV_MAX) {
> +        errno = EINVAL;
> +        return NULL;
> +    }
> +
> +    vec = calloc(count, sizeof(struct iovec));

g_try_new0.

You may want to use g_autofree to simplify error handling, which then requires you use

     return g_steal_pointer(&vec);

on the success path.

> +    if (vec == NULL) {
> +        errno = ENOMEM;
> +        return NULL;
> +    }
> +
> +    target_vec = lock_user(VERIFY_READ, target_addr,
> +                           count * sizeof(struct target_iovec), 1);
> +    if (target_vec == NULL) {
> +        err = EFAULT;
> +        goto fail2;
> +    }
> +
> +    /*
> +     * ??? If host page size > target page size, this will result in a value
> +     * larger than what we can actually support.
> +     */
> +    max_len = 0x7fffffff & TARGET_PAGE_MASK;
> +    total_len = 0;
> +
> +    for (i = 0; i < count; i++) {
> +        abi_ulong base = tswapal(target_vec[i].iov_base);
> +        abi_long len = tswapal(target_vec[i].iov_len);
> +
> +        if (len < 0) {
> +            err = EINVAL;
> +            goto fail;
> +        } else if (len == 0) {
> +            /* Zero length pointer is ignored.  */
> +            vec[i].iov_base = 0;
> +        } else {
> +            vec[i].iov_base = lock_user(type, base, len, copy);
> +            /*
> +             * If the first buffer pointer is bad, this is a fault.  But
> +             * subsequent bad buffers will result in a partial write; this is
> +             * realized by filling the vector with null pointers and zero
> +             * lengths.
> +             */
> +            if (!vec[i].iov_base) {
> +                if (i == 0) {
> +                    err = EFAULT;
> +                    goto fail;
> +                } else {
> +                    bad_address = true;
> +                }
> +            }
> +            if (bad_address) {
> +                len = 0;
> +            }

Surely this bad_address check should happen earlier, before we attempt the lock above?
E.g.

     else if (len == 0 || bad_address)


r~

