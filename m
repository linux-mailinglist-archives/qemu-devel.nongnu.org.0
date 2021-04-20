Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D59DE365699
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 12:47:59 +0200 (CEST)
Received: from localhost ([::1]:42618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYnvC-0004O9-UR
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 06:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lYnkW-00011A-GI; Tue, 20 Apr 2021 06:36:56 -0400
Received: from mx2.suse.de ([195.135.220.15]:38266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lYnkU-0003u2-PG; Tue, 20 Apr 2021 06:36:56 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 33460B4A5;
 Tue, 20 Apr 2021 10:36:24 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v2 13/13] MAINTAINERS: update s390x directories
Date: Tue, 20 Apr 2021 12:36:16 +0200
Message-Id: <20210420103616.32731-14-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210420103616.32731-1-cfontana@suse.de>
References: <20210420103616.32731-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After the reshuffling, update MAINTAINERS accordingly.
Make use of the new directories:

target/s390x/kvm/
target/s390x/tcg/

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 MAINTAINERS | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7de873c9f5..3d738bd4fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -315,7 +315,7 @@ S390 TCG CPUs
 M: Richard Henderson <richard.henderson@linaro.org>
 M: David Hildenbrand <david@redhat.com>
 S: Maintained
-F: target/s390x/
+F: target/s390x/tcg
 F: hw/s390x/
 F: disas/s390.c
 F: tests/tcg/s390x/
@@ -417,14 +417,12 @@ M: Halil Pasic <pasic@linux.ibm.com>
 M: Cornelia Huck <cohuck@redhat.com>
 M: Christian Borntraeger <borntraeger@de.ibm.com>
 S: Supported
-F: target/s390x/kvm.c
-F: target/s390x/kvm_s390x.h
-F: target/s390x/kvm-stub.c
+F: target/s390x/kvm/
 F: target/s390x/ioinst.[ch]
 F: target/s390x/machine.c
 F: target/s390x/sigp.c
 F: target/s390x/cpu_features*.[ch]
-F: target/s390x/cpu_models.[ch]
+F: target/s390x/cpu_models*.[ch]
 F: hw/s390x/pv.c
 F: include/hw/s390x/pv.h
 F: hw/intc/s390_flic.c
-- 
2.26.2


