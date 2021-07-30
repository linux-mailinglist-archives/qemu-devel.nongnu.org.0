Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C77AC3DBFC8
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 22:25:48 +0200 (CEST)
Received: from localhost ([::1]:47984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Z4l-0003Al-Qt
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 16:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m9Yye-0005B2-TW
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:19:28 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:45924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m9Yyd-000121-0u
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:19:28 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso15972588pjf.4
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 13:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7JX3P4ngjaa3qz3zAmkSBrtNTj8wTbnHCG7iT7l/iY0=;
 b=K5zyY4OuZVT4kvWoeFIqV73wW8IXlknaTVgxBQlrTZEINjdOMd3IamNsTpTtBY/dpi
 nMSUTIqs7icQ7tihaNnKwmBZD7b4I+bApQAJb38qwmHTEqe5tvF6QGuDl7lxZCnexo4o
 jw6sIia6Gq/Cak8GQmvcq/U8n4+m74GFEbEUHawSo/ZxzXV2zHUDCS2EiSngd+lZD120
 TRrTWasE+f50rkCrfTkJIPKL0kQqcORCz1d2fRQeTJUfZCJk7QrYHDoNQEl38lGMb0S0
 vJ82SZTlhoh4Ysmgm9c6WnTj3ErciackPW59kdgSVoUh2TmgLZFKni9cRBnuztZtMg32
 G0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7JX3P4ngjaa3qz3zAmkSBrtNTj8wTbnHCG7iT7l/iY0=;
 b=kX8CMvtQjzxQhB04KhfUwkn/nWUzlqd7Ur9szbFNcDxqbMWFQ5zXCTL07YALQgNx1J
 V4YnGNX00uXW8q+lTa2B3EZY5FZZtI5kirQKqBjlFH9duGlVtAaWMbOCjjgATA6T78lc
 OjPRwpLoFv+qNvgG9CLYj7fgMpipOiSmfO2T9DM61C9A6mxpjZHuizJI+ySVW2CK3vur
 ftUjrxS+uZXffBBmZd0JobU/X0N4wuMyRHP4N04vPLRbrg1IDzndJlT77jkVX9JVYqFj
 EEUBQm2Jo/oefOBn6k+RGXAgb/AYftmIeqCAfimcWUJXddvLXRYc3IOvp8I2uwSnIirS
 kQyw==
X-Gm-Message-State: AOAM533HzS8KBwBMfM1idjuRDtSxDlNh8lgGt9o94nJg/3173A+RjT/1
 k8pQVBZ1nEkA8vOQixxKpSV7Z6iwOOm1UA==
X-Google-Smtp-Source: ABdhPJwEGvbX1TFEEAPFnzapFgjx+9D/hrnCIz7f05RdWj8ofgEsfSrz5RSaZ612880t0HOAqJzYHQ==
X-Received: by 2002:a62:8fd4:0:b029:3af:3fa7:c993 with SMTP id
 n203-20020a628fd40000b02903af3fa7c993mr3579812pfd.77.1627676365620; 
 Fri, 30 Jul 2021 13:19:25 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.243])
 by smtp.gmail.com with ESMTPSA id s50sm3256842pfw.212.2021.07.30.13.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 13:19:25 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/13] python/aqmp-tui: add syntax highlighting
Date: Sat, 31 Jul 2021 01:48:41 +0530
Message-Id: <20210730201846.5147-9-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210730201846.5147-1-niteesh.gs@gmail.com>
References: <20210730201846.5147-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pj1-x1035.google.com
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

Add syntax highlighting for the incoming and outgoing QMP messages.
This is achieved using the pygments module which was added in a
previous commit.

The current implementation is a really simple one which doesn't
allow for any configuration. In future this has to be improved
to allow for easier theme config using an external config of
some sort.

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
---
 python/qemu/aqmp/aqmp_tui.py | 52 +++++++++++++++++++++++++++---------
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
index ab9ada793a..0d5ec62cb7 100644
--- a/python/qemu/aqmp/aqmp_tui.py
+++ b/python/qemu/aqmp/aqmp_tui.py
@@ -19,6 +19,8 @@
     Union,
 )
 
+from pygments import lexers
+from pygments import token as Token
 import urwid
 import urwid_readline
 
@@ -35,6 +37,22 @@
 LOGGER = logging.getLogger()
 
 
