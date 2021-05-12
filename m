Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B1137D59E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 23:54:05 +0200 (CEST)
Received: from localhost ([::1]:47728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgwns-0006IT-TA
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 17:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgwh7-0000tT-BF
 for qemu-devel@nongnu.org; Wed, 12 May 2021 17:47:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgwh1-0007kb-EF
 for qemu-devel@nongnu.org; Wed, 12 May 2021 17:47:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620856017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4sFJv/DkragtqymWK3EGQqPEsOtYvbU9qn3Y2L90W4c=;
 b=Xi4cAUWeQu5jMVL15ubTU+Jr1/ujE9LvBz9etGPM6PyQrmAoF1JF+Oj4VC4iVOy8Nj2k4Q
 KmM3Cpv0jabp27wSYfN7yF/SPzMiwfpnD0Y4JGPdXAo/IxubYvy+HEKVuMb+TKNHXKmOZi
 xnNI1PfFhBWe/iS5pfD2t8gmA92DmQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-5T9mPvooO-Gd5snqZw3o8w-1; Wed, 12 May 2021 17:46:56 -0400
X-MC-Unique: 5T9mPvooO-Gd5snqZw3o8w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FC80107ACCA;
 Wed, 12 May 2021 21:46:55 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 705955D6AC;
 Wed, 12 May 2021 21:46:54 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/10] iotests: silence spurious consider-using-with warnings
Date: Wed, 12 May 2021 17:46:41 -0400
Message-Id: <20210512214642.2803189-10-jsnow@redhat.com>
In-Reply-To: <20210512214642.2803189-1-jsnow@redhat.com>
References: <20210512214642.2803189-1-jsnow@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In a few cases, we can't use 'with ...' because they belong to
long-running classes that need those items to stay open at the end of
the block. We're handling it, so tell pylint to shush.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py    | 2 +-
 tests/qemu-iotests/testrunner.py | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 5d5ec40429b..e09c991b84e 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -311,7 +311,7 @@ def qemu_nbd_popen(*args):
     cmd.extend(args)
 
     log('Start NBD server')
-    p = subprocess.Popen(cmd)
+    p = subprocess.Popen(cmd)  # pylint: disable=consider-using-with
     try:
         while not os.path.exists(pid_file):
             if p.poll() is not None:
diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 1fc61fcaa34..34fb551c01b 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -258,6 +258,7 @@ def do_run_test(self, test: str) -> TestResult:
 
         t0 = time.time()
         with f_bad.open('w', encoding="utf-8") as f:
+            # pylint: disable=consider-using-with
             proc = subprocess.Popen(args, cwd=str(f_test.parent), env=env,
                                     stdout=f, stderr=subprocess.STDOUT)
             try:
-- 
2.30.2


