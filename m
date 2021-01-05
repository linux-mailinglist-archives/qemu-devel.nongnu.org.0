Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8962EA326
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 03:04:47 +0100 (CET)
Received: from localhost ([::1]:51810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwbiI-0005pE-7o
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 21:04:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kwbgi-0005MR-6e
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 21:03:08 -0500
Received: from mail-il1-f175.google.com ([209.85.166.175]:45555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kwbgd-00046F-L5
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 21:03:06 -0500
Received: by mail-il1-f175.google.com with SMTP id w12so27196767ilm.12
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 18:03:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rrIdhhQdRCN8LWuRoFRgH7sJzmtGJOf7VXmWSyk1ads=;
 b=HqUVni6WPidnzJGaV4zh7urKQ7WRCYx4TQFLErEl7KAIjX2tYswoFc6fvoDRo8o9ur
 pST2kI5Rf6sTmm++6mjVB2Bt4QDQUWXlL20MAInfinU2W+Z6XV4l/DUXVKQBjKE0WmCt
 TgnFU7rpHxN/CWpPbjEMl5nSm96tE4mNCSsH5Ts4rYZ0nR4wsTioPeRWyDyMMhUShGTv
 5S8uxYEO8QR2qFyXubbcEZ08urx0WWvFHsRk4KhEuWyQPg3i97ZpEDpmUQ6jZW/7k4qn
 0Yl6sL1We4JMYStD7AcodpoEK/deerKic6xRi8lx2K+GDNB3QwDiv0JqzBFkisALAe4Z
 pvkw==
X-Gm-Message-State: AOAM532ulljYToWbiIcV/kZAzxjiRBb2Le4rahVbpTph64Juo/0ATBB0
 G6MHMwSo/Sn/jIGAKTYMQLQdswZx+bs=
X-Google-Smtp-Source: ABdhPJx8gaDdqr5nZvpVRCa6sO/7ljtNE03xDBxPhUv7oPS5KfypTMzGjwOyOyc9kuVpvU/UkPSepw==
X-Received: by 2002:a05:6e02:188f:: with SMTP id
 o15mr73183015ilu.308.1609812181768; 
 Mon, 04 Jan 2021 18:03:01 -0800 (PST)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com.
 [209.85.166.49])
 by smtp.gmail.com with ESMTPSA id y15sm41757126ili.65.2021.01.04.18.03.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jan 2021 18:03:01 -0800 (PST)
Received: by mail-io1-f49.google.com with SMTP id m23so26930852ioy.2
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 18:03:01 -0800 (PST)
X-Received: by 2002:a05:6602:1217:: with SMTP id
 y23mr61209305iot.193.1609812181092; 
 Mon, 04 Jan 2021 18:03:01 -0800 (PST)
MIME-Version: 1.0
References: <20210103145055.11074-1-r.bolshakov@yadro.com>
In-Reply-To: <20210103145055.11074-1-r.bolshakov@yadro.com>
From: Joelle van Dyne <j@getutm.app>
Date: Mon, 4 Jan 2021 18:02:50 -0800
X-Gmail-Original-Message-ID: <CA+E+eSDCBsgDo=-KP_GyFh2OB9wK5WoYx=CGqYXTvxdJbv7CGA@mail.gmail.com>
Message-ID: <CA+E+eSDCBsgDo=-KP_GyFh2OB9wK5WoYx=CGqYXTvxdJbv7CGA@mail.gmail.com>
Subject: Re: [PATCH v2] tcg: Fix execution on Apple Silicon
To: Roman Bolshakov <r.bolshakov@yadro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.166.175; envelope-from=osy86dev@gmail.com;
 helo=mail-il1-f175.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tested-by: Joelle van Dyne <j@getutm.app>

It works for me. But one thing is that if you build it with the macOS
11.x SDK it won't run on < 11.x. This is why apple recommends
something like:

        if (__builtin_available(macOS 11, *)) {
            pthread_jit_write_protect_np();
        }

You still need a compile time check like MAC_OS_VERSION_11_0 to
support linking with older SDKs.

On Sun, Jan 3, 2021 at 6:54 AM Roman Bolshakov <r.bolshakov@yadro.com> wrot=
e:
>
> Pages can't be both write and executable at the same time on Apple
> Silicon. macOS provides public API to switch write protection [1] for
> JIT applications, like TCG.
>
> 1. https://developer.apple.com/documentation/apple_silicon/porting_just-i=
n-time_compilers_to_apple_silicon
>
> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> ---
> v1: https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg00073.html
> Changes since v1:
>
>  - Pruned not needed fiddling with W^X and dropped symmetry from write
>    lock/unlock and renamed related functions.
>    Similar approach is used in JavaScriptCore [1].
>
>  - Moved jit helper functions to util/osdep
>                                                                          =
                                                                         As=
 outlined in osdep.h, this matches to (2):                                 =
                                                                           =
                                                                           =
                                                             * In an ideal =
world this header would contain only:                                      =
                                                      *  (1) things which e=
verybody needs                                                             =
                                               *  (2) things without which =
code would work on most platforms but                                      =
                                        *      fail to compile or misbehave=
 on a minority of host OSes
>
>  - Fixed a checkpatch error
>
>  - Limit new behaviour only to macOS 11.0 and above, because of the
>    following declarations:
>
>    __API_AVAILABLE(macos(11.0))
>    __API_UNAVAILABLE(ios, tvos, watchos)
>    void pthread_jit_write_protect_np(int enabled);
>
>    __API_AVAILABLE(macos(11.0))
>    __API_UNAVAILABLE(ios, tvos, watchos)
>    int pthread_jit_write_protect_supported_np(void);
>
>  1. https://bugs.webkit.org/attachment.cgi?id=3D402515&action=3Dprettypat=
ch
>
>  accel/tcg/cpu-exec.c      |  2 ++
>  accel/tcg/translate-all.c |  6 ++++++
>  include/qemu/osdep.h      |  3 +++
>  tcg/tcg.c                 |  1 +
>  util/osdep.c              | 22 ++++++++++++++++++++++
>  5 files changed, 34 insertions(+)
>
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 8689c54499..374060eb45 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -175,6 +175,7 @@ static inline tcg_target_ulong cpu_tb_exec(CPUState *=
cpu, TranslationBlock *itb)
>      }
>  #endif /* DEBUG_DISAS */
>
> +    qemu_thread_jit_execute();
>      ret =3D tcg_qemu_tb_exec(env, tb_ptr);
>      cpu->can_do_io =3D 1;
>      last_tb =3D (TranslationBlock *)(ret & ~TB_EXIT_MASK);
> @@ -382,6 +383,7 @@ static inline void tb_add_jump(TranslationBlock *tb, =
int n,
>  {
>      uintptr_t old;
>
> +    qemu_thread_jit_write();
>      assert(n < ARRAY_SIZE(tb->jmp_list_next));
>      qemu_spin_lock(&tb_next->jmp_lock);
>
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index b7d50a73d4..88ae5d35ef 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -1072,6 +1072,9 @@ static inline void *alloc_code_gen_buffer(void)
>      size_t size =3D tcg_ctx->code_gen_buffer_size;
>      void *buf;
>
> +#if defined(__APPLE__) && defined(MAC_OS_VERSION_11_0)
> +    flags |=3D MAP_JIT;
> +#endif
>      buf =3D mmap(NULL, size, prot, flags, -1, 0);
>      if (buf =3D=3D MAP_FAILED) {
>          return NULL;
> @@ -1485,7 +1488,9 @@ static void do_tb_phys_invalidate(TranslationBlock =
*tb, bool rm_from_page_list)
>
>  static void tb_phys_invalidate__locked(TranslationBlock *tb)
>  {
> +    qemu_thread_jit_write();
>      do_tb_phys_invalidate(tb, true);
> +    qemu_thread_jit_execute();
>  }
>
>  /* invalidate one TB
> @@ -1687,6 +1692,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>  #endif
>
>      assert_memory_lock();
> +    qemu_thread_jit_write();
>
>      phys_pc =3D get_page_addr_code(env, pc);
>
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index f9ec8c84e9..89abebcf5d 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -686,4 +686,7 @@ char *qemu_get_host_name(Error **errp);
>   */
>  size_t qemu_get_host_physmem(void);
>
> +void qemu_thread_jit_write(void);
> +void qemu_thread_jit_execute(void);
> +
>  #endif
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 43c6cf8f52..ab8488f5d5 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -1065,6 +1065,7 @@ void tcg_prologue_init(TCGContext *s)
>      s->pool_labels =3D NULL;
>  #endif
>
> +    qemu_thread_jit_write();
>      /* Generate the prologue.  */
>      tcg_target_qemu_prologue(s);
>
> diff --git a/util/osdep.c b/util/osdep.c
> index 66d01b9160..80ec7185da 100644
> --- a/util/osdep.c
> +++ b/util/osdep.c
> @@ -606,3 +606,25 @@ writev(int fd, const struct iovec *iov, int iov_cnt)
>      return readv_writev(fd, iov, iov_cnt, true);
>  }
>  #endif
> +
> +#if defined(__APPLE__) && defined(MAC_OS_VERSION_11_0)
> +static inline void qemu_thread_jit_write_protect(bool enabled)
> +{
> +    if (pthread_jit_write_protect_supported_np()) {
> +        pthread_jit_write_protect_np(enabled);
> +    }
> +}
> +
> +void qemu_thread_jit_execute(void)
> +{
> +    qemu_thread_jit_write_protect(true);
> +}
> +
> +void qemu_thread_jit_write(void)
> +{
> +    qemu_thread_jit_write_protect(false);
> +}
> +#else
> +void qemu_thread_jit_write(void) {}
> +void qemu_thread_jit_execute(void) {}
> +#endif
> --
> 2.29.2
>

