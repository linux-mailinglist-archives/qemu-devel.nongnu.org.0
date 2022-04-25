Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A22EE50DBB7
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 10:53:45 +0200 (CEST)
Received: from localhost ([::1]:52500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niuTY-0007Ec-Mh
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 04:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1niuOx-0004Fj-RB
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:49:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1niuOw-0006JB-AR
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:48:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650876537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O7t18hK/K/k7lCGKKYZHnUSzLdL67903i7SoEEbUv24=;
 b=E2IxQYUzF5jq/ThPbClLMfHie+n4ixUTgNudyvPkaUEFUd1GOY4RafESYCuvLm0HvtFUBf
 ptC0f7qB2SBGDnkHjNXbfAuH8Jt3k+sngMxXdFtg4KGXWexaUPpyEvP4qoEqfqCOVjAa9I
 WGB+8u7Iw3YjMeLD/TVR9vaQx0Rj2X0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-30-u1dE4t27O5WiLmuFngSwfQ-1; Mon, 25 Apr 2022 04:48:54 -0400
X-MC-Unique: u1dE4t27O5WiLmuFngSwfQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E24B71857F09;
 Mon, 25 Apr 2022 08:48:53 +0000 (UTC)
Received: from localhost (unknown [10.39.192.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95D6D40FF407;
 Mon, 25 Apr 2022 08:48:53 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] virtiofsd: Add docs/helper for killpriv_v2/no_killpriv_v2
 option
Date: Mon, 25 Apr 2022 09:48:44 +0100
Message-Id: <20220425084844.1086768-4-stefanha@redhat.com>
In-Reply-To: <20220425084844.1086768-1-stefanha@redhat.com>
References: <20220425084844.1086768-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Liu Yiding <liuyd.fnst@fujitsu.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liu Yiding <liuyd.fnst@fujitsu.com>

virtiofsd has introduced killpriv_v2/no_killpriv_v2 for a while. Add
description of it to docs/helper.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
Message-Id: <20220421095151.2231099-1-liuyd.fnst@fujitsu.com>

[Small documentation fixes: s/as client supports/as the client supports/
and s/.  /. /.
--Stefan]

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 docs/tools/virtiofsd.rst | 5 +++++
 tools/virtiofsd/helper.c | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
index 0c0560203c..e457b13d56 100644
--- a/docs/tools/virtiofsd.rst
+++ b/docs/tools/virtiofsd.rst
@@ -111,6 +111,11 @@ Options
     label. Server will try to set that label on newly created file
     atomically wherever possible.
 
+  * killpriv_v2|no_killpriv_v2 -
+    Enable/disable ``FUSE_HANDLE_KILLPRIV_V2`` support. KILLPRIV_V2 is enabled
+    by default as long as the client supports it. Enabling this option helps
+    with performance in write path.
+
 .. option:: --socket-path=PATH
 
   Listen on vhost-user UNIX domain socket at PATH.
diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
index e226fc590f..f8981e5bdf 100644
--- a/tools/virtiofsd/helper.c
+++ b/tools/virtiofsd/helper.c
@@ -188,6 +188,9 @@ void fuse_cmdline_help(void)
            "    -o announce_submounts      Announce sub-mount points to the guest\n"
            "    -o posix_acl/no_posix_acl  Enable/Disable posix_acl. (default: disabled)\n"
            "    -o security_label/no_security_label  Enable/Disable security label. (default: disabled)\n"
+           "    -o killpriv_v2/no_killpriv_v2\n"
+           "                               Enable/Disable FUSE_HANDLE_KILLPRIV_V2.\n"
+           "                               (default: enabled as long as client supports it)\n"
            );
 }
 
-- 
2.35.1


