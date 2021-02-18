Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 978A431EFF1
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 20:36:57 +0100 (CET)
Received: from localhost ([::1]:43260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCp6e-00018X-KF
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 14:36:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCoy9-0002oP-BQ
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 14:28:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCoy4-0003X9-FK
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 14:28:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613676483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gxKKfmz313lSQsjex46wuXkV3vUw3yxAmRwiuCI6xvE=;
 b=WLQkAJommvkDVV4tEamzGpOnVW8oHdL4MKifMICPfwsTvqlEKgiCdTzlt6sbia83e4ijIB
 zmOK1u6AOmGzYf4WLobwVEim0Tw+1Q4rL3jbjnSeHvZbCBDpG4RvaLhvLKzwe8g2L9n58Y
 9pVuPryCmjpVW7Eh5SlBHevciAKHK/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-jcX_qZalNASZWnE8Hp4uhg-1; Thu, 18 Feb 2021 14:28:01 -0500
X-MC-Unique: jcX_qZalNASZWnE8Hp4uhg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0363180196C;
 Thu, 18 Feb 2021 19:28:00 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B431B60BE5;
 Thu, 18 Feb 2021 19:27:58 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/25] python: add pylint import exceptions
Date: Thu, 18 Feb 2021 14:27:17 -0500
Message-Id: <20210218192733.370968-10-jsnow@redhat.com>
In-Reply-To: <20210218192733.370968-1-jsnow@redhat.com>
References: <20210218192733.370968-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pylint 2.5.x and 2.6.x have regressions that make import checking
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
index cc0d2bb23f9..498d49e7f04 100644
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
2.29.2


