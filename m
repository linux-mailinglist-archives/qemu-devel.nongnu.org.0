Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA7450A418
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:29:01 +0200 (CEST)
Received: from localhost ([::1]:42622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhYjs-0001ix-7A
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhYXY-0003Wf-Bw
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:16:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhYXS-0005nc-Bd
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:16:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650554169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RC99QeCbJTpA4Y7YOyP4tSxhIVIUXbOKhrPiEE81afg=;
 b=c7Fa/CpKAwJ61jwfxMua7IkFOnYfLaIblE7N0psqJLB36wdHEtzerb7d2WbhDjS31CZsG1
 TNe4W+Ltopsx/YDRD9WOoNqUKckroWyv0sKXBrPrmKs+IbxRLzs/LtabR3CIyA3DG8oOv8
 O33MrVjwkdtkhG20ELWeSmEh5gr4F2k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-Jk8DL4v8OYiRD3E982zvNA-1; Thu, 21 Apr 2022 11:16:06 -0400
X-MC-Unique: Jk8DL4v8OYiRD3E982zvNA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDB973C1E8E8;
 Thu, 21 Apr 2022 15:16:05 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B78E40D016A;
 Thu, 21 Apr 2022 15:16:05 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/17] python/aqmp-tui: relicense as LGPLv2+
Date: Thu, 21 Apr 2022 11:15:51 -0400
Message-Id: <20220421151600.984189-9-jsnow@redhat.com>
In-Reply-To: <20220421151600.984189-1-jsnow@redhat.com>
References: <20220421151600.984189-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>, G S Niteesh Babu <niteesh.gs@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

aqmp-tui, the async QMP text user interface tool, is presently licensed
as GPLv2+. I intend to include this tool as an add-on to an LGPLv2+
library package hosted on PyPI.org. I've selected LGPLv2+ to maximize
compatibility with other licenses while retaining a copyleft license.

To keep licensing matters simple, I'd like to relicense this tool as
LGPLv2+ as well in order to keep the resultant license of the hosted
release files simple -- even if library users won't "link against" this
command line tool.

Therefore, I am asking permission to loosen the license.

Niteesh is effectively the sole author of this code, with scattered
lines from myself.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: G S Niteesh Babu <niteesh.gs@gmail.com>
Message-id: 20220325200438.2556381-5-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/aqmp_tui.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
index f1e926dd756..946ba9af24e 100644
--- a/python/qemu/aqmp/aqmp_tui.py
+++ b/python/qemu/aqmp/aqmp_tui.py
@@ -3,7 +3,7 @@
 # Authors:
 #  Niteesh Babu G S <niteesh.gs@gmail.com>
 #
-# This work is licensed under the terms of the GNU GPL, version 2 or
+# This work is licensed under the terms of the GNU LGPL, version 2 or
 # later.  See the COPYING file in the top-level directory.
 """
 AQMP TUI
-- 
2.34.1


