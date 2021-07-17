Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A8A3CC3AB
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 15:50:42 +0200 (CEST)
Received: from localhost ([::1]:60474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4kiG-0003I5-K5
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 09:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4kgk-0002dz-2M
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 09:49:06 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:37767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4kgh-0005Yl-8R
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 09:49:05 -0400
Received: by mail-io1-xd2a.google.com with SMTP id r18so2968511iot.4
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 06:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/TFF1K7UZ66cgvrnNsgxMNzCa4sMpvivx1JeJmCEX/A=;
 b=j6D2XrMVT8/n55gvP9uoSxzlU8mD21I4ga9tlbquLXhbIftSdCs37PQARf8Wa0R9OW
 wGkzPX8Lxp72VR88LOC/STqQ99sUks2pTDylF1dDVvUPyNFOjjvqmSsEQdB6J1vvK9zQ
 qZR1S2qhngLTCYykzeSplPDnDEnckHX8XoOH67St3wYdW5K87176k/kBiYFxcCXLetMA
 x7LRiUvpfiSoQDzmt6kGuAZggGyaykqP8wQ7kaH5Bqx8jdOORYPAzhR/G9s7+GxQhfaL
 iiSF1SxARdVx3HsdB28IukrExXxEDnzvGPdr1Zv01r2+FAxuMpTt+eHVoM8JPniLmUBe
 a0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/TFF1K7UZ66cgvrnNsgxMNzCa4sMpvivx1JeJmCEX/A=;
 b=i/Dig61sU8SaPWOLNgDMl0iIyHTbAN8TC06RU50R9eRpMcg7Do4Cqz7RM7sHVl4Nxp
 v3ezw2mq61OrWngQq6laB1cHHlU62d+IlRvz0z6E70Zm+beNHRwx63LH78YiVKmhpEsl
 FLmdt72ZGQPok5o0Hb8dD8DnqJaO6a9MefyfjXuXBNMzbtEwpAiCs4ISnghjwf/Vbf/L
 me7sdUX0V3v58kt0ynXydjfMHKeD/FqoTvwyr31IUYVJp1CAHS4cht8S6wxZ9Y+KUNKC
 Y4BEa0EW7R1oEmMxw2K91rHf1TJABMgO1Onq8vBm3hRnFVM7oWzZ7Uo776RoTJV4wQM9
 Z/sA==
X-Gm-Message-State: AOAM531gJK866MYidwkB7/WzG/Y0x2hyS9aNvClugZyJcl3zVyNCRtrU
 zLMfVZARhdoRVcJsrpklyy8M0i9Wi+fIY21zMlI=
X-Google-Smtp-Source: ABdhPJzUXVnLgUBqPGaIvVftekk9GBHOOP5By6Jf+MfTaI+M/AKWrHgrONl1KmIbyrczhGa5+CVxi9k3fnP7xsCdaf4=
X-Received: by 2002:a6b:6205:: with SMTP id f5mr11245176iog.60.1626529742194; 
 Sat, 17 Jul 2021 06:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210717100920.240793-1-ma.mandourr@gmail.com>
 <87o8b12hkc.fsf@linaro.org>
In-Reply-To: <87o8b12hkc.fsf@linaro.org>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Sat, 17 Jul 2021 15:48:50 +0200
Message-ID: <CAD-LL6hBEFoBNAbqRCqtXkjVrnW85VtryQkib_-jOix5z-6A2Q@mail.gmail.com>
Subject: Re: [PATCH 00/13] new plugin argument passing scheme
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000800b8505c751f7fd"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=ma.mandourr@gmail.com; helo=mail-io1-xd2a.google.com
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

--000000000000800b8505c751f7fd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 17, 2021, 15:31 Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote=
:

>
> Mahmoud Mandour <ma.mandourr@gmail.com> writes:
>
> > Hello,
> >
> > This series removes passing arguments to plugins through "arg=3D" since
> > it's redundant and reduces readability especially when the argument
> > itself is composed of a name and a value.
>
> When you re-roll a series it's useful to add a version tag. You can use
> --subject-prefix in your git format-patch command to do this.
>
> I'll have a look at this on Monday.
>

Thank you so much for the notice. I usually do it but I missed it this
time, hopefully won't happen again.


> >
> > Also, passing arguments through "arg=3D" still works but is marked as
> > deprecated and will produce a deprecation warning.
> >
> > Right now, the code for parsing the argument before passing it to the
> > plugin is unfortunately not so clean but that's mainly because "arg=3D"=
 is
> > still supported.
> >
> > At first, considering boolean parameters, those were not special to
> > plugins and QEMU did not complain about passing them in the form
> > "arg=3Dbool_arg" even though that's considered a short-form boolean, wh=
ich
> > is deprecated. As "arg" is removed, a deprecation warning is issued.
> >
> > This is mitigated by making plugins aware of boolean arguments and
> > parses them through a newly exposed API, namely the `qapi_bool_parse`
> > function through a plugin API function. Now plugins expect boolean
> > parameters to be passed in the form that other parts of QEMU expect,
> > i.e. "bool_arg=3D[on|true|yes|off|false|no]".
> >
> > Since we're still supporting "arg=3Darg_name", there are some assumptio=
ns
> > that I made that I think are suitable:
> >
> >     1. "arg=3Darg_name" will be passed to the plugin as "arg_name=3Don"=
.
> >     2. "arg=3Don" and "arg" will not be assumed to be the old way of
> >         passing args. Instead, it will assume that the argument name is
> >         "arg" and it's a boolean parameter. (will be passed to plugin
> >         as "arg=3Don")
> >
> > The docs are updated accordingly and a deprecation notice is put in the
> > deprecated.rst file.
> >
> > v1 -> v2:
> >     1. Added patches that handle test plugins as well
> >     2. Handled unsupported arguements in howvec
> >
> > Based-on: <20210714172151.8494-1-ma.mandourr@gmail.com>
> >
> > However, the dependency is so light and it should only be in the patch
> >
> >     docs/tcg-plugins: new passing parameters scheme for cache docs
> >
> > where it depends on
> >
> >     docs/devel/tcg-plugins: added cores arg to cache plugin
> >
> > in the aforementioned series (conflict lies in the argument "cores=3DN"
> only.)
> >
> > Mahmoud Mandour (13):
> >   plugins: allow plugin arguments to be passed directly
> >   plugins/api: added a boolean parsing plugin api
> >   plugins/hotpages: introduce sortby arg and parsed bool args correctly
> >   plugins/hotblocks: Added correct boolean argument parsing
> >   plugins/lockstep: make socket path not positional & parse bool arg
> >   plugins/hwprofile: adapt to the new plugin arguments scheme
> >   plugins/howvec: Adapting to the new argument passing scheme.
> >   docs/tcg-plugins: new passing parameters scheme for cache docs
> >   tests/plugins/bb: adapt to the new arg passing scheme
> >   tests/plugins/insn: made arg inline not positional and parse it as
> >     bool
> >   tests/plugins/mem: introduce "track" arg and make args not positional
> >   tests/plugins/syscalls: adhere to new arg-passing scheme
> >   docs/deprecated: deprecate passing plugin args through `arg=3D`
> >
> >  contrib/plugins/hotblocks.c | 14 +++++++++--
> >  contrib/plugins/hotpages.c  | 30 +++++++++++++++--------
> >  contrib/plugins/howvec.c    | 27 ++++++++++++++-------
> >  contrib/plugins/hwprofile.c | 39 ++++++++++++++++++++----------
> >  contrib/plugins/lockstep.c  | 31 +++++++++++++++++-------
> >  docs/devel/tcg-plugins.rst  | 38 +++++++++++++++---------------
> >  docs/system/deprecated.rst  |  6 +++++
> >  include/qemu/qemu-plugin.h  | 13 ++++++++++
> >  linux-user/main.c           |  2 +-
> >  plugins/api.c               |  5 ++++
> >  plugins/loader.c            | 24 +++++++++++++++----
> >  qemu-options.hx             |  9 ++++---
> >  tests/plugin/bb.c           | 15 ++++++++----
> >  tests/plugin/insn.c         | 14 +++++++++--
> >  tests/plugin/mem.c          | 47 +++++++++++++++++++++++--------------
> >  tests/plugin/syscall.c      | 23 ++++++++++++------
> >  16 files changed, 236 insertions(+), 101 deletions(-)
>
>
> --
> Alex Benn=C3=A9e

