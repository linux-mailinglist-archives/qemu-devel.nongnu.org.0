Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBAD6F027E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 10:27:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prwx7-0001Gq-Oj; Thu, 27 Apr 2023 04:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prwx5-0001G7-Qg
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:26:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prwx3-0001F0-R2
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:26:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682583965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3w1rOUa5z7RRwOxPHtBl+ddK9F/d7qP93gi831XK03Y=;
 b=g+8E1vj37u42NbvXSb55n+1rzmhUE4zZnHw498xv7WNsx07/6SIqqvQBydorwTgkALP0QW
 aWwjwUxiH5a4Z3u1Ek62Mh2gcpGyJLgxLGa0hLX6TbRhmW0A6Ly3MFghRJ2DphEMPPqrWu
 hxaWzq4RZ9afHZYvk9cfhe2lOu0JmFs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-xN3n7jihPsyyNXabvWyRtw-1; Thu, 27 Apr 2023 04:26:03 -0400
X-MC-Unique: xN3n7jihPsyyNXabvWyRtw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B0D13806720
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 08:26:03 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25696C15BA0;
 Thu, 27 Apr 2023 08:26:02 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PULL 2/7] MAINTAINERS: Add Leonardo and Peter as reviewers
Date: Thu, 27 Apr 2023 10:25:52 +0200
Message-Id: <20230427082557.20994-3-quintela@redhat.com>
In-Reply-To: <20230427082557.20994-1-quintela@redhat.com>
References: <20230427082557.20994-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Now that David has stepped down with Migration maintainership,
Leonardo and Peter has volunteer to review the migration patches.
This way they got CC'd on every migration patch.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Acked-by: Peter Xu <peterx@redhat.com>
Acked-by: Leonardo Bras <leobras@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fc225e66df..a8b942dea4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3154,6 +3154,8 @@ F: scripts/checkpatch.pl
 
 Migration
 M: Juan Quintela <quintela@redhat.com>
+R: Peter Xu <peterx@redhat.com>
+R: Leonardo Bras <leobras@redhat.com>
 S: Maintained
 F: hw/core/vmstate-if.c
 F: include/hw/vmstate-if.h
-- 
2.40.0


