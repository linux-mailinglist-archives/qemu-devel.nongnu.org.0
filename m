Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD77F25B6B2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 00:50:47 +0200 (CEST)
Received: from localhost ([::1]:40180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDbaY-0005Wg-S4
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 18:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDbUL-0002bm-Nk
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 18:44:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35919
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDbUJ-0008Nh-V4
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 18:44:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599086659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BNJDGt35Be5Lz+v21KbX3MZBUbrFcuiwR5yT7mRhg7g=;
 b=bthsiG4bBN++qYCvmkR6/1yqaeb9EhOhjknMvWT5VCznInqxU4J52hjHsOxsc3tw6NmE3m
 TsVl9H/uOr4mUI92QuMFMXk0FJze7ohKmN8aCec+Cy0Q/+oQ+t5/RQkfvCxCKmZc7Jop5X
 AE73yqItBwmn8HgsJ+Hdd3KVRZ4LPDc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-45yAljuCOMyx8-3kx4SSaw-1; Wed, 02 Sep 2020 18:44:17 -0400
X-MC-Unique: 45yAljuCOMyx8-3kx4SSaw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A58C91DE00;
 Wed,  2 Sep 2020 22:44:16 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43D2C5C1C4;
 Wed,  2 Sep 2020 22:44:16 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/63] pc87312: Rename TYPE_PC87312_SUPERIO to TYPE_PC87312
Date: Wed,  2 Sep 2020 18:42:28 -0400
Message-Id: <20200902224311.1321159-21-ehabkost@redhat.com>
In-Reply-To: <20200902224311.1321159-1-ehabkost@redhat.com>
References: <20200902224311.1321159-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 16:20:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will make the type name constant consistent with the name of
the type checking macro.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: "Hervé Poussineau" <hpoussin@reactos.org>
Cc: qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org
---
 include/hw/isa/pc87312.h | 4 ++--
 hw/isa/pc87312.c         | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/isa/pc87312.h b/include/hw/isa/pc87312.h
index a65168a157..da8dc5ddf5 100644
--- a/include/hw/isa/pc87312.h
+++ b/include/hw/isa/pc87312.h
@@ -29,10 +29,10 @@
 #include "qom/object.h"
 
 
-#define TYPE_PC87312_SUPERIO "pc87312"
+#define TYPE_PC87312 "pc87312"
 typedef struct PC87312State PC87312State;
 DECLARE_INSTANCE_CHECKER(PC87312State, PC87312,
-                         TYPE_PC87312_SUPERIO)
+                         TYPE_PC87312)
 
 struct PC87312State {
     /*< private >*/
diff --git a/hw/isa/pc87312.c b/hw/isa/pc87312.c
index 0cacbbc91b..8d7b8d3db2 100644
--- a/hw/isa/pc87312.c
+++ b/hw/isa/pc87312.c
@@ -371,7 +371,7 @@ static void pc87312_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo pc87312_type_info = {
-    .name          = TYPE_PC87312_SUPERIO,
+    .name          = TYPE_PC87312,
     .parent        = TYPE_ISA_SUPERIO,
     .instance_size = sizeof(PC87312State),
     .instance_init = pc87312_initfn,
-- 
2.26.2


