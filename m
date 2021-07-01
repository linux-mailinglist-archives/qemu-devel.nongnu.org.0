Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D22A53B8BF6
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 04:12:03 +0200 (CEST)
Received: from localhost ([::1]:34838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lymBO-0002Xe-SP
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 22:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lym9D-0008Cy-0f
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 22:09:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lym94-00066W-TJ
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 22:09:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625105377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j/klcslwlJvuHS7pm5ENaAWkuJfI8YOZG7TWzVKE0wo=;
 b=PMqd9291zQalCwPl94lmcsy6DikIX/jNC5tLUTATDMtmZnxDzUrWIJVPoqiljIQlTDyJ+u
 NxMpp8S93Hdo9xNFtrU6m4xO5DzgFDV3I7LskEqmEUonBvvAdN3NKrtmtEnxesS+jAbyQB
 h0TNjYNVE3LDPwJBoFDDMyGhGFzbMAk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-JvSFot-zObSzIQlB4MPzKg-1; Wed, 30 Jun 2021 22:09:36 -0400
X-MC-Unique: JvSFot-zObSzIQlB4MPzKg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01203801B0A;
 Thu,  1 Jul 2021 02:09:35 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED67B5FC03;
 Thu,  1 Jul 2021 02:09:33 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/15] python: Remove global pylint suppressions
Date: Wed, 30 Jun 2021 22:09:09 -0400
Message-Id: <20210701020921.1679468-4-jsnow@redhat.com>
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

These suppressions only apply to a small handful of places. Instead of
disabling them globally, disable them just in the cases where we
need. The design of the machine class grew quite organically with tons
of constructor and class instance variables -- there's little chance of
meaningfully refactoring it in the near term, so just suppress the
warnings for that class.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-id: 20210629214323.1329806-4-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
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


