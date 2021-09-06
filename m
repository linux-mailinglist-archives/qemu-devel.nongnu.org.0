Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A32B3401E86
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 18:33:29 +0200 (CEST)
Received: from localhost ([::1]:43604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNHYm-0000Ed-Ne
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 12:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mNHW1-0007Qw-CO
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 12:30:37 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:36441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mNHVw-0000J8-Rm
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 12:30:35 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id f15so14548917ybg.3
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 09:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wzYgU9ufBOMksSfJdlKTPCcNzERjY30LsAkV7vakaV0=;
 b=sAwzOGDVBD/0vu47qdVaJVI8J54eVQy8PYfvWbC0KvOtmUYchd2bDnicN7TYSIRoqW
 RNcJvsVzzuTmKaB6l1ARx3LZ7M3/nSgePNz7ujoIGQ/vwXSnHvk2z46L6CULsatun1Ne
 EMsWUw1LN9ODKmV77nfRwekq8vxtU2V62GoKYdE6V5H2Uvcsbe8UbMES2hS+bGboLXKt
 TFfGTL9GEb2gv1t6BvPT47eC2RIIqbbpA5ZyAwqWq7ejmNi9CWPqAzvTVw8lu9r/u8oM
 IqlS0P2uehkMZK5VNCLcBP8COFSOFx5ftL0iAgqTzomiMvXeZpuun5hZo7WlMAq+wW9v
 ZoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wzYgU9ufBOMksSfJdlKTPCcNzERjY30LsAkV7vakaV0=;
 b=WnOvIb8PRUPMrl5ncVSnQNVH3DjO1eZ2j5FdYU5d+E/E0AoGq1B/omX7AIRAl18VWo
 6n7n3NvQy3zLzRr1E5u23v/toBScJ0FMsO/TWO3LGCyP98splPE7lueyKyR10JxbZKYY
 lDEC4FsV99GGApS6+0RHcg/o08D1PBCR2y397MLJkez/yPBQfM9jnKR6iPS8BrpFgH0J
 lj7Smy/m3+adKi+gT+ypu+GItO4+jbMQuWnsAzGY7kmEyfEC9TGy5oy1fKgAbdHjONu7
 4IcLvjs8tnn+iLk0U80ezjYQ8rMtLO1n57t1mJoB5hreGYiaZy1pP8Lx9BgwgQb2zPwd
 u6BQ==
X-Gm-Message-State: AOAM533CVhRysr0wKzuptppr0McMls6YU3+VCmVvn2EeZ2oVrsQVi2f7
 CccxswGQkypflKxFkAjdSgz506lppakLGdgZs705xg==
X-Google-Smtp-Source: ABdhPJw6ZFfFllEUJMn1V+MBFMp5bZYfPrDO34jcFWNO0S5N2rEudSQAhupEj6IdLnAUwwxIQH8/RWxq8NeSIqdrYVw=
X-Received: by 2002:a25:5e06:: with SMTP id s6mr14916326ybb.142.1630945830222; 
 Mon, 06 Sep 2021 09:30:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ28CFSFEatxgfvUE3gvnFBVX7GrqMwk0+t1foFfNzDu7bwv3A@mail.gmail.com>
 <YTDTc9NC9k7hJjpx@redhat.com> <20210902135509.GU26415@redhat.com>
 <CAJ28CFQgKDjSeF8vDCVefKtQkRPoZ5EbJz=n8CXZZtX1SnAzyQ@mail.gmail.com>
 <CAJ+F1CLJhN6hx7Z6KOYRqEkctf0-xQx4nyvsZMOazgZEbo3d6g@mail.gmail.com>
 <CAJ28CFQKbmbPk-+X882zraNp+ToT+BKJC5hV-c+i1Fe2VzTWaA@mail.gmail.com>
 <20210906155921.GU26415@redhat.com>
In-Reply-To: <20210906155921.GU26415@redhat.com>
From: Konstantin Kostiuk <konstantin@daynix.com>
Date: Mon, 6 Sep 2021 19:30:19 +0300
Message-ID: <CAJ28CFRgVm2wooiyPJqQcy1cj1ZRDqR2xDv=tkuaYUO0bdNgRw@mail.gmail.com>
Subject: Re: Guest Agent issue with 'guest-get-osinfo' command on Windows
To: "Richard W.M. Jones" <rjones@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000dbd00605cb562a36"
Received-SPF: none client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=konstantin@daynix.com; helo=mail-yb1-xb2b.google.com
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Developers <qemu-devel@nongnu.org>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Tomas Golembiovsky <tgolembi@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 Yan Vugenfirer <yan@daynix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000dbd00605cb562a36
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 6, 2021 at 6:59 PM Richard W.M. Jones <rjones@redhat.com> wrote:

> On Mon, Sep 06, 2021 at 06:45:08PM +0300, Konstantin Kostiuk wrote:
> > Hi All,
> >
> > I reviewed glib, libguestfs, and libosinfo tools. All tools read the
> registry
> > to get information about Windows but read different registry values. All
> > information is returned in a localized form.
> > Related key: HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion
> > We can get 'pretty-name' from 'ProductName' value (all tools use it).
> > About 'version' there is three variant:
> > 1. Set 'version' equals to 'kernel-version'. libguestfs and libosinfo
> have this
> > behavior.
> > 2. Read 'version' from 'ReleaseId' value. glib has this behavior. In the
> case
> > of Windows Server 2022, 'ReleaseId' equals 2009.
> > 3. Read 'version' from 'DisplayVersion' value. In the case of Windows
> Server
> > 2022, 'DisplayVersion' equals 21H2.
>
> The important point is, however you get it, return the information as
> a libosinfo short value ("win2k22" in this case).
>

To get this string libguestfs just use a set of conditions. Return
"win2k22" if Windows type is 'server'
and ProductName contains 2022.

But as I know guest agent does not returns short name.


>
> > What do you think about this solution instead of using a conversion
> matrix?
> > What version we should use in this case?
>
> If you need to cover old and new versions of Windows then there's no
> good way.  You just need lots of conditionals and to constantly evolve
> the code as new versions come out.
>
> Rich.
>
> --
> Richard Jones, Virtualization Group, Red Hat
> http://people.redhat.com/~rjones
> Read my programming and virtualization blog: http://rwmj.wordpress.com
> Fedora Windows cross-compiler. Compile Windows programs, test, and
> build Windows installers. Over 100 libraries supported.
> http://fedoraproject.org/wiki/MinGW
>
>

--000000000000dbd00605cb562a36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 6, 2021 at 6:59 PM Richard W.=
M. Jones &lt;<a href=3D"mailto:rjones@redhat.com">rjones@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, =
Sep 06, 2021 at 06:45:08PM +0300, Konstantin Kostiuk wrote:<br>
&gt; Hi All,<br>
&gt; <br>
&gt; I reviewed glib, libguestfs, and libosinfo tools. All tools read the r=
egistry<br>
&gt; to get information about Windows but read different registry values. A=
ll<br>
&gt; information is returned in a localized form.<br>
&gt; Related key: HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion<br>
&gt; We can get &#39;pretty-name&#39; from &#39;ProductName&#39; value (all=
 tools use it).<br>
