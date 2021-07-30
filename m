Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4E93DBF8E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 22:21:15 +0200 (CEST)
Received: from localhost ([::1]:58466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Z0M-0007j6-Lv
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 16:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m9YyY-0004tK-9W
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:19:22 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:34674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m9YyW-0000wx-7k
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:19:22 -0400
Received: by mail-pl1-x62a.google.com with SMTP id d1so12459432pll.1
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 13:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FHZOs2ShdJMMVObpalGIARKR5uUDpYP03WxnR2dRxps=;
 b=gd/GJrrr35IiKS7tXeWmFxVWGeK+1zgNBct1FyEZaccxk58paXn3bjsbEkLukj38sN
 CjsCGlkxAiSQutbbe8ZLVH+0oRaDLBTT8Sm2A0oF/zpiw9iC1z65Wse1USnt/cnBLcE/
 pZ4cKHSyQ3reMdXqIEHBZA3VuK7fC2ZaRB7aisZwuf5nFeZZrSnm6SSi4E3wGJId2pI/
 t2r7iFm7VespT3yglsrZvv4X6T7k6MwRz42fNn6esJhnhsNg5T07/0OwGsdh5bZvCuc5
 r9da97LE3BhftGFljDmnKDRfTuQMhpl6KOA33CBIQzUy+Jrq7g0800BqgPROlmVoBYt7
 QjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FHZOs2ShdJMMVObpalGIARKR5uUDpYP03WxnR2dRxps=;
 b=Ls8qldjvDW/gFwH66MLp3MDKuhys02BRqhXRinAr6WhxZYkPjRyEbI2zN3jCkTNgds
 74y50MwHGC/cKBeRgYxd9Pu0LgwnFg/xgx/tsNEgNfdOxwhmE8//rfkawwbyc+MeAKDB
 kfaQbyzIjpFAE5Nh6Nm72t5ZiqYS1yR3eR9cvFnGMBQtovaJm9Cuk4goEmXobPjPRusl
 FG4dZiWS7QRhD0B2eWQ7T5e0t2P50VYY/FXK1VEIWuv/qEYZIq7NYyBufz5t+qF9iF93
 v8peUnFZrJX6xaOu0K8P6k6bMeYKiofK0+/wgx/wfhdllgWuzxeIKPrNGSiUc4Kx4cC6
 hxQQ==
X-Gm-Message-State: AOAM530F3eBsbGDrwZx4ikVm1Zzms3jQz7EYC6z9LDrB6igsk+A6cgZy
 N6QondOUux7z0fJglYSoCmuV7ATmqq1hUA==
X-Google-Smtp-Source: ABdhPJwAgG0sAn2VJwJhAzgS14sj4zHYcv+Nn6Lhb+vqeYCXAERrsQh8zl2Gmo5AIOp7z7zZZlxRLQ==
X-Received: by 2002:a17:90b:1d84:: with SMTP id
 pf4mr4801767pjb.166.1627676358799; 
 Fri, 30 Jul 2021 13:19:18 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.243])
 by smtp.gmail.com with ESMTPSA id s50sm3256842pfw.212.2021.07.30.13.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 13:19:18 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/13] python/aqmp-tui: Added type annotations for aqmp-tui
Date: Sat, 31 Jul 2021 01:48:39 +0530
Message-Id: <20210730201846.5147-7-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210730201846.5147-1-niteesh.gs@gmail.com>
References: <20210730201846.5147-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: ehabkost@redhat.com, kchamart@redhat.com, jsnow@redhat.com,
 armbru@redhat.com, wainersm@redhat.com,
 G S Niteesh Babu <niteesh.gs@gmail.com>, stefanha@redhat.com, crosa@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds type annotations for aqmp-tui using
the mypy library.

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
---
 python/qemu/aqmp/aqmp_tui.py | 79 ++++++++++++++++++++----------------
 python/setup.cfg             |  3 --
 2 files changed, 43 insertions(+), 39 deletions(-)

diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
index ec9eba0aa7..ab9ada793a 100644
--- a/python/qemu/aqmp/aqmp_tui.py
+++ b/python/qemu/aqmp/aqmp_tui.py
@@ -9,8 +9,15 @@
 import argparse
 import asyncio
 import logging
-from logging import Handler
+from logging import Handler, LogRecord
 import signal
+from typing import (
+    Any,
+    List,
+    Optional,
+    Tuple,
+    Union,
+)
 
 import urwid
 import urwid_readline
@@ -22,13 +29,13 @@
 from .util import create_task, pretty_traceback
 
 
