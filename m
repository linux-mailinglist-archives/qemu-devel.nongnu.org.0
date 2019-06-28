Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1E559125
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 04:28:02 +0200 (CEST)
Received: from localhost ([::1]:55802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hggcL-0000qe-M6
	for lists+qemu-devel@lfdr.de; Thu, 27 Jun 2019 22:28:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50157)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hgg8n-0000x5-Sh
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 21:57:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hgg8m-0001ic-2n
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 21:57:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50162)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hgg8l-00016d-Pg
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 21:57:27 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1586983F40;
 Fri, 28 Jun 2019 01:57:12 +0000 (UTC)
Received: from localhost (ovpn-116-7.gru2.redhat.com [10.97.116.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 847EE19C70;
 Fri, 28 Jun 2019 01:57:11 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Thu, 27 Jun 2019 22:56:02 -0300
Message-Id: <20190628015606.32107-26-ehabkost@redhat.com>
In-Reply-To: <20190628015606.32107-1-ehabkost@redhat.com>
References: <20190628015606.32107-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Fri, 28 Jun 2019 01:57:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 25/29] x86/cpu: use FeatureWordArray to define
 filtered_features
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
 Wei Yang <richardw.yang@linux.intel.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wei Yang <richardw.yang@linux.intel.com>

Use the same definition as features/user_features in CPUX86State.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Message-Id: <20190620023746.9869-1-richardw.yang@linux.intel.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index ff26351538..85319f4ae1 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1440,7 +1440,7 @@ struct X86CPU {
     } mwait;
 
     /* Features that were filtered out because of missing host capabilities */
-    uint32_t filtered_features[FEATURE_WORDS];
+    FeatureWordArray filtered_features;
 
     /* Enable PMU CPUID bits. This can't be enabled by default yet because
      * it doesn't have ABI stability guarantees, as it passes all PMU CPUID
-- 
2.18.0.rc1.1.g3f1ff2140


