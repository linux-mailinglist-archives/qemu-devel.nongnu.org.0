Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCD42E9EE5
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 21:34:16 +0100 (CET)
Received: from localhost ([::1]:33152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwWYR-0000AL-8i
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 15:34:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kwWWN-0007UH-Pe
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 15:32:07 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kwWWL-00006h-JX
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 15:32:07 -0500
Received: by mail-wr1-x431.google.com with SMTP id d26so33387765wrb.12
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 12:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Bb01FxpkEWiXsCvjaxyYHTQhBddR42qvsdBDlzQJ7Qo=;
 b=DTTG1Ck+F7zD+CCqmVgYXS3yNHCYXNIR7v4X4LBMPIx8pzh9nwPHlPzeV/GtvEM7Fp
 eqqU4JWlk8x+/nrCPFVsFfHS1GJQhB2moqAkqc9u7qnVX3gz6LWaLw+Ne7ajHsUMCprs
 fhIrhkIERtyCnAgxLK2BMuvC8eMf1fjylBZyHK92lAfv+k2S4faQaaCIwKnMKcsgjdMw
 7CbubtGrPWMVsNiGW42SWy2IjrV5lcmSKtuY7F6Iz9CSheJBTQr2dOKuez913wM/jFfy
 OcCh3TSbD3+wzt96CbE6cACbrvlZhGm95hESdyl+RmG+9Cmbj1Y6Wf2RfA8ZJPt5HPPC
 1E8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Bb01FxpkEWiXsCvjaxyYHTQhBddR42qvsdBDlzQJ7Qo=;
 b=VvWWu8amufXJgzP15BCAyH2zS9M3Ug+LNkiqwLQYkpsS2Tud3JQ9/RiyyAfnsHlaIu
 zEQ/VfuNOG0QUQ7S8V7G9TyGsRhJ28hFO78LjG8XGhF9jo2Yk1sPe8JI40I8VzHL4C5w
 UZKahvotYtVdnYFFdt9LKAHZN+ZhJE7XDiGC0vuZmzIYlI4V0j7lsnjmvMgZllzD/Hga
 DfAVkYYDQY4/Z/KX66yUUrJK1Wbs7iQgq1/9dcMdch+brQLSya0UCL9bYX7ebINeIDHm
 k3Bf1cZZrvrSepIUB7Nzb4zEW/TV45It71kjkRXnzjSS5WIlXvu+KWSuJUHAA281dDNN
 lxDg==
X-Gm-Message-State: AOAM531UBPpGfELtbV1FxB0CYhcGn/rC4wG6unV3ctCg/oKNFDbiPZHn
 6bAJZ7RIawQgvfmAYCfou34DNQ==
X-Google-Smtp-Source: ABdhPJwJ2QHrUCQWmBK8wMBsC1FyFsWRnZl3u1FCouHlwB3ak82Iz1k2qsdV559o5Cimm4X9ymSj2Q==
X-Received: by 2002:a05:6000:1290:: with SMTP id
 f16mr83294460wrx.298.1609792323731; 
 Mon, 04 Jan 2021 12:32:03 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d191sm684614wmd.24.2021.01.04.12.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 12:32:02 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D99661FF7E;
 Mon,  4 Jan 2021 20:32:01 +0000 (GMT)
References: <20210103145055.11074-1-r.bolshakov@yadro.com>
 <87zh1o3epo.fsf@linaro.org>
 <2ac32d95-9d15-e52e-c91e-93ca043e5f40@csgraf.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v2] tcg: Fix execution on Apple Silicon
Date: Mon, 04 Jan 2021 20:28:08 +0000
In-reply-to: <2ac32d95-9d15-e52e-c91e-93ca043e5f40@csgraf.de>
Message-ID: <87wnws30la.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
 Roman Bolshakov <r.bolshakov@yadro.com>, Joelle van Dyne <j@getutm.app>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alexander Graf <agraf@csgraf.de> writes:

