Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D72668CFD4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 07:53:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPHjv-0007KK-W4; Tue, 07 Feb 2023 01:46:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPHjT-00077E-RU
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 01:45:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPHjR-00040i-7y
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 01:45:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675752332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W8kmPlQQxffAVXPX6qzLhAXD9Nw3mbZV0QLD3w/pX5I=;
 b=Jpd1QSxOMUMbEvnbLjKqfvuEEAU86tJ/v2a4eCKa4as5CZDKO1GJyianeG2X13wAt8mlsw
 so+VpdN6oL2GDg7BcG4hAJUKCG2tiDlYSX3xxymXb61FbLqWgFflqBncBSbwlpN7KuKZyL
 bL52kRDXeNaGyemWJRW0/+mA+n0ajuc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-NwhVslh4PKSAqKWfdO8xng-1; Tue, 07 Feb 2023 01:45:27 -0500
X-MC-Unique: NwhVslh4PKSAqKWfdO8xng-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA831800B23;
 Tue,  7 Feb 2023 06:45:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89618492B21;
 Tue,  7 Feb 2023 06:45:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 068CB21E690F; Tue,  7 Feb 2023 07:45:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>
Subject: [PULL 11/20] migration: Clean up includes
Date: Tue,  7 Feb 2023 07:45:14 +0100
Message-Id: <20230207064523.3968603-12-armbru@redhat.com>
In-Reply-To: <20230207064523.3968603-1-armbru@redhat.com>
References: <20230207064523.3968603-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

This commit was created with scripts/clean-includes.

All .c should include qemu/osdep.h first.  The script performs three
related cleanups:

* Ensure .c files include qemu/osdep.h first.
* Including it in a .h is redundant, since the .c  already includes
  it.  Drop such inclusions.
* Likewise, including headers qemu/osdep.h includes is redundant.
  Drop these, too.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20230202133830.2152150-12-armbru@redhat.com>
---
 include/qemu/userfaultfd.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/qemu/userfaultfd.h b/include/qemu/userfaultfd.h
index 6b74f92792..55c95998e8 100644
--- a/include/qemu/userfaultfd.h
+++ b/include/qemu/userfaultfd.h
@@ -13,7 +13,6 @@
 #ifndef USERFAULTFD_H
 #define USERFAULTFD_H
 
-#include "qemu/osdep.h"
 #include "exec/hwaddr.h"
 #include <linux/userfaultfd.h>
 
-- 
2.39.0


