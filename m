Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D25F2EB65A
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 00:39:38 +0100 (CET)
Received: from localhost ([::1]:48690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwvvN-0007TQ-6M
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 18:39:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kwvuC-0006ji-2z
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 18:38:24 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kwvu9-0007WX-Vq
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 18:38:23 -0500
Received: by mail-wr1-x432.google.com with SMTP id q18so847619wrn.1
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 15:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=CpH7CkspaxkNNb80BvPcfWh/Op+ohGvOsymfk/Fel5E=;
 b=Tw/Je0CrfNL4Yq5P5TugRlAoXjcoBBonHTlkZzJLQFaot/wMb636PGG6CiYyn5ZOGp
 vC4XJmNm1mKhO9KddKxGTIrYktO88EJCWy24LdavETdyF3gW8NE+kmmlC9hdgbhPWQ9n
 hYiQfeYggXAf+o5E2JGCPaFdc71c8nJUOzyoR70WSYpxDzXkYbjuFlUxU4UjdfGm/g+t
 +z4gGyKMCbfz791zlk7p65Hvs0OKkw8FohAJ85jeaoBVLrinB+XO+56oIrISPF2uNlMr
 /jz95DJXnNc7CTI0cEuJ8+mSP7cnuqoD7TFIXrUBL1KF35v9U/JU+RnooriArjedIM8x
 9pbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=CpH7CkspaxkNNb80BvPcfWh/Op+ohGvOsymfk/Fel5E=;
 b=nbdg2kyzzjdIbl8oQAev05WiqtFQVsNZFsthuwrujVQmVIg2d+rEl8N5GPVPHbTvmF
 gesBQDl2qKZ+9kr67yqBO3dQao1uxdMhIh6LeGJeYeb6KhDaDn//C+I20rU3RA7JKaS9
 dA+Ae69uSUSxwcvF3CHIO0Yk9rc4IDNSwBXHzuunGzhkdz4gRAj3p025/MF5YEJhZvkG
 L7yJNnRorvp/SZUY8NEdvLFNqrJYeklOdYzo4uhIysAXsOmS0Y6gz2DRoNoF/knVtqvU
 JEpY/bQSxuXS/YzYDkUaST0Emb5pAjplmjf/P2sY+kst1D/sCoSLZtucCpg47lAbAfXL
 Q8zA==
X-Gm-Message-State: AOAM531wZ2XX+QSUm2ZQme6ECkR4WaOnJCkMfCuFluD2m0P8tMBuWjBB
 9O/V/yQ6lpSA2ZoGegAeTUM04g==
X-Google-Smtp-Source: ABdhPJw1HSL79H9exHu2PAzwRby8QbOLnp9PjsMLniEhxOdFvEks55MeI16KWcQRc9CDiUZMUzgX9w==
X-Received: by 2002:a5d:5112:: with SMTP id s18mr1616224wrt.267.1609889899830; 
 Tue, 05 Jan 2021 15:38:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k1sm766986wrn.46.2021.01.05.15.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 15:38:18 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D09E71FF7E;
 Tue,  5 Jan 2021 23:38:17 +0000 (GMT)
References: <20210103145055.11074-1-r.bolshakov@yadro.com>
 <87zh1o3epo.fsf@linaro.org> <X/TNXssb7NRw45g5@SPB-NB-133.local>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Roman Bolshakov <r.bolshakov@yadro.com>
Subject: Re: [PATCH v2] tcg: Fix execution on Apple Silicon
Date: Tue, 05 Jan 2021 23:37:26 +0000
In-reply-to: <X/TNXssb7NRw45g5@SPB-NB-133.local>
Message-ID: <87ft3f2bva.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

> On Mon, Jan 04, 2021 at 03:23:07PM +0000, Alex Benn=C3=A9e wrote:
>>=20
>> Roman Bolshakov <r.bolshakov@yadro.com> writes:
>>=20
>> > Pages can't be both write and executable at the same time on Apple
>> > Silicon. macOS provides public API to switch write protection [1] for
>> > JIT applications, like TCG.
>> >
>> > 1. https://developer.apple.com/documentation/apple_silicon/porting_jus=
t-in-time_compilers_to_apple_silicon
>> >
>> > Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
>> > ---
>> > v1: https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg00073.html
>> > Changes since v1:
>> >
>> >  - Pruned not needed fiddling with W^X and dropped symmetry from write
>> >    lock/unlock and renamed related functions.
>> >    Similar approach is used in JavaScriptCore [1].
>> >
>> >  - Moved jit helper functions to util/osdep
>> >                                                                       =
                                                                           =
 As outlined in osdep.h, this matches to (2):                              =
                                                                           =
                                                                           =
                                                                * In an ide=
al world this header would contain only:                                   =
                                                         *  (1) things whic=
h everybody needs                                                          =
                                                  *  (2) things without whi=
ch code would work on most platforms but                                   =
                                           *      fail to compile or misbeh=
ave on a minority of host OSes
>> >
>> >  - Fixed a checkpatch error
>> >
>> >  - Limit new behaviour only to macOS 11.0 and above, because of the
>> >    following declarations:
>> >
>> >    __API_AVAILABLE(macos(11.0))
>> >    __API_UNAVAILABLE(ios, tvos, watchos)
>> >    void pthread_jit_write_protect_np(int enabled);
>> >
>> >    __API_AVAILABLE(macos(11.0))
>> >    __API_UNAVAILABLE(ios, tvos, watchos)
>> >    int pthread_jit_write_protect_supported_np(void);
>> >
>> >  1. https://bugs.webkit.org/attachment.cgi?id=3D402515&action=3Dpretty=
patch
>> >
>> >  accel/tcg/cpu-exec.c      |  2 ++
>> >  accel/tcg/translate-all.c |  6 ++++++
>> >  include/qemu/osdep.h      |  3 +++
>> >  tcg/tcg.c                 |  1 +
>> >  util/osdep.c              | 22 ++++++++++++++++++++++
>> >  5 files changed, 34 insertions(+)
>> >
>> > diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>> > index 8689c54499..374060eb45 100644
>> > --- a/accel/tcg/cpu-exec.c
>> > +++ b/accel/tcg/cpu-exec.c
>> > @@ -175,6 +175,7 @@ static inline tcg_target_ulong cpu_tb_exec(CPUStat=
e *cpu, TranslationBlock *itb)
>> >      }
>> >  #endif /* DEBUG_DISAS */
>> >=20=20
>> > +    qemu_thread_jit_execute();
>> >      ret =3D tcg_qemu_tb_exec(env, tb_ptr);
>> >      cpu->can_do_io =3D 1;
>> >      last_tb =3D (TranslationBlock *)(ret & ~TB_EXIT_MASK);
>> > @@ -382,6 +383,7 @@ static inline void tb_add_jump(TranslationBlock *t=
b, int n,
>> >  {
>> >      uintptr_t old;
>> >=20=20
>> > +    qemu_thread_jit_write();
>> >      assert(n < ARRAY_SIZE(tb->jmp_list_next));
>> >      qemu_spin_lock(&tb_next->jmp_lock);
>> >=20=20
>> > diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
>> > index b7d50a73d4..88ae5d35ef 100644
>> > --- a/accel/tcg/translate-all.c
>> > +++ b/accel/tcg/translate-all.c
>> > @@ -1072,6 +1072,9 @@ static inline void *alloc_code_gen_buffer(void)
>> >      size_t size =3D tcg_ctx->code_gen_buffer_size;
>> >      void *buf;
>> >=20=20
>> > +#if defined(__APPLE__) && defined(MAC_OS_VERSION_11_0)
>> > +    flags |=3D MAP_JIT;
>> > +#endif
>> >      buf =3D mmap(NULL, size, prot, flags, -1, 0);
>> >      if (buf =3D=3D MAP_FAILED) {
>> >          return NULL;
>> > @@ -1485,7 +1488,9 @@ static void do_tb_phys_invalidate(TranslationBlo=
ck *tb, bool rm_from_page_list)
>> >=20=20
>> >  static void tb_phys_invalidate__locked(TranslationBlock *tb)
>> >  {
>> > +    qemu_thread_jit_write();
>> >      do_tb_phys_invalidate(tb, true);
>> > +    qemu_thread_jit_execute();
>> >  }
>> >=20=20
>> >  /* invalidate one TB
>> > @@ -1687,6 +1692,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>> >  #endif
>> >=20=20
>> >      assert_memory_lock();
>> > +    qemu_thread_jit_write();
>> >=20=20
>> >      phys_pc =3D get_page_addr_code(env, pc);
>> >=20=20
>> > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
>> > index f9ec8c84e9..89abebcf5d 100644
>> > --- a/include/qemu/osdep.h
>> > +++ b/include/qemu/osdep.h
>> > @@ -686,4 +686,7 @@ char *qemu_get_host_name(Error **errp);
>> >   */
>> >  size_t qemu_get_host_physmem(void);
>> >=20=20
>> > +void qemu_thread_jit_write(void);
>> > +void qemu_thread_jit_execute(void);
>> > +
>> >  #endif
>> > diff --git a/tcg/tcg.c b/tcg/tcg.c
>> > index 43c6cf8f52..ab8488f5d5 100644
>> > --- a/tcg/tcg.c
>> > +++ b/tcg/tcg.c
>> > @@ -1065,6 +1065,7 @@ void tcg_prologue_init(TCGContext *s)
>> >      s->pool_labels =3D NULL;
>> >  #endif
>> >=20=20
>> > +    qemu_thread_jit_write();
>> >      /* Generate the prologue.  */
>> >      tcg_target_qemu_prologue(s);
>> >=20=20
>> > diff --git a/util/osdep.c b/util/osdep.c
>> > index 66d01b9160..80ec7185da 100644
>> > --- a/util/osdep.c
>> > +++ b/util/osdep.c
>> > @@ -606,3 +606,25 @@ writev(int fd, const struct iovec *iov, int iov_c=
nt)
>> >      return readv_writev(fd, iov, iov_cnt, true);
>> >  }
>> >  #endif
>> > +
>> > +#if defined(__APPLE__) && defined(MAC_OS_VERSION_11_0)
>> > +static inline void qemu_thread_jit_write_protect(bool enabled)
>> > +{
>> > +    if (pthread_jit_write_protect_supported_np()) {
>> > +        pthread_jit_write_protect_np(enabled);
>> > +    }
>> > +}
>> > +
>> > +void qemu_thread_jit_execute(void)
>> > +{
>> > +    qemu_thread_jit_write_protect(true);
>> > +}
>> > +
>> > +void qemu_thread_jit_write(void)
>> > +{
>> > +    qemu_thread_jit_write_protect(false);
>> > +}
>>=20
>> What happens if you emulate a -smp 2 ARM guest? In this case MTTCG
>> should be enabled (same guest ordering) but you run a risk of attempting
>> to execute code while write is enabled.
>>=20
>
> Hi Alex,
>
> Thanks for providing a hint. Ubuntu ARM with -smp 4 boots and works. I
> can see 4 CPU in the guest and use the VM without any crashes (but it
> requires patience as it's much slower compared to hvf).
>
>> Is there any way to only change the mapping for the parts of the TB
>> cache used by a thread? Otherwise we'll need additional logic in
>> default_mttcg_enabled to ensure we don't accidentally enable it on Apple
>> silicon.
>
> I'm not sure I understand the question. The mappings are changed only
> for the thread that invokes pthread_jit_write_protect_np(). Each thread
> has its own permissions for MAP_JIT region.

Ahh that was the bit I was unsure of. If two threads can have different
permissions at the same time then it will be fine ;-)


> As far as I understand MTTCG
> works fine with the series as I've seen 376% CPU utilization at times
> with -smp 4, regardless whether MTTCG is specified explicitly
> (-accel tcg,thread=3Dmulti) or not. Respectively, default ARM on ARM is
> MTTCG and it works fine, we don't need to disable it :)
>
> Thanks,
> Roman
>
>>=20
>> > +#else
>> > +void qemu_thread_jit_write(void) {}
>> > +void qemu_thread_jit_execute(void) {}
>> > +#endif
>>=20
>>=20
>> --=20
>> Alex Benn=C3=A9e


--=20
Alex Benn=C3=A9e

