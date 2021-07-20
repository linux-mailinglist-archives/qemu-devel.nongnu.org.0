Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2925D3D0218
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 21:18:20 +0200 (CEST)
Received: from localhost ([::1]:53648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5vFz-0000en-7e
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 15:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5vF8-0008Hc-DH
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:17:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5vF6-0008BC-1n
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:17:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626808643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gZR+eTRmp6tspEjiKlKWlx9Hc0jqy3DtjO36sSdNhuY=;
 b=AIEj/6Mqk8nplWaJNxopizXI2R157VLPrxOzAgB0/iTQzYBb//35ZZq21wf3bXpzV7wGP4
 aksL/WmUvYTxGvlw7NMTt+ewh3x7Ii+/hkNSyaVMo3XyegiriW5PRrgVUCwXonKr6siUTn
 MK/0ZdpzUpPkt+vQ2w1RFV0x0W4Hj74=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-F8RD1EvbPf2m05xk6Jxa7g-1; Tue, 20 Jul 2021 15:17:20 -0400
X-MC-Unique: F8RD1EvbPf2m05xk6Jxa7g-1
Received: by mail-ot1-f69.google.com with SMTP id
 i22-20020a9d65160000b02904d1a21b3fbcso2943347otl.8
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 12:17:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gZR+eTRmp6tspEjiKlKWlx9Hc0jqy3DtjO36sSdNhuY=;
 b=l60+PENRCjsigvVlvuJl/nJOO/4yWRiUk6MuuB44JDAeN17cFEfK6wFzhrtPH4O/to
 O83KFG34llxeasAiN8gSBhU8PFNzvB5/Q4G9OdI/PswBsRyBgnZ+9xJx/IWcUEUlhNZT
 dT/YpTsYylBocb2BQi0SNfNnNBIGSwQR7SM7LUXIR+xqdrdYp7fJPE3nj0dzdctMJTnj
 LETZ3t0bMj3Ury5VF5PLOFdlmcsoGtlDB+vtIP9/G2/NE+6lVMTdsDRzA6lnTZ5RPW8U
 AyHfGf8bQU2fb66WWxv2yy0P0Rj8mgjCORfUsKZGonlkqOmaIm1r6oSKB+a+flJpvjrS
 C10Q==
X-Gm-Message-State: AOAM533Nfyjk7r7jlBeDEo3CLl0fXUz0Q2wgANNoYQ4JkB4HfPcZiAOV
 pyRpYke4WrnNBWQ8zXcrX7pfGmh5jgkI1fzw2SmG2Bi8ZNGAjQkZyFfquDgJF40CwQ4Si+87FJM
 YltKNR9KoN9DglXQoWLkWbwCC/Nf8ng4=
X-Received: by 2002:a9d:2782:: with SMTP id c2mr23698223otb.323.1626808639585; 
 Tue, 20 Jul 2021 12:17:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlu1DiWxrb5nAh0eHhzsY+2ic2+gbqU2i4C1V+FXl3pFKbUPhL1jSj0mKJcOBPB7HrLgIUxmTowNgwxow/Sfw=
X-Received: by 2002:a9d:2782:: with SMTP id c2mr23698205otb.323.1626808639430; 
 Tue, 20 Jul 2021 12:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210720173336.1876937-1-jsnow@redhat.com>
In-Reply-To: <20210720173336.1876937-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 20 Jul 2021 15:17:08 -0400
Message-ID: <CAFn=p-apTsVqjE3yKzGHgDfWNr1_yzCzxa0jLDTZwLkXYhU-tw@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] python/iotests: Run iotest linters during Python
 CI
To: qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000001236cf05c792e7d6"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001236cf05c792e7d6
Content-Type: text/plain; charset="UTF-8"

I realize that some of this has been covered before:
https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg04221.html

Missed it at the time -- I suppose these patches never went in. I'll rebase
my series and front-load these patches.

--js

