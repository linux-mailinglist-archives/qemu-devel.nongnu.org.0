Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA85C2DA44E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 00:44:22 +0100 (CET)
Received: from localhost ([::1]:45768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koxVt-00078M-6H
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 18:44:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1koxTh-0005yO-LU
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 18:42:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1koxTe-0007tM-SN
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 18:42:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607989319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E+TMPUDsyJxg03Z+jyI8bmx7h8MaLVF+qLL1/r6cYa0=;
 b=ffCnTzEWL4lji4QRaynwTSsN9v5LaeKD62WmIWuOGZy/fPKlFwMfWgRH5WTOd0yejTk1bt
 qubgdu5zTQJQgP41gjNLLfIkMtaqqsp1KW8ZZJW4fYe19TLCVT+cN695TH9+1sx9cEea02
 chQrvGbSMwtZ7TBnr66v9WGeln4QiA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-DecwqRKDOSCHQVdnVX2FRQ-1; Mon, 14 Dec 2020 18:41:58 -0500
X-MC-Unique: DecwqRKDOSCHQVdnVX2FRQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FD99107ACF5
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 23:41:57 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-117.rdu2.redhat.com [10.10.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 797B11975F;
 Mon, 14 Dec 2020 23:41:46 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] qapi: sphinx-autodoc for qapi module
Date: Mon, 14 Dec 2020 18:41:42 -0500
Message-Id: <20201214234145.1005829-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Merely a testing pre-requisite to prove consistency for docstrings in=0D
QAPI refactors, not intended for review or merge.=0D
=0D
John Snow (3):=0D
  [DO-NOT-MERGE] docs: replace single backtick (`) with double-backtick=0D
    (``)=0D
  [DO-NOT-MERGE] docs/sphinx: change default role to "any"=0D
  [DO-NOT-MERGE] docs: enable sphinx-autodoc for scripts/qapi=0D
=0D
 docs/conf.py                           |   6 +-=0D
 docs/devel/build-system.rst            | 148 ++++++++++++-------------=0D
 docs/devel/index.rst                   |   1 +=0D
 docs/devel/migration.rst               |  59 +++++-----=0D
 docs/devel/python/index.rst            |   7 ++=0D
 docs/devel/python/qapi.commands.rst    |   7 ++=0D
 docs/devel/python/qapi.common.rst      |   7 ++=0D
 docs/devel/python/qapi.error.rst       |   7 ++=0D
 docs/devel/python/qapi.events.rst      |   7 ++=0D
 docs/devel/python/qapi.expr.rst        |   7 ++=0D
 docs/devel/python/qapi.gen.rst         |   7 ++=0D
 docs/devel/python/qapi.introspect.rst  |   7 ++=0D
 docs/devel/python/qapi.main.rst        |   7 ++=0D
 docs/devel/python/qapi.parser.rst      |   8 ++=0D
 docs/devel/python/qapi.rst             |  26 +++++=0D
 docs/devel/python/qapi.schema.rst      |   7 ++=0D
 docs/devel/python/qapi.source.rst      |   7 ++=0D
 docs/devel/python/qapi.types.rst       |   7 ++=0D
 docs/devel/python/qapi.visit.rst       |   7 ++=0D
 docs/devel/tcg-plugins.rst             |  14 +--=0D
 docs/devel/testing.rst                 |   2 +-=0D
 docs/interop/live-block-operations.rst |   4 +-=0D
 docs/system/arm/cpu-features.rst       | 110 +++++++++---------=0D
 docs/system/arm/nuvoton.rst            |   2 +-=0D
 docs/system/arm/sbsa.rst               |   4 +-=0D
 docs/system/cpu-hotplug.rst            |   2 +-=0D
 docs/system/s390x/protvirt.rst         |  10 +-=0D
 qapi/block-core.json                   |   4 +-=0D
 28 files changed, 312 insertions(+), 179 deletions(-)=0D
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
=0D
--=20=0D
2.26.2=0D
=0D


