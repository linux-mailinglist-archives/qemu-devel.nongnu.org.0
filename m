Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C447557CAB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 15:14:37 +0200 (CEST)
Received: from localhost ([::1]:53632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4MfM-0005uc-5D
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 09:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1o4MbP-0002og-GH
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 09:10:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1o4MbL-0002Ly-5V
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 09:10:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655989826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rmoM2sqrNH4gB4OMADyCrtt+JYV77lbslouxb07UaD0=;
 b=FUVAamJEZ8BChjJ+rmuq64K0w3dmjZN9OEDzjIPGZcH7UwuD646Ok1krYZafuGczihR3G9
 JacVo3/Pjtk+948ICd87ojSbeDZF0E6R4dNFA8DBioxMXZCDd0/f3z3tQeSDBealiitNpC
 qmnlK8cVHNoXw6KDOJ2yNz59Ot4b53M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-l24YVwCaORSxh1PyRf7X7Q-1; Thu, 23 Jun 2022 09:10:22 -0400
X-MC-Unique: l24YVwCaORSxh1PyRf7X7Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9A538032F6;
 Thu, 23 Jun 2022 13:10:21 +0000 (UTC)
Received: from gator.redhat.com (unknown [10.40.193.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58C5940CF8EE;
 Thu, 23 Jun 2022 13:10:18 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.cs.columbia.edu
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 thuth@redhat.com, alexandru.elisei@arm.com, alex.bennee@linaro.org,
 andre.przywara@arm.com, nikos.nikoleris@arm.com, ricarkol@google.com,
 seanjc@google.com, maz@kernel.org, peter.maydell@linaro.org
Subject: [PATCH kvm-unit-tests] MAINTAINERS: Change drew's email address
Date: Thu, 23 Jun 2022 15:10:17 +0200
Message-Id: <20220623131017.670589-1-drjones@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As a side effect of leaving Red Hat I won't be able to use my Red Hat
email address anymore. I'm also changing the name of my gitlab group.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index bab08e740332..5e4c7bd70786 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -55,7 +55,7 @@ Maintainers
 -----------
 M: Paolo Bonzini <pbonzini@redhat.com>
 M: Thomas Huth <thuth@redhat.com>
-M: Andrew Jones <drjones@redhat.com>
+M: Andrew Jones <andrew.jones@linux.dev>
 S: Supported
 L: kvm@vger.kernel.org
 T: https://gitlab.com/kvm-unit-tests/kvm-unit-tests.git
@@ -64,14 +64,14 @@ Architecture Specific Code:
 ---------------------------
 
 ARM
-M: Andrew Jones <drjones@redhat.com>
+M: Andrew Jones <andrew.jones@linux.dev>
 S: Supported
 L: kvm@vger.kernel.org
 L: kvmarm@lists.cs.columbia.edu
 F: arm/
 F: lib/arm/
 F: lib/arm64/
-T: https://gitlab.com/rhdrjones/kvm-unit-tests.git
+T: https://gitlab.com/drew-jones/kvm-unit-tests.git
 
 POWERPC
 M: Laurent Vivier <lvivier@redhat.com>
-- 
2.34.3