-UPDATE_MSG = 'UPDATE_MSG'
+UPDATE_MSG: str = 'UPDATE_MSG'
 
 # Using root logger to enable all loggers under qemu and asyncio
 LOGGER = logging.getLogger()
 
 
-def format_json(msg):
+def format_json(msg: str) -> str:
     """
     Formats given multiline JSON message into a single line message.
     Converting into single line is more asthetically pleasing when looking
@@ -43,17 +50,17 @@ def format_json(msg):
 
 
 class App(QMPClient):
-    def __init__(self, address):
+    def __init__(self, address: Union[str, Tuple[str, int]]) -> None:
         urwid.register_signal(type(self), UPDATE_MSG)
         self.window = Window(self)
         self.address = address
-        self.aloop = None
+        self.aloop: Optional[Any] = None  # FIXME: Use more concrete type.
         super().__init__()
 
-    def add_to_history(self, msg):
+    def add_to_history(self, msg: str) -> None:
         urwid.emit_signal(self, UPDATE_MSG, msg)
 
-    def _cb_outbound(self, msg):
+    def _cb_outbound(self, msg: Message) -> Message:
         # FIXME: I think the ideal way to omit these messages during in-TUI
         # logging will be to add a filter to the logger. We can use regex to
         # filter out messages starting with 'Request:' or 'Response:' but I
@@ -67,25 +74,25 @@ def _cb_outbound(self, msg):
         self.add_to_history('<-- ' + str(msg))
         return msg
 
-    def _cb_inbound(self, msg):
+    def _cb_inbound(self, msg: Message) -> Message:
         handler = LOGGER.handlers[0]
         if not isinstance(handler, TUILogHandler):
             LOGGER.debug('Response: %s', str(msg))
         self.add_to_history('--> ' + str(msg))
         return msg
 
-    async def wait_for_events(self):
+    async def wait_for_events(self) -> None:
         async for event in self.events:
             self.handle_event(event)
 
-    async def _send_to_server(self, raw_msg):
+    async def _send_to_server(self, raw_msg: str) -> None:
         # FIXME: Format the raw_msg in history view to one line. It is not
         # pleasing to see multiple lines JSON object with an error statement.
         try:
             msg = Message(bytes(raw_msg, encoding='utf-8'))
             # Format multiline json into a single line JSON, since it is more
             # pleasing to look along with err message in TUI.
-            raw_msg = self.format_json(raw_msg)
+            raw_msg = format_json(raw_msg)
             await self._raw(msg, assign_id='id' not in msg)
         except (ValueError, TypeError) as err:
             LOGGER.info('Invalid message: %s', str(err))
@@ -102,18 +109,18 @@ def _cb_inbound(self, msg):
             LOGGER.error('Exception from _send_to_server: %s', str(err))
             raise err
 
-    def cb_send_to_server(self, msg):
+    def cb_send_to_server(self, msg: str) -> None:
         create_task(self._send_to_server(msg))
 
-    def unhandled_input(self, key):
+    def unhandled_input(self, key: str) -> None:
         if key == 'esc':
             self.kill_app()
 
-    def kill_app(self):
+    def kill_app(self) -> None:
         # TODO: Work on the disconnect logic
         create_task(self._kill_app())
 
-    async def _kill_app(self):
+    async def _kill_app(self) -> None:
         # It is ok to call disconnect even in disconnect state
         try:
             await self.disconnect()
@@ -124,7 +131,7 @@ def kill_app(self):
             raise err
         raise urwid.ExitMainLoop()
 
-    def handle_event(self, event):
+    def handle_event(self, event: Message) -> None:
         # FIXME: Consider all states present in qapi/run-state.json
         if event['event'] == 'SHUTDOWN':
             self._set_status('Server shutdown')
@@ -139,7 +146,7 @@ def _get_formatted_address(self) -> str:
             addr = f'{host}:{port}'
         return addr
 
-    async def connect_server(self):
+    async def connect_server(self) -> None:
         try:
             await self.connect(self.address)
             addr = self._get_formatted_address()
@@ -148,7 +155,7 @@ def _get_formatted_address(self) -> str:
             LOGGER.info('connect_server: ConnectError %s', str(err))
             self._set_status('Server shutdown')
 
-    def run(self, debug=False):
+    def run(self, debug: bool = False) -> None:
         self.aloop = asyncio.get_event_loop()
         self.aloop.set_debug(debug)
 
@@ -176,7 +183,7 @@ class StatusBar(urwid.Text):
     """
     A simple Text widget that currently only shows connection status.
     """
-    def __init__(self, text=''):
+    def __init__(self, text: str = ''):
         super().__init__(text, align='right')
 
 
@@ -185,14 +192,14 @@ class Editor(urwid_readline.ReadlineEdit):
     Support urwid_readline features along with
     history support which lacks in urwid_readline
     """
