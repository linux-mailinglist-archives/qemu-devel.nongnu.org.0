Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 105204B6D1F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 14:14:16 +0100 (CET)
Received: from localhost ([::1]:57724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJxep-0000Ny-4P
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 08:14:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJxaF-00063C-FG
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:09:31 -0500
Received: from [2607:f8b0:4864:20::22c] (port=38886
 helo=mail-oi1-x22c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJxaD-0002qR-4w
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:09:31 -0500
Received: by mail-oi1-x22c.google.com with SMTP id r19so1626681oic.5
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 05:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GBOavmL8L1wFPvDxp3r/BiGrqfIOcTdL9GKUfz1np7E=;
 b=L6Oe5CvnBlJ4wm18Pek1RSVZTfbLc/aCbONqQlSUhyZYNesxPYvlnpBu/+V4kHDgJ6
 WD6Zm+6JkLWfU546ndf/6XoDNjfuYwb7uHJOUIn0WRJisu/hZibt9V0i9prSwLQq2d6b
 BBGNNuxsDgulHcGFtABAHTK0qK3hvbwcY9UaZEpD43Q4m3Y8FU3uNkvoE4zhfwglA3x7
 qKpjRERvQ52xflAq5xJhgvLYvNYJeLRJwPzvZHin/7V1pMqSkV5JVv7kIp4zGvOdwe0d
 eSNjqanjWiCv6QYP/LIdjo3B+dkw/JZeZqSIq/5xe8CNPPVANetgk0mwoO4ciyLQ+75p
 UOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GBOavmL8L1wFPvDxp3r/BiGrqfIOcTdL9GKUfz1np7E=;
 b=klD+OX3qtgAj8sXcWhku6Kqw9l6D95FSCqIORhb9v0jI75qxODX16lBXfQUtFwP0Up
 HPkAcqljs5MzFrbkvQ6H1rqANoLvCyTQRfNxJ2YaWxUKN26712owSSEXSWn5nPnNK3lg
 llhvz7KwlyC7N4scaLKjzDWxC2Vf9Fn6wedJ3Um8UD0kYkXcPW8xtbYOsPoNrGMMvRTA
 3orR1BP2S+tY76H8L0wBbX4Tz3r9MhqRQ8ik4OtCj6Hj7VZb1tlwd69HKIlDGvIqTBnq
 k/LWeTsmNvrGDNNfaskRglgHM0BZ0Qu3qyJALyOmqjrNa/mxyQGKjTfwIHD7pjuH4J6u
 9GEg==
X-Gm-Message-State: AOAM533V6bWeYn7kQ9zLQW+qGDjmEE6pZOWP3VzmU7OFmkf197PgkQcH
 js8t0EsHkr2HIc55AAUw+9zc7e9vrleLwCZhZdA=
X-Google-Smtp-Source: ABdhPJz+a9bi34PaLVjJl+Svpy7oMXKMqDPo+WywTorho4a3otk8adNDUnAxn92MX7qIptEzMvYc12fzQorKRqPAaYU=
X-Received: by 2002:aca:df44:0:b0:2ce:285f:cb99 with SMTP id
 w65-20020acadf44000000b002ce285fcb99mr1520130oig.40.1644930568012; Tue, 15
 Feb 2022 05:09:28 -0800 (PST)
MIME-Version: 1.0
References: <20220215120625.64711-1-f4bug@amsat.org>
 <20220215120625.64711-3-f4bug@amsat.org>
In-Reply-To: <20220215120625.64711-3-f4bug@amsat.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Tue, 15 Feb 2022 22:09:17 +0900
Message-ID: <CAMVc7JViZmmeMyXMvXqhtLJuvSku0goFHYgLUHMafbdR5viq3g@mail.gmail.com>
Subject: Re: [PATCH 2/4] osdep: Un-inline qemu_thread_jit_execute/write
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 9:06 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> qemu_thread_jit_execute() and qemu_thread_jit_write() call
> pthread_jit_write_protect_np() which is declared in "pthread.h".
> Since we don't want all C files to preprocess unused headers,
> avoid adding yet another header here and move the function
> definitions to osdep.c, un-inlining them.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/qemu/osdep.h | 17 ++---------------
>  util/osdep.c         | 20 ++++++++++++++++++++
>  2 files changed, 22 insertions(+), 15 deletions(-)
>
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index 1e7a002339..785884728b 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -773,21 +773,8 @@ size_t qemu_get_host_physmem(void);
>   * Toggle write/execute on the pages marked MAP_JIT
>   * for the current thread.
>   */
> -#if defined(MAC_OS_VERSION_11_0) && \
> -    MAC_OS_X_VERSION_MIN_REQUIRED >=3D MAC_OS_VERSION_11_0
> -static inline void qemu_thread_jit_execute(void)
> -{
> -    pthread_jit_write_protect_np(true);
> -}
> -
> -static inline void qemu_thread_jit_write(void)
> -{
> -    pthread_jit_write_protect_np(false);
> -}
> -#else
> -static inline void qemu_thread_jit_write(void) {}
> -static inline void qemu_thread_jit_execute(void) {}
> -#endif
> +void qemu_thread_jit_execute(void);
> +void qemu_thread_jit_write(void);
>
>  /**
>   * Platforms which do not support system() return ENOSYS
> diff --git a/util/osdep.c b/util/osdep.c
> index 42a0a4986a..b228a53612 100644
> --- a/util/osdep.c
> +++ b/util/osdep.c
> @@ -124,6 +124,26 @@ int qemu_mprotect_none(void *addr, size_t size)
>  #endif
>  }
>
> +static void qemu_pthread_jit_write_protect(bool enabled)
> +{
> +#if defined(MAC_OS_VERSION_11_0) \
> +        && MAC_OS_X_VERSION_MIN_REQUIRED >=3D MAC_OS_VERSION_11_0
> +    if (__builtin_available(macOS 11.0, *)) {
> +        pthread_jit_write_protect_np(enabled);
> +    }
> +#endif
> +}
> +
> +void qemu_thread_jit_execute(void)
> +{
> +    qemu_pthread_jit_write_protect(true);
> +}
> +
> +void qemu_thread_jit_write(void)
> +{
> +    qemu_pthread_jit_write_protect(false);
> +}
> +
>  #ifndef _WIN32
>
>  static int fcntl_op_setlk =3D -1;
> --
> 2.34.1
>

Is this for compile-time reduction? If so, it would be nice if you
provide some numbers. It should have some explanation of the advantage
otherwise.

