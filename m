Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EC631A254
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 17:07:23 +0100 (CET)
Received: from localhost ([::1]:45200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAayX-000708-7g
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 11:07:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAavt-0004hT-H0
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 11:04:37 -0500
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:36275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAavl-0005YS-0Z
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 11:04:37 -0500
Received: by mail-lj1-x229.google.com with SMTP id g21so5634439ljl.3
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 08:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xYiQ+RpPrzj4uT3/fUiyNHScLYcsgsG/v6q2n3tJOqc=;
 b=gLwBGB5RbR3bnuaK8BPeULrFESbu8xQDHRnBx7daYMwkKFP6Qw/yZyS5ghVNpiTqtf
 ZfOU+ZlCtaGArwyVNQyJtE6OvYLK/qbWBZdJ4TV1oplEpI0hX07l+nCp9d/1og1KQL00
 bJwWX209LgrDn55ax37UQDaF1tMeyP7iFL4WrkIrEdi39Lr1/5OrgSowJwTCq+8fB8n6
 8dx2s72W/gJccDWJfLNBVtlXnFADArJ6aiTJoD2IulEOi/ohRPL813AOJzaWAK+CX7cS
 MBri7Uw3okqY6xY1FETUCJWMnJHnGFq2rA4SjGxSi1z67qe4JRHu4yI26v+V9A8ogqF+
 c6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xYiQ+RpPrzj4uT3/fUiyNHScLYcsgsG/v6q2n3tJOqc=;
 b=EpR+a0iybDPwrnK520V1jgFcBDQyLRO02zHbbjh67WyujD0oHKmsrkpb2O1QkvHddD
 eOgzB0m85W4Z6IS8Aro5mjY18H3nF4RT00eEwzY20QGCvJ5CrGifLsGoCgW1SKddn6lC
 5s95ga4hpSosjCJHFGCp8rnvmpaIIcM9+O2+rLIQSC6aCcjQvndfrxhXpVrZqU0bBVMy
 sRgV10C28DGR+8EyykzsYq9gDtfDLj1N3mZFyrW651KnGKkezvruMtDFs4wiSepV7WVf
 ExxDy+wlfnh1+rRB8wmqAg3Xnqb5VLwxewlSn5lRdzCubsAohfa6hwboekZjRyyXP4SZ
 BUqg==
X-Gm-Message-State: AOAM530vXD4KWgac5wrQ2qWS4DhHNf5bhdWZsl7WUF7iKblXxX6SBjrS
 tlKIdeXfNkdHH6JK/XBhqM8Eqcmn+XsNa+yVvwl/kA==
X-Google-Smtp-Source: ABdhPJzUzyt74ezo2Cqvnef3Nbok+kSJxhT+WszWG9gWmk7X7BLX6PAmcNmoEAruSeD+B5m7nAOntiY9UF8EXMm8uKY=
X-Received: by 2002:a05:651c:2046:: with SMTP id
 t6mr2189462ljo.289.1613145866909; 
 Fri, 12 Feb 2021 08:04:26 -0800 (PST)
MIME-Version: 1.0
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-21-alex.bennee@linaro.org>
 <YCXRpCiekU+TgoAX@strawberry.localdomain>
 <877dndz6p7.fsf@linaro.org> <YCahojKDngG997Xz@strawberry.localdomain>
In-Reply-To: <YCahojKDngG997Xz@strawberry.localdomain>
From: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Date: Fri, 12 Feb 2021 16:04:14 +0000
Message-ID: <CAHDbmO0no_pRyG_hAEzUUJ60X6xoX1387CwaaZCJQwyyT+b0VQ@mail.gmail.com>
Subject: Re: [PATCH v2 20/21] accel/tcg: allow plugin instrumentation to be
 disable via cflags
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x229.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Robert Henry <robhenry@microsoft.com>,
 mahmoudabdalghany@outlook.com, "Emilio G. Cota" <cota@braap.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do you see two stores or one store? I think I got the sense the wrong
way around because the store is instrumented before the mmu code,
hence should be skipped on a re-instrumented block.

On Fri, 12 Feb 2021 at 15:41, Aaron Lindsay
<aaron@os.amperecomputing.com> wrote:
>
> On Feb 12 14:43, Alex Benn=C3=A9e wrote:
> > Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> > > On Feb 10 22:10, Alex Benn=C3=A9e wrote:
> > >> When icount is enabled and we recompile an MMIO access we end up
> > >> double counting the instruction execution. To avoid this we introduc=
e
> > >> the CF_NOINSTR cflag which disables instrumentation for the next TB.
> > >> As this is part of the hashed compile flags we will only execute the
> > >> generated TB while coming out of a cpu_io_recompile.
> > >
> > > Unfortunately this patch works a little too well!
> > >
> > > With this change, the memory access callbacks registered via
> > > `qemu_plugin_register_vcpu_mem_cb()` are never called for the
> > > re-translated instruction making the IO access, since we've disabled =
all
> > > instrumentation.
> > >
> > > Is it possible to selectively disable only instruction callbacks usin=
g
> > > this mechanism, while still allowing others that would not yet have b=
een
> > > called for the re-translated instruction?
> >
> > Can you try the following fugly patch on top of this series:
>
> This patch does allow me to successfully observe memory callbacks for
> stores in this case. It seems from looking at the patch that you
> intentionally only allowed memory callbacks for stores in this case, and
> I still don't see callbacks any for loads.
>
> -Aaron
>
> > --8<---------------cut here---------------start------------->8---
> > diff --git a/include/exec/plugin-gen.h b/include/exec/plugin-gen.h
> > index 4834a9e2f4..b1b72b5d90 100644
> > --- a/include/exec/plugin-gen.h
> > +++ b/include/exec/plugin-gen.h
> > @@ -19,7 +19,7 @@ struct DisasContextBase;
> >
> >  #ifdef CONFIG_PLUGIN
> >
> > -bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb);
> > +bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bo=
ol supress);
> >  void plugin_gen_tb_end(CPUState *cpu);
> >  void plugin_gen_insn_start(CPUState *cpu, const struct DisasContextBas=
e *db);
> >  void plugin_gen_insn_end(void);
> > @@ -41,7 +41,7 @@ static inline void plugin_insn_append(const void *fro=
m, size_t size)
> >  #else /* !CONFIG_PLUGIN */
> >
> >  static inline
> > -bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb)
> > +bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bo=
ol supress)
> >  {
> >      return false;
> >  }
> > diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
> > index 841deed79c..2a26a2277f 100644
> > --- a/include/qemu/plugin.h
> > +++ b/include/qemu/plugin.h
> > @@ -92,6 +92,7 @@ struct qemu_plugin_dyn_cb {
> >      };
> >  };
> >
> > +/* Internal context for instrumenting an instruction */
> >  struct qemu_plugin_insn {
> >      GByteArray *data;
> >      uint64_t vaddr;
> > @@ -99,6 +100,7 @@ struct qemu_plugin_insn {
> >      GArray *cbs[PLUGIN_N_CB_TYPES][PLUGIN_N_CB_SUBTYPES];
> >      bool calls_helpers;
> >      bool mem_helper;
> > +    bool store_only;
> >  };
> >
> >  /*
> > @@ -128,6 +130,7 @@ static inline struct qemu_plugin_insn *qemu_plugin_=
insn_alloc(void)
> >      return insn;
> >  }
> >
> > +/* Internal context for this TranslationBlock */
> >  struct qemu_plugin_tb {
> >      GPtrArray *insns;
> >      size_t n;
> > @@ -135,6 +138,7 @@ struct qemu_plugin_tb {
> >      uint64_t vaddr2;
> >      void *haddr1;
> >      void *haddr2;
> > +    bool store_only;
> >      GArray *cbs[PLUGIN_N_CB_SUBTYPES];
> >  };
> >
> > diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
> > index 8a1bb801e0..137b91282e 100644
> > --- a/accel/tcg/plugin-gen.c
> > +++ b/accel/tcg/plugin-gen.c
> > @@ -842,7 +842,7 @@ static void plugin_gen_inject(const struct qemu_plu=
gin_tb *plugin_tb)
> >      pr_ops();
> >  }
> >
> > -bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb)
> > +bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bo=
ol store_only)
> >  {
> >      struct qemu_plugin_tb *ptb =3D tcg_ctx->plugin_tb;
> >      bool ret =3D false;
> > @@ -855,6 +855,7 @@ bool plugin_gen_tb_start(CPUState *cpu, const Trans=
lationBlock *tb)
> >          ptb->vaddr2 =3D -1;
> >          get_page_addr_code_hostp(cpu->env_ptr, tb->pc, &ptb->haddr1);
> >          ptb->haddr2 =3D NULL;
> > +        ptb->store_only =3D store_only;
> >
> >          plugin_gen_empty_callback(PLUGIN_GEN_FROM_TB);
> >      }
> > diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
> > index 14d1ea795d..082f2c8ee1 100644
> > --- a/accel/tcg/translator.c
> > +++ b/accel/tcg/translator.c
> > @@ -58,7 +58,7 @@ void translator_loop(const TranslatorOps *ops, DisasC=
ontextBase *db,
> >      ops->tb_start(db, cpu);
> >      tcg_debug_assert(db->is_jmp =3D=3D DISAS_NEXT);  /* no early exit =
*/
> >
> > -    plugin_enabled =3D !(tb_cflags(db->tb) & CF_NOINSTR) && plugin_gen=
_tb_start(cpu, tb);
> > +    plugin_enabled =3D plugin_gen_tb_start(cpu, tb, tb_cflags(db->tb) =
& CF_NOINSTR);
> >
> >      while (true) {
> >          db->num_insns++;
> > @@ -100,6 +100,8 @@ void translator_loop(const TranslatorOps *ops, Disa=
sContextBase *db,
> >              gen_io_start();
> >              ops->translate_insn(db, cpu);
> >          } else {
> > +            /* we should only see NOINSTR for io_recompile */
> > +            g_assert(!(tb_cflags(db->tb) & CF_NOINSTR));
> >              ops->translate_insn(db, cpu);
> >          }
> >
> > diff --git a/plugins/api.c b/plugins/api.c
> > index 5dc8e6f934..ac8475707d 100644
> > --- a/plugins/api.c
> > +++ b/plugins/api.c
> > @@ -84,15 +84,19 @@ void qemu_plugin_register_vcpu_tb_exec_cb(struct qe=
mu_plugin_tb *tb,
> >                                            enum qemu_plugin_cb_flags fl=
ags,
> >                                            void *udata)
> >  {
> > -    plugin_register_dyn_cb__udata(&tb->cbs[PLUGIN_CB_REGULAR],
> > -                                  cb, flags, udata);
> > +    if (!tb->store_only) {
> > +        plugin_register_dyn_cb__udata(&tb->cbs[PLUGIN_CB_REGULAR],
> > +                                      cb, flags, udata);
> > +    }
> >  }
> >
> >  void qemu_plugin_register_vcpu_tb_exec_inline(struct qemu_plugin_tb *t=
b,
> >                                                enum qemu_plugin_op op,
> >                                                void *ptr, uint64_t imm)
> >  {
> > -    plugin_register_inline_op(&tb->cbs[PLUGIN_CB_INLINE], 0, op, ptr, =
imm);
> > +    if (!tb->store_only) {
> > +        plugin_register_inline_op(&tb->cbs[PLUGIN_CB_INLINE], 0, op, p=
tr, imm);
> > +    }
> >  }
> >
> >  void qemu_plugin_register_vcpu_insn_exec_cb(struct qemu_plugin_insn *i=
nsn,
> > @@ -100,16 +104,20 @@ void qemu_plugin_register_vcpu_insn_exec_cb(struc=
t qemu_plugin_insn *insn,
> >                                              enum qemu_plugin_cb_flags =
flags,
> >                                              void *udata)
> >  {
> > -    plugin_register_dyn_cb__udata(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB=
_REGULAR],
> > -        cb, flags, udata);
> > +    if (!insn->store_only) {
> > +        plugin_register_dyn_cb__udata(&insn->cbs[PLUGIN_CB_INSN][PLUGI=
N_CB_REGULAR],
> > +                                      cb, flags, udata);
> > +    }
> >  }
> >
> >  void qemu_plugin_register_vcpu_insn_exec_inline(struct qemu_plugin_ins=
n *insn,
> >                                                  enum qemu_plugin_op op=
,
> >                                                  void *ptr, uint64_t im=
m)
> >  {
> > -    plugin_register_inline_op(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB_INL=
INE],
> > -                              0, op, ptr, imm);
> > +    if (!insn->store_only) {
> > +        plugin_register_inline_op(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB=
_INLINE],
> > +                                  0, op, ptr, imm);
> > +    }
> >  }
> >
> >
> > @@ -120,8 +128,13 @@ void qemu_plugin_register_vcpu_mem_cb(struct qemu_=
plugin_insn *insn,
> >                                        enum qemu_plugin_mem_rw rw,
> >                                        void *udata)
> >  {
> > -    plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_RE=
GULAR],
> > -                                cb, flags, rw, udata);
> > +    if (insn->store_only && (rw & QEMU_PLUGIN_MEM_W)) {
> > +        plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_C=
B_REGULAR],
> > +                                    cb, flags, QEMU_PLUGIN_MEM_W, udat=
a);
> > +    } else {
> > +        plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_C=
B_REGULAR],
> > +                                    cb, flags, rw, udata);
> > +    }
> >  }
> >
> >  void qemu_plugin_register_vcpu_mem_inline(struct qemu_plugin_insn *ins=
n,
> > @@ -129,8 +142,10 @@ void qemu_plugin_register_vcpu_mem_inline(struct q=
emu_plugin_insn *insn,
> >                                            enum qemu_plugin_op op, void=
 *ptr,
> >                                            uint64_t imm)
> >  {
> > -    plugin_register_inline_op(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_INLI=
NE],
> > -        rw, op, ptr, imm);
> > +    if (!insn->store_only) {
> > +        plugin_register_inline_op(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_=
INLINE],
> > +                                  rw, op, ptr, imm);
> > +    }
> >  }
> >
> >  void qemu_plugin_register_vcpu_tb_trans_cb(qemu_plugin_id_t id,
> > @@ -181,10 +196,13 @@ uint64_t qemu_plugin_tb_vaddr(const struct qemu_p=
lugin_tb *tb)
> >  struct qemu_plugin_insn *
> >  qemu_plugin_tb_get_insn(const struct qemu_plugin_tb *tb, size_t idx)
> >  {
> > +    struct qemu_plugin_insn *insn;
> >      if (unlikely(idx >=3D tb->n)) {
> >          return NULL;
> >      }
> > -    return g_ptr_array_index(tb->insns, idx);
> > +    insn =3D g_ptr_array_index(tb->insns, idx);
> > +    insn->store_only =3D tb->store_only;
> > +    return insn;
> >  }
> >
> >  /*
> > --8<---------------cut here---------------end--------------->8---
> >
> > --
> > Alex Benn=C3=A9e



--=20
Alex Benn=C3=A9e
KVM/QEMU Hacker for Linaro

