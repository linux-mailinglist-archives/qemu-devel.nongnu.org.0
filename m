Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D59848B7A5
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 20:51:55 +0100 (CET)
Received: from localhost ([::1]:45044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7NBQ-0006Q5-7e
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 14:51:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n7N8t-0005Bo-Cd
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:49:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n7N8q-0007YB-KU
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:49:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641930551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ytUCwR1PIjzIdt92s93nHEsK5XGwfdfuE7qr437QVFg=;
 b=X4UZ/ULQ32L+ZJtOXHz0odc/g7WCqauydfNpBOwl/OjpqeKnbXf2TRql4lkG5WXiTXaVrF
 6+TtzNr17kbtUI9i2vBsNNVg0fj55I5jyRHVM38axLtQdipaL0VgjH/+5JcrejnZleTawT
 GVYs29uS/NgWbsoPVxdNnfql3tqFGQs=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-KCt7B4MCPoGr_aVs7bevEw-1; Tue, 11 Jan 2022 14:49:08 -0500
X-MC-Unique: KCt7B4MCPoGr_aVs7bevEw-1
Received: by mail-ua1-f71.google.com with SMTP id
 t14-20020ab0550e000000b00305905ffc31so149169uaa.16
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 11:49:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ytUCwR1PIjzIdt92s93nHEsK5XGwfdfuE7qr437QVFg=;
 b=1i3B0BGa4Y7WiHC4n6iXopkvlmSRjyWbRP703919DyhuH9BZEsp7Z9H+M3a9SO7rk/
 l06q1YNF8K4fHgvDWjn3q4wg5ddUQqkOaFhudaJCkum7V2sKbTN7hdv9phe0KVEvpaLF
 oEX2U3eoP8r/Y/ePPx7hA1xi+UO3/3FMHk7XvJ/PyZ8/pIw4ObTFFkUN3w7sca2TssPO
 wGdBRQ4VpEELrVG5awVymD3UgBXQMQ1oFxyrlW2Q+nK6VwrETK6PBZAhKRIqr4mnagGa
 kJ2nvtaIZA0uhmvsh1nM6aset11JqKPbLHrOS0CsPUQtq6ahOrgj/Q0IvT8pT5sWFF5Q
 y5zA==
X-Gm-Message-State: AOAM533IxhyZZnA2ZkYMeJ3P8lKqjlqZ3OCIEWiMSi24GnhU2HlhBTcS
 C/mZekWZpICJ5kaVfy59ccI8X4wq04URhX6ytKSOOkYHDSf0zLzFBcJaWOxhJ+ZEUmHnsyoon6q
 Zvb5HFSEjFhHaZ4aEIiOJd19xAdsw6sk=
X-Received: by 2002:a1f:2d8a:: with SMTP id t132mr2964794vkt.3.1641930547899; 
 Tue, 11 Jan 2022 11:49:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxR02WDolAUDB5gOdCE5bKSXxlbKIJAYcOw6kFbYeWZrrHTx3LuqnUAJpQm6N9UE9TYfNJnBp5MBluDSQMDbTM=
X-Received: by 2002:a1f:2d8a:: with SMTP id t132mr2964780vkt.3.1641930547635; 
 Tue, 11 Jan 2022 11:49:07 -0800 (PST)
MIME-Version: 1.0
References: <20211215210634.3779791-1-jsnow@redhat.com>
 <20211215210634.3779791-18-jsnow@redhat.com>
 <YbsZe9A/Lf2g1Xk8@redhat.com>
 <CAFn=p-bPUsw19uW=gfzGBwT5zDm3t4QHCvzf0nJjbcwcOKkA=g@mail.gmail.com>
 <YbyUlrmexR77cbip@redhat.com>
In-Reply-To: <YbyUlrmexR77cbip@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 11 Jan 2022 14:48:55 -0500
Message-ID: <CAFn=p-ZmBfThKMJ-vWyvJ8b7ccD+mv=TynSPDoCM-tdne5jEYw@mail.gmail.com>
Subject: Re: [RFC qemu.qmp PATCH 17/24] Makefile: add build and publish targets
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000009c49c05d553bf27"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000009c49c05d553bf27
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 17, 2021 at 8:46 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Thu, Dec 16, 2021 at 06:35:23PM -0500, John Snow wrote:
> > On Thu, Dec 16, 2021 at 5:48 AM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com>
> > wrote:
> >
> > > On Wed, Dec 15, 2021 at 04:06:27PM -0500, John Snow wrote:
> > > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > > ---
> > > >  Makefile | 32 ++++++++++++++++++++++++++++++++
> > > >  1 file changed, 32 insertions(+)
> > > >
> > > > diff --git a/Makefile b/Makefile
> > > > index 97d737a..81bfca8 100644
> > > > --- a/Makefile
> > > > +++ b/Makefile
> > > > @@ -110,3 +110,35 @@ distclean: clean
> > > >       rm -f .coverage .coverage.*
> > > >       rm -rf htmlcov/
> > > >       rm -rf test-results/
> > > > +
> > > > +.PHONY: pristine
> > > > +pristine:
> > > > +     @git diff-files --quiet --ignore-submodules -- || \
> > > > +             (echo "You have unstaged changes."; exit 1)
> > > > +     @git diff-index --cached --quiet HEAD --ignore-submodules --
> || \
> > > > +             (echo "Your index contains uncommitted changes."; exi=
t
> 1)
> > > > +     @[ -z "$(shell git ls-files -o)" ] || \
> > > > +             (echo "You have untracked files: $(shell git ls-files
> > > -o)"; exit 1)
> > > > +
> > > > +dist: setup.cfg setup.py Makefile README.rst
> > > > +     python3 -m build
> > > > +     @touch dist
> > > > +
> > > > +.PHONY: pre-publish
> > > > +pre-publish: pristine dist
> > > > +     @git describe --exact-match 2>/dev/null || \
> > > > +             (echo -e "\033[0;31mThere is no annotated tag for thi=
s
> > > commit.\033[0m"; exit 1)
> > > > +     python3 -m twine check --strict dist/*
> > > > +     git push -v --atomic --follow-tags --dry-run
> > > > +
> > > > +.PHONY: publish
> > > > +publish: pre-publish
> > > > +     # Set the username via TWINE_USERNAME.
> > > > +     # Set the password via TWINE_PASSWORD.
> > > > +     # Set the pkg repository via TWINE_REPOSITORY.
> > > > +     python3 -m twine upload --verbose dist/*
> > > > +     git push -v --atomic --follow-tags
> > > > +
> > > > +.PHONY: publish-test
> > > > +publish-test: pre-publish
> > > > +     python3 -m twine upload --verbose -r testpypi dist/*
> > >
> > > It doesn't feel very pythonic to have a makefile in the project.
> > >
> > > If we want some helpers for publishing releases, I would have
> > > expected to see a python script  eg scripts/publish.py
> > >
> > >
> > Eh, Python folks use Makefiles too. I've been using these little Makefi=
le
> > targets for hobby things for a while and I had them laying around and
> ready
> > to go. I have no strong need to "upgrade" to python scripts for these
> right
> > now, unless there's some extra features you want to see.
>
> Using make means you have to worry about portability across different
> impls of make and different impls of shell. Using python means your
> python project is portable to anywhere that python runs.


I still like the idea of using a Makefile as a "canonical menu of things
you can do in this directory", but there's probably room for interactive
error checking and so on with the TWINE_USERNAME / TWINE_PASSWORD /
TWINE_REPOSITORY environment variables in a python script. I'll look into
it as a follow-up, if that's fine. (I'm worried it's a lot of polish and
effort on a maintainers-only interface that only I will likely use for at
least the next year or two.)

Ultimately, what's likely to happen here is that I will generate some oauth
tokens with publish permissions and a hypothetical user would set e.g.
TWINE_USERNAME to "__token__", and the password would be
"pypi-tokengoeshere". Using the "keyring" python package, we could attempt
to fetch stored values from a session keyring, falling back to an
interactive prompt if they're unset.

--js

--00000000000009c49c05d553bf27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 17, 2021 at 8:46 AM Danie=
l P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Thu, Dec 16, 2021 at 06:35:23PM -0500, John Snow wrote:<br>
&gt; On Thu, Dec 16, 2021 at 5:48 AM Daniel P. Berrang=C3=A9 &lt;<a href=3D=
"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&gt;<=
br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Wed, Dec 15, 2021 at 04:06:27PM -0500, John Snow wrote:<br>
&gt; &gt; &gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.=
com" target=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 Makefile | 32 ++++++++++++++++++++++++++++++++<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 32 insertions(+)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/Makefile b/Makefile<br>
&gt; &gt; &gt; index 97d737a..81bfca8 100644<br>
&gt; &gt; &gt; --- a/Makefile<br>
&gt; &gt; &gt; +++ b/Makefile<br>
&gt; &gt; &gt; @@ -110,3 +110,35 @@ distclean: clean<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f .coverage .coverage.*<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf htmlcov/<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf test-results/<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +.PHONY: pristine<br>
&gt; &gt; &gt; +pristine:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0@git diff-files --quiet --ignore-submod=
ules -- || \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(echo &quot=
;You have unstaged changes.&quot;; exit 1)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0@git diff-index --cached --quiet HEAD -=
-ignore-submodules -- || \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(echo &quot=
;Your index contains uncommitted changes.&quot;; exit 1)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0@[ -z &quot;$(shell git ls-files -o)&qu=
ot; ] || \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(echo &quot=
;You have untracked files: $(shell git ls-files<br>
&gt; &gt; -o)&quot;; exit 1)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +dist: setup.cfg setup.py Makefile README.rst<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0python3 -m build<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0@touch dist<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +.PHONY: pre-publish<br>
&gt; &gt; &gt; +pre-publish: pristine dist<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0@git describe --exact-match 2&gt;/dev/n=
ull || \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(echo -e &q=
uot;\033[0;31mThere is no annotated tag for this<br>
&gt; &gt; commit.\033[0m&quot;; exit 1)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0python3 -m twine check --strict dist/*<=
br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0git push -v --atomic --follow-tags --dr=
y-run<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +.PHONY: publish<br>
&gt; &gt; &gt; +publish: pre-publish<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0# Set the username via TWINE_USERNAME.<=
br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0# Set the password via TWINE_PASSWORD.<=
br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0# Set the pkg repository via TWINE_REPO=
SITORY.<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0python3 -m twine upload --verbose dist/=
*<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0git push -v --atomic --follow-tags<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +.PHONY: publish-test<br>
&gt; &gt; &gt; +publish-test: pre-publish<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0python3 -m twine upload --verbose -r te=
stpypi dist/*<br>
&gt; &gt;<br>
&gt; &gt; It doesn&#39;t feel very pythonic to have a makefile in the proje=
ct.<br>
&gt; &gt;<br>
&gt; &gt; If we want some helpers for publishing releases, I would have<br>
&gt; &gt; expected to see a python script=C2=A0 eg scripts/publish.py<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; Eh, Python folks use Makefiles too. I&#39;ve been using these little M=
akefile<br>
&gt; targets for hobby things for a while and I had them laying around and =
ready<br>
&gt; to go. I have no strong need to &quot;upgrade&quot; to python scripts =
for these right<br>
&gt; now, unless there&#39;s some extra features you want to see.<br>
<br>
Using make means you have to worry about portability across different<br>
impls of make and different impls of shell. Using python means your<br>
python project is portable to anywhere that python runs.</blockquote><div><=
br></div><div>I still like the idea of using a Makefile as a &quot;canonica=
l menu of things you can do in this directory&quot;, but there&#39;s probab=
ly room for interactive error checking and so on with the TWINE_USERNAME / =
TWINE_PASSWORD / TWINE_REPOSITORY environment variables in a python script.=
 I&#39;ll look into it as a follow-up, if that&#39;s fine. (I&#39;m worried=
 it&#39;s a lot of polish and effort on a maintainers-only interface that o=
nly I will likely use for at least the next year or two.)<br><br></div><div=
>Ultimately, what&#39;s likely to happen here is that I will generate some =
oauth tokens with publish permissions and a hypothetical user would set e.g=
. TWINE_USERNAME to &quot;__token__&quot;, and the password would be &quot;=
pypi-tokengoeshere&quot;. Using the &quot;keyring&quot; python package, we =
could attempt to fetch stored values from a session keyring, falling back t=
o an interactive prompt if they&#39;re unset.<br></div><div><br></div><div>=
--js<br></div></div></div>

--00000000000009c49c05d553bf27--


