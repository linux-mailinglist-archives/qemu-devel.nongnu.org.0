Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7B4617879
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 09:14:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqVKy-0007oY-OE; Thu, 03 Nov 2022 04:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilyaoleinik1@gmail.com>)
 id 1oqVKe-0007mZ-MD
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 04:12:12 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilyaoleinik1@gmail.com>)
 id 1oqVKb-0006yO-6O
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 04:12:11 -0400
Received: by mail-qv1-xf34.google.com with SMTP id n18so627322qvt.11
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 01:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HYHroVfYhxFGlbrU1h6nqBnvzGA516NhkEP6fSc75dQ=;
 b=NpRLKZfSO9acwu0/AR+hnj0rbTdrzrsredkmplbxudiyQpMMHt5OqLm2gXJfVWWlNF
 LIoufJO5LZ/TQwDoSNDxs4t7ijnwTPk+WWNPxKL2o1Mb9Zz6w+l9XkLYxTvP3D4BHsKE
 99TKRjY52CoEjdClrgbdD/7a+vvfRuQfH7x3QE5cn9IJ+bVR3O2OgViiXwEE9i9reL0o
 S9z3BVaq6e+gyjZMfIhxvF87OkStxTBw7buCIrUzzxCy85K3jmN0ddg9Rmae1fdszCNf
 4Bmy7z7c9JDRTzNhxvSXsACzV+wqL1nvRB3zXJkRLkBTxM3KxIxEJuz4+OSbOC/0uMgN
 VoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HYHroVfYhxFGlbrU1h6nqBnvzGA516NhkEP6fSc75dQ=;
 b=OPboGmQV0BwhdFv4KixS+NeR++uYQjkoNJm7hnieShWFTnslt/hF/wgklqnMXTCPgH
 Jo9kBl6K8Jjzww5D6BvTNve++/Mjs3nwegmsWhlEPCejWuCgCVMMp4O2453zBP73Pcgk
 nCA42Ljvy+/eATV06N2IQyJ5ib+as9NOVe+e77yhzpAUw7TONCu/wV9onJTp1OgGAVkr
 DH1EUDq1l6Otcy6vOUtpO1oMZIke26g5Hela7+WhQwhhJFb1W/GA7e74AgJDMOqMaz/9
 3XhYWPjETnN6rvI6V4Ii5g7ylOWOSn461Ts9nKDb04AJ9jvAIMEGTTVCeCZjAZqll1nV
 dZ9A==
X-Gm-Message-State: ACrzQf14A+QMPQjE1LWm2JZ83Sumjp6ovLjf24GJSgIScS7uhrguCUuy
 ls52HJyN4JJLCk98s02fCu7f9lMLLOJuhwdxWNo=
X-Google-Smtp-Source: AMsMyM6K3lV5UsHJOgPgunfRvcLOttHLRmDyTeIV0vol7vSDPeifJkdX2dbkahzseOFTwoybQ9JtQJLcMTmGTZVb3Ok=
X-Received: by 2002:a0c:9c8b:0:b0:4b1:ac82:5c50 with SMTP id
 i11-20020a0c9c8b000000b004b1ac825c50mr26143704qvf.15.1667463127943; Thu, 03
 Nov 2022 01:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20221010024934.2517-1-ilyaoleinik1@gmail.com>
 <ca7518d2-4715-3d21-ee51-2c21f5878b0f@intel.com>
In-Reply-To: <ca7518d2-4715-3d21-ee51-2c21f5878b0f@intel.com>
From: Ilya Oleinik <ilyaoleinik1@gmail.com>
Date: Thu, 3 Nov 2022 17:11:57 +0900
Message-ID: <CAJB860Tr5qYRyvjandf3ZbfNXsiNSkrm+3YjD5w1UGPV+vhzGQ@mail.gmail.com>
Subject: Re: [PATCH] i386/cpu: Adjust cpuid addresable id count to match the
 spec
