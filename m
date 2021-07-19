Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC83C3CD436
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 13:56:53 +0200 (CEST)
Received: from localhost ([::1]:51706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5RtE-000570-R7
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 07:56:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m5RSN-0007V4-Ij
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:29:07 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:41944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m5RSJ-00075r-If
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:29:05 -0400
Received: by mail-io1-xd32.google.com with SMTP id z9so19467342iob.8
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 04:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VG4ZOnn2Rtuk2nPt1inI39rdM4fNmmpXdpLW0rlbCsg=;
 b=uSdUAlcjCfQjt491CAmpbCGvqRtGaF32iC3QgICQIbdz+XXlLy4Sa/+TGSt2VGbXZy
 LtsBuVcpsrzPQfSDJn77CmMml91lqsaqckiRaaXzPcQkp4FvdJRqNwymSJqsa8GkHgZi
 g6Dg6/R/pwR0IBBrwOoyIGGGr1P663Xqzbc/Cl87RrtRRIsoaxBIRXwnsApo3/bSa+33
 yqN4EibEVT6a1yWfSvQLf7puXi90qEJg1sLRJ6VJxnNvAnZhrkwGXn4sA4WvqDD3UnNR
 eq9aXvzgC+e/rkzDdkbaibW0AHzHuAZozJPPYdlkbmSHijdh3FOJk/bMshSa4JqtwvkV
 1JGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VG4ZOnn2Rtuk2nPt1inI39rdM4fNmmpXdpLW0rlbCsg=;
 b=R41qkq7ZmQxB8UYHQhfgcIs/Kwb9594m/qHAm0s151IHAVUy2Q7Kz2LnIPnTsSgJKA
 Xpo5zS4HXsVWkkHvsVJcG0joj10QfitGO1kQU+c/dOwJfXdjFGvtoc3UJFH866m72qRv
 k8ECqD8FlP/qswyM65ZI0sat9un4x/FHHVMT9w0gITqEgnJ+ITb2Xe9FlGqwt7wjBo2Q
 4jCI3IBTy9ZFRSn0bAZioFksH87LEjCdJebguDWYbr/w9dDN690BXVfk/v7kXBBTYBo+
 5YTiToSP8od2j08nphtJsK9TgudgxEwElEKGQQiCsRIeUKjcL7MUXaXClJdaZ3+8j14q
 1Ctg==
X-Gm-Message-State: AOAM53260VR3pixXtW52mm+LuEfEx5X6YzqbGeatBFmYmRMD0Sncj9Dx
 PwDMbbD4BoJSBW+O80/zWgxWEdxhhVVTmXZx7WA=
X-Google-Smtp-Source: ABdhPJxUZF4RBoyst5rAIBCm06PKQ3tE6BFqEO0IS0kiQbAXGaOa/W6iaNrmBB+FhqZL5ZzG3GPdSfhEtoQ8+B2zrBE=
X-Received: by 2002:a5d:8b85:: with SMTP id p5mr18144756iol.43.1626694142455; 
 Mon, 19 Jul 2021 04:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210714172151.8494-1-ma.mandourr@gmail.com>
 <20210714172151.8494-4-ma.mandourr@gmail.com>
 <87zguiprbi.fsf@linaro.org>
 <CAD-LL6hk+xWhCwLb0mK0W4ZWP29BKmfnTVJwLe7zA0-g7=ji-w@mail.gmail.com>
 <87tukqpnlt.fsf@linaro.org>
In-Reply-To: <87tukqpnlt.fsf@linaro.org>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Mon, 19 Jul 2021 13:28:51 +0200
Message-ID: <CAD-LL6g8edEAjCVd0OZ3LVyEFidqM8p2KP9fikU2fLx2i0H9Kg@mail.gmail.com>
Subject: Re: [PATCH 3/6] plugins/cache: Fixed a use-after-free bug with
 multithreaded usermode
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000084f41505c7783e23"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=ma.mandourr@gmail.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "Emilio G. Cota" <cota@braap.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000084f41505c7783e23
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2021 at 1:08 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

>
> Mahmoud Mandour <ma.mandourr@gmail.com> writes:
>
> > On Mon, Jul 19, 2021 at 11:48 AM Alex Benn=C3=A9e <alex.bennee@linaro.o=
rg>
> wrote:
> >
> >  Mahmoud Mandour <ma.mandourr@gmail.com> writes:
> >
> >  > Since callbacks may be interleaved because of multithreaded executio=
n,
> >  > we should not make assumptions about `plugin_exit` either. The probl=
em
> >  > with `plugin_exit` is that it frees shared data structures (caches a=
nd
> >  > `miss_ht` hash table). It should not be assumed that callbacks will
> not
> >  > be called after it and hence use already-freed data structures.
> >
> >  What was your test case for this because I wonder if it would be worth
> >  coming up with one for check-tcg?
> >
> > I think just any ad-hoc multithreaded execution will evoke the race
> pretty much
> > consistently.
>
> I haven't managed to trigger it with testthread but of course my
> libcache is trying to to defend against it.
>

https://pastebin.com/X4Xazemh
That's a minimal program that reproduces the bug consistently for me (to my
observation, a simple
program that creates a bunch of threads that immediately exit does not
produce the bug as frequently)

