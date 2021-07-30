Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3003DBFB5
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 22:23:06 +0200 (CEST)
Received: from localhost ([::1]:37210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Z29-00048e-8R
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 16:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m9YyR-0004bh-VX
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:19:15 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:51019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m9YyP-0000tX-Ij
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:19:15 -0400
Received: by mail-pj1-x1030.google.com with SMTP id l19so16932774pjz.0
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 13:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=eIUzvV4ImuBy5U+VPYoyF5hhFWzQ9SU4RRHMB9KUCmI=;
 b=iqncmCm/bqRtjScdB/J3Tw0wblsNzSVVVCe2WwcPw5dl4PpRqz7LuRzMxlkKVMa+cX
 psnYPMcwTHQJTPu+x9/wrmaGP+WS5wMVhBCNvWmPHGDqlX+CW5epLPyuIhNDE5czQctR
 Bz2j3lN3EWLzKWeBCdYViOdqIOSozE2/5UnJi7rD8bi+h9wnAYnhh1cBTJu7ZrmDmxGC
 cjIBNyYiJ+AnPaiSbjTCBHupfoS0w+qsqmz44/yz9yIJHxre21RhFi9h51jOl0Yiw/4c
 exylm8MfXH3rs+AYbeDdSaB5YCLtPn/jP8M78Xa3wHDMmo9iQkRcymLCsnYzthkeejDG
 9nEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=eIUzvV4ImuBy5U+VPYoyF5hhFWzQ9SU4RRHMB9KUCmI=;
 b=LguRpEFHAsevrL7biqi3q3IMOYaRtyxAW7yjpvQh7i/G15nkcFp5BgxEiSaTgCOiGa
 6WJv3UxLhsnRcFHyyhLhQ7XJuz7v1WuCgcaFs3+WMDm+HF8BghjFW0ll/jsXJc54mgoc
 WRtD0tpS1P+h9wgRxMoReCj010YY/i08760ecxPnaY1+RSnJ9du+t8Gyu2A9CpzEGKFV
 bSlzIekdO3AnAWqSJWY32YHdJrIy0uMV3FWNtl5KxPoYx2Ll7nOVGzGZh00Pz2CZV68a
 Ob8eHNbKAsbO24jMQ09sf4PA+07CvHorXqzqEnk8pwSIZzqUOZiNI+p+tQ/htaO5ksmr
 4GTg==
X-Gm-Message-State: AOAM531eTvFeWSQSjNy8Jc8kdk8t9pz0uLseFMgpIaS2J86cQxNs8Cs/
 T+19Bgzd6uiWMZZhbgjO4Obaq/TtK/qNXw==
X-Google-Smtp-Source: ABdhPJx9s9Y230WjEf181kbFxn3OzfZi/hZHWIRuWJT7GE0s99xQGJ+N0ABZD/m/tHyv2kI7HyK3Eg==
X-Received: by 2002:a62:584:0:b029:32e:3b57:a1c6 with SMTP id
 126-20020a6205840000b029032e3b57a1c6mr4407975pff.13.1627676352044; 
 Fri, 30 Jul 2021 13:19:12 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.243])
 by smtp.gmail.com with ESMTPSA id s50sm3256842pfw.212.2021.07.30.13.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 13:19:11 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/13] python/aqmp-tui: Add AQMP TUI draft
Date: Sat, 31 Jul 2021 01:48:37 +0530
Message-Id: <20210730201846.5147-5-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210730201846.5147-1-niteesh.gs@gmail.com>
References: <20210730201846.5147-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pj1-x1030.google.com
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

Added a draft of AQMP TUI.

Implements the follwing basic features:
1) Command transmission/reception.
2) Shows events asynchronously.
3) Shows server status in the bottom status bar.

Also added necessary pylint, mypy configurations

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
---
 python/qemu/aqmp/aqmp_tui.py | 333 +++++++++++++++++++++++++++++++++++
 python/setup.cfg             |  16 +-
 2 files changed, 348 insertions(+), 1 deletion(-)
 create mode 100644 python/qemu/aqmp/aqmp_tui.py

diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
new file mode 100644
index 0000000000..ec9eba0aa7
--- /dev/null
+++ b/python/qemu/aqmp/aqmp_tui.py
@@ -0,0 +1,333 @@
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
+from logging import Handler
+import signal
+
+import urwid
+import urwid_readline
+
+from ..qmp import QEMUMonitorProtocol, QMPBadPortError
+from .message import DeserializationError, Message, UnexpectedTypeError
+from .protocol import ConnectError
+from .qmp_client import ExecInterruptedError, QMPClient
+from .util import create_task, pretty_traceback
+
+
+UPDATE_MSG = 'UPDATE_MSG'
+
+# Using root logger to enable all loggers under qemu and asyncio
+LOGGER = logging.getLogger()
+
+
+def format_json(msg):
+    """
+    Formats given multiline JSON message into a single line message.
+    Converting into single line is more asthetically pleasing when looking
+    along with error messages compared to multiline JSON.
+    """
+    # FIXME: Use better formatting mechanism. Might break at more complex JSON
+    # data.
+    msg = msg.replace('\n', '')
+    words = msg.split(' ')
+    words = [word for word in words if word != '']
+    return ' '.join(words)
+
+
+class App(QMPClient):
+    def __init__(self, address):
+        urwid.register_signal(type(self), UPDATE_MSG)
+        self.window = Window(self)
+        self.address = address
+        self.aloop = None
+        super().__init__()
+
+    def add_to_history(self, msg):
+        urwid.emit_signal(self, UPDATE_MSG, msg)
+
+    def _cb_outbound(self, msg):
+        # FIXME: I think the ideal way to omit these messages during in-TUI
+        # logging will be to add a filter to the logger. We can use regex to
+        # filter out messages starting with 'Request:' or 'Response:' but I
+        # think a better approach will be encapsulate the message in an object
+        # and filter based on the object. Encapsulation of the message will
+        # also be necessary when we want different formatting of messages
+        # inside TUI.
+        handler = LOGGER.handlers[0]
+        if not isinstance(handler, TUILogHandler):
+            LOGGER.debug('Request: %s', str(msg))
+        self.add_to_history('<-- ' + str(msg))
+        return msg
+
+    def _cb_inbound(self, msg):
+        handler = LOGGER.handlers[0]
+        if not isinstance(handler, TUILogHandler):
+            LOGGER.debug('Response: %s', str(msg))
+        self.add_to_history('--> ' + str(msg))
+        return msg
+
+    async def wait_for_events(self):
+        async for event in self.events:
+            self.handle_event(event)
+
+    async def _send_to_server(self, raw_msg):
+        # FIXME: Format the raw_msg in history view to one line. It is not
+        # pleasing to see multiple lines JSON object with an error statement.
+        try:
+            msg = Message(bytes(raw_msg, encoding='utf-8'))
+            # Format multiline json into a single line JSON, since it is more
+            # pleasing to look along with err message in TUI.
+            raw_msg = self.format_json(raw_msg)
+            await self._raw(msg, assign_id='id' not in msg)
+        except (ValueError, TypeError) as err:
+            LOGGER.info('Invalid message: %s', str(err))
+            self.add_to_history(f'{raw_msg}: {err}')
+        except (DeserializationError, UnexpectedTypeError) as err:
+            LOGGER.info('Invalid message: %s', err.error_message)
+            self.add_to_history(f'{raw_msg}: {err.error_message}')
+        except ExecInterruptedError:
+            LOGGER.info('Error server disconnected before reply')
+            urwid.emit_signal(self, UPDATE_MSG,
+                              '{"error": "Server disconnected before reply"}')
+            self._set_status("Server disconnected")
+        except Exception as err:
+            LOGGER.error('Exception from _send_to_server: %s', str(err))
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
+        try:
+            await self.disconnect()
+            LOGGER.debug('Disconnect finished. Exiting app')
+        except Exception as err:
+            LOGGER.info('_kill_app: %s', str(err))
+            # Let the app crash after providing a proper stack trace
+            raise err
+        raise urwid.ExitMainLoop()
+
+    def handle_event(self, event):
+        # FIXME: Consider all states present in qapi/run-state.json
+        if event['event'] == 'SHUTDOWN':
+            self._set_status('Server shutdown')
+
+    def _set_status(self, msg: str) -> None:
+        self.window.footer.set_text(msg)
+
+    def _get_formatted_address(self) -> str:
+        addr = f'{self.address}'
+        if isinstance(self.address, tuple):
+            host, port = self.address
+            addr = f'{host}:{port}'
+        return addr
+
+    async def connect_server(self):
+        try:
+            await self.connect(self.address)
+            addr = self._get_formatted_address()
+            self._set_status(f'Connected to {addr}')
+        except ConnectError as err:
+            LOGGER.info('connect_server: ConnectError %s', str(err))
+            self._set_status('Server shutdown')
+
+    def run(self, debug=False):
+        self.aloop = asyncio.get_event_loop()
+        self.aloop.set_debug(debug)
+
+        # Gracefully handle SIGTERM and SIGINT signals
+        cancel_signals = [signal.SIGTERM, signal.SIGINT]
+        for sig in cancel_signals:
+            self.aloop.add_signal_handler(sig, self.kill_app)
+
+        event_loop = urwid.AsyncioEventLoop(loop=self.aloop)
+        main_loop = urwid.MainLoop(urwid.AttrMap(self.window, 'background'),
+                                   unhandled_input=self.unhandled_input,
+                                   handle_mouse=True,
+                                   event_loop=event_loop)
+
+        create_task(self.wait_for_events(), self.aloop)
+        create_task(self.connect_server(), self.aloop)
+        try:
+            main_loop.run()
+        except Exception as err:
+            LOGGER.error('%s\n%s\n', str(err), pretty_traceback())
+            raise err
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
+        self.editor_widget = EditorWidget(master)
+        self.editor = urwid.LineBox(self.editor_widget)
+        self.history = HistoryBox(master)
+        self.body = urwid.Pile([('weight', 80, self.history),
+                                ('weight', 20, self.editor)])
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
+class TUILogHandler(Handler):
+    def __init__(self, tui):
+        super().__init__()
+        self.tui = tui
+
+    def emit(self, record):
+        level = record.levelname
+        msg = record.getMessage()
+        msg = f'[{level}]: {msg}'
+        self.tui.add_to_history(msg)
+
+
+def main():
+    parser = argparse.ArgumentParser(description='AQMP TUI')
+    parser.add_argument('qmp_server', help='Address of the QMP server'
+                        '< UNIX socket path | TCP addr:port >')
+    parser.add_argument('--log-file', help='The Log file name')
+    parser.add_argument('--log-level', default='WARNING',
+                        help='Log level <CRITICAL|ERROR|WARNING|INFO|DEBUG|>')
+    parser.add_argument('--asyncio-debug', action='store_true',
+                        help='Enable debug mode for asyncio loop'
+                        'Generates lot of output, makes TUI unusable when'
+                        'logs are logged in the TUI itself.'
+                        'Use only when logging to a file')
+    args = parser.parse_args()
+
+    try:
+        address = QEMUMonitorProtocol.parse_address(args.qmp_server)
+    except QMPBadPortError as err:
+        parser.error(err)
+
+    app = App(address)
+
+    if args.log_file:
+        LOGGER.addHandler(logging.FileHandler(args.log_file))
+    else:
+        LOGGER.addHandler(TUILogHandler(app))
+
+    log_level = logging.getLevelName(args.log_level)
+    # getLevelName returns 'Level {log_level}' when a invalid level is passed.
+    if log_level == f'Level {args.log_level}':
+        parser.error('Invalid log level')
+    LOGGER.setLevel(log_level)
+
+    app.run(args.asyncio_debug)
+
+
+if __name__ == '__main__':
+    main()  # type: ignore
diff --git a/python/setup.cfg b/python/setup.cfg
index d106a0ed7a..50f9894468 100644
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


