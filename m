Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D984F4DE2C2
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 21:46:08 +0100 (CET)
Received: from localhost ([::1]:44456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVJU7-00023K-Ua
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 16:46:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVJLQ-0002Wz-H3
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 16:37:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVJLK-0005Yk-CZ
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 16:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647635821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l8RXLOLugEcJ24QsV9+uRJHuw3V8Sk3+hI/0hns61nI=;
 b=aj2zdvs7Hf48AM7SmeTGsUnUdTEvIyhlai/SkuF1H0OVDAsFRLZqUpoUPFuVFO9oIN+lYp
 6JeNzMOZAAH50audfGT3SGdinvg41aFBjeFBx/dT94Co8n2Rz7hsxW949ZqWUntatYGuX6
 Ngt5DSgG6Md4dFwjGnpTVCVfeC2FX6s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-lxLDbBMUNmeXoai5TTIdIw-1; Fri, 18 Mar 2022 16:36:58 -0400
X-MC-Unique: lxLDbBMUNmeXoai5TTIdIw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 773D33800E9C;
 Fri, 18 Mar 2022 20:36:58 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.8.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34CCB403373;
 Fri, 18 Mar 2022 20:36:58 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/15] iotests/149: fixup
Date: Fri, 18 Mar 2022 16:36:48 -0400
Message-Id: <20220318203655.676907-9-jsnow@redhat.com>
In-Reply-To: <20220318203655.676907-1-jsnow@redhat.com>
References: <20220318203655.676907-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(Merge into prior patch.)

Notes: I don't quite like this change, but I'm at a loss for what would
be cleaner. This is a funky test.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/149 | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/149 b/tests/qemu-iotests/149
index 9bb96d6a1d..2ae318f16f 100755
--- a/tests/qemu-iotests/149
+++ b/tests/qemu-iotests/149
@@ -295,7 +295,8 @@ def qemu_io_write_pattern(config, pattern, offset_mb, size_mb, dev=False):
     args = ["-c", "write -P 0x%x %dM %dM" % (pattern, offset_mb, size_mb)]
     args.extend(qemu_io_image_args(config, dev))
     iotests.log("qemu-io " + " ".join(args), filters=[iotests.filter_test_dir])
-    iotests.log(check_cipher_support(config, iotests.qemu_io(*args)),
+    output = iotests.qemu_io(*args, check=False).stdout
+    iotests.log(check_cipher_support(config, output),
                 filters=[iotests.filter_test_dir, iotests.filter_qemu_io])
 
 
@@ -307,7 +308,8 @@ def qemu_io_read_pattern(config, pattern, offset_mb, size_mb, dev=False):
     args = ["-c", "read -P 0x%x %dM %dM" % (pattern, offset_mb, size_mb)]
     args.extend(qemu_io_image_args(config, dev))
     iotests.log("qemu-io " + " ".join(args), filters=[iotests.filter_test_dir])
-    iotests.log(check_cipher_support(config, iotests.qemu_io(*args)),
+    output = iotests.qemu_io(*args, check=False).stdout
+    iotests.log(check_cipher_support(config, output),
                 filters=[iotests.filter_test_dir, iotests.filter_qemu_io])
 
 
-- 
2.34.1


