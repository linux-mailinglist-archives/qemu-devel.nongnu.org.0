Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 157E33195A1
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 23:15:09 +0100 (CET)
Received: from localhost ([::1]:40096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAKEs-0002Dt-Sj
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 17:15:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAK2H-0000Nb-6J
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 17:02:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAK2F-0005uU-1P
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 17:02:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613080921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z51YylU3RERj8QTy4DL4D4N0F420V85NDWymj/2W+BM=;
 b=e2cKWR8FWiyUjLvBVa1DdBny7EdmPLX5xDvMXC+iDFAvEY9lZ5FROtd6B96SJtNtwG1UVb
 KhAQ+EZQ40HYPvWKeeuimWB7ZFVoTUxor0EFFw57WraKHnOWb98Lk/KPw3uZMx1k/OGzol
 6YF/f/NinAVSw9KS0RyGdaDo8ByB38M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-jRF9rQ4POKGHeNn1jcqkSA-1; Thu, 11 Feb 2021 17:02:00 -0500
X-MC-Unique: jRF9rQ4POKGHeNn1jcqkSA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECF40801982;
 Thu, 11 Feb 2021 22:01:58 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-89.rdu2.redhat.com
 [10.10.116.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1EF060BF1;
 Thu, 11 Feb 2021 22:01:57 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] Acceptance Tests: log information when creating
 QEMUMachine
Date: Thu, 11 Feb 2021 17:01:44 -0500
Message-Id: <20210211220146.2525771-5-crosa@redhat.com>
In-Reply-To: <20210211220146.2525771-1-crosa@redhat.com>
References: <20210211220146.2525771-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Including its base temporary directory, given that information useful
for debugging can be put there.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index b7ab836455..94b78fd7c8 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -170,10 +170,12 @@ class Test(avocado.Test):
         if self.qemu_bin is None:
             self.cancel("No QEMU binary defined or found in the build tree")
 
-    def _new_vm(self, *args):
+    def _new_vm(self, name, *args):
         self._sd = tempfile.TemporaryDirectory(prefix="avo_qemu_sock_")
         vm = QEMUMachine(self.qemu_bin, base_temp_dir=self.workdir,
                          sock_dir=self._sd.name)
+        self.log.debug('QEMUMachine "%s" created', name)
+        self.log.debug('QEMUMachine "%s" temp_dir: %s', name, vm.temp_dir)
         if args:
             vm.add_args(*args)
         return vm
@@ -186,7 +188,7 @@ class Test(avocado.Test):
         if not name:
             name = str(uuid.uuid4())
         if self._vms.get(name) is None:
-            self._vms[name] = self._new_vm(*args)
+            self._vms[name] = self._new_vm(name, *args)
             if self.machine is not None:
                 self._vms[name].set_machine(self.machine)
         return self._vms[name]
-- 
2.25.4


