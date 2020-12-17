Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDBB2DD4DC
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 17:05:30 +0100 (CET)
Received: from localhost ([::1]:33828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpvmT-0003ql-Kv
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 11:05:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1kpvkg-0003Gl-HK
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 11:03:39 -0500
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:35550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1kpvke-0002T9-0z
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 11:03:38 -0500
Received: by mail-qt1-x82c.google.com with SMTP id b9so20417303qtr.2
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 08:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LiyQ1vbo9GSsJYLifzwqq/4q/IWU2XYZ+c/IMaofCpk=;
 b=vL/t3YLnU354q5fUoYHHuoff4EVDZgRqUCtfTRrgdxl/VcwN8S4PDT5AdoQZJUf+Ix
 uhzGNgnoX/bItYB8xUkcviGsrAyuEQvLqRO9XoLtBcn84wFhF5QfWs+Uie5Hm6S+b+gd
 MzHAS4qlzJ3lzxnnCn3xGeRyktCXKcd3QWC36LoDhUt/S+cHhBCGflTtIJ33Sg941Y33
 E9ZoOU2f8+L6lFbkaQyRS2WYfd0V/UqGOl6A+ulxEr3TxhMwBkuUOmOfOo/oO8GH8tJD
 iR1Tw70tDfCUfVZPMvSJkCLsiid/1SFmPuNZE8hZB0INZoZRgzs98uszg6tf/7V949Uv
 xYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LiyQ1vbo9GSsJYLifzwqq/4q/IWU2XYZ+c/IMaofCpk=;
 b=rCZL988IdaH6ekph1faKQNxMyq232vaY8igO6neCV3TRezt79I8YaQeGw9SsNpn55x
 VITx6AHojnwWMDXT4xu2frrvWPFLYZb1G8dWlNpCqrG9jM+dG0kgu4woGI978roDTw40
 LNxGf6v28M77UN89H4yJz+uE1qKJtd45SVJYBzKu5hVF8uvpPi6fCdTe41zPAMHR/Tmr
 ne965X/l5crpVlwKzgIb53WGetOtV5zEYDecxAjFJ0DGnxaXBXb6bbptqos03/5buOUu
 Rerq2s31pE0kx9w2IDuX+1NWPYi4m2gF545D3IS/mEbn9C3enkKVQaCB6n2Bgqb/37gz
 vTHw==
X-Gm-Message-State: AOAM533Ig94nP1IIy6m7N0iEj7ha0+qVuKyiKZPO8ltMfl2UrmyzaX+1
 is0UUHBedZE2GHgVMC8nZnPrQIR+1sYEK2XBcnuM7g==
X-Google-Smtp-Source: ABdhPJw12vc1+4fP9xb4e9WHeLtpe5czF8YDAvbq7+eU/JXAGEOAD2CTUoPd/vYTjPbQdgt/zFSNwwrhEEl+msINf2U=
X-Received: by 2002:ac8:51d8:: with SMTP id d24mr46784316qtn.73.1608221014092; 
 Thu, 17 Dec 2020 08:03:34 -0800 (PST)
MIME-Version: 1.0
References: <20201216172949.57380-1-thuth@redhat.com>
 <CAFEAcA97zNc3yEfSeBTOuQLFghcJHbh_toJ368HMZzHke+y0SQ@mail.gmail.com>
 <a6271697-c645-968a-7e0f-e1993140633b@redhat.com>
 <20201217140012.GF247354@redhat.com>
In-Reply-To: <20201217140012.GF247354@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 17 Dec 2020 09:03:23 -0700
Message-ID: <CANCZdfpQeiWNt38D60W7un0vkK-GRCU-fShW0amfiwjKs=Wv-Q@mail.gmail.com>
Subject: Re: Status/future of QEMU bsd-user impl ? (Wea Re: [PULL 00/12]
 Compile QEMU with -Wimplicit-fallthrough)
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000044572f05b6ab2276"
Received-SPF: none client-ip=2607:f8b0:4864:20::82c;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x82c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Sean Bruno <sbruno@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Kamil Rytarowski <kamil@netbsd.org>,
 Chen Qun <kuhn.chenqun@huawei.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000044572f05b6ab2276
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 7:02 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Thu, Dec 17, 2020 at 02:03:47PM +0100, Thomas Huth wrote:
> > On 17/12/2020 13.51, Peter Maydell wrote:
> > > On Wed, 16 Dec 2020 at 17:29, Thomas Huth <thuth@redhat.com> wrote:
> > >>
> > >>  Hi!
> > >>
> > >> The following changes since commit
> af3f37319cb1e1ca0c42842ecdbd1bcfc64a4b6f:
> > >>
> > >>   Merge remote-tracking branch
> 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2020-12-15
> 21:24:31 +0000)
> > >>
> > >> are available in the Git repository at:
> > >>
> > >>   https://gitlab.com/huth/qemu.git tags/pull-request-2020-12-16
> > >>
> > >> for you to fetch changes up to
> cbbedfeeb77e25b065f8a2b0c33e81403edaf728:
> > >>
> > >>   configure: Compile with -Wimplicit-fallthrough=3D2 (2020-12-16
> 12:52:20 +0100)
> > >>
> > >> ----------------------------------------------------------------
> > >> * Compile QEMU with -Wimplicit-fallthrough=3D2 to avoid bugs in
> > >>   switch-case statements
> > >> ----------------------------------------------------------------
> > >
> > > Hi; this generates a new warning on the NetBSD build:
> > >
> > > ../src/bsd-user/main.c: In function 'cpu_loop':
> > > ../src/bsd-user/main.c:513:16: warning: this statement may fall
> > > through [-Wimplicit-fallthrough=3D]
> > >              if (bsd_type !=3D target_freebsd)
> > >                 ^
> > > ../src/bsd-user/main.c:515:9: note: here
> > >          case 0x100:
> > >          ^~~~
> >
> > Oh man, can't we just ditch the bsd-user folder now? It's known to be
> broken
> > since many releases, so it's currently only causing additional effort t=
o
> > keep this code compilable (also with regards to the automatic code scan
> tool
> > reports that we've seen during the past months), without real benefit.
> Even
> > if the BSD folks finally upstream their fixed version again, it's more
> > likely that they will start from scratch again instead of fixing the ol=
d
> > folder, I guess?
>
> Yeah, it has been a while since we last discussed this:
>
>   https://lists.gnu.org/archive/html/qemu-devel/2017-01/msg00171.html
>
> Meanwhile their out of free bsd-user impl continues to be developed
> until Dec 2019 at least:
>
>   https://github.com/seanbruno/qemu-bsd-user/commits/bsd-user


You should check out the bsd-user-rebase-3.1 branch. The most recent commit
was this month...


>
> I don't recall what happened after that initial discussion about
> merging the new impl. Did Sean simply not have the time to invest
> in the merge ? I'll CC him here to see what opinion he has on the
> future of bsd-user in QEMU.
>

I've actually taken over for Sean Bruno managing this.

I spent some time and rebased our extensive work up through QEMU 3.1, but I
hit some snags with changes in the underlying QEMU, and we had a few bugs
we had to sort out to make it stable, which took some time. There were
other people doing the sorting out since it affected them, but not me
directly. By the time they were sorted out, 4.1 was being released. Plus I
blew about a week trying to make every single commit compile rather than
just the tip of the branch. I spent quite a bit of time curating the
changes into more logical bits, which also chewed up a few weeks and in the
end was only partially complete. In the end,

The main problem with the merge, which I've done a couple of times, is that
this is so tied to the structure of QEMU, a part that has a high velocity
is that it takes so long to do the merge that by the time you're done,
things have changed again in the code base and you have to do a lot more
work to catch up.

The code that's in the tree is so bit-rotted I'd be surprised if it could
run anything beyond trivial programs.

I'd love to hear from people ways that I can speed things up. I'd love to
get this back into the tree since the version we have in the

Warner

--00000000000044572f05b6ab2276
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 7:02 AM Danie=
l P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Thu, Dec 17, 2020 at 02:03:47PM +0100, Thomas Huth wrote:<br>
&gt; On 17/12/2020 13.51, Peter Maydell wrote:<br>
&gt; &gt; On Wed, 16 Dec 2020 at 17:29, Thomas Huth &lt;<a href=3D"mailto:t=
huth@redhat.com" target=3D"_blank">thuth@redhat.com</a>&gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 Hi!<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The following changes since commit af3f37319cb1e1ca0c42842ecd=
bd1bcfc64a4b6f:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0Merge remote-tracking branch &#39;remotes/bonzini=
-gitlab/tags/for-upstream&#39; into staging (2020-12-15 21:24:31 +0000)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; are available in the Git repository at:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.com/huth/qemu.git" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/huth/qemu.git</a> tags=
/pull-request-2020-12-16<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; for you to fetch changes up to cbbedfeeb77e25b065f8a2b0c33e81=
403edaf728:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0configure: Compile with -Wimplicit-fallthrough=3D=
2 (2020-12-16 12:52:20 +0100)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -------------------------------------------------------------=
---<br>
&gt; &gt;&gt; * Compile QEMU with -Wimplicit-fallthrough=3D2 to avoid bugs =
in<br>
&gt; &gt;&gt;=C2=A0 =C2=A0switch-case statements<br>
&gt; &gt;&gt; -------------------------------------------------------------=
---<br>
&gt; &gt; <br>
&gt; &gt; Hi; this generates a new warning on the NetBSD build:<br>
&gt; &gt; <br>
&gt; &gt; ../src/bsd-user/main.c: In function &#39;cpu_loop&#39;:<br>
&gt; &gt; ../src/bsd-user/main.c:513:16: warning: this statement may fall<b=
r>
&gt; &gt; through [-Wimplicit-fallthrough=3D]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bsd_type !=3D=
 target_freebsd)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br=
