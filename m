Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0A925B6BB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 00:53:25 +0200 (CEST)
Received: from localhost ([::1]:55994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDbd6-0003Tq-AP
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 18:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDbUO-0002gw-3O
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 18:44:24 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:53797
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDbUM-0008Np-7u
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 18:44:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599086659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Cg2QWYZtATYKrB65X+t9ZVWILHugawrhMO+jRrRDjg=;
 b=Kbv8GUcyPs3VcvK1mVYheeAflCX527PSn40OoTATSJ4kNGZwlxznTXdRvYWTKpikrpRwjF
 08ns6L+MYcoDfQtD9GYOqepfVHRGfzTFwb2KsoDC0hTcDP50Tf3hq1oM3nPemNErd9lY4O
 SWw58IWevATeUT32Ds0TdaPg+/LDDzc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-HTFEukD6PFyKvD_XYSfsMA-1; Wed, 02 Sep 2020 18:44:15 -0400
X-MC-Unique: HTFEukD6PFyKvD_XYSfsMA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A172801AAE;
 Wed,  2 Sep 2020 22:44:14 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBA3F5D9CC;
 Wed,  2 Sep 2020 22:44:13 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/63] mips: Rename TYPE_MIPS_BOSTON to TYPE_BOSTON
Date: Wed,  2 Sep 2020 18:42:26 -0400
Message-Id: <20200902224311.1321159-19-ehabkost@redhat.com>
In-Reply-To: <20200902224311.1321159-1-ehabkost@redhat.com>
References: <20200902224311.1321159-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 17:27:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, berrange@redhat.com,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will make the type name constant consistent with the name of
the type checking macro.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Paul Burton <paulburton@kernel.org>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: qemu-devel@nongnu.org
---
 hw/mips/boston.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 1b3f69e949..17720a08c2 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -43,10 +43,10 @@
 #include <libfdt.h>
 #include "qom/object.h"
 
-#define TYPE_MIPS_BOSTON "mips-boston"
+#define TYPE_BOSTON "mips-boston"
 typedef struct BostonState BostonState;
 DECLARE_INSTANCE_CHECKER(BostonState, BOSTON,
-                         TYPE_MIPS_BOSTON)
+                         TYPE_BOSTON)
 
 struct BostonState {
     SysBusDevice parent_obj;
@@ -252,7 +252,7 @@ static const MemoryRegionOps boston_platreg_ops = {
 };
 
 static const TypeInfo boston_device = {
-    .name          = TYPE_MIPS_BOSTON,
+    .name          = TYPE_BOSTON,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(BostonState),
 };
@@ -444,7 +444,7 @@ static void boston_mach_init(MachineState *machine)
         exit(1);
     }
 
-    dev = qdev_new(TYPE_MIPS_BOSTON);
+    dev = qdev_new(TYPE_BOSTON);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     s = BOSTON(dev);
-- 
2.26.2