To: "Wang, Lei" <lei4.wang@intel.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, yang.zhong@intel.com, 
 f4bug@amsat.org, richard.henderson@linaro.org
Content-Type: multipart/alternative; boundary="0000000000006acc0005ec8c8358"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=ilyaoleinik1@gmail.com; helo=mail-qv1-xf34.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000006acc0005ec8c8358
Content-Type: text/plain; charset="UTF-8"

I'm not aware of any bug reports. L1 cache is typically shared between
logical threads, so it seemed reasonable to correct this.

On Fri, Oct 28, 2022 at 9:54 AM Wang, Lei <lei4.wang@intel.com> wrote:

>
> On 10/10/2022 10:49 AM, Ilya Oleinik wrote:
> > For EBX bits 23 - 16 in CPUID[01] Intel's manual states:
> > "
> > *   The nearest power-of-2 integer that is not smaller than EBX[23:16]
> >     is the number of unique initial APICIDs reserved for addressing
> >     different logical processors in a physical package. This field is
> >     only valid if CPUID.1.EDX.HTT[bit 28]= 1.
> > "
> > Ensure this condition is met.
> >
> > Additionally, apply efb3934adf9ee7794db7e0ade9f576c634592891 to
> > non passthrough cache mode.
> >
> > Signed-off-by: Ilya Oleinik <ilyaoleinik1@gmail.com>
> > ---
> >  target/i386/cpu.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index ad623d91e4..e793bcc03f 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -245,8 +245,8 @@ static void encode_cache_cpuid4(CPUCacheInfo *cache,
> >      *eax = CACHE_TYPE(cache->type) |
> >             CACHE_LEVEL(cache->level) |
> >             (cache->self_init ? CACHE_SELF_INIT_LEVEL : 0) |
> > -           ((num_cores - 1) << 26) |
> > -           ((num_apic_ids - 1) << 14);
> > +           ((pow2ceil(num_cores) - 1) << 26) |
> > +           ((pow2ceil(num_apic_ids) - 1) << 14);
> >
> >      assert(cache->line_size > 0);
> >      assert(cache->partitions > 0);
> > @@ -5258,7 +5258,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t
> index, uint32_t count,
> >          }
> >          *edx = env->features[FEAT_1_EDX];
> >          if (cs->nr_cores * cs->nr_threads > 1) {
> > -            *ebx |= (cs->nr_cores * cs->nr_threads) << 16;
> > +            *ebx |= (pow2ceil(cs->nr_cores * cs->nr_threads)) << 16;
> >              *edx |= CPUID_HT;
> >          }
> >          if (!cpu->enable_pmu) {
> > @@ -5313,12 +5313,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t
> index, uint32_t count,
> >              switch (count) {
> >              case 0: /* L1 dcache info */
> >                  encode_cache_cpuid4(env->cache_info_cpuid4.l1d_cache,
> > -                                    1, cs->nr_cores,
>
> Hi Ilya,
>
> Just curious why the origin implementation is hard-coded to 1 and is there
> any
> bug reported related to this?
>
> > +                                    cs->nr_threads, cs->nr_cores,
> >                                      eax, ebx, ecx, edx);
> >                  break;
> >              case 1: /* L1 icache info */
> >                  encode_cache_cpuid4(env->cache_info_cpuid4.l1i_cache,
> > -                                    1, cs->nr_cores,
> > +                                    cs->nr_threads, cs->nr_cores,
> >                                      eax, ebx, ecx, edx);
> >                  break;
> >              case 2: /* L2 cache info */
>

--0000000000006acc0005ec8c8358
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;m not aware of any bug reports. L1 cache is typ=
ically shared between logical threads, so it seemed reasonable=C2=A0to corr=
ect this.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Fri, Oct 28, 2022 at 9:54 AM Wang, Lei &lt;<a href=3D"mailto:le=
i4.wang@intel.com">lei4.wang@intel.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><br>
On 10/10/2022 10:49 AM, Ilya Oleinik wrote:<br>
&gt; For EBX bits 23 - 16 in CPUID[01] Intel&#39;s manual states:<br>
&gt; &quot;<br>
&gt; *=C2=A0 =C2=A0The nearest power-of-2 integer that is not smaller than =
EBX[23:16]<br>
&gt;=C2=A0 =C2=A0 =C2=A0is the number of unique initial APICIDs reserved fo=
r addressing<br>
&gt;=C2=A0 =C2=A0 =C2=A0different logical processors in a physical package.=
 This field is<br>
&gt;=C2=A0 =C2=A0 =C2=A0only valid if CPUID.1.EDX.HTT[bit 28]=3D 1.<br>
&gt; &quot;<br>
&gt; Ensure this condition is met.<br>
&gt; <br>
&gt; Additionally, apply efb3934adf9ee7794db7e0ade9f576c634592891 to<br>
&gt; non passthrough cache mode.<br>
&gt; <br>
&gt; Signed-off-by: Ilya Oleinik &lt;<a href=3D"mailto:ilyaoleinik1@gmail.c=
om" target=3D"_blank">ilyaoleinik1@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 target/i386/cpu.c | 10 +++++-----<br>
&gt;=C2=A0 1 file changed, 5 insertions(+), 5 deletions(-)<br>
&gt; <br>
&gt; diff --git a/target/i386/cpu.c b/target/i386/cpu.c<br>
&gt; index ad623d91e4..e793bcc03f 100644<br>
&gt; --- a/target/i386/cpu.c<br>
&gt; +++ b/target/i386/cpu.c<br>
&gt; @@ -245,8 +245,8 @@ static void encode_cache_cpuid4(CPUCacheInfo *cach=
e,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 *eax =3D CACHE_TYPE(cache-&gt;type) |<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CACHE_LEVEL(cache-&gt;l=
evel) |<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(cache-&gt;self_init ? =
CACHE_SELF_INIT_LEVEL : 0) |<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((num_cores - 1) &lt;&lt; 26=
) |<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((num_apic_ids - 1) &lt;&lt;=
 14);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((pow2ceil(num_cores) - 1) &=
lt;&lt; 26) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((pow2ceil(num_apic_ids) - 1=
) &lt;&lt; 14);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 assert(cache-&gt;line_size &gt; 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 assert(cache-&gt;partitions &gt; 0);<br>
&gt; @@ -5258,7 +5258,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t in=
dex, uint32_t count,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *edx =3D env-&gt;features[FEAT_1_EDX=
];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cs-&gt;nr_cores * cs-&gt;nr_thre=
ads &gt; 1) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *ebx |=3D (cs-&gt;nr_cores =
* cs-&gt;nr_threads) &lt;&lt; 16;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *ebx |=3D (pow2ceil(cs-&gt;=
nr_cores * cs-&gt;nr_threads)) &lt;&lt; 16;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *edx |=3D CPUID_HT;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!cpu-&gt;enable_pmu) {<br>
&gt; @@ -5313,12 +5313,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t =
index, uint32_t count,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (count) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0: /* L1 dcache i=
nfo */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 encode_c=
ache_cpuid4(env-&gt;cache_info_cpuid4.l1d_cache,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1, cs-&gt;nr_cores=
,<br>
<br>
Hi Ilya,<br>
<br>
Just curious why the origin implementation is hard-coded to 1 and is there =
any<br>
bug reported related to this?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;nr_threads,=
 cs-&gt;nr_cores,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eax, ebx, ec=
x, edx);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 1: /* L1 icache i=
nfo */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 encode_c=
ache_cpuid4(env-&gt;cache_info_cpuid4.l1i_cache,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1, cs-&gt;nr_cores=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;nr_threads,=
 cs-&gt;nr_cores,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eax, ebx, ec=
x, edx);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 2: /* L2 cache in=
fo */<br>
</blockquote></div></div>

--0000000000006acc0005ec8c8358--

