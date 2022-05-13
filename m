Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 922195269EE
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 21:10:57 +0200 (CEST)
Received: from localhost ([::1]:42946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npagi-0003Tx-5N
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 15:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npafX-0002Fz-7S
 for qemu-devel@nongnu.org; Fri, 13 May 2022 15:09:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npafU-0007tV-1l
 for qemu-devel@nongnu.org; Fri, 13 May 2022 15:09:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652468978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WhXq9yFSY4zzhwyj5ZDenEJKIwiN2U4Ldfx0jVwQQ/A=;
 b=GY0mpGjmInTVUVmY+TeY2dsWLr3tQO/nXLVb3LNfr658stSgq6Wz3gFBecYoafCUC7w4Tl
 oUL1Nf+LAJFvCfQvPeQDzOqvHA/uQzph1w+K3XZhJ+feSCkZ2Y6ylo7QI60ZHkcO/9Z+xQ
 KdIeLVZliIoC4BeomZaK2QbqLhV1a98=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-9K0u9Gm7OqOGmzDMU6oj2g-1; Fri, 13 May 2022 15:09:37 -0400
X-MC-Unique: 9K0u9Gm7OqOGmzDMU6oj2g-1
Received: by mail-ua1-f72.google.com with SMTP id
 s14-20020ab02bce000000b0035d45862725so4108814uar.22
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 12:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WhXq9yFSY4zzhwyj5ZDenEJKIwiN2U4Ldfx0jVwQQ/A=;
 b=fCpS4CnGjmnkyg2NwDJ1Mktvb6A4FGrntCxc6+ZjTaOSHklFu+nKtHV2bkGcAojAZh
 QyZ4HVwNLaGs0DMuKhGZSN9wWDipD+b8FMfPxum5BdtPAXKAkEpfeqd0lX1cSsGN3F+P
 wu6iF0EYlNGpq9d3Bch1eB+jg0V0SnATTAD3y8it4S9/76IZVld32kkgos7iwmEwhqF9
 S0Av9zST2ZkaJ74bCJ0QxBrsON0qN7I38QW8WpgwUShp5JOH3DTtsSK6EeJqJXR0F2By
 L+lvBePFij7Nh7cHn4rqMunBpJJhqV0ZvYJxDRHjo0E6xNDRBxRw+fY65GDZ2PC73F9X
 odvQ==
X-Gm-Message-State: AOAM533gXk6Qhpzb96j/VHRK02oU7+PQS27kJ0hzpAkykynxHNW7VlO+
 kDPt9pnC2yQU2p1O253Vj+iFeTAIQvKX2dtDGifvOH2uK1hkMl/eDdeFvzfzsKxjvuvTs3tZcCy
 g5BJ8r1U+G+Nep+tTqy7mafpcjv90Ykg=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr3264664vsa.38.1652468976856; 
 Fri, 13 May 2022 12:09:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/PlbsPtlTdGZ83gizWwPck/+fD2SX7523RJnPFV5NLYNzP3rblVnzxJw8qmIlKE/EDM466cIqvot4efEoT4o=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr3264650vsa.38.1652468976655; Fri, 13 May
 2022 12:09:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220513000609.197906-1-jsnow@redhat.com>
 <Yn4YS1FpgtCZMMx6@redhat.com> <Yn4y9BorEDzOLhFH@redhat.com>
 <CAFn=p-Y77=F=qjdwWRycFafxiS7Rjxag4gLmPK0ERqEiyT19ig@mail.gmail.com>
 <Yn6CPm3VosPfcK7j@redhat.com>
 <d26567e9-f4b4-ff0c-6312-ad9162adaf90@redhat.com>
In-Reply-To: <d26567e9-f4b4-ff0c-6312-ad9162adaf90@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 13 May 2022 15:09:25 -0400
Message-ID: <CAFn=p-ZMJWG66+OysLAQreO8_O4zN2ABnMnJ30dLubUKpFCazA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/9] tests: run python tests under the
 build/tests/venv environment
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>, 
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000005b304705dee96abc"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005b304705dee96abc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 13, 2022, 12:50 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 5/13/22 18:07, Daniel P. Berrang=C3=A9 wrote:
> >> e.g. what if I want to require mypy >=3D 0.900 for testing, but you ha=
ve a
> >> system package that requires mypy < 0.700?
> > I would expect us to not require packages that are not present in
> > the distros implied by
> >
> >    https://www.qemu.org/docs/master/about/build-platforms.html
> >
> > if that was absolutely a must have, then gracefully skip tests
> > if the system version wasn't new enough. The user could always
> > pass --python-env=3Dpip if they want to force new enough
> >
>
> Consider that e.g. RHEL RPMs do not do mypy or pylint in %check, because
> the version of the linters in RHEL is usually older than what the
> upstream packages expect.
>
> I don't think it's a good idea for QEMU to support what Red Hat
> packagers decided was a bad idea to support.
>
> Paolo
>

