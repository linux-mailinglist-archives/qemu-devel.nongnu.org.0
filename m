Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D5F4DAE28
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 11:19:52 +0100 (CET)
Received: from localhost ([::1]:51482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUQkx-0005GM-0k
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 06:19:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nUQMW-00026N-Jy
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:54:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nUQMV-0007sw-9b
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647424474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=r85LZ9pP3ks4UtsYtowq/wK0Zlhomxg5m3TLBJVjALk=;
 b=HIl4r0MipZVaP8DPcAAVGpBvnxYx/vPy3c8Roj+g0QzUZVj1hnbtU+89rw5HOafuHP5W2v
 K2qKEriQpTfoMhqR1tF9jctosUPlyzGqhRBou81BkZlKS8RrTBHGvHxew3lpRYUOaPD2ZK
 o5uoYjmYBs/nQzzPIhFmWQFJwh+lZds=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-tTWkrWGmN8-IjNs8CzJNHA-1; Wed, 16 Mar 2022 05:54:33 -0400
X-MC-Unique: tTWkrWGmN8-IjNs8CzJNHA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3ADA2811E83;
 Wed, 16 Mar 2022 09:54:33 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF85E40B42BB;
 Wed, 16 Mar 2022 09:54:31 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 20/27] qapi: remove needless include
Date: Wed, 16 Mar 2022 13:54:28 +0400
Message-Id: <20220316095428.2613806-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qapi/string-output-visitor.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/qapi/string-output-visitor.c b/qapi/string-output-visitor.c
index 5506c933deef..71ddc92b7b98 100644
--- a/qapi/string-output-visitor.c
+++ b/qapi/string-output-visitor.c
@@ -14,7 +14,6 @@
 #include "qemu/cutils.h"
 #include "qapi/string-output-visitor.h"
 #include "qapi/visitor-impl.h"
-#include "qemu/host-utils.h"
 #include <math.h>
 #include "qemu/range.h"
 
-- 
2.35.1.273.ge6ebfd0e8cbb


