Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639FC3B7A20
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 23:53:35 +0200 (CEST)
Received: from localhost ([::1]:55372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyLfi-0005iI-7A
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 17:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyLWR-0001AG-H1
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 17:44:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyLWP-0005tg-Bb
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 17:43:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625003036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t8ZW58GEiHdT5FNdRjpS7u6KaFHPOeri+1N1N5SuD5Q=;
 b=OIJKMPYPfNrRj/0f8ZsUE9n3vuSfSes8dmem3WdtcZDZv4PW80zapJy0M7bMBCoa6x5+T6
 1fDJ2TYciTcdhQIjtoydVDPHYlVt3VI1oaAIuq2d2CG8Wpi+FHleBta5j25lhjvmtw3FU4
 Wc7ynpmq74AahkbrtYigInuoM7xcSnI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-dlEsiFCYM6qLsqUYfLhftA-1; Tue, 29 Jun 2021 17:43:55 -0400
X-MC-Unique: dlEsiFCYM6qLsqUYfLhftA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A09C100C609;
 Tue, 29 Jun 2021 21:43:54 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 322E260C13;
 Tue, 29 Jun 2021 21:43:47 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/15] python: only check qemu/ subdir with flake8
Date: Tue, 29 Jun 2021 17:43:18 -0400
Message-Id: <20210629214323.1329806-11-jsnow@redhat.com>
In-Reply-To: <20210629214323.1329806-1-jsnow@redhat.com>
References: <20210629214323.1329806-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

flake8 is a little eager to check everything it can. Limit it to
checking inside the qemu namespace directory only. Update setup.cfg now
that the exclude patterns are no longer necessary.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/setup.cfg       | 2 --
 python/tests/flake8.sh | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/python/setup.cfg b/python/setup.cfg
index e730f208d3..11f71d5312 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -62,8 +62,6 @@ console_scripts =
 [flake8]
 extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
 exclude = __pycache__,
-          .venv,
-          .tox,
 
 [mypy]
 strict = True
diff --git a/python/tests/flake8.sh b/python/tests/flake8.sh
index 51e0788462..1cd7d40fad 100755
--- a/python/tests/flake8.sh
+++ b/python/tests/flake8.sh
@@ -1,2 +1,2 @@
 #!/bin/sh -e
-python3 -m flake8
+python3 -m flake8 qemu/
-- 
2.31.1


