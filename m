Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D743F3C36
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 21:06:38 +0200 (CEST)
Received: from localhost ([::1]:53614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHWKC-0004kE-Kd
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 15:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mHWIi-0003Kq-87
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 15:05:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mHWIf-0001TM-12
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 15:05:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629572699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lh3prZx6bYeEJxzx+e8m4FlRwm7PtVav/OgR6iCsN3Y=;
 b=XV8fhSmwm3KE2LTCgDKknHzeTzAp02Qg13AGUn71KcH355JDmy18V1KpWVPXBSMG5E3o1K
 ciM5ZPxtyEHoLQbY0sCnqL8C4Wp+C8I2gDH6cELjad2cLJsv9wDMMBfgazOH3r5Vyq6trz
 ypmeCh+PAwGun4YLj01pxcwUyqHMV4U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-NnAUv3dTMI6AzZRIsufCqQ-1; Sat, 21 Aug 2021 15:04:57 -0400
X-MC-Unique: NnAUv3dTMI6AzZRIsufCqQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC00F8042F4;
 Sat, 21 Aug 2021 19:04:56 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6E6717010;
 Sat, 21 Aug 2021 19:04:55 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] python: Update for pylint 2.10
Date: Sat, 21 Aug 2021 15:04:51 -0400
Message-Id: <20210821190451.3039867-2-jsnow@redhat.com>
In-Reply-To: <20210821190451.3039867-1-jsnow@redhat.com>
References: <20210821190451.3039867-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>, G S Niteesh Babu <niteesh.gs@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A few new annoyances. Of note is the new warning for an unspecified
encoding when opening a text file, which actually does indicate a
potentially real problem; see
https://www.python.org/dev/peps/pep-0597/#motivation

I was under the impression that open would try to figure out the
encoding of a file for you -- apparently this is completely false. It
uses the platform's preferred encoding, whatever that may be.

What we ought to use here, I believe, is sys.stderr.encoding.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 6 ++++--
 python/setup.cfg               | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 971ed7e8c6..1f47fc5a2b 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -25,6 +25,7 @@
 import signal
 import socket
 import subprocess
+import sys
 import tempfile
 from types import TracebackType
 from typing import (
@@ -284,7 +285,8 @@ def get_pid(self) -> Optional[int]:
 
     def _load_io_log(self) -> None:
         if self._qemu_log_path is not None:
-            with open(self._qemu_log_path, "r") as iolog:
+            with open(self._qemu_log_path, "r",
+                      encoding=sys.stdout.encoding) as iolog:
                 self._iolog = iolog.read()
 
     @property
@@ -565,7 +567,7 @@ def _qmp(self) -> QEMUMonitorProtocol:
 
     @classmethod
     def _qmp_args(cls, _conv_keys: bool = True, **args: Any) -> Dict[str, Any]:
-        qmp_args = dict()
+        qmp_args = {}
         for key, value in args.items():
             if _conv_keys:
                 qmp_args[key.replace('_', '-')] = value
diff --git a/python/setup.cfg b/python/setup.cfg
index 14bab90288..f220419755 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -104,6 +104,7 @@ good-names=i,
 [pylint.similarities]
 # Ignore imports when computing similarities.
 ignore-imports=yes
+ignore-signatures=yes
 
 [isort]
 force_grid_wrap=4
-- 
2.31.1


