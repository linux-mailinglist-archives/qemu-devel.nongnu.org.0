Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702753192FA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 20:21:38 +0100 (CET)
Received: from localhost ([::1]:50288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAHWz-00047j-H3
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 14:21:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAHBk-0003iL-3P
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:59:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAHBc-0005Md-0O
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:59:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613069970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FhksO3g0oaWQerTlvwn5k8hAFZIhrr4ONIFnFxOv7Xs=;
 b=AzIZ63e/JfB44GglqrHaZf1CZOkT7hOMTWd/7iQa9Y8oRfZYIYTNK9eMWlP4ajt95Hjl45
 bQDeLHV9IDFSmL8X2OYhOj5yCbSuMJS/t+UfePwp6F33tp+J9ajNhu+FlrX3DDfiu8U5eA
 unH11m8TaVzUetiFjYUOsOZd71TQoU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-3JqF56PrPgubn8pTI6KjWQ-1; Thu, 11 Feb 2021 13:59:28 -0500
X-MC-Unique: 3JqF56PrPgubn8pTI6KjWQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B61E1100CCC1;
 Thu, 11 Feb 2021 18:59:27 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E72FF7A8FB;
 Thu, 11 Feb 2021 18:59:20 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/24] python/console_socket: avoid one-letter variable
Date: Thu, 11 Feb 2021 13:58:33 -0500
Message-Id: <20210211185856.3975616-2-jsnow@redhat.com>
In-Reply-To: <20210211185856.3975616-1-jsnow@redhat.com>
References: <20210211185856.3975616-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes pylint warnings.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/console_socket.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/python/qemu/console_socket.py b/python/qemu/console_socket.py
index ac21130e446..87237bebef7 100644
--- a/python/qemu/console_socket.py
+++ b/python/qemu/console_socket.py
@@ -46,11 +46,11 @@ def __init__(self, address: str, file: Optional[str] = None,
             self._drain_thread = self._thread_start()
 
     def __repr__(self) -> str:
-        s = super().__repr__()
-        s = s.rstrip(">")
-        s = "%s,  logfile=%s, drain_thread=%s>" % (s, self._logfile,
-                                                   self._drain_thread)
-        return s
+        tmp = super().__repr__()
+        tmp = tmp.rstrip(">")
+        tmp = "%s,  logfile=%s, drain_thread=%s>" % (tmp, self._logfile,
+                                                     self._drain_thread)
+        return tmp
 
     def _drain_fn(self) -> None:
         """Drains the socket and runs while the socket is open."""
-- 
2.29.2