+palette = [
+    (Token.Punctuation, '', '', '', 'h15,bold', 'g7'),
+    (Token.Text, '', '', '', '', 'g7'),
+    (Token.Name.Tag, '', '', '', 'bold,#f88', 'g7'),
+    (Token.Literal.Number.Integer, '', '', '', '#fa0', 'g7'),
+    (Token.Literal.String.Double, '', '', '', '#6f6', 'g7'),
+    (Token.Keyword.Constant, '', '', '', '#6af', 'g7'),
+    ('DEBUG', '', '', '', '#ddf', 'g7'),
+    ('INFO', '', '', '', 'g100', 'g7'),
+    ('WARNING', '', '', '', '#ff6', 'g7'),
+    ('ERROR', '', '', '', '#a00', 'g7'),
+    ('CRITICAL', '', '', '', '#a00', 'g7'),
+    ('background', '', 'black', '', '', 'g7'),
+]
+
+
 def format_json(msg: str) -> str:
     """
     Formats given multiline JSON message into a single line message.
@@ -57,17 +75,14 @@ def __init__(self, address: Union[str, Tuple[str, int]]) -> None:
         self.aloop: Optional[Any] = None  # FIXME: Use more concrete type.
         super().__init__()
 
-    def add_to_history(self, msg: str) -> None:
-        urwid.emit_signal(self, UPDATE_MSG, msg)
+    def add_to_history(self, msg: str, level: Optional[str] = None) -> None:
+        urwid.emit_signal(self, UPDATE_MSG, msg, level)
 
     def _cb_outbound(self, msg: Message) -> Message:
         # FIXME: I think the ideal way to omit these messages during in-TUI
-        # logging will be to add a filter to the logger. We can use regex to
-        # filter out messages starting with 'Request:' or 'Response:' but I
-        # think a better approach will be encapsulate the message in an object
-        # and filter based on the object. Encapsulation of the message will
-        # also be necessary when we want different formatting of messages
-        # inside TUI.
+        # logging will be to add a filter to the logger. We can use
+        # regex/startswith to filter out messages starting with 'Request:' or
+        # 'Response:'. If possible please suggest other ideas.
         handler = LOGGER.handlers[0]
         if not isinstance(handler, TUILogHandler):
             LOGGER.debug('Request: %s', str(msg))
@@ -156,6 +171,9 @@ def _get_formatted_address(self) -> str:
             self._set_status('Server shutdown')
 
     def run(self, debug: bool = False) -> None:
+        screen = urwid.raw_display.Screen()
+        screen.set_terminal_properties(256)
+
         self.aloop = asyncio.get_event_loop()
         self.aloop.set_debug(debug)
 
@@ -167,6 +185,8 @@ def run(self, debug: bool = False) -> None:
         event_loop = urwid.AsyncioEventLoop(loop=self.aloop)
         main_loop = urwid.MainLoop(urwid.AttrMap(self.window, 'background'),
                                    unhandled_input=self.unhandled_input,
+                                   screen=screen,
+                                   palette=palette,
                                    handle_mouse=True,
                                    event_loop=event_loop)
 
@@ -251,7 +271,8 @@ def __init__(self, master: App) -> None:
         self.history = urwid.SimpleFocusListWalker([])
         super().__init__(self.history)
 
-    def add_to_history(self, history: str) -> None:
+    def add_to_history(self,
+                       history: Union[str, List[Tuple[str, str]]]) -> None:
         self.history.append(urwid.Text(history))
         if self.history:
             self.history.set_focus(len(self.history) - 1)
@@ -271,8 +292,15 @@ def __init__(self, master: App) -> None:
         super().__init__(self.body)
         urwid.connect_signal(self.master, UPDATE_MSG, self.cb_add_to_history)
 
-    def cb_add_to_history(self, msg: str) -> None:
-        self.history.add_to_history(msg)
+    def cb_add_to_history(self, msg: str, level: Optional[str] = None) -> None:
+        formatted = []
+        if level:
+            formatted.append((level, msg))
+        else:
+            lexer = lexers.JsonLexer()  # pylint: disable=no-member
+            for token in lexer.get_tokens(msg):
+                formatted.append(token)
+        self.history.add_to_history(formatted)
 
 
 class Window(urwid.Frame):
@@ -298,7 +326,7 @@ def emit(self, record: LogRecord) -> None:
         level = record.levelname
         msg = record.getMessage()
         msg = f'[{level}]: {msg}'
-        self.tui.add_to_history(msg)
+        self.tui.add_to_history(msg, level)
 
 
 def main() -> None:
-- 
2.17.1


