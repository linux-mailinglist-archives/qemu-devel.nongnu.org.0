Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6163FDF4D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:03:09 +0200 (CEST)
Received: from localhost ([::1]:48082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLShg-0004tS-Gw
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLS02-0006bS-HM
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:18:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLS01-0004LO-1C
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:18:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630509480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ppq+QSYAlsWtGcVREKWkFatbEiFq9gyIv6KuAJXoB0U=;
 b=bO4yGgoMPBfblQ/RBirp1MEV2lu80qkgXFoIf1ztkI2Cu+i+PE4E+ku9eps+hKNndNwRop
 S8TLvvt02sM4w8BvvwxKyJaIe8BEDdMKreZtAMVXaXZ3KXYPbscegiiRMteAIYxYpERY1/
 vd2XbrxqEWoxHTf7/FRkynVHGwVgO/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-pIUH_VsyMNiLtC9g5d67Fw-1; Wed, 01 Sep 2021 11:17:59 -0400
X-MC-Unique: pIUH_VsyMNiLtC9g5d67Fw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30E9E107ACCA;
 Wed,  1 Sep 2021 15:17:58 +0000 (UTC)
Received: from localhost (unknown [10.39.193.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CBB2740AC;
 Wed,  1 Sep 2021 15:17:57 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 45/56] python:QEMUMachine: template typing for self returning
 methods
Date: Wed,  1 Sep 2021 17:16:08 +0200
Message-Id: <20210901151619.689075-46-hreitz@redhat.com>
In-Reply-To: <20210901151619.689075-1-hreitz@redhat.com>
References: <20210901151619.689075-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

mypy thinks that return value of these methods in subclusses is
QEMUMachine, which is wrong. So, make typing smarter.

Suggested-by: John Snow <jsnow@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210824083856.17408-26-vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 python/qemu/machine/machine.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 6ec18570d9..a7081b1845 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -36,6 +36,7 @@
     Sequence,
     Tuple,
     Type,
+    TypeVar,
 )
 
 from qemu.qmp import (  # pylint: disable=import-error
@@ -73,6 +74,9 @@ class AbnormalShutdown(QEMUMachineError):
     """
 
 
+_T = TypeVar('_T', bound='QEMUMachine')
+
+
 class QEMUMachine:
     """
     A QEMU VM.
@@ -169,7 +173,7 @@ def __init__(self,
         self._remove_files: List[str] = []
         self._user_killed = False
 
-    def __enter__(self) -> 'QEMUMachine':
+    def __enter__(self: _T) -> _T:
         return self
 
     def __exit__(self,
@@ -185,8 +189,8 @@ def add_monitor_null(self) -> None:
         self._args.append('-monitor')
         self._args.append('null')
 
-    def add_fd(self, fd: int, fdset: int,
-               opaque: str, opts: str = '') -> 'QEMUMachine':
+    def add_fd(self: _T, fd: int, fdset: int,
+               opaque: str, opts: str = '') -> _T:
         """
         Pass a file descriptor to the VM
         """
-- 
2.31.1


