Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B22E4D4780
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:59:09 +0100 (CET)
Received: from localhost ([::1]:50544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSINo-0004hc-15
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:59:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nSHK6-00063t-B4
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:51:14 -0500
Received: from [2a00:1450:4864:20::42f] (port=39897
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nSHK4-0003MN-4w
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:51:13 -0500
Received: by mail-wr1-x42f.google.com with SMTP id h15so7528646wrc.6
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XbL+I9IGQwCcUYvqytiB/0qs/ceksonvmDGctFvjAps=;
 b=NnhmuTbRAT0OoEvuU7MiEJLdlFPkTOtu/FjOd7j/gUxhumAu22E6UUw6OF6pnUKOPV
 M1y4O1iuc0HGDg9AjKhAx1EldgOV+jgO9oYs3zmoli2brxBY/2Bus4V1V7q69BoC5lVI
 L2jM3px+Hw4YZbTDd0IEER85pAB2IJtGooi54uxaXWaNWCDFjD1EVuAeAHTx7021Fbxz
 4EU5FtCQ+egZR+/S8ciOH0/MANu6Z7D5rwWhnl4fi0XDl4teGsRFJdTBIC1N4TRY5qiI
 Cka3yKLxqiHR0deIaUIOz6irZz32uBSyGA8jYdO0N5pk6sdwh4NhQ1vfwBhvhV5s9Fsj
 JC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XbL+I9IGQwCcUYvqytiB/0qs/ceksonvmDGctFvjAps=;
 b=Gb1SMt2BEplWqe0Bmd17Qmy06D4ibMnjlWaIYhguPFA/bRs5qvZLt11czwuDXE3Nvb
 nuBGXtoXp8RCFg6fuJtJVbMBoP9GUoxqWH9Qrl8xGmZ2OrBYjkLlhiqR0U8Fxy/T/kpw
 jsIQJ7qkDAzVTbP2Y8dOEx9fVu8iUq98kDkxLAEwkoxjc3KQEzGAIgxX2iVGIJyMVa/a
 LxEuHSuM3f19JyoaoTk5wUjy02j5RLiVR7CPLxftJw/8Njqt80sSWW5WQu27BGJg3Yed
 6Zq4PSRs3Nz4YImuTzPU0GE13Izb3AXa//3klf5Q5oRze0r8R1b0n5+R17ej8femt//y
 6uzQ==
X-Gm-Message-State: AOAM533QP8cHxTncNH08Jp5UM92lYbJEVzRy0dtVF9xux7BjHvRUSm7X
 HZdI79y9Fh6IpoqmMkOaL/SMA8WCEGoG9G3x4kM=
X-Google-Smtp-Source: ABdhPJy4MNl2HOQqeydH/X9AFzIUq+mDb5/bDPU6SZZJ64Tz0pnDKsBeY540RiIn471AsYTe7Ow4vk7FGPZUgnMfF50=
X-Received: by 2002:a05:6000:c7:b0:1f0:2f56:f784 with SMTP id
 q7-20020a05600000c700b001f02f56f784mr3323687wrx.562.1646913070476; Thu, 10
 Mar 2022 03:51:10 -0800 (PST)
MIME-Version: 1.0
References: <20220302174932.2692378-1-berrange@redhat.com>
 <20220302174932.2692378-5-berrange@redhat.com>
 <YiWra21XaVV9Fdv/@xz-m1.local> <YiXZLzqenrNT/uKg@redhat.com>
 <57b8b146-a197-2f46-bf56-6ab80122e9bd@redhat.com>
 <YinZLBo77h9X9kvX@redhat.com>
 <CAJ+F1CLhb-svEFTR4ehzu69a2PnJn0ZT-=TTRZ_FQedkODAW6g@mail.gmail.com>
 <Yinieq97rqFqfjK4@redhat.com>
In-Reply-To: <Yinieq97rqFqfjK4@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 10 Mar 2022 15:50:58 +0400
Message-ID: <CAJ+F1C+As+Kjq9_jvLopd5LW8FQX4LyHXM_xyFBDDc+XHCUGqw@mail.gmail.com>
Subject: Re: [PATCH 04/18] tests: print newline after QMP response in qtest
 logs
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000008ab17905d9dbd4af"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008ab17905d9dbd4af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Mar 10, 2022 at 3:35 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Thu, Mar 10, 2022 at 03:11:08PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Thu, Mar 10, 2022 at 2:56 PM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com>
> > wrote:
> >
> > > On Mon, Mar 07, 2022 at 11:09:37AM +0100, Thomas Huth wrote:
> > > > On 07/03/2022 11.06, Daniel P. Berrang=C3=A9 wrote:
> > > > > On Mon, Mar 07, 2022 at 02:51:23PM +0800, Peter Xu wrote:
> > > > > > On Wed, Mar 02, 2022 at 05:49:18PM +0000, Daniel P. Berrang=C3=
=A9
> wrote:
> > > > > > > The QMP commands have a trailing newline, but the response do=
es
> > > not.
> > > > > > > This makes the qtest logs hard to follow as the next QMP
> command
> > > > > > > appears in the same line as the previous QMP response.
> > > > > > >
> > > > > > > Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > > > > > > ---
> > > > > > >   tests/qtest/libqtest.c | 3 +++
> > > > > > >   1 file changed, 3 insertions(+)
> > > > > > >
> > > > > > > diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> > > > > > > index a85f8a6d05..79c3edcf4b 100644
> > > > > > > --- a/tests/qtest/libqtest.c
> > > > > > > +++ b/tests/qtest/libqtest.c
> > > > > > > @@ -629,6 +629,9 @@ QDict *qmp_fd_receive(int fd)
> > > > > > >           }
> > > > > > >           json_message_parser_feed(&qmp.parser, &c, 1);
> > > > > > >       }
> > > > > > > +    if (log) {
> > > > > > > +        g_assert(write(2, "\n", 1) =3D=3D 1);
> > > > > > > +    }
> > > > > >
> > > > > > Drop the g_assert() to remove side effect of G_DISABLE_ASSERT?
> > > > >
> > > > > You need to check the return value of write() otherwise you'll ge=
t
> a
> > > > > compile failure due to a warn_unused_result attribute annotation.
> > > > >
> > > > > I don't think G_DISABLE_ASSERT is a problem as we're not defining
> > > > > that in our code.
> > > >
> > > > You could use g_assert_true() - that's not affected by
> G_DISABLE_ASSERT.
> > >
> > > I don't think we need to do that, per existing common practice:
> > >
> > > $ git grep '\bg_assert('  | wc -l
> > > 2912
> > >
> > > $ git grep '\bg_assert(' tests | wc -l
> > > 2296
> > >
> > >
> > On the topic of assert() usage, it would be nice to state clearly when =
to
> > assert() or g_assert().
> >
> > g_assert() behaviour is claimed to be more consistent than assert()
> across
> > platforms.
> >
> > Also -DNDEBUG is less obvious than -DG_DISABLE_CHECKS or
> -DG_DISABLE_ASSERT.
>
> Personally I would make QEMU build error if NDEBUG or G_DISABLE_ASSERT
> was defined, as running with asserts disabled will lead to unsafe code.
> We rely on asserts firing to avoid compromise of QEMU when faced with
> malicious data.
>