--000000000000800b8505c751f7fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
On Sat, Jul 17, 2021, 15:31 Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.ben=
nee@linaro.org" target=3D"_blank" rel=3D"noreferrer">alex.bennee@linaro.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail.com" rel=3D"norefer=
rer noreferrer" target=3D"_blank">ma.mandourr@gmail.com</a>&gt; writes:<br>
<br>
&gt; Hello,<br>
&gt;<br>
&gt; This series removes passing arguments to plugins through &quot;arg=3D&=
quot; since<br>
&gt; it&#39;s redundant and reduces readability especially when the argumen=
t<br>
&gt; itself is composed of a name and a value.<br>
<br>
When you re-roll a series it&#39;s useful to add a version tag. You can use=
<br>
--subject-prefix in your git format-patch command to do this.<br>
<br>
I&#39;ll have a look at this on Monday.<br></blockquote></div></div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Thank you so much for the notice. I =
usually do it but I missed it this time, hopefully won&#39;t happen again.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
<br>
&gt;<br>
&gt; Also, passing arguments through &quot;arg=3D&quot; still works but is =
marked as<br>
&gt; deprecated and will produce a deprecation warning.<br>
&gt;<br>
&gt; Right now, the code for parsing the argument before passing it to the<=
br>
&gt; plugin is unfortunately not so clean but that&#39;s mainly because &qu=
ot;arg=3D&quot; is<br>
&gt; still supported.<br>
&gt;<br>
&gt; At first, considering boolean parameters, those were not special to<br=
>
&gt; plugins and QEMU did not complain about passing them in the form<br>
&gt; &quot;arg=3Dbool_arg&quot; even though that&#39;s considered a short-f=
orm boolean, which<br>
&gt; is deprecated. As &quot;arg&quot; is removed, a deprecation warning is=
 issued.<br>
