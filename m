Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAB93CD520
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 14:52:04 +0200 (CEST)
Received: from localhost ([::1]:35896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Skd-0005V4-7A
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 08:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5Sis-0003zE-F3
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:50:16 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5Siq-0001qI-Fc
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:50:14 -0400
Received: by mail-wr1-x42b.google.com with SMTP id t5so21855201wrw.12
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 05:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Y0I+b79mZrKML07JSWL12flMv0xRB2wIZkqmROFrE8Q=;
 b=QlQ6ZpKCYxfFpzr8WcImqZSLnV9lt8fdjSs0GmJV9WkavhSc64u9gvFE5nHyLQZpOY
 gwytUYUC03M8IbTTxCi9KLTcc0yh6je/bK8FbCZz7F+4rm/1JuxW1eNXVKM+cUhHdV7K
 XYzTl+SDzewVX5B4MAlMniyd21OL3OBOb3BjMDxtTEsh8x4/Ool6YKXrsq+pGrcU9GA3
 3qPj5qgOh/FyUJea64Ydp/N2GwnASzH0yBQluutSkWSPb8EBF2Mv1Sc2ZD6Xq6Rcyytg
 ybC1FFZ0Zj6H099/81uvpH938bvpifgtUDfilWsSzopy88yy2KXpFqHc/mmwcmYBTc7P
 os4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Y0I+b79mZrKML07JSWL12flMv0xRB2wIZkqmROFrE8Q=;
 b=e388kZXPExKZqP/+gPsExZ72ttSwuj/+L/dVi9DZM0gHl13CPormvnkzVekXV6KeTL
 V5RZDqwiOXVZlb+8KpQBiVsZqlHb5vLaogV2Q9AW/Jj7UzcjwJppEtVytf1m5H5UNzUs
 PRVjMtXijJHBOQ18+u7BVdLdU7J35qHW7uZBXkcb5qjRC/XfCdtPIU1RD1k7kBAQtvsn
 E95R+vXYIH6l3HYvd08xdH/Rbg9FSdCK36PQq7Xt2TgUMmsXeuGe4iT+AmQZ+0aJnhVF
 g8a5nU2hULxWlbVyRXzXaE+lqffc7jg3uMH261gwPL/bw6HHjmSQ7mXoErAmsRUkWjIO
 hdkQ==
X-Gm-Message-State: AOAM533pFSWWSsaMrESPyTKpyEzVU3bTOUD0/l9PLH+BgOtPPNICqPbG
 njC3UF39hjB8365oywvrO/h5Cg==
X-Google-Smtp-Source: ABdhPJzNfYhGLhrr9wU4FpUzIP07M1NJQaGUdIsXQ4PUt2SM+t6niDEqxCjp3aofw595ccbJCLNJNA==
X-Received: by 2002:a05:6000:1d1:: with SMTP id
 t17mr28786706wrx.267.1626699011105; 
 Mon, 19 Jul 2021 05:50:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b8sm19987920wmb.20.2021.07.19.05.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 05:50:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8959E1FF7E;
 Mon, 19 Jul 2021 13:50:09 +0100 (BST)
References: <20210714172151.8494-1-ma.mandourr@gmail.com>
 <20210714172151.8494-4-ma.mandourr@gmail.com> <87zguiprbi.fsf@linaro.org>
 <CAD-LL6hk+xWhCwLb0mK0W4ZWP29BKmfnTVJwLe7zA0-g7=ji-w@mail.gmail.com>
 <87tukqpnlt.fsf@linaro.org>
 <CAD-LL6g8edEAjCVd0OZ3LVyEFidqM8p2KP9fikU2fLx2i0H9Kg@mail.gmail.com>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 3/6] plugins/cache: Fixed a use-after-free bug with
 multithreaded usermode
