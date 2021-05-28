Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BDC393B89
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 04:45:01 +0200 (CEST)
Received: from localhost ([::1]:32854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmSUe-0005fk-PL
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 22:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSJr-0001f4-SK
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:33:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSJn-0008MK-ER
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:33:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622169225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p7e3ZsGywUcSfa97Rdz5bdgpkU3OcifnEbtnBx8Mtko=;
 b=YeKO28nzwNrqQZUUC2T5KQ5ataTl4uhXv8k5D9/r6UdJr1Ppzf4DvW0jHF9Wvq9of/EMqR
 gNM6En99bam/OXUYLhNRdTiQWUPDE76y4D9TRFrl3Aeyi2SxpMsnApIg9HcWgCAH6UDlt3
 u3u3QUaRplzdMBk5DGHrdWykWxePUp8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-OP1p-S4FPyCVJAyeeIqwew-1; Thu, 27 May 2021 22:33:43 -0400
X-MC-Unique: OP1p-S4FPyCVJAyeeIqwew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79659801B15;
 Fri, 28 May 2021 02:33:42 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4103B1F0C0;
 Fri, 28 May 2021 02:33:40 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/44] python/console_socket: avoid one-letter variable
Date: Thu, 27 May 2021 22:31:50 -0400
Message-Id: <20210528023220.417057-15-jsnow@redhat.com>
In-Reply-To: <20210528023220.417057-1-jsnow@redhat.com>
References: <20210528023220.417057-1-jsnow@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes pylint warnings.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210527211715.394144-2-jsnow@redhat.com
Message-id: 20210517184808.3562549-2-jsnow@redhat.com
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
2.31.1


