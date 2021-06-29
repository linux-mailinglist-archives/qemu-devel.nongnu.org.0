Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6683B7A09
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 23:47:33 +0200 (CEST)
Received: from localhost ([::1]:33868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyLZs-0007m7-71
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 17:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyLWA-0000IN-Hg
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 17:43:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyLW6-0005fK-CD
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 17:43:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625003017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LZAV0BMxzcjkPZA/fUmKVUcOwCJeaXKwTq+VTy5SQWw=;
 b=I8P1n1PJGU79rnXq+hgngDwjycH/fyQ9/R5dIRYLBzHLHar4cNFOSdS8uYZ576/Cy7Q4rv
 lBnROiQ6uG5BwlqeKVkiiqT5jDNL08FTVVNwbx4FV8kBg+c+xncVuUpTIlhZuRrVlKz5q8
 TggtI/kO8znNGC8XM8IyRmAI4+fc2gM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-BJUzBHP_N_2MRPE9meNZPg-1; Tue, 29 Jun 2021 17:43:36 -0400
X-MC-Unique: BJUzBHP_N_2MRPE9meNZPg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3652815346;
 Tue, 29 Jun 2021 21:43:35 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E9F860C13;
 Tue, 29 Jun 2021 21:43:34 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/15] python: Remove global pylint suppressions
Date: Tue, 29 Jun 2021 17:43:11 -0400
Message-Id: <20210629214323.1329806-4-jsnow@redhat.com>
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These suppressions only apply to a small handful of places. Instead of
disabling them globally, disable them just in the cases where we
need. The design of the machine class grew quite organically with tons
of constructor and class instance variables -- there's little chance of
meaningfully refactoring it in the near term, so just suppress the
warnings for that class.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 python/qemu/machine/machine.py | 3 +++
 python/qemu/machine/qtest.py   | 2 ++
 python/setup.cfg               | 4 +---
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index b62435528e..e3345dfa1b 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -84,6 +84,7 @@ class QEMUMachine:
             ...
         # vm is guaranteed to be shut down here
     """
+    # pylint: disable=too-many-instance-attributes, too-many-public-methods
 
     def __init__(self,
                  binary: str,
@@ -111,6 +112,8 @@ def __init__(self,
         @param console_log: (optional) path to console log file
         @note: Qemu process is not started until launch() is used.
         '''
+        # pylint: disable=too-many-arguments
+
         # Direct user configuration
 
         self._binary = binary
diff --git a/python/qemu/machine/qtest.py b/python/qemu/machine/qtest.py
index 93700684d1..d6d9c6a34a 100644
--- a/python/qemu/machine/qtest.py
+++ b/python/qemu/machine/qtest.py
@@ -116,6 +116,8 @@ def __init__(self,
                  base_temp_dir: str = "/var/tmp",
                  socket_scm_helper: Optional[str] = None,
                  sock_dir: Optional[str] = None):
+        # pylint: disable=too-many-arguments
+
         if name is None:
             name = "qemu-%d" % os.getpid()
         if sock_dir is None:
diff --git a/python/setup.cfg b/python/setup.cfg
index db1639c1f2..524789d6e0 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -87,9 +87,7 @@ ignore_missing_imports = True
 # --enable=similarities". If you want to run only the classes checker, but have
 # no Warning level messages displayed, use "--disable=all --enable=classes
 # --disable=W".
-disable=too-many-arguments,
-        too-many-instance-attributes,
-        too-many-public-methods,
+disable=
 
 [pylint.basic]
 # Good variable names which should always be accepted, separated by a comma.
-- 
2.31.1


