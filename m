Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8983BA50B
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 23:29:49 +0200 (CEST)
Received: from localhost ([::1]:56836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzQjM-00087Q-TX
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 17:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lzQg4-0002OR-MN
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 17:26:24 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:51968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lzQg2-0001Su-VY
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 17:26:24 -0400
Received: by mail-pj1-x1034.google.com with SMTP id n11so7270219pjo.1
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 14:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pRFFZdr9At5PhIvCLVQxz2BFQzaBdzf3bf3o03wYqiI=;
 b=ONHZAQu+PxEGz4q5K8SDK1M7kawF5bUIVwpGpWrG7l0adOVrIK4B8lRz2JQLaUnGYt
 oGCyu4xZFUHKWoFV2kFQdfzTCLva5O4ZyR+NUayYfIBLGKJXFW91ffNrRCgLOidEQwpp
 JuA79HV13eWqu6mpR/dukERPy0RaILeBiy42eaGWqYX+7idIqmywk7BqNn6Suu5B9AcL
 rm1FISudotRhNNBuCFt+5Hm2VTM2X6WnUoOz9SOJt8137DLy4dUMPv1SrNddpSUKaMEC
 CUdNdeW9w4mpM8irECHRsFmUFB9ioesjjhkgTWtL7w8TlEdhQ03c0l9yWv3YdQWdxkOX
 1cyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=pRFFZdr9At5PhIvCLVQxz2BFQzaBdzf3bf3o03wYqiI=;
 b=bAi1uBREMBFFtvAZK3IWWFXFmFwzNiIkU86eZWxSkJEQ3hGIKBSJUEp3SRdssPPF/s
 ehfGTqxixn8iXvoIm1gEJhVEX9Zath4fJWrgDyU6eQNOyUovPlQzr7mmxvOqU6bfHImL
 b59qEWGZqzV+HDCyCVfruFwktJPdvSQ45q+KrSFuipQoRUq2sysO8CnAoDj4B2ODGt72
 BtfjzfkjfpL5Bh+kzliZQWnTDyihfTpDboX8po5DjepmxVEX6erbB7aabZUl/2voRr8d
 BYErlBnI1lt1vT9TulFPdvDuKuK0Be9xG9MUToUYLRrXjEkfJNYJbj+LJRAf01ulGQn8
 5o1A==
X-Gm-Message-State: AOAM5332u2I5TM9Cn27S1DYW/PitCJC650vAYwtUkde9SfE6EFsCbcEu
 l2PR9PWWtwj3x8nShxTXDjw=
X-Google-Smtp-Source: ABdhPJzOWpEJMgZkQN5UgncU4R6QFWbwzXIhrZlQ66DmVik7yVJ00CvlE6MMa18dt7zc/5EtY9ukPA==
X-Received: by 2002:a17:902:6e02:b029:128:977c:217d with SMTP id
 u2-20020a1709026e02b0290128977c217dmr1485636plk.44.1625261181739; 
 Fri, 02 Jul 2021 14:26:21 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.1])
 by smtp.gmail.com with ESMTPSA id o16sm71563pjw.51.2021.07.02.14.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 14:26:21 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: jsnow@redhat.com
Subject: [PATCH 5/6] python/aqmp-tui: add syntax highlighting
Date: Sat,  3 Jul 2021 02:56:02 +0530
Message-Id: <20210702212603.26465-6-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210702212603.26465-1-niteesh.gs@gmail.com>
References: <20210702212603.26465-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pj1-x1034.google.com
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

Add syntax highlighting for the incoming and outgoing QMP messages.
This is achieved using the pygments module which was added in a
previous commit.

The current implementation is a really simple one which doesn't
allow for any configuration. In future this has to be improved
to allow for easier theme config using an external config of
some sort.

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
---
 python/qemu/aqmp/aqmp_tui.py | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
index 8e9e8ac8ff..03cb70a523 100644
--- a/python/qemu/aqmp/aqmp_tui.py
+++ b/python/qemu/aqmp/aqmp_tui.py
@@ -11,6 +11,8 @@
 import logging
 import signal
 
+from pygments import lexers
+from pygments import token as Token
 import urwid
 import urwid_readline
 
@@ -21,6 +23,16 @@
 
 UPDATE_MSG = 'UPDATE_MSG'
 
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
 
 class StatusBar(urwid.Text):
     """
@@ -115,7 +127,11 @@ def __init__(self, master):
         urwid.connect_signal(self.master, UPDATE_MSG, self.cb_add_to_history)
 
     def cb_add_to_history(self, msg):
-        self.history.add_to_history(msg)
+        formatted = []
+        lexer = lexers.JsonLexer()  # pylint: disable=no-member
+        for token in lexer.get_tokens(msg):
+            formatted.append(token)
+        self.history.add_to_history(formatted)
 
 
 class Window(urwid.Frame):
@@ -139,6 +155,7 @@ def __init__(self, address):
         self.address = address
         self.aloop = asyncio.get_event_loop()
         self.loop = None
+        self.screen = urwid.raw_display.Screen()
         super().__init__()
 
         # Gracefully handle SIGTERM and SIGINT signals
@@ -210,10 +227,14 @@ def handle_event(self, event):
             self.window.footer.set_text('Server shutdown')
 
     def run(self):
+        self.screen.set_terminal_properties(256)
+
         self.aloop.set_debug(True)
         event_loop = urwid.AsyncioEventLoop(loop=self.aloop)
-        self.loop = urwid.MainLoop(self.window,
+        self.loop = urwid.MainLoop(urwid.AttrMap(self.window, 'background'),
                                    unhandled_input=self.unhandled_input,
+                                   screen=self.screen,
+                                   palette=palette,
                                    handle_mouse=True,
                                    event_loop=event_loop)
 
-- 
2.17.1


