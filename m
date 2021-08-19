Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CB23F1F4E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 19:43:23 +0200 (CEST)
Received: from localhost ([::1]:55546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGm4X-0006EQ-Vk
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 13:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mGm0q-0003Jg-87
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 13:39:33 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:43836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mGm0m-0000lS-1s
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 13:39:31 -0400
Received: by mail-pf1-x42a.google.com with SMTP id 7so6181872pfl.10
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 10:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NWAY7tZUF1UG+SLZWRn+ZIqqB2YoXxKZMPfN1jNqRDo=;
 b=Umz8ndqmhYVQvMwLRADp1J2C9VVs5L5aXwrgKCTECxNzQ2q7OZa5wTCR+ZUHVe8UYr
 /Wo+9cJnkfs2nD8QHLwvSJcQ2KEBnF0flDmL6bxnNfzV8uzT2/W+WfeEMyvRs1MPxf2L
 mSQqdPOoJ5RcKbxCw7CXWRcgiIIyR3Dn50i9XVz8dzeyeEpNTws/V+XwhQyRnC0Wf+fp
 JeqLDzUoxhyPo8be5zgE7OqUkm8LS+5pjQDU3yYHy/zlFPNrJ/JvLbc6qZiKjOGnXUhC
 +y2l6Wto0dAgznvgGqtOEEpNZBwAWmFtlhqO8tJMTGKn+ozktWRdVIAfulrjCE86HikN
 hMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NWAY7tZUF1UG+SLZWRn+ZIqqB2YoXxKZMPfN1jNqRDo=;
 b=dpp8Fpt3CoZSi4ic+fZG+XFBRKpWSl5tn0JA30XS8TlNh6RAj+VB1mxQk2WVhScmMm
 BC565dGEaFXEHnadsn5j7WAHjniMbHE3Q1eKzLaapsq6PRME3TI973YdE0fFq7SdC8Mb
 f1OS/AYiJPjQ1CKG/R8+vgt0b5VyEwCu3v7GmoOmm9Abi1/9KY0Kh5pgxkg35hIDTngx
 qqfE2GR8bC8aEnwgTzxEqG8CaD79+/pdzQQ1BLm7zv/6zUGW27ZCr3d1zP63+nEurjyE
 bWjrpMYUfRUYwzKCr/sO5DZo+E2IJfNPxPLAOiWVbVXdjuRq8VcIx0izl01FpZTrfGWu
 oKDw==
X-Gm-Message-State: AOAM530J2B/UA/+/fA+aUjvAL9FfjjrVvZPT/Unpih9djJi74eGFlnH6
 0jpPX81W4hzSqn3p2y43De0eJZ+tnz0=
X-Google-Smtp-Source: ABdhPJyPriwV3i+GNb/D7oKuQNk6znWZunUc1f6YUvUhh4OaJAOBj4eRkffplTI0Heu8OXzkBbw9YQ==
X-Received: by 2002:a65:4682:: with SMTP id h2mr15257812pgr.409.1629394766529; 
 Thu, 19 Aug 2021 10:39:26 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.8])
 by smtp.gmail.com with ESMTPSA id s2sm4061090pfw.193.2021.08.19.10.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 10:39:26 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/7] python/aqmp-tui: Add AQMP TUI draft
Date: Thu, 19 Aug 2021 23:08:27 +0530
Message-Id: <20210819173831.23515-4-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210819173831.23515-1-niteesh.gs@gmail.com>
References: <20210819173831.23515-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pf1-x42a.google.com
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

Also added type annotations and necessary pylint,
mypy configurations

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
---
 python/qemu/aqmp/aqmp_tui.py | 566 +++++++++++++++++++++++++++++++++++
 python/setup.cfg             |  15 +-
 2 files changed, 579 insertions(+), 2 deletions(-)
 create mode 100644 python/qemu/aqmp/aqmp_tui.py

diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
new file mode 100644
index 0000000000..12c9c4162a
--- /dev/null
+++ b/python/qemu/aqmp/aqmp_tui.py
@@ -0,0 +1,566 @@
+# Copyright (c) 2021
+#
+# Authors:
+#  Niteesh Babu G S <niteesh.gs@gmail.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+"""
+AQMP TUI
+
+AQMP TUI is an asynchronous interface built on top the of the AQMP library.
+It is the successor of QMP-shell and is bought-in as a replacement for it.
+
+Example Usage: aqmp-tui <SOCKET | TCP IP:PORT>
+Full Usage: aqmp-tui --help
+"""
+
+import argparse
+import asyncio
+import logging
+from logging import Handler, LogRecord
+import signal
+from typing import (
+    List,
+    Optional,
+    Tuple,
+    Type,
+    Union,
+    cast,
+)
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
+# The name of the signal that is used to update the history list
+UPDATE_MSG: str = 'UPDATE_MSG'
+
+
+def format_json(msg: str) -> str:
+    """
+    Formats given multi-line JSON message into a single-line message.
+    Converting into single line is more asthetically pleasing when looking
+    along with error messages.
+
+    Eg:
+    Input:
+          [ 1,
+            true,
+            3 ]
+    The above input is not a valid QMP message and produces the following error
+    "QMP message is not a JSON object."
+    When displaying this in TUI in multiline mode we get
+
+        [ 1,
+          true,
+          3 ]: QMP message is not a JSON object.
+
+    whereas in singleline mode we get the following
+
+        [1, true, 3]: QMP message is not a JSON object.
+
+    The single line mode is more asthetically pleasing.
+
+    :param msg:
+        The message to formatted into single line.
+
+    :return: Formatted singleline message.
+
+    NOTE: We cannot use the JSON module here because it is only capable of
+    format valid JSON messages. But here the goal is to also format invalid
+    JSON messages.
+    """
+    msg = msg.replace('\n', '')
+    words = msg.split(' ')
+    words = [word for word in words if word != '']
+    return ' '.join(words)
+
+
+def has_tui_handler(logger: logging.Logger,
+                    handler_type: Type[Handler]) -> bool:
+    """
+    The Logger class has no interface to check if a certain type of handler is
+    installed or not. So we provide an interface to do so.
+
+    :param logger:
+        Logger object
+    :param handler_type:
+        The type of the handler to be checked.
+
+    :return: returns True if handler of type `handler_type` is installed else
+             False.
+    """
+    handlers = logger.handlers
+    for handler in handlers:
+        if isinstance(handler, handler_type):
+            return True
+    return False
+
+
+class App(QMPClient):
+    """
+    Implements the AQMP TUI.
+
+    Initializes the widgets and starts the urwid event loop.
+    """
+    def __init__(self, address: Union[str, Tuple[str, int]]) -> None:
+        """
+        Initializes the TUI.
+
+        :param address:
+            Address of the server to connect to.
+        """
+        urwid.register_signal(type(self), UPDATE_MSG)
+        self.window = Window(self)
+        self.address = address
+        self.aloop: Optional[asyncio.AbstractEventLoop] = None
+        super().__init__()
+
+    def add_to_history(self, msg: str, level: Optional[str] = None) -> None:
+        """
+        Appends the msg to the history list.
+
+        :param msg:
+            The raw message to be appended in string type.
+        """
+        urwid.emit_signal(self, UPDATE_MSG, msg, level)
+
+    def _cb_outbound(self, msg: Message) -> Message:
+        """
+        Callback: outbound message hook.
+
+        Appends the outgoing messages to the history box.
+
+        :param msg: raw outbound message.
+        :return: final outbound message.
+        """
+        str_msg = str(msg)
+
+        if not has_tui_handler(logging.getLogger(), TUILogHandler):
+            logging.debug('Request: %s', str_msg)
+        self.add_to_history('<-- ' + str_msg)
+        return msg
+
+    def _cb_inbound(self, msg: Message) -> Message:
+        """
+        Callback: outbound message hook.
+
+        Appends the incoming messages to the history box.
+
+        :param msg: raw inbound message.
+        :return: final inbound message.
+        """
+        str_msg = str(msg)
+
+        if not has_tui_handler(logging.getLogger(), TUILogHandler):
+            logging.debug('Request: %s', str_msg)
+        self.add_to_history('--> ' + str_msg)
+        return msg
+
+    def handle_event(self, event: Message) -> None:
+        """
+        Handles the event.
+
+        :param event:
+            The event to be handled.
+        """
+        # TODO: Consider all states present in qapi/run-state.json
+        if event['event'] == 'SHUTDOWN':
+            self._set_status('[Server Shutdown]')
+
+    async def wait_for_events(self) -> None:
+        """
+        This coroutine continously waits for events and dispatches them.
+        """
+        async for event in self.events:
+            self.handle_event(event)
+
+    async def _send_to_server(self, msg: Message) -> None:
+        """
+        This coroutine sends the message to the server.
+        The message has to be pre-validated.
+
+        :param msg:
+            Pre-validated message to be to sent to the server.
+
+        :raise Exception: When an unhandled exception is caught.
+        """
+        try:
+            await self._raw(msg, assign_id='id' not in msg)
+        except ExecInterruptedError:
+            logging.info('Error server disconnected before reply')
+            self.add_to_history('Server disconnected before reply', 'ERROR')
+            self._set_status("[Server Disconnected]")
+        except Exception as err:
+            logging.error('Exception from _send_to_server: %s', str(err))
+            raise err
+
+    def cb_send_to_server(self, raw_msg: str) -> None:
+        """
+        Validates and sends the message to the server.
+        The raw string message is first converted into a Message object
+        and is then sent to the server.
+
+        :param raw_msg:
+            The raw string message to be sent to the server.
+
+        :raise Exception: When an unhandled exception is caught.
+        """
+        try:
+            raw_msg = format_json(raw_msg)
+            msg = Message(bytes(raw_msg, encoding='utf-8'))
+            create_task(self._send_to_server(msg))
+        except (ValueError, TypeError) as err:
+            logging.info('Invalid message: %s', str(err))
+            self.add_to_history(f'{raw_msg}: {err}')
+        except (DeserializationError, UnexpectedTypeError) as err:
+            logging.info('Invalid message: %s', err.error_message)
+            self.add_to_history(f'{raw_msg}: {err.error_message}')
+
+    def unhandled_input(self, key: str) -> None:
+        """
+        Handle's keys which haven't been handled by the child widgets.
+
+        :param key:
+            Unhandled key
+        """
+        if key == 'esc':
+            self.kill_app()
+
+    def kill_app(self) -> None:
+        """
+        Initiates killing of app. A bridge between asynchronous and synchronous
+        code.
+        """
+        create_task(self._kill_app())
+
+    async def _kill_app(self) -> None:
+        """
+        This coroutine initiates the actual disconnect process and calls
+        urwid.ExitMainLoop() to kill the TUI.
+
+        :raise Exception: When an unhandled exception is caught.
+        """
+        # It is ok to call disconnect even in disconnect state
+        try:
+            await self.disconnect()
+            logging.debug('Disconnect finished. Exiting app')
+        except EOFError:
+            # We receive an EOF during disconnect, ignore that
+            pass
+        except Exception as err:
+            logging.info('_kill_app: %s', str(err))
+            # Let the app crash after providing a proper stack trace
+            raise err
+        raise urwid.ExitMainLoop()
+
+    def _set_status(self, msg: str) -> None:
+        """
+        Sets the message as the status.
+
+        :param msg:
+            The message to be displayed in the status bar.
+        """
+        self.window.footer.set_text(msg)
+
+    def _get_formatted_address(self) -> str:
+        """
+        Returns a formatted version of the server's address.
+
+        :return: formatted address
+        """
+        if isinstance(self.address, tuple):
+            host, port = self.address
+            addr = f'{host}:{port}'
+        else:
+            addr = f'{self.address}'
+        return addr
+
+    async def connect_server(self) -> None:
+        """
+        Initiates a connection to the server at address `self.address`
+        and in case of a failure, sets the status to the respective error.
+        """
+        try:
+            await self.connect(self.address)
+            addr = self._get_formatted_address()
+            self._set_status(f'Connected to {addr}')
+        except ConnectError as err:
+            logging.info('connect_server: ConnectError %s', str(err))
+            self._set_status(f'[ConnectError: {err.error_message}]')
+
+    def run(self, debug: bool = False) -> None:
+        """
+        Starts the long running co-routines and the urwid event loop.
+
+        :param debug:
+            Enables/Disables asyncio event loop debugging
+        """
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
+            logging.error('%s\n%s\n', str(err), pretty_traceback())
+            raise err
+
+
+class StatusBar(urwid.Text):
+    """
+    A simple statusbar modelled using the Text widget. The status can be
+    set using the set_text function. All text set is aligned to right.
+    """
+    def __init__(self, text: str = ''):
+        super().__init__(text, align='right')
+
+
+class Editor(urwid_readline.ReadlineEdit):
+    """
+    A simple editor modelled using the urwid_readline.ReadlineEdit widget.
+    Mimcs GNU readline shortcuts and provides history support.
+
+    The readline shortcuts can be found below:
+    https://github.com/rr-/urwid_readline#features
+
+    Along with the readline features, this editor also has support for
+    history. Pressing the 'up' arrow key with empty message box, lists the
+    previous message inplace.
+
+    Currently there is no support to save the history to a file. The history of
+    previous commands is lost on exit.
+    """
+    def __init__(self, master: App) -> None:
+        """
+        Initializes the editor widget
+
+        :param master: Reference to the TUI object.
+        """
+        super().__init__(caption='> ', multiline=True)
+        self.master = master
+        self.history: List[str] = []
+        self.last_index: int = -1
+        self.show_history: bool = False
+
+    def keypress(self, size: Tuple[int, int], key: str) -> Optional[str]:
+        """
+        Handles the keypress on this widget.
+
+        :param size:
+            The current size of the widget.
+        :param key:
+            The key to be handled.
+
+        :return: Unhandled key if any.
+        """
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
+            return cast(Optional[str], super().keypress(size, key))
+        return None
+
+
+class EditorWidget(urwid.Filler):
+    """
+    The Editor is a flow widget and has to wrapped inside a box widget.
+    This class wraps the Editor inside filler widget.
+    """
+    def __init__(self, master: App) -> None:
+        super().__init__(Editor(master), valign='top')
+
+
+class HistoryBox(urwid.ListBox):
+    """
+    This widget is modelled using the ListBox widget, contains the list of
+    all messages both QMP messages and log messsages to be shown in the TUI.
+
+    The messages are urwid.Text widgets. On every append of a message, the
+    focus is shifted to the last appended message.
+    """
+    def __init__(self, master: App) -> None:
+        """
+        Initializes the historybox widget
+
+        :param master: Reference to the TUI object.
+        """
+        self.master = master
+        self.history = urwid.SimpleFocusListWalker([])
+        super().__init__(self.history)
+
+    def add_to_history(self, history: str) -> None:
+        """
+        Appends a message to the list and set the focus to the last appended
+        message.
+
+        :param history:
+            The history item(message/event) to be appended to the list.
+        """
+        self.history.append(urwid.Text(history))
+        if self.history:
+            self.history.set_focus(len(self.history) - 1)
+
+
+class HistoryWindow(urwid.Frame):
+    """
+    This window composes the HistoryBox and EditorWidget in a horizontal split.
+    By default the first focus is given to the history box.
+    """
+    def __init__(self, master: App) -> None:
+        """
+        Initializes this widget and its child widgets.
+
+        :param master: Reference to the TUI object.
+        """
+        self.master = master
+        self.editor_widget = EditorWidget(master)
+        self.editor = urwid.LineBox(self.editor_widget)
+        self.history = HistoryBox(master)
+        self.body = urwid.Pile([('weight', 80, self.history),
+                                ('weight', 20, self.editor)])
+        super().__init__(self.body)
+        urwid.connect_signal(self.master, UPDATE_MSG, self.cb_add_to_history)
+
+    def cb_add_to_history(self, msg: str, level: Optional[str] = None) -> None:
+        """
+        Appends a message to the history box
+
+        :param msg:
+            The message to be appended to the history box.
+        """
+        if level:
+            msg = f'[{level}]: {msg}'
+        self.history.add_to_history(msg)
+
+
+class Window(urwid.Frame):
+    """
+    This window is the top most widget of the TUI and will contain other
+    windows. Each window is responsible for displaying a specific
+    functionality.
+    For eg: The history window is responsible for showing the history of
+    messages and the editor.
+    """
+    def __init__(self, master: App) -> None:
+        """
+        Initializes this widget and its child windows.
+
+        :param master: Reference to the TUI object.
+        """
+        self.master = master
+        footer = StatusBar()
+        body = HistoryWindow(master)
+        super().__init__(body, footer=footer)
+
+
+class TUILogHandler(Handler):
+    """
+    This handler routes all the log messages to the TUI screen.
+    It is installed to the root logger to so that the log message from all
+    libraries begin used is routed to the screen.
+    """
+    def __init__(self, tui: App) -> None:
+        """
+        Initializes the handler class.
+
+        :param tui:
+            Reference to the TUI object.
+        """
+        super().__init__()
+        self.tui = tui
+
+    def emit(self, record: LogRecord) -> None:
+        """
+        Emits a record to the TUI screen.
+
+        Appends the log message to the TUI screen
+        """
+        level = record.levelname
+        msg = record.getMessage()
+        self.tui.add_to_history(msg, level)
+
+
+def main() -> None:
+    """
+    Driver of the whole script, parses arguments, initialize the TUI and
+    the logger.
+    """
+    parser = argparse.ArgumentParser(description='AQMP TUI')
+    parser.add_argument('qmp_server', help='Address of the QMP server. '
+                        'Format <UNIX socket path | TCP addr:port>')
+    parser.add_argument('--log-file', help='The Log file name')
+    parser.add_argument('--log-level', default='WARNING',
+                        help='Log level <CRITICAL|ERROR|WARNING|INFO|DEBUG|>')
+    parser.add_argument('--asyncio-debug', action='store_true',
+                        help='Enable debug mode for asyncio loop. '
+                        'Generates lot of output, makes TUI unusable when '
+                        'logs are logged in the TUI. '
+                        'Use only when logging to a file.')
+    args = parser.parse_args()
+
+    try:
+        address = QEMUMonitorProtocol.parse_address(args.qmp_server)
+    except QMPBadPortError as err:
+        parser.error(str(err))
+
+    app = App(address)
+
+    root_logger = logging.getLogger()
+    root_logger.setLevel(logging.getLevelName(args.log_level))
+
+    if args.log_file:
+        root_logger.addHandler(logging.FileHandler(args.log_file))
+    else:
+        root_logger.addHandler(TUILogHandler(app))
+
+    app.run(args.asyncio_debug)
+
+
+if __name__ == '__main__':
+    main()
diff --git a/python/setup.cfg b/python/setup.cfg
index a0ed3279d8..1ff2b907a2 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -81,8 +81,19 @@ namespace_packages = True
 # fusepy has no type stubs:
 allow_subclassing_any = True
 
+[mypy-qemu.aqmp.aqmp_tui]
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
@@ -97,7 +108,7 @@ ignore_missing_imports = True
 # --disable=W".
 disable=too-many-function-args,  # mypy handles this with less false positives.
         no-member,  # mypy also handles this better.
-        missing-docstring, # FIXME
+        # missing-docstring, # FIXME
         fixme, # FIXME
 
 [pylint.basic]
-- 
2.17.1


