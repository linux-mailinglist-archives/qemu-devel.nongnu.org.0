Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C146F5315AB
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 21:19:22 +0200 (CEST)
Received: from localhost ([::1]:53952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntDaL-0000Au-TA
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 15:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ntDY1-0007TQ-51
 for qemu-devel@nongnu.org; Mon, 23 May 2022 15:16:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ntDXv-0007Sb-82
 for qemu-devel@nongnu.org; Mon, 23 May 2022 15:16:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653333410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6GCZNHHTdx6Z6VoOOibGK40JQian2HFnx8ya6b+uuVk=;
 b=LyFoQNrQMty9+LFEOYy6QgiRQ5ws3siEIF7u4y//DEJsXPTVkpB2+WguR/nmWO8jr9xGu9
 8E3rUa3oA5ckRTdW4/Slkhj37TJ0+rsqRasyW7EgcwWlS36Yr35ubz9GKRGUu5/Az9HNSs
 m4/einSXd2rXl+aL3kG2eiHms53Wfms=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-307-qfJIY5O-MfWF1Z-47d3NWg-1; Mon, 23 May 2022 15:16:49 -0400
X-MC-Unique: qfJIY5O-MfWF1Z-47d3NWg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8B431E7DCC1;
 Mon, 23 May 2022 19:16:48 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.40.195.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E86B02026D6A;
 Mon, 23 May 2022 19:16:47 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: [PATCH v2 1/1] trivial: qga: Log version on start
Date: Mon, 23 May 2022 22:16:44 +0300
Message-Id: <20220523191644.823726-2-kkostiuk@redhat.com>
In-Reply-To: <20220523191644.823726-1-kkostiuk@redhat.com>
References: <20220523191644.823726-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qga/main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/qga/main.c b/qga/main.c
index 3b9546c185..c373fec3ee 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -1271,6 +1271,8 @@ static GAState *initialize_agent(GAConfig *config, int socket_activation)
     g_log_set_fatal_mask(NULL, G_LOG_LEVEL_ERROR);
     ga_enable_logging(s);

+    g_debug("Guest agent version %s started", QEMU_FULL_VERSION);
+
 #ifdef _WIN32
     /* On win32 the state directory is application specific (be it the default
      * or a user override). We got past the command line parsing; let's create
--
2.25.1


