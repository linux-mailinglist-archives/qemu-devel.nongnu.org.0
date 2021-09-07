Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EE4402A47
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:56:20 +0200 (CEST)
Received: from localhost ([::1]:54296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbaF-0001e7-Pa
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNaxG-0003z0-Mk
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:16:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNaxD-0002mF-EO
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:16:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631020558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6R/ESctEN83D9gWr4ARCDqZipQXzayPnDXr4rb4Q7ho=;
 b=dlfFPMkvQOIjsNSzMqnlmP3tEOuxmIW4ZmmiKZGNIzUgQzb7xKPh6mhv7X0sFBIU0PDqR4
 uY7znedpvTXVj0l0CHLXjnYQcaforuwqLyXVNZu6uKSsuqBY7G7OiAT7JHXR+IW3c+zNNE
 gQLl8p+eAMP0v02T5T0fbEuskEzU2Rs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-lSoMHB90MzO5WBwALypmcQ-1; Tue, 07 Sep 2021 09:15:55 -0400
X-MC-Unique: lSoMHB90MzO5WBwALypmcQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AD9A8145E5;
 Tue,  7 Sep 2021 13:15:54 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11C8F5C1B4;
 Tue,  7 Sep 2021 13:15:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 20/20] s390x/cpumodel: Add more feature to gen16 default model
Date: Tue,  7 Sep 2021 15:14:49 +0200
Message-Id: <20210907131449.493875-21-thuth@redhat.com>
In-Reply-To: <20210907131449.493875-1-thuth@redhat.com>
References: <20210907131449.493875-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Christian Borntraeger <borntraeger@de.ibm.com>

Add the new gen16 features to the default model and fence them for
machine version 6.1 and earlier.

Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210907101017.27126-1-borntraeger@de.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/s390x/s390-virtio-ccw.c  | 5 +++++
 target/s390x/gen-features.c | 8 +++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 4d25278cf2..61aeccb163 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -803,6 +803,11 @@ DEFINE_CCW_MACHINE(6_2, "6.2", true);
 static void ccw_machine_6_1_instance_options(MachineState *machine)
 {
     ccw_machine_6_2_instance_options(machine);
+    s390_cpudef_featoff_greater(16, 1, S390_FEAT_NNPA);
+    s390_cpudef_featoff_greater(16, 1, S390_FEAT_VECTOR_PACKED_DECIMAL_ENH2);
+    s390_cpudef_featoff_greater(16, 1, S390_FEAT_BEAR_ENH);
+    s390_cpudef_featoff_greater(16, 1, S390_FEAT_RDP);
+    s390_cpudef_featoff_greater(16, 1, S390_FEAT_PAI);
 }
 
 static void ccw_machine_6_1_class_options(MachineClass *mc)
diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index 7d85322d68..7cb1a6ec10 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -663,7 +663,13 @@ static uint16_t default_GEN15_GA1[] = {
     S390_FEAT_ETOKEN,
 };
 
-#define default_GEN16_GA1 EmptyFeat
+static uint16_t default_GEN16_GA1[] = {
+    S390_FEAT_NNPA,
+    S390_FEAT_VECTOR_PACKED_DECIMAL_ENH2,
+    S390_FEAT_BEAR_ENH,
+    S390_FEAT_RDP,
+    S390_FEAT_PAI,
+};
 
 /* QEMU (CPU model) features */
 
-- 
2.27.0


