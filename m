Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8D4514FE5
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:50:02 +0200 (CEST)
Received: from localhost ([::1]:34016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkSsb-0001pR-Cp
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:50:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nkSqz-0007Xv-El
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:48:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nkSqx-0001aW-LK
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:48:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651247299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pFlincT6QAsLZCL6ybhTI3g3STIYLD0WVcgCNqCYmuM=;
 b=HJevWDdbVVZdlPt3vXOIF94bmP33LowoZybe7usHoRIb8bxNwlKW7+FxjxxMlh0JJiNqIg
 UQEsVFEAaoQgi5ai0C+wvajGkhDhzsz9oV6ykllHOX8pIvngnDbA5AmtyAAa0yEeCOQ4to
 amPzlXr/XrZHf+zb8KiZ3/Q7HG3SeuQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-KwwiiXvfOPi7RAI6mZwovg-1; Fri, 29 Apr 2022 11:48:12 -0400
X-MC-Unique: KwwiiXvfOPi7RAI6mZwovg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EAAA18002BF;
 Fri, 29 Apr 2022 15:48:11 +0000 (UTC)
Received: from harajuku.usersys.redhat.com (unknown [10.40.192.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9F29413707;
 Fri, 29 Apr 2022 15:48:08 +0000 (UTC)
From: Andrea Bolognani <abologna@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] qapi: Fix comment indentation
Date: Fri, 29 Apr 2022 17:47:53 +0200
Message-Id: <20220429154758.354610-3-abologna@redhat.com>
In-Reply-To: <20220429154758.354610-1-abologna@redhat.com>
References: <20220429154758.354610-1-abologna@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It should start on the very first column.

Signed-off-by: Andrea Bolognani <abologna@redhat.com>
---
 qapi/ui.json | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 059302a5ef..43e62efd76 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1250,21 +1250,21 @@
                 '*p2p': 'bool',
                 '*audiodev': 'str' } }
 
- ##
- # @DisplayGLMode:
- #
- # Display OpenGL mode.
- #
- # @off: Disable OpenGL (default).
- # @on: Use OpenGL, pick context type automatically.
- #      Would better be named 'auto' but is called 'on' for backward
- #      compatibility with bool type.
- # @core: Use OpenGL with Core (desktop) Context.
- # @es: Use OpenGL with ES (embedded systems) Context.
- #
- # Since: 3.0
- #
- ##
+##
+# @DisplayGLMode:
+#
+# Display OpenGL mode.
+#
+# @off: Disable OpenGL (default).
+# @on: Use OpenGL, pick context type automatically.
+#      Would better be named 'auto' but is called 'on' for backward
+#      compatibility with bool type.
+# @core: Use OpenGL with Core (desktop) Context.
+# @es: Use OpenGL with ES (embedded systems) Context.
+#
+# Since: 3.0
+#
+##
 { 'enum'    : 'DisplayGLMode',
   'data'    : [ 'off', 'on', 'core', 'es' ] }
 
-- 
2.35.1


