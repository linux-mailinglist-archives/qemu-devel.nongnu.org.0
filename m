Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E3F48A42C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 01:07:41 +0100 (CET)
Received: from localhost ([::1]:40880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n74hQ-0002Et-8q
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 19:07:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n74At-0007I9-1n
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:34:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n74Aq-0000Xo-IM
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:34:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641857640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+PAO/Fr3sXUvLVvUTtB1Q0r+15/oTHs4s8bJO/rE+9w=;
 b=Ub+UayRr9CWhCA9Hi0CMAdPQ563wkqIz5FjomjIQZld7BchAAP11VtCVzwkWABFESwTjuq
 iBKlQYDPBXRVWZSIvh9eo3LuFnEuViAza4gItNMCFhenAxx4Q7Obh85XC5biNM3uQqMCkM
 4QNOT/etgGF6ICGbOvJGKNz5ccsFbWg=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-GJjKPqDAN6yvjVrlj9mNbg-1; Mon, 10 Jan 2022 18:33:58 -0500
X-MC-Unique: GJjKPqDAN6yvjVrlj9mNbg-1
Received: by mail-vk1-f200.google.com with SMTP id
 h6-20020a1f2106000000b0031862a566cbso713469vkh.18
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 15:33:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+PAO/Fr3sXUvLVvUTtB1Q0r+15/oTHs4s8bJO/rE+9w=;
 b=vKBl1SMtpxxYBK/ujmt5At9E2PtIaQlQhlS0ELvjctBn2RVFcLBw60ruM43FUOJ9gj
 CJIHf6ILNUiBim1ma2HJGjP/5OSphB2L/JhnU6vBrP5d5demD0rhjkz9ZSrEYRWCmwT+
 Doz3gVIDNoudJAoST688PUDVzzYbiXZSGrO/V++AN3pbCpHboQqq0frqeg51+zgxYJr/
 4qNP01Z3veV3gXLBgnvPeqhXRNQAycf/RZzkvorY4p7ESNcnNzkEZbo/VQVeaofNQ6Kk
 DbLav5esdipd2Zpo2q4+CR4BrP9Hx4r3t9NA0tJQ4KvzklVr+Lsqvqt48vMLMc5UYsiS
 37Wg==
X-Gm-Message-State: AOAM530rK6kh7r5CmYiGJ5WpEalfnrigWEst0HiGYJRZ88mFMqNfGgNr
 xQG6qKs/pQSO8qevuaaULuRYxGHoisE0yOw1FH0xiRPcgcDSiZhKtQiMMCs8wv81QV7sTY1roUS
 ivoaVD9Iz7FjT7TTGnDy6kCM7ScqlnN8=
X-Received: by 2002:a67:ce0b:: with SMTP id s11mr1114143vsl.38.1641857637996; 
 Mon, 10 Jan 2022 15:33:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1cx1/KbH2gLatuOKeWbdWtWetF8RIGEUxMLsHn+OytiYQ38oFlxSby0VlYTZ+CwNbIrXSWkUFRIPZhwVi7p0=
X-Received: by 2002:a67:ce0b:: with SMTP id s11mr1114133vsl.38.1641857637725; 
 Mon, 10 Jan 2022 15:33:57 -0800 (PST)
MIME-Version: 1.0
References: <20220110232910.1923864-1-jsnow@redhat.com>
In-Reply-To: <20220110232910.1923864-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 10 Jan 2022 18:33:47 -0500
Message-ID: <CAFn=p-ZmD6qda5n2H37pg0ZOR1udLpCK1jpmUYWjGmXGwkt=5w@mail.gmail.com>
Subject: Re: [PATCH v3 00/31] Python: delete synchronous qemu.qmp package
To: qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000044cdd005d542c51f"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000044cdd005d542c51f
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 10, 2022 at 6:29 PM John Snow <jsnow@redhat.com> wrote:

> Based-on: <20220110232521.1922962-1-jsnow@redhat.com>
>           (jsnow/python staging branch)
>

Sorry, I goofed. This series accidentally re-includes these patches. You
can ignore the first four patches, or apply directly on top of
origin/master. Sorry for the inconvenience.

--js


> GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-qmp-legacy-switch
> CI: https://gitlab.com/jsnow/qemu/-/pipelines/445163212
>
> Hi, this series is part of an effort to publish the qemu.qmp package on
> PyPI. It is the first of three series to complete this work:
>
> --> (1) Switch the new Async QMP library in to python/qemu/qmp
>     (2) Fork python/qemu/qmp out into its own repository,
>         with updated GitLab CI/CD targets to build packages.
>     (3) Update qemu.git to install qemu.qmp from PyPI,
>         and then delete python/qemu/qmp.
>
> This series swaps out qemu.qmp for qemu.aqmp permanently, instead of
> hiding it behind an environment variable toggle. This leaves us with
> just one QMP library to worry about. It also implements the rename of
> "qemu.aqmp" to "qemu.qmp".
>
> I suspect the most potential disruption to iotest and avocado
> maintainers, as those two subsystems rely on the QMP features the
> most. Would appreciate at least an ACK from each of those camps if
> you're willing to give benefit-of-the-doubt on the actual Python code.
>
> V3:
>  - Rebased on top of jsnow/python (For GitLab CI fixes)
>  - Added a new patch 001 to fix a typo Vladimir found.
>  - Tiny change in 006 due to the new patch 001
>  - Reworded subject of patch 007
>  - Changed import statement in patch 013 (Vladimir)
>  - Rebase-related changes in patch 021
>  - Removed 'aqmp' from internal variable names in 026
>  - Added new patch to rename aqmp-tui to qmp-tui in 027
>
> V2:
>  - Integrate the renaming of qemu.aqmp to qemu.qmp in this series
>  - Minor bits and pieces.
>
> John Snow (30):
>   python/aqmp: use absolute import statement
>   Python/aqmp: fix type definitions for mypy 0.920
>   python: update type hints for mypy 0.930
>   python/aqmp: fix docstring typo
>   python/aqmp: add __del__ method to legacy interface
>   python/aqmp: handle asyncio.TimeoutError on execute()
>   python/aqmp: copy type definitions from qmp
>   python/aqmp: add SocketAddrT to package root
>   python/aqmp: rename AQMPError to QMPError
>   python/qemu-ga-client: don't use deprecated CLI syntax in usage
>     comment
>   python/qmp: switch qemu-ga-client to AQMP
>   python/qmp: switch qom tools to AQMP
>   python/qmp: switch qmp-shell to AQMP
>   python: move qmp utilities to python/qemu/utils
>   python: move qmp-shell under the AQMP package
>   python/machine: permanently switch to AQMP
>   scripts/cpu-x86-uarch-abi: fix CLI parsing
>   scripts/cpu-x86-uarch-abi: switch to AQMP
>   scripts/render-block-graph: switch to AQMP
>   scripts/bench-block-job: switch to AQMP
>   iotests/mirror-top-perms: switch to AQMP
>   iotests: switch to AQMP
>   python: temporarily silence pylint duplicate-code warnings
>   python/aqmp: take QMPBadPortError and parse_address from qemu.qmp
>   python/aqmp: fully separate from qmp.QEMUMonitorProtocol
>   python/aqmp: copy qmp docstrings to qemu.aqmp.legacy
>   python: remove the old QMP package
>   python: re-enable pylint duplicate-code warnings
>   python: rename qemu.aqmp to qemu.qmp
>   python: rename 'aqmp-tui' to 'qmp-tui'
>
> Stefan Weil (1):
>   simplebench: Fix Python syntax error (reported by LGTM)
>
>  python/qemu/qmp/README.rst                    |   9 -
>  python/qemu/aqmp/__init__.py                  |  51 --
>  python/qemu/aqmp/legacy.py                    | 138 ------
>  python/qemu/aqmp/py.typed                     |   0
>  python/qemu/machine/machine.py                |  18 +-
>  python/qemu/machine/qtest.py                  |   2 +-
>  python/qemu/qmp/__init__.py                   | 441 ++----------------
>  python/qemu/{aqmp => qmp}/error.py            |  12 +-
>  python/qemu/{aqmp => qmp}/events.py           |   6 +-
>  python/qemu/qmp/legacy.py                     | 319 +++++++++++++
>  python/qemu/{aqmp => qmp}/message.py          |   0
>  python/qemu/{aqmp => qmp}/models.py           |   0
>  python/qemu/{aqmp => qmp}/protocol.py         |  33 +-
>  python/qemu/{aqmp => qmp}/qmp_client.py       |  32 +-
>  python/qemu/qmp/qmp_shell.py                  |  31 +-
>  .../qemu/{aqmp/aqmp_tui.py => qmp/qmp_tui.py} |  14 +-
>  python/qemu/{aqmp => qmp}/util.py             |   0
>  python/qemu/{qmp => utils}/qemu_ga_client.py  |  24 +-
>  python/qemu/{qmp => utils}/qom.py             |   5 +-
>  python/qemu/{qmp => utils}/qom_common.py      |   9 +-
>  python/qemu/{qmp => utils}/qom_fuse.py        |  11 +-
>  python/setup.cfg                              |  23 +-
>  python/tests/protocol.py                      |  14 +-
>  scripts/cpu-x86-uarch-abi.py                  |   7 +-
>  scripts/device-crash-test                     |   4 +-
>  scripts/qmp/qemu-ga-client                    |   2 +-
>  scripts/qmp/qom-fuse                          |   2 +-
>  scripts/qmp/qom-get                           |   2 +-
>  scripts/qmp/qom-list                          |   2 +-
>  scripts/qmp/qom-set                           |   2 +-
>  scripts/qmp/qom-tree                          |   2 +-
>  scripts/render_block_graph.py                 |   8 +-
>  scripts/simplebench/bench-example.py          |   2 +-
>  scripts/simplebench/bench_block_job.py        |   5 +-
>  tests/qemu-iotests/iotests.py                 |   2 +-
>  tests/qemu-iotests/tests/mirror-top-perms     |  13 +-
>  36 files changed, 502 insertions(+), 743 deletions(-)
>  delete mode 100644 python/qemu/qmp/README.rst
>  delete mode 100644 python/qemu/aqmp/__init__.py
>  delete mode 100644 python/qemu/aqmp/legacy.py
>  delete mode 100644 python/qemu/aqmp/py.typed
>  rename python/qemu/{aqmp => qmp}/error.py (87%)
>  rename python/qemu/{aqmp => qmp}/events.py (99%)
>  create mode 100644 python/qemu/qmp/legacy.py
>  rename python/qemu/{aqmp => qmp}/message.py (100%)
>  rename python/qemu/{aqmp => qmp}/models.py (100%)
>  rename python/qemu/{aqmp => qmp}/protocol.py (97%)
>  rename python/qemu/{aqmp => qmp}/qmp_client.py (96%)
>  rename python/qemu/{aqmp/aqmp_tui.py => qmp/qmp_tui.py} (98%)
>  rename python/qemu/{aqmp => qmp}/util.py (100%)
>  rename python/qemu/{qmp => utils}/qemu_ga_client.py (94%)
>  rename python/qemu/{qmp => utils}/qom.py (99%)
>  rename python/qemu/{qmp => utils}/qom_common.py (95%)
>  rename python/qemu/{qmp => utils}/qom_fuse.py (97%)
>
> --
> 2.31.1
>
>
>

--00000000000044cdd005d542c51f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 10, 2022 at 6:29 PM John =
Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Based-on: &lt;=
<a href=3D"mailto:20220110232521.1922962-1-jsnow@redhat.com" target=3D"_bla=
nk">20220110232521.1922962-1-jsnow@redhat.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (jsnow/python staging branch)<br></block=
quote><div><br></div><div>Sorry, I goofed. This series accidentally re-incl=
udes these patches. You can ignore the first four patches, or apply directl=
y on top of origin/master. Sorry for the inconvenience.</div><div><br></div=
><div>--js<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
GitLab: <a href=3D"https://gitlab.com/jsnow/qemu/-/commits/python-qmp-legac=
y-switch" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/jsnow/qem=
u/-/commits/python-qmp-legacy-switch</a><br>
CI: <a href=3D"https://gitlab.com/jsnow/qemu/-/pipelines/445163212" rel=3D"=
noreferrer" target=3D"_blank">https://gitlab.com/jsnow/qemu/-/pipelines/445=
163212</a><br>
<br>
Hi, this series is part of an effort to publish the qemu.qmp package on<br>
PyPI. It is the first of three series to complete this work:<br>
<br>
--&gt; (1) Switch the new Async QMP library in to python/qemu/qmp<br>
=C2=A0 =C2=A0 (2) Fork python/qemu/qmp out into its own repository,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 with updated GitLab CI/CD targets to build pack=
ages.<br>
=C2=A0 =C2=A0 (3) Update qemu.git to install qemu.qmp from PyPI,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 and then delete python/qemu/qmp.<br>
<br>
This series swaps out qemu.qmp for qemu.aqmp permanently, instead of<br>
hiding it behind an environment variable toggle. This leaves us with<br>
just one QMP library to worry about. It also implements the rename of<br>
&quot;qemu.aqmp&quot; to &quot;qemu.qmp&quot;.<br>
<br>
I suspect the most potential disruption to iotest and avocado<br>
maintainers, as those two subsystems rely on the QMP features the<br>
most. Would appreciate at least an ACK from each of those camps if<br>
you&#39;re willing to give benefit-of-the-doubt on the actual Python code.<=
br>
<br>
V3:<br>
=C2=A0- Rebased on top of jsnow/python (For GitLab CI fixes)<br>
=C2=A0- Added a new patch 001 to fix a typo Vladimir found.<br>
=C2=A0- Tiny change in 006 due to the new patch 001<br>
=C2=A0- Reworded subject of patch 007<br>
=C2=A0- Changed import statement in patch 013 (Vladimir)<br>
=C2=A0- Rebase-related changes in patch 021<br>
=C2=A0- Removed &#39;aqmp&#39; from internal variable names in 026<br>
=C2=A0- Added new patch to rename aqmp-tui to qmp-tui in 027<br>
<br>
V2:<br>
=C2=A0- Integrate the renaming of qemu.aqmp to qemu.qmp in this series<br>
=C2=A0- Minor bits and pieces.<br>
<br>
John Snow (30):<br>
=C2=A0 python/aqmp: use absolute import statement<br>
=C2=A0 Python/aqmp: fix type definitions for mypy 0.920<br>
=C2=A0 python: update type hints for mypy 0.930<br>
=C2=A0 python/aqmp: fix docstring typo<br>
=C2=A0 python/aqmp: add __del__ method to legacy interface<br>
=C2=A0 python/aqmp: handle asyncio.TimeoutError on execute()<br>
=C2=A0 python/aqmp: copy type definitions from qmp<br>
=C2=A0 python/aqmp: add SocketAddrT to package root<br>
=C2=A0 python/aqmp: rename AQMPError to QMPError<br>
=C2=A0 python/qemu-ga-client: don&#39;t use deprecated CLI syntax in usage<=
br>
=C2=A0 =C2=A0 comment<br>
=C2=A0 python/qmp: switch qemu-ga-client to AQMP<br>
=C2=A0 python/qmp: switch qom tools to AQMP<br>
=C2=A0 python/qmp: switch qmp-shell to AQMP<br>
=C2=A0 python: move qmp utilities to python/qemu/utils<br>
=C2=A0 python: move qmp-shell under the AQMP package<br>
=C2=A0 python/machine: permanently switch to AQMP<br>
=C2=A0 scripts/cpu-x86-uarch-abi: fix CLI parsing<br>
=C2=A0 scripts/cpu-x86-uarch-abi: switch to AQMP<br>
=C2=A0 scripts/render-block-graph: switch to AQMP<br>
=C2=A0 scripts/bench-block-job: switch to AQMP<br>
=C2=A0 iotests/mirror-top-perms: switch to AQMP<br>
=C2=A0 iotests: switch to AQMP<br>
=C2=A0 python: temporarily silence pylint duplicate-code warnings<br>
=C2=A0 python/aqmp: take QMPBadPortError and parse_address from qemu.qmp<br=
>
=C2=A0 python/aqmp: fully separate from qmp.QEMUMonitorProtocol<br>
=C2=A0 python/aqmp: copy qmp docstrings to qemu.aqmp.legacy<br>
=C2=A0 python: remove the old QMP package<br>
=C2=A0 python: re-enable pylint duplicate-code warnings<br>
=C2=A0 python: rename qemu.aqmp to qemu.qmp<br>
=C2=A0 python: rename &#39;aqmp-tui&#39; to &#39;qmp-tui&#39;<br>
<br>
Stefan Weil (1):<br>
=C2=A0 simplebench: Fix Python syntax error (reported by LGTM)<br>
<br>
=C2=A0python/qemu/qmp/README.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 -<br>
=C2=A0python/qemu/aqmp/__init__.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 51 --<br>
=C2=A0python/qemu/aqmp/legacy.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 138 ------<br>
=C2=A0python/qemu/aqmp/py.typed=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0python/qemu/machine/machine.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 18 +-<br>
=C2=A0python/qemu/machine/qtest.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0python/qemu/qmp/__init__.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 441 ++----------------<br>
=C2=A0python/qemu/{aqmp =3D&gt; qmp}/error.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 12 +-<br>
=C2=A0python/qemu/{aqmp =3D&gt; qmp}/events.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0python/qemu/qmp/legacy.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 319 +++++++++++++<br>
=C2=A0python/qemu/{aqmp =3D&gt; qmp}/message.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A00<br>
=C2=A0python/qemu/{aqmp =3D&gt; qmp}/models.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0python/qemu/{aqmp =3D&gt; qmp}/protocol.py=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 33 +-<br>
=C2=A0python/qemu/{aqmp =3D&gt; qmp}/qmp_client.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 32 +-<br>
=C2=A0python/qemu/qmp/qmp_shell.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 31 +-<br>
=C2=A0.../qemu/{aqmp/aqmp_tui.py =3D&gt; qmp/qmp_tui.py} |=C2=A0 14 +-<br>
=C2=A0python/qemu/{aqmp =3D&gt; qmp}/util.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0python/qemu/{qmp =3D&gt; utils}/qemu_ga_client.py=C2=A0 |=C2=A0 24 +-=
<br>
=C2=A0python/qemu/{qmp =3D&gt; utils}/qom.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +-<br>
=C2=A0python/qemu/{qmp =3D&gt; utils}/qom_common.py=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A09 +-<br>
=C2=A0python/qemu/{qmp =3D&gt; utils}/qom_fuse.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 11 +-<br>
=C2=A0python/setup.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 23 +-<br>
=C2=A0python/tests/protocol.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 14 +-<br>
=C2=A0scripts/cpu-x86-uarch-abi.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +-<br>
=C2=A0scripts/device-crash-test=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0scripts/qmp/qemu-ga-client=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0scripts/qmp/qom-fuse=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0scripts/qmp/qom-get=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0scripts/qmp/qom-list=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0scripts/qmp/qom-set=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0scripts/qmp/qom-tree=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0scripts/render_block_graph.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0scripts/simplebench/bench-example.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0scripts/simplebench/bench_block_job.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A05 +-<br>
=C2=A0tests/qemu-iotests/iotests.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0tests/qemu-iotests/tests/mirror-top-perms=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
13 +-<br>
=C2=A036 files changed, 502 insertions(+), 743 deletions(-)<br>
=C2=A0delete mode 100644 python/qemu/qmp/README.rst<br>
=C2=A0delete mode 100644 python/qemu/aqmp/__init__.py<br>
=C2=A0delete mode 100644 python/qemu/aqmp/legacy.py<br>
=C2=A0delete mode 100644 python/qemu/aqmp/py.typed<br>
=C2=A0rename python/qemu/{aqmp =3D&gt; qmp}/error.py (87%)<br>
=C2=A0rename python/qemu/{aqmp =3D&gt; qmp}/events.py (99%)<br>
=C2=A0create mode 100644 python/qemu/qmp/legacy.py<br>
=C2=A0rename python/qemu/{aqmp =3D&gt; qmp}/message.py (100%)<br>
=C2=A0rename python/qemu/{aqmp =3D&gt; qmp}/models.py (100%)<br>
=C2=A0rename python/qemu/{aqmp =3D&gt; qmp}/protocol.py (97%)<br>
=C2=A0rename python/qemu/{aqmp =3D&gt; qmp}/qmp_client.py (96%)<br>
=C2=A0rename python/qemu/{aqmp/aqmp_tui.py =3D&gt; qmp/qmp_tui.py} (98%)<br=
>
=C2=A0rename python/qemu/{aqmp =3D&gt; qmp}/util.py (100%)<br>
=C2=A0rename python/qemu/{qmp =3D&gt; utils}/qemu_ga_client.py (94%)<br>
=C2=A0rename python/qemu/{qmp =3D&gt; utils}/qom.py (99%)<br>
=C2=A0rename python/qemu/{qmp =3D&gt; utils}/qom_common.py (95%)<br>
=C2=A0rename python/qemu/{qmp =3D&gt; utils}/qom_fuse.py (97%)<br>
<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div></div>

--00000000000044cdd005d542c51f--


