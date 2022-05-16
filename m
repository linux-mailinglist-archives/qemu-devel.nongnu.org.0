Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 249B4527EB1
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 09:40:02 +0200 (CEST)
Received: from localhost ([::1]:50464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqVKj-0003k1-6K
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 03:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqVGL-0000p1-QJ
 for qemu-devel@nongnu.org; Mon, 16 May 2022 03:35:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqVGJ-0001qy-0t
 for qemu-devel@nongnu.org; Mon, 16 May 2022 03:35:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652686525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dT4CDD+s8wLTAwyNQfrSeU31Dq3MJShXXZUgqOK4k7k=;
 b=eHUANBDVuMwJzoPXXFv3GWVsJuTe48kHcwx3ratQ1tgmqK7ZmovMYg0glxKjWA/5wB0WhU
 y2Z7uwfp1GfGAA1UTcemr7SdDvCc5nl4IfICdq+xmJ9wCZKs/5NiNjQgBr4q4BbLFL2cye
 ek5x5rmj1rLBWFtq19kI40HFEoN6dO8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-kHrj4v3yNteA3s2774nG-g-1; Mon, 16 May 2022 03:35:24 -0400
X-MC-Unique: kHrj4v3yNteA3s2774nG-g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20504811E78;
 Mon, 16 May 2022 07:35:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F167456F8D4;
 Mon, 16 May 2022 07:35:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D6C8021E6926; Mon, 16 May 2022 09:35:22 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	Andrea Bolognani <abologna@redhat.com>
Subject: [PULL 03/11] qapi: Fix comment indentation
Date: Mon, 16 May 2022 09:35:14 +0200
Message-Id: <20220516073522.3880774-4-armbru@redhat.com>
In-Reply-To: <20220516073522.3880774-1-armbru@redhat.com>
References: <20220516073522.3880774-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrea Bolognani <abologna@redhat.com>

It should start on the very first column.

Signed-off-by: Andrea Bolognani <abologna@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20220503073737.84223-3-abologna@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
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
2.35.3


