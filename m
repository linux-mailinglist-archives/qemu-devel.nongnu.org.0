Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A68A1F6E6D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 22:04:58 +0200 (CEST)
Received: from localhost ([::1]:45848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjTRZ-0001Nk-Eo
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 16:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjT8t-0007t0-9z
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:45:39 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:57705
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjT8r-00011Y-0A
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:45:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591904735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vl9+4Ve7uqE2qdXwMEU88RpILo1l/1GNFgId+2u59oQ=;
 b=dHPXwr0Z5c1XBPRZLep+fM70MlfGEEBjfVyVxo41LiTdakcsEOfDy9C6oxxKQBLHOM/LcT
 M7/2wocw0pqGRVDk+jufo2gPOGa6/xC65L1BDMCMtZef/KZG+FL3C4ZLcc8yah4Bge6c59
 V2IHxLtXlmtBBFLjUKldbaG0EkDu8Zg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-8A9stek-P3W2dtLqGztl8A-1; Thu, 11 Jun 2020 15:45:15 -0400
X-MC-Unique: 8A9stek-P3W2dtLqGztl8A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7E1E86ABD5;
 Thu, 11 Jun 2020 19:45:14 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 713D65D9DC;
 Thu, 11 Jun 2020 19:45:14 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 026/115] hw/i386/vmport: Add device properties
Date: Thu, 11 Jun 2020 15:43:20 -0400
Message-Id: <20200611194449.31468-27-pbonzini@redhat.com>
In-Reply-To: <20200611194449.31468-1-pbonzini@redhat.com>
References: <20200611194449.31468-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 14:57:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Liran Alon <liran.alon@oracle.com>,
 Nikita Leshenko <nikita.leshchenko@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liran Alon <liran.alon@oracle.com>

No functional change.

This is done as a preparation for the following patches that will
introduce several device properties.

Reviewed-by: Nikita Leshenko <nikita.leshchenko@oracle.com>
Signed-off-by: Liran Alon <liran.alon@oracle.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200312165431.82118-3-liran.alon@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/vmport.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/i386/vmport.c b/hw/i386/vmport.c
index fc0074608e..5985167dcf 100644
--- a/hw/i386/vmport.c
+++ b/hw/i386/vmport.c
@@ -30,6 +30,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/isa/isa.h"
+#include "hw/qdev-properties.h"
 #include "sysemu/hw_accel.h"
 #include "qemu/log.h"
 #include "vmport.h"
@@ -140,6 +141,10 @@ static void vmport_realizefn(DeviceState *dev, Error **errp)
     vmport_register(VMPORT_CMD_GETRAMSIZE, vmport_cmd_ram_size, NULL);
 }
 
+static Property vmport_properties[] = {
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void vmport_class_initfn(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -147,6 +152,7 @@ static void vmport_class_initfn(ObjectClass *klass, void *data)
     dc->realize = vmport_realizefn;
     /* Reason: realize sets global port_state */
     dc->user_creatable = false;
+    device_class_set_props(dc, vmport_properties);
 }
 
 static const TypeInfo vmport_info = {
-- 
2.26.2



