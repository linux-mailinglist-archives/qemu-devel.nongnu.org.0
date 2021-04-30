Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6B436F862
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:20:03 +0200 (CEST)
Received: from localhost ([::1]:60316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQFe-0006ZP-7e
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcQDB-0004Nx-8T
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:17:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcQCv-00084B-Fg
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:17:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619777832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uwbbRehc1l7qUNtgv1o6k50Kfl46adZ8tUiPqdMAcBU=;
 b=AdOhD3ieB6CBDgHmn7niHUdSZeT+5iyIxcRqWSxcbL+3ehTkaDzwty67r6C4fmQ5y7gf7+
 x4ckWDVTlulVBNnu2ZSryizoSBRLg7WcRuBRaUyx3Ldth/LfTczdYi1UZKls663DaL3cpY
 xPKBPDXCHMRd87R1v+DzavUIQnS379o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-xVt8vWr9PAOCzOI2KX2ORQ-1; Fri, 30 Apr 2021 06:17:11 -0400
X-MC-Unique: xVt8vWr9PAOCzOI2KX2ORQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 4-20020adf91840000b029010d9c088599so1193874wri.10
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uwbbRehc1l7qUNtgv1o6k50Kfl46adZ8tUiPqdMAcBU=;
 b=IfbX1TlrtT+ZwUR5SPlB35wyrqa5CiJlLD8pCr1OvKLAbHe8CSI9c0NLTR4IO3WMnL
 CDLHnULqr8iG/IF36l99EPlzZfAoQ/RwNLwVJ3WlQzqG+DFjg+NBJINyNwEj0V3M2/e8
 uk1WmZu9awDp4HxNcQom+z/Hs2as9fcEmgco7CVPeHGAD7KwYsnruDYuquRg/Rf7gdPA
 Wd80kysnCh1imMN8w+SrnujDhXq366MlCoT4sZhpv8prvZLvFW+0w7/Sc0gBOEgvmlSQ
 upZL1EGzcOlt9znp4QyVX+G+XB25EYJHcvGgo6QpnRArLGIilgkqgIlhOi9z8HLXw8V0
 mHQA==
X-Gm-Message-State: AOAM533fuyCoQY5Ar3Z5/05xXtz/Nk8xoNZDgWBtSLAACEisf6/R7j5a
 Zuo304Ifg/2BC7t8T48UAaYkC/Xv6LWuY7eoQgWDhKp3Sc/yCyDO0HxN9vPjASu8GlJOedkaTvH
 2gUDWQ1BDTtbRqkzn/dtR2fdwPPpDJdzyu2918KEwaq07hX4GxlSyHtsJTaPC3oni
X-Received: by 2002:adf:90f0:: with SMTP id i103mr5659702wri.318.1619777829571; 
 Fri, 30 Apr 2021 03:17:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySLJ6DufYg4QOo5a9OUr1zhE59NEQh6pDdIVnH6DurLJlj9AdwZslmZmQ34p7GdMs56Df7MA==
X-Received: by 2002:adf:90f0:: with SMTP id i103mr5659679wri.318.1619777829361; 
 Fri, 30 Apr 2021 03:17:09 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id n10sm1772394wrw.37.2021.04.30.03.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:17:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] ui: Fix memory leak in qemu_xkeymap_mapping_table()
Date: Fri, 30 Apr 2021 12:17:06 +0200
Message-Id: <20210430101707.245126-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Refactor qemu_xkeymap_mapping_table() to have a single exit point,
so we can easily free the memory allocated by XGetAtomName(),

This fixes when running a binary configured with --enable-sanitizers:

  Direct leak of 22 byte(s) in 1 object(s) allocated from:
      #0 0x561344a7473f in malloc (qemu-system-x86_64+0x1dab73f)
      #1 0x7fa4d9dc08aa in XGetAtomName (/lib64/libX11.so.6+0x2a8aa)

Fixes: 2ec78706d18 ("ui: convert GTK and SDL1 frontends to keycodemapdb")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 ui/x_keymap.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/ui/x_keymap.c b/ui/x_keymap.c
index 555086fb6bd..2ce7b899615 100644
--- a/ui/x_keymap.c
+++ b/ui/x_keymap.c
@@ -56,6 +56,7 @@ const guint16 *qemu_xkeymap_mapping_table(Display *dpy, size_t *maplen)
 {
     XkbDescPtr desc;
     const gchar *keycodes = NULL;
+    const guint16 *map;
 
     /* There is no easy way to determine what X11 server
      * and platform & keyboard driver is in use. Thus we
@@ -83,21 +84,21 @@ const guint16 *qemu_xkeymap_mapping_table(Display *dpy, size_t *maplen)
     if (check_for_xwin(dpy)) {
         trace_xkeymap_keymap("xwin");
         *maplen = qemu_input_map_xorgxwin_to_qcode_len;
-        return qemu_input_map_xorgxwin_to_qcode;
+        map = qemu_input_map_xorgxwin_to_qcode;
     } else if (check_for_xquartz(dpy)) {
         trace_xkeymap_keymap("xquartz");
         *maplen = qemu_input_map_xorgxquartz_to_qcode_len;
-        return qemu_input_map_xorgxquartz_to_qcode;
+        map = qemu_input_map_xorgxquartz_to_qcode;
     } else if ((keycodes && g_str_has_prefix(keycodes, "evdev")) ||
                (XKeysymToKeycode(dpy, XK_Page_Up) == 0x70)) {
         trace_xkeymap_keymap("evdev");
         *maplen = qemu_input_map_xorgevdev_to_qcode_len;
-        return qemu_input_map_xorgevdev_to_qcode;
+        map = qemu_input_map_xorgevdev_to_qcode;
     } else if ((keycodes && g_str_has_prefix(keycodes, "xfree86")) ||
                (XKeysymToKeycode(dpy, XK_Page_Up) == 0x63)) {
         trace_xkeymap_keymap("kbd");
         *maplen = qemu_input_map_xorgkbd_to_qcode_len;
-        return qemu_input_map_xorgkbd_to_qcode;
+        map = qemu_input_map_xorgkbd_to_qcode;
     } else {
         trace_xkeymap_keymap("NULL");
         g_warning("Unknown X11 keycode mapping '%s'.\n"
@@ -109,6 +110,10 @@ const guint16 *qemu_xkeymap_mapping_table(Display *dpy, size_t *maplen)
                   "  - xprop -root\n"
                   "  - xdpyinfo\n",
                   keycodes ? keycodes : "<null>");
-        return NULL;
+        map = NULL;
     }
+    if (keycodes) {
+        XFree((void *)keycodes);
+    }
+    return map;
 }
-- 
2.26.3


