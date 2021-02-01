Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B72430AC88
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 17:24:46 +0100 (CET)
Received: from localhost ([::1]:35260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6c0L-0001UU-10
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 11:24:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l6brR-0003iv-Kh
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:15:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l6br7-0003Mr-V1
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:15:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612196111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ytDjdpmBImCbd01djVUeTFcpVxJ73yZSgduuGPqSE9o=;
 b=MyH04B7y8xV7ljaKlf/Tt7Aky0xzkVW3i7RiH00lGNsnuB+mUxd1yWhjE5Q/bODiejue9Z
 ISM9SYV8JV5d12mUiMDtj7nsasMYEZjL5suhvcUZ1odAj8TPz2OqfPUHVX6HhMkNWtYg9j
 4y5rfxppwOdh1enLugirIpT/VoXdsM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-86GmM3ivNqiaF8FdYCVULw-1; Mon, 01 Feb 2021 11:15:09 -0500
X-MC-Unique: 86GmM3ivNqiaF8FdYCVULw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C4508030A7
 for <qemu-devel@nongnu.org>; Mon,  1 Feb 2021 16:15:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CBE7F5D756;
 Mon,  1 Feb 2021 16:15:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 433EC113861E; Mon,  1 Feb 2021 17:15:04 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] qmp: Fix up comments after commit 9ce44e2ce2
Date: Mon,  1 Feb 2021 17:15:02 +0100
Message-Id: <20210201161504.1976989-2-armbru@redhat.com>
In-Reply-To: <20210201161504.1976989-1-armbru@redhat.com>
References: <20210201161504.1976989-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, jsnow@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 9ce44e2ce2 "qmp: Move dispatcher to a coroutine" replaced
monitor_qmp_bh_dispatcher() by monitor_qmp_dispatcher_co(), but
neglected to update comments.  Do that now.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 monitor/qmp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/monitor/qmp.c b/monitor/qmp.c
index 8f91af32be..f6a1e7783b 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -79,7 +79,7 @@ static void monitor_qmp_cleanup_queue_and_resume(MonitorQMP *mon)
     qemu_mutex_lock(&mon->qmp_queue_lock);
 
     /*
-     * Same condition as in monitor_qmp_bh_dispatcher(), but before
+     * Same condition as in monitor_qmp_dispatcher_co(), but before
      * removing an element from the queue (hence no `- 1`).
      * Also, the queue should not be empty either, otherwise the
      * monitor hasn't been suspended yet (or was already resumed).
@@ -349,7 +349,7 @@ static void handle_qmp_command(void *opaque, QObject *req, Error *err)
 
     /*
      * Suspend the monitor when we can't queue more requests after
-     * this one.  Dequeuing in monitor_qmp_bh_dispatcher() or
+     * this one.  Dequeuing in monitor_qmp_dispatcher_co() or
      * monitor_qmp_cleanup_queue_and_resume() will resume it.
      * Note that when OOB is disabled, we queue at most one command,
      * for backward compatibility.
-- 
2.26.2


