Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE66B533A44
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 11:51:57 +0200 (CEST)
Received: from localhost ([::1]:49222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntngK-0001me-IY
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 05:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ntnKz-00050K-28
 for qemu-devel@nongnu.org; Wed, 25 May 2022 05:29:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ntnKw-0007BU-Is
 for qemu-devel@nongnu.org; Wed, 25 May 2022 05:29:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653470989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zXUsowygGlCzKSIzdN9drLRthvVTBHDjSjGFLMVkY4Y=;
 b=ObxD/xU/gSUt4gditQuXAok3DxMjy8pvMa0AiHjqrFg0HaKPI/iiHUOTC9qCAczRGd3NhM
 teaOhfxn870ZAKkjjNQKNSPJKK0JFgxRZgyWrz8GTmvCyPglKHpbXbeMx8LOdmjQ7OJDrF
 xFuki7bfJyFDmU+8++qVdbA9tJ5xKG4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-TaoyIB6DOfqxBNThHeqtbg-1; Wed, 25 May 2022 05:29:44 -0400
X-MC-Unique: TaoyIB6DOfqxBNThHeqtbg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1195A1C3E992;
 Wed, 25 May 2022 09:29:44 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.40.195.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 21E78112131E;
 Wed, 25 May 2022 09:29:42 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL v2 2/4] trivial: qga: Log version on start
Date: Wed, 25 May 2022 12:29:36 +0300
Message-Id: <20220525092938.945611-3-kkostiuk@redhat.com>
In-Reply-To: <20220525092938.945611-1-kkostiuk@redhat.com>
References: <20220525092938.945611-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
Message-Id: <20220523191644.823726-2-kkostiuk@redhat.com>
Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
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


