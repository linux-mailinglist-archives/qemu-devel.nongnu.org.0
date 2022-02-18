Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E57B64BBB9D
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 16:01:23 +0100 (CET)
Received: from localhost ([::1]:60376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL4l9-0001tS-1J
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 10:01:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nL4fy-0004mz-BU
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 09:56:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nL4fs-00082G-FZ
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 09:55:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645196155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gs24yFQ61Nz+qWKjk5+tqTz+kDzDGOiXSWYeFDqhN4c=;
 b=RS6N/QhnsSvJOCaidrH5YznyZTVMLBR0VBoTTgbAPfhW68M6qamNh9jzOyTr56FeHx8xqs
 WgLjLYNwP2i80kPFDmZPFVkt2Pcph+mHy5DhGK4Bn5F4AaJKqdlNXLB4uMuU2Vl1M+l1vA
 UGPVy+yM4kwhiKiHUCyVf0L+K0ccF6Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-B0IbRKvZNweCWR6THTwDSw-1; Fri, 18 Feb 2022 09:55:54 -0500
X-MC-Unique: B0IbRKvZNweCWR6THTwDSw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56D721853026;
 Fri, 18 Feb 2022 14:55:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD39070D5C;
 Fri, 18 Feb 2022 14:55:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4CE3721A408E; Fri, 18 Feb 2022 15:55:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] keyval: Fix grammar comment to cover downstream prefix
Date: Fri, 18 Feb 2022 15:55:50 +0100
Message-Id: <20220218145551.892787-2-armbru@redhat.com>
In-Reply-To: <20220218145551.892787-1-armbru@redhat.com>
References: <20220218145551.892787-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: michael.roth@amd.com, vsementsov@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to the grammar, a key __com.redhat_foo would be parsed as
two key fragments __com and redhat_foo.  It's actually parsed as a
single fragment.  Fix the grammar.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 util/keyval.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/util/keyval.c b/util/keyval.c
index 904337c8a1..0cf2e84dc8 100644
--- a/util/keyval.c
+++ b/util/keyval.c
@@ -16,7 +16,9 @@
  *   key-vals     = [ key-val { ',' key-val } [ ',' ] ]
  *   key-val      = key '=' val | help
  *   key          = key-fragment { '.' key-fragment }
- *   key-fragment = / [^=,.]+ /
+ *   key-fragment = qapi-name | index
+ *   qapi-name    = '__' / [a-z0-9.-]+ / '_' / [A-Za-z][A-Za-z0-9_-]* /
+ *   index        = / [0-9]+ /
  *   val          = { / [^,]+ / | ',,' }
  *   help         = 'help' | '?'
  *
-- 
2.35.1


