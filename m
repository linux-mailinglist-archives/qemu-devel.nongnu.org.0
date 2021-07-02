Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1F93BA50E
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 23:31:28 +0200 (CEST)
Received: from localhost ([::1]:60058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzQkx-0001qS-JP
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 17:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lzQg1-0002MK-WF
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 17:26:22 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:37884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lzQfy-0001QW-K2
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 17:26:21 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so10074629pjs.2
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 14:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VmH3DOOEQxtLHGFhrf72YU9eXD41q84vzTs5x8dfa6I=;
 b=giJi4HXiJ2LwMFIFuwfL4eCvzUiu2hgQ9VYbcXlbxMhUclDch/cciCz+2kOcIgbk+4
 8nzJ3fKAApC8X3LLCyxW+koheE25Gyv6Jg4qwGlyi/mpNVbu4epFDY1OuO62d74kSxw1
 jxcSLZOY6u2nfkiWn1D5ajFCUj9ngpNT7+i/kbtzZqnVOipsMYSv9QPvUAEnbRklhPpn
 7nRmZZo+zT1k3U9HkX/Bl9WODzHzhzyH4lMkyfVvHtvdq89zmbCfTajGdn65tSyYaonL
 zUkBqVP+PdJZo994xpuIC3p76zIZI+X0JI7Qny7lNDACSMfPfYyEfwLNhAAOXYmEiDNh
 Oqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VmH3DOOEQxtLHGFhrf72YU9eXD41q84vzTs5x8dfa6I=;
 b=Jzf5C5T4rakjLex8YS4roHNJMxgX0X82acpkE+zMs3CQPAxPwuZRwMbHacZ+dL+rIB
 x0WR5BgO622hxBiOB8bTdGtum9/obxk7Z+c2bkJNbSimycMRUZvTe2eUz3S+scPXZWPV
 AvPJR052B293ztk4oYQpfLsa9qs0dJCV6glHv4xyYTxRo1ET1sQ6X2U1JaoVP6CAdK/5
 VSOyjTE9iVZrmBtTZ1dk/w9LMPwFm7yc0dVodEybB8T3ttecXQlVbAxV2xLDjWPQzWjG
 TvKXvNk5yIkZl8qUEYTxAVy9rjPYm0oGNr8ddury9+WMdK1dhMREebt13YAil7GzKzI1
 DLtg==
X-Gm-Message-State: AOAM532zj7yBs5/YQL1ZSlarCSFzlE/SzpMaA2/zDPZE5S4OSQ6f7WX/
 8HYbUgUWE6/IDbKdWLJZkwQ=
X-Google-Smtp-Source: ABdhPJw27S9CiO0gW64LxqoL3p5B9pLd+XasyTBUc3s1Hv7RY9P1nwr/AGCNVguckB5fLIYMd0M2Pw==
X-Received: by 2002:a17:90a:49c6:: with SMTP id
 l6mr1568656pjm.171.1625261177429; 
 Fri, 02 Jul 2021 14:26:17 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.1])
 by smtp.gmail.com with ESMTPSA id o16sm71563pjw.51.2021.07.02.14.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 14:26:17 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: jsnow@redhat.com
Subject: [PATCH 3/6] python/aqmp-tui: Add AQMP TUI draft
Date: Sat,  3 Jul 2021 02:56:00 +0530
Message-Id: <20210702212603.26465-4-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210702212603.26465-1-niteesh.gs@gmail.com>
References: <20210702212603.26465-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pj1-x102e.google.com
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
Cc: G S Niteesh Babu <niteesh.gs@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added a draft of AQMP TUI.

Implements the follwing basic features:
1) Command transmission/reception.
2) Shows events asynchronously.
3) Shows server status in the bottom status bar.

Also added necessary pylint, mypy configurations

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
---
 python/qemu/aqmp/aqmp_tui.py | 246 +++++++++++++++++++++++++++++++++++
 python/setup.cfg             |  16 ++-
 2 files changed, 261 insertions(+), 1 deletion(-)
 create mode 100644 python/qemu/aqmp/aqmp_tui.py

diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
new file mode 100644
index 0000000000..8e9e8ac8ff
--- /dev/null
+++ b/python/qemu/aqmp/aqmp_tui.py
@@ -0,0 +1,246 @@
+# Copyright (c) 2021
+#
+# Authors:
+#  Niteesh Babu G S <niteesh.gs@gmail.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+import argparse
+import asyncio
+import logging
+import signal
+
+import urwid
+import urwid_readline
+
+from .protocol import ConnectError
+from .qmp_protocol import QMP, ExecInterruptedError, ExecuteError
+from .util import create_task, pretty_traceback
+
+
+UPDATE_MSG = 'UPDATE_MSG'
+
+
+class StatusBar(urwid.Text):
+    """
+    A simple Text widget that currently only shows connection status.
+    """
+    def __init__(self, text=''):
+        super().__init__(text, align='right')
+
+
+class Editor(urwid_readline.ReadlineEdit):
+    """
+    Support urwid_readline features along with
+    history support which lacks in urwid_readline
+    """
+    def __init__(self, master):
+        super().__init__(caption='> ', multiline=True)
+        self.master = master
+        self.history = []
+        self.last_index = -1
+        self.show_history = False
+
+    def keypress(self, size, key):
+        # TODO: Add some logic for down key and clean up logic if possible.
+        # Returning None means the key has been handled by this widget
+        # which otherwise is propogated to the parent widget to be
+        # handled
+        msg = self.get_edit_text()
+        if key == 'up' and not msg:
+            # Show the history when 'up arrow' is pressed with no input text.
+            # NOTE: The show_history logic is necessary because in 'multiline'
+            # mode (which we use) 'up arrow' is used to move between lines.
+            self.show_history = True
+            last_msg = self.history[self.last_index] if self.history else ''
+            self.set_edit_text(last_msg)
+            self.edit_pos = len(last_msg)
+            self.last_index += 1
+        elif key == 'up' and self.show_history:
+            if self.last_index < len(self.history):
+                self.set_edit_text(self.history[self.last_index])
+                self.edit_pos = len(self.history[self.last_index])
+                self.last_index += 1
+        elif key == 'meta enter':
+            # When using multiline, enter inserts a new line into the editor
+            # send the input to the server on alt + enter
+            self.master.cb_send_to_server(msg)
+            self.history.insert(0, msg)
+            self.set_edit_text('')
+            self.last_index = 0
+            self.show_history = False
+        else:
+            self.show_history = False
+            self.last_index = 0
+            return super().keypress(size, key)
+        return None
+
+
+class EditorWidget(urwid.Filler):
+    """
+    Wraps CustomEdit
+    """
+    def __init__(self, master):
+        super().__init__(Editor(master), valign='top')
+
+
+class HistoryBox(urwid.ListBox):
+    """
+    Shows all the QMP message transmitted/received
+    """
+    def __init__(self, master):
+        self.master = master
+        self.history = urwid.SimpleFocusListWalker([])
+        super().__init__(self.history)
+
+    def add_to_history(self, history):
+        self.history.append(urwid.Text(history))
+        if self.history:
+            self.history.set_focus(len(self.history) - 1)
+
+
+class HistoryWindow(urwid.Frame):
+    """
+    Composes the HistoryBox and EditorWidget
+    """
+    def __init__(self, master):
+        self.master = master
+        self.editor = EditorWidget(master)
+        self.editor_widget = urwid.LineBox(self.editor)
+        self.history = HistoryBox(master)
+        self.body = urwid.Pile([('weight', 80, self.history),
+                                ('weight', 10, self.editor_widget)])
+        super().__init__(self.body)
+        urwid.connect_signal(self.master, UPDATE_MSG, self.cb_add_to_history)
+
+    def cb_add_to_history(self, msg):
+        self.history.add_to_history(msg)
+
+
+class Window(urwid.Frame):
+    """
+    This is going to be the main window that is going to compose other
+    windows. In this stage it is unnecesssary but will be necessary in
+    future when we will have multiple windows and want to the switch between
+    them and display overlays
+    """
+    def __init__(self, master):
+        self.master = master
+        footer = StatusBar()
+        body = HistoryWindow(master)
+        super().__init__(body, footer=footer)
+
+
+class App(QMP):
+    def __init__(self, address):
+        urwid.register_signal(self.__class__, UPDATE_MSG)
+        self.window = Window(self)
+        self.address = address
+        self.aloop = asyncio.get_event_loop()
+        self.loop = None
+        super().__init__()
+
+        # Gracefully handle SIGTERM and SIGINT signals
+        cancel_signals = [signal.SIGTERM, signal.SIGINT]
+        for sig in cancel_signals:
+            self.aloop.add_signal_handler(sig, self.kill_app)
+
+    def _cb_outbound(self, msg):
+        urwid.emit_signal(self, UPDATE_MSG, "<-- " + str(msg))
+        return msg
+
+    def _cb_inbound(self, msg):
+        urwid.emit_signal(self, UPDATE_MSG, "--> " + str(msg))
+        return msg
+
+    async def wait_for_events(self):
+        async for event in self.events:
+            self.handle_event(event)
+
+    async def _send_to_server(self, msg):
+        # TODO: Handle more validation errors (eg: ValueError)
+        try:
+            response = await self._raw(bytes(msg, 'utf-8'))
+            logging.info('Response: %s %s', response, type(response))
+        except ExecuteError:
+            logging.info('Error response from server for msg: %s', msg)
+        except ExecInterruptedError:
+            logging.info('Error server disconnected before reply')
+            # FIXME: Handle this better
+            # Show the disconnected message in the history window
+            urwid.emit_signal(self, UPDATE_MSG,
+                              '{"error": "Server disconnected before reply"}')
+            self.window.footer.set_text("Server disconnected")
+        except Exception as err:
+            logging.info('Exception from _send_to_server: %s', str(err))
+            raise err
+
+    def cb_send_to_server(self, msg):
+        create_task(self._send_to_server(msg))
+
+    def unhandled_input(self, key):
+        if key == 'esc':
+            self.kill_app()
+
+    def kill_app(self):
+        # TODO: Work on the disconnect logic
+        create_task(self._kill_app())
+
+    async def _kill_app(self):
+        # It is ok to call disconnect even in disconnect state
+        await self.disconnect()
+        logging.info('disconnect finished, Exiting app')
+        raise urwid.ExitMainLoop()
+
+    def handle_event(self, event):
+        if event['event'] == 'SHUTDOWN':
+            self.window.footer.set_text('Server shutdown')
+
+    async def connect_server(self):
+        try:
+            await self.connect(self.address)
+            self.window.footer.set_text("Connected to {:s}".format(
+                f"{self.address[0]}:{self.address[1]}"
+                if isinstance(self.address, tuple)
+                else self.address
+            ))
+        except ConnectError as err:
+            logging.debug('Cannot connect to server %s', str(err))
+            self.window.footer.set_text('Server shutdown')
+
+    def run(self):
+        self.aloop.set_debug(True)
+        event_loop = urwid.AsyncioEventLoop(loop=self.aloop)
+        self.loop = urwid.MainLoop(self.window,
+                                   unhandled_input=self.unhandled_input,
+                                   handle_mouse=True,
+                                   event_loop=event_loop)
+
+        create_task(self.wait_for_events(), self.aloop)
+        create_task(self.connect_server(), self.aloop)
+        try:
+            self.loop.run()
+        except Exception as err:
+            logging.error('%s\n%s\n', str(err), pretty_traceback())
+            raise err
+
+
+def main():
+    parser = argparse.ArgumentParser(description='AQMP TUI')
+    parser.add_argument('-a', '--address', metavar='IP:PORT', required=True,
+                        help='Address of the QMP server', dest='address')
+    parser.add_argument('--log', help='Address of the QMP server',
+                        dest='log_file')
+    args = parser.parse_args()
+
+    logging.basicConfig(filename=args.log_file, level=logging.DEBUG)
+
+    address = args.address.split(':')
+    address[1] = int(address[1])
+
+    App(tuple(address)).run()
+
+
+if __name__ == '__main__':
+    main()  # type: ignore
diff --git a/python/setup.cfg b/python/setup.cfg
index c62803bffc..c6d38451eb 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -81,8 +81,22 @@ namespace_packages = True
 # fusepy has no type stubs:
 allow_subclassing_any = True
 
+[mypy-qemu.aqmp.aqmp_tui]
+disallow_untyped_defs = False
+disallow_incomplete_defs = False
+check_untyped_defs = False
+# urwid and urwid_readline have no type stubs:
+allow_subclassing_any = True
+
+# The following missing import directives are because these libraries do not
+# provide type stubs. Allow them on an as-needed basis for mypy.
 [mypy-fuse]
-# fusepy has no type stubs:
+ignore_missing_imports = True
+
+[mypy-urwid]
+ignore_missing_imports = True
+
+[mypy-urwid_readline]
 ignore_missing_imports = True
 
 [pylint.messages control]
-- 
2.17.1


