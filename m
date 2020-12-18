Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200592DE68F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:30:27 +0100 (CET)
Received: from localhost ([::1]:59630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqHi4-0005rM-W0
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:30:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHS4-0002m7-Jt
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRx-0005Wh-Va
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608304425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lBFUGvyc6BYZ1fwbm+lORX0XcvfRUUPOwZ+l+og7TMY=;
 b=h/lACNPyrhG2IAbgi5ZCJ14rM7m9y3KWl6Eaz7TZW/kD9MpgDYuSCTFu+6Z8WvmFCtiU8o
 7WzG6hcQZhbNvtOAShYkW4p4PIzGso6AIuYS4V9RSxifqVK55zOMrmCg5c1IRI1KHcJfMf
 J6mqOyiTBnPSD1aHM+wxtPsNLTHgGMM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-VSHJpNZcNjy3quX-tw34sw-1; Fri, 18 Dec 2020 10:13:42 -0500
X-MC-Unique: VSHJpNZcNjy3quX-tw34sw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4382107ACF5;
 Fri, 18 Dec 2020 15:13:41 +0000 (UTC)
Received: from localhost (ovpn-114-84.ams2.redhat.com [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4734910013C0;
 Fri, 18 Dec 2020 15:13:41 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 22/30] simplebench/results_to_text: improve view of the table
Date: Fri, 18 Dec 2020 16:12:41 +0100
Message-Id: <20201218151249.715731-23-mreitz@redhat.com>
In-Reply-To: <20201218151249.715731-1-mreitz@redhat.com>
References: <20201218151249.715731-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Move to generic format for floats and percentage for error.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201021145859.11201-19-vsementsov@virtuozzo.com>
Acked-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 scripts/simplebench/results_to_text.py | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/scripts/simplebench/results_to_text.py b/scripts/simplebench/results_to_text.py
index 58d909ffd9..479f7ac1d4 100644
--- a/scripts/simplebench/results_to_text.py
+++ b/scripts/simplebench/results_to_text.py
@@ -16,11 +16,22 @@
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #
 
+import math
+
+
+def format_value(x, stdev):
+    stdev_pr = stdev / x * 100
+    if stdev_pr < 1.5:
+        # don't care too much
+        return f'{x:.2g}'
+    else:
+        return f'{x:.2g} ± {math.ceil(stdev_pr)}%'
+
 
 def result_to_text(result):
     """Return text representation of bench_one() returned dict."""
     if 'average' in result:
-        s = '{:.2f} +- {:.2f}'.format(result['average'], result['stdev'])
+        s = format_value(result['average'], result['stdev'])
         if 'n-failed' in result:
             s += '\n({} failed)'.format(result['n-failed'])
         return s
-- 
2.29.2


