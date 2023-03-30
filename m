Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A846D0054
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 11:57:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1php0W-0007UI-2F; Thu, 30 Mar 2023 05:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1php0S-0007QT-3x
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 05:55:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1php0K-0005sq-SG
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 05:55:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680170134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IGVhWQ6L3GhrYgaim0rPZMfmOTAYvfI+qkcY4TuZRdk=;
 b=Q6GADHdEDJKA1kkh4scAnoDcGkakA4D8nah2z4zW1DzUZ8+sZAnhFNg9lpY++ddYDFV9dl
 yGnAepQ1fk46bprghwerGFA7wRInlUGIbRvQw7hier+FbvUI2IXmtjg6KTBFfaK/XgeR0b
 l7JxNS55ehgo76+lsh3zO0m2byLAuX4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-8N6UlZ4SOJSfD85K4yZALQ-1; Thu, 30 Mar 2023 05:55:31 -0400
X-MC-Unique: 8N6UlZ4SOJSfD85K4yZALQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B02E85C07C;
 Thu, 30 Mar 2023 09:55:30 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.204])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97BE3C15BA0;
 Thu, 30 Mar 2023 09:55:29 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, quintela@redhat.com,
 dave@treblig.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH] MAINTAINERS: Remove and change David Gilbert maintainer
 entries
Date: Thu, 30 Mar 2023 10:55:24 +0100
Message-Id: <20230330095524.37691-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

I'm leaving Red Hat next week, so clean up the maintainer entries.

'virtiofs' is just the device code now, so is pretty small, and
Stefan is still a maintainer there.

'migration' still has Juan.

For 'HMP' I'll swing that over to my personal email.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 MAINTAINERS | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ef45b5e71e..f0f7fb3746 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2119,7 +2119,6 @@ T: git https://github.com/borntraeger/qemu.git s390-next
 L: qemu-s390x@nongnu.org
 
 virtiofs
-M: Dr. David Alan Gilbert <dgilbert@redhat.com>
 M: Stefan Hajnoczi <stefanha@redhat.com>
 S: Supported
 F: hw/virtio/vhost-user-fs*
@@ -2863,7 +2862,7 @@ F: tests/unit/test-rcu-*.c
 F: util/rcu.c
 
 Human Monitor (HMP)
-M: Dr. David Alan Gilbert <dgilbert@redhat.com>
+M: Dr. David Alan Gilbert <dave@treblig.org>
 S: Maintained
 F: monitor/monitor-internal.h
 F: monitor/misc.c
@@ -3136,7 +3135,6 @@ F: scripts/checkpatch.pl
 
 Migration
 M: Juan Quintela <quintela@redhat.com>
-M: Dr. David Alan Gilbert <dgilbert@redhat.com>
 S: Maintained
 F: hw/core/vmstate-if.c
 F: include/hw/vmstate-if.h
-- 
2.39.2


