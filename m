Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF9B30B0AD
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 20:46:05 +0100 (CET)
Received: from localhost ([::1]:46754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6f9A-0003rd-Ed
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 14:46:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6f1d-0003H7-Py
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:38:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6f1a-0005iI-V2
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:38:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612208294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SaCcIhMlHVElTZeN1unpYppAZKErXSyyzn9Tc9BOmis=;
 b=DZqY8udnvd89kJk1zL1OiQHdUUiyw2rkiHzo4ZQ/Zh097GU9lIQW9TApvUf9Dr3U5nikrZ
 VzBn8DyJtfKr6IXFQoFeQDkW2VadZyvsAaNzTP5D6Vs+yk9jxn7MD8xjcvPQP1V0He9MUJ
 Ssowm6JOyXqBbxZG+xMJyF2otXCx6uQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-8L9dzP6NMrS412depCcaaQ-1; Mon, 01 Feb 2021 14:38:12 -0500
X-MC-Unique: 8L9dzP6NMrS412depCcaaQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA1448015DE;
 Mon,  1 Feb 2021 19:38:11 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6048F60C05;
 Mon,  1 Feb 2021 19:38:07 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/16] qapi: use explicitly internal module names
Date: Mon,  1 Feb 2021 14:37:38 -0500
Message-Id: <20210201193747.2169670-8-jsnow@redhat.com>
In-Reply-To: <20210201193747.2169670-1-jsnow@redhat.com>
References: <20210201193747.2169670-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use ./emit and ./init explicitly instead of "emit" and "init" and adding
the prefix based on the specific method called, which later allows us to
coalesce the two different methods into one.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/commands.py | 2 +-
 scripts/qapi/events.py   | 2 +-
 scripts/qapi/gen.py      | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 71744f48a35..fc5fe27c472 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -286,7 +286,7 @@ def _begin_user_module(self, name: str) -> None:
                              types=types))
 
     def visit_end(self) -> None:
-        self._add_system_module('init', ' * QAPI Commands initialization')
+        self._add_system_module('./init', ' * QAPI Commands initialization')
         self._genh.add(mcgen('''
 #include "qapi/qmp/dispatch.h"
 
diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
index 9851653b9d1..26faa829898 100644
--- a/scripts/qapi/events.py
+++ b/scripts/qapi/events.py
@@ -191,7 +191,7 @@ def _begin_user_module(self, name: str) -> None:
                              types=types))
 
     def visit_end(self) -> None:
-        self._add_system_module('emit', ' * QAPI Events emission')
+        self._add_system_module('./emit', ' * QAPI Events emission')
         self._genc.preamble_add(mcgen('''
 #include "qemu/osdep.h"
 #include "%(prefix)sqapi-emit-events.h"
diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index aaed78eed5e..da9d4d2d373 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -285,7 +285,8 @@ def _add_user_module(self, name: str, blurb: str) -> None:
         self._add_module(name, blurb)
 
     def _add_system_module(self, name: Optional[str], blurb: str) -> None:
-        self._add_module(name and './' + name, blurb)
+        assert QAPISchemaModule.is_system_module(name)
+        self._add_module(name, blurb)
 
     def write(self, output_dir: str, opt_builtins: bool = False) -> None:
         for name in self._module:
-- 
2.29.2


