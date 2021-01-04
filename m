Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9012E8F44
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 02:48:58 +0100 (CET)
Received: from localhost ([::1]:46564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwEzR-00026t-Go
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 20:48:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kwEyG-0001bg-8P
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 20:47:44 -0500
Received: from mail-io1-f41.google.com ([209.85.166.41]:36400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kwEyD-00066k-7B
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 20:47:43 -0500
Received: by mail-io1-f41.google.com with SMTP id u26so20966759iof.3
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 17:47:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=YV0DIXRSjd+5SW9y2hSEOAuDpxAuI7RAVD5b8UxQUzg=;
 b=eFSIlxvxHihBvsFiDg6N7Rq4gFo+XImzDbkIpkjzMatgLnwkKLDnOGjd46TCoix7mu
 d/nByNlJSO3+jff2wuS4gLkFC1ZgXiXVIbqjhx1BHQpZlVfdDN/gkGubvOYjvOeVaGN3
 oaoLIVsSdRSm+Q4jZOehXqW+2+Jpojy2+ze0hQJ7FRR3nnI1P1sxIMP4cY+qDR14tlOw
 ++SuSexplU7va6rMBCqiAS7plICPIq3QtI14iKMuZhJ4H+U5fc4TaSCz+HTr3QXHrI2R
 IMEAdws5Qc+X+oXZGrIZJVTezgJMFKO+Bkl45rskjLRscR2jjJermcfuv/rrcI/D7qs0
 4n3A==
X-Gm-Message-State: AOAM530p2jNq5HH0JJ6BwYmEHiEhPF7sf02iolu7cUW3JCx1rLo3io5w
 fTZ+P6aFKAUvQvRSh9wpyVu3M4r3l70=
X-Google-Smtp-Source: ABdhPJyUgUG9HiHyVg99K2pg2VVFszomY/6RP+mEwNmwxbTUSVbyV6wUpqsum8Me9iFr7Bz+Ce+49Q==
X-Received: by 2002:a02:9f19:: with SMTP id z25mr59724678jal.30.1609724859561; 
 Sun, 03 Jan 2021 17:47:39 -0800 (PST)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com.
 [209.85.166.174])
 by smtp.gmail.com with ESMTPSA id y12sm42495280ilk.32.2021.01.03.17.47.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jan 2021 17:47:39 -0800 (PST)
Received: by mail-il1-f174.google.com with SMTP id t9so23975166ilf.2
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 17:47:39 -0800 (PST)
X-Received: by 2002:a92:cccd:: with SMTP id u13mr69114184ilq.273.1609724859052; 
 Sun, 03 Jan 2021 17:47:39 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a02:6543:0:0:0:0:0 with HTTP;
 Sun, 3 Jan 2021 17:47:38 -0800 (PST)
In-Reply-To: <X/JLOe+LTWalY8h6@SPB-NB-133.local>
References: <20210102122101.39617-1-r.bolshakov@yadro.com>
 <X/Cbs4IX2Oisd0U8@SPB-NB-133.local>
 <CA+E+eSDtxomevXzFsB3h=w_3gjxshNKTRDzb9C7x7E1vMVHorA@mail.gmail.com>
 <X/HSr0q0ihc9uBUO@SPB-NB-133.local>
 <CA+E+eSBtxV996L+vNo5DBdrgafH=CX+TooRjj0KsfOtcvqYxWQ@mail.gmail.com>
 <X/JLOe+LTWalY8h6@SPB-NB-133.local>
From: Joelle van Dyne <j@getutm.app>
Date: Sun, 3 Jan 2021 17:47:38 -0800
X-Gmail-Original-Message-ID: <CA+E+eSC2KaRvvz5Zy1ArhBSNrCu22BcUZa7GROy2-_NSs5adQw@mail.gmail.com>
Message-ID: <CA+E+eSC2KaRvvz5Zy1ArhBSNrCu22BcUZa7GROy2-_NSs5adQw@mail.gmail.com>
Subject: Re: [PATCH] tcg: Fix execution on Apple Silicon
To: Roman Bolshakov <r.bolshakov@yadro.com>
Content-Type: multipart/alternative; boundary="00000000000068f9ad05b80946c7"
Received-SPF: pass client-ip=209.85.166.41; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f41.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

--00000000000068f9ad05b80946c7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The MTTCG issue is known and I=E2=80=99ve only used multiple core emulation=
 with
single core.

I haven=E2=80=99t tried your patch yet but I plan to when I get time next w=
eek. I=E2=80=99m
surprised because it=E2=80=99s (your v1 patchset) exactly what I had origin=
ally
before hitting crashes and having to add the calls to more places. But
perhaps something changed between QEMU 4.2.0 and 5.2.0 that made things
work more =E2=80=9Cas expected=E2=80=9D. If so then I plan to undo the chan=
ges I=E2=80=99ve added.

-j

On Sunday, January 3, 2021, Roman Bolshakov <r.bolshakov@yadro.com> wrote:

> On Sun, Jan 03, 2021 at 08:46:27AM -0800, Joelle van Dyne wrote:
> > Can you test with a low memory (-m 512) and also with single threaded
> > SMP (-smp 4)? Wondering if you're hitting all the edge cases because
> > there's oddities with cache flushing (can be done both in code gen and
> > code exec) and interrupt handling that caused issues for me.
> >
>
> I tested XP with default memory (128m) and -m 512. I did run Ubuntu with
> with
> -smp 1/2/4 and multiple variants of memory (2048,4096). I've just
> installed Windows 10 and it somehow works noticably faster than Ubuntu
> 20.04 (what makes me wonder why Ubuntu 20.04 peforms worse).
>
> But you know, I've noticed that MTTCG is disabled by default on arm
> hosts, so -smp 4 has no effect (it should print a warning IMO that smp
> is noop, or even quit from qemu to disallow single-threaded TCG and -smp
> flag with a value beyond 1).
>
> If I try to enable MTTCG, I get a warning from QEMU and only one CPU
> inside VM (according to Windows Task Manager).
>
> $ build/qemu-system-x86_64 -cpu Nehalem -accel tcg,thread=3Dmulti -smp 4 =
-m
> 4096 -hda ~/vms/win10.qcow2
>
> qemu-system-x86_64: -accel tcg,thread=3Dmulti: warning: Guest expects a
> stronger memory ordering than the host provides
> This may cause strange/hard to debug errors
>
> As far as I understand from the ticket below this is intentional:
> https://bugs.launchpad.net/qemu/+bug/1824768
>
> > There aren't many people overall who want to try to run emulation on
> > anything other than x86 host.
>
> Perhaps we could enable MTTCG by enabling TSO in M1 like it's done in
> Rosetta to avoid performance overheads of implicit barriers?
>
> BTW, I wonder if you tried my patch? Do you hit the mentioned issues?
>
> With regards to do_tb_phys_invalidate(), the function doesn't care
> about whether it was write or exec locked. It needs write permissions
> at least for TB spin lock. And something after return from
> tb_phys_invalidate() needs exec permssions. I can try to find "that
> something" and move change of permissions to rx closer to the place that
> needs exec permissions. And then, move change of permissions to rw
> inside do_tb_phys_invalidate() just before TB spin lock is acquired.
>
> Regards,
> Roman
>
> > -j
> >
> > On Sun, Jan 3, 2021 at 6:20 AM Roman Bolshakov <r.bolshakov@yadro.com>
> wrote:
> > >
> > > On Sat, Jan 02, 2021 at 11:55:29AM -0800, Joelle van Dyne wrote:
> > > > I see you didn't touch cpu_loop_exit() and I'm curious how async
> > > > interrupts are handled. Have you tested this and it works i.e.
> booting
> > > > Windows 7 or Ubuntu 20.04? Also I've seen do_tb_phys_invalidate()
> > > > called both from code generation context (write unlocked) and
> > > > execution context (write locked), how does this patch differentiate
> > > > the two?
> > > >
> > >
> > > Hi Joelle,
> > >
> > > I used the following rule of thumb when finding places where exec/wri=
te
> > > protection has to be lifted. If it returns EXC_BAD_ACCESS under lldb
> and
> > > stack backtrace is meaningful, then a write-protected region is
> > > accessed. If the stack couldn't be unwinded and EXC_BAD_ACCESS is
> > > returned then the region has exec restrictions.
> > >
> > > With the patch I wasn't able to see any EXC_BAD_ACCESS.
> > >
> > > I've tested x86_64 Ubuntu 20.04 Desktop. It boots but it's very slow
> > > (but faster than TCG on x86). Windows XP is much faster and quite
> > > responsive. I also tested Windows 95. I'll test Win 7/Win 10 a bit
> > > later.
> > >
> > > I'm going to update v2 shortly and going to introduce assymetric
> changes of
> > > permissions akin to Apple's JavaScriptCore. In v2, I'm not changing
> > > permission back and force unless it's needed to avoid EXC_BAD_ACCESS.
> > >
> > > Regards,
> > > Roman
> > >
> > > > -j
> > > >
> > > > On Sat, Jan 2, 2021 at 8:13 AM Roman Bolshakov <
> r.bolshakov@yadro.com> wrote:
> > > > >
> > > > > On Sat, Jan 02, 2021 at 03:21:02PM +0300, Roman Bolshakov wrote:
> > > > > > Pages can't be both write and executable at the same time on
> Apple
> > > > > > Silicon. macOS provides public API to switch write protection
> [1] for
> > > > > > JIT applications, like TCG.
> > > > > >
> > > > > > 1. https://developer.apple.com/documentation/apple_silicon/
> porting_just-in-time_compilers_to_apple_silicon
> > > > > >
> > > > > > Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> > > > > > ---
> > > > > >
> > > > > > Happy holidays, everyone.
> > > > > >
> > > > > > This is somewhat similar to https://patchwork.kernel.org/
> project/qemu-devel/patch/20201108232425.1705-7-j@getutm.app/
> > > > > > but I couldn't apply the series so I started from scratch.
> > > > > >
> > > > > > The primary difference from the patch above is that public API
> is used.
> > > > > > Other differences:
> > > > > >   * TB pages are mostly kept write-locked except around
> tcg_qemu_tb_exec()
> > > > > >   * x86_64 macOS doesn't use MAP_JIT and W^X switches
> > > > > >
> > > > > > Regards,
> > > > > > Roman
> > > > > >
> > > > > >  accel/tcg/cpu-exec.c      | 10 ++++++++++
> > > > > >  accel/tcg/translate-all.c | 26 ++++++++++++++++++++++++++
> > > > > >  include/exec/exec-all.h   |  2 ++
> > > > > >  tcg/tcg.c                 |  1 +
> > > > > >  4 files changed, 39 insertions(+)
> > > > > >
> > > > > > diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> > > > > > index 8689c54499..0042fc9f2b 100644
> > > > > > --- a/accel/tcg/cpu-exec.c
> > > > > > +++ b/accel/tcg/cpu-exec.c
> > > > > > @@ -175,7 +175,9 @@ static inline tcg_target_ulong
> cpu_tb_exec(CPUState *cpu, TranslationBlock *itb)
> > > > > >      }
> > > > > >  #endif /* DEBUG_DISAS */
> > > > > >
> > > > > > +    tb_write_lock();
> > > > > >      ret =3D tcg_qemu_tb_exec(env, tb_ptr);
> > > > > > +    tb_write_unlock();
> > > > > >      cpu->can_do_io =3D 1;
> > > > > >      last_tb =3D (TranslationBlock *)(ret & ~TB_EXIT_MASK);
> > > > > >      tb_exit =3D ret & TB_EXIT_MASK;
> > > > > > @@ -220,9 +222,11 @@ static void cpu_exec_nocache(CPUState *cpu=
,
> int max_cycles,
> > > > > >      cflags |=3D MIN(max_cycles, CF_COUNT_MASK);
> > > > > >
> > > > > >      mmap_lock();
> > > > > > +    tb_write_unlock();
> > > > > >      tb =3D tb_gen_code(cpu, orig_tb->pc, orig_tb->cs_base,
> > > > > >                       orig_tb->flags, cflags);
> > > > > >      tb->orig_tb =3D orig_tb;
> > > > > > +    tb_write_lock();
> > > > > >      mmap_unlock();
> > > > > >
> > > > > >      /* execute the generated code */
> > > > > > @@ -268,7 +272,9 @@ void cpu_exec_step_atomic(CPUState *cpu)
> > > > > >          tb =3D tb_lookup__cpu_state(cpu, &pc, &cs_base, &flags=
,
> cf_mask);
> > > > > >          if (tb =3D=3D NULL) {
> > > > > >              mmap_lock();
> > > > > > +            tb_write_unlock();
> > > > > >              tb =3D tb_gen_code(cpu, pc, cs_base, flags, cflags=
);
> > > > > > +            tb_write_lock();
> > > > > >              mmap_unlock();
> > > > > >          }
> > > > > >
> > > > > > @@ -428,7 +434,9 @@ static inline TranslationBlock
> *tb_find(CPUState *cpu,
> > > > > >      tb =3D tb_lookup__cpu_state(cpu, &pc, &cs_base, &flags,
> cf_mask);
> > > > > >      if (tb =3D=3D NULL) {
> > > > > >          mmap_lock();
> > > > > > +        tb_write_unlock();
> > > > > >          tb =3D tb_gen_code(cpu, pc, cs_base, flags, cf_mask);
> > > > > > +        tb_write_lock();
> > > > > >          mmap_unlock();
> > > > > >          /* We add the TB in the virtual pc hash table for the
> fast lookup */
> > > > > >          qatomic_set(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(=
pc)],
> tb);
> > > > > > @@ -444,7 +452,9 @@ static inline TranslationBlock
> *tb_find(CPUState *cpu,
> > > > > >  #endif
> > > > > >      /* See if we can patch the calling TB. */
> > > > > >      if (last_tb) {
> > > > > > +        tb_write_unlock();
> > > > > >          tb_add_jump(last_tb, tb_exit, tb);
> > > > > > +        tb_write_lock();
> > > > > >      }
> > > > > >      return tb;
> > > > > >  }
> > > > > > diff --git a/accel/tcg/translate-all.c
> b/accel/tcg/translate-all.c
> > > > > > index b7d50a73d4..1562076ffb 100644
> > > > > > --- a/accel/tcg/translate-all.c
> > > > > > +++ b/accel/tcg/translate-all.c
> > > > > > @@ -1072,6 +1072,9 @@ static inline void
> *alloc_code_gen_buffer(void)
> > > > > >      size_t size =3D tcg_ctx->code_gen_buffer_size;
> > > > > >      void *buf;
> > > > > >
> > > > > > +#if defined(__APPLE__) && defined(__aarch64__)
> > > > > > +    flags |=3D MAP_JIT;
> > > > > > +#endif
> > > > > >      buf =3D mmap(NULL, size, prot, flags, -1, 0);
> > > > > >      if (buf =3D=3D MAP_FAILED) {
> > > > > >          return NULL;
> > > > > > @@ -1485,7 +1488,9 @@ static void do_tb_phys_invalidate(Transla=
tionBlock
> *tb, bool rm_from_page_list)
> > > > > >
> > > > > >  static void tb_phys_invalidate__locked(TranslationBlock *tb)
> > > > > >  {
> > > > > > +    tb_write_unlock();
> > > > > >      do_tb_phys_invalidate(tb, true);
> > > > > > +    tb_write_lock();
> > > > > >  }
> > > > > >
> > > > > >  /* invalidate one TB
> > > > > > @@ -2722,3 +2727,24 @@ void tcg_flush_softmmu_tlb(CPUState *cs)
> > > > > >      tlb_flush(cs);
> > > > > >  #endif
> > > > > >  }
> > > > > > +
> > > > > > +#if defined(__APPLE__) && defined(__aarch64__)
> > > > > > +static void tb_write_protect(bool locked)
> > > > > > +{
> > > > > > +    if (pthread_jit_write_protect_supported_np()){
> > > > > > +        pthread_jit_write_protect_np(locked);
> > > > > > +    }
> > > > > > +}
> > > > > > +#else
> > > > > > +static void tb_write_protect(bool locked) {}
> > > > > > +#endif
> > > > > > +
> > > > > > +void tb_write_lock(void)
> > > > > > +{
> > > > > > +    tb_write_protect(true);
> > > > > > +}
> > > > > > +
> > > > > > +void tb_write_unlock(void)
> > > > > > +{
> > > > > > +    tb_write_protect(false);
> > > > > > +}
> > > > > > diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> > > > > > index fab573da06..962dca0975 100644
> > > > > > --- a/include/exec/exec-all.h
> > > > > > +++ b/include/exec/exec-all.h
> > > > > > @@ -549,6 +549,8 @@ TranslationBlock *tb_htable_lookup(CPUState
> *cpu, target_ulong pc,
> > > > > >                                     target_ulong cs_base,
> uint32_t flags,
> > > > > >                                     uint32_t cf_mask);
> > > > > >  void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t
> addr);
> > > > > > +void tb_write_lock(void);
> > > > > > +void tb_write_unlock(void);
> > > > > >
> > > > > >  /* GETPC is the true target of the return instruction that
> we'll execute.  */
> > > > > >  #if defined(CONFIG_TCG_INTERPRETER)
> > > > > > diff --git a/tcg/tcg.c b/tcg/tcg.c
> > > > > > index 43c6cf8f52..303bb436bd 100644
> > > > > > --- a/tcg/tcg.c
> > > > > > +++ b/tcg/tcg.c
> > > > > > @@ -1065,6 +1065,7 @@ void tcg_prologue_init(TCGContext *s)
> > > > > >      s->pool_labels =3D NULL;
> > > > > >  #endif
> > > > > >
> > > > > > +    tb_write_unlock();
> > > > > >      /* Generate the prologue.  */
> > > > > >      tcg_target_qemu_prologue(s);
> > > > > >
> > > > > > --
> > > > > > 2.29.2
> > > > > >
> > > > >
> > > > > I've also noticed that Apple doesn't worry about sticking to
> particular
> > > > > W^X mode:
> > > > >
> > > > > https://bugs.webkit.org/attachment.cgi?id=3D402515&
> action=3Dprettypatch
> > > > >
> > > > > We might also drop lock/unlock symmetry from here. E.g. we can
> have two
> > > > > functions that switch the mode (they might be moved to
> util/osdep.c):
> > > > >
> > > > >   qemu_jit_write();
> > > > >   qemu_jit_execute();
> > > > >
> > > > > Then we use them just before writing or before executing like
> advised on
> > > > > their documentation page.
> > > > >
> > > > > -Roman
>

--00000000000068f9ad05b80946c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The MTTCG issue is known and I=E2=80=99ve only used multiple core emulation=
 with single core.<div><br></div><div>I haven=E2=80=99t tried your patch ye=
t but I plan to when I get time next week. I=E2=80=99m surprised because it=
=E2=80=99s (your v1 patchset) exactly what I had originally before hitting =
crashes and having to add the calls to more places. But perhaps something c=
hanged between QEMU 4.2.0 and 5.2.0 that made things work more =E2=80=9Cas =
expected=E2=80=9D. If so then I plan to undo the changes I=E2=80=99ve added=
.</div><div><br></div><div>-j<br><br>On Sunday, January 3, 2021, Roman Bols=
hakov &lt;<a href=3D"mailto:r.bolshakov@yadro.com">r.bolshakov@yadro.com</a=
>&gt; wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">On Sun, Jan 03, 2021 at 08:4=
6:27AM -0800, Joelle van Dyne wrote:<br>
&gt; Can you test with a low memory (-m 512) and also with single threaded<=
br>
&gt; SMP (-smp 4)? Wondering if you&#39;re hitting all the edge cases becau=
se<br>
&gt; there&#39;s oddities with cache flushing (can be done both in code gen=
 and<br>
&gt; code exec) and interrupt handling that caused issues for me.<br>
&gt; <br>
<br>
I tested XP with default memory (128m) and -m 512. I did run Ubuntu with wi=
th<br>
-smp 1/2/4 and multiple variants of memory (2048,4096). I&#39;ve just<br>
installed Windows 10 and it somehow works noticably faster than Ubuntu<br>
20.04 (what makes me wonder why Ubuntu 20.04 peforms worse).<br>
<br>
But you know, I&#39;ve noticed that MTTCG is disabled by default on arm<br>
hosts, so -smp 4 has no effect (it should print a warning IMO that smp<br>
is noop, or even quit from qemu to disallow single-threaded TCG and -smp<br=
>
flag with a value beyond 1).<br>
<br>
If I try to enable MTTCG, I get a warning from QEMU and only one CPU<br>
inside VM (according to Windows Task Manager).<br>
<br>
$ build/qemu-system-x86_64 -cpu Nehalem -accel tcg,thread=3Dmulti -smp 4 -m=
 4096 -hda ~/vms/win10.qcow2<br>
<br>
qemu-system-x86_64: -accel tcg,thread=3Dmulti: warning: Guest expects a str=
onger memory ordering than the host provides<br>
This may cause strange/hard to debug errors<br>
<br>
As far as I understand from the ticket below this is intentional:<br>
<a href=3D"https://bugs.launchpad.net/qemu/+bug/1824768" target=3D"_blank">=
https://bugs.launchpad.net/<wbr>qemu/+bug/1824768</a><br>
<br>
&gt; There aren&#39;t many people overall who want to try to run emulation =
on<br>
&gt; anything other than x86 host.<br>
<br>
Perhaps we could enable MTTCG by enabling TSO in M1 like it&#39;s done in<b=
r>
Rosetta to avoid performance overheads of implicit barriers?<br>
<br>
BTW, I wonder if you tried my patch? Do you hit the mentioned issues?<br>
<br>
With regards to do_tb_phys_invalidate(), the function doesn&#39;t care<br>
about whether it was write or exec locked. It needs write permissions<br>
at least for TB spin lock. And something after return from<br>
tb_phys_invalidate() needs exec permssions. I can try to find &quot;that<br=
>
something&quot; and move change of permissions to rx closer to the place th=
at<br>
needs exec permissions. And then, move change of permissions to rw<br>
inside do_tb_phys_invalidate() just before TB spin lock is acquired.<br>
<br>
Regards,<br>
Roman<br>
<br>
&gt; -j<br>
&gt; <br>
&gt; On Sun, Jan 3, 2021 at 6:20 AM Roman Bolshakov &lt;<a href=3D"mailto:r=
.bolshakov@yadro.com">r.bolshakov@yadro.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Sat, Jan 02, 2021 at 11:55:29AM -0800, Joelle van Dyne wrote:<=
br>
&gt; &gt; &gt; I see you didn&#39;t touch cpu_loop_exit() and I&#39;m curio=
us how async<br>
&gt; &gt; &gt; interrupts are handled. Have you tested this and it works i.=
e. booting<br>
&gt; &gt; &gt; Windows 7 or Ubuntu 20.04? Also I&#39;ve seen do_tb_phys_inv=
alidate()<br>
&gt; &gt; &gt; called both from code generation context (write unlocked) an=
d<br>
&gt; &gt; &gt; execution context (write locked), how does this patch differ=
entiate<br>
&gt; &gt; &gt; the two?<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Hi Joelle,<br>
&gt; &gt;<br>
&gt; &gt; I used the following rule of thumb when finding places where exec=
/write<br>
&gt; &gt; protection has to be lifted. If it returns EXC_BAD_ACCESS under l=
ldb and<br>
&gt; &gt; stack backtrace is meaningful, then a write-protected region is<b=
r>
&gt; &gt; accessed. If the stack couldn&#39;t be unwinded and EXC_BAD_ACCES=
S is<br>
&gt; &gt; returned then the region has exec restrictions.<br>
&gt; &gt;<br>
&gt; &gt; With the patch I wasn&#39;t able to see any EXC_BAD_ACCESS.<br>
&gt; &gt;<br>
&gt; &gt; I&#39;ve tested x86_64 Ubuntu 20.04 Desktop. It boots but it&#39;=
s very slow<br>
&gt; &gt; (but faster than TCG on x86). Windows XP is much faster and quite=
<br>
&gt; &gt; responsive. I also tested Windows 95. I&#39;ll test Win 7/Win 10 =
a bit<br>
&gt; &gt; later.<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m going to update v2 shortly and going to introduce assymet=
ric changes of<br>
&gt; &gt; permissions akin to Apple&#39;s JavaScriptCore. In v2, I&#39;m no=
t changing<br>
&gt; &gt; permission back and force unless it&#39;s needed to avoid EXC_BAD=
_ACCESS.<br>
&gt; &gt;<br>
&gt; &gt; Regards,<br>
&gt; &gt; Roman<br>
&gt; &gt;<br>
&gt; &gt; &gt; -j<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Sat, Jan 2, 2021 at 8:13 AM Roman Bolshakov &lt;<a href=
=3D"mailto:r.bolshakov@yadro.com">r.bolshakov@yadro.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Sat, Jan 02, 2021 at 03:21:02PM +0300, Roman Bolshak=
ov wrote:<br>
&gt; &gt; &gt; &gt; &gt; Pages can&#39;t be both write and executable at th=
e same time on Apple<br>
&gt; &gt; &gt; &gt; &gt; Silicon. macOS provides public API to switch write=
 protection [1] for<br>
&gt; &gt; &gt; &gt; &gt; JIT applications, like TCG.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; 1. <a href=3D"https://developer.apple.com/document=
ation/apple_silicon/porting_just-in-time_compilers_to_apple_silicon" target=
=3D"_blank">https://developer.apple.com/<wbr>documentation/apple_silicon/<w=
br>porting_just-in-time_<wbr>compilers_to_apple_silicon</a><br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Signed-off-by: Roman Bolshakov &lt;<a href=3D"mail=
to:r.bolshakov@yadro.com">r.bolshakov@yadro.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Happy holidays, everyone.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; This is somewhat similar to <a href=3D"https://pat=
chwork.kernel.org/project/qemu-devel/patch/20201108232425.1705-7-j@getutm.a=
pp/" target=3D"_blank">https://patchwork.kernel.org/<wbr>project/qemu-devel=
/patch/<wbr>20201108232425.1705-7-j@<wbr>getutm.app/</a><br>
&gt; &gt; &gt; &gt; &gt; but I couldn&#39;t apply the series so I started f=
rom scratch.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; The primary difference from the patch above is tha=
t public API is used.<br>
&gt; &gt; &gt; &gt; &gt; Other differences:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0* TB pages are mostly kept write-locke=
d except around tcg_qemu_tb_exec()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0* x86_64 macOS doesn&#39;t use MAP_JIT=
 and W^X switches<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Regards,<br>
&gt; &gt; &gt; &gt; &gt; Roman<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 accel/tcg/cpu-exec.c=C2=A0 =C2=A0 =C2=A0 | 1=
0 ++++++++++<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 accel/tcg/translate-all.c | 26 +++++++++++++=
+++++++++++++<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 include/exec/exec-all.h=C2=A0 =C2=A0|=C2=A0 =
2 ++<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 tcg/tcg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 4 files changed, 39 insertions(+)<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-=
exec.c<br>
&gt; &gt; &gt; &gt; &gt; index 8689c54499..0042fc9f2b 100644<br>
&gt; &gt; &gt; &gt; &gt; --- a/accel/tcg/cpu-exec.c<br>
&gt; &gt; &gt; &gt; &gt; +++ b/accel/tcg/cpu-exec.c<br>
&gt; &gt; &gt; &gt; &gt; @@ -175,7 +175,9 @@ static inline tcg_target_ulong=
 cpu_tb_exec(CPUState *cpu, TranslationBlock *itb)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #endif /* DEBUG_DISAS */<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 tb_write_lock();<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 ret =3D tcg_qemu_tb_exec(env, =
tb_ptr);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 tb_write_unlock();<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 cpu-&gt;can_do_io =3D 1;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 last_tb =3D (TranslationBlock =
*)(ret &amp; ~TB_EXIT_MASK);<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 tb_exit =3D ret &amp; TB_EXIT_=
MASK;<br>
&gt; &gt; &gt; &gt; &gt; @@ -220,9 +222,11 @@ static void cpu_exec_nocache(=
CPUState *cpu, int max_cycles,<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 cflags |=3D MIN(max_cycles, CF=
_COUNT_MASK);<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 mmap_lock();<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 tb_write_unlock();<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 tb =3D tb_gen_code(cpu, orig_t=
b-&gt;pc, orig_tb-&gt;cs_base,<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orig_tb-&gt;flags, cflags);<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 tb-&gt;orig_tb =3D orig_tb;<br=
>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 tb_write_lock();<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 mmap_unlock();<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 /* execute the generated code =
*/<br>
&gt; &gt; &gt; &gt; &gt; @@ -268,7 +272,9 @@ void cpu_exec_step_atomic(CPUS=
tate *cpu)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tb =3D tb_lookup=
__cpu_state(cpu, &amp;pc, &amp;cs_base, &amp;flags, cf_mask);<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tb =3D=3D NU=
LL) {<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mm=
ap_lock();<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tb_writ=
e_unlock();<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tb=
 =3D tb_gen_code(cpu, pc, cs_base, flags, cflags);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tb_writ=
e_lock();<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mm=
ap_unlock();<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; @@ -428,7 +434,9 @@ static inline TranslationBlock=
 *tb_find(CPUState *cpu,<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 tb =3D tb_lookup__cpu_state(cp=
u, &amp;pc, &amp;cs_base, &amp;flags, cf_mask);<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (tb =3D=3D NULL) {<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mmap_lock();<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tb_write_unlock();<br=
>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tb =3D tb_gen_co=
de(cpu, pc, cs_base, flags, cf_mask);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tb_write_lock();<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mmap_unlock();<b=
r>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We add the TB=
 in the virtual pc hash table for the fast lookup */<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qatomic_set(&amp=
;cpu-&gt;tb_jmp_<wbr>cache[tb_jmp_cache_hash_func(<wbr>pc)], tb);<br>
&gt; &gt; &gt; &gt; &gt; @@ -444,7 +452,9 @@ static inline TranslationBlock=
 *tb_find(CPUState *cpu,<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #endif<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 /* See if we can patch the cal=
ling TB. */<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (last_tb) {<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tb_write_unlock();<br=
>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tb_add_jump(last=
_tb, tb_exit, tb);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tb_write_lock();<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 return tb;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; &gt; &gt; diff --git a/accel/tcg/translate-all.c b/accel/tcg=
/translate-all.c<br>
&gt; &gt; &gt; &gt; &gt; index b7d50a73d4..1562076ffb 100644<br>
&gt; &gt; &gt; &gt; &gt; --- a/accel/tcg/translate-all.c<br>
&gt; &gt; &gt; &gt; &gt; +++ b/accel/tcg/translate-all.c<br>
&gt; &gt; &gt; &gt; &gt; @@ -1072,6 +1072,9 @@ static inline void *alloc_co=
de_gen_buffer(void)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 size_t size =3D tcg_ctx-&gt;co=
de_gen_buffer_size;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 void *buf;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; +#if defined(__APPLE__) &amp;&amp; defined(__aarch=
64__)<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 flags |=3D MAP_JIT;<br>
&gt; &gt; &gt; &gt; &gt; +#endif<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 buf =3D mmap(NULL, size, prot,=
 flags, -1, 0);<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (buf =3D=3D MAP_FAILED) {<b=
r>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt; &gt; &gt; &gt; &gt; @@ -1485,7 +1488,9 @@ static void do_tb_phys_inval=
idate(<wbr>TranslationBlock *tb, bool rm_from_page_list)<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 static void tb_phys_invalidate__locked(<wbr>=
TranslationBlock *tb)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 {<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 tb_write_unlock();<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 do_tb_phys_invalidate(tb, true=
);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 tb_write_lock();<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 /* invalidate one TB<br>
&gt; &gt; &gt; &gt; &gt; @@ -2722,3 +2727,24 @@ void tcg_flush_softmmu_tlb(=
CPUState *cs)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 tlb_flush(cs);<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #endif<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +#if defined(__APPLE__) &amp;&amp; defined(__aarch=
64__)<br>
&gt; &gt; &gt; &gt; &gt; +static void tb_write_protect(bool locked)<br>
&gt; &gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (pthread_jit_write_protect_<wbr>=
supported_np()){<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pthread_jit_write_pro=
tect_np(<wbr>locked);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; &gt; +#else<br>
&gt; &gt; &gt; &gt; &gt; +static void tb_write_protect(bool locked) {}<br>
&gt; &gt; &gt; &gt; &gt; +#endif<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +void tb_write_lock(void)<br>
&gt; &gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 tb_write_protect(true);<br>
&gt; &gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +void tb_write_unlock(void)<br>
&gt; &gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 tb_write_protect(false);<br>
&gt; &gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; &gt; diff --git a/include/exec/exec-all.h b/include/exe=
c/exec-all.h<br>
&gt; &gt; &gt; &gt; &gt; index fab573da06..962dca0975 100644<br>
&gt; &gt; &gt; &gt; &gt; --- a/include/exec/exec-all.h<br>
&gt; &gt; &gt; &gt; &gt; +++ b/include/exec/exec-all.h<br>
&gt; &gt; &gt; &gt; &gt; @@ -549,6 +549,8 @@ TranslationBlock *tb_htable_lo=
okup(CPUState *cpu, target_ulong pc,<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0target_ulong cs_base, uint32_t flags,<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0uint32_t cf_mask);<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 void tb_set_jmp_target(<wbr>TranslationBlock=
 *tb, int n, uintptr_t addr);<br>
&gt; &gt; &gt; &gt; &gt; +void tb_write_lock(void);<br>
&gt; &gt; &gt; &gt; &gt; +void tb_write_unlock(void);<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 /* GETPC is the true target of the return in=
struction that we&#39;ll execute.=C2=A0 */<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #if defined(CONFIG_TCG_<wbr>INTERPRETER)<br>
&gt; &gt; &gt; &gt; &gt; diff --git a/tcg/tcg.c b/tcg/tcg.c<br>
&gt; &gt; &gt; &gt; &gt; index 43c6cf8f52..303bb436bd 100644<br>
&gt; &gt; &gt; &gt; &gt; --- a/tcg/tcg.c<br>
&gt; &gt; &gt; &gt; &gt; +++ b/tcg/tcg.c<br>
&gt; &gt; &gt; &gt; &gt; @@ -1065,6 +1065,7 @@ void tcg_prologue_init(TCGCo=
ntext *s)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 s-&gt;pool_labels =3D NULL;<br=
>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #endif<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 tb_write_unlock();<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 /* Generate the prologue.=C2=
=A0 */<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 tcg_target_qemu_prologue(s);<b=
r>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; 2.29.2<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I&#39;ve also noticed that Apple doesn&#39;t worry abou=
t sticking to particular<br>
&gt; &gt; &gt; &gt; W^X mode:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; <a href=3D"https://bugs.webkit.org/attachment.cgi?id=3D=
402515&amp;action=3Dprettypatch" target=3D"_blank">https://bugs.webkit.org/=
<wbr>attachment.cgi?id=3D402515&amp;<wbr>action=3Dprettypatch</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; We might also drop lock/unlock symmetry from here. E.g.=
 we can have two<br>
&gt; &gt; &gt; &gt; functions that switch the mode (they might be moved to =
util/osdep.c):<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0qemu_jit_write();<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0qemu_jit_execute();<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Then we use them just before writing or before executin=
g like advised on<br>
&gt; &gt; &gt; &gt; their documentation page.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -Roman<br>
</blockquote></div>

--00000000000068f9ad05b80946c7--