> On 04.01.21 16:23, Alex Benn=C3=A9e wrote:
>> Roman Bolshakov <r.bolshakov@yadro.com> writes:
>>
>>> Pages can't be both write and executable at the same time on Apple
>>> Silicon. macOS provides public API to switch write protection [1] for
>>> JIT applications, like TCG.
>>>
>>> 1. https://developer.apple.com/documentation/apple_silicon/porting_just=
-in-time_compilers_to_apple_silicon
>>>
>>> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
>>> ---
>>> v1: https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg00073.html
>>> Changes since v1:
>>>
>>>   - Pruned not needed fiddling with W^X and dropped symmetry from write
>>>     lock/unlock and renamed related functions.
>>>     Similar approach is used in JavaScriptCore [1].
>>>
>>>   - Moved jit helper functions to util/osdep
>>>                                                                        =
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
>>>
>>>   - Fixed a checkpatch error
>>>
>>>   - Limit new behaviour only to macOS 11.0 and above, because of the
>>>     following declarations:
>>>
>>>     __API_AVAILABLE(macos(11.0))
>>>     __API_UNAVAILABLE(ios, tvos, watchos)
>>>     void pthread_jit_write_protect_np(int enabled);
>>>
>>>     __API_AVAILABLE(macos(11.0))
>>>     __API_UNAVAILABLE(ios, tvos, watchos)
>>>     int pthread_jit_write_protect_supported_np(void);
>>>
>>>   1. https://bugs.webkit.org/attachment.cgi?id=3D402515&action=3Dpretty=
patch
>>>
>>>   accel/tcg/cpu-exec.c      |  2 ++
>>>   accel/tcg/translate-all.c |  6 ++++++
>>>   include/qemu/osdep.h      |  3 +++
>>>   tcg/tcg.c                 |  1 +
>>>   util/osdep.c              | 22 ++++++++++++++++++++++
>>>   5 files changed, 34 insertions(+)
>>>
>>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>>> index 8689c54499..374060eb45 100644
>>> --- a/accel/tcg/cpu-exec.c
>>> +++ b/accel/tcg/cpu-exec.c
>>> @@ -175,6 +175,7 @@ static inline tcg_target_ulong cpu_tb_exec(CPUState=
 *cpu, TranslationBlock *itb)
