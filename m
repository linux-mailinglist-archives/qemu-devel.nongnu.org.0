Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B71773F61CA
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 17:37:20 +0200 (CEST)
Received: from localhost ([::1]:48730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIYUJ-0008HI-Eb
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 11:37:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mIYSs-0005t9-S2
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:35:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mIYSr-0004CO-99
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:35:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629819348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PdkYt9HKesmkc3YpAwfw+wua9WnAJLmtEvhQeo4CKbE=;
 b=Mp6GtoYrbQT36fcPxvlUTQNDReOtHXLBltCU9MqAHxxTn/ktngTnSOzk9em4QMIPogo2eu
 2D2SkhfK/AkQIQosL0NqhLqSSBeX5h67rUWmMbgn+IfMDYcHAVVGc2BOYcdOzxwho9jxpm
 WSS84xfWsTLWQw8JIn52KlO1hcbdlKE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-5u42YjvENJeV3WHg09IURA-1; Tue, 24 Aug 2021 11:35:45 -0400
X-MC-Unique: 5u42YjvENJeV3WHg09IURA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C270760C4;
 Tue, 24 Aug 2021 15:35:44 +0000 (UTC)
Received: from localhost (unknown [10.39.192.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F36C55D9C6;
 Tue, 24 Aug 2021 15:35:43 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/2] iotests: Fix unspecified-encoding pylint warnings
Date: Tue, 24 Aug 2021 17:35:39 +0200
Message-Id: <20210824153540.177128-2-hreitz@redhat.com>
In-Reply-To: <20210824153540.177128-1-hreitz@redhat.com>
References: <20210824153540.177128-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As of recently, pylint complains when `open()` calls are missing an
`encoding=` specified.  Everything we have should be UTF-8 (and in fact,
everything should be UTF-8, period (exceptions apply)), so use that.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/297        | 2 +-
 tests/qemu-iotests/iotests.py | 8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index 433b732336..0a49953d27 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -46,7 +46,7 @@ def is_python_file(filename):
     if filename.endswith('.py'):
         return True
 
-    with open(filename) as f:
+    with open(filename, encoding='utf-8') as f:
         try:
             first_line = f.readline()
             return re.match('^#!.*python', first_line) is not None
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 4c8971d946..c05c16494b 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -610,7 +610,7 @@ def _post_shutdown(self) -> None:
             return
         valgrind_filename =  f"{test_dir}/{self._popen.pid}.valgrind"
         if self.exitcode() == 99:
-            with open(valgrind_filename) as f:
+            with open(valgrind_filename, encoding='utf-8') as f:
                 print(f.read())
         else:
             os.remove(valgrind_filename)
@@ -1120,7 +1120,8 @@ def notrun(reason):
     # Each test in qemu-iotests has a number ("seq")
     seq = os.path.basename(sys.argv[0])
 
-    with open('%s/%s.notrun' % (output_dir, seq), 'w') as outfile:
+    with open('%s/%s.notrun' % (output_dir, seq), 'w', encoding='utf-8') \
+            as outfile:
         outfile.write(reason + '\n')
     logger.warning("%s not run: %s", seq, reason)
     sys.exit(0)
@@ -1134,7 +1135,8 @@ def case_notrun(reason):
     # Each test in qemu-iotests has a number ("seq")
     seq = os.path.basename(sys.argv[0])
 
-    with open('%s/%s.casenotrun' % (output_dir, seq), 'a') as outfile:
+    with open('%s/%s.casenotrun' % (output_dir, seq), 'a', encoding='utf-8') \
+            as outfile:
         outfile.write('    [case not run] ' + reason + '\n')
 
 def _verify_image_format(supported_fmts: Sequence[str] = (),
-- 
2.31.1