Date: Mon, 19 Jul 2021 13:48:35 +0100
In-reply-to: <CAD-LL6g8edEAjCVd0OZ3LVyEFidqM8p2KP9fikU2fLx2i0H9Kg@mail.gmail.com>
Message-ID: <87o8aypiwu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: "Emilio G.
 Cota" <cota@braap.org>, "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> On Mon, Jul 19, 2021 at 1:08 PM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>
>  Mahmoud Mandour <ma.mandourr@gmail.com> writes:
>
>  > On Mon, Jul 19, 2021 at 11:48 AM Alex Benn=C3=A9e <alex.bennee@linaro.=
org> wrote:
>  >
>  >  Mahmoud Mandour <ma.mandourr@gmail.com> writes:
>  >
>  >  > Since callbacks may be interleaved because of multithreaded executi=
on,
>  >  > we should not make assumptions about `plugin_exit` either. The prob=
lem
>  >  > with `plugin_exit` is that it frees shared data structures (caches =
and
>  >  > `miss_ht` hash table). It should not be assumed that callbacks will=
 not
>  >  > be called after it and hence use already-freed data structures.
>  >
>  >  What was your test case for this because I wonder if it would be worth
>  >  coming up with one for check-tcg?=20
>  >
>  > I think just any ad-hoc multithreaded execution will evoke the race pr=
etty much=20
>  > consistently.
>
>  I haven't managed to trigger it with testthread but of course my
>  libcache is trying to to defend against it.
>
> https://pastebin.com/X4Xazemh
> That's a minimal program that reproduces the bug consistently for me (to =
my observation, a simple=20
> program that creates a bunch of threads that immediately exit does not pr=
oduce the bug as frequently)
>
> You can also make hotblocks produce a similar crash (but make sure to add=
 a g_hash_table_destroy(hotblocks)
> at the end of plugin_exit.)
>

Thanks, I'll give that a try.

>=20=20
>  >=20=20
>  >  From what I remember the race is
>  >  in between preexit_cleanup and the eventual _exit/exit_group which ni=
xes
>  >  all other child threads. Maybe we should be triggering a more graceful
>  >  unload here?
>  >
>  > I think so. This remedies the bug for this particular plugin and I thi=
nk there
>  > would be a better solution of course. However, I just can't ever get p=
lugin_exit
>  > callback to be called more than once so I think that's probably not th=
e problem?
>  >
>  > The problem is that we *use* the data in translation/mem_access/exec c=
allbacks
>  > after a plugin_exit call is already called (this can be easily verifie=
d by having a=20
>  > boolean set to true once plugin_exit is called and then g_assert this =
boolean is=20
>  > false in the callbacks)
>
>  We have mechanisms for safely unloading plugins during running so I
>  think we should be able to do something cleanly here. I'll cook up an
>  RFC.
>
> I'll be waiting for it. Note that as I think I mentioned in the cover let=
ter, it's that plugin_uninstall
> is probably problematic since it unregisters callbacks but already-fired =
callbacks will continue executing.
> So calling plugin_uninstall at the end of plugin_exit does not relieve
> the bug...

That's OK - the plugin_uninstall contract explicitly says that callbacks
may occur until the callback is called.