&gt; About &#39;version&#39; there is three variant:<br>
&gt; 1. Set &#39;version&#39; equals to &#39;kernel-version&#39;. libguestf=
s and libosinfo have this<br>
&gt; behavior.<br>
&gt; 2. Read &#39;version&#39; from &#39;ReleaseId&#39; value. glib has thi=
s behavior. In the case<br>
&gt; of Windows Server 2022, &#39;ReleaseId&#39; equals 2009.<br>
&gt; 3. Read &#39;version&#39; from &#39;DisplayVersion&#39; value. In the =
case of Windows Server<br>
&gt; 2022, &#39;DisplayVersion&#39; equals 21H2.<br>
<br>
The important point is, however you get it, return the information as<br>
a libosinfo short value (&quot;win2k22&quot; in this case).<br></blockquote=
><div><br></div><div>To get this string libguestfs just use a set of condit=
ions. Return &quot;win2k22&quot; if Windows type is &#39;server&#39;</div><=
div>and ProductName contains 2022.<br></div><div><br></div><div>But as I kn=
ow guest agent does not returns short name.<br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; What do you think about this solution instead of using a conversion ma=
trix?<br>
&gt; What version we should use in this case?<br>
<br>
If you need to cover old and new versions of Windows then there&#39;s no<br=
>
good way.=C2=A0 You just need lots of conditionals and to constantly evolve=
<br>
the code as new versions come out.<br>
<br>
Rich.<br>
<br>
-- <br>
Richard Jones, Virtualization Group, Red Hat <a href=3D"http://people.redha=
t.com/~rjones" rel=3D"noreferrer" target=3D"_blank">http://people.redhat.co=
m/~rjones</a><br>
Read my programming and virtualization blog: <a href=3D"http://rwmj.wordpre=
ss.com" rel=3D"noreferrer" target=3D"_blank">http://rwmj.wordpress.com</a><=
br>
Fedora Windows cross-compiler. Compile Windows programs, test, and<br>
build Windows installers. Over 100 libraries supported.<br>
<a href=3D"http://fedoraproject.org/wiki/MinGW" rel=3D"noreferrer" target=
=3D"_blank">http://fedoraproject.org/wiki/MinGW</a><br>
<br>
</blockquote></div></div>

--000000000000dbd00605cb562a36--