agreed


>
> > I would remove assert.h and prevent from using it back, but I might be
> > missing some reasons to still use it.
>
> As a metric we've got massive use of both families of asset
>
> $ git grep -E -o '\b(assert|g_assert(_[a-z]+)?)\b\s?\(' | sed -e 's/.*://=
'
> | sort | uniq -c
>      17 assert (
>    5196 assert(
>    2913 g_assert(
>      29 g_assert_cmpfloat(
>     662 g_assert_cmphex(
>    1745 g_assert_cmpint(
>      20 g_assert_cmpmem(
>     407 g_assert_cmpstr(
>     756 g_assert_cmpuint(
>     169 g_assert_false(
>     138 g_assert_nonnull(
>      22 g_assert_null(
>     167 g_assert_true(
>
> But for the tests/ subdir, g_assert family is a clear favourite
>
> $ git grep -E -o '\b(assert|g_assert(_[a-z]+)?)\b\s?\(' tests  | sed -e
> 's/.*://' | sort | uniq -c
>       1 assert (
>     759 assert(
>    2297 g_assert(
>      29 g_assert_cmpfloat(
>     661 g_assert_cmphex(
>    1744 g_assert_cmpint(
>      20 g_assert_cmpmem(
>     406 g_assert_cmpstr(
>     754 g_assert_cmpuint(
>     169 g_assert_false(
>     138 g_assert_nonnull(
>      22 g_assert_null(
>     167 g_assert_true(
>
>
> This split doesn't appear to have changed all that much over time.
> Going back to v3.0.0 we see similar ballpark figures
>
> $ git grep -E -o '\b(assert|g_assert(_[a-z]+)?)\b\s?\(' | sed -e 's/.*://=
'
> | sort | uniq -c
>      18 assert (
>    3766 assert(
>    2210 g_assert(
>      23 g_assert_cmpfloat(
>     310 g_assert_cmphex(
>    1352 g_assert_cmpint(
>      11 g_assert_cmpmem(
>     324 g_assert_cmpstr(
>     489 g_assert_cmpuint(
>      88 g_assert_false(
>      73 g_assert_nonnull(
>       8 g_assert_null(
>      46 g_assert_true(
> [berrange@catbus qemu]$ git grep -E -o
> '\b(assert|g_assert(_[a-z]+)?)\b\s?\(' tests | sed -e 's/.*://' | sort |
> uniq -c
>     566 assert(
>    1876 g_assert(
>      23 g_assert_cmpfloat(
>     309 g_assert_cmphex(
>    1351 g_assert_cmpint(
>      10 g_assert_cmpmem(
>     323 g_assert_cmpstr(
>     488 g_assert_cmpuint(
>      88 g_assert_false(
>      73 g_assert_nonnull(
>       8 g_assert_null(
>      46 g_assert_true(
>
>
> Removing either 'assert' or g_assert would be a massive amount of code
> churn, for no real functional benefit.
>
> I would personally encourage the more specific g_assert_* variants, to
> improve the error messages, but that's really minor.
>
> IMHO we can accept that all of the above are valid to use and worry
> about more important things.
>

Beside the usage inconsistency & the potential platform inconsistencies, it
makes code reorganization/split (libslirp-like) a bit more annoying,
because <assert.h> is only included in osdep.h.

Also g_assert*() family of functions help more precise usage patterns.
g_assert_not_reached() is better than assert(false) or just abort() imho
(it seems we use both).



--=20
Marc-Andr=C3=A9 Lureau

--0000000000008ab17905d9dbd4af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 10, 2022 at 3:35 PM Dan=
iel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@re=
dhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Thu, Mar 10, 2022 at 03:11:08PM +0400, Marc-Andr=C3=A9 Lureau wr=
ote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Thu, Mar 10, 2022 at 2:56 PM Daniel P. Berrang=C3=A9 &lt;<a href=3D=
"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&gt;<=
br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Mon, Mar 07, 2022 at 11:09:37AM +0100, Thomas Huth wrote:<br>
&gt; &gt; &gt; On 07/03/2022 11.06, Daniel P. Berrang=C3=A9 wrote:<br>
&gt; &gt; &gt; &gt; On Mon, Mar 07, 2022 at 02:51:23PM +0800, Peter Xu wrot=
e:<br>
&gt; &gt; &gt; &gt; &gt; On Wed, Mar 02, 2022 at 05:49:18PM +0000, Daniel P=
. Berrang=C3=A9 wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; The QMP commands have a trailing newline, but=
 the response does<br>
&gt; &gt; not.<br>
&gt; &gt; &gt; &gt; &gt; &gt; This makes the qtest logs hard to follow as t=
he next QMP command<br>
&gt; &gt; &gt; &gt; &gt; &gt; appears in the same line as the previous QMP =
response.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Signed-off-by: Daniel P. Berrang=C3=A9 &lt;<a=
 href=3D"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com<=
/a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0tests/qtest/libqtest.c | 3 +++<br=
>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A01 file changed, 3 insertions(+)<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; diff --git a/tests/qtest/libqtest.c b/tests/q=
test/libqtest.c<br>
&gt; &gt; &gt; &gt; &gt; &gt; index a85f8a6d05..79c3edcf4b 100644<br>
&gt; &gt; &gt; &gt; &gt; &gt; --- a/tests/qtest/libqtest.c<br>
&gt; &gt; &gt; &gt; &gt; &gt; +++ b/tests/qtest/libqtest.c<br>
&gt; &gt; &gt; &gt; &gt; &gt; @@ -629,6 +629,9 @@ QDict *qmp_fd_receive(int=
 fd)<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0json_=
message_parser_feed(&amp;qmp.parser, &amp;c, 1);<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (log) {<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert(write(2=
, &quot;\n&quot;, 1) =3D=3D 1);<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Drop the g_assert() to remove side effect of G_DIS=
ABLE_ASSERT?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; You need to check the return value of write() otherwise=
 you&#39;ll get a<br>
&gt; &gt; &gt; &gt; compile failure due to a warn_unused_result attribute a=
nnotation.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I don&#39;t think G_DISABLE_ASSERT is a problem as we&#=
39;re not defining<br>
&gt; &gt; &gt; &gt; that in our code.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; You could use g_assert_true() - that&#39;s not affected by G=
_DISABLE_ASSERT.<br>
&gt; &gt;<br>
&gt; &gt; I don&#39;t think we need to do that, per existing common practic=
e:<br>
&gt; &gt;<br>
&gt; &gt; $ git grep &#39;\bg_assert(&#39;=C2=A0 | wc -l<br>
&gt; &gt; 2912<br>
&gt; &gt;<br>
&gt; &gt; $ git grep &#39;\bg_assert(&#39; tests | wc -l<br>
&gt; &gt; 2296<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; On the topic of assert() usage, it would be nice to state clearly when=
 to<br>
&gt; assert() or g_assert().<br>
&gt; <br>
&gt; g_assert() behaviour is claimed to be more consistent than assert() ac=
ross<br>
&gt; platforms.<br>
&gt; <br>
&gt; Also -DNDEBUG is less obvious than -DG_DISABLE_CHECKS or -DG_DISABLE_A=
SSERT.<br>
<br>
Personally I would make QEMU build error if NDEBUG or G_DISABLE_ASSERT<br>
was defined, as running with asserts disabled will lead to unsafe code.<br>
We rely on asserts firing to avoid compromise of QEMU when faced with<br>
malicious data.<br></blockquote><div><br></div><div>agreed</div><div>=C2=A0=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; I would remove assert.h and prevent from using it back, but I might be=
<br>
&gt; missing some reasons to still use it.<br>
<br>
As a metric we&#39;ve got massive use of both families of asset<br>
<br>
$ git grep -E -o &#39;\b(assert|g_assert(_[a-z]+)?)\b\s?\(&#39; | sed -e &#=
39;s/.*://&#39; | sort | uniq -c<br>
=C2=A0 =C2=A0 =C2=A017 assert (<br>
=C2=A0 =C2=A05196 assert(<br>
=C2=A0 =C2=A02913 g_assert(<br>
=C2=A0 =C2=A0 =C2=A029 g_assert_cmpfloat(<br>
=C2=A0 =C2=A0 662 g_assert_cmphex(<br>
=C2=A0 =C2=A01745 g_assert_cmpint(<br>
=C2=A0 =C2=A0 =C2=A020 g_assert_cmpmem(<br>
=C2=A0 =C2=A0 407 g_assert_cmpstr(<br>
=C2=A0 =C2=A0 756 g_assert_cmpuint(<br>
=C2=A0 =C2=A0 169 g_assert_false(<br>
=C2=A0 =C2=A0 138 g_assert_nonnull(<br>
=C2=A0 =C2=A0 =C2=A022 g_assert_null(<br>
=C2=A0 =C2=A0 167 g_assert_true(<br>
<br>
But for the tests/ subdir, g_assert family is a clear favourite<br>
<br>
$ git grep -E -o &#39;\b(assert|g_assert(_[a-z]+)?)\b\s?\(&#39; tests=C2=A0=
 | sed -e &#39;s/.*://&#39; | sort | uniq -c<br>
=C2=A0 =C2=A0 =C2=A0 1 assert (<br>
=C2=A0 =C2=A0 759 assert(<br>
=C2=A0 =C2=A02297 g_assert(<br>
=C2=A0 =C2=A0 =C2=A029 g_assert_cmpfloat(<br>
=C2=A0 =C2=A0 661 g_assert_cmphex(<br>
=C2=A0 =C2=A01744 g_assert_cmpint(<br>
=C2=A0 =C2=A0 =C2=A020 g_assert_cmpmem(<br>
=C2=A0 =C2=A0 406 g_assert_cmpstr(<br>
=C2=A0 =C2=A0 754 g_assert_cmpuint(<br>
=C2=A0 =C2=A0 169 g_assert_false(<br>
=C2=A0 =C2=A0 138 g_assert_nonnull(<br>
=C2=A0 =C2=A0 =C2=A022 g_assert_null(<br>
=C2=A0 =C2=A0 167 g_assert_true(<br>
<br>
<br>
This split doesn&#39;t appear to have changed all that much over time.<br>
Going back to v3.0.0 we see similar ballpark figures<br>
<br>
$ git grep -E -o &#39;\b(assert|g_assert(_[a-z]+)?)\b\s?\(&#39; | sed -e &#=
39;s/.*://&#39; | sort | uniq -c <br>
=C2=A0 =C2=A0 =C2=A018 assert (<br>
=C2=A0 =C2=A03766 assert(<br>
=C2=A0 =C2=A02210 g_assert(<br>
=C2=A0 =C2=A0 =C2=A023 g_assert_cmpfloat(<br>
=C2=A0 =C2=A0 310 g_assert_cmphex(<br>
=C2=A0 =C2=A01352 g_assert_cmpint(<br>
=C2=A0 =C2=A0 =C2=A011 g_assert_cmpmem(<br>
=C2=A0 =C2=A0 324 g_assert_cmpstr(<br>
=C2=A0 =C2=A0 489 g_assert_cmpuint(<br>
=C2=A0 =C2=A0 =C2=A088 g_assert_false(<br>
=C2=A0 =C2=A0 =C2=A073 g_assert_nonnull(<br>
=C2=A0 =C2=A0 =C2=A0 8 g_assert_null(<br>
=C2=A0 =C2=A0 =C2=A046 g_assert_true(<br>
[berrange@catbus qemu]$ git grep -E -o &#39;\b(assert|g_assert(_[a-z]+)?)\b=
\s?\(&#39; tests | sed -e &#39;s/.*://&#39; | sort | uniq -c <br>
=C2=A0 =C2=A0 566 assert(<br>
=C2=A0 =C2=A01876 g_assert(<br>
=C2=A0 =C2=A0 =C2=A023 g_assert_cmpfloat(<br>
=C2=A0 =C2=A0 309 g_assert_cmphex(<br>
=C2=A0 =C2=A01351 g_assert_cmpint(<br>
=C2=A0 =C2=A0 =C2=A010 g_assert_cmpmem(<br>
=C2=A0 =C2=A0 323 g_assert_cmpstr(<br>
=C2=A0 =C2=A0 488 g_assert_cmpuint(<br>
=C2=A0 =C2=A0 =C2=A088 g_assert_false(<br>
=C2=A0 =C2=A0 =C2=A073 g_assert_nonnull(<br>
=C2=A0 =C2=A0 =C2=A0 8 g_assert_null(<br>
=C2=A0 =C2=A0 =C2=A046 g_assert_true(<br>
<br>
<br>
Removing either &#39;assert&#39; or g_assert would be a massive amount of c=
ode<br>
churn, for no real functional benefit.<br>
<br>
I would personally encourage the more specific g_assert_* variants, to<br>
improve the error messages, but that&#39;s really minor.<br>
<br>
IMHO we can accept that all of the above are valid to use and worry<br>
about more important things.<br></blockquote><div><br></div><div>Beside the=
 usage inconsistency &amp; the potential platform inconsistencies, it makes=
 code reorganization/split (libslirp-like) a bit more annoying, because &lt=
;assert.h&gt; is only included in osdep.h.</div><div><br></div><div>Also g_=
assert*() family of functions help more precise usage patterns. g_assert_no=
t_reached() is better than assert(false) or just abort() imho (it seems we =
use both).<br></div><div><br></div><div><br></div></div><br>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000008ab17905d9dbd4af--

