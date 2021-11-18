Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7850456473
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 21:49:02 +0100 (CET)
Received: from localhost ([::1]:47390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnoL8-0004i5-1k
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 15:49:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mnoIh-0001oH-F0
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 15:46:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mnoIc-0000Lj-Rq
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 15:46:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637268385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bdUu5CfzqntHpvXBavXpjt94i2KgQd7VPm1c0E1JaMU=;
 b=diWnL2biaqu1SaJfkItdCTf/GsYz+HPX/XKU5eLRv1s89A5fwJd0Q3caNxbWuGVzRJH3N0
 Wnc0FLIAEzju64AuDgrmDKUg++KZDzqEu81IyuvUSTelT8OZka10Fi77rF/0TBIg2w2VFO
 pH1geuqBTVt9vjYA94sR3UFVC2i7jPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-B3XbFxYTNI-2-vEKVJbl7w-1; Thu, 18 Nov 2021 15:46:24 -0500
X-MC-Unique: B3XbFxYTNI-2-vEKVJbl7w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC94D15720
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 20:46:23 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.18.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4262867842;
 Thu, 18 Nov 2021 20:46:23 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] python/machine: remove _remove_monitor_sockfile property
Date: Thu, 18 Nov 2021 15:46:15 -0500
Message-Id: <20211118204620.1897674-3-jsnow@redhat.com>
In-Reply-To: <20211118204620.1897674-1-jsnow@redhat.com>
References: <20211118204620.1897674-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It doesn't matter if it was the user or the class itself that specified
where the sockfile should be created; the fact is that if we are using a
sockfile here, we created it and we can clean it up.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index b1dd77b538..ea9e07805d 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -141,12 +141,10 @@ def __init__(self,
 
         if monitor_address is not None:
             self._monitor_address = monitor_address
-            self._remove_monitor_sockfile = False
         else:
             self._monitor_address = os.path.join(
                 self.sock_dir, f"{self._name}-monitor.sock"
             )
-            self._remove_monitor_sockfile = True
 
         self._console_log_path = console_log
         if self._console_log_path:
@@ -315,8 +313,7 @@ def _pre_launch(self) -> None:
             self._remove_files.append(self._console_address)
 
         if self._qmp_set:
-            if self._remove_monitor_sockfile:
-                assert isinstance(self._monitor_address, str)
+            if isinstance(self._monitor_address, str):
                 self._remove_files.append(self._monitor_address)
             self._qmp_connection = QEMUMonitorProtocol(
                 self._monitor_address,
-- 
2.31.1


