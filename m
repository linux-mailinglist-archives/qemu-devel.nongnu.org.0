Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B218A2A0F7A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 21:30:33 +0100 (CET)
Received: from localhost ([::1]:41928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYb2e-0003vR-PZ
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 16:30:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kYauW-0000t5-5f
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 16:22:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kYauS-0007lO-98
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 16:22:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604089323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vrWVueLgktrjlllGr3tyae/SlYm3bdfuFcOIC8u+jjk=;
 b=FX1bYhhUI8JCK4hk3Rbu9h9v8TAOVDYiZdFKajeixIVwfInf1gDGumgN4HQJrwVE0U2Ffg
 koaijBeYSp1fvBKoFzFZc/Zw1gGlEKfXeRiVNw6A6gOElNLrm3RBENF73u4LWM9+BfT765
 GbHyKQ5lGNc1fPlj16/M4V9jBAAt3wM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-DYTJn8J1MyCRN_E902ghpg-1; Fri, 30 Oct 2020 16:22:01 -0400
X-MC-Unique: DYTJn8J1MyCRN_E902ghpg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9412C802B6B;
 Fri, 30 Oct 2020 20:22:00 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF460109F193;
 Fri, 30 Oct 2020 20:21:56 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/20] nvdimm: Remove unnecessary prefix from error message
Date: Fri, 30 Oct 2020 16:21:27 -0400
Message-Id: <20201030202131.796967-17-ehabkost@redhat.com>
In-Reply-To: <20201030202131.796967-1-ehabkost@redhat.com>
References: <20201030202131.796967-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 16:21:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

object_property_parse() will add a
  "Property '<TYPE>.<PROP>' can't take value '<VALUE>'"
prefix automatically for us.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org
---
 hw/mem/nvdimm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
index e1574bc07c..b9a99d58ed 100644
--- a/hw/mem/nvdimm.c
+++ b/hw/mem/nvdimm.c
@@ -56,8 +56,7 @@ static void nvdimm_set_label_size(Object *obj, Visitor *v, const char *name,
         return;
     }
     if (value < MIN_NAMESPACE_LABEL_SIZE) {
-        error_setg(errp, "Property '%s.%s' (0x%" PRIx64 ") is required"
-                   " at least 0x%lx", object_get_typename(obj), name, value,
+        error_setg(errp, "label size should be at least 0x%lx",
                    MIN_NAMESPACE_LABEL_SIZE);
         return;
     }
@@ -89,8 +88,7 @@ static void nvdimm_set_uuid(Object *obj, Visitor *v, const char *name,
     }
 
     if (qemu_uuid_parse(value, &nvdimm->uuid) != 0) {
-        error_setg(errp, "Property '%s.%s' has invalid value",
-                   object_get_typename(obj), name);
+        error_setg(errp, "invalid UUID");
     }
 
     g_free(value);
-- 
2.28.0


