Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 029715B9F32
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 17:51:04 +0200 (CEST)
Received: from localhost ([::1]:53220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYr8o-0002Zh-EG
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 11:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oYr4K-00071u-Az
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 11:46:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oYr4H-0008Vx-G8
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 11:46:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663256780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LlZFnnRbZvhI/3669iDTsX/XMeUsl2k+kTwdxvtR+Rc=;
 b=WFYNj4XWnROK99XhglAQMIs5c8nhT0f3ZAJB+yQUdzU/cKOm8nDAysEw1ENrq4s1sVGEWt
 n0TERrIaJH+HmLjdYCln2N/a3n6y3U0kx8UindaFDKKWGvIuGm5eDe/NcBjBUMtF8PjzU2
 o5QDrJ7FUXrhrFT8tVZSvjQjeB6Ok2Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-7i3oC1dPNKOyjAXtESnvcQ-1; Thu, 15 Sep 2022 11:46:19 -0400
X-MC-Unique: 7i3oC1dPNKOyjAXtESnvcQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19C32101E151;
 Thu, 15 Sep 2022 15:46:19 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A39B492B04;
 Thu, 15 Sep 2022 15:46:17 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	pizhenwei@bytedance.com,
	dongli.zhang@oracle.com
Cc: armbru@redhat.com
Subject: [PULL 2/3] monitor/hmp: print trace as option in help for log command
Date: Thu, 15 Sep 2022 16:46:05 +0100
Message-Id: <20220915154606.124713-3-dgilbert@redhat.com>
In-Reply-To: <20220915154606.124713-1-dgilbert@redhat.com>
References: <20220915154606.124713-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dongli Zhang <dongli.zhang@oracle.com>

The below is printed when printing help information in qemu-system-x86_64
command line, and when CONFIG_TRACE_LOG is enabled:

----------------------------
$ qemu-system-x86_64 -d help
... ...
trace:PATTERN   enable trace events

Use "-d trace:help" to get a list of trace events.
----------------------------

However, the options of "trace:PATTERN" are only printed by
"qemu-system-x86_64 -d help", but missing in hmp "help log" command.

Fixes: c84ea00dc2 ("log: add "-d trace:PATTERN"")
Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
Message-Id: <20220831213943.8155-1-dongli.zhang@oracle.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 monitor/hmp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/monitor/hmp.c b/monitor/hmp.c
index 15ca04735c..a3375d0341 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -285,10 +285,15 @@ void help_cmd(Monitor *mon, const char *name)
         if (!strcmp(name, "log")) {
             const QEMULogItem *item;
             monitor_printf(mon, "Log items (comma separated):\n");
-            monitor_printf(mon, "%-10s %s\n", "none", "remove all logs");
+            monitor_printf(mon, "%-15s %s\n", "none", "remove all logs");
             for (item = qemu_log_items; item->mask != 0; item++) {
-                monitor_printf(mon, "%-10s %s\n", item->name, item->help);
+                monitor_printf(mon, "%-15s %s\n", item->name, item->help);
             }
+#ifdef CONFIG_TRACE_LOG
+            monitor_printf(mon, "trace:PATTERN   enable trace events\n");
+            monitor_printf(mon, "\nUse \"log trace:help\" to get a list of "
+                           "trace events.\n\n");
+#endif
             return;
         }
 
-- 
2.37.3


