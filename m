Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF08553FA5
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 02:45:35 +0200 (CEST)
Received: from localhost ([::1]:36252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3oUv-00061J-EY
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 20:45:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3oCX-0003Tt-EC
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 20:26:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3oCW-0006B1-2P
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 20:26:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655857591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YMXj7/UV6N+OaeFIHmBxdoVMbN+yl9eFzWbxfrjkqfg=;
 b=T1+dCRWEZm2oltWj3A/8t+vBME+8C2Tu74XBeMljLQUlpCR5PZnpjvOR3mRkKSoQvtxUJN
 vz/SB4aNpVplyQpxT7pfpILjAD7Cwpv10vl7ejK2NIZDO1t85mEUomSPjGl0FbseO5sShJ
 lp2k7uYpUOy621v13xs0vqMZxwGW9W0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-dojNh-yeMvOl3njM9l2SMA-1; Tue, 21 Jun 2022 20:26:28 -0400
X-MC-Unique: dojNh-yeMvOl3njM9l2SMA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC81C1C0896B;
 Wed, 22 Jun 2022 00:26:27 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32D1D141510D;
 Wed, 22 Jun 2022 00:26:26 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hailiang Zhang <zhanghailiang@xfusion.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PULL 18/25] migration: remove unused QEMUFileGetFD typedef /
 qemu_get_fd method
Date: Wed, 22 Jun 2022 02:25:40 +0200
Message-Id: <20220622002547.64784-19-quintela@redhat.com>
In-Reply-To: <20220622002547.64784-1-quintela@redhat.com>
References: <20220622002547.64784-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

From: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
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
2.35.3


