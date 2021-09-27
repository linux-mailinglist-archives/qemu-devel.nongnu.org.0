Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC309419FA0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 21:58:32 +0200 (CEST)
Received: from localhost ([::1]:49830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUwlj-0001ZJ-IL
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 15:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mUwK2-00004x-93
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 15:29:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mUwK0-0000iC-N6
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 15:29:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632770991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JL+C+AZDaSlwYX3+M6yNwQ36iegdKO/Cb3wY3qCaz0g=;
 b=bMH/o6FrU+g4wTOsmxj/mweY4ZUY8tM30YKLH70zI417jaLFqVXZO+Y38JZTEGqWvPxVvv
 h6RfKHJtG8FybFgwc5AacMicLf6yWVYQ25PTIgsD+TdlBIxL9IrKQSozXduDKP1lkojr2q
 G1R98kd9Y1CRaKI8xo4XKBdmCDDLGXw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-Fkc1Ibo3OLO1DA5F29q9ig-1; Mon, 27 Sep 2021 15:29:50 -0400
X-MC-Unique: Fkc1Ibo3OLO1DA5F29q9ig-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFF861005E53;
 Mon, 27 Sep 2021 19:29:48 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EB6A60871;
 Mon, 27 Sep 2021 19:29:38 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/32] python/aqmp-tui: Add syntax highlighting
Date: Mon, 27 Sep 2021 15:25:13 -0400
Message-Id: <20210927192513.744199-33-jsnow@redhat.com>
In-Reply-To: <20210927192513.744199-1-jsnow@redhat.com>
References: <20210927192513.744199-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 G S Niteesh Babu <niteesh.gs@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: G S Niteesh Babu <niteesh.gs@gmail.com>

Add syntax highlighting for the incoming and outgoing QMP messages.
This is achieved using the pygments module which was added in a
previous commit.

The current implementation is a really simple one which doesn't
allow for any configuration. In future this has to be improved
to allow for easier theme config using an external config of
some sort.

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
Message-Id: <20210823220746.28295-6-niteesh.gs@gmail.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/aqmp_tui.py | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
index ac533541d2f..a2929f771cf 100644
--- a/python/qemu/aqmp/aqmp_tui.py
+++ b/python/qemu/aqmp/aqmp_tui.py
@@ -30,6 +30,8 @@
     cast,
 )
 
+from pygments import lexers
+from pygments import token as Token
 import urwid
 import urwid_readline
 
@@ -45,6 +47,22 @@
 UPDATE_MSG: str = 'UPDATE_MSG'
 
 
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
     Formats valid/invalid multi-line JSON message into a single-line message.
@@ -353,6 +371,9 @@ def run(self, debug: bool = False) -> None:
         :param debug:
             Enables/Disables asyncio event loop debugging
         """
+        screen = urwid.raw_display.Screen()
+        screen.set_terminal_properties(256)
+
         self.aloop = asyncio.get_event_loop()
         self.aloop.set_debug(debug)
 
@@ -364,6 +385,8 @@ def run(self, debug: bool = False) -> None:
         event_loop = urwid.AsyncioEventLoop(loop=self.aloop)
         main_loop = urwid.MainLoop(urwid.AttrMap(self.window, 'background'),
                                    unhandled_input=self.unhandled_input,
+                                   screen=screen,
+                                   palette=palette,
                                    handle_mouse=True,
                                    event_loop=event_loop)
 
@@ -487,7 +510,8 @@ def __init__(self, parent: App) -> None:
         self.history = urwid.SimpleFocusListWalker([])
         super().__init__(self.history)
 
-    def add_to_history(self, history: str) -> None:
+    def add_to_history(self,
+                       history: Union[str, List[Tuple[str, str]]]) -> None:
         """
         Appends a message to the list and set the focus to the last appended
         message.
@@ -531,10 +555,18 @@ def cb_add_to_history(self, msg: str, level: Optional[str] = None) -> None:
 
         :param msg:
             The message to be appended to the history box.
+        :param level:
+            The log level of the message, if it is a log message.
         """
+        formatted = []
         if level:
             msg = f'[{level}]: {msg}'
-        self.history.add_to_history(msg)
+            formatted.append((level, msg))
+        else:
+            lexer = lexers.JsonLexer()  # pylint: disable=no-member
+            for token in lexer.get_tokens(msg):
+                formatted.append(token)
+        self.history.add_to_history(formatted)
 
 
 class Window(urwid.Frame):
-- 
2.31.1


