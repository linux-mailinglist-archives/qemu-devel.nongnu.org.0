Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7703682A22
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:14:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMndC-0002fI-8o; Tue, 31 Jan 2023 05:12:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMnd1-0002OF-2J
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:12:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMncu-0002XD-C3
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:12:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675159951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QXWG1Twrz4mu4WJrwImPMyEu0ZSuq9oHsRUm+G2cs14=;
 b=Sg8SaOUuyhmZ22PcygZi0z1F/DnDpq/cWQ6JOpAMbDwiISz9aQr8gp2VARmO9BXzd4l15e
 7LzD76o9wxJhgdJa995cu3DAon8I10qiQBXfyg6biQJIwphlgPKGG5s7G1xTIYTkohJOoH
 DW5dObt1Ws1CXROSfCz83MqX0FpKqHM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-UdlVI3n4M3Ops4ArH5nKPQ-1; Tue, 31 Jan 2023 05:12:28 -0500
X-MC-Unique: UdlVI3n4M3Ops4ArH5nKPQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D28A0858F09;
 Tue, 31 Jan 2023 10:12:27 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FDB5C15BAD;
 Tue, 31 Jan 2023 10:12:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 16/27] docs/about/deprecated: Mark HAXM in QEMU as deprecated
Date: Tue, 31 Jan 2023 11:11:54 +0100
Message-Id: <20230131101205.1499867-17-thuth@redhat.com>
In-Reply-To: <20230131101205.1499867-1-thuth@redhat.com>
References: <20230131101205.1499867-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

Message-Id: <20230126121034.1035138-1-thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
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


