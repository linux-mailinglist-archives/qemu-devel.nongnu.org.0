Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 153CD49B875
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 17:23:24 +0100 (CET)
Received: from localhost ([::1]:35570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCObK-0008E4-St
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 11:23:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nCNYK-0005gl-TG
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 10:16:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nCNYI-0007Xi-2x
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 10:16:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643123723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=30ze/qhavnNm5ImLkTHzqCtHhzSjH5L6eL97b/xXx6s=;
 b=VOAiQoPiCpob8c0sM8LTNbqZVea142heY0/0hvv/mSU9dMUD6C3OqUSFqtobGV9nfUK7fz
 adqcl8hFlAijB9VD6FgRtXRAYFeOcYd+c08QgWXm8IrZBDTCsd01xO569qVooubi/US4Z4
 63o0GmmFou7mevfA/r/rdy7MylfJOu4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-O1UVhpCfOFekunmEvAfmug-1; Tue, 25 Jan 2022 10:15:22 -0500
X-MC-Unique: O1UVhpCfOFekunmEvAfmug-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7566481424C;
 Tue, 25 Jan 2022 15:15:19 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.195.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37F7F6AE6F;
 Tue, 25 Jan 2022 15:15:17 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] qemu-storage-daemon: Fix typo in vhost-user-blk help
Date: Tue, 25 Jan 2022 16:15:14 +0100
Message-Id: <20220125151514.49035-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, hreitz@redhat.com, f4bug@amsat.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The syntax of the fd passing case misses the "addr.type=" key. Add it.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 storage-daemon/qemu-storage-daemon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index 9d76d1114d..ec9aa79b55 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -111,7 +111,7 @@ static void help(void)
 "                         export the specified block node as a\n"
 "                         vhost-user-blk device over UNIX domain socket\n"
 "  --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,\n"
-"           fd,addr.str=<fd>[,writable=on|off]\n"
+"           addr.type=fd,addr.str=<fd>[,writable=on|off]\n"
 "           [,logical-block-size=<block-size>][,num-queues=<num-queues>]\n"
 "                         export the specified block node as a\n"
 "                         vhost-user-blk device over file descriptor\n"
-- 
2.31.1


