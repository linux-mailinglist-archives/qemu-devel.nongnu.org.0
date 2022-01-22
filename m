Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C90EC496888
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 01:15:15 +0100 (CET)
Received: from localhost ([::1]:58686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB43m-00035D-Te
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 19:15:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nB3yY-0000Bw-4I
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 19:09:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nB3yR-0005AS-P3
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 19:09:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642810182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=l+RAbLKTVuflfT17AyNwNf+U09fVPrxuk5NR2AgUlCs=;
 b=MrmqRnZCfwBNXnugmFa6m6kC0bnFXktCIKHl2Eo1teLYNVjqz6ANRDuSZn45s2UI0KZ9z4
 D+a21h+ruihflqDI22YvL92PYq7h/2GJBN4Gkgra8ORsEfvIkqmlZcsu0RWv8hnsJCwWsa
 Ee7EVcENuq1sMqkHRk9xaEVisjFEcs8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-75Qe24g8Oje0TpXb-CZOpA-1; Fri, 21 Jan 2022 19:09:41 -0500
X-MC-Unique: 75Qe24g8Oje0TpXb-CZOpA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4895318397A7;
 Sat, 22 Jan 2022 00:09:40 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C99AE66E1B;
 Sat, 22 Jan 2022 00:09:31 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/17] Python patches
Date: Fri, 21 Jan 2022 19:09:14 -0500
Message-Id: <20220122000931.536322-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 5e9d14f2bea6df89c0675df953f9c839560d2266=
:=0D
=0D
  Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-2=
0220121-1' into staging (2022-01-21 10:31:25 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/jsnow/qemu.git tags/python-pull-request=0D
=0D
for you to fetch changes up to 05908602429cf9d6fce9b60704b8395f6d295441:=0D
=0D
  scripts/render-block-graph: switch to AQMP (2022-01-21 16:01:31 -0500)=0D
=0D
----------------------------------------------------------------=0D
Python patches=0D
=0D
A few fixes to the Python CI tests, a few fixes to the (async) QMP=0D
library, and a set of patches that begin to shift us towards using the=0D
new qmp lib.=0D
=0D
----------------------------------------------------------------=0D
=0D
John Snow (17):=0D
  python: pin setuptools below v60.0.0=0D
  python: use avocado's "new" runner=0D
  python/aqmp: fix docstring typo=0D
  python/aqmp: add __del__ method to legacy interface=0D
  python/aqmp: handle asyncio.TimeoutError on execute()=0D
  python/aqmp: copy type definitions from qmp=0D
  python/aqmp: add SocketAddrT to package root=0D
  python/aqmp: rename AQMPError to QMPError=0D
  python/qemu-ga-client: don't use deprecated CLI syntax in usage=0D
    comment=0D
  python/qmp: switch qemu-ga-client to AQMP=0D
  python/qmp: switch qom tools to AQMP=0D
  python/qmp: switch qmp-shell to AQMP=0D
  python: move qmp utilities to python/qemu/utils=0D
  python: move qmp-shell under the AQMP package=0D
  scripts/cpu-x86-uarch-abi: fix CLI parsing=0D
  scripts/cpu-x86-uarch-abi: switch to AQMP=0D
  scripts/render-block-graph: switch to AQMP=0D
=0D
 python/README.rst                            |  2 +-=0D
 python/Makefile                              |  2 +=0D
 python/avocado.cfg                           |  2 +-=0D
 python/qemu/aqmp/__init__.py                 | 16 ++++++--=0D
 python/qemu/aqmp/error.py                    | 12 +++---=0D
 python/qemu/aqmp/events.py                   |  4 +-=0D
 python/qemu/aqmp/legacy.py                   | 41 +++++++++++++++++++-=0D
 python/qemu/aqmp/protocol.py                 | 24 +++++++-----=0D
 python/qemu/aqmp/qmp_client.py               | 16 +++++---=0D
 python/qemu/{qmp =3D> aqmp}/qmp_shell.py       | 31 ++++++++-------=0D
 python/qemu/{qmp =3D> utils}/qemu_ga_client.py | 24 ++++++------=0D
 python/qemu/{qmp =3D> utils}/qom.py            |  5 ++-=0D
 python/qemu/{qmp =3D> utils}/qom_common.py     |  3 +-=0D
 python/qemu/{qmp =3D> utils}/qom_fuse.py       | 11 +++---=0D
 python/setup.cfg                             | 19 ++++-----=0D
 scripts/cpu-x86-uarch-abi.py                 |  7 ++--=0D
 scripts/qmp/qemu-ga-client                   |  2 +-=0D
 scripts/qmp/qmp-shell                        |  2 +-=0D
 scripts/qmp/qom-fuse                         |  2 +-=0D
 scripts/qmp/qom-get                          |  2 +-=0D
 scripts/qmp/qom-list                         |  2 +-=0D
 scripts/qmp/qom-set                          |  2 +-=0D
 scripts/qmp/qom-tree                         |  2 +-=0D
 scripts/render_block_graph.py                |  8 ++--=0D
 24 files changed, 151 insertions(+), 90 deletions(-)=0D
 rename python/qemu/{qmp =3D> aqmp}/qmp_shell.py (96%)=0D
 rename python/qemu/{qmp =3D> utils}/qemu_ga_client.py (94%)=0D
 rename python/qemu/{qmp =3D> utils}/qom.py (98%)=0D
 rename python/qemu/{qmp =3D> utils}/qom_common.py (98%)=0D
 rename python/qemu/{qmp =3D> utils}/qom_fuse.py (97%)=0D
=0D
--=20=0D
2.31.1=0D
=0D


