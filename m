Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70212CB881
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:20:05 +0100 (CET)
Received: from localhost ([::1]:45554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkOIu-0006bp-Mz
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:20:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNDU-00049z-5e
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCi-0003te-3b
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DPtg02KBbgeo/fb7I7tYDFfslZ3GmxNcSArYS7E1QLU=;
 b=YQR0RKE8WGpWNvQlAO2lRWkHmAohEhi1FmaiVR4Tcu7WCglxaVrzS5PyxRW5DvdDmGsSMa
 YsUrQha4VuhvZ/2eYA9807g8Jyy2tYKAl/n9khsdUEG2nD2nRCikK4W9zHARJZPBIYfYun
 W7qteb1ysJoLfVYdEE3hnbCsWkmHbfw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-WifgYmzEN3WC3Rm8ldxJ2g-1; Wed, 02 Dec 2020 03:09:33 -0500
X-MC-Unique: WifgYmzEN3WC3Rm8ldxJ2g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC8D15708B
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:32 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 921D560C17
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:32 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 113/113] scripts: kernel-doc: remove unnecesssary change wrt
 Linux
Date: Wed,  2 Dec 2020 03:08:49 -0500
Message-Id: <20201202080849.4125477-114-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A comment in kernel-doc mentions QEMU's qatomic_set macro, but since
this code originated in Linux we should just revert it and stay as close
to the kernel's copy of the script as possible.

The change was introduced (more or less unintentionally) in QEMU commit
commit d73415a31547, which did a global search-and-replace of QEMU's
atomic access macros.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index b95bae3654..4b19851b2d 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1758,7 +1758,7 @@ sub dump_function($$) {
     # If you mess with these regexps, it's a good idea to check that
     # the following functions' documentation still comes out right:
     # - parport_register_device (function pointer parameters)
-    # - qatomic_set (macro)
+    # - atomic_set (macro)
     # - pci_match_device, __copy_to_user (long return type)
 
     if ($define && $prototype =~ m/^()([a-zA-Z0-9_~:]+)\s+/) {
-- 
2.26.2


