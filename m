Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A06B4D458F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:19:29 +0100 (CET)
Received: from localhost ([::1]:38832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSGpM-0000f1-87
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:19:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nSGhg-0001YJ-Po
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:11:34 -0500
Received: from [2a00:1450:4864:20::32c] (port=33462
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nSGhe-0005Ce-Ia
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:11:31 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 n33-20020a05600c3ba100b003832caf7f3aso4222977wms.0
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GIV82CZNgnanzRJPRn5lCyHiATcM90EI6CwYUt6MnP0=;
 b=mM7G8Cx038zDVMSONoZx9rEBmn4jM5/eDilfHYWA8ehlUF251UU9pDcBFVNLKzmqnU
 P/q3QOIm19U/6g3OGSqbHOpdmLRdZ8iJBo8ZmrbtJq4Gkz8IZSEnFYj+ylw+lxkBjrKV
 5/1C24ifY0nhnWxpKMuCZidTX26tALH6hhS1CeO+Ol+Q2H96pwSrmwZ54qMVOqutG+Pv
 tjjjVqSaki5yypZb2pn7ZFLgI1gvMEqNssPMUhBz3YpnhAtS1zV0taqQS6c0Ld1HyCdr
 pghkxrNijxfQ45p65G3VlJQImgpTNn08EIKRrxn722LRjEbbkPEkyM8TDEDOng2Pk8sN
 KBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GIV82CZNgnanzRJPRn5lCyHiATcM90EI6CwYUt6MnP0=;
 b=ehDUAoNG5dwpk0OxyKr5lLsmTamr+2vEsVgNF6FQbB1zs4UGvw/PNPzS7ui92ETWtV
 NCjqJcQjk8iu/FnJQTmYDXm54jfRPPIyPcL1uUM1rljodwYqli5TCFXWk9X5BZ+jCXt8
 XxcZViXRSsz1UpqDeeWjhfshixIVMlnQODa+mQMIN98bu7g6HLbKPLUZPsaXgrvdmxQ0
 OKwQHfq/SbXdjV6As7wSGetw86zM+6x+OJt32uEQqNJU5DWL5Mw+ns+Yp76Zk2pSfVOL
 YThrG5uOn8wEolJsAfemGkyPJmfUjqO6+ougPDAjImuZSfuOex4i/QZqFpsr60lq27RX
 PzoA==
X-Gm-Message-State: AOAM532QRRZVDvDK7LMZDcYNetVW/abP8BduDpse1lrohNQKc1GGCDST
 0TIED9TbhR5rv01GNIK7jMiBXiA2jYPAx1zNViOhd3rqKBCNMg==
X-Google-Smtp-Source: ABdhPJwjXxMf2oDwSPXtbepb4nmmzrIGT4aidNXi6Y6/+O3YOwbNspyQYQBrU9mICPkgCn9zIh5Q8H9M4sf+4i7N1A0=
X-Received: by 2002:a7b:c7c3:0:b0:389:cbf1:fadf with SMTP id
 z3-20020a7bc7c3000000b00389cbf1fadfmr8426206wmk.147.1646910680869; Thu, 10
 Mar 2022 03:11:20 -0800 (PST)
MIME-Version: 1.0
References: <20220302174932.2692378-1-berrange@redhat.com>
 <20220302174932.2692378-5-berrange@redhat.com>
 <YiWra21XaVV9Fdv/@xz-m1.local> <YiXZLzqenrNT/uKg@redhat.com>
 <57b8b146-a197-2f46-bf56-6ab80122e9bd@redhat.com>
 <YinZLBo77h9X9kvX@redhat.com>
In-Reply-To: <YinZLBo77h9X9kvX@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 10 Mar 2022 15:11:08 +0400
Message-ID: <CAJ+F1CLhb-svEFTR4ehzu69a2PnJn0ZT-=TTRZ_FQedkODAW6g@mail.gmail.com>
Subject: Re: [PATCH 04/18] tests: print newline after QMP response in qtest
 logs
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000001c322a05d9db46e2"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x32c.google.com
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

--0000000000001c322a05d9db46e2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Mar 10, 2022 at 2:56 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Mon, Mar 07, 2022 at 11:09:37AM +0100, Thomas Huth wrote:
> > On 07/03/2022 11.06, Daniel P. Berrang=C3=A9 wrote:
> > > On Mon, Mar 07, 2022 at 02:51:23PM +0800, Peter Xu wrote:
> > > > On Wed, Mar 02, 2022 at 05:49:18PM +0000, Daniel P. Berrang=C3=A9 w=
rote:
> > > > > The QMP commands have a trailing newline, but the response does
> not.
> > > > > This makes the qtest logs hard to follow as the next QMP command
> > > > > appears in the same line as the previous QMP response.
> > > > >
> > > > > Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > > > > ---
> > > > >   tests/qtest/libqtest.c | 3 +++
> > > > >   1 file changed, 3 insertions(+)
> > > > >
> > > > > diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> > > > > index a85f8a6d05..79c3edcf4b 100644
> > > > > --- a/tests/qtest/libqtest.c
> > > > > +++ b/tests/qtest/libqtest.c
> > > > > @@ -629,6 +629,9 @@ QDict *qmp_fd_receive(int fd)
> > > > >           }
> > > > >           json_message_parser_feed(&qmp.parser, &c, 1);
> > > > >       }
> > > > > +    if (log) {
> > > > > +        g_assert(write(2, "\n", 1) =3D=3D 1);
> > > > > +    }
> > > >
> > > > Drop the g_assert() to remove side effect of G_DISABLE_ASSERT?
> > >
> > > You need to check the return value of write() otherwise you'll get a
> > > compile failure due to a warn_unused_result attribute annotation.
> > >
> > > I don't think G_DISABLE_ASSERT is a problem as we're not defining
> > > that in our code.
> >
> > You could use g_assert_true() - that's not affected by G_DISABLE_ASSERT=
.
>
> I don't think we need to do that, per existing common practice:
>
> $ git grep '\bg_assert('  | wc -l
> 2912
>
> $ git grep '\bg_assert(' tests | wc -l
> 2296
>
>
On the topic of assert() usage, it would be nice to state clearly when to
assert() or g_assert().

