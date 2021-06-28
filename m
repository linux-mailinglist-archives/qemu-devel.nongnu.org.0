Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EEC3B69C7
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 22:39:42 +0200 (CEST)
Received: from localhost ([::1]:37752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxy2f-00047I-Pu
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 16:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lxy1m-0003OL-UV
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 16:38:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lxy1j-0004Ne-Un
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 16:38:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624912723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t8OL6qn3s3rScGdYiE7ETyNtvXlVuqfvJkXzVl82eMI=;
 b=f7zgHMny6mUrFdRGXhdLcMGmonbzrvQCk9qUHJdv3Ok4zpR/oGAEOqCf7Qc5c9VRFgiNMv
 CLsmfR/9h/Jgcs47BXuMcrVVL6/rnoAQAHyFSbk7jKfDftMvb/UI+Vb6tLJAGiMbrMhLTP
 o8oW/FJWJIZCEQckgEAow6FwFCAu9ek=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-hxEtkh-TNAuCOkmynp7HOQ-1; Mon, 28 Jun 2021 16:38:41 -0400
X-MC-Unique: hxEtkh-TNAuCOkmynp7HOQ-1
Received: by mail-ot1-f69.google.com with SMTP id
 z60-20020a9d24c20000b029045ef35e4636so13944759ota.2
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 13:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t8OL6qn3s3rScGdYiE7ETyNtvXlVuqfvJkXzVl82eMI=;
 b=m+jK811YlsO6Ul6NNVl9iYmNgtrtQTHWgCk9baxZ99tHC9Sf8QP0aBvq5TI7NFvNwB
 +itnx5s+5ZRsQ0AGPfhttSQUjzPWLqitLTlOgJmLrtPTGPCboMQy0O1vtfpl38xpvlmx
 ZtlyBXgg9hLgsG2ubJ4TgTEGlJf/aDkBt6v7xDom0aiD7zbK015ENdPTGtpySn7BwYkl
 mpUWl6q2XtSgjHG12xnieim2ZvFn5LhaFI/Xv58nWqq8TaJd4ee87jS5HeXpZ8Ns/nqx
 dvAd3T8VCil2fX81cNrmDt60bC3oxwZjIwNxWqqTihnwXZjluAtXLbPPYq6lUFbgvyCh
 5iRg==
X-Gm-Message-State: AOAM5300HJvg6P+m1zbwb0FpplzTFlKMuN9S4wQzUkVMKOcI0a3gOsal
 aKcIj0MKPAZp1iC+RUopEqf94zZbY7SzVfwcHRm6UcmtlPVNbp2ZBOkckfbNQfrHeq095SJHFXj
 a2CDJNjWHR86hZZb+gcCl1r6tN0VWiQI=
X-Received: by 2002:a9d:20a2:: with SMTP id x31mr1179953ota.263.1624912721075; 
 Mon, 28 Jun 2021 13:38:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyH7l3UmPSHn4r1p/CDuO6qH4wwsipS9H+qkcAXLkT4XiOEfJUPBbUIDPmNT9GI8XhM9ejG/RxA0ruEG5Zm9Uc=
X-Received: by 2002:a9d:20a2:: with SMTP id x31mr1179934ota.263.1624912720894; 
 Mon, 28 Jun 2021 13:38:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210625154540.783306-1-jsnow@redhat.com>
 <20210625154540.783306-4-jsnow@redhat.com>
 <bb313f2b-fc35-96b4-417e-cd3a996ea4a2@redhat.com>
In-Reply-To: <bb313f2b-fc35-96b4-417e-cd3a996ea4a2@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 28 Jun 2021 16:38:30 -0400
Message-ID: <CAFn=p-bsKFmGiSACV-fTSG7F=wx3s0yLRgakP7fJEgtMOtLHgw@mail.gmail.com>
Subject: Re: [PATCH 03/11] python: Re-lock pipenv at *oldest* supported
 versions
To: wainersm@redhat.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000852fd705c5d97960"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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

--000000000000852fd705c5d97960
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 28, 2021 at 4:31 PM Wainer dos Santos Moschetta <
wainersm@redhat.com> wrote:

>
> On 6/25/21 12:45 PM, John Snow wrote:
> > tox is already testing the most recent versions. Let's use pipenv to
> > test the oldest versions we claim to support. This matches the stylistic
> > choice to have pipenv always test our oldest supported Python version,
> 3.6.
> Currently tox is testing with 3.6 too. Should we remove that version
> from the test matrix?
>

Tox will test with 3.6, but against the very latest pylint/mypy. This test
will also use 3.6, but against the oldest pylint/mypy we claim to support
in the package metadata. I think they are both useful.

The pipenv test will make sure we don't accidentally increase our
dependency requirements without noticing. This has some value for other
QEMU developers that are used to running and managing their own linters,
such as we did for a long time. I don't want to break their environments by
accident. (It also makes sure that no 3.7+ isms sneak into the code by
accident, too. This has historically been, and I anticipate it will
continue to be, a prominent problem in the Python library.)

The tox test gives us a heads up if there are incompatible changes arriving
in the bleeding edge for pylint/mypy et al that I will need to be aware of
before they are rolled out and wind up on random developer's systems and
start causing 'make check' to fail.

I think it's worth keeping both for now, provided the run cost isn't too
great. At the moment it seems rather minimal.


> >
> > The effect of this is that the python-check-pipenv CI job on gitlab will
> > now test against much older versions of these linters, which will help
> > highlight incompatible changes that might otherwise go unnoticed.
> >
> > Update instructions for adding and bumping versions in setup.cfg. The
> > reason for deleting the line that gets added to Pipfile is largely just
> > to avoid having the version minimums specified in multiple places in
> > config checked into the tree.
> >
> > (This patch was written by deleting Pipfile and Pipfile.lock, then
> > explicitly installing each dependency manually at a specific
> > version. Then, I restored the prior Pipfile and re-ran `pipenv lock
> > --dev --keep-outdated` to re-add the qemu dependency back to the pipenv
> > environment while keeping the "old" packages. It's annoying, yes, but I
> > think the improvement to test coverage is worthwhile.)
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   python/Pipfile.lock | 113 +++++++++++++++++++++-----------------------
> >   python/setup.cfg    |   4 +-
> >   2 files changed, 56 insertions(+), 61 deletions(-)
>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>

Thanks!

--000000000000852fd705c5d97960
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 28, 2021 at 4:31 PM Waine=
r dos Santos Moschetta &lt;<a href=3D"mailto:wainersm@redhat.com">wainersm@=
redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
On 6/25/21 12:45 PM, John Snow wrote:<br>
&gt; tox is already testing the most recent versions. Let&#39;s use pipenv =
to<br>
&gt; test the oldest versions we claim to support. This matches the stylist=
ic<br>
&gt; choice to have pipenv always test our oldest supported Python version,=
 3.6.<br>
Currently tox is testing with 3.6 too. Should we remove that version <br>
from the test matrix?<br></blockquote><div><br></div><div>Tox will test wit=
h 3.6, but against the very latest pylint/mypy. This test will also use 3.6=
, but against the oldest pylint/mypy we claim to support in the package met=
adata. I think they are both useful.</div><div><br></div><div>The pipenv te=
st will make sure we don&#39;t accidentally increase our dependency require=
ments without noticing. This has some value for other QEMU developers that =
are used to running and managing their own linters, such as we did for a lo=
ng time. I don&#39;t want to break their environments by accident. (It also=
 makes sure that no 3.7+ isms sneak into the code by accident, too. This ha=
s historically been, and I anticipate it will continue to be, a prominent p=
roblem in the Python library.)<br></div><div><br></div><div>The tox test gi=
ves us a heads up if there are incompatible changes arriving in the bleedin=
g edge for pylint/mypy et al that I will need to be aware of before they ar=
e rolled out and wind up on random developer&#39;s systems and start causin=
g &#39;make check&#39; to fail.</div><div><br></div><div>I think it&#39;s w=
orth keeping both for now, provided the run cost isn&#39;t too great. At th=
e moment it seems rather minimal.<br></div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; The effect of this is that the python-check-pipenv CI job on gitlab wi=
ll<br>
&gt; now test against much older versions of these linters, which will help=
<br>
&gt; highlight incompatible changes that might otherwise go unnoticed.<br>
&gt;<br>
&gt; Update instructions for adding and bumping versions in setup.cfg. The<=
br>
&gt; reason for deleting the line that gets added to Pipfile is largely jus=
t<br>
&gt; to avoid having the version minimums specified in multiple places in<b=
r>
&gt; config checked into the tree.<br>
&gt;<br>
&gt; (This patch was written by deleting Pipfile and Pipfile.lock, then<br>
&gt; explicitly installing each dependency manually at a specific<br>
&gt; version. Then, I restored the prior Pipfile and re-ran `pipenv lock<br=
>
&gt; --dev --keep-outdated` to re-add the qemu dependency back to the pipen=
v<br>
&gt; environment while keeping the &quot;old&quot; packages. It&#39;s annoy=
ing, yes, but I<br>
&gt; think the improvement to test coverage is worthwhile.)<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0python/Pipfile.lock | 113 +++++++++++++++++++++-----------=
------------<br>
&gt;=C2=A0 =C2=A0python/setup.cfg=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 =C2=A02 files changed, 56 insertions(+), 61 deletions(-)<br>
<br>
Reviewed-by: Wainer dos Santos Moschetta &lt;<a href=3D"mailto:wainersm@red=
hat.com" target=3D"_blank">wainersm@redhat.com</a>&gt;<br></blockquote><div=
><br></div><div>Thanks!<br></div></div></div>

--000000000000852fd705c5d97960--


