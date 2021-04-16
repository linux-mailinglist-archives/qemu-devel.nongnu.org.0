Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C812D3628AE
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:32:11 +0200 (CEST)
Received: from localhost ([::1]:41508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXUCI-0001Cj-Ry
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lXU8m-0006eo-6G
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:28:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lXU8h-0003Nm-WD
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:28:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618601306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SCwqpNb+MSNAIvMb7bC3+Ey7FAQ+H4c2d4YL+a8Lvkc=;
 b=dftL9Lut6uJcU9kJ9tA5B3imCL0bAOHHNuV1jaTb8ubBpeb7bSAgoQ/VPH/K+WIXi/k24+
 gzIBWO2uE1FJ7ht+e6Ea63qbkBfcHG9x3IO1pg7ZhN6WaGW0E1f4xOiCOwcbuUKeX1qtjf
 dfv5nNTkDQZdkMDOPhERaBvqoTf6kH8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-4uGgJhL5PyiLIL_8w6OSqg-1; Fri, 16 Apr 2021 15:28:25 -0400
X-MC-Unique: 4uGgJhL5PyiLIL_8w6OSqg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 623376D582
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 19:28:24 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1691210023B2;
 Fri, 16 Apr 2021 19:28:20 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] [DO-NOT-MERGE] qapi: static typing conversion, "pt0"
Date: Fri, 16 Apr 2021 15:28:15 -0400
Message-Id: <20210416192819.2958482-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a manual testing pre-requisite for other QAPI cleanup=0D
patches. It isn't polished, and I am not ready to polish it, so it's=0D
included here as an informative basis for ongoing work only.=0D
=0D
It changes the default role for Sphinx markup involving single-backticks=0D
from "default", which merely renders text as if it was a ``literal``, to=0D
"any", which behaves like a cross-reference target.=0D
=0D
To do this, existing uses of the single-backtick markup are converted=0D
(whenever they do not resolve to something meaningful), to=0D
double-backticks.=0D
=0D
Then, sphinx-autodoc is enabled for the scripts/qapi package so that=0D
docstring formatting can be validated and inspected to make sure the=0D
output looks "nice". It is not necessarily how we'd want to expose this=0D
information, ultimately, but serves as a good smoke test for base-line=0D
docstring consistency.=0D
=0D
Lastly, some scripts/tools for running linters with "canonical"=0D
configurations are provided as a means to verify the linting=0D
base-line. I use these to validate my own work.=0D
=0D
John Snow (4):=0D
  [DO-NOT-MERGE] docs: replace single backtick (`) with double-backtick=0D
    (``)=0D
  [DO-NOT-MERGE] docs/sphinx: change default role to "any"=0D
  [DO-NOT-MERGE] docs: enable sphinx-autodoc for scripts/qapi=0D
  [DO-NOT-MERGE]: Add some ad-hoc linting helpers.=0D
=0D
 docs/conf.py                               |   6 +-=0D
 docs/devel/build-system.rst                | 146 ++++++++++-----------=0D
 docs/devel/fuzzing.rst                     |   9 +-=0D
 docs/devel/index.rst                       |   1 +=0D
 docs/devel/migration.rst                   |  59 +++++----=0D
 docs/devel/python/index.rst                |   7 +=0D
 docs/devel/python/qapi.commands.rst        |   7 +=0D
 docs/devel/python/qapi.common.rst          |   7 +=0D
 docs/devel/python/qapi.error.rst           |   7 +=0D
 docs/devel/python/qapi.events.rst          |   7 +=0D
 docs/devel/python/qapi.expr.rst            |   7 +=0D
 docs/devel/python/qapi.gen.rst             |   7 +=0D
 docs/devel/python/qapi.introspect.rst      |   7 +=0D
 docs/devel/python/qapi.main.rst            |   7 +=0D
 docs/devel/python/qapi.parser.rst          |   8 ++=0D
 docs/devel/python/qapi.rst                 |  26 ++++=0D
 docs/devel/python/qapi.schema.rst          |   7 +=0D
 docs/devel/python/qapi.source.rst          |   7 +=0D
 docs/devel/python/qapi.types.rst           |   7 +=0D
 docs/devel/python/qapi.visit.rst           |   7 +=0D
 docs/devel/qgraph.rst                      |   8 +-=0D
 docs/devel/tcg-plugins.rst                 |  14 +-=0D
 docs/devel/testing.rst                     |   8 +-=0D
 docs/interop/live-block-operations.rst     |   4 +-=0D
 docs/system/arm/cpu-features.rst           | 116 ++++++++--------=0D
 docs/system/arm/nuvoton.rst                |   2 +-=0D
 docs/system/arm/sbsa.rst                   |   4 +-=0D
 docs/system/cpu-hotplug.rst                |   2 +-=0D
 docs/system/guest-loader.rst               |   6 +-=0D
 docs/system/ppc/powernv.rst                |   8 +-=0D
 docs/system/removed-features.rst           |   2 +-=0D
 docs/system/riscv/microchip-icicle-kit.rst |   2 +-=0D
 docs/system/s390x/protvirt.rst             |  12 +-=0D
 qapi/block-core.json                       |   4 +-=0D
 scripts/qapi-lint.sh                       |  29 ++++=0D
 scripts/qapi/Makefile                      |   5 +=0D
 36 files changed, 370 insertions(+), 202 deletions(-)=0D
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
2.30.2=0D
=0D


