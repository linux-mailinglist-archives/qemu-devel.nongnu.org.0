Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2085A68A23F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 19:48:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO164-00067D-Fh; Fri, 03 Feb 2023 13:47:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pO162-00066t-BS
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:47:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pO160-0002gV-Fi
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:47:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675450055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=V5hW7ReXiQOSYNV2GXT+fNvs8npy6h/0D2fmXTwu6C8=;
 b=WtXzyNmkRY5yCEXhNeAfjdSLBY5Vc5hj0szLLlf/XaCM9CLOSsBVCYgEToardDAzUr8wAb
 kNBbPwig2fviCvJuW8sveGusdOb1VIldjV1Fe28o7DO2exTRU3+hXupJSgNO7Z0Pcm2POe
 EHFDvStzf9bWo4l740Zp0w1tnWBTS2A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-G-s_I7PIMV-ogrTlTNIMLA-1; Fri, 03 Feb 2023 13:47:33 -0500
X-MC-Unique: G-s_I7PIMV-ogrTlTNIMLA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 976403C14850;
 Fri,  3 Feb 2023 18:47:33 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 525112166B34;
 Fri,  3 Feb 2023 18:47:33 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH v4 0/4] [DO-NOT-MERGE] qapi: static typing conversion, "pt0"
Date: Fri,  3 Feb 2023 13:47:29 -0500
Message-Id: <20230203184733.523522-1-jsnow@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a manual testing pre-requisite for other QAPI cleanup=0D
patches. It isn't meant for inclusion, it's included here as an=0D
informative basis for ongoing work only.=0D
=0D
(Except for the last two patches, which you should totally merge.)=0D
=0D
sphinx-autodoc is enabled for the scripts/qapi package so that docstring=0D
formatting can be validated and inspected to make sure the output looks=0D
"nice". It is not necessarily how we'd want to expose this information,=0D
ultimately, but serves as a good smoke test for base-line docstring=0D
consistency.=0D
=0D
Lastly, some scripts/tools for running linters with "canonical"=0D
configurations are provided as a means to verify the linting=0D
base-line. I use these to validate my own work.=0D
=0D
V4:=0D
 - Rebased on today's origin/master;=0D
 - Updated config files to work with today's linter tool versions.=0D
=0D
John Snow (4):=0D
  [DO-NOT-MERGE] docs: enable sphinx-autodoc for scripts/qapi=0D
  [DO-NOT-MERGE]: Add some ad-hoc linting helpers.=0D
  qapi: Update flake8 config=0D
  qapi: update pylint configuration=0D
=0D
 docs/conf.py                          |  3 ++-=0D
 docs/devel/index.rst                  |  1 +=0D
 docs/devel/python/index.rst           |  7 +++++++=0D
 docs/devel/python/qapi.commands.rst   |  7 +++++++=0D
 docs/devel/python/qapi.common.rst     |  7 +++++++=0D
 docs/devel/python/qapi.error.rst      |  7 +++++++=0D
 docs/devel/python/qapi.events.rst     |  7 +++++++=0D
 docs/devel/python/qapi.expr.rst       |  7 +++++++=0D
 docs/devel/python/qapi.gen.rst        |  7 +++++++=0D
 docs/devel/python/qapi.introspect.rst |  7 +++++++=0D
 docs/devel/python/qapi.main.rst       |  7 +++++++=0D
 docs/devel/python/qapi.parser.rst     |  8 ++++++++=0D
 docs/devel/python/qapi.rst            | 26 ++++++++++++++++++++++++=0D
 docs/devel/python/qapi.schema.rst     |  7 +++++++=0D
 docs/devel/python/qapi.source.rst     |  7 +++++++=0D
 docs/devel/python/qapi.types.rst      |  7 +++++++=0D
 docs/devel/python/qapi.visit.rst      |  7 +++++++=0D
 scripts/qapi-lint.sh                  | 29 +++++++++++++++++++++++++++=0D
 scripts/qapi/.flake8                  |  3 ++-=0D
 scripts/qapi/Makefile                 |  5 +++++=0D
 scripts/qapi/pylintrc                 |  1 +=0D
 21 files changed, 165 insertions(+), 2 deletions(-)=0D
 create mode 100644 docs/devel/python/index.rst=0D
 create mode 100644 docs/devel/python/qapi.commands.rst=0D
 create mode 100644 docs/devel/python/qapi.common.rst=0D
 create mode 100644 docs/devel/python/qapi.error.rst=0D
 create mode 100644 docs/devel/python/qapi.events.rst=0D
 create mode 100644 docs/devel/python/qapi.expr.rst=0D
 create mode 100644 docs/devel/python/qapi.gen.rst=0D
 create mode 100644 docs/devel/python/qapi.introspect.rst=0D
 create mode 100644 docs/devel/python/qapi.main.rst=0D
 create mode 100644 docs/devel/python/qapi.parser.rst=0D
 create mode 100644 docs/devel/python/qapi.rst=0D
 create mode 100644 docs/devel/python/qapi.schema.rst=0D
 create mode 100644 docs/devel/python/qapi.source.rst=0D
 create mode 100644 docs/devel/python/qapi.types.rst=0D
 create mode 100644 docs/devel/python/qapi.visit.rst=0D
 create mode 100755 scripts/qapi-lint.sh=0D
 create mode 100644 scripts/qapi/Makefile=0D
=0D
-- =0D
2.39.0=0D
=0D


