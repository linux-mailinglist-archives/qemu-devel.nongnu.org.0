Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D76284E7A9E
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 21:09:40 +0100 (CET)
Received: from localhost ([::1]:51106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXqFg-0001Ga-0K
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 16:09:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXqAy-0003Qs-22
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 16:04:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXqAv-0001jD-TI
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 16:04:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648238684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DSNT5pl9pE9PgHlS0NAnv2RM2W2IjTHrOLb+Ga1gLjQ=;
 b=OqP2vcQCv0d3XpM1dDObWZnn0FCPR+qiuv1XOouLRh/xoNbJ1g+uhi3F3BcvQCFzcpt1om
 iGaXotB86wyRPo4wyqpPQFTDyLK+6AvQh0oI06U/OnTNMcI6XEZtZPD/e4rN6LgWf47Zg+
 Pc3TDrtCqxnd1sypkpsbxpUXqBRcny4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-vL9Vcy-pPuua51TZSHV5LA-1; Fri, 25 Mar 2022 16:04:41 -0400
X-MC-Unique: vL9Vcy-pPuua51TZSHV5LA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 343FE85A5BE;
 Fri, 25 Mar 2022 20:04:41 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.33.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC8735ED83B;
 Fri, 25 Mar 2022 20:04:40 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] python/aqmp-tui: relicense as LGPLv2+
Date: Fri, 25 Mar 2022 16:04:38 -0400
Message-Id: <20220325200438.2556381-5-jsnow@redhat.com>
In-Reply-To: <20220325200438.2556381-1-jsnow@redhat.com>
References: <20220325200438.2556381-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Eric Blake <eblake@redhat.com>, G S Niteesh Babu <niteesh.gs@gmail.com>,
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

CC: G S Niteesh Babu <niteesh.gs@gmail.com>
Signed-off-by: John Snow <jsnow@redhat.com>

---

Niteesh, if you agree to loosening the license on your work, you can
reply with a Reviewed-by line to let us know that you agree to the
change. If you disagree, an explicit 'nack' would be helpful.

There is no obligation for you to agree to this change, but it'd make
things easier for me if you did.

Thanks,
--js

---
 python/qemu/aqmp/aqmp_tui.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
index f1e926dd75..946ba9af24 100644
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


