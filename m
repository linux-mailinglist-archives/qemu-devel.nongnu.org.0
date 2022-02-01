Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A144A6204
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 18:13:21 +0100 (CET)
Received: from localhost ([::1]:37304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEwiW-0003FQ-Lg
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 12:13:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEuyC-0002UL-6o
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:21:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEuy8-0003t2-No
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:21:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643728879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vjUNEhEwN40m0Lfq0YWosCuasUbTrJfBVfxhG7PqJ3M=;
 b=DQtaRE9OBmPtJeri29mLBhMnzAA056nzxcrKp9IKAhoBvX6sf0woTOScHUNdup51g/4gM0
 1WBZgLO5ICsRqTJwYMh/ymoUzH2jIujMYy1SzD+mjd0g3TEFO/hO70/zbVsjedrRwWCJ2r
 gDc8kaNlHPaFFWyaeHJIGble7bv17XE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-BAoXjksjNjiayzFl0N3MPQ-1; Tue, 01 Feb 2022 10:21:18 -0500
X-MC-Unique: BAoXjksjNjiayzFl0N3MPQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23D6684DA43;
 Tue,  1 Feb 2022 15:21:17 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2056774E98;
 Tue,  1 Feb 2022 15:21:15 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 01/10] qemu-storage-daemon: Fix typo in vhost-user-blk help
Date: Tue,  1 Feb 2022 16:20:59 +0100
Message-Id: <20220201152108.171898-2-kwolf@redhat.com>
In-Reply-To: <20220201152108.171898-1-kwolf@redhat.com>
References: <20220201152108.171898-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The syntax of the fd passing case misses the "addr.type=" key. Add it.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20220125151514.49035-1-kwolf@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
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


