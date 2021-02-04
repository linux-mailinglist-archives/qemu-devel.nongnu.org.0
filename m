Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4964030F4A3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 15:12:00 +0100 (CET)
Received: from localhost ([::1]:58442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7fMV-00080z-AU
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 09:11:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7fCf-0003j1-7H
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:01:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7fCZ-00006g-HM
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:01:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612447302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=76RWcd1K3oKVR8NnoWJu5TCiHHFpW8Dns/BvI3/KPIg=;
 b=BAUoq4xel3ajH/JFX9jRDPbs2TxIVnfNDnnYIl23XF32J+FOgJggcITT1ZT4DUT0k0glh9
 0KVtnMCy7X2G8OQpH58FCyCzz80NxEqHr3oC1LzeLgfC4lBLnhenHGspMnriTDn65ZRtOa
 RaVBftiwiULCU3UYMZYOJfQn+g3cxqA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-LYgP60GkNtCfJshF51cuPg-1; Thu, 04 Feb 2021 09:01:40 -0500
X-MC-Unique: LYgP60GkNtCfJshF51cuPg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D81A6801966;
 Thu,  4 Feb 2021 14:01:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A87B85D9C9;
 Thu,  4 Feb 2021 14:01:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7F1C11132D67; Thu,  4 Feb 2021 15:01:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/9] qmp: Fix up comments after commit 9ce44e2ce2
Date: Thu,  4 Feb 2021 15:01:34 +0100
Message-Id: <20210204140136.2769065-8-armbru@redhat.com>
In-Reply-To: <20210204140136.2769065-1-armbru@redhat.com>
References: <20210204140136.2769065-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 9ce44e2ce2 "qmp: Move dispatcher to a coroutine" replaced
monitor_qmp_bh_dispatcher() by monitor_qmp_dispatcher_co(), but
neglected to update comments.  Do that now.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210201161504.1976989-2-armbru@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
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


