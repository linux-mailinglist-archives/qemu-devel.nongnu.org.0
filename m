Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D02AE536414
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 16:33:11 +0200 (CEST)
Received: from localhost ([::1]:57934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nub1Z-0002DH-Rm
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 10:33:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nuawl-0004lv-B2
 for qemu-devel@nongnu.org; Fri, 27 May 2022 10:28:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nuawj-0006Vp-E1
 for qemu-devel@nongnu.org; Fri, 27 May 2022 10:28:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653661686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qzlCeiUO89KK/lZVKLvh1tcKa7cfNzfGumeZbhQlfPw=;
 b=O1Mxi1+4kO0TTB9/3sBIB8YvQvdp2uEHxcx28BH1G8nDg2wHr1Ht+7akFP1hxpEX0xi5SJ
 pL9OQxNAZQa2/uJj79qv5l7SzEKG+B22VgSme+QTzgY5jtSLI081PJP/ONtUPPXs3c6MSk
 4+Wz1J0KfbZk2PeiaX/QVVD75g0iLWY=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-yHfeLJCQN8a8M3EdpOxuBw-1; Fri, 27 May 2022 10:28:05 -0400
X-MC-Unique: yHfeLJCQN8a8M3EdpOxuBw-1
Received: by mail-ua1-f71.google.com with SMTP id
 z19-20020a9f3713000000b003687cbfa3baso2301601uad.3
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 07:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qzlCeiUO89KK/lZVKLvh1tcKa7cfNzfGumeZbhQlfPw=;
 b=nzAoBD/1wTy1kWhZHidMOazWuMvk+bn0lnZ2bMGEjADDZmsLn8hcBFZcYUrTk9Bj2a
 ZaFyNalsD1pQpeU3kTY3e6OJWSkGzmroUZ5AvaXwM+AsnIobXWvo30rik6hTx03m+zql
 N/XNo+KXcaB7ezDklcNE+1m4HxdNy2xC8DANlz7bkyRXm2GA45QAhHSEkfkBlMJjI1YI
 gn2ccdFL1G131vwdsv2XX5vaqiLUX4KX099CgbKyO7zJPNIgMHPYiYzf5tmxmOYDsBPu
 lI+HQIKuV0s5j4aytZad65Q3/tfo+vULf/UUQkXadrZMCIpZi5tHjZ3xLcPmYDzeqzjB
 xaCQ==
X-Gm-Message-State: AOAM530vJ9CycHIPHOkBrMweObZmefLkU/se9JDKMDfK/Ghia0dNqIKU
 AkOziPaFuhVXa7maTied3TAuMDS01mULE6Fxlu9oU1XBh9rFssQDA0/h/WYCd/dqnAFdnAWeSc5
 ewXIGQfznWphDKscfaW/zo+0bUy0cwEY=
X-Received: by 2002:a67:7344:0:b0:335:f2f6:a915 with SMTP id
 o65-20020a677344000000b00335f2f6a915mr16061945vsc.35.1653661684510; 
 Fri, 27 May 2022 07:28:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWsBaPJ/8nvnQzLnzAK9INA+rp5kOMaoFNtdwWky2sWi19MnOxJeModoVSKfPNzwPDKVbeNiegmRgmY0unIpw=
X-Received: by 2002:a67:7344:0:b0:335:f2f6:a915 with SMTP id
 o65-20020a677344000000b00335f2f6a915mr16061931vsc.35.1653661684268; Fri, 27
 May 2022 07:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220526000921.1581503-1-jsnow@redhat.com>
In-Reply-To: <20220526000921.1581503-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 27 May 2022 10:27:53 -0400
Message-ID: <CAFn=p-bqUqEZW0wcccCOHut=wXQTcVsWX5kRkAPe2u6eSM0DPA@mail.gmail.com>
Subject: Re: [PATCH 0/9] tests, python: prepare to expand usage of test venv
To: qemu-devel <qemu-devel@nongnu.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000045172205dfff1d18"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--00000000000045172205dfff1d18
Content-Type: text/plain; charset="UTF-8"

Paolo: I assume this falls under your jurisdiction...ish, unless Cleber
(avocado) or Alex (tests more broadly) have any specific inputs.

I'm fine with waiting for reviews, but don't know whose bucket this goes to.


On Wed, May 25, 2022, 8:09 PM John Snow <jsnow@redhat.com> wrote:

> GitLab CI: https://gitlab.com/jsnow/qemu/-/pipelines/548326343
>
> This series collects some of the uncontroversial elements that serve as
> pre-requisites for a later series that seeks to generate a testing venv
> by default.
>
> This series makes the following material changes:
>
> - Install the 'qemu' package into the avocado testing venv
> - Use the avocado testing venv to run vm-tests
> - Use the avocado testing venv to run device-crash-test
>
> None of these changes impact 'make check'; these are all specialty
> tests that are not run by default. This series also doesn't change how
> iotests are run, doesn't add any new dependencies for SRPM builds, etc.
>
> NOTE: patch 8 isn't strictly required for this series, but including it
> here "early" helps the subsequent series. Since the debian docker files
> are layered, testing downstream pipelines can fail because the base
> image is pulled from the main QEMU repo instead of the downstream.
>
> In other words: I need this patch in origin/main in order to have the
> venv module available for later patches that will actually need it in
> our debian10 derivative images.
>
> (in other-other-words: the 'clang-user' test *will* need it later.)
>
> John Snow (9):
>   python: update for mypy 0.950
>   tests: add "TESTS_PYTHON" variable to Makefile
>   tests: use python3 as the python executable name
>   tests: silence pip upgrade warnings during venv creation
>   tests: add quiet-venv-pip macro
>   tests: install "qemu" namespace package into venv
>   tests: use tests/venv to run basevm.py-based scripts
>   tests: add python3-venv to debian10.docker
>   tests: run 'device-crash-test' from tests/venv
>
>  .gitlab-ci.d/buildtest.yml               |  8 +++++---
>  python/qemu/qmp/util.py                  |  4 +++-
>  python/setup.cfg                         |  1 +
>  scripts/device-crash-test                | 14 +++++++++++---
>  tests/Makefile.include                   | 18 ++++++++++--------
>  tests/avocado/avocado_qemu/__init__.py   | 11 +++++------
>  tests/avocado/virtio_check_params.py     |  1 -
>  tests/avocado/virtio_version.py          |  1 -
>  tests/docker/dockerfiles/debian10.docker |  1 +
>  tests/requirements.txt                   |  1 +
>  tests/vm/Makefile.include                | 13 +++++++------
>  tests/vm/basevm.py                       |  6 +++---
>  12 files changed, 47 insertions(+), 32 deletions(-)
>
> --
> 2.34.1
>
>

--00000000000045172205dfff1d18
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Paolo: I assume this falls under your jurisdiction..=
.ish, unless Cleber (avocado) or Alex (tests more broadly) have any specifi=
c inputs.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;m fine w=
ith waiting for reviews, but don&#39;t know whose bucket this goes to.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto"><br><div class=3D"gmail_quot=
e" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 25, 2022,=
 8:09 PM John Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">GitLab CI: <a href=
=3D"https://gitlab.com/jsnow/qemu/-/pipelines/548326343" rel=3D"noreferrer =
noreferrer" target=3D"_blank">https://gitlab.com/jsnow/qemu/-/pipelines/548=
326343</a><br>
<br>
This series collects some of the uncontroversial elements that serve as<br>
pre-requisites for a later series that seeks to generate a testing venv<br>
by default.<br>
<br>
This series makes the following material changes:<br>
<br>
- Install the &#39;qemu&#39; package into the avocado testing venv<br>
- Use the avocado testing venv to run vm-tests<br>
- Use the avocado testing venv to run device-crash-test<br>
<br>
None of these changes impact &#39;make check&#39;; these are all specialty<=
br>
tests that are not run by default. This series also doesn&#39;t change how<=
br>
iotests are run, doesn&#39;t add any new dependencies for SRPM builds, etc.=
<br>
<br>
NOTE: patch 8 isn&#39;t strictly required for this series, but including it=
<br>
here &quot;early&quot; helps the subsequent series. Since the debian docker=
 files<br>
are layered, testing downstream pipelines can fail because the base<br>
image is pulled from the main QEMU repo instead of the downstream.<br>
<br>
In other words: I need this patch in origin/main in order to have the<br>
venv module available for later patches that will actually need it in<br>
our debian10 derivative images.<br>
<br>
(in other-other-words: the &#39;clang-user&#39; test *will* need it later.)=
<br>
<br>
John Snow (9):<br>
=C2=A0 python: update for mypy 0.950<br>
=C2=A0 tests: add &quot;TESTS_PYTHON&quot; variable to Makefile<br>
=C2=A0 tests: use python3 as the python executable name<br>
=C2=A0 tests: silence pip upgrade warnings during venv creation<br>
=C2=A0 tests: add quiet-venv-pip macro<br>
=C2=A0 tests: install &quot;qemu&quot; namespace package into venv<br>
=C2=A0 tests: use tests/venv to run basevm.py-based scripts<br>
=C2=A0 tests: add python3-venv to debian10.docker<br>
=C2=A0 tests: run &#39;device-crash-test&#39; from tests/venv<br>
<br>
=C2=A0.gitlab-ci.d/buildtest.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 8 +++++---<br>
=C2=A0python/qemu/qmp/util.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 4 +++-<br>
=C2=A0python/setup.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0scripts/device-crash-test=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 14 +++++++++++---<br>
=C2=A0tests/Makefile.include=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 18 ++++++++++--------<br>
=C2=A0tests/avocado/avocado_qemu/__init__.py=C2=A0 =C2=A0| 11 +++++------<b=
r>
=C2=A0tests/avocado/virtio_check_params.py=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<b=
r>
=C2=A0tests/avocado/virtio_version.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 -<br>
=C2=A0tests/docker/dockerfiles/debian10.docker |=C2=A0 1 +<br>
=C2=A0tests/requirements.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0tests/vm/Makefile.include=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 13 +++++++------<br>
=C2=A0tests/vm/basevm.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++---<br>
=C2=A012 files changed, 47 insertions(+), 32 deletions(-)<br>
<br>
-- <br>
2.34.1<br><br>
</blockquote></div></div></div>

--00000000000045172205dfff1d18--


