Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FA3292C8A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 19:20:07 +0200 (CEST)
Received: from localhost ([::1]:39808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUYpK-0003ed-4C
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 13:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oanderso@google.com>)
 id 1kUYm1-00012v-Tp
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 13:16:41 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:34237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <oanderso@google.com>)
 id 1kUYlx-0003J8-Mp
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 13:16:41 -0400
Received: by mail-ed1-x542.google.com with SMTP id x1so127500eds.1
 for <qemu-devel@nongnu.org>; Mon, 19 Oct 2020 10:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VccOzqRTahoJBssQpE8H5vS+Wi/1LUL9l2I4wA3LzOg=;
 b=XzfBQVFl7UgGVSnL4bYO3O8cs5Z8/S4r4EExVGnDEMIsYtxUTQKUZlPJ9JUvv7HHhJ
 4ypeIMXcuT00rW8sZVN32/rShweimSHUA31nwCEOzTRSgIgHt/7YxI3gUpPjnUNiC1Ou
 0IsKY0HoNhoHXRrB8qvVXb3hJwuHcVhwE+qLVF/LFxYjUVnoIuwdg3R/S9CTZKfuLgri
 fPfAsO3GQn5QzSJ8iJRo4G6Hq/hhkQRVTvMi2yc+M8PP9tpTtFS1bKEnBLBNIENTBxNN
 SxnBB0KuLzNR9pmz9VjZdPWSVfa6PpflQ0QNDn9Vu1/dchvDMLebJJM+Uh6c4zpxLYA+
 7koA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VccOzqRTahoJBssQpE8H5vS+Wi/1LUL9l2I4wA3LzOg=;
 b=Y0DtEOI5uFkPF/75XcADLE6QilW/+mgusfkCyCou/dvZO9tF3QjGVtJUMX3z68SaLN
 oFpJEqc7LUZwZ55UjUgMebXTjRdIKUBxSA7NMuXiGqW+8n2Dfyspl/9RUM3BGYAKikTh
 dFqFTRfuzKJi7nnkpVB+NpK6cX9a3VhLsX2RKXhYSNpIKE9cGzwdWFhB+YQlFDjIpGM9
 FRIIsgd49zBZgWJBmpUjCGa9XCI038b17wFgWSXbhJDjMDa9CJUdA0R6slIZJp4yn+R4
 MG51prfxEaJHwJ0MJBKZmOg3eF/LMfIbpAZIi9BDT5IfAMsETo9AiD5sqFAWjaSAfFi0
 lFXQ==
X-Gm-Message-State: AOAM531wjB+Lf4K7sjMxZBsTl2Jm5LmZgxXsIT8WtwtUtrCOYTMc4Wo9
 1WLCuvoQVQSttAZiQIlSDuFkMUr8JM/VfTQZIigxuK6li04=
X-Google-Smtp-Source: ABdhPJxYStgkTjIoOcaQJ1mzJb+lL/modMLUlgmNMB+bwiRn8tp3xQwchX11uSi6WWsWSklnEUtodBtSA4uf7eGMNfQ=
X-Received: by 2002:a50:9548:: with SMTP id v8mr810826eda.115.1603127794312;
 Mon, 19 Oct 2020 10:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAKs3XfJPrMGxdAouGCje3ppnWKA6fXpNaywQ5rj9u45VkPuUXg@mail.gmail.com>
 <CAKs3XfJnyuZi85=7iX2eG2viP+X893qBGG=a7dAtd8=ovN-p9g@mail.gmail.com>
In-Reply-To: <CAKs3XfJnyuZi85=7iX2eG2viP+X893qBGG=a7dAtd8=ovN-p9g@mail.gmail.com>
From: Owen Anderson <oanderso@google.com>
Date: Mon, 19 Oct 2020 10:16:23 -0700
Message-ID: <CAKs3XfJB03kquRL1X3ENTapy2RCw_CwD_rEPcteO6tOQ5q32Hw@mail.gmail.com>
Subject: Re: [RFC] Don't lookup full CPU state in the indirect branch fast
 path on AArch64 when running in user mode.
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, rth@twiddle.net
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=oanderso@google.com; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping

