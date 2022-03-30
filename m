Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EE94ECC53
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 20:33:22 +0200 (CEST)
Received: from localhost ([::1]:34762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZd8E-0006Pa-1L
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 14:33:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZczg-0006TS-IR
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:24:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZcze-0005EN-6d
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:24:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648664669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9n7jCaqciyAqXVEAOxjb9DNTeS/+3EYtIUv5FKFjSA4=;
 b=erRgZ+azbosj6c9Fdcclf1ibFwgXmSv9tkgZX4w2uMjcOZv63oMebSlF39j1R44GWVtayD
 Epb1d3lkOPrGqRxp0MNFJPPitc0Sh/PXzFAyTH2YML3OIx8aw0eAlukRXkjnE2UgDKQUzB
 T3r3HQE/zAPf+51s2p8xVK5uVH8bGoI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-rnaBZhy-Mx2cmA8vka50UA-1; Wed, 30 Mar 2022 14:24:25 -0400
X-MC-Unique: rnaBZhy-Mx2cmA8vka50UA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFA1B101A54C
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 18:24:24 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.35.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 754B52166B3F;
 Wed, 30 Mar 2022 18:24:24 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu.qmp PATCH 00/13] python: fork qemu.qmp python lib into
 independent repo
Date: Wed, 30 Mar 2022 14:24:11 -0400
Message-Id: <20220330182424.3438872-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GitLab: https://gitlab.com/jsnow/qemu.qmp/-/commits/pt2a=0D
=0D
Hi, this series is part of an effort to publish the qemu.qmp package on=0D
PyPI. It is the second of three phases to complete this work:=0D
=0D
    (1) Switch the new Async QMP library in to python/qemu/qmp=0D
    (2) Fork python/qemu/qmp out into its own repository.=0D
-->    (2a) Do the bare minimum to be consistent.=0D
       (2b) Add most GitLab CI/CD targets.=0D
       (2c) Add Sphinx doc builds, update docs, and publish to GitLab pages=
.=0D
       (2d) Add dynamic git versioning and GitLab package builds.=0D
    (3) Update qemu.git to install qemu.qmp from PyPI,=0D
        and then delete python/qemu/qmp.=0D
=0D
This series is not meant to apply to qemu.git, rather -- it's the series=0D
that performs the split and would apply to a brand new repository.=0D
=0D
I am submitting it to the QEMU mailing list because:=0D
=0D
(1) To more broadly announce my intentions, and as reference alongside=0D
series #1 and #3 detailed above. It'll be catalogued in the ML archives=0D
this way, too.=0D
=0D
(2) To ask for permission to become the maintainer of a=0D
'qemu-project/py-qemu.qmp' repository, where I would like to host this=0D
subproject.=0D
=0D
(3) To ask for review on the README.rst file which details my intended=0D
contribution guidelines for this subproject.=0D
=0D
(4) To see if there's any feedback on the mechanics of how I forked this=0D
subproject.=0D
=0D
Review notes / points of interest:=0D
=0D
- I use jsnow/qemu.qmp as the repo name throughout the series; that will=0D
  have to be changed eventually, but for the purposes of prototyping, it=0D
  was nicer to have a fully working series.=0D
=0D
- I'm planning on using gitlab issues and MRs for the subproject.=0D
=0D
- The intended versioning paradigm is recorded in patch #10.=0D
=0D
- GitLab integration, automatic package builds, and other fancy features=0D
  are saved for another series. It was getting extremely long, so let's=0D
  stick to the basics, then add on each feature one at a time.=0D
=0D
John Snow (13):=0D
  pylint hotfix=0D
  fork qemu.qmp from qemu.git=0D
  update VERSION to 0.0.0a1=0D
  update maintainer metadata=0D
  update project description=0D
  [FIXME] update project URLs=0D
  add a couple new trove classifiers=0D
  move README.rst to FILES.rst and update=0D
  [FIXME] move PACKAGE.rst to README.rst and update=0D
  docs: add versioning policy to README=0D
  add LGPLv2+ and GPLv2 LICENSE files=0D
  update Pipfile=0D
  remove sub-dependency pins from Pipfile=0D
=0D
 .gitignore            |   2 +-=0D
 FILES.rst             |  67 ++++++=0D
 LICENSE               | 481 ++++++++++++++++++++++++++++++++++++++++++=0D
 LICENSE_GPL2          | 339 +++++++++++++++++++++++++++++=0D
 MANIFEST.in           |   3 +-=0D
 Makefile              |  16 +-=0D
 PACKAGE.rst           |  43 ----=0D
 Pipfile               |   4 +-=0D
 Pipfile.lock          | 288 ++++++++++++++-----------=0D
 README.rst            | 268 +++++++++++++++--------=0D
 VERSION               |   2 +-=0D
 qemu/qmp/__init__.py  |   2 +-=0D
 qemu/qmp/legacy.py    |   4 +-=0D
 qemu/qmp/qmp_shell.py |   2 +-=0D
 qemu/qmp/qmp_tui.py   |   2 +-=0D
 setup.cfg             |  43 ++--=0D
 setup.py              |   2 +-=0D
 17 files changed, 1260 insertions(+), 308 deletions(-)=0D
 create mode 100644 FILES.rst=0D
 create mode 100644 LICENSE=0D
 create mode 100644 LICENSE_GPL2=0D
 delete mode 100644 PACKAGE.rst=0D
=0D
--=20=0D
2.34.1=0D
=0D


