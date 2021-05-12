Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7233637EF72
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 01:19:57 +0200 (CEST)
Received: from localhost ([::1]:32998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgy8y-0007sp-Fv
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 19:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy2h-0001dd-4o
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:13:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy2b-00066Q-Nf
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:13:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620861201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8xqRTXZ/EUQ+DXbDJRsVeqEbfAPS+Z7QaTCE9I5/kyE=;
 b=U9p5Fw5ogXA3mb3zsSwTgfyIYN4Zowfzuo0PzYjwUAL6BQp+kaqR1sNFTjoz9E/9lcZsWn
 ErbB/a4N8VxW0XfCG05Iq3Gllv5nTi2OxZfgw7z3RZPIK3GKC/DQjHjo4et6QaFsbIl1O4
 VaPkR7N6DE/mphju4ztaNtq9KjORpPA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-S7TgDNzhN8aEgsHU9fQmgA-1; Wed, 12 May 2021 19:13:18 -0400
X-MC-Unique: S7TgDNzhN8aEgsHU9fQmgA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EACC98049C5;
 Wed, 12 May 2021 23:13:16 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B9CB5B6A3;
 Wed, 12 May 2021 23:13:15 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 09/25] python: add pylint import exceptions
Date: Wed, 12 May 2021 19:12:25 -0400
Message-Id: <20210512231241.2816122-10-jsnow@redhat.com>
In-Reply-To: <20210512231241.2816122-1-jsnow@redhat.com>
References: <20210512231241.2816122-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pylint 2.5.x - 2.7.x have regressions that make import checking
inconsistent, see:

https://github.com/PyCQA/pylint/issues/3609
https://github.com/PyCQA/pylint/issues/3624
https://github.com/PyCQA/pylint/issues/3651

Pinning to 2.4.4 is worse, because it mandates versions of shared
dependencies that are too old for features we want in isort and mypy.
Oh well.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 python/qemu/machine/__init__.py | 3 +++
 python/qemu/machine/machine.py  | 2 +-
 python/qemu/machine/qtest.py    | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/python/qemu/machine/__init__.py b/python/qemu/machine/__init__.py
index 98302ea31e7..728f27adbed 100644
--- a/python/qemu/machine/__init__.py
+++ b/python/qemu/machine/__init__.py
@@ -22,6 +22,9 @@
 # the COPYING file in the top-level directory.
 #
 
+# pylint: disable=import-error
+# see: https://github.com/PyCQA/pylint/issues/3624
+# see: https://github.com/PyCQA/pylint/issues/3651
 from .machine import QEMUMachine
 from .qtest import QEMUQtestMachine, QEMUQtestProtocol
 
diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index dea343afeba..6fe41d83cb5 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -38,7 +38,7 @@
     Type,
 )
 
-from qemu.qmp import (
+from qemu.qmp import (  # pylint: disable=import-error
     QEMUMonitorProtocol,
     QMPMessage,
     QMPReturnValue,
diff --git a/python/qemu/machine/qtest.py b/python/qemu/machine/qtest.py
index 53926e434a7..c3adf4e3012 100644
--- a/python/qemu/machine/qtest.py
+++ b/python/qemu/machine/qtest.py
@@ -26,7 +26,7 @@
     TextIO,
 )
 
-from qemu.qmp import SocketAddrT
+from qemu.qmp import SocketAddrT  # pylint: disable=import-error
 
 from .machine import QEMUMachine
 
-- 
2.30.2