&gt;<br>
&gt; This is mitigated by making plugins aware of boolean arguments and<br>
&gt; parses them through a newly exposed API, namely the `qapi_bool_parse`<=
br>
&gt; function through a plugin API function. Now plugins expect boolean<br>
&gt; parameters to be passed in the form that other parts of QEMU expect,<b=
r>
&gt; i.e. &quot;bool_arg=3D[on|true|yes|off|false|no]&quot;.<br>
&gt;<br>
&gt; Since we&#39;re still supporting &quot;arg=3Darg_name&quot;, there are=
 some assumptions<br>
&gt; that I made that I think are suitable:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A01. &quot;arg=3Darg_name&quot; will be passed to the=
 plugin as &quot;arg_name=3Don&quot;.<br>
&gt;=C2=A0 =C2=A0 =C2=A02. &quot;arg=3Don&quot; and &quot;arg&quot; will no=
t be assumed to be the old way of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0passing args. Instead, it will assume=
 that the argument name is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;arg&quot; and it&#39;s a boolea=
n parameter. (will be passed to plugin<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0as &quot;arg=3Don&quot;)<br>
&gt;<br>
&gt; The docs are updated accordingly and a deprecation notice is put in th=
e<br>
&gt; deprecated.rst file.<br>
&gt;<br>
&gt; v1 -&gt; v2:<br>
&gt;=C2=A0 =C2=A0 =C2=A01. Added patches that handle test plugins as well<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A02. Handled unsupported arguements in howvec<br>
&gt;<br>
&gt; Based-on: &lt;<a href=3D"mailto:20210714172151.8494-1-ma.mandourr@gmai=
l.com" rel=3D"noreferrer noreferrer" target=3D"_blank">20210714172151.8494-=
1-ma.mandourr@gmail.com</a>&gt;<br>
&gt;<br>
&gt; However, the dependency is so light and it should only be in the patch=
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0docs/tcg-plugins: new passing parameters scheme for=
 cache docs<br>
