Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E9631958F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 23:06:43 +0100 (CET)
Received: from localhost ([::1]:50882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAK6k-0002ii-K5
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 17:06:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAK2K-0000W0-VB
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 17:02:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAK2H-0005wu-La
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 17:02:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613080924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SlhHStAinmCUFo//cctDevALFMpnYh+X/wYNb7Rpf5s=;
 b=ZtNKLB9kIOFqEOtjOAvtJXlcByu3CnMZgrvacfAAtdpPisExJaHECQfDjGpTmK4cGVTLJ/
 jtEReeQ8br7Y1ih5hc6QPC5HTTrS/wODe+pO+tXSgQfAnLBrEgo1WjDcwNabPYu1VNuyMU
 2X5+uj54YyG+TtmuAvaRM2XEnoqYFVo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-oaTV2QEONb2azJIeVdswtQ-1; Thu, 11 Feb 2021 17:02:02 -0500
X-MC-Unique: oaTV2QEONb2azJIeVdswtQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9248100CCCC;
 Thu, 11 Feb 2021 22:02:01 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-89.rdu2.redhat.com
 [10.10.116.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C8F860BF1;
 Thu, 11 Feb 2021 22:02:00 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] tests/acceptance/virtio-gpu.py: preserve virtio-user-gpu
 log
Date: Thu, 11 Feb 2021 17:01:46 -0500
Message-Id: <20210211220146.2525771-7-crosa@redhat.com>
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

At location already prepared for keeping the test's log files.

While at it, log info about its location (in the main test log
file), instead of printing it out.

Reference: https://avocado-framework.readthedocs.io/en/85.0/api/test/avocado.html#avocado.Test.logdir
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/virtio-gpu.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/virtio-gpu.py b/tests/acceptance/virtio-gpu.py
index 8d689eb820..ab1a4c1a71 100644
--- a/tests/acceptance/virtio-gpu.py
+++ b/tests/acceptance/virtio-gpu.py
@@ -119,10 +119,11 @@ class VirtioGPUx86(Test):
         os.set_inheritable(vug_sock.fileno(), True)
 
         self._vug_log_path = os.path.join(
-            self.vm.temp_dir, "vhost-user-gpu.log"
+            self.logdir, "vhost-user-gpu.log"
         )
         self._vug_log_file = open(self._vug_log_path, "wb")
-        print(self._vug_log_path)
+        self.log.info('Complete vhost-user-gpu.log file can be '
+                      'found at %s', self._vug_log_path)
 
         vugp = subprocess.Popen(
             [vug, "--virgl", "--fd=%d" % vug_sock.fileno()],
-- 
2.25.4


