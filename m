Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E73B42EB505
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 22:49:12 +0100 (CET)
Received: from localhost ([::1]:36320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwuCV-0008MZ-DU
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 16:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kwuBF-0007td-VN
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 16:47:55 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:35854 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kwuB9-0001Tj-Bk
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 16:47:52 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id A053540416;
 Tue,  5 Jan 2021 21:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-transfer-encoding:content-disposition
 :content-type:content-type:mime-version:references:message-id
 :subject:subject:from:from:date:date:received:received:received;
 s=mta-01; t=1609883261; x=1611697662; bh=A0yD9nVWi3ETwd7TSDaF/z
 DCTYzglX/onYF5xQZvNbY=; b=ue0uzkWTAA03zoOj2c9TCkwPFbZ27Qz48Dp6X5
 Xv0IRp9R5yhZVP38slR9MK/LvczfEqE/BhomIA2Z4AaUPDU337Iec802LAsxdBpH
 QXjQnn/0miPr7pc+K6UJ+zGZDwdTarZFYF4Jt2ce0k2l9znB0m3kp/h3j66rdRss
 BjPtw=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YabN363Y9ol0; Wed,  6 Jan 2021 00:47:41 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 1F0A0411FD;
 Wed,  6 Jan 2021 00:47:40 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 6 Jan
 2021 00:47:40 +0300
Date: Wed, 6 Jan 2021 00:47:53 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v2] tcg: Fix execution on Apple Silicon
Message-ID: <X/TeiVi+grKQiHhn@SPB-NB-133.local>
References: <20210103145055.11074-1-r.bolshakov@yadro.com>
 <87zh1o3epo.fsf@linaro.org>
 <2ac32d95-9d15-e52e-c91e-93ca043e5f40@csgraf.de>
 <87wnws30la.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87wnws30la.fsf@linaro.org>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Mon, Jan 04, 2021 at 08:28:08PM +0000, Alex Bennée wrote:
