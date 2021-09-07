Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32D34028ED
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:36:30 +0200 (CEST)
Received: from localhost ([::1]:33432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNaKz-0002FV-Ur
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa8A-0003Xm-TC
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:23:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa89-0007qQ-6K
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:23:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=luRxH5SQbRU2KNebvbCNYcXd8ewpucrD4evtz+2Y8UA=;
 b=XWQKqdRTFsN8Uf2mQwLzfxReaiDiJWdtllJxJS27In2WUaSPln70id+hLshxVNuwCDDJw9
 WoSPMaNs2+xWzMHrIYAcV7PPxb59ZfvLAS/KdBCdSEIajDHx2D+0fFpEPvQd0Eck5AmzpN
 K+ZR5oPdY03bkaT2YZTb4eyPlS8wEY4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-lWy_PX-UPpeF2o2lRqCLOQ-1; Tue, 07 Sep 2021 08:23:10 -0400
X-MC-Unique: lWy_PX-UPpeF2o2lRqCLOQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C29341075649
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 12:23:09 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC8E55D6CF;
 Tue,  7 Sep 2021 12:22:59 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [RFC v3 15/32] scripts/qapi: strip trailing whitespaces
Date: Tue,  7 Sep 2021 16:19:26 +0400
Message-Id: <20210907121943.3498701-16-marcandre.lureau@redhat.com>
In-Reply-To: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This help workaround a rustfmt issue.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 scripts/qapi/gen.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index ab26d5c937..fa23f43808 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -50,7 +50,11 @@ def add(self, text: str) -> None:
         self._body += text
 
     def get_content(self) -> str:
-        return self._top() + self._preamble + self._body + self._bottom()
+        content = self._top() + self._preamble + self._body + self._bottom()
+        # delete trailing white-spaces (working around
+        # https://github.com/rust-lang/rustfmt/issues/4248)
+        content = re.sub(r'\s+$', '\n', content, 0, re.M)
+        return content
 
     def _top(self) -> str:
         # pylint: disable=no-self-use
-- 
2.33.0.113.g6c40894d24


