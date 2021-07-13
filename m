Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25F63C7963
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:09:55 +0200 (CEST)
Received: from localhost ([::1]:56798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3QbC-00040g-MZ
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m3QZB-0001IL-BI
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:07:49 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:42584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m3QZ9-000677-0f
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:07:49 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 i16-20020a17090acf90b02901736d9d2218so128486pju.1
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HlLUgf9n6Oa6By93uK6f6O2qlQF33IzRRnBXuCDraNM=;
 b=rmTuNDI82PAYu6It0oPAPuo2eDwORcjUdMPxzywOYRlPVzeLU01No/POPlWCH+XLds
 VCSUoX8l6MQLAWuvy0mhgBPMWCFiOQM5wkIyYOItyQ7eQRDZH8qF3ESwqL1fhAY8PNdH
 ecGCbMo9NHlUIByfCVN3MGQ0fxEN9KQFidpDz0mrUhgBmwV9t1cnhZhUylBfn7NRwGuz
 JQzct4f/f9eEk8cpR9ljHB2b7+ZpTounUKgH9TPiMlHflY7rddB4wvrkGdoBANAWhs85
 dkTjWjOUlyVxl2gLYQ95faP+c0wWyGXqwPdtfgKZok0StE+COsfyaRiBqm9iqnNz4SXE
 zrBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HlLUgf9n6Oa6By93uK6f6O2qlQF33IzRRnBXuCDraNM=;
 b=Het2EM1zNGmY4fTdMzhkTj47f8OTtrAYGeuHEQWKJ4kCrANWP/jSkPsB9pcFGTOhCR
 89zbdjkwuBmKBKZncjvQGv4+me9we2CIk5X+zo4rGYM0pGT/xa2dG8BcxXhqP2CMDJBU
 wnwEiOZEnb0+EJigEk74xVi9QA8eb8ahTvuuUU5K4+6lQHORfmKpErEkdoK3nT6K6+hT
 ZrzhY6Bajo3ry1PWHMn47U1BxD2WxCfagIYbrwNgS28Wa26rlFSZZnGLlS+EuuswolYb
 1dfnzDhNx0m2voQVFPEHtMR5FtxqU397E+hBMMek/1bTQf4y0R3ChN/ya4znmG9nUABr
 hyXg==
X-Gm-Message-State: AOAM532fhkMMKVbRECiKUZcJVLC9ZfJiccotqyr+7e4/gaxrfwo17ohv
 F7aZzrZX/7dDSystJdTRmME7j2fgGDOCCg==
X-Google-Smtp-Source: ABdhPJzqvj2mRa3CJg1h8DcMYv+K0XqP/57mSvwTx+OFpwoso6vOhg3MJSD42WYSD9p75wCQ9jnkVw==
X-Received: by 2002:a17:90a:e611:: with SMTP id
 j17mr412065pjy.48.1626214065652; 
 Tue, 13 Jul 2021 15:07:45 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.183])
 by smtp.gmail.com with ESMTPSA id w16sm94678pgi.41.2021.07.13.15.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:07:45 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/6] python/aqmp-tui: Add AQMP TUI draft
Date: Wed, 14 Jul 2021 03:37:31 +0530
Message-Id: <20210713220734.26302-4-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210713220734.26302-1-niteesh.gs@gmail.com>
References: <20210713220734.26302-1-niteesh.gs@gmail.com>
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
Cc: G S Niteesh Babu <niteesh.gs@gmail.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
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
 python/qemu/aqmp/aqmp_tui.py | 332 +++++++++++++++++++++++++++++++++++
 python/setup.cfg             |  21 ++-
 2 files changed, 352 insertions(+), 1 deletion(-)
 create mode 100644 python/qemu/aqmp/aqmp_tui.py

diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
new file mode 100644
index 0000000000..f853efc1f5
--- /dev/null
+++ b/python/qemu/aqmp/aqmp_tui.py
@@ -0,0 +1,332 @@
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
+from .error import MultiException
+from .protocol import ConnectError
+from .qmp_protocol import QMP, ExecInterruptedError, ExecuteError
+from .util import create_task, pretty_traceback
+
+
+UPDATE_MSG = 'UPDATE_MSG'
+
+# Using root logger to enable all loggers under qemu and asyncio
+LOGGER = logging.getLogger()
+
+palette = [
+    (Token.Punctuation, '', '', '', 'h15,bold', 'g7'),
+    (Token.Text, '', '', '', '', 'g7'),
+    (Token.Name.Tag, '', '', '', 'bold,#f88', 'g7'),
+    (Token.Literal.Number.Integer, '', '', '', '#fa0', 'g7'),
+    (Token.Literal.String.Double, '', '', '', '#6f6', 'g7'),
+    (Token.Keyword.Constant, '', '', '', '#6af', 'g7'),
+    ('background', '', 'black', '', '', 'g7'),
+]
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
+                                ('weight', 20, self.editor_widget)])
+        super().__init__(self.body)
+        urwid.connect_signal(self.master, UPDATE_MSG, self.cb_add_to_history)
+
+    def cb_add_to_history(self, msg, level=None):
+        formatted = []
+        if level:
+            msg = f'[{level}]: {msg}'
+            formatted.append(msg)
+        else:
+            lexer = lexers.JsonLexer()  # pylint: disable=no-member
+            for token in lexer.get_tokens(msg):
+                formatted.append(token)
+        self.history.add_to_history(formatted)
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
+        urwid.register_signal(type(self), UPDATE_MSG)
+        self.window = Window(self)
+        self.address = address
+        self.aloop = None
+        self.loop = None
+        super().__init__()
+
+    def add_to_history(self, msg, level=None):
+        urwid.emit_signal(self, UPDATE_MSG, msg, level)
+
+    def _cb_outbound(self, msg):
+        LOGGER.debug('Request: %s', str(msg))
+        self.add_to_history('<-- ' + str(msg))
+        return msg
+
+    def _cb_inbound(self, msg):
+        LOGGER.debug('Response: %s', str(msg))
+        self.add_to_history('--> ' + str(msg))
+        return msg
+
+    async def wait_for_events(self):
+        async for event in self.events:
+            self.handle_event(event)
+
+    async def _send_to_server(self, msg):
+        # TODO: Handle more validation errors (eg: ValueError)
+        try:
+            await self._raw(bytes(msg, 'utf-8'))
+        except ExecuteError:
+            LOGGER.info('Error response from server for msg: %s', msg)
+        except ExecInterruptedError:
+            LOGGER.info('Error server disconnected before reply')
+            # FIXME: Handle this better
+            # Show the disconnected message in the history window
+            urwid.emit_signal(self, UPDATE_MSG,
+                              '{"error": "Server disconnected before reply"}')
+            self.window.footer.set_text("Server disconnected")
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
+        except MultiException as err:
+            LOGGER.info('Multiple exception on disconnect: %s', str(err))
+            # Let the app crash after providing a proper stack trace
+            raise err
+        raise urwid.ExitMainLoop()
+
+    def handle_event(self, event):
+        # FIXME: Consider all states present in qapi/run-state.json
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
+            LOGGER.debug('Cannot connect to server %s', str(err))
+            self.window.footer.set_text('Server shutdown')
+
+    def run(self, debug=False):
+        self.screen.set_terminal_properties(256)
+
+        self.aloop = asyncio.get_event_loop()
+        self.aloop.set_debug(debug)
+
+        # Gracefully handle SIGTERM and SIGINT signals
+        cancel_signals = [signal.SIGTERM, signal.SIGINT]
+        for sig in cancel_signals:
+            self.aloop.add_signal_handler(sig, self.kill_app)
+
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
+            LOGGER.error('%s\n%s\n', str(err), pretty_traceback())
+            raise err
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
+        self.tui.add_to_history(msg, level)
+
+
+def parse_address(address):
+    """
+    This snippet was taken from qemu.qmp.__init__.
+    pylint complaints about duplicate code so it has been
+    temprorily disabled. This should be fixed once qmp is
+    replaced by aqmp in the future.
+    """
+    components = address.split(':')
+    if len(components) == 2:
+        try:
+            port = int(components[1])
+        except ValueError:
+            raise ValueError(f'Bad Port value in {address}') from None
+        return (components[0], port)
+    return address
+
+
+def main():
+    parser = argparse.ArgumentParser(description='AQMP TUI')
+    parser.add_argument('qmp_server', help='Address of the QMP server'
+                        '< UNIX socket path | TCP addr:port >')
+    parser.add_argument('--log-file', help='The Log file name')
+    parser.add_argument('--log-level', help='Log level <debug|info|error>',
+                        default='debug')
+    parser.add_argument('--debug', action='store_true',
+                        help='Enable debug mode for asyncio loop'
+                        'Generates lot of output, makes TUI unusable when'
+                        'logs are logged in the TUI itself.'
+                        'Use only when logging to a file')
+    args = parser.parse_args()
+
+    try:
+        address = parse_address(args.qmp_server)
+    except ValueError as err:
+        parser.error(err)
+
+    app = App(address)
+
+    if args.log_file:
+        LOGGER.addHandler(logging.FileHandler(args.log_file))
+    else:
+        LOGGER.addHandler(TUILogHandler(app))
+
+    log_levels = {'debug': logging.DEBUG,
+                  'info': logging.INFO,
+                  'error': logging.ERROR}
+
+    if args.log_level not in log_levels:
+        parser.error('Invalid log level')
+    LOGGER.setLevel(log_levels[args.log_level])
+
+    app.run(args.debug)
+
+
+if __name__ == '__main__':
+    main()  # type: ignore
diff --git a/python/setup.cfg b/python/setup.cfg
index c62803bffc..7e5aae66c7 100644
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
@@ -97,6 +111,11 @@ ignore_missing_imports = True
 # --disable=W".
 disable=too-many-function-args,  # mypy handles this with less false positives.
         missing-docstring, # FIXME
+        # pylint complaints about duplicate code in aqmp_tui. The snippet is
+        # taken from qemu/qmp and there is no way to turn this check of in
+        # module itself. So this has been added here and has to be removed
+        # in the future when qmp is removed.
+        duplicate-code, # FIXME
         fixme, # FIXME
 
 [pylint.basic]
-- 
2.17.1


