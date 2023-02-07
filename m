Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E85368CFBB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 07:47:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPHjW-000776-Sf; Tue, 07 Feb 2023 01:45:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPHjP-00075I-MU
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 01:45:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPHjN-0003zB-Hv
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 01:45:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675752329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h290jl/tV8uf8qI9r6sUMI+UrmA12JKxE3OAgW1eoyE=;
 b=h7Yb1TO4vHftBQ27vfIkyZjv60kByavvQOEWcONDcB8tZW58cDFvZQGnUAqEZryrWCpILe
 HfcIoY9A3ewpAK9YXe6ZVyosda/G+4m3OPRozFI2NO6Ddmd/dUmuYRBEpgmddVu56WYRK+
 KLvONAvr2NWztrKbRbATM5Nu0NXGsSs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-isHVohtSO9OTJcIMlnG84w-1; Tue, 07 Feb 2023 01:45:25 -0500
X-MC-Unique: isHVohtSO9OTJcIMlnG84w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6042138012E7;
 Tue,  7 Feb 2023 06:45:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36C3F2026E04;
 Tue,  7 Feb 2023 06:45:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E9D7C21E6A23; Tue,  7 Feb 2023 07:45:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Juan Quintela <quintela@redhat.com>
Subject: [PULL 04/20] scripts/clean-includes: Improve --git commit message
Date: Tue,  7 Feb 2023 07:45:07 +0100
Message-Id: <20230207064523.3968603-5-armbru@redhat.com>
In-Reply-To: <20230207064523.3968603-1-armbru@redhat.com>
References: <20230207064523.3968603-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

The script drops #include "qemu/osdep.h" from headers.  Mention it in
the commit message it uses for --git.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20230202133830.2152150-5-armbru@redhat.com>
---
 scripts/clean-includes | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/scripts/clean-includes b/scripts/clean-includes
index f0466a6262..58e1607a82 100755
--- a/scripts/clean-includes
+++ b/scripts/clean-includes
@@ -193,11 +193,17 @@ if [ "$GIT" = "yes" ]; then
     git commit --signoff -F - <<EOF
 $GITSUBJ: Clean up includes
 
-Clean up includes so that osdep.h is included first and headers
-which it implies are not included manually.
-
 This commit was created with scripts/clean-includes.
 
+All .c should include qemu/osdep.h first.  The script performs three
+related cleanups:
+
+* Ensure .c files include qemu/osdep.h first.
+* Including it in a .h is redundant, since the .c  already includes
+  it.  Drop such inclusions.
+* Likewise, including headers qemu/osdep.h includes is redundant.
+  Drop these, too.
+
 EOF
 
 fi
-- 
2.39.0