You can also make hotblocks produce a similar crash (but make sure to add a
g_hash_table_destroy(hotblocks)
at the end of plugin_exit.)


>
> >
> >  From what I remember the race is
> >  in between preexit_cleanup and the eventual _exit/exit_group which nix=
es
> >  all other child threads. Maybe we should be triggering a more graceful
> >  unload here?
> >
> > I think so. This remedies the bug for this particular plugin and I thin=
k
> there
> > would be a better solution of course. However, I just can't ever get
> plugin_exit
> > callback to be called more than once so I think that's probably not the
> problem?
> >
> > The problem is that we *use* the data in translation/mem_access/exec
> callbacks
> > after a plugin_exit call is already called (this can be easily verified
> by having a
> > boolean set to true once plugin_exit is called and then g_assert this
> boolean is
> > false in the callbacks)
>
> We have mechanisms for safely unloading plugins during running so I
> think we should be able to do something cleanly here. I'll cook up an
> RFC.
>

I'll be waiting for it. Note that as I think I mentioned in the cover
letter, it's that plugin_uninstall
is probably problematic since it unregisters callbacks but already-fired
callbacks will continue executing.
So calling plugin_uninstall at the end of plugin_exit does not relieve the
bug...


>
> >
> >  > This is mitigated in this commit by synchronizing the call to
> >  > `plugin_exit` through locking to ensure execlusive access to data
> >  > structures, and NULL-ifying those data structures so that subsequent
> >  > callbacks can check whether the data strucutres are freed, and if so=
,
> >  > immediately exit.
> >  >
> >  > It's okay to immediately exit and don't account for those callbacks
> >  > since they won't be accounted for anyway since `plugin_exit` is
> already
> >  > called once and reported the statistics.
> >  >
> >  > Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> >  > ---
> >  >  contrib/plugins/cache.c | 31 ++++++++++++++++++++++++++++++-
> >  >  1 file changed, 30 insertions(+), 1 deletion(-)
> >  >
> >  > diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
> >  > index 695fb969dc..a452aba01c 100644
> >  > --- a/contrib/plugins/cache.c
> >  > +++ b/contrib/plugins/cache.c
> >  > @@ -363,6 +363,11 @@ static void vcpu_mem_access(unsigned int
> vcpu_index, qemu_plugin_meminfo_t info,
> >  >      effective_addr =3D hwaddr ? qemu_plugin_hwaddr_phys_addr(hwaddr=
) :
> vaddr;
> >  >
> >  >      g_mutex_lock(&mtx);
> >  > +    if (dcache =3D=3D NULL) {
> >  > +        g_mutex_unlock(&mtx);
> >  > +        return;
> >  > +    }
> >  > +
> >  >      if (!access_cache(dcache, effective_addr)) {
> >  >          insn =3D (InsnData *) userdata;
> >  >          insn->dmisses++;
> >  > @@ -380,6 +385,11 @@ static void vcpu_insn_exec(unsigned int
> vcpu_index, void *userdata)
> >  >      g_mutex_lock(&mtx);
> >  >      insn_addr =3D ((InsnData *) userdata)->addr;
> >  >
> >  > +    if (icache =3D=3D NULL) {
> >  > +        g_mutex_unlock(&mtx);
> >  > +        return;
> >  > +    }
> >  > +
> >  >      if (!access_cache(icache, insn_addr)) {
> >  >          insn =3D (InsnData *) userdata;
> >  >          insn->imisses++;
> >  > @@ -406,12 +416,24 @@ static void vcpu_tb_trans(qemu_plugin_id_t id,
> struct qemu_plugin_tb *tb)
> >  >              effective_addr =3D (uint64_t) qemu_plugin_insn_vaddr(in=
sn);
> >  >          }
> >  >
> >  > +        g_mutex_lock(&mtx);
> >  > +
> >  > +        /*
> >  > +         * is the plugin_exit callback called? If so, any further
> callback
> >  > +         * registration is useless as it won't get accounted for
> after calling
> >  > +         * plugin_exit once already, and also will use miss_ht afte=
r
> it's freed
> >  > +         */
> >  > +        if (miss_ht =3D=3D NULL) {
> >  > +            g_mutex_unlock(&mtx);
> >  > +            return;
> >  > +        }
> >  > +
> >  >          /*
> >  >           * Instructions might get translated multiple times, we do
> not create
> >  >           * new entries for those instructions. Instead, we fetch th=
e
> same
> >  >           * entry from the hash table and register it for the
> callback again.
> >  >           */
> >  > -        g_mutex_lock(&mtx);
> >  > +
> >  >          data =3D g_hash_table_lookup(miss_ht,
> GUINT_TO_POINTER(effective_addr));
> >  >          if (data =3D=3D NULL) {
> >  >              data =3D g_new0(InsnData, 1);
> >  > @@ -527,13 +549,20 @@ static void log_top_insns()
> >  >
> >  >  static void plugin_exit(qemu_plugin_id_t id, void *p)
> >  >  {
> >  > +    g_mutex_lock(&mtx);
> >  >      log_stats();
> >  >      log_top_insns();
> >  >
> >  >      cache_free(dcache);
> >  > +    dcache =3D NULL;
> >  > +
> >  >      cache_free(icache);
> >  > +    icache =3D NULL;
> >  >
> >  >      g_hash_table_destroy(miss_ht);
> >  > +    miss_ht =3D NULL;
> >  > +
> >  > +    g_mutex_unlock(&mtx);
> >  >  }
> >  >
> >  >  static void policy_init()
> >
> >  --
> >  Alex Benn=C3=A9e
>
>
> --
> Alex Benn=C3=A9e
>

--00000000000084f41505c7783e23
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 19, 2021 at 1:08 PM Alex =
Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br>
Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail.com" target=3D"_bla=
nk">ma.mandourr@gmail.com</a>&gt; writes:<br>
<br>
&gt; On Mon, Jul 19, 2021 at 11:48 AM Alex Benn=C3=A9e &lt;<a href=3D"mailt=
o:alex.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt; =
wrote:<br>
&gt;<br>
&gt;=C2=A0 Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail.com" tar=
get=3D"_blank">ma.mandourr@gmail.com</a>&gt; writes:<br>
&gt;<br>
&gt;=C2=A0 &gt; Since callbacks may be interleaved because of multithreaded=
 execution,<br>
&gt;=C2=A0 &gt; we should not make assumptions about `plugin_exit` either. =
The problem<br>
&gt;=C2=A0 &gt; with `plugin_exit` is that it frees shared data structures =
(caches and<br>
&gt;=C2=A0 &gt; `miss_ht` hash table). It should not be assumed that callba=
cks will not<br>
&gt;=C2=A0 &gt; be called after it and hence use already-freed data structu=
res.<br>
&gt;<br>
&gt;=C2=A0 What was your test case for this because I wonder if it would be=
 worth<br>
&gt;=C2=A0 coming up with one for check-tcg? <br>
&gt;<br>
&gt; I think just any ad-hoc multithreaded execution will evoke the race pr=
etty much <br>
&gt; consistently.<br>
<br>
I haven&#39;t managed to trigger it with testthread but of course my<br>
libcache is trying to to defend against it.<br></blockquote><div><br></div>=
<div><a href=3D"https://pastebin.com/X4Xazemh">https://pastebin.com/X4Xazem=
h</a><br></div><div>That&#39;s a minimal program that reproduces the bug co=
nsistently for me (to my observation, a simple=C2=A0</div><div>program that=
 creates a bunch of threads that immediately exit does not produce the bug =
as frequently)</div><div><br></div><div>You can also make hotblocks=C2=A0pr=
oduce a similar crash (but make sure to add a g_hash_table_destroy(hotblock=
s)</div><div>at the end of plugin_exit.)</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 From what I remember the race is<br>
&gt;=C2=A0 in between preexit_cleanup and the eventual _exit/exit_group whi=
ch nixes<br>
&gt;=C2=A0 all other child threads. Maybe we should be triggering a more gr=
aceful<br>
&gt;=C2=A0 unload here?<br>
&gt;<br>
&gt; I think so. This remedies the bug for this particular plugin and I thi=
nk there<br>
&gt; would be a better solution of course. However, I just can&#39;t ever g=
et plugin_exit<br>
&gt; callback to be called more than once so I think that&#39;s probably no=
t the problem?<br>
&gt;<br>
&gt; The problem is that we *use* the data in translation/mem_access/exec c=
allbacks<br>
&gt; after a plugin_exit call is already called (this can be easily verifie=
d by having a <br>
&gt; boolean set to true once plugin_exit is called and then g_assert this =
boolean is <br>
&gt; false in the callbacks)<br>
<br>
We have mechanisms for safely unloading plugins during running so I<br>
think we should be able to do something cleanly here. I&#39;ll cook up an<b=
r>
RFC.<br></blockquote><div><br></div><div>I&#39;ll be waiting for it. Note t=
hat as I think I mentioned in the cover letter, it&#39;s that plugin_uninst=
all</div><div>is probably problematic since it unregisters callbacks but al=
ready-fired callbacks will continue executing.</div><div>So calling plugin_=
uninstall at the end of plugin_exit does not relieve the bug...</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt;=C2=A0 &gt; This is mitigated in this commit by synchronizing the call =
to<br>
&gt;=C2=A0 &gt; `plugin_exit` through locking to ensure execlusive access t=
o data<br>
&gt;=C2=A0 &gt; structures, and NULL-ifying those data structures so that s=
ubsequent<br>
&gt;=C2=A0 &gt; callbacks can check whether the data strucutres are freed, =
and if so,<br>
&gt;=C2=A0 &gt; immediately exit.<br>
&gt;=C2=A0 &gt;<br>
&gt;=C2=A0 &gt; It&#39;s okay to immediately exit and don&#39;t account for=
 those callbacks<br>
&gt;=C2=A0 &gt; since they won&#39;t be accounted for anyway since `plugin_=
exit` is already<br>
&gt;=C2=A0 &gt; called once and reported the statistics.<br>
&gt;=C2=A0 &gt;<br>
&gt;=C2=A0 &gt; Signed-off-by: Mahmoud Mandour &lt;<a href=3D"mailto:ma.man=
dourr@gmail.com" target=3D"_blank">ma.mandourr@gmail.com</a>&gt;<br>
&gt;=C2=A0 &gt; ---<br>
&gt;=C2=A0 &gt;=C2=A0 contrib/plugins/cache.c | 31 ++++++++++++++++++++++++=
++++++-<br>
&gt;=C2=A0 &gt;=C2=A0 1 file changed, 30 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 &gt;<br>
&gt;=C2=A0 &gt; diff --git a/contrib/plugins/cache.c b/contrib/plugins/cach=
e.c<br>
&gt;=C2=A0 &gt; index 695fb969dc..a452aba01c 100644<br>
&gt;=C2=A0 &gt; --- a/contrib/plugins/cache.c<br>
&gt;=C2=A0 &gt; +++ b/contrib/plugins/cache.c<br>
&gt;=C2=A0 &gt; @@ -363,6 +363,11 @@ static void vcpu_mem_access(unsigned i=
nt vcpu_index, qemu_plugin_meminfo_t info,<br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 effective_addr =3D hwaddr ? qemu_plugin=
_hwaddr_phys_addr(hwaddr) : vaddr;<br>
&gt;=C2=A0 &gt;=C2=A0 <br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 g_mutex_lock(&amp;mtx);<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 if (dcache =3D=3D NULL) {<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_mutex_unlock(&amp;mtx);<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 &gt; +<br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 if (!access_cache(dcache, effective_add=
r)) {<br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 insn =3D (InsnData *) use=
rdata;<br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 insn-&gt;dmisses++;<br>
&gt;=C2=A0 &gt; @@ -380,6 +385,11 @@ static void vcpu_insn_exec(unsigned in=
t vcpu_index, void *userdata)<br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 g_mutex_lock(&amp;mtx);<br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 insn_addr =3D ((InsnData *) userdata)-&=
gt;addr;<br>
&gt;=C2=A0 &gt;=C2=A0 <br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 if (icache =3D=3D NULL) {<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_mutex_unlock(&amp;mtx);<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 &gt; +<br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 if (!access_cache(icache, insn_addr)) {=
<br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 insn =3D (InsnData *) use=
rdata;<br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 insn-&gt;imisses++;<br>
&gt;=C2=A0 &gt; @@ -406,12 +416,24 @@ static void vcpu_tb_trans(qemu_plugin=
_id_t id, struct qemu_plugin_tb *tb)<br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 effective_a=
ddr =3D (uint64_t) qemu_plugin_insn_vaddr(insn);<br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 &gt;=C2=A0 <br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_mutex_lock(&amp;mtx);<br>
&gt;=C2=A0 &gt; +<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* is the plugin_exit cal=
lback called? If so, any further callback<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* registration is useles=
s as it won&#39;t get accounted for after calling<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* plugin_exit once alrea=
dy, and also will use miss_ht after it&#39;s freed<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (miss_ht =3D=3D NULL) {<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_mutex_unlock(&=
amp;mtx);<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 &gt; +<br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Instructions migh=
t get translated multiple times, we do not create<br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* new entries for t=
hose instructions. Instead, we fetch the same<br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* entry from the ha=
sh table and register it for the callback again.<br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;=C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_mutex_lock(&amp;mtx);<br>
&gt;=C2=A0 &gt; +<br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D g_hash_table_loo=
kup(miss_ht, GUINT_TO_POINTER(effective_addr));<br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (data =3D=3D NULL) {<b=
r>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D g_=
new0(InsnData, 1);<br>
&gt;=C2=A0 &gt; @@ -527,13 +549,20 @@ static void log_top_insns()<br>
&gt;=C2=A0 &gt;=C2=A0 <br>
&gt;=C2=A0 &gt;=C2=A0 static void plugin_exit(qemu_plugin_id_t id, void *p)=
<br>
&gt;=C2=A0 &gt;=C2=A0 {<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 g_mutex_lock(&amp;mtx);<br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 log_stats();<br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 log_top_insns();<br>
&gt;=C2=A0 &gt;=C2=A0 <br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 cache_free(dcache);<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 dcache =3D NULL;<br>
&gt;=C2=A0 &gt; +<br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 cache_free(icache);<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 icache =3D NULL;<br>
&gt;=C2=A0 &gt;=C2=A0 <br>
&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 g_hash_table_destroy(miss_ht);<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 miss_ht =3D NULL;<br>
&gt;=C2=A0 &gt; +<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 g_mutex_unlock(&amp;mtx);<br>
&gt;=C2=A0 &gt;=C2=A0 }<br>
&gt;=C2=A0 &gt;=C2=A0 <br>
&gt;=C2=A0 &gt;=C2=A0 static void policy_init()<br>
&gt;<br>
&gt;=C2=A0 -- <br>
&gt;=C2=A0 Alex Benn=C3=A9e<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div></div>

--00000000000084f41505c7783e23--

