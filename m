Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDCD3F7CE4
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 21:56:18 +0200 (CEST)
Received: from localhost ([::1]:55042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIz0T-00082R-8o
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 15:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mIyz3-0005KQ-U8
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 15:54:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mIyz2-0008Ke-Bt
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 15:54:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629921287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q2tqPMHRyEtpmO3eJALWcPgGDoQauCIH+a8Fy4roSRg=;
 b=YaZDAvepORDLcFhDJWzX3YM+mwczO+d8Yvo5om0Zfjh/Nzxzs9hKbfYrJCLk05nv71GoiP
 5w923/CsE3FOFdPhgEDibgVjCKz661q7lpvkYBwMDyKPaWfPgqyL4IcgNjKLpNwAm1ampd
 szAE5B2bSWR+TEwsl8sh9XqFluk9xi8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-fGd_DOP8OvaZmd8jvbBcnA-1; Wed, 25 Aug 2021 15:54:45 -0400
X-MC-Unique: fGd_DOP8OvaZmd8jvbBcnA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D98E9801A92;
 Wed, 25 Aug 2021 19:54:42 +0000 (UTC)
Received: from localhost (unknown [10.22.32.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E8E960871;
 Wed, 25 Aug 2021 19:54:42 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/2] i386/cpu: Remove AVX_VNNI feature from Cooperlake cpu model
Date: Wed, 25 Aug 2021 15:54:38 -0400
Message-Id: <20210825195438.914387-3-ehabkost@redhat.com>
In-Reply-To: <20210825195438.914387-1-ehabkost@redhat.com>
References: <20210825195438.914387-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Yang Zhong <yang.zhong@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yang Zhong <yang.zhong@intel.com>

The AVX_VNNI feature is not in Cooperlake platform, remove it
from cpu model.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210820054611.84303-1-yang.zhong@intel.com>
Fixes: c1826ea6a052 ("i386/cpu: Expose AVX_VNNI instruction to guest")
Cc: qemu-stable@nongnu.org
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index aebf81d9c98..97e250e8760 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3102,7 +3102,7 @@ static const X86CPUDefinition builtin_x86_defs[] = {
             MSR_ARCH_CAP_SKIP_L1DFL_VMENTRY | MSR_ARCH_CAP_MDS_NO |
             MSR_ARCH_CAP_PSCHANGE_MC_NO | MSR_ARCH_CAP_TAA_NO,
         .features[FEAT_7_1_EAX] =
-            CPUID_7_1_EAX_AVX_VNNI | CPUID_7_1_EAX_AVX512_BF16,
+            CPUID_7_1_EAX_AVX512_BF16,
         /* XSAVES is added in version 2 */
         .features[FEAT_XSAVE] =
             CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC |
-- 
2.31.1


