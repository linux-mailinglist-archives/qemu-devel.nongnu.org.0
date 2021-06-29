Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D003B75C8
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 17:41:52 +0200 (CEST)
Received: from localhost ([::1]:59356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyFrx-0000iQ-GR
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 11:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyFqs-0008PY-Vb
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:40:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyFqm-0005FT-P6
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:40:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624981235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jig4TQQcGXBFG99p8aPcXllEqF1hECTTRjCGTT8OkSo=;
 b=TYWiCU8dXjEwzw85BY0j/vUUInCX2W5ElBzdy2kmyCKvLhsdmazWRpqtjMD4dCE0IHif6B
 1nPpsNBKlBnCD2v/YjxysQEh3FUrrMPMf4uVfWY1SqSeWV9lRNjAurONvznvGAzYnWhVVE
 WTFD3vPyznMkGbFMXIIiqXO11gGfFGk=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-D4mEkN3DPtKT6F17pN-Kiw-1; Tue, 29 Jun 2021 11:40:33 -0400
X-MC-Unique: D4mEkN3DPtKT6F17pN-Kiw-1
Received: by mail-oi1-f198.google.com with SMTP id
 d196-20020aca4fcd0000b029023e5c96e030so239287oib.5
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 08:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jig4TQQcGXBFG99p8aPcXllEqF1hECTTRjCGTT8OkSo=;
 b=oLObqmVNHnvfdTz4mv6o712+sxtk8Sh8tJhjkMcfJpwgmfPLobLc/7rQEhtEiQAAU1
 ceI4bYwt/n9gBkQSX5e6Cpn9kSSKbVXB74b1CvEjwVLdN8jKnb3BJE8NCryqSvxbaAM+
 rp8Ifdj3EL3xvBQkhc/fWnTMD3FtZSFy2bM2tb0pFRTOyscKZF/M7PFO1cV7Y6mP0T4k
 JCl40bCz2e0Ox99sFXAImN8IUhGCqdCQmfg/3ZPTz5O2niHwyyx734HgmuOitHMPtmIU
 hUoIsDF81G4p4lxUUhV8B4JpUI5/4bD29ndwsK+QrDQRp1uQBVmTejzENSw0lD+6X6SA
 VeWg==
X-Gm-Message-State: AOAM532/MQpWTkRVGcdNyXfC9PoiCTcCte4UkMQftrVFgo9Y9m/oTTZ2
 3pSsxZJogDYlaoqzaYfHCdaCWyciSzF+twTxOIjfbJs1LL/R4kShTwi0qniGlZios2tWAZAEMr7
 L78Tw5PW8TMhVF8bsUrX70Dvx/+EZfe4=
X-Received: by 2002:a05:6808:83:: with SMTP id
 s3mr8549669oic.168.1624981232287; 
 Tue, 29 Jun 2021 08:40:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTc3ptcVc/5lf8DqfanDHdp9y2ppn52mxBREXK6lsly4VDfHEHo99fzoB3VDnWNb+ucrOxq/fTO02CuYikk8Q=
X-Received: by 2002:a05:6808:83:: with SMTP id
 s3mr8549653oic.168.1624981232130; 
 Tue, 29 Jun 2021 08:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210625154540.783306-1-jsnow@redhat.com>
 <20210625154540.783306-8-jsnow@redhat.com>
 <76b9d2ac-75f8-faa7-6198-16f5294004e9@redhat.com>
In-Reply-To: <76b9d2ac-75f8-faa7-6198-16f5294004e9@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 29 Jun 2021 11:40:21 -0400
Message-ID: <CAFn=p-ZLRSGjS4Gbd7iYqwo66umegwWEHR0o0a4UksqMrinEPA@mail.gmail.com>
Subject: Re: [PATCH 07/11] python: update help text for check-tox
To: wainersm@redhat.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000001baa9d05c5e96de0"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

--0000000000001baa9d05c5e96de0
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 28, 2021 at 5:16 PM Wainer dos Santos Moschetta <
wainersm@redhat.com> wrote:

> Hi,
>
> On 6/25/21 12:45 PM, John Snow wrote:
> > Move it up near the check-pipenv help text, and update it to suggest
> parity.
> >
> > (At the time I first added it, I wasn't sure if I would be keeping it,
> > but I've come to appreciate it as it has actually helped uncover bugs I
> > would not have noticed without it. It should stay.)
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   python/Makefile | 8 ++++++--
> >   1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/python/Makefile b/python/Makefile
> > index 07ad73ccd0..5cb8378b81 100644
> > --- a/python/Makefile
> > +++ b/python/Makefile
> > @@ -9,13 +9,17 @@ help:
> >       @echo "    Requires: Python 3.6 and pipenv."
> >       @echo "    Hint (Fedora): 'sudo dnf install python3.6 pipenv'"
> >       @echo ""
> > +     @echo "make check-tox:"
> > +     @echo "    Run tests against multiple python versions."
> > +     @echo "    These tests use the newest dependencies."
> > +     @echo "    Requires: Python 3.6-3.10 and tox."
>
> Nit: I'm not sure it is clear '3.6-3.10' is a range rather than a
> specific version.
>

It was meant to be a range. Would you prefer "3.6 - 3.10" instead, then?


>
>
- Wainer
>

--0000000000001baa9d05c5e96de0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 28, 2021 at 5:16 PM Waine=
r dos Santos Moschetta &lt;<a href=3D"mailto:wainersm@redhat.com">wainersm@=
redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi,<br>
<br>
On 6/25/21 12:45 PM, John Snow wrote:<br>
&gt; Move it up near the check-pipenv help text, and update it to suggest p=
arity.<br>
&gt;<br>
&gt; (At the time I first added it, I wasn&#39;t sure if I would be keeping=
 it,<br>
&gt; but I&#39;ve come to appreciate it as it has actually helped uncover b=
ugs I<br>
&gt; would not have noticed without it. It should stay.)<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0python/Makefile | 8 ++++++--<br>
&gt;=C2=A0 =C2=A01 file changed, 6 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/python/Makefile b/python/Makefile<br>
&gt; index 07ad73ccd0..5cb8378b81 100644<br>
&gt; --- a/python/Makefile<br>
&gt; +++ b/python/Makefile<br>
&gt; @@ -9,13 +9,17 @@ help:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;=C2=A0 =C2=A0 Requires: Python 3=
.6 and pipenv.&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;=C2=A0 =C2=A0 Hint (Fedora): &#3=
9;sudo dnf install python3.6 pipenv&#39;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0@echo &quot;make check-tox:&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0@echo &quot;=C2=A0 =C2=A0 Run tests against multi=
ple python versions.&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0@echo &quot;=C2=A0 =C2=A0 These tests use the new=
est dependencies.&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0@echo &quot;=C2=A0 =C2=A0 Requires: Python 3.6-3.=
10 and tox.&quot;<br>
<br>
Nit: I&#39;m not sure it is clear &#39;3.6-3.10&#39; is a range rather than=
 a <br>
specific version.<br></blockquote><div><br></div><div>It was meant to be a =
range. Would you prefer &quot;3.6 - 3.10&quot; instead, then?<br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 <br><=
/blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
- Wainer<br>
</blockquote></div></div>

--0000000000001baa9d05c5e96de0--


