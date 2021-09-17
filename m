Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6B140FEB8
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 19:38:27 +0200 (CEST)
Received: from localhost ([::1]:34112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRHog-00045g-De
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 13:38:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mRHmk-0003He-2Y
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 13:36:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mRHmi-00053L-09
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 13:36:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631900182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vj/z7oT765yMRYhzngn0H9XHaTh3swTyDyAeRV8NSyM=;
 b=W4aFYSHZzdxjYbZpQgLin5GM1NmIWzzM7tFQVPWFpzHwMw5/BofQG2C7PgMu3zvGEF7kFD
 kGXN9mxKOFw+gJe1bNDkKIN0/lbKbBtHyLGCFh8n3JrFc0Ptp8XQhleWmarJHSp9ulq1ss
 m1jg2OmJ4qtvGl7d7oymmiUZyeNXkAc=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-MImcrFXtOM20-GmGej8goQ-1; Fri, 17 Sep 2021 13:36:18 -0400
X-MC-Unique: MImcrFXtOM20-GmGej8goQ-1
Received: by mail-oi1-f197.google.com with SMTP id
 bg9-20020a056808178900b0026d5d991da1so34168680oib.22
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 10:36:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vj/z7oT765yMRYhzngn0H9XHaTh3swTyDyAeRV8NSyM=;
 b=ewxuPj7WKgTt+PAsEIVjk1Fav7YanrAr/Uja9eh4S2GKo6vKkdsMYPEQQFWbCiJSpI
 RCTR88C6iHL1ZxMoyakvj28ypUbY4WSYha5Om/kkLBiAvcfIwSMpoMdXeIL4ho2R3C8E
 lVIBqwmznspzec6qEevy23ogkeHwUp9vL56u+8MKesnLlx2xXcXacp0QRNi9rqoHp2oK
 QfocFQWE/laIesBvEPzqWwzG+VUuWw1NZSKW3FU7zQc89aAGGeseOYB8GM7r94IIHDjl
 rv2dw/mNvVg50zDkrpKejuRqkbW3X5JNGNcX2YRKloUa4hf0Aduup1kLzpnmLI9ckpKt
 GDVw==
X-Gm-Message-State: AOAM530epO+rxa6JF/pmTJK82J1dj0mbw/Wc1dmoieRFPdx6k14Z56gQ
 FQ4zmu+pYFZOQ+RLVbtVfCaooimkyDmhYsXg4oE+gALAuOivPxxS2KpJAsUHVaJRQRsnut5CAom
 euT0TLosI3kO6agz/om+hEY5EU/PXQ2k=
X-Received: by 2002:a05:6830:310c:: with SMTP id
 b12mr7327797ots.252.1631900178110; 
 Fri, 17 Sep 2021 10:36:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzARN2KD4vSqgu6vldYA/qUJSfZw0ontrhCcVzEshDFLYCnDMNUyzCRXsSYJzuGCUs2Pe6T6YbjAcvCRK+N6dU=
X-Received: by 2002:a05:6830:310c:: with SMTP id
 b12mr7327782ots.252.1631900177939; 
 Fri, 17 Sep 2021 10:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-6-jsnow@redhat.com>
 <0d227ccb-f6d8-3382-8f51-b3eeede9d8ef@redhat.com>
In-Reply-To: <0d227ccb-f6d8-3382-8f51-b3eeede9d8ef@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 17 Sep 2021 13:36:07 -0400
Message-ID: <CAFn=p-Zo1pRBBLkijP68QZi+DHNBQxBPo1Tq111=ArnGuJKWGQ@mail.gmail.com>
Subject: Re: [PATCH 05/15] python/qmp: add send_fd_scm directly to
 QEMUMonitorProtocol
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000006a583e05cc345ea6"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006a583e05cc345ea6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 9:21 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 17.09.21 07:40, John Snow wrote:
> > It turns out you can do this directly from Python ... and because of
> > this, you don't need to worry about setting the inheritability of the
> > fds or spawning another process.
> >
> > Doing this is helpful because it allows QEMUMonitorProtocol to keep its
> > file descriptor and socket object as private implementation details.
> >
> > *that* is helpful in turn because it allows me to write a compatible,
> >   alternative implementation.
>
> Bit of a weird indentation here.
>
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   python/qemu/machine/machine.py | 44 +++++++--------------------------=
-
> >   python/qemu/qmp/__init__.py    | 21 +++++++---------
> >   2 files changed, 18 insertions(+), 47 deletions(-)
> >
> > diff --git a/python/qemu/machine/machine.py
> b/python/qemu/machine/machine.py
> > index ae945ca3c9..1c6532a3d6 100644
> > --- a/python/qemu/machine/machine.py
> > +++ b/python/qemu/machine/machine.py
> > @@ -213,48 +213,22 @@ def add_fd(self: _T, fd: int, fdset: int,
> >       def send_fd_scm(self, fd: Optional[int] =3D None,
> >                       file_path: Optional[str] =3D None) -> int:
>
> [...]
>
> >           if file_path is not None:
> >               assert fd is None
> > -            fd_param.append(file_path)
> > +            with open(file_path, "rb") as passfile:
> > +                fd =3D passfile.fileno()
> > +                self._qmp.send_fd_scm(fd)
>
> Seems a bit strange to send an fd that is then immediately closed, but
> that=E2=80=99s what socket_scm_helper did, and so it looks like the fd is
> effectively duplicated.  OK then.
>
>
Same boat. It's weird, but it seems to work, and it's how the old interface
(ultimately) behaved, so ... https://i.imgur.com/O0CQXoh.png


> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>
>

--0000000000006a583e05cc345ea6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 17, 2021 at 9:21 AM Hanna=
 Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 17.09.2=
1 07:40, John Snow wrote:<br>
&gt; It turns out you can do this directly from Python ... and because of<b=
r>
&gt; this, you don&#39;t need to worry about setting the inheritability of =
the<br>
&gt; fds or spawning another process.<br>
&gt;<br>
&gt; Doing this is helpful because it allows QEMUMonitorProtocol to keep it=
s<br>
&gt; file descriptor and socket object as private implementation details.<b=
r>
&gt;<br>
&gt; *that* is helpful in turn because it allows me to write a compatible,<=
br>
&gt;=C2=A0 =C2=A0alternative implementation.<br>
<br>
Bit of a weird indentation here.<br>
<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0python/qemu/machine/machine.py | 44 +++++++---------------=
------------<br>
&gt;=C2=A0 =C2=A0python/qemu/qmp/__init__.py=C2=A0 =C2=A0 | 21 +++++++-----=
----<br>
&gt;=C2=A0 =C2=A02 files changed, 18 insertions(+), 47 deletions(-)<br>
&gt;<br>
&gt; diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/mach=
ine.py<br>
&gt; index ae945ca3c9..1c6532a3d6 100644<br>
&gt; --- a/python/qemu/machine/machine.py<br>
&gt; +++ b/python/qemu/machine/machine.py<br>
&gt; @@ -213,48 +213,22 @@ def add_fd(self: _T, fd: int, fdset: int,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def send_fd_scm(self, fd: Optional[int] =3D =
None,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0file_path: Optional[str] =3D None) -&gt; int:<br>
<br>
[...]<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if file_path is not None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert fd is Non=
e<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fd_param.append(file_path)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(file_path, &quot;=
rb&quot;) as passfile:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D passfi=
le.fileno()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._qmp.sen=
d_fd_scm(fd)<br>
<br>
Seems a bit strange to send an fd that is then immediately closed, but <br>
that=E2=80=99s what socket_scm_helper did, and so it looks like the fd is <=
br>
effectively duplicated.=C2=A0 OK then.<br>
<br></blockquote><div><br></div><div>Same boat. It&#39;s weird, but it seem=
s to work, and it&#39;s how the old interface (ultimately) behaved, so ... =
<a href=3D"https://i.imgur.com/O0CQXoh.png">https://i.imgur.com/O0CQXoh.png=
</a></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
Reviewed-by: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" target=3D=
"_blank">hreitz@redhat.com</a>&gt;<br>
<br>
</blockquote></div></div>

--0000000000006a583e05cc345ea6--