On Mon, Oct 12, 2020 at 1:52 PM Owen Anderson <oanderso@google.com> wrote:
>
> Ping.
>
> I'd like to get feedback on how/whether this could be developed into a
> landable version.
>
> Thanks,
>
> --Owen
>
> On Tue, Sep 29, 2020 at 2:32 PM Owen Anderson <oanderso@google.com> wrote:
> >
> > Hello,
> >
> > I would like to request feedback on the following patch, which I do
> > not believe should be applied to master as-is.  The idea here is to
> > avoid gathering the full CPU state in the fast path of an indirect
> > branch lookup when running in user mode on a platform where the flags
> > can only be changed in privileged mode.  I believe this is true on the
> > AArch64 scenario that I care about, but clearly not true in general.
> > I'm particularly seeking feedback on how to clean this up into a
> > version that checks the correct necessary and sufficient conditions to
> > allow all users that can benefit from it to do so.
> >
> > On the workload that I am targeting (aarch64 on x86), this patch
> > reduces execution wall time by approximately 20%, and eliminates
> > indirect branch lookups from the hot stack traces entirely.
> >
> > Thank you,
> >
> > --Owen
> >
> > From 3d96db17d3baacb92ef1bc5e70ef06b97d06a0ae Mon Sep 17 00:00:00 2001
> > From: Owen Anderson <oanderso@google.com>
> > Date: Tue, 29 Sep 2020 13:47:00 -0700
> > Subject: [RFC] Don't lookup full CPU state in the indirect branch fast path on
> >  AArch64 when running in user mode.
> >
> > Most of the CPU state can't be changed in user mode, so this is useless work.
> >
> > Signed-off-by: Owen Anderson <oanderso@google.com>
> > ---
> >  include/exec/tb-lookup.h | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/include/exec/tb-lookup.h b/include/exec/tb-lookup.h
> > index 9cf475bb03..f4ea0eb4c0 100644
> > --- a/include/exec/tb-lookup.h
> > +++ b/include/exec/tb-lookup.h
> > @@ -25,7 +25,15 @@ tb_lookup__cpu_state(CPUState *cpu, target_ulong
> > *pc, target_ulong *cs_base,
> >      TranslationBlock *tb;
> >      uint32_t hash;
> >
> > +#if !defined(TARGET_ARM) || !defined(CONFIG_USER_ONLY)
> >      cpu_get_tb_cpu_state(env, pc, cs_base, flags);
> > +#else
> > +    if (is_a64(env)) {
> > +      *pc = env->pc;
> > +    } else {
> > +      *pc = env->regs[15];
> > +    }
> > +#endif
> >      hash = tb_jmp_cache_hash_func(*pc);
> >      tb = qatomic_rcu_read(&cpu->tb_jmp_cache[hash]);
> >
> > @@ -34,12 +42,19 @@ tb_lookup__cpu_state(CPUState *cpu, target_ulong
> > *pc, target_ulong *cs_base,
> >
> >      if (likely(tb &&
> >                 tb->pc == *pc &&
> > +#if !defined(TARGET_ARM) || !defined(CONFIG_USER_ONLY)
> >                 tb->cs_base == *cs_base &&
> >                 tb->flags == *flags &&
> > +#endif
> >                 tb->trace_vcpu_dstate == *cpu->trace_dstate &&
> >                 (tb_cflags(tb) & (CF_HASH_MASK | CF_INVALID)) == cf_mask)) {
> >          return tb;
> >      }
> > +
> > +#ifdef CONFIG_USER_ONLY
> > +    cpu_get_tb_cpu_state(env, pc, cs_base, flags);
> > +#endif
> > +
> >      tb = tb_htable_lookup(cpu, *pc, *cs_base, *flags, cf_mask);
> >      if (tb == NULL) {
> >          return NULL;
> > --
> > 2.28.0.709.gb0816b6eb0-goog



-- 
--Owen

