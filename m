Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 045FA3B8C01
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 04:15:10 +0200 (CEST)
Received: from localhost ([::1]:45746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lymEP-0001bW-2J
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 22:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lym9c-00008w-8e
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 22:10:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lym9X-0006DC-6l
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 22:10:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625105405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2tVeL6eQb87gBJ6KHnS4OvsHP+kiJC9+EVeKrssSl8U=;
 b=SYXmd4jvYReo4s9NgigVnJMHSL+Wj+4cJHFa9rxpxxLFuwj6NkHEnGtm4uPQRNHnyRBmgI
 S6A0edWfIrLKzMrpi+Lmof5Wtm8Va+EoTogBmjZveT0tOkFNe4qmojVpGbRTcjf5rLmOwz
 mVKkfUYxzmjM2qO84iRbul4PpnNXC0k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-9AWbdQcJMU-kpIv3_Yfm9Q-1; Wed, 30 Jun 2021 22:09:58 -0400
X-MC-Unique: 9AWbdQcJMU-kpIv3_Yfm9Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 804631084F40;
 Thu,  1 Jul 2021 02:09:57 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 754125FC03;
 Thu,  1 Jul 2021 02:09:56 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/15] python: Fix broken ReST docstrings
Date: Wed, 30 Jun 2021 22:09:21 -0400
Message-Id: <20210701020921.1679468-16-jsnow@redhat.com>
In-Reply-To: <20210701020921.1679468-1-jsnow@redhat.com>
References: <20210701020921.1679468-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch *doesn't* update all of the docstring standards across the
QEMU package directory to make our docstring usage consistent. It
*doesn't* fix the formatting to make it look pretty or reasonable in
generated output. It *does* fix a few small instances where Sphinx would
emit a build warning because of malformed ReST -- If we built our Python
docs with Sphinx.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-id: 20210629214323.1329806-16-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/__init__.py | 6 +++---
 python/qemu/machine/machine.py  | 3 ++-
 python/qemu/qmp/__init__.py     | 1 +
 python/qemu/qmp/qom_common.py   | 2 +-
 python/qemu/utils/accel.py      | 2 +-
 5 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/python/qemu/machine/__init__.py b/python/qemu/machine/__init__.py
index 728f27adbe..9ccd58ef14 100644
--- a/python/qemu/machine/__init__.py
+++ b/python/qemu/machine/__init__.py
@@ -4,10 +4,10 @@
 This library provides a few high-level classes for driving QEMU from a
 test suite, not intended for production use.
 
-- QEMUMachine: Configure and Boot a QEMU VM
- - QEMUQtestMachine: VM class, with a qtest socket.
+ | QEMUQtestProtocol: send/receive qtest messages.
+ | QEMUMachine: Configure and Boot a QEMU VM
+ | +-- QEMUQtestMachine: VM class, with a qtest socket.
 
-- QEMUQtestProtocol: Connect to, send/receive qtest messages.
 """
 
 # Copyright (C) 2020-2021 John Snow for Red Hat Inc.
diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index e3345dfa1b..d47ab3d896 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -545,7 +545,8 @@ def set_qmp_monitor(self, enabled: bool = True) -> None:
         @param enabled: if False, qmp monitor options will be removed from
                         the base arguments of the resulting QEMU command
                         line. Default is True.
-        @note: call this function before launch().
+
+        .. note:: Call this function before launch().
         """
         self._qmp_set = enabled
 
diff --git a/python/qemu/qmp/__init__.py b/python/qemu/qmp/__init__.py
index 376954cb6d..269516a79b 100644
--- a/python/qemu/qmp/__init__.py
+++ b/python/qemu/qmp/__init__.py
@@ -279,6 +279,7 @@ def accept(self, timeout: Optional[float] = 15.0) -> QMPMessage:
                         None). The value passed will set the behavior of the
                         underneath QMP socket as described in [1].
                         Default value is set to 15.0.
+
         @return QMP greeting dict
         @raise OSError on socket connection errors
         @raise QMPConnectError if the greeting is not received
diff --git a/python/qemu/qmp/qom_common.py b/python/qemu/qmp/qom_common.py
index f82b16772d..a59ae1a2a1 100644
--- a/python/qemu/qmp/qom_common.py
+++ b/python/qemu/qmp/qom_common.py
@@ -156,7 +156,7 @@ def command_runner(
         """
         Run a fully-parsed subcommand, with error-handling for the CLI.
 
-        :return: The return code from `.run()`.
+        :return: The return code from `run()`.
         """
         try:
             cmd = cls(args)
diff --git a/python/qemu/utils/accel.py b/python/qemu/utils/accel.py
index 297933df2a..386ff640ca 100644
--- a/python/qemu/utils/accel.py
+++ b/python/qemu/utils/accel.py
@@ -36,7 +36,7 @@ def list_accel(qemu_bin: str) -> List[str]:
     List accelerators enabled in the QEMU binary.
 
     @param qemu_bin (str): path to the QEMU binary.
-    @raise Exception: if failed to run `qemu -accel help`
+    @raise Exception: if failed to run ``qemu -accel help``
     @return a list of accelerator names.
     """
     if not qemu_bin:
-- 
2.31.1


