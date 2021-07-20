Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 065B63CFE46
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:55:18 +0200 (CEST)
Received: from localhost ([::1]:53826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5s5U-0008DG-Vi
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5s1I-0000Lp-Na
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:50:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5s1G-0002ME-Gc
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:50:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626796253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+JyNsyl0sFLUGMpgsB/nJojZVTKnqs2WbSRCVy08YqI=;
 b=gijtCnU2GcuDPGPoAnGhYWPqfVqDkPrUHlp5qpYQSRkp+3EU9cUW0KjsLUWdnhgbrIhEum
 siUA3imChXmdGZ0U6TDnRKZsauWwpK494n2b2BgJLah1LTcE2tjhU4TcFhEKS9GLXzSAHo
 RG5Y1Aj2y36BiXY6wFH3Nl5AfqkxTYY=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-6pKGOtqtMGGz_Q6PXIm2MA-1; Tue, 20 Jul 2021 11:50:50 -0400
X-MC-Unique: 6pKGOtqtMGGz_Q6PXIm2MA-1
Received: by mail-oi1-f199.google.com with SMTP id
 u17-20020a5443910000b02902409d8d9f2fso15710789oiv.5
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 08:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+JyNsyl0sFLUGMpgsB/nJojZVTKnqs2WbSRCVy08YqI=;
 b=Ov0lhcTE0uwEt9Ul2JjcOgBJ5y05bRF/D9MptwtZ2F7C2hD8MzLqLLcm3wx+QRRFSr
 0F74njG7yZJnYo9L2iF6hKTG15fPJ278oPwWUdxQxaOI/ErJYPIvNIQGWSYg0V42KqV6
 WzyG1Mpue0PauDcWp/V4Yn3vxNPnTfX3cjevhzp3z4vbJRaL6sgfI8wmJtqpVwSGzBn0
 mD8/7YV2Mjws7Hh18QMpMPsrmZPB1fgMzTyawNXmz1q7PxORrlo3RhbOx1fRdTTCj4w+
 Skbr1eScQ9LoOlu6p6NdmfsUxZq1xNfJnF5jXjbS42/aNEPPjV5l+gVs2THdXvUtIW9L
 szsw==
X-Gm-Message-State: AOAM531cBF7UukoXAYipA8KZFto0bUks39z74S/75L9EppXxUn+oCHph
 MNl7mMxx+lhqZ4BtsUva3HwvHlnw8sIJUYgFOSeblLRMDi0IkXQUCTaCts0RGoxQN4RuTsc1dqc
 skzxkx2c3o3wWJxNuRN9i2epq/UE12u4=
X-Received: by 2002:a9d:20a2:: with SMTP id x31mr21383892ota.263.1626796249753; 
 Tue, 20 Jul 2021 08:50:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUgKEmwuBqp2ZE7VDCrG2qt2OUoU8vki3uwdkMnUUNKea0Uk3LfDbhXhlHuL5+lcA9ZeBFlDA2eg4v4bOiGQI=
X-Received: by 2002:a9d:20a2:: with SMTP id x31mr21383879ota.263.1626796249560; 
 Tue, 20 Jul 2021 08:50:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210625182021.803227-1-jsnow@redhat.com>
 <20210625182021.803227-8-jsnow@redhat.com>
 <5660606b-0304-a0b3-2990-c33a39ce13bf@virtuozzo.com>
In-Reply-To: <5660606b-0304-a0b3-2990-c33a39ce13bf@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 20 Jul 2021 11:50:38 -0400
Message-ID: <CAFn=p-bb9On4zMmsZ=qvxfuwfV_5A0PjDskSwddtsRYzhgdQog@mail.gmail.com>
Subject: Re: [PATCH 07/10] iotests/297: return error code from run_linters()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000093cbd905c7900411"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000093cbd905c7900411
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 13, 2021 at 5:44 AM Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> 25.06.2021 21:20, John Snow wrote:
> > This turns run_linters() into a bit of a hybrid test; returning non-zero
> > on failed execution while also printing diffable information. This is
> > done for the benefit of the avocado simple test runner, which will soon
> > be attempting to execute this test from a different environment.
> >
> > (Note: universal_newlines is added to the pylint invocation for type
> > consistency with the mypy run -- it's not strictly necessary, but it
> > avoids some typing errors caused by our re-use of the 'p' variable.)
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/qemu-iotests/297 | 10 ++++++++--
> >   1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
> > index 1e8334d1d4..7db1f9ed45 100755
> > --- a/tests/qemu-iotests/297
> > +++ b/tests/qemu-iotests/297
> > @@ -68,19 +68,22 @@ def run_linters(
> >       files: List[str],
> >       directory: str = '.',
> >       env: Optional[Mapping[str, str]] = None,
> > -) -> None:
> > +) -> int:
> > +    ret = 0
> >
> >       print('=== pylint ===')
> >       sys.stdout.flush()
> >
> >       # Todo notes are fine, but fixme's or xxx's should probably just be
> >       # fixed (in tests, at least)
> > -    subprocess.run(
> > +    p = subprocess.run(
> >           ('python3', '-m', 'pylint', '--score=n', '--notes=FIXME,XXX',
> *files),
> >           cwd=directory,
> >           env=env,
> >           check=False,
> > +        universal_newlines=True,
>
> Why you need this universal_newlines=True, if you don't handle output?
>
>
Typing consistency. It changes the type of `p`, which we re-use. Could also
be solved by using two different local binding names.

--js


> with or without it:
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>
>
Tentatively, I'll take this RB.


> >       )
> > +    ret += p.returncode
> >
> >       print('=== mypy ===')
> >       sys.stdout.flush()
> > @@ -113,9 +116,12 @@ def run_linters(
> >               universal_newlines=True
> >           )
> >
> > +        ret += p.returncode
> >           if p.returncode != 0:
> >               print(p.stdout)
> >
> > +    return ret
> > +
> >
> >   def main() -> None:
> >       for linter in ('pylint-3', 'mypy'):
> >
>
>
> --
> Best regards,
> Vladimir
>
>

--00000000000093cbd905c7900411
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 13, 2021 at 5:44 AM Vladi=
mir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@virtuozzo.com">vse=
mentsov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">25.06.2021 21:20, John Snow wrote:<br>
&gt; This turns run_linters() into a bit of a hybrid test; returning non-ze=
ro<br>
&gt; on failed execution while also printing diffable information. This is<=
br>
&gt; done for the benefit of the avocado simple test runner, which will soo=
n<br>
&gt; be attempting to execute this test from a different environment.<br>
&gt; <br>
&gt; (Note: universal_newlines is added to the pylint invocation for type<b=
r>
&gt; consistency with the mypy run -- it&#39;s not strictly necessary, but =
it<br>
&gt; avoids some typing errors caused by our re-use of the &#39;p&#39; vari=
able.)<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/297 | 10 ++++++++--<br>
&gt;=C2=A0 =C2=A01 file changed, 8 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297<br>
&gt; index 1e8334d1d4..7db1f9ed45 100755<br>
&gt; --- a/tests/qemu-iotests/297<br>
&gt; +++ b/tests/qemu-iotests/297<br>
&gt; @@ -68,19 +68,22 @@ def run_linters(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0files: List[str],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0directory: str =3D &#39;.&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0env: Optional[Mapping[str, str]] =3D None,<b=
r>
&gt; -) -&gt; None:<br>
&gt; +) -&gt; int:<br>
&gt; +=C2=A0 =C2=A0 ret =3D 0<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0print(&#39;=3D=3D=3D pylint =3D=3D=3D&#39;)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sys.stdout.flush()<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Todo notes are fine, but fixme&#39;s or xx=
x&#39;s should probably just be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# fixed (in tests, at least)<br>
&gt; -=C2=A0 =C2=A0 subprocess.run(<br>
&gt; +=C2=A0 =C2=A0 p =3D subprocess.run(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&#39;python3&#39;, &#39;-m&#3=
9;, &#39;pylint&#39;, &#39;--score=3Dn&#39;, &#39;--notes=3DFIXME,XXX&#39;,=
 *files),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cwd=3Ddirectory,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env=3Denv,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0check=3DFalse,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 universal_newlines=3DTrue,<br>
<br>
Why you need this universal_newlines=3DTrue, if you don&#39;t handle output=
?<br>
<br></blockquote><div><br></div><div>Typing consistency. It changes the typ=
e of `p`, which we re-use. Could also be solved by using two different loca=
l binding names.</div><div><br></div><div>--js<br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
with or without it:<br>
Reviewed-by: Vladimir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@=
virtuozzo.com" target=3D"_blank">vsementsov@virtuozzo.com</a>&gt;<br>
<br></blockquote><div><br></div><div>Tentatively, I&#39;ll take this RB.<br=
></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt; +=C2=A0 =C2=A0 ret +=3D p.returncode<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0print(&#39;=3D=3D=3D mypy =3D=3D=3D&#39;)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sys.stdout.flush()<br>
&gt; @@ -113,9 +116,12 @@ def run_linters(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0universal_newlin=
es=3DTrue<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D p.returncode<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if p.returncode !=3D 0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(p.stdout)<=
br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 return ret<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0def main() -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for linter in (&#39;pylint-3&#39;, &#39;mypy=
&#39;):<br>
&gt; <br>
<br>
<br>
-- <br>
Best regards,<br>
Vladimir<br>
<br>
</blockquote></div></div>

--00000000000093cbd905c7900411--


