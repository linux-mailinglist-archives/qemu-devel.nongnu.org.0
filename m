Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF1036FA4F
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:33:48 +0200 (CEST)
Received: from localhost ([::1]:54590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSL4-00012P-Vd
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRdd-0002xY-Kb
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRdX-0007au-QG
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619783323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gYWdfQ1Xz39dlCgGPZDN+OPcgzulItKuPaIbBZJ/BXI=;
 b=aqK2KOoz3M97JNay4S9OFLHtD8ZIsfbhdNQORwwHi/mX03gf2My09wX1zBX8qaVJuSzKlx
 XXDlVYvYNmHBQoGWDd3uaIcz51VaFrjxVcRypRMC+vQOqw8Ajz+pr4E7dbzjVizWoeosdU
 guXMNSIBXH/XH4zhVTp9L4dzpjZvHW4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-AZrOHFuiPT6V0cdZ22padQ-1; Fri, 30 Apr 2021 07:48:41 -0400
X-MC-Unique: AZrOHFuiPT6V0cdZ22padQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 277B881841D;
 Fri, 30 Apr 2021 11:48:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB9442B431;
 Fri, 30 Apr 2021 11:48:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6ED87113525E; Fri, 30 Apr 2021 13:48:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/25] qapi/expr: Comment cleanup
Date: Fri, 30 Apr 2021 13:48:14 +0200
Message-Id: <20210430114838.2912740-2-armbru@redhat.com>
In-Reply-To: <20210430114838.2912740-1-armbru@redhat.com>
References: <20210430114838.2912740-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

The linter yaps after 0825f62c842. Fix this trivial issue to restore the
linter baseline.

(Yes, ideally -- and soon -- the linter will be part of CI so we don't
clutter up the log with fixups. For now, though, the baseline is useful
for testing intermediate commits as types are added to the QAPI
library.)

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210421182032.3521476-2-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/expr.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 540b3982b1..c207481f7e 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -241,7 +241,7 @@ def check_enum(expr, info):
         source = "%s '%s'" % (source, member_name)
         # Enum members may start with a digit
         if member_name[0].isdigit():
-            member_name = 'd' + member_name # Hack: hide the digit
+            member_name = 'd' + member_name  # Hack: hide the digit
         check_name_lower(member_name, info, source,
                          permit_upper=permissive,
                          permit_underscore=permissive)
-- 
2.26.3


