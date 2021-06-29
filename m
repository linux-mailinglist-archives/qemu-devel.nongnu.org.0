Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D50A3B75D4
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 17:47:39 +0200 (CEST)
Received: from localhost ([::1]:36374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyFxZ-0004hJ-0r
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 11:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyFvw-0003M3-0V
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:46:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyFvs-00009F-8Z
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:45:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624981551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=scVq77QxvaEYHxEgUr6WCTtpcCYd/AQjdtIytflm8yE=;
 b=IO1DsxBvJZPn2AwdxR+xURKoCwdfqQpFd4cul15B+RM88qIZ7kILH4GgZh2NT2sCHsEJ1i
 NVXmyy8CFFkPmFqhdvqylJs7ZS6X7noRKsBs+4qQS1Z7oO1bTGGuW+nJrwRIQOQ7fo0rII
 q1+MEBAQypQm22JSEdkGis0dfueas7A=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-5jkIiQLVNtiF7NUMQsvGvw-1; Tue, 29 Jun 2021 11:45:48 -0400
X-MC-Unique: 5jkIiQLVNtiF7NUMQsvGvw-1
Received: by mail-oo1-f71.google.com with SMTP id
 r26-20020a4acb1a0000b029024c388a4835so10208285ooq.7
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 08:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=scVq77QxvaEYHxEgUr6WCTtpcCYd/AQjdtIytflm8yE=;
 b=TszMfN5e3cAXfBpZFGyjLea9jOwrLb2v9my+gKV45wwdntj30s4VtpRYdSKBbGnm96
 ZalpAw6s7IBVo66bLhIkO1Qp+lueEFotCyJHaafLiRFZfQr2ZHVJRTQIrgYp4OMbJzOV
 koj7+tfHxSvuG6ZYRku4NkQTEczJ4CX67aJ1EIZXMZGO9+mR1sUukrEY5mBbP3AnSL3D
 Bh3Uge8Lqq1a0eC8HOPVmskQ7EOo8AvMGjDtKTx/+zUpgZ0DvXqd6F6762iG66XoAhfm
 yewXU0ShlAzkFqzD01lv+roxEaXZH1o/741A5/8r5yz091L6qp2qK/Ld7v3M+RAcX8Fx
 O54w==
X-Gm-Message-State: AOAM530rwbiF8OwI8f21KvzZs06wqCr6xmcrMlHhfnJ2RMP+sRLqxiXC
 S3xQg84cb7aEYf/wq3CoMjudUj4jcLYF15rRUcK3lXb79mU7h/kFPRYoJ5TMCDgHtTcUPXmgqm5
 aBz+3pn5h4vAzAagEc3Z0tl0HxPRotbo=
X-Received: by 2002:a05:6808:83:: with SMTP id
 s3mr8567934oic.168.1624981548170; 
 Tue, 29 Jun 2021 08:45:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyG9+7lTwFpEg/pwe6O5SzVvWPTot9USf1wk9Aujv18qccVuIdNPA+gjmWwMcXWbTlg1CgWvMzgDLpDmDMG6Y=
X-Received: by 2002:a05:6808:83:: with SMTP id
 s3mr8567922oic.168.1624981547989; 
 Tue, 29 Jun 2021 08:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210625154540.783306-1-jsnow@redhat.com>
 <20210625154540.783306-9-jsnow@redhat.com>
 <f27098f2-80ee-3eea-b991-de85d94bd6a7@redhat.com>
In-Reply-To: <f27098f2-80ee-3eea-b991-de85d94bd6a7@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 29 Jun 2021 11:45:37 -0400
Message-ID: <CAFn=p-YqXcTnELR3HQ4OKynocMixfzyRAjBRAV0gzv4G7SFSoQ@mail.gmail.com>
Subject: Re: [PATCH 08/11] python: add 'make check-venv' invocation
To: wainersm@redhat.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000ef533205c5e97f97"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ef533205c5e97f97
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 28, 2021 at 5:40 PM Wainer dos Santos Moschetta <
wainersm@redhat.com> wrote:

>
> On 6/25/21 12:45 PM, John Snow wrote:
> > This is a *third* way to run the Python tests. Unlike the first two
> > (check-pipenv, check-tox), this version does not require any specific
> > interpreter version -- making it a lot easier to tell people to run it
> > as a quick smoketest prior to submission to GitLab CI.
> >
> > Summary:
> >
> >    Checked via GitLab CI:
> >      - check-pipenv: tests our oldest python & dependencies
> >      - check-tox: tests newest dependencies on all non-EOL python
> versions
> >    Executed only incidentally:
> >      - check-venv: tests newest dependencies on whichever python version
> >
> > ('make check' does not set up any environment at all, it just runs the
> > tests in your current environment. All four invocations perform the
> > exact same tests, just in different execution environments.)
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   python/Makefile | 35 ++++++++++++++++++++++++++++++++---
> >   1 file changed, 32 insertions(+), 3 deletions(-)
> >
> > diff --git a/python/Makefile b/python/Makefile
> > index 5cb8378b81..76bb24e671 100644
> > --- a/python/Makefile
> > +++ b/python/Makefile
> > @@ -1,4 +1,6 @@
> > -.PHONY: help pipenv check-pipenv check clean distclean develop
> > +.PHONY: help pipenv venv check-venv check-pipenv check clean distclean
> develop
> > +
> btw, check-tox is missed here ^
>

Oops, thanks! I am not sure it winds up mattering, but writing Makefiles
feels like religion. I just follow the same steps and pray at the altar.


> > +QEMU_VENV_DIR=~/.cache/qemu-pyvenv
>
> A few suggestions:
>
> 1. For the sake of consistence with others temporary directories
> created, use QEMU_VENV_DIR=<path-to-qemu-src>/.devvenv
>
>
Sure, straight in this folder, like .tox and .venv you mean?

(I'd rename .venv to .pipenv, but pipenv doesn't let you name this folder,
annoyingly ...)


> 2. Reword to 'devvenv' or 'dev-venv' (or something similar), instead of
> 'venv', the directories and Make targets. IMHO it will make the purpose
> of the targets a bit clear.
>
>
Sure, I'll do that -- .dev-venv works for me.

>
> What do you think John?
>
>
I think that it's hot outside :)


> - Wainer
>

Thanks!
--js

--000000000000ef533205c5e97f97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 28, 2021 at 5:40 PM Waine=
r dos Santos Moschetta &lt;<a href=3D"mailto:wainersm@redhat.com">wainersm@=
redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
On 6/25/21 12:45 PM, John Snow wrote:<br>
&gt; This is a *third* way to run the Python tests. Unlike the first two<br=
>
&gt; (check-pipenv, check-tox), this version does not require any specific<=
br>
&gt; interpreter version -- making it a lot easier to tell people to run it=
<br>
&gt; as a quick smoketest prior to submission to GitLab CI.<br>
&gt;<br>
&gt; Summary:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 Checked via GitLab CI:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - check-pipenv: tests our oldest python &amp; depe=
ndencies<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - check-tox: tests newest dependencies on all non-=
EOL python versions<br>
&gt;=C2=A0 =C2=A0 Executed only incidentally:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - check-venv: tests newest dependencies on whichev=
er python version<br>
&gt;<br>
&gt; (&#39;make check&#39; does not set up any environment at all, it just =
runs the<br>
&gt; tests in your current environment. All four invocations perform the<br=
>
&gt; exact same tests, just in different execution environments.)<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0python/Makefile | 35 ++++++++++++++++++++++++++++++++---<b=
r>
&gt;=C2=A0 =C2=A01 file changed, 32 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/python/Makefile b/python/Makefile<br>
&gt; index 5cb8378b81..76bb24e671 100644<br>
&gt; --- a/python/Makefile<br>
&gt; +++ b/python/Makefile<br>
&gt; @@ -1,4 +1,6 @@<br>
&gt; -.PHONY: help pipenv check-pipenv check clean distclean develop<br>
&gt; +.PHONY: help pipenv venv check-venv check-pipenv check clean distclea=
n develop<br>
&gt; +<br>
btw, check-tox is missed here ^<br></blockquote><div><br></div><div>Oops, t=
hanks! I am not sure it winds up mattering, but writing Makefiles feels lik=
e religion. I just follow the same steps and pray at the altar.<br></div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +QEMU_VENV_DIR=3D~/.cache/qemu-pyvenv<br>
<br>
A few suggestions:<br>
<br>
1. For the sake of consistence with others temporary directories <br>
created, use QEMU_VENV_DIR=3D&lt;path-to-qemu-src&gt;/.devvenv<br>
<br></blockquote><div><br></div><div>Sure, straight in this folder, like .t=
ox and .venv you mean?</div><div><br></div><div>(I&#39;d rename .venv to .p=
ipenv, but pipenv doesn&#39;t let you name this folder, annoyingly ...)<br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
2. Reword to &#39;devvenv&#39; or &#39;dev-venv&#39; (or something similar)=
, instead of <br>
&#39;venv&#39;, the directories and Make targets. IMHO it will make the pur=
pose <br>
of the targets a bit clear.<br>
<br></blockquote><div><br></div><div>Sure, I&#39;ll do that -- .dev-venv wo=
rks for me.<br></div>=C2=A0<blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
What do you think John?<br>
<br></blockquote><div><br></div><div>I think that it&#39;s hot outside :)<b=
r></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
- Wainer<br></blockquote><div><br></div><div>Thanks!</div><div>--js<br></di=
v></div></div>

--000000000000ef533205c5e97f97--