> 
> Alexander Graf <agraf@csgraf.de> writes:
> 
> > On 04.01.21 16:23, Alex Bennée wrote:
> >> Roman Bolshakov <r.bolshakov@yadro.com> writes:
> >>
> >>> Pages can't be both write and executable at the same time on Apple
> >>> Silicon. macOS provides public API to switch write protection [1] for
> >>> JIT applications, like TCG.
> >>>
> >>> 1. https://developer.apple.com/documentation/apple_silicon/porting_just-in-time_compilers_to_apple_silicon
> >>>
> >>> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> >>> ---
> >>> v1: https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg00073.html
> >>> Changes since v1:
> >>>
> >>>   - Pruned not needed fiddling with W^X and dropped symmetry from write
> >>>     lock/unlock and renamed related functions.
> >>>     Similar approach is used in JavaScriptCore [1].
> >>>
> >>>   - Moved jit helper functions to util/osdep
> >>>                                                                                                                                                    As outlined in osdep.h, this matches to (2):                                                                                                                                                                                                                                                    * In an ideal world this header would contain only:                                                                                            *  (1) things which everybody needs                                                                                                            *  (2) things without which code would work on most platforms but                                                                              *      fail to compile or misbehave on a minority of host OSes
> >>>
> >>>   - Fixed a checkpatch error
> >>>
> >>>   - Limit new behaviour only to macOS 11.0 and above, because of the
> >>>     following declarations:
> >>>
> >>>     __API_AVAILABLE(macos(11.0))
> >>>     __API_UNAVAILABLE(ios, tvos, watchos)
> >>>     void pthread_jit_write_protect_np(int enabled);
> >>>
> >>>     __API_AVAILABLE(macos(11.0))
> >>>     __API_UNAVAILABLE(ios, tvos, watchos)
> >>>     int pthread_jit_write_protect_supported_np(void);
> >>>
> >>>   1. https://bugs.webkit.org/attachment.cgi?id=402515&action=prettypatch
> >>>
> >>>   accel/tcg/cpu-exec.c      |  2 ++
> >>>   accel/tcg/translate-all.c |  6 ++++++
> >>>   include/qemu/osdep.h      |  3 +++
> >>>   tcg/tcg.c                 |  1 +
> >>>   util/osdep.c              | 22 ++++++++++++++++++++++
> >>>   5 files changed, 34 insertions(+)
> >>>
> >>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> >>> index 8689c54499..374060eb45 100644
> >>> --- a/accel/tcg/cpu-exec.c
> >>> +++ b/accel/tcg/cpu-exec.c
> >>> @@ -175,6 +175,7 @@ static inline tcg_target_ulong cpu_tb_exec(CPUState *cpu, TranslationBlock *itb)
> >>>       }
> >>>   #endif /* DEBUG_DISAS */
> >>>   
> >>> +    qemu_thread_jit_execute();
> >>>       ret = tcg_qemu_tb_exec(env, tb_ptr);
> >>>       cpu->can_do_io = 1;
> >>>       last_tb = (TranslationBlock *)(ret & ~TB_EXIT_MASK);
> >>> @@ -382,6 +383,7 @@ static inline void tb_add_jump(TranslationBlock *tb, int n,
> >>>   {
> >>>       uintptr_t old;
> >>>   
> >>> +    qemu_thread_jit_write();
> >>>       assert(n < ARRAY_SIZE(tb->jmp_list_next));
> >>>       qemu_spin_lock(&tb_next->jmp_lock);
> >>>   
> >>> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> >>> index b7d50a73d4..88ae5d35ef 100644
> >>> --- a/accel/tcg/translate-all.c
> >>> +++ b/accel/tcg/translate-all.c
> >>> @@ -1072,6 +1072,9 @@ static inline void *alloc_code_gen_buffer(void)
> >>>       size_t size = tcg_ctx->code_gen_buffer_size;
> >>>       void *buf;
> >>>   
> >>> +#if defined(__APPLE__) && defined(MAC_OS_VERSION_11_0)
> >>> +    flags |= MAP_JIT;
> >>> +#endif
> >>>       buf = mmap(NULL, size, prot, flags, -1, 0);
> >>>       if (buf == MAP_FAILED) {
> >>>           return NULL;
> >>> @@ -1485,7 +1488,9 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
> >>>   
> >>>   static void tb_phys_invalidate__locked(TranslationBlock *tb)
> >>>   {
> >>> +    qemu_thread_jit_write();
> >>>       do_tb_phys_invalidate(tb, true);
> >>> +    qemu_thread_jit_execute();
> >>>   }
> >>>   
> >>>   /* invalidate one TB
> >>> @@ -1687,6 +1692,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
> >>>   #endif
> >>>   
> >>>       assert_memory_lock();
> >>> +    qemu_thread_jit_write();
> >>>   
> >>>       phys_pc = get_page_addr_code(env, pc);
> >>>   
> >>> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> >>> index f9ec8c84e9..89abebcf5d 100644
> >>> --- a/include/qemu/osdep.h
> >>> +++ b/include/qemu/osdep.h
> >>> @@ -686,4 +686,7 @@ char *qemu_get_host_name(Error **errp);
> >>>    */
> >>>   size_t qemu_get_host_physmem(void);
> >>>   
> >>> +void qemu_thread_jit_write(void);
> >>> +void qemu_thread_jit_execute(void);
> >>> +
> >>>   #endif
> >>> diff --git a/tcg/tcg.c b/tcg/tcg.c
> >>> index 43c6cf8f52..ab8488f5d5 100644
> >>> --- a/tcg/tcg.c
> >>> +++ b/tcg/tcg.c
> >>> @@ -1065,6 +1065,7 @@ void tcg_prologue_init(TCGContext *s)
> >>>       s->pool_labels = NULL;
> >>>   #endif
> >>>   
> >>> +    qemu_thread_jit_write();
> >>>       /* Generate the prologue.  */
> >>>       tcg_target_qemu_prologue(s);
> >>>   
> >>> diff --git a/util/osdep.c b/util/osdep.c
> >>> index 66d01b9160..80ec7185da 100644
> >>> --- a/util/osdep.c
> >>> +++ b/util/osdep.c
> >>> @@ -606,3 +606,25 @@ writev(int fd, const struct iovec *iov, int iov_cnt)
> >>>       return readv_writev(fd, iov, iov_cnt, true);
> >>>   }
> >>>   #endif
> >>> +
> >>> +#if defined(__APPLE__) && defined(MAC_OS_VERSION_11_0)
> >
> >
> > Will this be defined in future versions?
> >
> >
> >>> +static inline void qemu_thread_jit_write_protect(bool enabled)
> >>> +{
> >>> +    if (pthread_jit_write_protect_supported_np()) {
> >
> >
> > Do we need this call? Sounds like extra overhead to me.
> >
> >
> >>> +        pthread_jit_write_protect_np(enabled);
> >>> +    }
> >>> +}
> >>> +
> >>> +void qemu_thread_jit_execute(void)
> >>> +{
> >>> +    qemu_thread_jit_write_protect(true);
> >>> +}
> >>> +
> >>> +void qemu_thread_jit_write(void)
> >>> +{
> >>> +    qemu_thread_jit_write_protect(false);
> >>> +}
> >> What happens if you emulate a -smp 2 ARM guest? In this case MTTCG
> >> should be enabled (same guest ordering) but you run a risk of attempting
> >> to execute code while write is enabled.
> >>
> >> Is there any way to only change the mapping for the parts of the TB
> >> cache used by a thread? Otherwise we'll need additional logic in
> >> default_mttcg_enabled to ensure we don't accidentally enable it on Apple
> >> silicon.
> >
> >
> > The actual protection logic is per thread, so the MTTCG side thread 
> > won't be affected by the flips.
> 
> Just to be clear you are saying each thread has it's own mappings with
> potentially different protection per page? I had always assumed the
> mappings where per-process.
> 

The JIT mapping is one per-process but permissions for the mapping are
controlled per-thread.

Here's decription from pthread_jit_write_protect_supported_np(3)
manpage:

DESCRIPTION
     The pthread_jit_write_protect_supported_np() function returns
     whether the pthread_jit_write_protect_np() API is supported on this
     platform. If pthread_jit_write_protect_np() API is supported on
     this platform, pthread_jit_write_protect_np() must be called to
     toggle per-thread write protection on the MAP_JIT region before the
     thread writes to or executes from the MAP_JIT region.

     The pthread_jit_write_protect_np() function sets whether MAP_JIT
     region write protection is enabled for this thread.

     On platforms where pthread_jit_write_protect_supported_np() is
     true, MAP_JIT regions are never writeable and executable
     simultaneously.  When write protection is enabled for the thread,
     writes by the thread to the MAP_JIT region are denied and the
     MAP_JIT region is executable.  When write protection is disabled
     for the thread, writes by the thread to the MAP_JIT region are
     allowed and the MAP_JIT region is not executable.  Pass a non-zero
     value for the enabled parameter to enable thread JIT region write
     protection and allow execution. Pass a zero value for the enabled
     parameter to disable thread JIT write protection and deny
     execution.

     On platforms where pthread_jit_write_protect_supported_np() is not
     supported, MAP_JIT regions are both simultaenously writeable and
     executable. Calls to pthread_jit_write_protect_np() are no-ops on
     unsupported platforms.

Regards,
Roman

> I'm not sure what you mean by side-thread. Code generation is in the
> context of the running thread and while each tb region can only be
> written by one thread all threads can run code residing in all regions.
> 

