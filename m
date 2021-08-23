Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FA23F4E79
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 18:37:23 +0200 (CEST)
Received: from localhost ([::1]:43282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mICws-00019m-7q
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 12:37:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mICrA-000137-Vv
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:31:29 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:38810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mICr9-0008Nc-42
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:31:28 -0400
Received: by mail-pl1-x634.google.com with SMTP id a5so10486256plh.5
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 09:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=blFucbeqswjEJGA2DwljHA8w43+SFZPeBTr6pc869JU=;
 b=iFi5ApxHqbNCAE1zkuguQj7GTwvTZ4C5nuw4DFl9Q9oKFCWhtouvFJP3WJsGpoYW/a
 QZFg8N5AtzZJews6KoUG02wYHpoaTrBZE+5tF9FArXD6Nsq1Bc5/Kho93CqF1duiR4jM
 arr/3WcOWe8VHCzA/qWR1uM55DjHPTq/aEb125ez7C8KpQtLbJHd/1XCgFw3ohFeQvGB
 ivE0UNv7DG9O8IuVtkraHFq5p+cklZdYcfMYK9N6yEI0eAoB2eElfST2cz9gtHDIAesw
 ERxKR+jeNXeJhTKQ9vio109tLnQD/mSVkyZeCR+cfP5eUspum+sSIl9MIXMPAiV+yscg
 p8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=blFucbeqswjEJGA2DwljHA8w43+SFZPeBTr6pc869JU=;
 b=Er/QLZq4tPDTcGrcxV2iY2nVDxZEfusiVcfWbA0PTlqoui3oN0n57zQLjPCq1QvL6w
 kzsd6OkuF/p6ehi1rmmbePatit+/IIx+G4e4N/ecAO71Ln3DMD99mJcuFnadfqhGIUNx
 Ryayo7pnmekixWSd1H8Cbqw6VB49sru76AXeqJ+C/mOMtrUg5SZTJzlXv1mxClofDqn5
 UFlbq2x4FSKba+C1/7Th4kySa9v2kzbvJHcU+Hnx8dyuuYM0CBRSX1p/J6q2JX8o2uPK
 fKCS7E/nBseRr1FEskKNtpUwyAW3MtsZxu4qRCFykam1pfU4wSC9bbSTumUcaNul0VkE
 8XjQ==
X-Gm-Message-State: AOAM530wMeT4duMyRvmL5VsePgX86FBwRoAwsydjF2YiDams5AFDhElv
 5m345ocNTXPq6iV8q18SHbG29rPrchY=
X-Google-Smtp-Source: ABdhPJwXKghFjp5OgwShXKw6bDFkcdqzCTJ7HCLxOZNrUmNxI6b+/h2OTI5Mzp8NPDfDc3gC6D0g1Q==
X-Received: by 2002:a17:902:fe81:b0:133:851e:5923 with SMTP id
 x1-20020a170902fe8100b00133851e5923mr7591743plm.25.1629736285521; 
 Mon, 23 Aug 2021 09:31:25 -0700 (PDT)
Received: from localhost.localdomain ([120.138.13.180])
 by smtp.gmail.com with ESMTPSA id x19sm16371243pfa.104.2021.08.23.09.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 09:31:25 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 5/5] python/aqmp-tui: Add syntax highlighting
Date: Mon, 23 Aug 2021 21:59:38 +0530
Message-Id: <20210823162938.32757-6-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210823162938.32757-1-niteesh.gs@gmail.com>
References: <20210823162938.32757-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pl1-x634.google.com
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
 python/qemu/aqmp/aqmp_tui.py | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
index d3180e38bf..9b28eebb90 100644
--- a/python/qemu/aqmp/aqmp_tui.py
+++ b/python/qemu/aqmp/aqmp_tui.py
@@ -29,6 +29,8 @@
     cast,
 )
 
+from pygments import lexers
+from pygments import token as Token
 import urwid
 import urwid_readline
 
@@ -44,6 +46,22 @@
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
     Formats given multi-line JSON message into a single-line message.
@@ -359,6 +377,9 @@ def run(self, debug: bool = False) -> None:
         :param debug:
             Enables/Disables asyncio event loop debugging
         """
+        screen = urwid.raw_display.Screen()
+        screen.set_terminal_properties(256)
+
         self.aloop = asyncio.get_event_loop()
         self.aloop.set_debug(debug)
 
@@ -370,6 +391,8 @@ def run(self, debug: bool = False) -> None:
         event_loop = urwid.AsyncioEventLoop(loop=self.aloop)
         main_loop = urwid.MainLoop(urwid.AttrMap(self.window, 'background'),
                                    unhandled_input=self.unhandled_input,
+                                   screen=screen,
+                                   palette=palette,
                                    handle_mouse=True,
                                    event_loop=event_loop)
 
@@ -493,7 +516,8 @@ def __init__(self, parent: App) -> None:
         self.history = urwid.SimpleFocusListWalker([])
         super().__init__(self.history)
 
-    def add_to_history(self, history: str) -> None:
+    def add_to_history(self,
+                       history: Union[str, List[Tuple[str, str]]]) -> None:
         """
         Appends a message to the list and set the focus to the last appended
         message.
@@ -541,10 +565,18 @@ def cb_add_to_history(self, msg: str, level: Optional[str] = None) -> None:
 
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
2.17.1


