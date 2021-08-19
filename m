Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B4D3F1F5E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 19:47:39 +0200 (CEST)
Received: from localhost ([::1]:39036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGm8g-0005q9-QP
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 13:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mGm16-0003Ym-Dz
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 13:39:48 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:33733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mGm14-0000yf-Kr
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 13:39:48 -0400
Received: by mail-pf1-x435.google.com with SMTP id w68so6166139pfd.0
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 10:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ohg0RB/7GAQ6fdsZqyzTEEb3r+rqjjQ4s2JLAWGkK68=;
 b=fdo3tfUnju0m4Bl4rqaM/XawzhA0Lh5yTW7thFr0e4UY9AcELDaiezFL3vWkEnxgxh
 Sd9tS5GbyBXY3j2bw+uhSAXerhGyEL0YQ1Mxn0pnUak3HRKAbbSyaXk3vdWmXjP1aDIn
 MIbjyjXVq1aXhGBuMk4sVGd1m/ofzqhR2Sl4EmYexxge9pItHgJQ4lZ01RWHEIL+i4Lx
 Fi0c6Q9ygyOAEs644MzfQ8gA/mGvk5ZlTYo1Tj1AENx3Oo11X0mNTDlSrfgUBYM4T+Up
 GyUyOYmMb75H1lDc4TPBrKZ9jUs6mYet86eRonx1RVkshByHJtuWjdSwazlAlypur1gA
 LTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ohg0RB/7GAQ6fdsZqyzTEEb3r+rqjjQ4s2JLAWGkK68=;
 b=K9Lq8z3HiXAYnUTG+eg0DMpys8St+97jyuVGGG0tp/9EzSzZt99wGV1zz0mMtUMaqc
 PZGj0dHEesmHuFAHeRTYQq28aSrs7DN9XPktec7KBrtiQ1eKxCB99tQKB2kpyeDBMvJU
 3UrBhcy2RxaoZsYHK0bs09r6AOVFy6d9hm6n9/U1W5sBb4TPAe9rxDbRKhfCHjOUuKz5
 gqIPaIEksSrWZPAXT2iFw9dWO6ujDSWJbYVvPBqeTtqI3syhIi7Q/5Y/lod/SPumFzbk
 zZu1NGVEwwJGO4NX127wH8iLFFi5PD1Wd4crz/hz+2eG3n573pSH8GSAuRZvwOFM09Cs
 rhyA==
X-Gm-Message-State: AOAM531A6J9jmnodq06icdbMwuDms++il4vbpgeMn9mewSPWCFu4lkp/
 kCJpzkK8h6kmLuqmErBKZ5vlbZKQrEw=
X-Google-Smtp-Source: ABdhPJwiN4ObDicDtpSgeXtF5YcQ6FADvHvexJ7HE9P22EXtSHL/YAa44Fp5hFBbwLnle/8wcNjXvw==
X-Received: by 2002:a63:5f15:: with SMTP id t21mr15075767pgb.391.1629394785077; 
 Thu, 19 Aug 2021 10:39:45 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.8])
 by smtp.gmail.com with ESMTPSA id s2sm4061090pfw.193.2021.08.19.10.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 10:39:44 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 6/7] python/aqmp-tui: Add syntax highlighting
Date: Thu, 19 Aug 2021 23:08:30 +0530
Message-Id: <20210819173831.23515-7-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210819173831.23515-1-niteesh.gs@gmail.com>
References: <20210819173831.23515-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pf1-x435.google.com
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
index 12c9c4162a..03d4808acd 100644
--- a/python/qemu/aqmp/aqmp_tui.py
+++ b/python/qemu/aqmp/aqmp_tui.py
@@ -29,6 +29,8 @@
     cast,
 )
 
+from pygments import lexers
+from pygments import token as Token
 import urwid
 import urwid_readline
 
@@ -43,6 +45,22 @@
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
@@ -303,6 +321,9 @@ def run(self, debug: bool = False) -> None:
         :param debug:
             Enables/Disables asyncio event loop debugging
         """
+        screen = urwid.raw_display.Screen()
+        screen.set_terminal_properties(256)
+
         self.aloop = asyncio.get_event_loop()
         self.aloop.set_debug(debug)
 
@@ -314,6 +335,8 @@ def run(self, debug: bool = False) -> None:
         event_loop = urwid.AsyncioEventLoop(loop=self.aloop)
         main_loop = urwid.MainLoop(urwid.AttrMap(self.window, 'background'),
                                    unhandled_input=self.unhandled_input,
+                                   screen=screen,
+                                   palette=palette,
                                    handle_mouse=True,
                                    event_loop=event_loop)
 
@@ -434,7 +457,8 @@ def __init__(self, master: App) -> None:
         self.history = urwid.SimpleFocusListWalker([])
         super().__init__(self.history)
 
-    def add_to_history(self, history: str) -> None:
+    def add_to_history(self,
+                       history: Union[str, List[Tuple[str, str]]]) -> None:
         """
         Appends a message to the list and set the focus to the last appended
         message.
@@ -473,10 +497,18 @@ def cb_add_to_history(self, msg: str, level: Optional[str] = None) -> None:
 
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


