Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0632C25B6B8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 00:52:49 +0200 (CEST)
Received: from localhost ([::1]:53602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDbcW-0002WL-1P
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 18:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDbUN-0002fb-4l
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 18:44:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDbUK-0008Ns-Qj
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 18:44:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599086660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wYLNfiuwezjP8Gx8u8/rjD1Ud7iEW35L21/hzv5JHX0=;
 b=AxUK8fjHIbay7DH+g9pNXU5AfSYMetj+cxOgXmaGDozE746OECr5Jv1eWySHX4eelRuJTd
 v8wUBKeZiluTJQWpVDHYt9+qs6xw8idWUkQiW/kIakD9jXu6EvpzfPPObrOAk/cKEsia9U
 ZfDwSkf6wDc3k0ICX48J1wWdqOcGQx8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-OhhYnk6DPwax_6Vy4I-oQg-1; Wed, 02 Sep 2020 18:44:16 -0400
X-MC-Unique: OhhYnk6DPwax_6Vy4I-oQg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 910658064BF;
 Wed,  2 Sep 2020 22:44:15 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 522A660C0F;
 Wed,  2 Sep 2020 22:44:15 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/63] mptsas: Rename TYPE_MPTSAS1068 to TYPE_MPT_SAS
Date: Wed,  2 Sep 2020 18:42:27 -0400
Message-Id: <20200902224311.1321159-20-ehabkost@redhat.com>
In-Reply-To: <20200902224311.1321159-1-ehabkost@redhat.com>
References: <20200902224311.1321159-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:42:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will make the type name constant consistent with the name of
the type checking macro.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Fam Zheng <fam@euphon.net>
Cc: qemu-devel@nongnu.org
---
 hw/scsi/mptsas.h | 4 ++--
 hw/scsi/mptsas.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/scsi/mptsas.h b/hw/scsi/mptsas.h
index b85ac1a5fc..c618f686a3 100644
--- a/hw/scsi/mptsas.h
+++ b/hw/scsi/mptsas.h
@@ -14,10 +14,10 @@
 
 typedef struct MPTSASRequest MPTSASRequest;
 
-#define TYPE_MPTSAS1068 "mptsas1068"
+#define TYPE_MPT_SAS "mptsas1068"
 typedef struct MPTSASState MPTSASState;
 DECLARE_INSTANCE_CHECKER(MPTSASState, MPT_SAS,
-                         TYPE_MPTSAS1068)
+                         TYPE_MPT_SAS)
 
 enum {
     DOORBELL_NONE,
diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index 135e7d96e4..0dbb70c17b 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -1434,7 +1434,7 @@ static void mptsas1068_class_init(ObjectClass *oc, void *data)
 }
 
 static const TypeInfo mptsas_info = {
-    .name = TYPE_MPTSAS1068,
+    .name = TYPE_MPT_SAS,
     .parent = TYPE_PCI_DEVICE,
     .instance_size = sizeof(MPTSASState),
     .class_init = mptsas1068_class_init,
-- 
2.26.2


