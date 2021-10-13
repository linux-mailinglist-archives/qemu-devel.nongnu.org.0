Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 853E342C38A
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 16:39:21 +0200 (CEST)
Received: from localhost ([::1]:34852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mafPc-0007BV-FZ
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 10:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mafOY-0006GP-N9
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 10:38:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mafOW-0001yw-VC
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 10:38:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634135891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m2wKpQvZsFq6mEoBefFYawqZ0uqEgo7n0WPmDOQCrJM=;
 b=FJ4RIfYKzXnCsmFBy3vsv2ft/GzJygboW+CVRN6rUgMB3jGf9vT5nN5sUnYrSOM7nMUxsk
 99veGW+o4E4WXYXUHuEZeUipH14cTL/aECRWEv+8xeK8+6EyAoiWsLCod1mkoOP1fktf17
 mFeB3/blAgOww/8eCGYrcwuBXjFcDw8=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-u4k3U9V8N-6Pc8HkcNV5Qg-1; Wed, 13 Oct 2021 10:38:01 -0400
X-MC-Unique: u4k3U9V8N-6Pc8HkcNV5Qg-1
Received: by mail-vk1-f198.google.com with SMTP id
 y20-20020ac5c814000000b002a3ac46f9a1so1127707vkl.15
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 07:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m2wKpQvZsFq6mEoBefFYawqZ0uqEgo7n0WPmDOQCrJM=;
 b=LecqRFbVSlllVGHJYBk813XnZcyf2gle5LUL4qMigy//4zO/5RfF8rKOLPV5CySEY3
 gpXpTdPcrEMAjrv2YvTWNCAiLRP/my/X9USFw24ReB6wfXcTYfZHD1rUAhpnj4ffFiTe
 WdYJc8HtA3PksA9u3R9e6aV6xlfQdyOTB16SM+SPZwgoGnHu9RHPyd5UuJh9D3KRIDSh
 tQn+Gfd2APizFISfwFHyB95iaaS9CVA/3rP8ii0VwYPo9tY4M9uGH+upLg66KZVclz2O
 02UQBkWuXOjtQzUvyJCa3SmvFK+le7OU/RdR64WrM/oEnUqHo/lvigWWPcQnbAbg3JxH
 q8cg==
X-Gm-Message-State: AOAM533umzJsQKblkRQ1ooyvN9F02TxpYDGWexlbjx/YWZZAn0D1vGly
 Na2VrSuRDVcyqz4QI/YlZsPAKDKn76zsqQ6B7iaRwbCg/Xp6XiRWnaTU5KeuyYcyqtwO62wLbOE
 J7zdbVgI7/PbOjO7idLhnviXu5So+Gi0=
X-Received: by 2002:a1f:27cd:: with SMTP id n196mr33766009vkn.23.1634135880662; 
 Wed, 13 Oct 2021 07:38:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztL3635Y7XQP2mGFjNkFNf4N7SP52od4F9a+Pj0lxnHhLnckf8BF3mmRYvj3rXfNZi2NaskWVQ+8+AS9RJr9U=
X-Received: by 2002:a1f:27cd:: with SMTP id n196mr33765989vkn.23.1634135880471; 
 Wed, 13 Oct 2021 07:38:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211004210503.1455391-1-jsnow@redhat.com>
 <20211004210503.1455391-3-jsnow@redhat.com>
 <c15ceed2-1b9a-3552-d5f9-70544e362662@redhat.com>
In-Reply-To: <c15ceed2-1b9a-3552-d5f9-70544e362662@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 13 Oct 2021 10:37:49 -0400
Message-ID: <CAFn=p-Z0dpy0+179_6xWx6emujRXM72oA0as+=q5WQzp-fBSGA@mail.gmail.com>
Subject: Re: [PATCH 02/13] iotests/297: Split mypy configuration out into
 mypy.ini
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000abac9905ce3ce8de"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000abac9905ce3ce8de
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 13, 2021 at 6:53 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 04.10.21 23:04, John Snow wrote:
> > More separation of code and configuration.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/qemu-iotests/297      | 14 +-------------
> >   tests/qemu-iotests/mypy.ini | 12 ++++++++++++
> >   2 files changed, 13 insertions(+), 13 deletions(-)
> >   create mode 100644 tests/qemu-iotests/mypy.ini
>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>
> > diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
> > index bc3a0ceb2aa..b8101e6024a 100755
> > --- a/tests/qemu-iotests/297
> > +++ b/tests/qemu-iotests/297
> > @@ -73,19 +73,7 @@ def run_linters():
> >       sys.stdout.flush()
> >
> >       env['MYPYPATH'] = env['PYTHONPATH']
> > -    p = subprocess.run(('mypy',
> > -                        '--warn-unused-configs',
> > -                        '--disallow-subclassing-any',
> > -                        '--disallow-any-generics',
> > -                        '--disallow-incomplete-defs',
> > -                        '--disallow-untyped-decorators',
> > -                        '--no-implicit-optional',
> > -                        '--warn-redundant-casts',
> > -                        '--warn-unused-ignores',
> > -                        '--no-implicit-reexport',
> > -                        '--namespace-packages',
> > -                        '--scripts-are-modules',
> > -                        *files),
> > +    p = subprocess.run(('mypy', *files),
> >                          env=env,
> >                          check=False,
> >                          stdout=subprocess.PIPE,
> > diff --git a/tests/qemu-iotests/mypy.ini b/tests/qemu-iotests/mypy.ini
> > new file mode 100644
> > index 00000000000..4c0339f5589
> > --- /dev/null
> > +++ b/tests/qemu-iotests/mypy.ini
> > @@ -0,0 +1,12 @@
> > +[mypy]
> > +disallow_any_generics = True
> > +disallow_incomplete_defs = True
> > +disallow_subclassing_any = True
> > +disallow_untyped_decorators = True
> > +implicit_reexport = False
>
> Out of curiosity: Any reason you chose to invert this one, but none of
> the rest?  (i.e. no_implicit_optional = True -> implicit_optional =
> False; or disallow* = True -> allow* = False)
>
>
Anything written as '--no-xxx' I wrote as 'xxx = False', but
"implicit_optional = False" isn't a supported option, so that one kept the
"no" in it.

--js

--000000000000abac9905ce3ce8de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 13, 2021 at 6:53 AM Hanna=
 Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 04.10.2=
1 23:04, John Snow wrote:<br>
&gt; More separation of code and configuration.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/297=C2=A0 =C2=A0 =C2=A0 | 14 +---------=
----<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/mypy.ini | 12 ++++++++++++<br>
&gt;=C2=A0 =C2=A02 files changed, 13 insertions(+), 13 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 tests/qemu-iotests/mypy.ini<br>
<br>
Reviewed-by: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" target=3D=
"_blank">hreitz@redhat.com</a>&gt;<br>
<br>
&gt; diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297<br>
&gt; index bc3a0ceb2aa..b8101e6024a 100755<br>
&gt; --- a/tests/qemu-iotests/297<br>
&gt; +++ b/tests/qemu-iotests/297<br>
&gt; @@ -73,19 +73,7 @@ def run_linters():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sys.stdout.flush()<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0env[&#39;MYPYPATH&#39;] =3D env[&#39;PYTHONP=
ATH&#39;]<br>
&gt; -=C2=A0 =C2=A0 p =3D subprocess.run((&#39;mypy&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &#39;--warn-unused-configs&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &#39;--disallow-subclassing-any&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &#39;--disallow-any-generics&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &#39;--disallow-incomplete-defs&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &#39;--disallow-untyped-decorators&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &#39;--no-implicit-optional&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &#39;--warn-redundant-casts&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &#39;--warn-unused-ignores&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &#39;--no-implicit-reexport&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &#39;--namespace-packages&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &#39;--scripts-are-modules&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 *files),<br>
&gt; +=C2=A0 =C2=A0 p =3D subprocess.run((&#39;mypy&#39;, *files),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 env=3Denv,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 check=3DFalse,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 stdout=3Dsubprocess.PIPE,<br>
&gt; diff --git a/tests/qemu-iotests/mypy.ini b/tests/qemu-iotests/mypy.ini=
<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..4c0339f5589<br>
&gt; --- /dev/null<br>
&gt; +++ b/tests/qemu-iotests/mypy.ini<br>
&gt; @@ -0,0 +1,12 @@<br>
&gt; +[mypy]<br>
&gt; +disallow_any_generics =3D True<br>
&gt; +disallow_incomplete_defs =3D True<br>
&gt; +disallow_subclassing_any =3D True<br>
&gt; +disallow_untyped_decorators =3D True<br>
&gt; +implicit_reexport =3D False<br>
<br>
Out of curiosity: Any reason you chose to invert this one, but none of <br>
the rest?=C2=A0 (i.e. no_implicit_optional =3D True -&gt; implicit_optional=
 =3D <br>
False; or disallow* =3D True -&gt; allow* =3D False)<br>
<br></blockquote><div><br></div><div>Anything written as &#39;--no-xxx&#39;=
 I wrote as &#39;xxx =3D False&#39;, but &quot;implicit_optional =3D False&=
quot; isn&#39;t a supported option, so that one kept the &quot;no&quot; in =
it.<br></div><br><div>--js</div><div><br></div></div></div>

--000000000000abac9905ce3ce8de--


