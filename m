Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD9C48A3FC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 00:51:24 +0100 (CET)
Received: from localhost ([::1]:37494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n74Rf-0004lX-Ir
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 18:51:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n749m-00060A-1h
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:32:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n749k-0000Q4-36
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:32:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641857570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t5l4tg2t/K05Hr3lka1OpH095sVCTfVTEl5F5DN+1LI=;
 b=Ny19NHI1mr3CtGzGQCPQP8aHYKQaywRLJVSLRkv1Qz6Cg1MRhGrQfEemoL7e+m2m4XNEi+
 mDdP1cu4YK+CIHKHqmwJsrtYJaKfV8AdwC56wHJMKCZ14p4+q9KBfRaAer4Qb3RERLoS/S
 DzPw7jJnUBxMaJqk2H5/6kWhmi5E9ZQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-2h7Z4SVcNoiAHQGeWigzAw-1; Mon, 10 Jan 2022 18:32:47 -0500
X-MC-Unique: 2h7Z4SVcNoiAHQGeWigzAw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B06A100F942;
 Mon, 10 Jan 2022 23:32:46 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1BE77B031;
 Mon, 10 Jan 2022 23:32:44 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 31/31] python: rename 'aqmp-tui' to 'qmp-tui'
Date: Mon, 10 Jan 2022 18:29:10 -0500
Message-Id: <20220110232910.1923864-32-jsnow@redhat.com>
In-Reply-To: <20220110232910.1923864-1-jsnow@redhat.com>
References: <20220110232910.1923864-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the last vestige of the "aqmp" moniker surviving in the tree; remove it.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/qmp/{aqmp_tui.py => qmp_tui.py} | 12 ++++++------
 python/setup.cfg                            |  6 +++---
 2 files changed, 9 insertions(+), 9 deletions(-)
 rename python/qemu/qmp/{aqmp_tui.py => qmp_tui.py} (98%)

diff --git a/python/qemu/qmp/aqmp_tui.py b/python/qemu/qmp/qmp_tui.py
similarity index 98%
rename from python/qemu/qmp/aqmp_tui.py
rename to python/qemu/qmp/qmp_tui.py
index 184a3e4690..17dc94e7c3 100644
--- a/python/qemu/qmp/aqmp_tui.py
+++ b/python/qemu/qmp/qmp_tui.py
@@ -6,13 +6,13 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
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
index 911ae02de7..4614521dea 100644
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
@@ -67,7 +67,7 @@ console_scripts =
     qom-fuse = qemu.utils.qom_fuse:QOMFuse.entry_point [fuse]
     qemu-ga-client = qemu.utils.qemu_ga_client:main
     qmp-shell = qemu.qmp.qmp_shell:main
-    aqmp-tui = qemu.qmp.aqmp_tui:main [tui]
+    qmp-tui = qemu.qmp.qmp_tui:main [tui]
 
 [flake8]
 extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
@@ -83,7 +83,7 @@ namespace_packages = True
 # fusepy has no type stubs:
 allow_subclassing_any = True
 
-[mypy-qemu.qmp.aqmp_tui]
+[mypy-qemu.qmp.qmp_tui]
 # urwid and urwid_readline have no type stubs:
 allow_subclassing_any = True
 
-- 
2.31.1


