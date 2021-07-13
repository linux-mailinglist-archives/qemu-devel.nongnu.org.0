Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 334163C7965
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:09:58 +0200 (CEST)
Received: from localhost ([::1]:56996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3QbD-00048P-9p
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m3QZG-0001Nf-Ab
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:07:54 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:46810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m3QZD-00069z-CL
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:07:52 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 b5-20020a17090a9905b029016fc06f6c5bso112268pjp.5
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MFX1bAKDxzO1WS9SbmpB1APYv3Ko7UqDEMVqBQ4qfPg=;
 b=slROXEZHTZ6JwnPiaQkPIDdwWaM55EKsXI7iUIoBhqPWwGsaxDOxzG5xrLSpxUTL+2
 qIUMhuBCbvGFs2O3Ut2GniiMRAT+c9JUdDy0ah2garMy5SsgYJxceqQZWWVO6eU6iUOE
 4+ZS3gBs6lxmHJ0vgnEU6JrMEejwpTOplAJrDh4YjBEnWVK862TPURhc+ILXLYu/zIXO
 h0mg5iM/MP+fsvrnMgGi4mAhZXM344ewOhnNvnpC2nIoxq7xIViSXgztdSeqeX+djo//
 kqbHDG1I27NLakUdG8RIQjU/KCA6ljjIRtLciy57mJU4V+vonVQAjYIR8tzsB0GRLuP+
 IKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MFX1bAKDxzO1WS9SbmpB1APYv3Ko7UqDEMVqBQ4qfPg=;
 b=CWO3upXWVu3HYBSXZo/IpPd7MmH53l8TmyayPYeruWqziGRiE/vylW50RWJ8U9MGmr
 xoK2XjWQzIk3inkoCbt7LGad1KSTLuD1cLmiGLGFmL2A8ZlX+gN00i24BRSB8n4EOv3j
 FjN08o+YvwA6eIrMO7g/8NzBoegBsDRgPGCXQql9+eU+bBSvCV+WVUoeC0tQ7JhDxLR3
 gDyVydRWBK6tcQ+arZE41ZErOXorDYZm2mN0loyGFPSYO1pr/qE2/L8NJ8hlFCNlBPm9
 4CihLLiEsdPUmXQxZ2UJZgYsY4qSH/lA1p+zPQrm5D3gtGgxGXhtdXKNeyEFT1sYG8Q3
 YVIw==
X-Gm-Message-State: AOAM530XI1WIORyvfq8pa6ysRA6xdv/JEva7KLzAFZd/wy2Z40DosigL
 6iIp5E+7hf710ipRBYjoXF2wDrIuytXF9A==
X-Google-Smtp-Source: ABdhPJzTndxhdbbfuRRh0jRUjT0NLPi+gJlKBzick3mxRcwSebDPfwu0OHSIfxiIweFHA/iwqnJwHw==
X-Received: by 2002:a17:90b:347:: with SMTP id fh7mr420399pjb.2.1626214070032; 
 Tue, 13 Jul 2021 15:07:50 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.183])
 by smtp.gmail.com with ESMTPSA id w16sm94678pgi.41.2021.07.13.15.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:07:49 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/6] python/aqmp-tui: add syntax highlighting
Date: Wed, 14 Jul 2021 03:37:33 +0530
Message-Id: <20210713220734.26302-6-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210713220734.26302-1-niteesh.gs@gmail.com>
References: <20210713220734.26302-1-niteesh.gs@gmail.com>
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
Cc: G S Niteesh Babu <niteesh.gs@gmail.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
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
 python/qemu/aqmp/aqmp_tui.py | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
index f853efc1f5..9ee91f0e99 100644
--- a/python/qemu/aqmp/aqmp_tui.py
+++ b/python/qemu/aqmp/aqmp_tui.py
@@ -12,6 +12,8 @@
 from logging import Handler
 import signal
 
+from pygments import lexers
+from pygments import token as Token
 import urwid
 import urwid_readline
 
@@ -33,6 +35,11 @@
     (Token.Literal.Number.Integer, '', '', '', '#fa0', 'g7'),
     (Token.Literal.String.Double, '', '', '', '#6f6', 'g7'),
     (Token.Keyword.Constant, '', '', '', '#6af', 'g7'),
+    ('DEBUG', '', '', '', '#ddf', 'g7'),
+    ('INFO', '', '', '', 'g100', 'g7'),
+    ('WARNING', '', '', '', '#ff6', 'g7'),
+    ('ERROR', '', '', '', '#a00', 'g7'),
+    ('CRITICAL', '', '', '', '#a00', 'g7'),
     ('background', '', 'black', '', '', 'g7'),
 ]
 
@@ -133,7 +140,7 @@ def cb_add_to_history(self, msg, level=None):
         formatted = []
         if level:
             msg = f'[{level}]: {msg}'
-            formatted.append(msg)
+            formatted.append((level, msg))
         else:
             lexer = lexers.JsonLexer()  # pylint: disable=no-member
             for token in lexer.get_tokens(msg):
@@ -162,6 +169,7 @@ def __init__(self, address):
         self.address = address
         self.aloop = None
         self.loop = None
+        self.screen = urwid.raw_display.Screen()
         super().__init__()
 
     def add_to_history(self, msg, level=None):
@@ -249,8 +257,10 @@ def run(self, debug=False):
             self.aloop.add_signal_handler(sig, self.kill_app)
 
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


