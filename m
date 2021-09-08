Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B2F40338C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 06:57:27 +0200 (CEST)
Received: from localhost ([::1]:45186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNpeI-0001WZ-1K
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 00:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNpbc-0007CU-Gy
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 00:54:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNpbZ-0003mi-Jr
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 00:54:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631076875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EMGURndCw+evKuhXByRYvX/sDzPGAXD9ztdMsYVEBbY=;
 b=I3JM98CP0uthNyhBfsww1qiGiacrvApI7RGR9FXWRv3+exvdkH+ggNxbaCS5g83UWjC+S8
 J9dTC3sODASO42xov29PRY3KlY1g+56fuJfmdz7kzY7Ns0sFio6MMrGZ4Ex0f4/m0eh6mb
 15cZOL3zN+eDXN6FSkxbenJKJrNpuRg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-PwmppVlmNtiL0miO8pqpLA-1; Wed, 08 Sep 2021 00:54:34 -0400
X-MC-Unique: PwmppVlmNtiL0miO8pqpLA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58A4884A5E0;
 Wed,  8 Sep 2021 04:54:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F145100238C;
 Wed,  8 Sep 2021 04:54:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D5F6A1138220; Wed,  8 Sep 2021 06:54:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] qapi: Bury some unused code in class Indentation
Date: Wed,  8 Sep 2021 06:54:26 +0200
Message-Id: <20210908045428.2689093-4-armbru@redhat.com>
In-Reply-To: <20210908045428.2689093-1-armbru@redhat.com>
References: <20210908045428.2689093-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: marcandre.lureau@redhat.com, jsnow@redhat.com, michael.roth@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

.__int__() has never been used.  Drop it.

.decrease() raises ArithmeticError when asked to decrease indentation
level below zero.  Nothing catches it.  It's a programming error.
Dumb down to assert.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/common.py | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 1d62c27fb7..489273574a 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -132,9 +132,6 @@ class Indentation:
     def __init__(self, initial: int = 0) -> None:
         self._level = initial
 
-    def __int__(self) -> int:
-        return self._level
-
     def __repr__(self) -> str:
         return "{}({:d})".format(type(self).__name__, self._level)
 
@@ -148,9 +145,7 @@ def increase(self, amount: int = 4) -> None:
 
     def decrease(self, amount: int = 4) -> None:
         """Decrease the indentation level by ``amount``, default 4."""
-        if self._level < amount:
-            raise ArithmeticError(
-                f"Can't remove {amount:d} spaces from {self!r}")
+        assert amount <= self._level
         self._level -= amount
 
 
-- 
2.31.1


