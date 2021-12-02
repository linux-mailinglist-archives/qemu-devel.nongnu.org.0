Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDC84665E8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 15:57:06 +0100 (CET)
Received: from localhost ([::1]:53098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msnWE-0003A3-2A
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 09:57:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1msnKj-00075s-Je
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 09:45:13 -0500
Received: from [2607:f8b0:4864:20::1030] (port=45655
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1msnKR-0007Qo-8u
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 09:45:13 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 gb13-20020a17090b060d00b001a674e2c4a8so4834038pjb.4
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 06:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zfrbZWmvGp6g65dVMuAPzIExjmuBcf7NZaXYHwQ6K+c=;
 b=mbDGz+wWr3kscoP6AF/jUiTr6g0v4mxyjuAJCpb4ktlQQqLDYjy1imVAK7TeT47rx5
 Y3X/LHR8seQf5MCMLlHBsjYv00KXPculR9A9Jwu+Q8F7fYp1L/9R+ywYylhV5eV1+IT+
 uoHiW1Ibl8xPMm+u4HI7QacYydBqvGw6FyQnBYAmwzQ5K0BSl1quElUSRoz15v6gZgdF
 5oyky+SHnSkmcioAjDRklBZpPgSdtUP1txcCo3UJWn4ntGF9Wco5/FJhSRc2R5U245zg
 4bwgdD/cMYwjKgm0ChhTLVdbY5EliR5OyN7wcfgS2yaXCOf+V3lT2J52pgOLjTWNXvwP
 Rt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zfrbZWmvGp6g65dVMuAPzIExjmuBcf7NZaXYHwQ6K+c=;
 b=1M155UnaWTZHs5sTlhEAzqArMygF5Fl+QBGii2mmbJKe0cpAS4fJxFyZua/111VU2g
 +nXPi+4KT4PD53op1eJ7Rsf4jkmqUMS9FFmX74YSxf/dHt0LMhfo2ttrXVHrtF89WqvV
 tPa8MhQvzDYQv0L83MJOvmpbuSb98nURAERKw+pnTLR3v1BbL4EJPVwon09NltotC/5j
 JEFUFS+/208UImtn8zsZf+qcX1UY4YZv4tdHPAu52573CikK8qmAMyJQKlbBedHXp2Cq
 fweC4VBMzS4Wo3+baCJ886NDK8zbJf/NR+jW9tMK8JtmycOiwPlZqn6er8farg52F3jg
 daVQ==
X-Gm-Message-State: AOAM533/iC/8WNl0bk+PCjQIlNMWnPgM7Eb1Sor14EwH/kVDMte57jd/
 B6BrdSpNLNzURkaWq3oydQt9TS1ll2s259ggE3VvHg==
X-Google-Smtp-Source: ABdhPJxsNieUFVrq+1eX/lyaNuQ5/ho9zopkWWrqH40TjO4HCDHcl0FqrYxYnwuWuzDb196/DIFVGGGj2RE0wNwjlfE=
X-Received: by 2002:a17:902:db07:b0:141:ea12:218b with SMTP id
 m7-20020a170902db0700b00141ea12218bmr16041826plx.46.1638456293645; Thu, 02
 Dec 2021 06:44:53 -0800 (PST)
MIME-Version: 1.0
References: <20211201170120.286139-1-stefanha@redhat.com>
 <20211201170120.286139-2-stefanha@redhat.com>
In-Reply-To: <20211201170120.286139-2-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Dec 2021 14:44:42 +0000
Message-ID: <CAFEAcA-QU_PERcLCf3WpTc_mTU6LymEaHqVJTtahGRD8H6oT9A@mail.gmail.com>
Subject: Re: [RFC v2 1/4] tls: add macros for coroutine-safe TLS variables
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, fweimer@redhat.com, thuth@redhat.com,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Warner Losh <imp@bsdimp.com>, sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 1 Dec 2021 at 17:19, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> Compiler optimizations can cache TLS values across coroutine yield
> points, resulting in stale values from the previous thread when a
> coroutine is re-entered by a new thread.
>
> Serge Guelton developed an __attribute__((noinline)) wrapper and tested
> it with clang and gcc. I formatted his idea according to QEMU's coding
> style and wrote documentation.

> +#ifdef QEMU_CO_TLS_ADDR
> +#define QEMU_DEFINE_STATIC_CO_TLS(type, var)                    \
> +    __thread type co_tls_##var;  \
> +    static inline type get_##var(void)                          \
> +    { type *p; QEMU_CO_TLS_ADDR(p, co_tls_##var); return *p; }  \
> +    static inline void set_##var(type v)                        \
> +    { type *p; QEMU_CO_TLS_ADDR(p, co_tls_##var); *p = v; }     \
> +    static inline type *get_ptr_##var(void)                     \
> +    { type *p; QEMU_CO_TLS_ADDR(p, co_tls_##var); return p; }
> +#else
> +#define QEMU_DEFINE_STATIC_CO_TLS(type, var)                    \
> +    static __thread type co_tls_##var;                          \
> +    static __attribute__((noinline, unused)) type get_##var(void)       \
> +    { return co_tls_##var; }                                    \
> +    static __attribute__((noinline, unused)) void set_##var(type v)     \
> +    { co_tls_##var = v; }                                       \
> +    static __attribute__((noinline, unused)) type *get_ptr_##var(void)  \
> +    { return &co_tls_##var; }
> +#endif

My compiler-developer colleagues present the following case where
'noinline' is not sufficient for the compiler to definitely
use different values of the address-of-the-TLS-var across an
intervening function call:

  __thread int i;

  __attribute__((noinline)) long get_ptr_i()
  {
    return (long)&i;
  }

  void switcher();

  int g()
  {
    long a = get_ptr_i();
    switcher();
    return a == get_ptr_i();
  }

Trunk clang optimizes the comparison of the two pointers down
to "must be always true" even though they might not be if the
switcher() function has resulted in a change-of-thread:
  https://godbolt.org/z/hd67zh6jW

The 'optnone' attribute (clang-specific) seems to be able
to suppress this attribute. The equivalent on gcc may
(or may not) be 'noipa'.

-- PMM

