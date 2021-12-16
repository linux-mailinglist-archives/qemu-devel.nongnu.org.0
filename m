Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9134780B8
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 00:36:50 +0100 (CET)
Received: from localhost ([::1]:38164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my0Ir-0002i1-6q
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 18:36:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1my0Hm-0001qZ-Dm
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 18:35:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1my0Hi-0007SW-QB
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 18:35:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639697737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RfG1mRfCrULaIwrcet5wAwaD8FBiwWf+YhlhQQ/hlwI=;
 b=OTDKyH1uoP9IG4cpiipWVVJXE8T5E21mYMJA7QxbJhUNDZCtytaQe0H99G/o3rg1vFk3TV
 WdTvfn+tj7RJ1e3BkUoe+n2mRaJmdRC3BvKDG2I8sCREegABsmrh6A7POsNpvZ0nyzZqOb
 hAKe8b5xnOUxSh+Z2wcwgw1KyOuYZLw=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-gleEZN2JP2CzCEWgDO5I-g-1; Thu, 16 Dec 2021 18:35:34 -0500
X-MC-Unique: gleEZN2JP2CzCEWgDO5I-g-1
Received: by mail-vk1-f200.google.com with SMTP id
 g5-20020a056122062500b002fc9cc97ab0so200148vkp.1
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 15:35:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RfG1mRfCrULaIwrcet5wAwaD8FBiwWf+YhlhQQ/hlwI=;
 b=ejMqj2WRo1x0UoqiW21AK/CFYrZHyIVwwj3r9EYZRrrnVR20u6h95XBL/oXjAM+tWv
 fpMQZ8EAIvzRxX4/WTuqZw9xYDQdzWfzfL4fS03l6eTpxst2L3nEl89Skibp7fdau4Jl
 aUH3Oj4sP1q4C63XxC4yOruEYvrCTUzlGzlvgeQO5oXr92SxxhKmS8O2fS9Og4qNASTb
 NtoAzUJF4VhlQ3K/9yRpJxXG1qMprM4G+T3OGyAbe/VL4AF5i+waT1U0BosSvrburdgg
 nRlta7OvpTNEo7vHUNqyan3GTaRvDhuOeyrExHPEhbzYz7EECs9mvgS4Z5qFTZMoOhAi
 Ys4A==
X-Gm-Message-State: AOAM531tldEvtx6WTCoXfbjlOHjuKnsiln2PC6qlcbmVxQOp+8zCfc04
 WmHSmg3TJXchW5Ss5dnk9i7+Yd1J/bsneTyyBrC9orc5IgEJ0HCAEmN2/u9lJ92JsybbO9Ydqhn
 94soLOM1vox7dqyTakdBCq9QqqFotsHQ=
X-Received: by 2002:ab0:2b96:: with SMTP id q22mr65052uar.87.1639697734195;
 Thu, 16 Dec 2021 15:35:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrnFqFrmIFvX2FClDD+elbXijmbRy9O8CEWUx8DbQnXr0opfTnYIPtphTrp0RAEl8L6KGDo8ph/837L/cFStQ=
X-Received: by 2002:ab0:2b96:: with SMTP id q22mr65048uar.87.1639697733956;
 Thu, 16 Dec 2021 15:35:33 -0800 (PST)
MIME-Version: 1.0
References: <20211215210634.3779791-1-jsnow@redhat.com>
 <20211215210634.3779791-18-jsnow@redhat.com>
 <YbsZe9A/Lf2g1Xk8@redhat.com>
In-Reply-To: <YbsZe9A/Lf2g1Xk8@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 16 Dec 2021 18:35:23 -0500
Message-ID: <CAFn=p-bPUsw19uW=gfzGBwT5zDm3t4QHCvzf0nJjbcwcOKkA=g@mail.gmail.com>
Subject: Re: [RFC qemu.qmp PATCH 17/24] Makefile: add build and publish targets
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f8ccfb05d34be0ab"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
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

--000000000000f8ccfb05d34be0ab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 16, 2021 at 5:48 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Wed, Dec 15, 2021 at 04:06:27PM -0500, John Snow wrote:
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  Makefile | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/Makefile b/Makefile
> > index 97d737a..81bfca8 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -110,3 +110,35 @@ distclean: clean
> >       rm -f .coverage .coverage.*
> >       rm -rf htmlcov/
> >       rm -rf test-results/
> > +
> > +.PHONY: pristine
> > +pristine:
> > +     @git diff-files --quiet --ignore-submodules -- || \
> > +             (echo "You have unstaged changes."; exit 1)
> > +     @git diff-index --cached --quiet HEAD --ignore-submodules -- || \
> > +             (echo "Your index contains uncommitted changes."; exit 1)
> > +     @[ -z "$(shell git ls-files -o)" ] || \
> > +             (echo "You have untracked files: $(shell git ls-files
> -o)"; exit 1)
> > +
> > +dist: setup.cfg setup.py Makefile README.rst
> > +     python3 -m build
> > +     @touch dist
> > +
> > +.PHONY: pre-publish
> > +pre-publish: pristine dist
> > +     @git describe --exact-match 2>/dev/null || \
> > +             (echo -e "\033[0;31mThere is no annotated tag for this
> commit.\033[0m"; exit 1)
> > +     python3 -m twine check --strict dist/*
> > +     git push -v --atomic --follow-tags --dry-run
> > +
> > +.PHONY: publish
> > +publish: pre-publish
> > +     # Set the username via TWINE_USERNAME.
> > +     # Set the password via TWINE_PASSWORD.
> > +     # Set the pkg repository via TWINE_REPOSITORY.
> > +     python3 -m twine upload --verbose dist/*
> > +     git push -v --atomic --follow-tags
> > +
> > +.PHONY: publish-test
> > +publish-test: pre-publish
> > +     python3 -m twine upload --verbose -r testpypi dist/*
>
> It doesn't feel very pythonic to have a makefile in the project.
>
> If we want some helpers for publishing releases, I would have
> expected to see a python script  eg scripts/publish.py
>
>
Eh, Python folks use Makefiles too. I've been using these little Makefile
targets for hobby things for a while and I had them laying around and ready
to go. I have no strong need to "upgrade" to python scripts for these right
now, unless there's some extra features you want to see.

--js

--000000000000f8ccfb05d34be0ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 16, 2021 at 5:48 AM Danie=
l P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Wed, Dec 15, 2021 at 04:06:27PM -0500, John Snow wrote:<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 Makefile | 32 ++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 32 insertions(+)<br>
&gt; <br>
&gt; diff --git a/Makefile b/Makefile<br>
&gt; index 97d737a..81bfca8 100644<br>
&gt; --- a/Makefile<br>
&gt; +++ b/Makefile<br>
&gt; @@ -110,3 +110,35 @@ distclean: clean<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f .coverage .coverage.*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf htmlcov/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf test-results/<br>
&gt; +<br>
&gt; +.PHONY: pristine<br>
&gt; +pristine:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0@git diff-files --quiet --ignore-submodules -- ||=
 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(echo &quot;You have =
unstaged changes.&quot;; exit 1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0@git diff-index --cached --quiet HEAD --ignore-su=
bmodules -- || \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(echo &quot;Your inde=
x contains uncommitted changes.&quot;; exit 1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0@[ -z &quot;$(shell git ls-files -o)&quot; ] || \=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(echo &quot;You have =
untracked files: $(shell git ls-files -o)&quot;; exit 1)<br>
&gt; +<br>
&gt; +dist: setup.cfg setup.py Makefile README.rst<br>
&gt; +=C2=A0 =C2=A0 =C2=A0python3 -m build<br>
&gt; +=C2=A0 =C2=A0 =C2=A0@touch dist<br>
&gt; +<br>
&gt; +.PHONY: pre-publish<br>
&gt; +pre-publish: pristine dist<br>
&gt; +=C2=A0 =C2=A0 =C2=A0@git describe --exact-match 2&gt;/dev/null || \<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(echo -e &quot;\033[0=
;31mThere is no annotated tag for this commit.\033[0m&quot;; exit 1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0python3 -m twine check --strict dist/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0git push -v --atomic --follow-tags --dry-run<br>
&gt; +<br>
&gt; +.PHONY: publish<br>
&gt; +publish: pre-publish<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# Set the username via TWINE_USERNAME.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# Set the password via TWINE_PASSWORD.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# Set the pkg repository via TWINE_REPOSITORY.<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0python3 -m twine upload --verbose dist/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0git push -v --atomic --follow-tags<br>
&gt; +<br>
&gt; +.PHONY: publish-test<br>
&gt; +publish-test: pre-publish<br>
&gt; +=C2=A0 =C2=A0 =C2=A0python3 -m twine upload --verbose -r testpypi dis=
t/*<br>
<br>
It doesn&#39;t feel very pythonic to have a makefile in the project.<br>
<br>
If we want some helpers for publishing releases, I would have<br>
expected to see a python script=C2=A0 eg scripts/publish.py <br>
<br></blockquote><div><br></div><div>Eh, Python folks use Makefiles too. I&=
#39;ve been using these little Makefile targets for hobby things for a whil=
e and I had them laying around and ready to go. I have no strong need to &q=
uot;upgrade&quot; to python scripts for these right now, unless there&#39;s=
 some extra features you want to see.<br></div><div><br></div><div>--js<br>=
</div></div></div>

--000000000000f8ccfb05d34be0ab--