On Tue, Jul 20, 2021 at 1:33 PM John Snow <jsnow@redhat.com> wrote:

> GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-package-iotest
> CI: https://gitlab.com/jsnow/qemu/-/pipelines/340144191
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
> - "make check-tox", if you have Python 3.6 through Python 3.10 installed.
>
> See the old commit message for more sample output, etc.
>
> https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg07056.html
>
> V2:
>  - Added patches 1-5 which do some more delinting.
>  - Added patch 8, which scans subdirs for tests to lint.
>  - Added patch 17, which improves the speed of mypy analysis.
>  - Patch 14 is different because of the new patch 8.
>
> Unreviewed patches:
>
> [01] iotests-use-with-statement-for # [SOB] JS
> [02] iotests-use-subprocess.devnull # [SOB] JS
> [03] iotests-mirror-top-perms       # [SOB] JS
> [04] iotests-migrate-bitmaps        # [SOB] JS
> [05] iotests-migrate-bitmaps-test   # [SOB] JS
> [07] iotests-297-add-get_files      # [SOB] JS
> [08] wip-make-the-test-finding      # [SOB] JS
> [14] iotests-297-split-linters-py   # [SOB] JS
> [17] iotests-297-check-mypy-files   # [SOB] JS
>
> --js
>
> John Snow (17):
>   iotests: use with-statement for open() calls
>   iotests: use subprocess.DEVNULL instead of open("/dev/null")
>   iotests/mirror-top-perms: Adjust import paths
>   iotests/migrate-bitmaps-postcopy-test: declare instance variables
>   iotests/migrate-bitmaps-test: delint
>   iotests/297: modify is_python_file to work from any CWD
>   iotests/297: Add get_files() function
>   iotests/297: Include sub-directories when finding tests to lint
>   iotests/297: Don't rely on distro-specific linter binaries
>   iotests/297: Create main() function
>   iotests/297: Separate environment setup from test execution
>   iotests/297: Add 'directory' argument to run_linters
>   iotests/297: return error code from run_linters()
>   iotests/297: split linters.py off from 297
>   iotests/linters: Add entry point for Python CI linters
>   python: Add iotest linters to test suite
>   iotests/linters: check mypy files all at once
>
>  python/tests/iotests.sh                       |   2 +
>  tests/qemu-iotests/297                        |  80 ++---------
>  tests/qemu-iotests/iotests.py                 |  21 +--
>  tests/qemu-iotests/linters.py                 | 130 ++++++++++++++++++
>  .../tests/migrate-bitmaps-postcopy-test       |   3 +
>  tests/qemu-iotests/tests/migrate-bitmaps-test |  70 +++++-----
>  tests/qemu-iotests/tests/mirror-top-perms     |   7 +-
>  7 files changed, 198 insertions(+), 115 deletions(-)
>  create mode 100755 python/tests/iotests.sh
>  create mode 100755 tests/qemu-iotests/linters.py
>
> --
> 2.31.1
>
>
>

--0000000000001236cf05c792e7d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I realize that some of this has been covered before: =
<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg04221.h=
tml">https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg04221.html</a=
></div><div><br></div><div>Missed it at the time -- I suppose these patches=
 never went in. I&#39;ll rebase my series and front-load these patches.</di=
