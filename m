Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 493D86BFBDD
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 18:33:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdaPC-0002GL-FR; Sat, 18 Mar 2023 13:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pdaPA-0002Fr-2w
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 13:31:44 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pdaP8-0005Ky-Lu
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 13:31:43 -0400
Received: by mail-ed1-x52f.google.com with SMTP id eh3so31876379edb.11
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 10:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679160700;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PhOdPCjy9eqCMegLr52s7S4YJTBJc9cWnJnmvsj7hsI=;
 b=n9HhIldi31jNGNhouh6upDz5q2R91w+YfeQimlHiTlW2OwSVxQ+TjZAlqqWrWPbLhg
 QLVYAIQetYDvSuqIpFfynSKKuUkUxmMI7se3gmmyJYj4ifgB1VNL14ZMj2wqx6Ln+BEI
 lgLDrYz5tN4VFcoWSZ5dbS4NoTs+5UDrx5i3+1Rt9UI8oNo995vH7OCb2BC9llpBaWKw
 5bKuy2iQtNJKcBtOz1PcGnQHdYriIFy8rwb6zh5Ofqrlumb5MmksxgoqmONuVt7XGSmW
 nnRXdJ0gI8APsBeeZVqUe89GoAgCzev2hllZEGz5x8vwnn/Ugvjwv8EH1JuKmwvX1rYR
 oiyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679160700;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PhOdPCjy9eqCMegLr52s7S4YJTBJc9cWnJnmvsj7hsI=;
 b=klo1L5E5im8nt1JFH9LhFKOF5gDP3YNVAroInj3dGrhmwg4P9MKDnyRzxKBmHg3gDv
 Trs0CO00RN+0ofuoGuGlThJHHtr8tNVy9+WkVYH301aPYWvUh1TW5uTT6YOLL2IObxYT
 DCRYcKzbpIAalWR5yeKzK0hCBP+yjiK5W6lRPDm/kbrwMRf7LTkz6XJPAdxy4onWTBKZ
 4IEya8iOWIstQ/HFW3tbOWOV3ZWSIvUuzGymcGg46irasJ91DndSo8VgHmOMSBRuvh4j
 NvDr6mwZNQkFxG7QhIqJYhPbsuBJVY3wAgLe0Q/WIGdb3TYtNmMjV9PjL+jloT4oa/Us
 f0Rg==
X-Gm-Message-State: AO0yUKUQfmCR63fE9MvQk8odX9EQMomz3/83kvEkG+fBg3Ln6MMcP5aH
 Hteh/Au5YJQno0NHJc7bH/wqf8j+aQM=
X-Google-Smtp-Source: AK7set+564nby9bEN8LtCBIbr+laL0jkzL56ksnac/Vsft3T6QcWnhmQSltVovusOgNvpudp1Rvvnw==
X-Received: by 2002:a17:906:370b:b0:933:3cc7:4420 with SMTP id
 d11-20020a170906370b00b009333cc74420mr2059066ejc.45.1679160700345; 
 Sat, 18 Mar 2023 10:31:40 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-011-121-187.77.11.pool.telefonica.de. [77.11.121.187])
 by smtp.gmail.com with ESMTPSA id
 d13-20020a170906344d00b009318ad4a583sm2372448ejb.210.2023.03.18.10.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 10:31:39 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH for-8.0] Revert "ui: set cursor position upon listener
 registration"
Date: Sat, 18 Mar 2023 18:31:32 +0100
Message-Id: <20230318173132.98068-1-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Commit 6effaa16ac98 ("ui: set cursor position upon listener registration")
causes the mouse cursor to be placed into the lower left corner when QEMU
starts. This could be reproduced with just by running
`qemu-system-x86_64`.

This reverts commit 6effaa16ac9846e7d6197ee54a0551fba61aecd7.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 ui/console.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index f3783021e5..35f8274aab 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -95,7 +95,6 @@ struct QemuConsole {
     QemuUIInfo ui_info;
     QEMUTimer *ui_timer;
     QEMUCursor *cursor;
-    int cursor_x, cursor_y, cursor_on;
     const GraphicHwOps *hw_ops;
     void *hw;
 
@@ -1666,9 +1665,6 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
     if (con && con->cursor && dcl->ops->dpy_cursor_define) {
         dcl->ops->dpy_cursor_define(dcl, con->cursor);
     }
-    if (con && dcl->ops->dpy_mouse_set) {
-        dcl->ops->dpy_mouse_set(dcl, con->cursor_x, con->cursor_y, con->cursor_on);
-    }
     text_console_update_cursor(NULL);
 }
 
@@ -1913,9 +1909,6 @@ void dpy_mouse_set(QemuConsole *con, int x, int y, int on)
     DisplayState *s = con->ds;
     DisplayChangeListener *dcl;
 
-    con->cursor_x = x;
-    con->cursor_y = y;
-    con->cursor_on = on;
     if (!qemu_console_is_visible(con)) {
         return;
     }
-- 
2.40.0


