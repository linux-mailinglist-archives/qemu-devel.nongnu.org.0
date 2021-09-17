Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5B440F1CE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 07:59:09 +0200 (CEST)
Received: from localhost ([::1]:39748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR6tw-0004eG-Ga
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 01:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mR6iP-0004YY-In
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 01:47:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mR6iM-0008TN-IL
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 01:47:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631857630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Evr6ermBDoLDDPRcjDpmHYST5gs0KUORaBD78YmWkIE=;
 b=OOGccpbwMgeib544Xamos47HroSdnEIjhQiYZ3bLv5sBhW5nBn6UTHgShDGNkihtq1aBj9
 BlXrCBCTazZVNmzi84LALIX9eiytiHcxj4zMGP0Jd4phhXZwHIuAff7XQ2l5uC9pjs+y98
 gdNB10jXOW48FP50CVDekGglB1yMOw8=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-XdolPulGOUCC2y0fqz26iQ-1; Fri, 17 Sep 2021 01:47:07 -0400
X-MC-Unique: XdolPulGOUCC2y0fqz26iQ-1
Received: by mail-oo1-f69.google.com with SMTP id
 w6-20020a4adec6000000b0028b7d13a4c8so38057678oou.13
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 22:47:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Evr6ermBDoLDDPRcjDpmHYST5gs0KUORaBD78YmWkIE=;
 b=dRYBrGdv/YD7tf7qqN069/MCQG9Nt4AZSd4PqT2TT05g2c20EYtlUNp2W/Lzlapp2B
 HObr/Np3cdU14fVx+P70UC2uIHTc+2CCP1hTIQxLejdXIGnOQluuCG/FZkbOH/0+enTI
 2v09ccDdzp89UAM+uEvBO2oeR/8DzV+HO1oSLimhkWyQ0f5NEowVJypBtKfa3CaAmcU2
 cYkWSYooWeV25aaeM74tm2wQosHIWkZ0lsbulMdB64m4FxtMjYZ3TrVDJ6lzOSOXGpx4
 2S6J4GsPR0aR8NOIqCjEWW4/Lm/VnbTukaZk/mvzHtLLlqJcRRqSnQI5LfU7pFRQFbXj
 4N/w==
X-Gm-Message-State: AOAM533bf8rdoKOWlQtEsqyVr2mG2Y7+jUAPfKglddAS6kqWh+VpjaGn
 TYtrjZMEOVX5cQX/sXPvJ4uDJ93MLhHv9YgGM6R54Yp6Q6rMaO7tbMc4is/kyq1wf7jr0UfCCsJ
 +UE48B8OnBgbIO2UQMgOYDX1rSeaYCzg=
X-Received: by 2002:aca:f386:: with SMTP id
 r128mr11970164oih.168.1631857626405; 
 Thu, 16 Sep 2021 22:47:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwy8UmIy2Aok1llwis3koHVtCVtZmBBxnck4SNTnOn10vtBSfKWxwkoToXISGmtfJvlJ16wwY/NaARcinUB77o=
X-Received: by 2002:aca:f386:: with SMTP id
 r128mr11970147oih.168.1631857626156; 
 Thu, 16 Sep 2021 22:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210916040955.628560-1-jsnow@redhat.com>
In-Reply-To: <20210916040955.628560-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 17 Sep 2021 01:46:55 -0400
Message-ID: <CAFn=p-Z4HAGu2tcO34TkkV0cQnhWFot+cTbt0PfTfnBQcvqEAg@mail.gmail.com>
Subject: Re: [PATCH v3 00/16] python/iotests: Run iotest linters during Python
 CI
To: qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000021abcd05cc2a76c7"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000021abcd05cc2a76c7
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 16, 2021 at 12:10 AM John Snow <jsnow@redhat.com> wrote:

> GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-package-iotest
> CI: https://gitlab.com/jsnow/qemu/-/pipelines/371611883
> Based-On: <20210915175318.853225-1-hreitz@redhat.com>
>           "[PULL 00/32] Block patches"
>
> Since iotests are such a heavy and prominent user of the Python qemu.qmp
> and qemu.machine packages, it would be convenient if the Python linting
> suite also checked this client for any possible regressions introduced
> by shifting around signatures, types, or interfaces in these packages.
>
> (We'd eventually find those problems when iotest 297 ran, but with
> increasing distance between Python development and Block development,
> the risk of an accidental breakage in this regard increases. I,
> personally, know to run iotests (and especially 297) after changing
> Python code, but not everyone in the future might. Plus, I am lazy, and
> I like only having to push one button.)
>
> Add the ability for the Python CI to run the iotest linters too, which
> means that the iotest linters would be checked against:
>
> - Python 3.6, using a frozen set of linting packages at their oldest
>   supported versions, using 'pipenv'
> - Python 3.6 through Python 3.10 inclusive, using 'tox' and the latest
>   versions of mypy/pylint that happen to be installed during test
>   time. This CI test is allowed to fail with a warning, and can serve
>   as a bellwether for when new incompatible changes may disrupt the
>   linters. Testing against old and new Python interpreters alike can
>   help surface incompatibility issues we may need to be aware of.)
>
> Here are example outputs of those CI jobs with this series applied:
>  - "check-python-pipenv": https://gitlab.com/jsnow/qemu/-/jobs/1377735087
>  - "check-python-tox": https://gitlab.com/jsnow/qemu/-/jobs/1377735088
>
> You can also run these same tests locally from ./python, plus one more:
>
> - "make check-dev" to test against whatever python you have.
> - "make check-pipenv", if you have Python 3.6 and pipenv installed.
> - "make check-tox", to test against multiple python versions you have
> installed,
>                     from 3.6 to 3.10 inclusive. (CI tests against all 5.)
>
> See the old commit message for more sample output, etc.
>
> https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg07056.html
>
> V3:
>  - Added patch 1 which has been submitted separately upstream,
>    but was necessary for testing.
>  - Rebased on top of hreitz/block, which fixed some linting issues.
>  - Added a workaround for a rather nasty mypy bug ... >:(
>
> V2:
>  - Added patches 1-5 which do some more delinting.
>  - Added patch 8, which scans subdirs for tests to lint.
>  - Added patch 17, which improves the speed of mypy analysis.
>  - Patch 14 is different because of the new patch 8.
>
> John Snow (16):
>   python: Update for pylint 2.10
>   iotests/mirror-top-perms: Adjust imports
>   iotests/migrate-bitmaps-postcopy-test: declare instance variables
>   iotests/migrate-bitmaps-test: delint
>   iotests/297: modify is_python_file to work from any CWD
>   iotests/297: Add get_files() function
>   iotests/297: Don't rely on distro-specific linter binaries
>   iotests/297: Create main() function
>   iotests/297: Separate environment setup from test execution
>   iotests/297: Add 'directory' argument to run_linters
>   iotests/297: return error code from run_linters()
>   iotests/297: split linters.py off from 297
>   iotests/linters: Add entry point for Python CI linters
>   iotests/linters: Add workaround for mypy bug #9852
>   python: Add iotest linters to test suite
>   iotests/linters: check mypy files all at once
>
>  python/qemu/machine/machine.py                |   9 +-
>  python/setup.cfg                              |   1 +
>  python/tests/iotests.sh                       |   4 +
>  tests/qemu-iotests/297                        |  81 ++---------
>  tests/qemu-iotests/linters.py                 | 129 ++++++++++++++++++
>  .../tests/migrate-bitmaps-postcopy-test       |   3 +
>  tests/qemu-iotests/tests/migrate-bitmaps-test |  50 ++++---
>  tests/qemu-iotests/tests/mirror-top-perms     |   7 +-
>  8 files changed, 186 insertions(+), 98 deletions(-)
>  create mode 100755 python/tests/iotests.sh
>  create mode 100755 tests/qemu-iotests/linters.py
>
> --
> 2.31.1
>
>
>
FWIW: I sent a new version of a pull request that adds pylint 2.10 *and*
2.11 support; the 2.11 release happened just yesterday, so I am going to
rebase this series.

Additionally, I found a new way to avoid sys.path hacking in all of our
test files entirely, so I will include that in this series, rebase, and
resend extremely soon. If you have difficulties applying this patchset or
testing it, sit tight for a refreshed version -- but most of these patches
can still be reviewed on their own merits in the meantime.

Thanks,
--js

--00000000000021abcd05cc2a76c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, Sep 16, 2021 at 12:10 AM John Snow &lt;<a href=3D"mailto:jsn=
ow@redhat.com">jsnow@redhat.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">GitLab: <a href=3D"https://gitlab.com/jsno=
w/qemu/-/commits/python-package-iotest" rel=3D"noreferrer" target=3D"_blank=
">https://gitlab.com/jsnow/qemu/-/commits/python-package-iotest</a><br>
CI: <a href=3D"https://gitlab.com/jsnow/qemu/-/pipelines/371611883" rel=3D"=
noreferrer" target=3D"_blank">https://gitlab.com/jsnow/qemu/-/pipelines/371=
611883</a><br>
Based-On: &lt;<a href=3D"mailto:20210915175318.853225-1-hreitz@redhat.com" =
target=3D"_blank">20210915175318.853225-1-hreitz@redhat.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;[PULL 00/32] Block patches&quot;<b=
r>
<br>
Since iotests are such a heavy and prominent user of the Python qemu.qmp<br=
>
and qemu.machine packages, it would be convenient if the Python linting<br>
suite also checked this client for any possible regressions introduced<br>
by shifting around signatures, types, or interfaces in these packages.<br>
<br>
(We&#39;d eventually find those problems when iotest 297 ran, but with<br>
increasing distance between Python development and Block development,<br>
the risk of an accidental breakage in this regard increases. I,<br>
personally, know to run iotests (and especially 297) after changing<br>
Python code, but not everyone in the future might. Plus, I am lazy, and<br>
I like only having to push one button.)<br>
<br>
Add the ability for the Python CI to run the iotest linters too, which<br>
means that the iotest linters would be checked against:<br>
<br>
- Python 3.6, using a frozen set of linting packages at their oldest<br>
=C2=A0 supported versions, using &#39;pipenv&#39;<br>
- Python 3.6 through Python 3.10 inclusive, using &#39;tox&#39; and the lat=
est<br>
=C2=A0 versions of mypy/pylint that happen to be installed during test<br>
=C2=A0 time. This CI test is allowed to fail with a warning, and can serve<=
br>
=C2=A0 as a bellwether for when new incompatible changes may disrupt the<br=
>
=C2=A0 linters. Testing against old and new Python interpreters alike can<b=
r>
=C2=A0 help surface incompatibility issues we may need to be aware of.)<br>
<br>
Here are example outputs of those CI jobs with this series applied:<br>
=C2=A0- &quot;check-python-pipenv&quot;: <a href=3D"https://gitlab.com/jsno=
w/qemu/-/jobs/1377735087" rel=3D"noreferrer" target=3D"_blank">https://gitl=
ab.com/jsnow/qemu/-/jobs/1377735087</a><br>
=C2=A0- &quot;check-python-tox&quot;: <a href=3D"https://gitlab.com/jsnow/q=
emu/-/jobs/1377735088" rel=3D"noreferrer" target=3D"_blank">https://gitlab.=
com/jsnow/qemu/-/jobs/1377735088</a><br>
<br>
You can also run these same tests locally from ./python, plus one more:<br>
<br>
- &quot;make check-dev&quot; to test against whatever python you have.<br>
- &quot;make check-pipenv&quot;, if you have Python 3.6 and pipenv installe=
d.<br>
- &quot;make check-tox&quot;, to test against multiple python versions you =
have installed,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from =
3.6 to 3.10 inclusive. (CI tests against all 5.)<br>
<br>
See the old commit message for more sample output, etc.<br>
<br>
<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg07056.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archive/htm=
l/qemu-devel/2021-06/msg07056.html</a><br>
<br>
V3:<br>
=C2=A0- Added patch 1 which has been submitted separately upstream,<br>
=C2=A0 =C2=A0but was necessary for testing.<br>
=C2=A0- Rebased on top of hreitz/block, which fixed some linting issues.<br=
>
=C2=A0- Added a workaround for a rather nasty mypy bug ... &gt;:(<br>
<br>
V2:<br>
=C2=A0- Added patches 1-5 which do some more delinting.<br>
=C2=A0- Added patch 8, which scans subdirs for tests to lint.<br>
=C2=A0- Added patch 17, which improves the speed of mypy analysis.<br>
=C2=A0- Patch 14 is different because of the new patch 8.<br>
<br>
John Snow (16):<br>
=C2=A0 python: Update for pylint 2.10<br>
=C2=A0 iotests/mirror-top-perms: Adjust imports<br>
=C2=A0 iotests/migrate-bitmaps-postcopy-test: declare instance variables<br=
>
=C2=A0 iotests/migrate-bitmaps-test: delint<br>
=C2=A0 iotests/297: modify is_python_file to work from any CWD<br>
=C2=A0 iotests/297: Add get_files() function<br>
=C2=A0 iotests/297: Don&#39;t rely on distro-specific linter binaries<br>
=C2=A0 iotests/297: Create main() function<br>
=C2=A0 iotests/297: Separate environment setup from test execution<br>
=C2=A0 iotests/297: Add &#39;directory&#39; argument to run_linters<br>
=C2=A0 iotests/297: return error code from run_linters()<br>
=C2=A0 iotests/297: split linters.py off from 297<br>
=C2=A0 iotests/linters: Add entry point for Python CI linters<br>
=C2=A0 iotests/linters: Add workaround for mypy bug #9852<br>
=C2=A0 python: Add iotest linters to test suite<br>
=C2=A0 iotests/linters: check mypy files all at once<br>
<br>
=C2=A0python/qemu/machine/machine.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 +-<br>
=C2=A0python/setup.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0python/tests/iotests.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0tests/qemu-iotests/297=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 81 ++---------<br>
=C2=A0tests/qemu-iotests/linters.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 129 ++++++++++++++++++<br>
=C2=A0.../tests/migrate-bitmaps-postcopy-test=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A03 +<br>
=C2=A0tests/qemu-iotests/tests/migrate-bitmaps-test |=C2=A0 50 ++++---<br>
=C2=A0tests/qemu-iotests/tests/mirror-top-perms=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A07 +-<br>
=C2=A08 files changed, 186 insertions(+), 98 deletions(-)<br>
=C2=A0create mode 100755 python/tests/iotests.sh<br>
=C2=A0create mode 100755 tests/qemu-iotests/linters.py<br>
<br>
-- <br>
2.31.1<br>
<br>
<br></blockquote><div><br></div><div><div dir=3D"ltr">FWIW: I sent a new ve=
rsion of a pull request that adds pylint 2.10 *and* 2.11 support; the 2.11 =
release happened just yesterday, so I am going to rebase this series.</div>=
<div dir=3D"ltr"><br></div><div>Additionally, I found a new way to avoid sy=
s.path hacking in all of our test files entirely, so I will include that in=
 this series, rebase, and resend extremely soon. If you have difficulties a=
pplying this patchset or testing it, sit tight for a refreshed version -- b=
ut most of these patches can still be reviewed on their own merits in the m=
eantime.</div><div><br></div><div>Thanks,</div><div>--js<br></div>=C2=A0</d=
iv></div></div>

--00000000000021abcd05cc2a76c7--