>>>       }
>>>   #endif /* DEBUG_DISAS */
>>>=20=20=20
>>> +    qemu_thread_jit_execute();
>>>       ret =3D tcg_qemu_tb_exec(env, tb_ptr);
>>>       cpu->can_do_io =3D 1;
>>>       last_tb =3D (TranslationBlock *)(ret & ~TB_EXIT_MASK);
>>> @@ -382,6 +383,7 @@ static inline void tb_add_jump(TranslationBlock *tb=
, int n,
>>>   {
>>>       uintptr_t old;
>>>=20=20=20
>>> +    qemu_thread_jit_write();
>>>       assert(n < ARRAY_SIZE(tb->jmp_list_next));
>>>       qemu_spin_lock(&tb_next->jmp_lock);
>>>=20=20=20
>>> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
>>> index b7d50a73d4..88ae5d35ef 100644
>>> --- a/accel/tcg/translate-all.c
>>> +++ b/accel/tcg/translate-all.c
>>> @@ -1072,6 +1072,9 @@ static inline void *alloc_code_gen_buffer(void)
>>>       size_t size =3D tcg_ctx->code_gen_buffer_size;
>>>       void *buf;
>>>=20=20=20
>>> +#if defined(__APPLE__) && defined(MAC_OS_VERSION_11_0)
>>> +    flags |=3D MAP_JIT;
>>> +#endif
>>>       buf =3D mmap(NULL, size, prot, flags, -1, 0);
>>>       if (buf =3D=3D MAP_FAILED) {
>>>           return NULL;
>>> @@ -1485,7 +1488,9 @@ static void do_tb_phys_invalidate(TranslationBloc=
k *tb, bool rm_from_page_list)
>>>=20=20=20
>>>   static void tb_phys_invalidate__locked(TranslationBlock *tb)
>>>   {
>>> +    qemu_thread_jit_write();
>>>       do_tb_phys_invalidate(tb, true);
>>> +    qemu_thread_jit_execute();
>>>   }
>>>=20=20=20
>>>   /* invalidate one TB
>>> @@ -1687,6 +1692,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>>>   #endif
>>>=20=20=20
>>>       assert_memory_lock();
>>> +    qemu_thread_jit_write();
>>>=20=20=20
>>>       phys_pc =3D get_page_addr_code(env, pc);
>>>=20=20=20
>>> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
>>> index f9ec8c84e9..89abebcf5d 100644
>>> --- a/include/qemu/osdep.h
>>> +++ b/include/qemu/osdep.h
>>> @@ -686,4 +686,7 @@ char *qemu_get_host_name(Error **errp);
>>>    */
>>>   size_t qemu_get_host_physmem(void);
>>>=20=20=20
>>> +void qemu_thread_jit_write(void);
>>> +void qemu_thread_jit_execute(void);
>>> +
>>>   #endif
>>> diff --git a/tcg/tcg.c b/tcg/tcg.c
>>> index 43c6cf8f52..ab8488f5d5 100644
>>> --- a/tcg/tcg.c
>>> +++ b/tcg/tcg.c
>>> @@ -1065,6 +1065,7 @@ void tcg_prologue_init(TCGContext *s)
>>>       s->pool_labels =3D NULL;
>>>   #endif
>>>=20=20=20
>>> +    qemu_thread_jit_write();
>>>       /* Generate the prologue.  */
>>>       tcg_target_qemu_prologue(s);
>>>=20=20=20
>>> diff --git a/util/osdep.c b/util/osdep.c
>>> index 66d01b9160..80ec7185da 100644
>>> --- a/util/osdep.c
>>> +++ b/util/osdep.c
>>> @@ -606,3 +606,25 @@ writev(int fd, const struct iovec *iov, int iov_cn=
t)
>>>       return readv_writev(fd, iov, iov_cnt, true);
>>>   }
>>>   #endif
>>> +
>>> +#if defined(__APPLE__) && defined(MAC_OS_VERSION_11_0)
>
>
> Will this be defined in future versions?
>
>
>>> +static inline void qemu_thread_jit_write_protect(bool enabled)
>>> +{
>>> +    if (pthread_jit_write_protect_supported_np()) {
>
>
> Do we need this call? Sounds like extra overhead to me.
>
>
>>> +        pthread_jit_write_protect_np(enabled);
>>> +    }
>>> +}
>>> +
>>> +void qemu_thread_jit_execute(void)
>>> +{
>>> +    qemu_thread_jit_write_protect(true);
>>> +}
>>> +
>>> +void qemu_thread_jit_write(void)
>>> +{
>>> +    qemu_thread_jit_write_protect(false);
>>> +}
>> What happens if you emulate a -smp 2 ARM guest? In this case MTTCG
>> should be enabled (same guest ordering) but you run a risk of attempting
>> to execute code while write is enabled.
>>
>> Is there any way to only change the mapping for the parts of the TB
>> cache used by a thread? Otherwise we'll need additional logic in
>> default_mttcg_enabled to ensure we don't accidentally enable it on Apple
>> silicon.
>
>
> The actual protection logic is per thread, so the MTTCG side thread=20
> won't be affected by the flips.

Just to be clear you are saying each thread has it's own mappings with
potentially different protection per page? I had always assumed the
mappings where per-process.

I'm not sure what you mean by side-thread. Code generation is in the
context of the running thread and while each tb region can only be
written by one thread all threads can run code residing in all regions.

> Given this super specific semantic that is impossible to mimic on other=20
> platforms, we should probably name the functions accordingly and make=20
> sure people understand this is *only* for macos.
>
> Also, is there anything this patch doesn't do that the one from Joelle=20
> does? It seems a bit ... short.
>
>
> Alex


--=20
Alex Benn=C3=A9e