-    def __init__(self, master):
+    def __init__(self, master: App) -> None:
         super().__init__(caption='> ', multiline=True)
         self.master = master
-        self.history = []
-        self.last_index = -1
-        self.show_history = False
+        self.history: List[str] = []
+        self.last_index: int = -1
+        self.show_history: bool = False
 
-    def keypress(self, size, key):
+    def keypress(self, size: Tuple[int, int], key: str) -> Optional[str]:
         # TODO: Add some logic for down key and clean up logic if possible.
         # Returning None means the key has been handled by this widget
         # which otherwise is propogated to the parent widget to be
@@ -223,7 +230,7 @@ def keypress(self, size, key):
         else:
             self.show_history = False
             self.last_index = 0
-            return super().keypress(size, key)
+            return super().keypress(size, key)  # type: ignore
         return None
 
 
@@ -231,7 +238,7 @@ class EditorWidget(urwid.Filler):
     """
     Wraps CustomEdit
     """
-    def __init__(self, master):
+    def __init__(self, master: App) -> None:
         super().__init__(Editor(master), valign='top')
 
 
@@ -239,12 +246,12 @@ class HistoryBox(urwid.ListBox):
     """
     Shows all the QMP message transmitted/received
     """
-    def __init__(self, master):
+    def __init__(self, master: App) -> None:
         self.master = master
         self.history = urwid.SimpleFocusListWalker([])
         super().__init__(self.history)
 
-    def add_to_history(self, history):
+    def add_to_history(self, history: str) -> None:
         self.history.append(urwid.Text(history))
         if self.history:
             self.history.set_focus(len(self.history) - 1)
@@ -254,7 +261,7 @@ class HistoryWindow(urwid.Frame):
     """
     Composes the HistoryBox and EditorWidget
     """
-    def __init__(self, master):
+    def __init__(self, master: App) -> None:
         self.master = master
         self.editor_widget = EditorWidget(master)
         self.editor = urwid.LineBox(self.editor_widget)
@@ -264,7 +271,7 @@ def __init__(self, master):
         super().__init__(self.body)
         urwid.connect_signal(self.master, UPDATE_MSG, self.cb_add_to_history)
 
-    def cb_add_to_history(self, msg):
+    def cb_add_to_history(self, msg: str) -> None:
         self.history.add_to_history(msg)
 
 
@@ -275,7 +282,7 @@ class Window(urwid.Frame):
     future when we will have multiple windows and want to the switch between
     them and display overlays
     """
-    def __init__(self, master):
+    def __init__(self, master: App) -> None:
         self.master = master
         footer = StatusBar()
         body = HistoryWindow(master)
@@ -283,18 +290,18 @@ def __init__(self, master):
 
 
 class TUILogHandler(Handler):
-    def __init__(self, tui):
+    def __init__(self, tui: App) -> None:
         super().__init__()
         self.tui = tui
 
-    def emit(self, record):
+    def emit(self, record: LogRecord) -> None:
         level = record.levelname
         msg = record.getMessage()
         msg = f'[{level}]: {msg}'
         self.tui.add_to_history(msg)
 
 
-def main():
+def main() -> None:
     parser = argparse.ArgumentParser(description='AQMP TUI')
     parser.add_argument('qmp_server', help='Address of the QMP server'
                         '< UNIX socket path | TCP addr:port >')
@@ -311,7 +318,7 @@ def main():
     try:
         address = QEMUMonitorProtocol.parse_address(args.qmp_server)
     except QMPBadPortError as err:
-        parser.error(err)
+        parser.error(str(err))
 
     app = App(address)
 
@@ -330,4 +337,4 @@ def main():
 
 
 if __name__ == '__main__':
-    main()  # type: ignore
+    main()
diff --git a/python/setup.cfg b/python/setup.cfg
index 8cd9ac0d81..11c6240aba 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -83,9 +83,6 @@ namespace_packages = True
 allow_subclassing_any = True
 
 [mypy-qemu.aqmp.aqmp_tui]
-disallow_untyped_defs = False
-disallow_incomplete_defs = False
-check_untyped_defs = False
 # urwid and urwid_readline have no type stubs:
 allow_subclassing_any = True
 
-- 
2.17.1


