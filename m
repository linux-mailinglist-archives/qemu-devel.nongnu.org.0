Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A19B5F776B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 13:28:39 +0200 (CEST)
Received: from localhost ([::1]:58870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oglWw-00026P-6x
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 07:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogkuE-0005in-Jz
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogku5-0003Ce-25
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PNjC7REejBl0RJBZCEgd0Opnj3zP+Nr6L9QKK3iK0Ns=;
 b=QUElCPjfdTej6281jiYYBs1Yuo/xsB8Vd9mjSRz3l2diJ+P1vBuy7A0d/6ZYIwEw1xbvmK
 NaBtbV0OdK0AskcrqWasNGrfioYRe7KndPL8TXez6ILz5u5pLfPp+yOmjQk0fRZ+LZiqy9
 sLriVF4rXWqlSS+UG3epJOIBkArew0g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-Ih8G82wGO5apOscJOVfIMw-1; Fri, 07 Oct 2022 06:48:25 -0400
X-MC-Unique: Ih8G82wGO5apOscJOVfIMw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 305E6862FE0;
 Fri,  7 Oct 2022 10:48:25 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EE412028DC1;
 Fri,  7 Oct 2022 10:48:24 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 25/50] 9p: add missing coroutine_fn annotations
Date: Fri,  7 Oct 2022 12:47:27 +0200
Message-Id: <20221007104752.141361-26-kwolf@redhat.com>
In-Reply-To: <20221007104752.141361-1-kwolf@redhat.com>
References: <20221007104752.141361-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Callers of coroutine_fn must be coroutine_fn themselves, or the call
must be within "if (qemu_in_coroutine())".  Apply coroutine_fn to
functions where this holds.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220922084924.201610-25-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/9pfs/9p.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index 994f952600..a523ac34a9 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -424,21 +424,24 @@ typedef struct V9fsGetlock
 extern int open_fd_hw;
 extern int total_open_fd;
 
-static inline void v9fs_path_write_lock(V9fsState *s)
+static inline void coroutine_fn
+v9fs_path_write_lock(V9fsState *s)
 {
     if (s->ctx.export_flags & V9FS_PATHNAME_FSCONTEXT) {
         qemu_co_rwlock_wrlock(&s->rename_lock);
     }
 }
 
-static inline void v9fs_path_read_lock(V9fsState *s)
+static inline void coroutine_fn
+v9fs_path_read_lock(V9fsState *s)
 {
     if (s->ctx.export_flags & V9FS_PATHNAME_FSCONTEXT) {
         qemu_co_rwlock_rdlock(&s->rename_lock);
     }
 }
 
-static inline void v9fs_path_unlock(V9fsState *s)
+static inline void coroutine_fn
+v9fs_path_unlock(V9fsState *s)
 {
     if (s->ctx.export_flags & V9FS_PATHNAME_FSCONTEXT) {
         qemu_co_rwlock_unlock(&s->rename_lock);
-- 
2.37.3