g_assert() behaviour is claimed to be more consistent than assert() across
platforms.

Also -DNDEBUG is less obvious than -DG_DISABLE_CHECKS or -DG_DISABLE_ASSERT=
.

I would remove assert.h and prevent from using it back, but I might be
missing some reasons to still use it.

--=20
Marc-Andr=C3=A9 Lureau

--0000000000001c322a05d9db46e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 10, 2022 at 2:56 PM Dan=
iel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@re=
dhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Mon, Mar 07, 2022 at 11:09:37AM +0100, Thomas Huth wrote:<br>
&gt; On 07/03/2022 11.06, Daniel P. Berrang=C3=A9 wrote:<br>
&gt; &gt; On Mon, Mar 07, 2022 at 02:51:23PM +0800, Peter Xu wrote:<br>
&gt; &gt; &gt; On Wed, Mar 02, 2022 at 05:49:18PM +0000, Daniel P. Berrang=
=C3=A9 wrote:<br>
&gt; &gt; &gt; &gt; The QMP commands have a trailing newline, but the respo=
nse does not.<br>
&gt; &gt; &gt; &gt; This makes the qtest logs hard to follow as the next QM=
P command<br>
&gt; &gt; &gt; &gt; appears in the same line as the previous QMP response.<=
br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Signed-off-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"m=
ailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&gt;<br=
>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0tests/qtest/libqtest.c | 3 +++<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A01 file changed, 3 insertions(+)<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqt=
est.c<br>
&gt; &gt; &gt; &gt; index a85f8a6d05..79c3edcf4b 100644<br>
&gt; &gt; &gt; &gt; --- a/tests/qtest/libqtest.c<br>
&gt; &gt; &gt; &gt; +++ b/tests/qtest/libqtest.c<br>
&gt; &gt; &gt; &gt; @@ -629,6 +629,9 @@ QDict *qmp_fd_receive(int fd)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0json_message_pa=
rser_feed(&amp;qmp.parser, &amp;c, 1);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (log) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert(write(2, &quot;\n=
&quot;, 1) =3D=3D 1);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Drop the g_assert() to remove side effect of G_DISABLE_ASSER=
T?<br>
&gt; &gt; <br>
&gt; &gt; You need to check the return value of write() otherwise you&#39;l=
l get a<br>
&gt; &gt; compile failure due to a warn_unused_result attribute annotation.=
<br>
&gt; &gt; <br>
&gt; &gt; I don&#39;t think G_DISABLE_ASSERT is a problem as we&#39;re not =
defining<br>
&gt; &gt; that in our code.<br>
&gt; <br>
&gt; You could use g_assert_true() - that&#39;s not affected by G_DISABLE_A=
SSERT.<br>
<br>
I don&#39;t think we need to do that, per existing common practice:<br>
<br>
$ git grep &#39;\bg_assert(&#39;=C2=A0 | wc -l<br>
2912<br>
<br>
$ git grep &#39;\bg_assert(&#39; tests | wc -l<br>
2296<br>
<br>
</blockquote></div><div><br></div><div>On the topic of assert() usage, it w=
ould be nice to state clearly when to assert() or g_assert().</div><div><br=
></div><div>g_assert() behaviour is claimed to be more consistent than asse=
rt() across platforms.</div><div><br></div><div>Also -DNDEBUG is less obvio=
us than -DG_DISABLE_CHECKS or -DG_DISABLE_ASSERT.</div><div><br></div><div>=
I would remove assert.h and prevent from using it back, but I might be miss=
ing some reasons to still use it.<br></div><div><br></div>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000001c322a05d9db46e2--

