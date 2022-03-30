Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E7F4ECAB4
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 19:32:46 +0200 (CEST)
Received: from localhost ([::1]:35570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZcBZ-0005PD-O2
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 13:32:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZc7U-00061P-T4
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 13:28:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZc7S-0003Lo-So
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 13:28:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648661310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wIedATEMbLm8tOZpNi+wLoXYeYnw8oOQd+pHDx0T0lY=;
 b=K2pSHY+QitP0I0jvIx/k7p7s8Y+LAGlBTcB4UNPLv/8/YyEsC7DDmvvL7D3M1oduvCPWI5
 F9EHcl7J+oqJSs+qnsCTgj0qJ5FvabU9CgMBjz8iDehEneQxguHEK3iciIYlEU+gQOIkmb
 ziuBAAsvKJyPnF6aYzlDYkP/jXOwRqs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381--GMWzKeCP9Ct4D3MucWIkg-1; Wed, 30 Mar 2022 13:28:28 -0400
X-MC-Unique: -GMWzKeCP9Ct4D3MucWIkg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C4C083395F;
 Wed, 30 Mar 2022 17:28:28 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.35.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0220D40CFD02;
 Wed, 30 Mar 2022 17:28:27 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/9] python: rename 'aqmp-tui' to 'qmp-tui'
Date: Wed, 30 Mar 2022 13:28:11 -0400
Message-Id: <20220330172812.3427355-9-jsnow@redhat.com>
In-Reply-To: <20220330172812.3427355-1-jsnow@redhat.com>
References: <20220330172812.3427355-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the last vestige of the "aqmp" moniker surviving in the tree; remove it.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
---
 python/qemu/qmp/{aqmp_tui.py => qmp_tui.py} | 12 ++++++------
 python/setup.cfg                            |  6 +++---
 2 files changed, 9 insertions(+), 9 deletions(-)
 rename python/qemu/qmp/{aqmp_tui.py => qmp_tui.py} (98%)

diff --git a/python/qemu/qmp/aqmp_tui.py b/python/qemu/qmp/qmp_tui.py
similarity index 98%
rename from python/qemu/qmp/aqmp_tui.py
rename to python/qemu/qmp/qmp_tui.py
index 59d3036be38..ce239d8979b 100644
--- a/python/qemu/qmp/aqmp_tui.py
+++ b/python/qemu/qmp/qmp_tui.py
@@ -6,13 +6,13 @@
 # This work is licensed under the terms of the GNU LGPL, version 2 or
 # later.  See the COPYING file in the top-level directory.
 """
-AQMP TUI
+QMP TUI
 
-AQMP TUI is an asynchronous interface built on top the of the AQMP library.
+QMP TUI is an asynchronous interface built on top the of the QMP library.
 It is the successor of QMP-shell and is bought-in as a replacement for it.
 
-Example Usage: aqmp-tui <SOCKET | TCP IP:PORT>
-Full Usage: aqmp-tui --help
+Example Usage: qmp-tui <SOCKET | TCP IP:PORT>
+Full Usage: qmp-tui --help
 """
 
 import argparse
@@ -129,7 +129,7 @@ def has_handler_type(logger: logging.Logger,
 
 class App(QMPClient):
     """
-    Implements the AQMP TUI.
+    Implements the QMP TUI.
 
     Initializes the widgets and starts the urwid event loop.
 
@@ -612,7 +612,7 @@ def main() -> None:
     Driver of the whole script, parses arguments, initialize the TUI and
     the logger.
     """
-    parser = argparse.ArgumentParser(description='AQMP TUI')
+    parser = argparse.ArgumentParser(description='QMP TUI')
     parser.add_argument('qmp_server', help='Address of the QMP server. '
                         'Format <UNIX socket path | TCP addr:port>')
     parser.add_argument('--num-retries', type=int, default=10,
diff --git a/python/setup.cfg b/python/setup.cfg
index 773e51b34e7..e877ea56475 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -51,7 +51,7 @@ devel =
 fuse =
     fusepy >= 2.0.4
 
-# AQMP TUI dependencies
+# QMP TUI dependencies
 tui =
     urwid >= 2.1.2
     urwid-readline >= 0.13
@@ -68,7 +68,7 @@ console_scripts =
     qemu-ga-client = qemu.utils.qemu_ga_client:main
     qmp-shell = qemu.qmp.qmp_shell:main
     qmp-shell-wrap = qemu.qmp.qmp_shell:main_wrap
-    aqmp-tui = qemu.qmp.aqmp_tui:main [tui]
+    qmp-tui = qemu.qmp.qmp_tui:main [tui]
 
 [flake8]
 extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
@@ -84,7 +84,7 @@ namespace_packages = True
 # fusepy has no type stubs:
 allow_subclassing_any = True
 
-[mypy-qemu.qmp.aqmp_tui]
+[mypy-qemu.qmp.qmp_tui]
 # urwid and urwid_readline have no type stubs:
 allow_subclassing_any = True
 
-- 
2.34.1


