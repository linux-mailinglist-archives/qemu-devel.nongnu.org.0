Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A4A6E95BD
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:23:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUB4-0001Zi-BU; Thu, 20 Apr 2023 09:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUAk-0001U7-DD
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:18:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUAi-0005cO-SG
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:18:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681996680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6o32OnKQySspYCv1i0uC98rIrrhiIlUItNYIUCo5zFI=;
 b=Gqz7WVDMXMtMewvCQ7VVZnVKSCRzp6ZZUZuJEsTvEb5XNgKxy5iKPMj7NwEfUOkYxFV+IP
 8iEsL6QzGbjl0okECaaWV9nVQ/5cdGtSWlCoez/h1dmraJvbNOSnp4hW3W29kiK0bSPcGD
 VzQN9F8fumOU2S48olWiOZkaqgIo9do=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-VvgXwVnNN8WW_fyMmNlQQw-1; Thu, 20 Apr 2023 09:17:54 -0400
X-MC-Unique: VvgXwVnNN8WW_fyMmNlQQw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11D18281424A;
 Thu, 20 Apr 2023 13:17:54 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E414C16024;
 Thu, 20 Apr 2023 13:17:53 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?=E6=9D=8E=E7=9A=86=E4=BF=8A?= <a_lijiejun@163.com>
Subject: [PULL 01/20] migration: remove extra whitespace character for code
 style
Date: Thu, 20 Apr 2023 15:17:32 +0200
Message-Id: <20230420131751.28534-2-quintela@redhat.com>
In-Reply-To: <20230420131751.28534-1-quintela@redhat.com>
References: <20230420131751.28534-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: 李皆俊 <a_lijiejun@163.com>

Fix code style.

Signed-off-by: 李皆俊 <a_lijiejun@163.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 79d881f735..0e68099bf9 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3293,7 +3293,7 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
 
     migration_ops = g_malloc0(sizeof(MigrationOps));
     migration_ops->ram_save_target_page = ram_save_target_page_legacy;
-    ret =  multifd_send_sync_main(f);
+    ret = multifd_send_sync_main(f);
     if (ret < 0) {
         return ret;
     }
-- 
2.39.2