>
&gt; &gt; ../src/bsd-user/main.c:515:9: note: here<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x100:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~<br>
&gt; <br>
&gt; Oh man, can&#39;t we just ditch the bsd-user folder now? It&#39;s know=
n to be broken<br>
&gt; since many releases, so it&#39;s currently only causing additional eff=
ort to<br>
&gt; keep this code compilable (also with regards to the automatic code sca=
n tool<br>
&gt; reports that we&#39;ve seen during the past months), without real bene=
fit. Even<br>
&gt; if the BSD folks finally upstream their fixed version again, it&#39;s =
more<br>
&gt; likely that they will start from scratch again instead of fixing the o=
ld<br>
&gt; folder, I guess?<br>
<br>
Yeah, it has been a while since we last discussed this:<br>
<br>
=C2=A0 <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2017-01/msg=
00171.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/arch=
ive/html/qemu-devel/2017-01/msg00171.html</a><br>
<br>
Meanwhile their out of free bsd-user impl continues to be developed<br>
until Dec 2019 at least:<br>
<br>
=C2=A0 <a href=3D"https://github.com/seanbruno/qemu-bsd-user/commits/bsd-us=
er" rel=3D"noreferrer" target=3D"_blank">https://github.com/seanbruno/qemu-=
bsd-user/commits/bsd-user</a></blockquote><div><br></div><div>You should ch=
eck out the bsd-user-rebase-3.1 branch. The most recent commit was this mon=
th...</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><br>
I don&#39;t recall what happened after that initial discussion about<br>
merging the new impl. Did Sean simply not have the time to invest<br>
in the merge ? I&#39;ll CC him here to see what opinion he has on the<br>
future of bsd-user in QEMU.<br></blockquote><div><br></div><div>I&#39;ve ac=
tually taken over for Sean Bruno managing this.</div><div><br></div><div>I =
spent some time and rebased our extensive work up through QEMU 3.1, but I h=
it some snags with changes in the underlying QEMU, and we had a few bugs we=
 had to sort out to make it stable, which took some time. There were other =
people doing the sorting out since it affected them, but not me directly. B=
y the time they were sorted out, 4.1 was being released. Plus I blew about =
a week trying to make every single commit compile rather than just the tip =
of the branch. I spent quite a bit of time curating the changes into more l=
ogical bits, which also chewed up a few weeks and in the end was only parti=
ally complete. In the end,</div><div><br></div><div>The main problem with t=
he merge, which I&#39;ve done a couple of times, is that this is so tied to=
 the structure of QEMU, a part that has a high velocity is that it takes so=
 long to do the merge that by the time you&#39;re done, things have changed=
 again in the code base and you have to do a lot more work to catch up.</di=
v><div><br></div><div>The code that&#39;s in the tree is so bit-rotted I&#3=
9;d be surprised if it could run anything beyond trivial programs.<br></div=
><div><br></div><div>I&#39;d love to hear from people ways that I can speed=
 things up. I&#39;d love to get this back into the tree since the version w=
e have in the=C2=A0</div><div><br></div><div>Warner</div></div></div>

--00000000000044572f05b6ab2276--

