Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E18322E9877
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 16:27:56 +0100 (CET)
Received: from localhost ([::1]:57810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwRlz-000669-HX
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 10:27:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kwRlC-0005fF-O0
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 10:27:06 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:50584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kwRlA-0002ag-Hz
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 10:27:06 -0500
Received: by mail-wm1-x332.google.com with SMTP id 190so18800395wmz.0
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 07:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=xxkCMON02w4wCU2E7zhxd+CRnQJw22g52ONEberihQ8=;
 b=ueH3qt04q29WSeYQwyQMmLWvBBciZzIWuCJ8PA4D3la+3tiHPbDw1RAh92fCxv3z4s
 mI1DbEzxXfYAflKCOLvBrLQpg4VWw/7uS8NWET6Den6Bn7BtmFFr9yJuFLQ3MejwCxjm
 yT3fyLY6r3MliTL5Fi0QYfmqcWvsxiN7PsVcETDzujKZVdRmC7mMGiSE/4k5rkZgDu2V
 BO/j1IhmugAOidNlwxGo64CXAtNMSR04M7VmXEbF9VLbJp+COgVNIQ/ATKPWw5OaoFHf
 RMBlxtlK3duNvDlKdTAyfAmsHkxIdqQaQEJxbOfjX5mcxlNd/Iqr78NsESRgF40pFjLI
 3mzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=xxkCMON02w4wCU2E7zhxd+CRnQJw22g52ONEberihQ8=;
 b=L7nTSkhDeIkYMiYzVYohIVHphAwLJpkI2qxg5MVZ6iYmUElzvRZm3HyXskf5ysDn4r
 QvfB4S+c00OkeQZg3ay652Ow+yy8HPnHHub6NRjKBqM1rS7OS+a5porN9QZ1L6pPynmX
 BLhTwy3lCS0RKhrAx9YJMo77LNbDc85DFL6nM/5OcSGXRFFbpgmShyHTjnsrIVdR7MmV
 xcpgjMrmxX/7pdAPvxRXhSB1VD4273xBytRySBMy/GaiSy/UeVPRgvY7+Wbw/dbZAjJO
 gyb8UF3W+gvB16/8hYauFm2O3uBf/NgE22oavxr9tNK3zT2gLHzxs3HiOuJMqM2Ujflg
 ULQw==
X-Gm-Message-State: AOAM531Av5NY+W3FXL9SfoDfxcq/25iWjyrPgJnSRZRgBI+oemuIiJBn
 EdSbgFDHlmBKXwS3JspIMQqzPw==
X-Google-Smtp-Source: ABdhPJwfaAAjCl7eup+jj/xxuW9uS6mqx39yCmBJa2UTW0CbprCVCzvlUveOYY9aH0rkG0fxcpyhOQ==
X-Received: by 2002:a1c:bd09:: with SMTP id n9mr26611200wmf.32.1609774021941; 
 Mon, 04 Jan 2021 07:27:01 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z6sm32715576wmi.15.2021.01.04.07.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 07:27:00 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CDD921FF7E;
 Mon,  4 Jan 2021 15:26:59 +0000 (GMT)
References: <20210103145055.11074-1-r.bolshakov@yadro.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Roman Bolshakov <r.bolshakov@yadro.com>
Subject: Re: [PATCH v2] tcg: Fix execution on Apple Silicon
Date: Mon, 04 Jan 2021 15:23:07 +0000
In-reply-to: <20210103145055.11074-1-r.bolshakov@yadro.com>
Message-ID: <87zh1o3epo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Alexander Graf <agraf@csgraf.de>, Joelle van Dyne <j@getutm.app>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Roman Bolshakov <r.bolshakov@yadro.com> writes:

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
>=20=20
> +    qemu_thread_jit_execute();
>      ret =3D tcg_qemu_tb_exec(env, tb_ptr);
>      cpu->can_do_io =3D 1;
>      last_tb =3D (TranslationBlock *)(ret & ~TB_EXIT_MASK);
> @@ -382,6 +383,7 @@ static inline void tb_add_jump(TranslationBlock *tb, =
int n,
>  {
>      uintptr_t old;
>=20=20
> +    qemu_thread_jit_write();
>      assert(n < ARRAY_SIZE(tb->jmp_list_next));
>      qemu_spin_lock(&tb_next->jmp_lock);
>=20=20
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index b7d50a73d4..88ae5d35ef 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -1072,6 +1072,9 @@ static inline void *alloc_code_gen_buffer(void)
>      size_t size =3D tcg_ctx->code_gen_buffer_size;
>      void *buf;
>=20=20
> +#if defined(__APPLE__) && defined(MAC_OS_VERSION_11_0)
> +    flags |=3D MAP_JIT;
> +#endif
>      buf =3D mmap(NULL, size, prot, flags, -1, 0);
>      if (buf =3D=3D MAP_FAILED) {
>          return NULL;
> @@ -1485,7 +1488,9 @@ static void do_tb_phys_invalidate(TranslationBlock =
*tb, bool rm_from_page_list)
>=20=20
>  static void tb_phys_invalidate__locked(TranslationBlock *tb)
>  {
> +    qemu_thread_jit_write();
>      do_tb_phys_invalidate(tb, true);
> +    qemu_thread_jit_execute();
>  }
>=20=20
>  /* invalidate one TB
> @@ -1687,6 +1692,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>  #endif
>=20=20
>      assert_memory_lock();
> +    qemu_thread_jit_write();
>=20=20
>      phys_pc =3D get_page_addr_code(env, pc);
>=20=20
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index f9ec8c84e9..89abebcf5d 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -686,4 +686,7 @@ char *qemu_get_host_name(Error **errp);
>   */
>  size_t qemu_get_host_physmem(void);
>=20=20
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
>=20=20
> +    qemu_thread_jit_write();
>      /* Generate the prologue.  */
>      tcg_target_qemu_prologue(s);
>=20=20
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

What happens if you emulate a -smp 2 ARM guest? In this case MTTCG
should be enabled (same guest ordering) but you run a risk of attempting
to execute code while write is enabled.

Is there any way to only change the mapping for the parts of the TB
cache used by a thread? Otherwise we'll need additional logic in
default_mttcg_enabled to ensure we don't accidentally enable it on Apple
silicon.

> +#else
> +void qemu_thread_jit_write(void) {}
> +void qemu_thread_jit_execute(void) {}
> +#endif


--=20
Alex Benn=C3=A9e