&gt;<br>
&gt; where it depends on<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0docs/devel/tcg-plugins: added cores arg to cache pl=
ugin<br>
&gt;<br>
&gt; in the aforementioned series (conflict lies in the argument &quot;core=
s=3DN&quot; only.)<br>
&gt;<br>
&gt; Mahmoud Mandour (13):<br>
&gt;=C2=A0 =C2=A0plugins: allow plugin arguments to be passed directly<br>
&gt;=C2=A0 =C2=A0plugins/api: added a boolean parsing plugin api<br>
&gt;=C2=A0 =C2=A0plugins/hotpages: introduce sortby arg and parsed bool arg=
s correctly<br>
&gt;=C2=A0 =C2=A0plugins/hotblocks: Added correct boolean argument parsing<=
br>
&gt;=C2=A0 =C2=A0plugins/lockstep: make socket path not positional &amp; pa=
rse bool arg<br>
&gt;=C2=A0 =C2=A0plugins/hwprofile: adapt to the new plugin arguments schem=
e<br>
&gt;=C2=A0 =C2=A0plugins/howvec: Adapting to the new argument passing schem=
e.<br>
&gt;=C2=A0 =C2=A0docs/tcg-plugins: new passing parameters scheme for cache =
docs<br>
&gt;=C2=A0 =C2=A0tests/plugins/bb: adapt to the new arg passing scheme<br>
&gt;=C2=A0 =C2=A0tests/plugins/insn: made arg inline not positional and par=
se it as<br>
&gt;=C2=A0 =C2=A0 =C2=A0bool<br>
&gt;=C2=A0 =C2=A0tests/plugins/mem: introduce &quot;track&quot; arg and mak=
e args not positional<br>
&gt;=C2=A0 =C2=A0tests/plugins/syscalls: adhere to new arg-passing scheme<b=
r>
&gt;=C2=A0 =C2=A0docs/deprecated: deprecate passing plugin args through `ar=
g=3D`<br>
&gt;<br>
&gt;=C2=A0 contrib/plugins/hotblocks.c | 14 +++++++++--<br>
&gt;=C2=A0 contrib/plugins/hotpages.c=C2=A0 | 30 +++++++++++++++--------<br=
>
&gt;=C2=A0 contrib/plugins/howvec.c=C2=A0 =C2=A0 | 27 ++++++++++++++-------=
<br>
&gt;=C2=A0 contrib/plugins/hwprofile.c | 39 ++++++++++++++++++++----------<=
br>
&gt;=C2=A0 contrib/plugins/lockstep.c=C2=A0 | 31 +++++++++++++++++-------<b=
r>
&gt;=C2=A0 docs/devel/tcg-plugins.rst=C2=A0 | 38 +++++++++++++++-----------=
----<br>
&gt;=C2=A0 docs/system/deprecated.rst=C2=A0 |=C2=A0 6 +++++<br>
&gt;=C2=A0 include/qemu/qemu-plugin.h=C2=A0 | 13 ++++++++++<br>
&gt;=C2=A0 linux-user/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 2 +-<br>
&gt;=C2=A0 plugins/api.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 5 ++++<br>
&gt;=C2=A0 plugins/loader.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 24 +=
++++++++++++++----<br>
&gt;=C2=A0 qemu-options.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 9 ++++---<br>
&gt;=C2=A0 tests/plugin/bb.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 15 +=
+++++++----<br>
&gt;=C2=A0 tests/plugin/insn.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 ++++++=
+++--<br>
&gt;=C2=A0 tests/plugin/mem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 47 ++++++=
+++++++++++++++++--------------<br>
&gt;=C2=A0 tests/plugin/syscall.c=C2=A0 =C2=A0 =C2=A0 | 23 ++++++++++++----=
--<br>
&gt;=C2=A0 16 files changed, 236 insertions(+), 101 deletions(-)<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e</blockquote></div></div></div>

--000000000000800b8505c751f7fd--

