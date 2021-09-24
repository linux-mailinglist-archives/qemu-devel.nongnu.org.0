Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EB5417ACA
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 20:17:05 +0200 (CEST)
Received: from localhost ([::1]:57228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTpku-0002z6-Pn
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 14:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTphV-0000GT-Gc
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 14:13:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTphN-0001VE-WC
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 14:13:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632507205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b6Wf/TckMBSw2ULqGU1Lcy3DNNBXDI2aInXYO+6nBAo=;
 b=Yy8AKJlvOwkgXLKmulrpmA01GSI03p9QxFpV7CFHjinbfzc8sKNb9zWDumCaMi9x30lXIH
 R/2MEIPHPr/MT6lWFq4Ta3OnwKwjT4F0nukMUidBRxRjzTVcVc07fxVYM+oIRjFa+kE1D/
 I4rGu/gQTXy4Jfi4N+FOnLdFGGzrmV4=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-vgjszvUzNHyOcVGhfscsZg-1; Fri, 24 Sep 2021 14:13:23 -0400
X-MC-Unique: vgjszvUzNHyOcVGhfscsZg-1
Received: by mail-ot1-f69.google.com with SMTP id
 i7-20020a9d6507000000b0051c10643794so6946769otl.22
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 11:13:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b6Wf/TckMBSw2ULqGU1Lcy3DNNBXDI2aInXYO+6nBAo=;
 b=dSw+kuzUf6x+goX8007zPWCbFkR4v6W6zLspMu3Y36JadRjl0wD5Qc9OqubJrhE2ih
 FP5/7w+CPwQL//sSACEx/8WduYst6QLrwjxVAR1rs9o1+snP/9Ms3NkIUCOI73gYfIzw
 f0nmRftn5dJRAubErTOSM5j96SYKJlki2bTTuL+wPhkzjBpIJmEbcWHE6GIDAq98rCBC
 Nj/3ejr9iIcerFsy+SQ9fRrPihmFM1dt8g3CyjTQrfoKnbP72ch5DvXzVIhxQwAPD4VV
 6UyH5Xrs5U75pkzGnk4eSRhW7TOHOK95xDf6bfMFoKuHKJYMhvUFXWEirHwRa5z2HwV6
 +4VA==
X-Gm-Message-State: AOAM532YTJ1SH1NB7ZUQScwX9SaMIE2ynjkX/PwVR9XXr+DUIKWKSuXu
 w9RggvHzK+tESsPP35t6Pn0edzZ7pY8CWicVa80SAAbKxBP7RifVO7tGiPZ6L2lgVcbN2kngJ9H
 uiYVT/pnwel2ivhPWN0K1LVwlYSQSoro=
X-Received: by 2002:a05:6830:13c5:: with SMTP id
 e5mr5200133otq.374.1632507202534; 
 Fri, 24 Sep 2021 11:13:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAALhsuOO2efwjH5x0WohHKFtasA6++DNKd+2XA4bTHl67LzVoXJj2Ur0lP98Qud+sfFHTy9cUwbPkYqOjg/A=
X-Received: by 2002:a05:6830:13c5:: with SMTP id
 e5mr5200117otq.374.1632507202308; 
 Fri, 24 Sep 2021 11:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210923180715.4168522-1-jsnow@redhat.com>
In-Reply-To: <20210923180715.4168522-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 24 Sep 2021 14:13:11 -0400
Message-ID: <CAFn=p-au+c1m8RGn2T7ceYvsk8qDJ=HCkLAPbqFydzN1_F4eWg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] iotests: update environment and linting
 configuration
To: Kevin Wolf <kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e325e205ccc1b3c9"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e325e205ccc1b3c9
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 23, 2021 at 2:07 PM John Snow <jsnow@redhat.com> wrote:

> GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-package-iotest-pt1
> CI: https://gitlab.com/jsnow/qemu/-/pipelines/376236687
>
> This series partially supersedes:
>   [PATCH v3 00/16] python/iotests: Run iotest linters during Python CI'
>
> Howdy, this is good stuff we want even if we aren't yet in agreement
> about the best way to run iotest 297 from CI.
>
> - Update linting config to tolerate pylint 2.11.1
> - Eliminate sys.path hacking in individual test files
> - make mypy execution in test 297 faster
>
> The rest of the actual "run at CI time" stuff can get handled separately
> and later pending some discussion on the other series.
>
> V2:
>
> 001/6:[0011] [FC] 'iotests: add 'qemu' package location to PYTHONPATH in
> testenv'
> 002/6:[0025] [FC] 'iotests: add warning for rogue 'qemu' packages'
>
> - Squashed in a small optimization from Vladimir to 001, kept R-Bs.
> - Fixed the package detection logic to not panic if it can't find
>   'qemu' at all (kwolf)
> - Updated commit messages for the first two patches.
>
> --js
>
> John Snow (6):
>   iotests: add 'qemu' package location to PYTHONPATH in testenv
>   iotests: add warning for rogue 'qemu' packages
>   iotests/linters: check mypy files all at once
>   iotests/mirror-top-perms: Adjust imports
>   iotests/migrate-bitmaps-test: delint
>   iotests: Update for pylint 2.11.1
>
>  tests/qemu-iotests/235                        |  2 -
>  tests/qemu-iotests/297                        | 50 ++++++++-----------
>  tests/qemu-iotests/300                        |  7 ++-
>  tests/qemu-iotests/iotests.py                 |  2 -
>  tests/qemu-iotests/pylintrc                   |  6 ++-
>  tests/qemu-iotests/testenv.py                 | 39 ++++++++++++---
>  tests/qemu-iotests/testrunner.py              |  7 +--
>  tests/qemu-iotests/tests/migrate-bitmaps-test | 50 +++++++++++--------
>  tests/qemu-iotests/tests/mirror-top-perms     | 12 ++---
>  9 files changed, 99 insertions(+), 76 deletions(-)
>
> --
> 2.31.1
>
>
>
Patch 2 can just be dropped, and everything else is reviewed, so I think
this can be staged at your leisure.

--js

--000000000000e325e205ccc1b3c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 23, 2021 at 2:07 PM John =
Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">GitLab: <a hre=
f=3D"https://gitlab.com/jsnow/qemu/-/commits/python-package-iotest-pt1" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/jsnow/qemu/-/commits/p=
ython-package-iotest-pt1</a><br>
CI: <a href=3D"https://gitlab.com/jsnow/qemu/-/pipelines/376236687" rel=3D"=
noreferrer" target=3D"_blank">https://gitlab.com/jsnow/qemu/-/pipelines/376=
236687</a><br>
<br>
This series partially supersedes:<br>
=C2=A0 [PATCH v3 00/16] python/iotests: Run iotest linters during Python CI=
&#39;<br>
<br>
Howdy, this is good stuff we want even if we aren&#39;t yet in agreement<br=
>
about the best way to run iotest 297 from CI.<br>
<br>
- Update linting config to tolerate pylint 2.11.1<br>
- Eliminate sys.path hacking in individual test files<br>
- make mypy execution in test 297 faster<br>
<br>
The rest of the actual &quot;run at CI time&quot; stuff can get handled sep=
arately<br>
and later pending some discussion on the other series.<br>
<br>
V2:<br>
<br>
001/6:[0011] [FC] &#39;iotests: add &#39;qemu&#39; package location to PYTH=
ONPATH in testenv&#39;<br>
002/6:[0025] [FC] &#39;iotests: add warning for rogue &#39;qemu&#39; packag=
es&#39;<br>
<br>
- Squashed in a small optimization from Vladimir to 001, kept R-Bs.<br>
- Fixed the package detection logic to not panic if it can&#39;t find<br>
=C2=A0 &#39;qemu&#39; at all (kwolf)<br>
- Updated commit messages for the first two patches.<br>
<br>
--js<br>
<br>
John Snow (6):<br>
=C2=A0 iotests: add &#39;qemu&#39; package location to PYTHONPATH in testen=
v<br>
=C2=A0 iotests: add warning for rogue &#39;qemu&#39; packages<br>
=C2=A0 iotests/linters: check mypy files all at once<br>
=C2=A0 iotests/mirror-top-perms: Adjust imports<br>
=C2=A0 iotests/migrate-bitmaps-test: delint<br>
=C2=A0 iotests: Update for pylint 2.11.1<br>
<br>
=C2=A0tests/qemu-iotests/235=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 -<br>
=C2=A0tests/qemu-iotests/297=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 50 ++++++++-----------<br>
=C2=A0tests/qemu-iotests/300=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 ++-<br>
=C2=A0tests/qemu-iotests/iotests.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 -<br>
=C2=A0tests/qemu-iotests/pylintrc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++-<br>
=C2=A0tests/qemu-iotests/testenv.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 39 ++++++++++++---<br>
=C2=A0tests/qemu-iotests/testrunner.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 7 +--<br>
=C2=A0tests/qemu-iotests/tests/migrate-bitmaps-test | 50 +++++++++++-------=
-<br>
=C2=A0tests/qemu-iotests/tests/mirror-top-perms=C2=A0 =C2=A0 =C2=A0| 12 ++-=
--<br>
=C2=A09 files changed, 99 insertions(+), 76 deletions(-)<br>
<br>
-- <br>
2.31.1<br>
<br>
<br></blockquote><div><br></div><div>Patch 2 can just be dropped, and every=
thing else is reviewed, so I think this can be staged at your leisure.<br><=
/div><div><br></div><div>--js</div></div></div>

--000000000000e325e205ccc1b3c9--


