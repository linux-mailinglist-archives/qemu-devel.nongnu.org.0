Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 359CC25AAA4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 13:57:46 +0200 (CEST)
Received: from localhost ([::1]:50380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDROb-0001Bf-9p
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 07:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDRKq-0002Wo-FT
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 07:53:52 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:42874
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDRKo-0006wx-MW
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 07:53:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599047629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mqMbYocOSRC6uLOxCbQmjQSgI1P6nxtcXOiuw2oFExw=;
 b=VLTgnSCgzfqgQD8sKDKdD0isiq/yX/9YVbYHaReBOLRAdCcdoOmghP/jkWNESTRxPWHUF3
 QyH0aZdycU+uc/AfmDuusYd6gRIJjJJek5XjictXA/ef1+kGO7EM7pCQ+RJhy0jyXRqv2O
 Wfxo72B1D9WQhtoA5MbYNHXG2PGfQD0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-D9WKrV5tPyK7nZ256Mdncw-1; Wed, 02 Sep 2020 07:53:45 -0400
X-MC-Unique: D9WKrV5tPyK7nZ256Mdncw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D2DA801FD4;
 Wed,  2 Sep 2020 11:53:44 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 472967C609;
 Wed,  2 Sep 2020 11:53:44 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 13/20] Revert "i386: Introduce use_epyc_apic_id_encoding in
 X86CPUDefinition"
Date: Wed,  2 Sep 2020 07:53:16 -0400
Message-Id: <20200902115323.850385-14-ehabkost@redhat.com>
In-Reply-To: <20200902115323.850385-1-ehabkost@redhat.com>
References: <20200902115323.850385-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 03:24:55
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Babu Moger <babu.moger@amd.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Babu Moger <babu.moger@amd.com>

This reverts commit 0c1538cb1a26287c072645f4759b9872b1596d79.

Remove the EPYC specific apicid decoding and use the generic
default decoding.

Signed-off-by: Babu Moger <babu.moger@amd.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <159889935015.21294.1425332462852607813.stgit@naples-babu.amd.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.h |  1 -
 target/i386/cpu.c | 16 ----------------
 2 files changed, 17 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d5ad42d694..5ff8ad8427 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1918,7 +1918,6 @@ void cpu_clear_apic_feature(CPUX86State *env);
 void host_cpuid(uint32_t function, uint32_t count,
                 uint32_t *eax, uint32_t *ebx, uint32_t *ecx, uint32_t *edx);
 void host_vendor_fms(char *vendor, int *family, int *model, int *stepping);
-bool cpu_x86_use_epyc_apic_id_encoding(const char *cpu_type);
 
 /* helper.c */
 bool x86_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index c9c1e681c2..b72b4b08ac 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1638,10 +1638,6 @@ typedef struct X86CPUDefinition {
     FeatureWordArray features;
     const char *model_id;
     CPUCaches *cache_info;
-
-    /* Use AMD EPYC encoding for apic id */
-    bool use_epyc_apic_id_encoding;
-
     /*
      * Definitions for alternative versions of CPU model.
      * List is terminated by item with version == 0.
@@ -1683,18 +1679,6 @@ static const X86CPUVersionDefinition *x86_cpu_def_get_versions(X86CPUDefinition
     return def->versions ?: default_version_list;
 }
 
-bool cpu_x86_use_epyc_apic_id_encoding(const char *cpu_type)
-{
-    X86CPUClass *xcc = X86_CPU_CLASS(object_class_by_name(cpu_type));
-
-    assert(xcc);
-    if (xcc->model && xcc->model->cpudef) {
-        return xcc->model->cpudef->use_epyc_apic_id_encoding;
-    } else {
-        return false;
-    }
-}
-
 static CPUCaches epyc_cache_info = {
     .l1d_cache = &(CPUCacheInfo) {
         .type = DATA_CACHE,
-- 
2.26.2