Yeah, I have to insist that due to the way these packages are developed
upstream that it is simply not reasonable to expect that the local package
version will work. pylint changes behavior virtually every single release.
This series itself even has a patch that is playing whackamole to support a
mypy that's brand new while supporting older mypy versions.

It's a huge overhead for little gain.

Far preferable to just say "Oh, your linter version is too old, we can't
run this test locally."

the qemu (and qemu.qmp) packages do not express a runtime/install
dependency on mypy/pylint/isort/flake8/avocado/tox. These packages only get
pulled in for the [devel] option group, and for good reason.

What is really the outlier here is iotest 297, which brings a kind of
meta-test into the same category as functional/regression tests. Supporting
this on default system packages is not on my personal todo list. Moving
this test off to a "make check-python" and deleting iotest 297 might be an
option. This is a test that simply might need to be skipped by an SRPM
build. (it already isn't run, so there's no additional harm by continuing
to not run it.)

If we are running a test suite and we allow pypi via the config, then I
believe we ought to allow the pypi versions to supersede the system ones -
*iff* the system ones are insufficient. I will continue to endeavor to test
a very wide matrix of dependencies, I just have to be honest that I don't
think I will reasonably achieve the full breadth you are asking for here.

For no-internet configs, we may have to accept that some platforms simply
don't have new enough dependencies to run some tests. I don't see this as
violating our build platform promise. I don't believe the build platform
promise ever reasonably extended to a "development platform promise".

--js

>

--0000000000005b304705dee96abc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, May 13, 2022, 12:50 PM Paolo Bonzini &lt;<a hr=
ef=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">On 5/13/22 18:07, Daniel P. Berrang=C3=A9=
 wrote:<br>
&gt;&gt; e.g. what if I want to require mypy &gt;=3D 0.900 for testing, but=
 you have a<br>
&gt;&gt; system package that requires mypy &lt; 0.700?<br>
&gt; I would expect us to not require packages that are not present in<br>
&gt; the distros implied by<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 <a href=3D"https://www.qemu.org/docs/master/about/build-p=
latforms.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://www.=
qemu.org/docs/master/about/build-platforms.html</a><br>
&gt; <br>
&gt; if that was absolutely a must have, then gracefully skip tests<br>
&gt; if the system version wasn&#39;t new enough. The user could always<br>
&gt; pass --python-env=3Dpip if they want to force new enough<br>
&gt; <br>
<br>
Consider that e.g. RHEL RPMs do not do mypy or pylint in %check, because <b=
r>
the version of the linters in RHEL is usually older than what the <br>
upstream packages expect.<br>
<br>
I don&#39;t think it&#39;s a good idea for QEMU to support what Red Hat <br=
>
packagers decided was a bad idea to support.<br>
<br>
Paolo<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Yeah, I have to insist that due to the way these packages are develope=
d upstream that it is simply not reasonable to expect that the local packag=
e version will work. pylint changes behavior virtually every single release=
. This series itself even has a patch that is playing whackamole to support=
 a mypy that&#39;s brand new while supporting older mypy versions.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">It&#39;s a huge overhead for lit=
tle gain.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Far preferable=
 to just say &quot;Oh, your linter version is too old, we can&#39;t run thi=
s test locally.&quot;</div><div dir=3D"auto"><br></div><div dir=3D"auto">th=
e qemu (and qemu.qmp) packages do not express a runtime/install dependency =
on mypy/pylint/isort/flake8/avocado/tox. These packages only get pulled in =
for the [devel] option group, and for good reason.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">What is really the outlier here is iotest 297, w=
hich brings a kind of meta-test into the same category as functional/regres=
sion tests. Supporting this on default system packages is not on my persona=
l todo list. Moving this test off to a &quot;make check-python&quot; and de=
leting iotest 297 might be an option. This is a test that simply might need=
 to be skipped by an SRPM build. (it already isn&#39;t run, so there&#39;s =
no additional harm by continuing to not run it.)</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">If we are running a test suite and we allow pypi v=
ia the config, then I believe we ought to allow the pypi versions to supers=
ede the system ones - *iff* the system ones are insufficient. I will contin=
ue to endeavor to test a very wide matrix of dependencies, I just have to b=
e honest that I don&#39;t think I will reasonably achieve the full breadth =
you are asking for here.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>For no-internet configs, we may have to accept that some platforms simply =
don&#39;t have new enough dependencies to run some tests. I don&#39;t see t=
his as violating our build platform promise. I don&#39;t believe the build =
platform promise ever reasonably extended to a &quot;development platform p=
romise&quot;.</div><div dir=3D"auto"><br></div><div dir=3D"auto">--js</div>=
<div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>
</blockquote></div></div></div>

--0000000000005b304705dee96abc--