>=20=20
>=20=20
>  >
>  >  > This is mitigated in this commit by synchronizing the call to
>  >  > `plugin_exit` through locking to ensure execlusive access to data
>  >  > structures, and NULL-ifying those data structures so that subsequent
>  >  > callbacks can check whether the data strucutres are freed, and if s=
o,
>  >  > immediately exit.
>  >  >
>  >  > It's okay to immediately exit and don't account for those callbacks
>  >  > since they won't be accounted for anyway since `plugin_exit` is alr=
eady
>  >  > called once and reported the statistics.
>  >  >
>  >  > Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
>  >  > ---
>  >  >  contrib/plugins/cache.c | 31 ++++++++++++++++++++++++++++++-
>  >  >  1 file changed, 30 insertions(+), 1 deletion(-)
>  >  >
>  >  > diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
>  >  > index 695fb969dc..a452aba01c 100644
>  >  > --- a/contrib/plugins/cache.c
>  >  > +++ b/contrib/plugins/cache.c
>  >  > @@ -363,6 +363,11 @@ static void vcpu_mem_access(unsigned int vcpu_=
index, qemu_plugin_meminfo_t info,
>  >  >      effective_addr =3D hwaddr ? qemu_plugin_hwaddr_phys_addr(hwadd=
r) : vaddr;
>  >  >=20=20
>  >  >      g_mutex_lock(&mtx);
>  >  > +    if (dcache =3D=3D NULL) {
>  >  > +        g_mutex_unlock(&mtx);
>  >  > +        return;
>  >  > +    }
>  >  > +
>  >  >      if (!access_cache(dcache, effective_addr)) {
>  >  >          insn =3D (InsnData *) userdata;
>  >  >          insn->dmisses++;
>  >  > @@ -380,6 +385,11 @@ static void vcpu_insn_exec(unsigned int vcpu_i=
ndex, void *userdata)
>  >  >      g_mutex_lock(&mtx);
>  >  >      insn_addr =3D ((InsnData *) userdata)->addr;
>  >  >=20=20
>  >  > +    if (icache =3D=3D NULL) {
>  >  > +        g_mutex_unlock(&mtx);
>  >  > +        return;
>  >  > +    }
>  >  > +
>  >  >      if (!access_cache(icache, insn_addr)) {
>  >  >          insn =3D (InsnData *) userdata;
>  >  >          insn->imisses++;
>  >  > @@ -406,12 +416,24 @@ static void vcpu_tb_trans(qemu_plugin_id_t id=
, struct qemu_plugin_tb *tb)
>  >  >              effective_addr =3D (uint64_t) qemu_plugin_insn_vaddr(i=
nsn);
>  >  >          }
>  >  >=20=20
>  >  > +        g_mutex_lock(&mtx);
>  >  > +
>  >  > +        /*
>  >  > +         * is the plugin_exit callback called? If so, any further =
callback
>  >  > +         * registration is useless as it won't get accounted for a=
fter calling
>  >  > +         * plugin_exit once already, and also will use miss_ht aft=
er it's freed
>  >  > +         */
>  >  > +        if (miss_ht =3D=3D NULL) {
>  >  > +            g_mutex_unlock(&mtx);
>  >  > +            return;
>  >  > +        }
>  >  > +
>  >  >          /*
>  >  >           * Instructions might get translated multiple times, we do=
 not create
>  >  >           * new entries for those instructions. Instead, we fetch t=
he same
>  >  >           * entry from the hash table and register it for the callb=
ack again.
>  >  >           */
>  >  > -        g_mutex_lock(&mtx);
>  >  > +
>  >  >          data =3D g_hash_table_lookup(miss_ht, GUINT_TO_POINTER(eff=
ective_addr));
>  >  >          if (data =3D=3D NULL) {
>  >  >              data =3D g_new0(InsnData, 1);
>  >  > @@ -527,13 +549,20 @@ static void log_top_insns()
>  >  >=20=20
>  >  >  static void plugin_exit(qemu_plugin_id_t id, void *p)
>  >  >  {
>  >  > +    g_mutex_lock(&mtx);
>  >  >      log_stats();
>  >  >      log_top_insns();
>  >  >=20=20
>  >  >      cache_free(dcache);
>  >  > +    dcache =3D NULL;
>  >  > +
>  >  >      cache_free(icache);
>  >  > +    icache =3D NULL;
>  >  >=20=20
>  >  >      g_hash_table_destroy(miss_ht);
>  >  > +    miss_ht =3D NULL;
>  >  > +
>  >  > +    g_mutex_unlock(&mtx);
>  >  >  }
>  >  >=20=20
>  >  >  static void policy_init()
>  >
>  >  --=20
>  >  Alex Benn=C3=A9e
>
>  --=20
>  Alex Benn=C3=A9e


--=20
Alex Benn=C3=A9e

