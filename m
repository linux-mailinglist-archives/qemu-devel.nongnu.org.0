Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EECB867CA9B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 13:11:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL15Z-0004qF-Kl; Thu, 26 Jan 2023 07:10:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pL15X-0004py-1l
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 07:10:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pL15U-0007K8-IK
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 07:10:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674735038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Wgj/rWcPURHnuh/Sx9iwJbw//7RRu9EmoF+Mf3X3z7I=;
 b=SVHe4lUor2eZN9bumOi1Tz9DCECvSxOncMXTIEBYSeSSlt8jFYHwsYDBLv/icxOh2Y6ddu
 H3H+OnzqxvBP0tAtVgqPjCenxypSo+8zo2yshU/Q/x3I/32XOfaF0kumMJt/sCtOW/3vB8
 wtuFDvCtdI/Lv3inW5tYIX8V3J3zuT4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-UXywKPu3OcSW67tZ2_pY0Q-1; Thu, 26 Jan 2023 07:10:37 -0500
X-MC-Unique: UXywKPu3OcSW67tZ2_pY0Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03E38380450B;
 Thu, 26 Jan 2023 12:10:37 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07BBA39DCA;
 Thu, 26 Jan 2023 12:10:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	wenchao.wang@intel.com,
	haxm-team@intel.com
Subject: [PATCH v2] docs/about/deprecated: Mark HAXM in QEMU as deprecated
Date: Thu, 26 Jan 2023 13:10:34 +0100
Message-Id: <20230126121034.1035138-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The HAXM project has been retired (see https://github.com/intel/haxm#status),
so we should mark the code in QEMU as deprecated (and finally remove it
unless somebody else picks the project up again - which is quite unlikely
since there are now whpx and hvf on these operating systems, too).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Added a message to hax_accel_init(), too

 docs/about/deprecated.rst | 6 ++++++
 target/i386/hax/hax-all.c | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 3f4d678eb4..da2e6fe63d 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -93,6 +93,12 @@ form is preferred.
 The HPET setting has been turned into a machine property.
 Use ``-machine hpet=off`` instead.
 
+``-accel hax`` (since 8.0)
+''''''''''''''''''''''''''
+
+The HAXM project has been retired (see https://github.com/intel/haxm#status).
+Use "whpx" (on Windows) or "hvf" (on macOS) instead.
+
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index b7fb5385b2..3e5992a63b 100644
--- a/target/i386/hax/hax-all.c
+++ b/target/i386/hax/hax-all.c
@@ -357,6 +357,9 @@ static int hax_accel_init(MachineState *ms)
         fprintf(stdout, "HAX is %s and emulator runs in %s mode.\n",
                 !ret ? "working" : "not working",
                 !ret ? "fast virt" : "emulation");
+        fprintf(stdout,
+                "NOTE: HAX is deprecated and will be removed in a future release.\n"
+                "      Use 'whpx' (on Windows) or 'hvf' (on macOS) instead.\n");
     }
     return ret;
 }
-- 
2.31.1


