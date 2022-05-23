Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A44DD531174
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 16:59:46 +0200 (CEST)
Received: from localhost ([::1]:55802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt9X7-0006cu-Ob
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 10:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nt9To-0004wv-V7
 for qemu-devel@nongnu.org; Mon, 23 May 2022 10:56:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nt9Tl-000746-Ot
 for qemu-devel@nongnu.org; Mon, 23 May 2022 10:56:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653317775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=mRnzJCFNkmvvYhmV2sindAF+7xIAYGUK490k8Jr8qBg=;
 b=ADNg1k6bY1ujHif07ZC9YCkIbvqSGuLJmU4WBzMr+Q67rVJv7zhAO+1T4p0NdXtI9+K41C
 Xs6TRlm4CEyTe44tU54kJELnpRBf4n7Bh3DZA7aD0UlKKHcCZ5HuI5bI9ys2bMR3WV9zjY
 I02oTgTziyg83iMMEM2TsxLgDP2m+xs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-HbrDLoeGOsyYwo5RdPzLWA-1; Mon, 23 May 2022 10:56:14 -0400
X-MC-Unique: HbrDLoeGOsyYwo5RdPzLWA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0EFA21C01B23;
 Mon, 23 May 2022 14:56:14 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.40.195.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E0D3E40C1257;
 Mon, 23 May 2022 14:56:12 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: [PATCH] trivial: qga: Log version on start
Date: Mon, 23 May 2022 17:56:10 +0300
Message-Id: <20220523145610.809663-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
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

Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 qga/main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/qga/main.c b/qga/main.c
index 3b9546c185..a58368c75e 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -1271,6 +1271,8 @@ static GAState *initialize_agent(GAConfig *config, int socket_activation)
     g_log_set_fatal_mask(NULL, G_LOG_LEVEL_ERROR);
     ga_enable_logging(s);
 
+    g_debug("Guest agent version %s started", QEMU_VERSION);
+
 #ifdef _WIN32
     /* On win32 the state directory is application specific (be it the default
      * or a user override). We got past the command line parsing; let's create
-- 
2.25.1


