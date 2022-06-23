Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 099AF558206
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 19:09:29 +0200 (CEST)
Received: from localhost ([::1]:55112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4QKe-0007AE-2r
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 13:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o4Q66-0006BJ-1a
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 12:54:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o4Q64-0005zd-JD
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 12:54:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656003263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2kXETOHqNVN75aUkz1bPSP293e03Yqd4m5NMtIrkuf8=;
 b=JaqzVjNDf+6CeEYGwhGS0GFQrUGUwU1rIeDah6XGq865PiFbYsifu6yBbiQ1YMsTewMx+n
 mGEAP6h6ILaM5KusgkU4zLZVkBJh0r23+xv+I2avuquNzVndaytggzvOEUWkyM3hqIwUxu
 /9daQkSFCk3BTPHXrEQLAMffGPHbE9w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-VbDigDTvPrWDr14cHTQjTQ-1; Thu, 23 Jun 2022 12:54:22 -0400
X-MC-Unique: VbDigDTvPrWDr14cHTQjTQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6B27811E7A;
 Thu, 23 Jun 2022 16:54:21 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED4182024CB6;
 Thu, 23 Jun 2022 16:54:20 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com, peterx@redhat.com
Cc: jdenemar@redhat.com
Subject: [PULL 18/25] migration: remove unused QEMUFileGetFD typedef /
 qemu_get_fd method
Date: Thu, 23 Jun 2022 17:53:47 +0100
Message-Id: <20220623165354.197792-19-dgilbert@redhat.com>
In-Reply-To: <20220623165354.197792-1-dgilbert@redhat.com>
References: <20220623165354.197792-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

From: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/qemu-file.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index 3c93a27978..fe1b2d1c00 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -46,10 +46,6 @@ typedef ssize_t (QEMUFileGetBufferFunc)(void *opaque, uint8_t *buf,
  */
 typedef int (QEMUFileCloseFunc)(void *opaque, Error **errp);
 
-/* Called to return the OS file descriptor associated to the QEMUFile.
- */
-typedef int (QEMUFileGetFD)(void *opaque);
-
 /* Called to change the blocking mode of the file
  */
 typedef int (QEMUFileSetBlocking)(void *opaque, bool enabled, Error **errp);
@@ -121,7 +117,6 @@ typedef struct QEMUFileHooks {
 QEMUFile *qemu_file_new_input(QIOChannel *ioc, const QEMUFileOps *ops);
 QEMUFile *qemu_file_new_output(QIOChannel *ioc, const QEMUFileOps *ops);
 void qemu_file_set_hooks(QEMUFile *f, const QEMUFileHooks *hooks);
-int qemu_get_fd(QEMUFile *f);
 int qemu_fclose(QEMUFile *f);
 
 /*
-- 
2.36.1