v><div><br></div><div>--js<br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 20, 2021 at 1:33 PM John Sn=
ow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">GitLab: <a href=
=3D"https://gitlab.com/jsnow/qemu/-/commits/python-package-iotest" rel=3D"n=
oreferrer" target=3D"_blank">https://gitlab.com/jsnow/qemu/-/commits/python=
-package-iotest</a><br>
CI: <a href=3D"https://gitlab.com/jsnow/qemu/-/pipelines/340144191" rel=3D"=
noreferrer" target=3D"_blank">https://gitlab.com/jsnow/qemu/-/pipelines/340=
144191</a><br>
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
- &quot;make check-tox&quot;, if you have Python 3.6 through Python 3.10 in=
stalled.<br>
<br>
See the old commit message for more sample output, etc.<br>
<br>
<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg07056.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archive/htm=
l/qemu-devel/2021-06/msg07056.html</a><br>
<br>
V2:<br>
=C2=A0- Added patches 1-5 which do some more delinting.<br>
=C2=A0- Added patch 8, which scans subdirs for tests to lint.<br>
=C2=A0- Added patch 17, which improves the speed of mypy analysis.<br>
=C2=A0- Patch 14 is different because of the new patch 8.<br>
<br>
Unreviewed patches:<br>
<br>
[01] iotests-use-with-statement-for # [SOB] JS<br>
[02] iotests-use-subprocess.devnull # [SOB] JS<br>
[03] iotests-mirror-top-perms=C2=A0 =C2=A0 =C2=A0 =C2=A0# [SOB] JS<br>
[04] iotests-migrate-bitmaps=C2=A0 =C2=A0 =C2=A0 =C2=A0 # [SOB] JS<br>
[05] iotests-migrate-bitmaps-test=C2=A0 =C2=A0# [SOB] JS<br>
[07] iotests-297-add-get_files=C2=A0 =C2=A0 =C2=A0 # [SOB] JS<br>
[08] wip-make-the-test-finding=C2=A0 =C2=A0 =C2=A0 # [SOB] JS<br>
[14] iotests-297-split-linters-py=C2=A0 =C2=A0# [SOB] JS<br>
[17] iotests-297-check-mypy-files=C2=A0 =C2=A0# [SOB] JS<br>
<br>
--js<br>
<br>
John Snow (17):<br>
=C2=A0 iotests: use with-statement for open() calls<br>
=C2=A0 iotests: use subprocess.DEVNULL instead of open(&quot;/dev/null&quot=
;)<br>
=C2=A0 iotests/mirror-top-perms: Adjust import paths<br>
=C2=A0 iotests/migrate-bitmaps-postcopy-test: declare instance variables<br=
>
=C2=A0 iotests/migrate-bitmaps-test: delint<br>
=C2=A0 iotests/297: modify is_python_file to work from any CWD<br>
=C2=A0 iotests/297: Add get_files() function<br>
=C2=A0 iotests/297: Include sub-directories when finding tests to lint<br>
=C2=A0 iotests/297: Don&#39;t rely on distro-specific linter binaries<br>
=C2=A0 iotests/297: Create main() function<br>
=C2=A0 iotests/297: Separate environment setup from test execution<br>
=C2=A0 iotests/297: Add &#39;directory&#39; argument to run_linters<br>
=C2=A0 iotests/297: return error code from run_linters()<br>
=C2=A0 iotests/297: split linters.py off from 297<br>
=C2=A0 iotests/linters: Add entry point for Python CI linters<br>
=C2=A0 python: Add iotest linters to test suite<br>
=C2=A0 iotests/linters: check mypy files all at once<br>
<br>
=C2=A0python/tests/iotests.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0tests/qemu-iotests/297=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 80 ++---------<br>
=C2=A0tests/qemu-iotests/iotests.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 21 +--<br>
=C2=A0tests/qemu-iotests/linters.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 130 ++++++++++++++++++<br>
=C2=A0.../tests/migrate-bitmaps-postcopy-test=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A03 +<br>
=C2=A0tests/qemu-iotests/tests/migrate-bitmaps-test |=C2=A0 70 +++++-----<b=
r>
=C2=A0tests/qemu-iotests/tests/mirror-top-perms=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A07 +-<br>
=C2=A07 files changed, 198 insertions(+), 115 deletions(-)<br>
=C2=A0create mode 100755 python/tests/iotests.sh<br>
=C2=A0create mode 100755 tests/qemu-iotests/linters.py<br>
<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div>

--0000000000001236cf05c792e7d6--


