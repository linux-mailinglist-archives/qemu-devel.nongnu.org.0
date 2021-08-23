Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 716503F5367
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 00:36:19 +0200 (CEST)
Received: from localhost ([::1]:34164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIIYD-0007jY-OX
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 18:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mIIXL-0006y1-77
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 18:35:23 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:39666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mIIXJ-0005D7-J3
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 18:35:22 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 m7-20020a9d4c87000000b0051875f56b95so40624715otf.6
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 15:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=R7ktUvg5r97nqSMVHOdi3lwmVaZWSTvCueL6N3SYN8o=;
 b=kqCnqin+6I/mh/JGuUuzbVUBFlLr4wnpzHKRzNFIK2glFr3STJzQpf+t3GPsymjWhs
 iT/d+SKe7G7MIumMzG9M+7FrOTiw56riZFEVMxgcoybvIAe/+D1ebCvrCAH3FSFMb4yo
 dZKR4qKTxXQddBsuR6O2VEPqUvRV11BdVyOm3ssBVx7Lngdj0xMhUslNz3ywkJpGGYbc
 Cdz2jmowDYnyTDx7kUmmSHymqtvyaTndNpwFRzFMFxKoYWwx6SuMBGhk/P1a0C7oI0sg
 SPo7jhlY9WokSjcWrpYV+S3Ykk6jcv0Idfx8YyUzPUSJSjLnWUeqly3Pu7kap1bdc1Jc
 Vgyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=R7ktUvg5r97nqSMVHOdi3lwmVaZWSTvCueL6N3SYN8o=;
 b=DhjHPFig1ze4kJjkburP8IWZwYKBBmfXje/Pp62Q5Onqrt35OUmWqKIgBIoaxEx0A+
 Yw2YW0gGDSUMYQADAoVwwBUiIY745Xiiu371zMay8v9RysW86xfuFK10DSqhNbTymD35
 aUToMxebcA10nH2SbZ0Ksu2LLJNzGuDicJmeYpothVwnY2tRCxwg1Snh+xTYADOwTxe4
 9u4Um7UltAl9B1pLXmHjUTgPwkEei9SBNcfkoH/wI8P+pymci7MZZYEqDcKSO3dC6zZe
 PCYMz0KPfKVAfzUesL863qgVXwG2/rSk3NMHKOc+nFAKbFUcjZEiEH9Z+/YbJ2WHmpiz
 P5RQ==
X-Gm-Message-State: AOAM533lKlgx8hJOcMbYDoyW5MErD2ShswVHKFgeXHJ5VGsL7lBTLwcX
 NvDCHA+8GUMDYWfbNUjmoDg5hNz9C9o=
X-Google-Smtp-Source: ABdhPJwUXhfrKbrZLsPCF/5BXM7e40qGoZSYEm91Kj681cvQJ/I+6Tej1kGtfRNm/b0nixS+8nV1ww==
X-Received: by 2002:a17:90a:bc47:: with SMTP id t7mr757067pjv.19.1629756496989; 
 Mon, 23 Aug 2021 15:08:16 -0700 (PDT)
Received: from localhost.localdomain ([120.138.13.180])
 by smtp.gmail.com with ESMTPSA id j21sm16217454pfj.66.2021.08.23.15.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 15:08:16 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 5/5] python/aqmp-tui: Add syntax highlighting
Date: Tue, 24 Aug 2021 03:37:46 +0530
Message-Id: <20210823220746.28295-6-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210823220746.28295-1-niteesh.gs@gmail.com>
References: <20210823220746.28295-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=niteesh.gs@gmail.com; helo=mail-ot1-x32b.google.com
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
index ac533541d2..a2929f771c 100644
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
2.17.1


