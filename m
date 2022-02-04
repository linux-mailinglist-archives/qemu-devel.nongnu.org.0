Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C476D4AA371
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 23:46:53 +0100 (CET)
Received: from localhost ([::1]:47602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG7Lw-0001lZ-CU
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 17:46:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nG7IK-0000FE-TJ
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 17:43:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nG7IG-00014v-VB
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 17:43:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644014583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=o5b0PYNxoLhzeoagHTNIPqURRGJJA2Vvb2MVZ5YNXmY=;
 b=Bv/pp3n98T1DwDiYOEybPz8kpyV2MR2mhvAVX2UKzzmVNVMl/qg3mgQx+oHi97OKWDt7s4
 RkJmlZJuqC01WjbNJztR/43aJTU49YffncQ7HAA+qoqjSkklZVGGXUfikfcSNMBIFxMx5v
 CPT3DogUb3h/4QNnI9KlCulOcKwYdaw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-CKCAkJDQMBitWBnf74d4yg-1; Fri, 04 Feb 2022 17:43:02 -0500
X-MC-Unique: CKCAkJDQMBitWBnf74d4yg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3937C10B7440
 for <qemu-devel@nongnu.org>; Fri,  4 Feb 2022 22:43:01 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DFB81042A48;
 Fri,  4 Feb 2022 22:42:57 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] [DO-NOT-MERGE] qapi: static typing conversion, "pt0"
Date: Fri,  4 Feb 2022 17:42:54 -0500
Message-Id: <20220204224256.2110500-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a manual testing pre-requisite for other QAPI cleanup=0D
patches. It isn't meant for inclusion, it's included here as an=0D
informative basis for ongoing work only.=0D
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
V3:=0D
 - Happy New Year. Rebased on top of today's origin/master.=0D
=0D
John Snow (2):=0D
  [DO-NOT-MERGE] docs: enable sphinx-autodoc for scripts/qapi=0D
  [DO-NOT-MERGE]: Add some ad-hoc linting helpers.=0D
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
 scripts/qapi/Makefile                 |  5 +++++=0D
 19 files changed, 162 insertions(+), 1 deletion(-)=0D
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
--=20=0D
2.34.1=0D
=0D


