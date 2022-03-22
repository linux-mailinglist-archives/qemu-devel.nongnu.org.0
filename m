Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 952CD4E4434
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 17:28:03 +0100 (CET)
Received: from localhost ([::1]:38742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWhMY-0001Uy-Ni
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 12:28:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWhKQ-0007cc-QQ
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:25:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWhKO-0006mI-4Z
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:25:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647966347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xfNFy5UUGMzD6TDrWNAzIpWJt7L0wPW+MCF/my/RsdY=;
 b=WTX1p6HOOCbGmP83cMVLmh57hBMpum/THhSukcKE5D4bhxNcd0tYs1nSp8tWFnWdFnYjFd
 ENRC9pbjQc6x3Q6bRzsWEy2tNsf3ycZVzMxIdaOU9a4dFv2YVXafxn+1fMYbrBlowe4xmB
 UKMg7cXm8ChPO7xZV108750tiQxmgfo=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-qSfxHBSROZyBxUui1KL0aQ-1; Tue, 22 Mar 2022 12:25:45 -0400
X-MC-Unique: qSfxHBSROZyBxUui1KL0aQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 d11-20020ab0724b000000b003513507a46bso7142690uap.16
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 09:25:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xfNFy5UUGMzD6TDrWNAzIpWJt7L0wPW+MCF/my/RsdY=;
 b=2yZJjMJadOTpPX2ZTh8gOm9fM1s5TNmSqFKNtMEp2RA1GsFeL5/elkkPlTPjSHGbux
 5AyshrGLuiwpMKUtGp1HuU0m96CVmQohKJ401srVIAiJPVhPz1SyzFPp4IGVVnmYsJHS
 JhLup/H7MIg2e9PRjvJ/UL1g7PUxX4Lff/QjWkpuOt1o87DRUnV5e/Rg8J0QBpUV5t1E
 K8WUfvzV0P7rFbHFmXH3aRO9Dzx6giM0cefhmpOOgZdW7TSjPhdFPfIfCeeOuGBSGfJC
 yC3MpKFi2n8ZhW2JJ2aHZuWwFh7zOs7FUARzhBKORANmXdQZV0BAOHqa6pbDQfXh6iK1
 TFXw==
X-Gm-Message-State: AOAM533G9oQXxfIyzFAOsXaDrrApR0jIXXdZnn6ZFbX6Fi9yRZ24senY
 PHE8HmCSzV/Oq1WK8RQg2x5opIOh0wxDV6t5v18phXzST/8nObQn5hYdhLg6p11lxEKBnCdQW8I
 K7Nh06WR4F4NSdZkTqp4eMlxqi9X3JJg=
X-Received: by 2002:a05:6122:a11:b0:33f:c7d:8040 with SMTP id
 17-20020a0561220a1100b0033f0c7d8040mr4415710vkn.1.1647966345055; 
 Tue, 22 Mar 2022 09:25:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbxPZxFVPAUzW1+o7vTidcH4ntGMLVr3BPErM8FrHFg9xvi4dNtjSMxDac7PfpVRM+Xidal/GCurhhrSKVbqc=
X-Received: by 2002:a05:6122:a11:b0:33f:c7d:8040 with SMTP id
 17-20020a0561220a1100b0033f0c7d8040mr4415700vkn.1.1647966344851; Tue, 22 Mar
 2022 09:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-6-jsnow@redhat.com>
 <62d645b5-31e8-4889-c87c-83e0fac18d10@redhat.com>
In-Reply-To: <62d645b5-31e8-4889-c87c-83e0fac18d10@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 22 Mar 2022 12:25:35 -0400
Message-ID: <CAFn=p-aKeSS2H0MSYgU4O-N86jxHJcDBT11o2=zGb8n9SLP_fQ@mail.gmail.com>
Subject: Re: [PATCH 05/15] iotests: create generic qemu_tool() function
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000096608505dad11003"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000096608505dad11003
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 22, 2022, 10:49 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 18.03.22 21:36, John Snow wrote:
> > reimplement qemu_img() in terms of qemu_tool() in preparation for doing
> > the same with qemu_io().
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/qemu-iotests/iotests.py | 37 +++++++++++++++++++++++-----------=
-
> >   1 file changed, 24 insertions(+), 13 deletions(-)
> >
> > diff --git a/tests/qemu-iotests/iotests.py
> b/tests/qemu-iotests/iotests.py
> > index 6cd8374c81..974a2b0c8d 100644
> > --- a/tests/qemu-iotests/iotests.py
> > +++ b/tests/qemu-iotests/iotests.py
> > @@ -207,15 +207,13 @@ def qemu_img_create_prepare_args(args: List[str])
> -> List[str]:
> >
> >       return result
> >
> > -def qemu_img(*args: str, check: bool =3D True, combine_stdio: bool =3D=
 True
> > +
> > +def qemu_tool(*args: str, check: bool =3D True, combine_stdio: bool =
=3D True
> >                ) -> subprocess.CompletedProcess[str]:
> >       """
> > -    Run qemu_img and return the status code and console output.
> > +    Run a qemu tool and return its status code and console output.
> >
> > -    This function always prepends QEMU_IMG_OPTIONS and may further alt=
er
> > -    the args for 'create' commands.
> > -
> > -    :param args: command-line arguments to qemu-img.
> > +    :param args: command-line arguments to a QEMU cli tool.
>
> This makes me ask how I am to specify which tool to use.  Perhaps it
> should just be =E2=80=9Cfull command line to run=E2=80=9D or something.
>
> Might be nice=E2=84=A2, but:
>

I see what you mean. I did away with the "tool name" parameter because we
were only using it for an error message print I also removed.

I'll update the docstring a little to make what's going on more clear.
Maybe someday (tm) I could split args into (tool, args) parameters to make
it more explicit, and change the way the environment variables are parsed
to keep the tool/args separate.

Pretty minor kind of thing, though, so I'm not in a hurry.


> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>
>

--00000000000096608505dad11003
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Mar 22, 2022, 10:49 AM Hanna Reitz &lt;<a href=
=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On 18.03.22 21:36, John Snow wrote:<br>
&gt; reimplement qemu_img() in terms of qemu_tool() in preparation for doin=
g<br>
&gt; the same with qemu_io().<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/iotests.py | 37 +++++++++++++++++++++++=
------------<br>
&gt;=C2=A0 =C2=A01 file changed, 24 insertions(+), 13 deletions(-)<br>
&gt;<br>
&gt; diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotest=
s.py<br>
&gt; index 6cd8374c81..974a2b0c8d 100644<br>
&gt; --- a/tests/qemu-iotests/iotests.py<br>
&gt; +++ b/tests/qemu-iotests/iotests.py<br>
&gt; @@ -207,15 +207,13 @@ def qemu_img_create_prepare_args(args: List[str]=
) -&gt; List[str]:<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return result<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -def qemu_img(*args: str, check: bool =3D True, combine_stdio: bool =
=3D True<br>
&gt; +<br>
&gt; +def qemu_tool(*args: str, check: bool =3D True, combine_stdio: bool =
=3D True<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ) -&gt; subproc=
ess.CompletedProcess[str]:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt; -=C2=A0 =C2=A0 Run qemu_img and return the status code and console out=
put.<br>
&gt; +=C2=A0 =C2=A0 Run a qemu tool and return its status code and console =
output.<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 This function always prepends QEMU_IMG_OPTIONS and may =
further alter<br>
&gt; -=C2=A0 =C2=A0 the args for &#39;create&#39; commands.<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 :param args: command-line arguments to qemu-img.<br>
&gt; +=C2=A0 =C2=A0 :param args: command-line arguments to a QEMU cli tool.=
<br>
<br>
This makes me ask how I am to specify which tool to use.=C2=A0 Perhaps it <=
br>
should just be =E2=80=9Cfull command line to run=E2=80=9D or something.<br>
<br>
Might be nice=E2=84=A2, but:<br></blockquote></div></div><div dir=3D"auto">=
<br></div><div dir=3D"auto">I see what you mean. I did away with the &quot;=
tool name&quot; parameter because we were only using it for an error messag=
e print I also removed.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
I&#39;ll update the docstring a little to make what&#39;s going on more cle=
ar. Maybe someday (tm) I could split args into (tool, args) parameters to m=
ake it more explicit, and change the way the environment variables are pars=
ed to keep the tool/args separate.</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Pretty minor kind of thing, though, so I&#39;m not in a hurry.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
<br>
Reviewed-by: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" target=3D=
"_blank" rel=3D"noreferrer">hreitz@redhat.com</a>&gt;<br>
<br>
</blockquote></div></div></div>

--00000000000096608505dad11003--


