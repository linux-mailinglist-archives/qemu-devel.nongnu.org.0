Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F209254EAA
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 21:34:10 +0200 (CEST)
Received: from localhost ([::1]:33072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBNez-00046T-34
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 15:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kBNTW-000797-DJ
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 15:22:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kBNTU-0000Q8-Iz
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 15:22:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598556135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OfHjnvheTqq+/4j3wD/AmaPXlWrBRT5P33UN2ld4sEA=;
 b=R9tySr3kDmHbY+mjyf2Fx3n6MDZIoFEvl42GTVrE/F56y4oWpEb4FOVQBWOfjQtxFcjloN
 1xWKoKoo6ZQ6boAmWJf+AWmw4YUIvEmkeFJVtRlaAT5+nMnFtePnNY7+pNMCeS9tVxcZEb
 pmmCZIlJcXiWqEB165S4VEXKE1Bo4U8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-nnCAe2I6NCGnbjs61qIAQA-1; Thu, 27 Aug 2020 15:22:11 -0400
X-MC-Unique: nnCAe2I6NCGnbjs61qIAQA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 628741015ECB;
 Thu, 27 Aug 2020 19:22:10 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BA95784A3;
 Thu, 27 Aug 2020 19:22:10 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 18/53] hvf: Move HVFState typedef to hvf.h
Date: Thu, 27 Aug 2020 15:20:47 -0400
Message-Id: <20200827192122.658035-19-ehabkost@redhat.com>
In-Reply-To: <20200827192122.658035-1-ehabkost@redhat.com>
References: <20200827192122.658035-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 02:54:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move typedef closer to the type check macros, to make it easier
to convert the code to OBJECT_DEFINE_TYPE() in the future.

Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Tested-By: Roman Bolshakov <r.bolshakov@yadro.com>
Message-Id: <20200825192110.3528606-20-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/sysemu/hvf.h       | 1 +
 target/i386/hvf/hvf-i386.h | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/hvf.h b/include/sysemu/hvf.h
index d3bed80ea8..760d6c79a2 100644
--- a/include/sysemu/hvf.h
+++ b/include/sysemu/hvf.h
@@ -35,6 +35,7 @@ void hvf_vcpu_destroy(CPUState *);
 
 #define TYPE_HVF_ACCEL ACCEL_CLASS_NAME("hvf")
 
+typedef struct HVFState HVFState;
 #define HVF_STATE(obj) \
     OBJECT_CHECK(HVFState, (obj), TYPE_HVF_ACCEL)
 
diff --git a/target/i386/hvf/hvf-i386.h b/target/i386/hvf/hvf-i386.h
index ef20c73eca..e0edffd077 100644
--- a/target/i386/hvf/hvf-i386.h
+++ b/target/i386/hvf/hvf-i386.h
@@ -57,13 +57,13 @@ typedef struct hvf_vcpu_caps {
     uint64_t vmx_cap_preemption_timer;
 } hvf_vcpu_caps;
 
-typedef struct HVFState {
+struct HVFState {
     AccelState parent;
     hvf_slot slots[32];
     int num_slots;
 
     hvf_vcpu_caps *hvf_caps;
-} HVFState;
+};
 extern HVFState *hvf_state;
 
 void hvf_set_phys_mem(MemoryRegionSection *, bool);
-- 
2.26.2


