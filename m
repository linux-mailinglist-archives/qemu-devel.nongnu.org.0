Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D5724AC32
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 02:30:13 +0200 (CEST)
Received: from localhost ([::1]:58162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8YT6-0003JD-Fz
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 20:30:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8YDl-0007sG-Io
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 20:14:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42404
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8YDj-0002U2-1q
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 20:14:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597882458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WysLkic4PnjHLYjpag8c831bXpIllcIPGeMLF00F8pU=;
 b=VMKnqrk+vmHW6zRZ2j2XZoBrNvO2BWC7H2JPmpjF2Gm/A21h3+0k+hKFz92NapLf/T9+h2
 yrFoTbm7RA3vpY/VR1RrfiuWItb8BKBRP+0yDmAhdCoqdPYvgABCDNNk1EMBCAU1IO2Jsw
 CVLzRLBIq17kTEZbCVyL+rZyR+F+INs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-aZCDlUTnO2uI-Bx0YkYoKQ-1; Wed, 19 Aug 2020 20:14:16 -0400
X-MC-Unique: aZCDlUTnO2uI-Bx0YkYoKQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA91E1007465;
 Thu, 20 Aug 2020 00:14:15 +0000 (UTC)
Received: from localhost (ovpn-117-244.rdu2.redhat.com [10.10.117.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70CDB747B0;
 Thu, 20 Aug 2020 00:14:15 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 40/58] mptsas: Move QOM macros to header
Date: Wed, 19 Aug 2020 20:12:18 -0400
Message-Id: <20200820001236.1284548-41-ehabkost@redhat.com>
In-Reply-To: <20200820001236.1284548-1-ehabkost@redhat.com>
References: <20200820001236.1284548-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 20:13:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will make future conversion to OBJECT_DECLARE* easier.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes series v1 -> v2: new patch in series v2

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Fam Zheng <fam@euphon.net>
Cc: qemu-devel@nongnu.org
---
 hw/scsi/mptsas.h | 6 +++++-
 hw/scsi/mptsas.c | 5 -----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/scsi/mptsas.h b/hw/scsi/mptsas.h
index 0436a33911..9ac98fc20e 100644
--- a/hw/scsi/mptsas.h
+++ b/hw/scsi/mptsas.h
@@ -11,9 +11,13 @@
 
 #define MPTSAS_MAXIMUM_CHAIN_DEPTH 0x22
 
-typedef struct MPTSASState MPTSASState;
 typedef struct MPTSASRequest MPTSASRequest;
 
+#define TYPE_MPTSAS1068 "mptsas1068"
+typedef struct MPTSASState MPTSASState;
+#define MPT_SAS(obj) \
+    OBJECT_CHECK(MPTSASState, (obj), TYPE_MPTSAS1068)
+
 enum {
     DOORBELL_NONE,
     DOORBELL_WRITE,
diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index 14cbed84d0..135e7d96e4 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -42,11 +42,6 @@
 #define NAA_LOCALLY_ASSIGNED_ID 0x3ULL
 #define IEEE_COMPANY_LOCALLY_ASSIGNED 0x525400
 
-#define TYPE_MPTSAS1068 "mptsas1068"
-
-#define MPT_SAS(obj) \
-    OBJECT_CHECK(MPTSASState, (obj), TYPE_MPTSAS1068)
-
 #define MPTSAS1068_PRODUCT_ID                  \
     (MPI_FW_HEADER_PID_FAMILY_1068_SAS |       \
      MPI_FW_HEADER_PID_PROD_INITIATOR_SCSI |   \
-- 
2.26.2


