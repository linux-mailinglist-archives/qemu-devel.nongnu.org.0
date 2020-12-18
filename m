Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE562DE6BD
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:37:11 +0100 (CET)
Received: from localhost ([::1]:48206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqHoc-0004nD-NY
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:37:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHS3-0002l7-J6
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHS0-0005XG-7f
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608304427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pZjO/hv+Ki5k2sjhSd9oXkWuNGDLay6RmZOiKskYRz0=;
 b=ETllhh8UYTm3rFMyYKT/3ZNs/pi71KqH/ONgFKhAm898Lo75JkvtraRsfHu0Fab625o2iZ
 hvASxV3y5DqVLSxj16SCujlzKwrFQnRFaOsLy5kAO4hfI013KpoLo/ilLwpgLuKmqDknba
 2E5fRj9ZTI1PBoc5KcUdbNoCshTUyJw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-jDLiRTh3MeS0dZGdNjZNPQ-1; Fri, 18 Dec 2020 10:13:44 -0500
X-MC-Unique: jDLiRTh3MeS0dZGdNjZNPQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA444190B2A2;
 Fri, 18 Dec 2020 15:13:43 +0000 (UTC)
Received: from localhost (ovpn-114-84.ams2.redhat.com [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D3355C1C5;
 Fri, 18 Dec 2020 15:13:43 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 23/30] simplebench/results_to_text: add difference line to the
 table
Date: Fri, 18 Dec 2020 16:12:42 +0100
Message-Id: <20201218151249.715731-24-mreitz@redhat.com>
In-Reply-To: <20201218151249.715731-1-mreitz@redhat.com>
References: <20201218151249.715731-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Performance improvements / degradations are usually discussed in
percentage. Let's make the script calculate it for us.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201021145859.11201-20-vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
[mreitz: 'seconds' instead of 'secs']
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 scripts/simplebench/results_to_text.py | 67 +++++++++++++++++++++++---
 1 file changed, 60 insertions(+), 7 deletions(-)

diff --git a/scripts/simplebench/results_to_text.py b/scripts/simplebench/results_to_text.py
index 479f7ac1d4..e46940fdf2 100644
--- a/scripts/simplebench/results_to_text.py
+++ b/scripts/simplebench/results_to_text.py
@@ -17,6 +17,10 @@
 #
 
 import math
+import tabulate
+
+# We want leading whitespace for difference row cells (see below)
+tabulate.PRESERVE_WHITESPACE = True
 
 
 def format_value(x, stdev):
@@ -39,21 +43,70 @@ def result_to_text(result):
         return 'FAILED'
 
 
-def results_to_text(results):
-    """Return text representation of bench() returned dict."""
-    from tabulate import tabulate
-
+def results_dimension(results):
     dim = None
-    tab = [[""] + [c['id'] for c in results['envs']]]
     for case in results['cases']:
-        row = [case['id']]
         for env in results['envs']:
             res = results['tab'][case['id']][env['id']]
             if dim is None:
                 dim = res['dimension']
             else:
                 assert dim == res['dimension']
+
+    assert dim in ('iops', 'seconds')
+
+    return dim
+
+
+def results_to_text(results):
+    """Return text representation of bench() returned dict."""
+    n_columns = len(results['envs'])
+    named_columns = n_columns > 2
+    dim = results_dimension(results)
+    tab = []
+
+    if named_columns:
+        # Environment columns are named A, B, ...
+        tab.append([''] + [chr(ord('A') + i) for i in range(n_columns)])
+
+    tab.append([''] + [c['id'] for c in results['envs']])
+
+    for case in results['cases']:
+        row = [case['id']]
+        case_results = results['tab'][case['id']]
+        for env in results['envs']:
+            res = case_results[env['id']]
             row.append(result_to_text(res))
         tab.append(row)
 
-    return f'All results are in {dim}\n\n' + tabulate(tab)
+        # Add row of difference between columns. For each column starting from
+        # B we calculate difference with all previous columns.
+        row = ['', '']  # case name and first column
+        for i in range(1, n_columns):
+            cell = ''
+            env = results['envs'][i]
+            res = case_results[env['id']]
+
+            if 'average' not in res:
+                # Failed result
+                row.append(cell)
+                continue
+
+            for j in range(0, i):
+                env_j = results['envs'][j]
+                res_j = case_results[env_j['id']]
+                cell += ' '
+
+                if 'average' not in res_j:
+                    # Failed result
+                    cell += '--'
+                    continue
+
+                col_j = tab[0][j + 1] if named_columns else ''
+                diff_pr = round((res['average'] - res_j['average']) /
+                                res_j['average'] * 100)
+                cell += f' {col_j}{diff_pr:+}%'
+            row.append(cell)
+        tab.append(row)
+
+    return f'All results are in {dim}\n\n' + tabulate.tabulate(tab)
-- 
2.29.2


