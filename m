Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A0931B758
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 11:40:17 +0100 (CET)
Received: from localhost ([::1]:50582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBbIe-0005U5-9k
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 05:40:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lBbHB-0003mC-A7
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:38:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lBbH9-0004Bg-FH
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:38:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613385521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ROG8udL+SsyKr8Hc8o51V37YvWvgE0lb8tHHAMzWIk0=;
 b=BgFq5ZgjBYI8ZuhuZZx6ohZgsGuQMMhu+hRNl5etUwBZshlPaFg/5rfOyxundBgVFHo5Rn
 cocqfcYzYF0rAjjI5bADZtDTG/p/DN0R6EctTaYGSIJOEPhtoQcdPm2sj7rxmnjWZKminL
 eLM/3Vvduf+EGgPGNlrUrjmOTuR8mJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-oQ3XCk-NNZ6-aO8Y1w7mdw-1; Mon, 15 Feb 2021 05:38:39 -0500
X-MC-Unique: oQ3XCk-NNZ6-aO8Y1w7mdw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A9D3100A614;
 Mon, 15 Feb 2021 10:38:38 +0000 (UTC)
Received: from thuth.com (ovpn-112-80.ams2.redhat.com [10.36.112.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4887072162;
 Mon, 15 Feb 2021 10:38:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Max Reitz <mreitz@redhat.com>
Subject: [PATCH] tests/qemu-iotests: Remove test 259 from the "auto" group
Date: Mon, 15 Feb 2021 11:38:35 +0100
Message-Id: <20210215103835.1129145-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tests in the "auto" group should support qcow2 so that they can
be run during "make check-block". Test 259 only supports "raw", so
it currently always gets skipped when running "make check-block".
Let's skip this unnecessary step and remove it from the auto group.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qemu-iotests/259 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/259 b/tests/qemu-iotests/259
index 76cde429c4..1b15e8fb48 100755
--- a/tests/qemu-iotests/259
+++ b/tests/qemu-iotests/259
@@ -1,5 +1,5 @@
 #!/usr/bin/env bash
-# group: rw auto quick
+# group: rw quick
 #
 # Test generic image creation fallback (by using NBD)
 #
-- 
2.27.0


