Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A05CD691DF7
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 12:16:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQRMt-00059l-Oi; Fri, 10 Feb 2023 06:15:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQRMq-00059C-7Q
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 06:15:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQRMn-0000GS-E3
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 06:14:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676027695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=JjZoORo0Yc7xpEEqY4djdC6f7uZH6QBcJluXAkAj2HQ=;
 b=a/G93StQJyBDEIOwj5EdG+vWoopQ2VYH603gZA8HdYcXqoCCqkoRisklSzaucNnnDLoQ0M
 X2nOVoU5RMFcHFIXXeElAZucZXE5dWTrcyG2I/vHLJAwOKRjHCIxKB1DcgAuxA0YvZxwH4
 FWp0l9ZIjeCOmlFrhFmQXowJFVZwpk8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-yjEoKR9pP42kPX8lmTyAJQ-1; Fri, 10 Feb 2023 06:14:54 -0500
X-MC-Unique: yjEoKR9pP42kPX8lmTyAJQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 958F238123B2;
 Fri, 10 Feb 2023 11:14:52 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77B592026D4B;
 Fri, 10 Feb 2023 11:14:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-trivial@nongnu.org
Subject: [PATCH] include/hw/i386: Clean up includes in x86.h
Date: Fri, 10 Feb 2023 12:14:38 +0100
Message-Id: <20230210111438.1114600-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

nmi.h and notify.h are not needed here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/i386/x86.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 62fa5774f8..b5dd3979a0 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -18,11 +18,9 @@
 #define HW_I386_X86_H
 
 #include "exec/hwaddr.h"
-#include "qemu/notify.h"
 
 #include "hw/i386/topology.h"
 #include "hw/boards.h"
-#include "hw/nmi.h"
 #include "hw/isa/isa.h"
 #include "hw/i386/ioapic.h"
 #include "qom/object.h"
-- 
2.31.1


