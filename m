Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C779142F144
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 14:46:22 +0200 (CEST)
Received: from localhost ([::1]:48370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbMbN-0005PN-Jv
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 08:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mbMXx-0003My-SD
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 08:42:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mbMXv-00070g-Gg
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 08:42:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634301765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iYwoLI8tZShqcFoR9LC2/X9fbFaIJaOUmyRtbd1R+xU=;
 b=GjFlu+1p3WbbwPGJdq4puMTJXYzKZMnG3gkjR0xox0UzLD/Zq6WIaMQ6J5yB19Uj92QnNy
 xz6glN5HM5YmOuR4dMVyxO/rVvG2Z4wO7ongiVb+iUQkTE/R0WzTywKv9gjpr9Sbn3Zg7q
 oc2DEK6sKkRjOCV74geP5gsvM3HMIoM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-qKpxOJV-MNaeGq-eHUsiEw-1; Fri, 15 Oct 2021 08:42:41 -0400
X-MC-Unique: qKpxOJV-MNaeGq-eHUsiEw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 360FE1006AAE;
 Fri, 15 Oct 2021 12:42:40 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18B3B60BD8;
 Fri, 15 Oct 2021 12:42:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH] target/s390x/cpu.h: Remove unused SIGP_MODE defines
Date: Fri, 15 Oct 2021 14:42:19 +0200
Message-Id: <20211015124219.1330830-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are unused since commit 075e52b816648f21 ("s390x/cpumodel:
we are always in zarchitecture mode") and it's unlikely that we
will ever need them again. So let's simply remove them now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/cpu.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 3153d053e9..ca3845d023 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -674,11 +674,6 @@ QEMU_BUILD_BUG_ON(sizeof(SysIB) != 4096);
 #define SIGP_STAT_INVALID_ORDER     0x00000002UL
 #define SIGP_STAT_RECEIVER_CHECK    0x00000001UL
 
-/* SIGP SET ARCHITECTURE modes */
-#define SIGP_MODE_ESA_S390 0
-#define SIGP_MODE_Z_ARCH_TRANS_ALL_PSW 1
-#define SIGP_MODE_Z_ARCH_TRANS_CUR_PSW 2
-
 /* SIGP order code mask corresponding to bit positions 56-63 */
 #define SIGP_ORDER_MASK 0x000000ff
 
-- 
2.27.0


