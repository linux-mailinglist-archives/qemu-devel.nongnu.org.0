Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3196F30BEAF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:50:36 +0100 (CET)
Received: from localhost ([::1]:37052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6v8d-0000DQ-9S
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:50:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1l6v6N-0007HN-II
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:48:17 -0500
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:38909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1l6v6K-0000lD-VI
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:48:15 -0500
Received: by mail-qk1-x72f.google.com with SMTP id d85so19584677qkg.5
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 04:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C7LXdqeGscCuGOAHmdYr/0eDjyOqhObpIMcDBex14nI=;
 b=JXJq2jcdMorGv0h2hTsRE7N3P6uZoTtUwOdGw/CLUUPoWA+OUXy9QpW+sOALbZMAxQ
 3dy4xImtmS4k65kItzdW1+stL3CYfAvKEizla/knlYJ989j9HHrfFiXRn6I8URwVuHjG
 0B9O7O1Sd7/Tb3B+egGSBubVoBSblXr41Dr0QNfA3aEUmXtUTBdOGIe4i9MEfTvb0Uwb
 E6EtEGaE71eQAnvrmWgkEF/EpKqKAYOb9MIH4wPTv4xK1h8n3K73ATHojTAxJgiX+otr
 GspL+gf2924nn3cUPUOY0gHS4WQOkvD7qa5tZhMlIjQv+aXd45WtOxu3den5cnigfVBj
 sQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C7LXdqeGscCuGOAHmdYr/0eDjyOqhObpIMcDBex14nI=;
 b=HTOJvgTX3Hd+oMcTYzf3OWb+aIel4Ok4V507YfGUpxxIODPrZXZ5id1fM4/3OkKRMO
 sH0P6s4323bMU91UOgGsBy4WMRVC+JLtEFi+5YeznRDUUwo6j9lrbxis4oXdZvDhxzkh
 0H4BXM0nU6oB1iZFqA9bGPRlFV0+BrkhPpxyaSw2p4vNPsTG16RAfCzPEHklkWgkL8VW
 ig/yPjhPylFOSlMx/TkAG4A/eIuev0u4YrNkvy5+vjHMZM5hc4qGYYevmFjknDhgS08i
 l+Fq+qTXFVHCcUHzrornUjy7rEPwwSmy+UqfUQXvI5/Y1DSywhAzlSmWERaa+jbzQUmo
 6jtA==
X-Gm-Message-State: AOAM532e8ppgOyOB0xyiOK9CTEm+5LFBxiWkxYAdRfGIpD0OEpV+tp5R
 xz2HQGtFbVykUVlfcsl4PZ4llnetNaZ2x0Hrcayxog==
X-Google-Smtp-Source: ABdhPJwjJ2muMvXsY74hSeVWvy6kfboTDN6UZKCTFfLaUmgXFdUNSJ+rC8y7RNcR4J/MKIU6jb8AtP8yqx8TRnZgaWM=
X-Received: by 2002:a37:ad1:: with SMTP id 200mr21398098qkk.195.1612270089160; 
 Tue, 02 Feb 2021 04:48:09 -0800 (PST)
MIME-Version: 1.0
References: <B8D9E184-5C5A-4A15-BF48-927F0138F0DE@gmail.com>
 <CAOZ2QJOq6GNXMWkk_1oxqtT_GYW8FmXT8jYGHzyROXC_yoWfxA@mail.gmail.com>
 <CAFEAcA_m3vbjh42_tox4h_9wS_BSEad=nJrc=v_it01FxVV=EQ@mail.gmail.com>
 <E9865C2F-68A9-404F-896C-09C2A78C51A3@gmail.com>
 <20210202102636.3b1474e5@bahia.lan>
In-Reply-To: <20210202102636.3b1474e5@bahia.lan>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 2 Feb 2021 05:47:57 -0700
Message-ID: <CANCZdfrJmpW5O-qFycuY5h-1YEJw7utp41j=R4PGsUd1KTK0uA@mail.gmail.com>
Subject: Re: Makefile has local changes that will be overwritten
To: Greg Kurz <groug@kaod.org>
Content-Type: multipart/alternative; boundary="000000000000f25f2f05ba59e175"
Received-SPF: none client-ip=2607:f8b0:4864:20::72f;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Dan Streetman <ddstreet@canonical.com>,
 Programmingkid <programmingkidx@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f25f2f05ba59e175
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 2, 2021, 2:27 AM Greg Kurz <groug@kaod.org> wrote:

> On Mon, 1 Feb 2021 10:30:25 -0500
> Programmingkid <programmingkidx@gmail.com> wrote:
>
> >
> >
> > > On Feb 1, 2021, at 9:52 AM, Peter Maydell <peter.maydell@linaro.org>
> wrote:
> > >
> > > On Mon, 1 Feb 2021 at 14:49, Dan Streetman <ddstreet@canonical.com>
> wrote:
> > >>
> > >> On Mon, Feb 1, 2021 at 9:23 AM Programmingkid <
> programmingkidx@gmail.com> wrote:
> > >>>
> > >>> When trying to build QEMU I see this error:
> > >>>
> > >>> error: Your local changes to the following files would be
> overwritten by checkout:
> > >>>        Makefile
> > >>> Please commit your changes or stash them before you switch branches.
> > >>> Aborting
> > >>>
> > >>> What I do to see this error:
> > >>> ./configure --target-list=i386-softmmu
> > >>
> > >> Sorry, I don't see that error, what commit are you building from?
> > >
> > > ...and what does git think the local changes to Makefile are ?
> >
> > This is the output of 'git status':
> > On branch master
> > Your branch is up to date with 'origin/master'.
> >
> > Changes not staged for commit:
> >   (use "git add <file>..." to update what will be committed)
> >   (use "git restore <file>..." to discard changes in working directory)
> >   (commit or discard the untracked or modified content in submodules)
> >       modified:   dtc (new commits, modified content)
> >
> > Untracked files:
> >   (use "git add <file>..." to include in what will be committed)
> >       pixman/
> >
> > no changes added to commit (use "git add" and/or "git commit -a")
> >
> >
> > This is the output of 'git diff master':
> > diff --git a/dtc b/dtc
> > index 85e5d83984..88f18909db 160000
> > --- a/dtc
> > +++ b/dtc
> > @@ -1 +1 @@
> > -Subproject commit 85e5d839847af54efab170f2b1331b2a6421e647
> > +Subproject commit 88f18909db731a627456f26d779445f84e449536-dirty
> >
>
> This looks like you have a change in the dtc submodule based on
> an old commit:
>

I see this all the time while bisecting and moving the version around a
lot. It seems a git submodule bug to me and unrelated to Makefile with
local changes. ..

Warner

commit 88f18909db731a627456f26d779445f84e449536 (tag: v1.4.7)
> Author: David Gibson <david@gibson.dropbear.id.au>
> Date:   Mon Jul 23 13:00:50 2018 +1000
>
>     dtc: Bump version to v1.4.7
>
>     We've accumulated a bunch of bugfixes, including considerable
> improvements
>     to libfdt's memory safety, so get ready for another release.
>
>     Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>
> while current head of dtc is:
>
> commit 85e5d839847af54efab170f2b1331b2a6421e647 (HEAD)
> Author: Claudio Fontana <cfontana@suse.de>
> Date:   Tue May 12 12:33:15 2020 +0200
>
>     Makefile: when building libfdt only, do not add unneeded deps
>
>     implemented originally for the QEMU consumer of libfdt.
>
>     Signed-off-by: Claudio Fontana <cfontana@suse.de>
>     Message-Id: <20200512103315.1926-1-cfontana@suse.de>
>     Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>
> > I have tried 'git clean -d -f', 'git reset --hard' and 'git pull'. I am
> now at 74208cd252c5da9d867270a178799abd802b9338 and still seeing the error
> with MakeFile.
> >
>
> Since the change affects the dtc submodule, you should
> 'cd dtc && git diff' to see what these differences are,
> and possibly 'git reset --hard' if you don't want them.
> Then go back to the QEMU source dir and update the dtc
> module with 'git submodule update dtc'.
>
> >
>
>
>

--000000000000f25f2f05ba59e175
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Feb 2, 2021, 2:27 AM Greg Kurz &lt;<a href=3D"=
mailto:groug@kaod.org">groug@kaod.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">On Mon, 1 Feb 2021 10:30:25 -0500<br>
Programmingkid &lt;<a href=3D"mailto:programmingkidx@gmail.com" target=3D"_=
blank" rel=3D"noreferrer">programmingkidx@gmail.com</a>&gt; wrote:<br>
<br>
&gt; <br>
&gt; <br>
&gt; &gt; On Feb 1, 2021, at 9:52 AM, Peter Maydell &lt;<a href=3D"mailto:p=
eter.maydell@linaro.org" target=3D"_blank" rel=3D"noreferrer">peter.maydell=
@linaro.org</a>&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; On Mon, 1 Feb 2021 at 14:49, Dan Streetman &lt;<a href=3D"mailto:=
ddstreet@canonical.com" target=3D"_blank" rel=3D"noreferrer">ddstreet@canon=
ical.com</a>&gt; wrote:<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt; On Mon, Feb 1, 2021 at 9:23 AM Programmingkid &lt;<a href=3D"=
mailto:programmingkidx@gmail.com" target=3D"_blank" rel=3D"noreferrer">prog=
rammingkidx@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt; When trying to build QEMU I see this error:<br>
&gt; &gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt; error: Your local changes to the following files would be=
 overwritten by checkout:<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Makefile<br>
&gt; &gt;&gt;&gt; Please commit your changes or stash them before you switc=
h branches.<br>
&gt; &gt;&gt;&gt; Aborting<br>
&gt; &gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt; What I do to see this error:<br>
&gt; &gt;&gt;&gt; ./configure --target-list=3Di386-softmmu<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt; Sorry, I don&#39;t see that error, what commit are you buildi=
ng from?<br>
&gt; &gt; <br>
&gt; &gt; ...and what does git think the local changes to Makefile are ?<br=
>
&gt; <br>
&gt; This is the output of &#39;git status&#39;:<br>
&gt; On branch master<br>
&gt; Your branch is up to date with &#39;origin/master&#39;.<br>
&gt; <br>
&gt; Changes not staged for commit:<br>
&gt;=C2=A0 =C2=A0(use &quot;git add &lt;file&gt;...&quot; to update what wi=
ll be committed)<br>
&gt;=C2=A0 =C2=A0(use &quot;git restore &lt;file&gt;...&quot; to discard ch=
anges in working directory)<br>
&gt;=C2=A0 =C2=A0(commit or discard the untracked or modified content in su=
bmodules)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0modified:=C2=A0 =C2=A0dtc (new commits, modi=
fied content)<br>
&gt; <br>
&gt; Untracked files:<br>
&gt;=C2=A0 =C2=A0(use &quot;git add &lt;file&gt;...&quot; to include in wha=
t will be committed)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pixman/<br>
&gt; <br>
&gt; no changes added to commit (use &quot;git add&quot; and/or &quot;git c=
ommit -a&quot;)<br>
&gt; <br>
&gt; <br>
&gt; This is the output of &#39;git diff master&#39;:<br>
&gt; diff --git a/dtc b/dtc<br>
&gt; index 85e5d83984..88f18909db 160000<br>
&gt; --- a/dtc<br>
&gt; +++ b/dtc<br>
&gt; @@ -1 +1 @@<br>
&gt; -Subproject commit 85e5d839847af54efab170f2b1331b2a6421e647<br>
&gt; +Subproject commit 88f18909db731a627456f26d779445f84e449536-dirty<br>
&gt; <br>
<br>
This looks like you have a change in the dtc submodule based on<br>
an old commit:<br></blockquote></div></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">I see this all the time while bisecting and moving the versio=
n around a lot. It seems a git submodule bug to me and unrelated to Makefil=
e with local changes. ..</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Warner=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
commit 88f18909db731a627456f26d779445f84e449536 (tag: v1.4.7)<br>
Author: David Gibson &lt;<a href=3D"mailto:david@gibson.dropbear.id.au" tar=
get=3D"_blank" rel=3D"noreferrer">david@gibson.dropbear.id.au</a>&gt;<br>
Date:=C2=A0 =C2=A0Mon Jul 23 13:00:50 2018 +1000<br>
<br>
=C2=A0 =C2=A0 dtc: Bump version to v1.4.7<br>
<br>
=C2=A0 =C2=A0 We&#39;ve accumulated a bunch of bugfixes, including consider=
able improvements<br>
=C2=A0 =C2=A0 to libfdt&#39;s memory safety, so get ready for another relea=
se.<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: David Gibson &lt;<a href=3D"mailto:david@gibso=
n.dropbear.id.au" target=3D"_blank" rel=3D"noreferrer">david@gibson.dropbea=
r.id.au</a>&gt;<br>
<br>
while current head of dtc is:<br>
<br>
commit 85e5d839847af54efab170f2b1331b2a6421e647 (HEAD)<br>
Author: Claudio Fontana &lt;<a href=3D"mailto:cfontana@suse.de" target=3D"_=
blank" rel=3D"noreferrer">cfontana@suse.de</a>&gt;<br>
Date:=C2=A0 =C2=A0Tue May 12 12:33:15 2020 +0200<br>
<br>
=C2=A0 =C2=A0 Makefile: when building libfdt only, do not add unneeded deps=
<br>
<br>
=C2=A0 =C2=A0 implemented originally for the QEMU consumer of libfdt.<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Claudio Fontana &lt;<a href=3D"mailto:cfontana=
@suse.de" target=3D"_blank" rel=3D"noreferrer">cfontana@suse.de</a>&gt;<br>
=C2=A0 =C2=A0 Message-Id: &lt;<a href=3D"mailto:20200512103315.1926-1-cfont=
ana@suse.de" target=3D"_blank" rel=3D"noreferrer">20200512103315.1926-1-cfo=
ntana@suse.de</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: David Gibson &lt;<a href=3D"mailto:david@gibso=
n.dropbear.id.au" target=3D"_blank" rel=3D"noreferrer">david@gibson.dropbea=
r.id.au</a>&gt;<br>
<br>
&gt; I have tried &#39;git clean -d -f&#39;, &#39;git reset --hard&#39; and=
 &#39;git pull&#39;. I am now at 74208cd252c5da9d867270a178799abd802b9338 a=
nd still seeing the error with MakeFile.<br>
&gt; <br>
<br>
Since the change affects the dtc submodule, you should<br>
&#39;cd dtc &amp;&amp; git diff&#39; to see what these differences are,<br>
and possibly &#39;git reset --hard&#39; if you don&#39;t want them.<br>
Then go back to the QEMU source dir and update the dtc<br>
module with &#39;git submodule update dtc&#39;.<br>
<br>
&gt; <br>
<br>
<br>
</blockquote></div></div></div>

--000000000000f25f2f05ba59e175--

