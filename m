Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8384047647D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 22:23:09 +0100 (CET)
Received: from localhost ([::1]:36534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxbjw-0002Is-Jq
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 16:23:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbXR-000520-L1
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:10:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbXQ-0006lu-6Z
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:10:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639602611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BtMdI8HuXS9TZz2TChs6gbI0FWOZlZejy3yCoiFuRaw=;
 b=fo3uMbiRhs4OgbGZ0luqv6YlkOkQ6jY5bWJfyiBZ4u+0q0Dlm766QIwKWjYCeQ2C0QvJCE
 PRi2Hyg5f0L9LBv9jennEJv7LTCu9EFD8C6TbTVFfUvjdX6N6hA+M/FtNvHsuNDLZtGi9E
 LnUhqzpZ3C5EoHzJzJhFN4fAnEl15BQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-GHmYVr3QMW6vCsBiV4pnkw-1; Wed, 15 Dec 2021 16:10:03 -0500
X-MC-Unique: GHmYVr3QMW6vCsBiV4pnkw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FD8B93923;
 Wed, 15 Dec 2021 21:10:02 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 908EE47361;
 Wed, 15 Dec 2021 21:10:01 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC qemu.qmp PATCH 21/24] Fix doc cross-reference regressions
Date: Wed, 15 Dec 2021 16:06:31 -0500
Message-Id: <20211215210634.3779791-22-jsnow@redhat.com>
In-Reply-To: <20211215210634.3779791-1-jsnow@redhat.com>
References: <20211215210634.3779791-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Before enabling docs building as a CI step, lingering cross-reference
failures need to be addressed.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 qemu/qmp/legacy.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu/qmp/legacy.py b/qemu/qmp/legacy.py
index 6c250cd..8e976f9 100644
--- a/qemu/qmp/legacy.py
+++ b/qemu/qmp/legacy.py
@@ -71,7 +71,7 @@ class QEMUMonitorProtocol:
     :param nickname: Optional nickname used for logging.
 
     ..note::
-        No connection is established during `__init__`, this is done by
+        No connection is established during ``__init__``, this is done by
         the `connect()` or `accept()` methods.
     """
 
@@ -287,7 +287,7 @@ class QEMUMonitorProtocol:
         Set the timeout for QMP RPC execution.
 
         This timeout affects the `cmd`, `cmd_obj`, and `command` methods.
-        The `accept`, `pull_event` and `get_event` methods have their
+        The `accept`, `pull_event` and `get_events` methods have their
         own configurable timeouts.
 
         :param timeout:
-- 
2.31.1


