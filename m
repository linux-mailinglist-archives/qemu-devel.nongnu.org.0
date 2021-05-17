Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FC4383D42
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:27:02 +0200 (CEST)
Received: from localhost ([::1]:60264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liitJ-00025q-Pj
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1liiHs-0000zT-63
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:48:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1liiHq-0006tj-BM
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:48:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621277297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lBD4hUv3uFfBx2PnKVfChaLnqq3xzk/SIyEr89wp+sQ=;
 b=gP8V52HhFZXmgCzt8xRiDhGdBUcGKfu1HL2fk0R/JSbC3sK+DLfWPpuSbTUbBpOqbwFN/1
 Kz5C79cyNSsgayFUR3CTk4PNku26wTWFYmTCDh1O8KGTsEvJ4z+CCYMLG/y1E1qYDLoGLX
 584eSYp4/19qQxYV36UTHmgmhh6F8gI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-Zr1lgAAHN1KmsIGlRbgBLw-1; Mon, 17 May 2021 14:48:15 -0400
X-MC-Unique: Zr1lgAAHN1KmsIGlRbgBLw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24AA88186E8
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 18:48:14 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37BD619C46;
 Mon, 17 May 2021 18:48:13 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/6] python/console_socket: avoid one-letter variable
Date: Mon, 17 May 2021 14:48:03 -0400
Message-Id: <20210517184808.3562549-2-jsnow@redhat.com>
In-Reply-To: <20210517184808.3562549-1-jsnow@redhat.com>
References: <20210517184808.3562549-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes pylint warnings.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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
2.30.2


