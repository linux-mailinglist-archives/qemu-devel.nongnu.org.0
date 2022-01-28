Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 019704A0418
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 00:10:01 +0100 (CET)
Received: from localhost ([::1]:49678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDaNU-00087L-32
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 18:10:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nDaEh-0005DC-8M
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:00:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nDaEQ-0006AW-6Q
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:00:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643410823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sKzI9h2PbZexUPmp6muIIvYWqT7wLW4zTdQt4HNcbWM=;
 b=PGurJPeoQ6Q3MuOF8jCmtASbEbAI9YT05ZUzT6WaCFMx750NBmgVoVECOI0GEDnaIy1pzQ
 +iPv8J8jryw6FIzTXTryLEranPhYlLb+akOXfMQeaCfIdtWFqwilJyQ9JUz2BQBn8pWHYf
 huEDLFWqUVkiQHZdrYBiOHqfBYr0a5g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-enkbFbWePom0dNv3vyayfQ-1; Fri, 28 Jan 2022 18:00:21 -0500
X-MC-Unique: enkbFbWePom0dNv3vyayfQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE224100CCC0;
 Fri, 28 Jan 2022 23:00:20 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.22.32.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EFE6108B4;
 Fri, 28 Jan 2022 23:00:07 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/4] qapi/block: Cosmetic change in BlockExportType schema
Date: Fri, 28 Jan 2022 17:00:01 -0600
Message-Id: <20220128230003.1114719-3-eblake@redhat.com>
In-Reply-To: <20220128230003.1114719-1-eblake@redhat.com>
References: <20220128230003.1114719-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.167, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daude <f4bug@amsat.org>

Fix long line introduced in commit bb01ea73110 ("qapi/block:
Restrict vhost-user-blk to CONFIG_VHOST_USER_BLK_SERVER").

Suggested-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220119121439.214821-1-f4bug@amsat.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 qapi/block-export.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qapi/block-export.json b/qapi/block-export.json
index f9ce79a974b5..f183522d0d2c 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -278,7 +278,8 @@
 ##
 { 'enum': 'BlockExportType',
   'data': [ 'nbd',
-            { 'name': 'vhost-user-blk', 'if': 'CONFIG_VHOST_USER_BLK_SERVER' },
+            { 'name': 'vhost-user-blk',
+              'if': 'CONFIG_VHOST_USER_BLK_SERVER' },
             { 'name': 'fuse', 'if': 'CONFIG_FUSE' } ] }

 ##
-- 
2.34.1


