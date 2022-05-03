Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D582517F96
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 10:17:40 +0200 (CEST)
Received: from localhost ([::1]:37628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlnj1-0005jr-9B
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 04:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nln77-0006fn-1T
 for qemu-devel@nongnu.org; Tue, 03 May 2022 03:38:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nln73-00044x-HK
 for qemu-devel@nongnu.org; Tue, 03 May 2022 03:38:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651563504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4vdb8E1Xa5WVmXBAySn3GuVnHycN0sCPpOqWpzibYeU=;
 b=Ip2KjNBbzGlhNmpIm7xIBedBRn3OfBKyP5bhJvYJBQnRqJnbU6rQpMBgWiVun0fYUvBaqL
 VGazYplT1im1I2Qhfbo5ZNqWJ4V57W85yA6tuBkMpk14rOnmw1NJouvTVeBGNAu6VDUCmn
 nEpn4Ab47hdi/H75kxOlm0X7nqdcAEs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-6vHgZQGJOEeahFPkEYRjtQ-1; Tue, 03 May 2022 03:38:19 -0400
X-MC-Unique: 6vHgZQGJOEeahFPkEYRjtQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8BDD85A5BE;
 Tue,  3 May 2022 07:38:18 +0000 (UTC)
Received: from harajuku.usersys.redhat.com (unknown [10.40.194.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D2B529E71;
 Tue,  3 May 2022 07:38:15 +0000 (UTC)
From: Andrea Bolognani <abologna@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Markus Armbruster <armbru@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH v2 2/8] qapi: Fix comment indentation
Date: Tue,  3 May 2022 09:37:31 +0200
Message-Id: <20220503073737.84223-3-abologna@redhat.com>
In-Reply-To: <20220503073737.84223-1-abologna@redhat.com>
References: <20220503073737.84223-1-abologna@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It should start on the very first column.

Signed-off-by: Andrea Bolognani <abologna@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
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


