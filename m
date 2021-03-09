Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EB0332B66
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:03:58 +0100 (CET)
Received: from localhost ([::1]:48646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJepx-0006jb-PK
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:03:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lJeOv-0000Cy-16
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:36:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lJeOq-0002JD-Ta
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:35:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615304154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=df3uLEC7CQ41iOtsgynxbQW1fqxRdIgyQ7ldIr/XAWU=;
 b=RYOA6oi3df4zQ5jFicT1Qrlt7ZYU5OGYxHbE1EePHCp4cs4+TkV/6etVGUom3ccEBwQo5q
 wsjAdq9Q3p4U5477+SHirQu3WAXwR1/x0F64BC6kNrvafkUC08BjEc7VZ1/kolsoZZ6Bb9
 SlEin52j9ZtWUo8RnoSoIKw6rXE4Woo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-BL80J7F_OsmS6lv9aMKgVg-1; Tue, 09 Mar 2021 10:35:52 -0500
X-MC-Unique: BL80J7F_OsmS6lv9aMKgVg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76C451014AD8
 for <qemu-devel@nongnu.org>; Tue,  9 Mar 2021 15:35:19 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC8B060240;
 Tue,  9 Mar 2021 15:35:11 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/acceptance: Print expected message on
 wait_for_console_pattern
Date: Tue,  9 Mar 2021 12:35:07 -0300
Message-Id: <20210309153507.1905682-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: willianr@redhat.com, philmd@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For the sake of improve debuggability of tests which use the
wait_for_console_pattern(), this changed the _console_interaction() so that
the expected message is printed if the test fail.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
While I was testing  "[PATCH v2 2/2] tests/acceptance: Test ast2600 machine"
I could not clearly determine which of the called wait_for_console_pattern()
was failing. So this patch improves debuggability in such as situations.

 tests/acceptance/avocado_qemu/__init__.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index df167b142c..ed338caaba 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -97,7 +97,8 @@ def _console_interaction(test, success_message, failure_message,
             break
         if failure_message and failure_message in msg:
             console.close()
-            fail = 'Failure message found in console: %s' % failure_message
+            fail = 'Failure message found in console: "%s". Expected: "%s"' % \
+                    (failure_message, success_message)
             test.fail(fail)
 
 def interrupt_interactive_console_until_pattern(test, success_message,
-- 
2.29.2


