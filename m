Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9164B367FDF
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 13:56:50 +0200 (CEST)
Received: from localhost ([::1]:47190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZXwv-0007iT-LX
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 07:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lZXun-0005xU-DI; Thu, 22 Apr 2021 07:54:37 -0400
Received: from mx2.suse.de ([195.135.220.15]:40112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lZXul-0001yW-18; Thu, 22 Apr 2021 07:54:37 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 46670AFC2;
 Thu, 22 Apr 2021 11:54:32 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v3 01/13] hw/s390x: rename tod-qemu.c to tod-tcg.c
Date: Thu, 22 Apr 2021 13:54:18 +0200
Message-Id: <20210422115430.15078-2-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210422115430.15078-1-cfontana@suse.de>
References: <20210422115430.15078-1-cfontana@suse.de>
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

we stop short of renaming the actual qom object though,
so type remains TYPE_QEMU_S390_TOD, ie "s390-tod-qemu".

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 hw/s390x/{tod-qemu.c => tod-tcg.c} | 0
 hw/s390x/meson.build               | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename hw/s390x/{tod-qemu.c => tod-tcg.c} (100%)

diff --git a/hw/s390x/tod-qemu.c b/hw/s390x/tod-tcg.c
similarity index 100%
rename from hw/s390x/tod-qemu.c
rename to hw/s390x/tod-tcg.c
diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
index 327e9c93af..02e81a9467 100644
--- a/hw/s390x/meson.build
+++ b/hw/s390x/meson.build
@@ -16,7 +16,7 @@ s390x_ss.add(files(
   'sclp.c',
   'sclpcpu.c',
   'sclpquiesce.c',
-  'tod-qemu.c',
+  'tod-tcg.c',
   'tod.c',
 ))
 s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
-- 
2.26.2


