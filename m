Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC276495756
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 01:27:09 +0100 (CET)
Received: from localhost ([::1]:34562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAhlj-0007mC-IB
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 19:27:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nAhcx-00088z-J8
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 19:18:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nAhct-00023l-Vn
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 19:18:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642724278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tRuchy//nIFDL1IRei96ygVg05GpRiq6w+C8MwZIT8E=;
 b=AYFE7JGojCkdvgKlLWItjgX2uFovZj6XgR2r2h3PBUKYVN3yRMWd0LHAqFmCcNhbo7F/pe
 JozWGGJfrt7i44COG8JBCCReUA2RPLMlZBgJvJcSUVNm9Zv/wjRpGnrg62JCF2XUCOs0Wa
 akdlaYOVKDMitEqw3TiIXxmngWZkz1o=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-lbRzCdZoNQ-1C8Oi4vn_6A-1; Thu, 20 Jan 2022 19:17:57 -0500
X-MC-Unique: lbRzCdZoNQ-1C8Oi4vn_6A-1
Received: by mail-vk1-f198.google.com with SMTP id
 q19-20020a056122117300b0031da4c7a0c0so584313vko.18
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 16:17:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tRuchy//nIFDL1IRei96ygVg05GpRiq6w+C8MwZIT8E=;
 b=2lrzb7xmh9bZ3KUcDf+y1y2Nyb6PAoCuQDqxJVetpSBFJ1YEWwbflQSF3Qii4qg039
 z2p1IpOcL2uE26Fre4ir84XC5buoWsUpUl6J0YZDV8ZdLznRjqF5cqF5ivrwcAxnSFw2
 kQX4I3QV4xL1jYRgf+WQRid1WVQPKVn/kHUj9k1jLJN5EXW9P6K3Xy0qbMfs2AK0qpyB
 o0VYS0LOCX4pm8CZCE3d4K2ck2Tl8mTD3j1zZfTPgWftaa9UFwjpoRZQ44lgu7DZgQff
 m+TvnvysTY8CBhqxf9nyNZuuWp3hqBEgvGsN8s6mQ9GHvhSMFqAiMz/jgsJom0Kk8089
 O/DA==
X-Gm-Message-State: AOAM532Vh8UU9R17qVwzXgtZ+sh2QGkvcPLXmX74oqV3Xd+Tmj9C/MQm
 MRE06VWcyhdrWONGqifQXDNoK+rxpxb5PEekRMhqmYWjbuzGr6lS5UHHP5XSGR4y8LCp+tzr9uF
 eb29IU6W2xnkkkVmM9Y9A/IyFQQUN4SE=
X-Received: by 2002:a1f:2d8a:: with SMTP id t132mr755961vkt.3.1642724277119;
 Thu, 20 Jan 2022 16:17:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyeufWoeozj/KJWM1nN9mEMqs//XbpX/WWHdXk8Rb/FjxrOafw6ki6YPxYlWZ0xD9y/8YY1JkAg36t6/rBczng=
X-Received: by 2002:a1f:2d8a:: with SMTP id t132mr755942vkt.3.1642724276754;
 Thu, 20 Jan 2022 16:17:56 -0800 (PST)
MIME-Version: 1.0
References: <20220110232910.1923864-1-jsnow@redhat.com>
In-Reply-To: <20220110232910.1923864-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 20 Jan 2022 19:17:46 -0500
Message-ID: <CAFn=p-ZVeHr_=T4krkRagXGisL+ta7YFB5gxA=Lfcg9TrNBr0Q@mail.gmail.com>
Subject: Re: [PATCH v3 00/31] Python: delete synchronous qemu.qmp package
To: qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Jan 10, 2022 at 6:29 PM John Snow <jsnow@redhat.com> wrote:
>
> Based-on: <20220110232521.1922962-1-jsnow@redhat.com>
>           (jsnow/python staging branch)
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

Patches 1-4 were already merged.
I'm staging patches 5-16, and 18-20.

I'm leaving behind patches 17 and 21-23 for further review;
patches 24-31 can be staged separately after 17, 21-23 go ahead.

--js

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


