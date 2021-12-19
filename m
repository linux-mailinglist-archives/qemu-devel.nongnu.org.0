Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC5E479EDB
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 03:34:59 +0100 (CET)
Received: from localhost ([::1]:41712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mym2M-0007XW-A3
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 21:34:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <orzechowski.alexander@gmail.com>)
 id 1mylyu-0001UB-AR; Sat, 18 Dec 2021 21:31:24 -0500
Received: from [2607:f8b0:4864:20::836] (port=38858
 helo=mail-qt1-x836.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <orzechowski.alexander@gmail.com>)
 id 1mylyr-0003eZ-Ru; Sat, 18 Dec 2021 21:31:24 -0500
Received: by mail-qt1-x836.google.com with SMTP id 8so6582565qtx.5;
 Sat, 18 Dec 2021 18:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HrlnaurYTmBCdB76jDfgaHeWFsC0GaLlLb1/u6RXXhU=;
 b=PeKETNDiExDozMjwPXdZKhle9v3N4NNcmhkw++OzybEkpp9Ud+M7QiGOlVCI78+7/t
 Y7KQjlX7kIG6+Un1X8eudDRs+toUppbxaGUUuucpfj6/0xICo0GNyJ9r/v2fegmsOe/I
 xVxpW6rnE4iurN2r0m7XOloxwMMQWCE+zJUxo+Ap/DZt3fLSOFWCQFNcVAsFErYNim0L
 vXMatGx2nsusd7itebQVQabKvwq3GT8KUFrO2BUOARokBipXOK/vtFPoTQMtxYeqNuol
 Av5wMAy0HuXFRNImsCWb1I5/SG/yjIZJAlKl0i0G17l+JMtW9V0WCN0h3MylIWf3SAP9
 9gEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HrlnaurYTmBCdB76jDfgaHeWFsC0GaLlLb1/u6RXXhU=;
 b=1ogXTQZuB2Ic+mhW28oldsVWOVkk1Yt+mbmqt1fT7ZaKwRC+j2Ym3vCGwM1JqAyt0W
 fZRbuOaSeoqoCbcxn7NPNdMpwkTjbah6/aSl7vIRlaE+DPo/3pXgwhu+K/wqeQIGHuSt
 57Ugmt3eGx7kwnDLIKNhAFl+igLWCnn/IbPy3fnTAnCsoZrVuF9Q8K9jT5SmKvPQZm+2
 bb5qDSUEMjrC4pKZ03xFKVKrbIirWMAHSxzrbDQpy8L9pKM5A7Wnwfj6inyiMix7o/mJ
 fiG0XR/f8QSF/DPCzUX/rl0+jACQJv0FNjDWebxoeS49E7Dv1C0ibCS0GpoTnpH3Dag4
 jpcA==
X-Gm-Message-State: AOAM533V+o4C5gIChWCG/h8YOwp119pXPKX6LnR81bCHqWwCBeBH9AEx
 WYOMc0kuAaMwyJZAqXYNkjFCfLotsfpLdyKMZls=
X-Google-Smtp-Source: ABdhPJw9w9R2iNW1UqWWA/JZ93n1CExqoDi1n4/02WFeVHpP6jwjFWdIsfxcFwTzZBVH7mj4TxDZig==
X-Received: by 2002:a05:622a:2c9:: with SMTP id
 a9mr8070572qtx.28.1639881079693; 
 Sat, 18 Dec 2021 18:31:19 -0800 (PST)
Received: from alexdesktop.localdomain
 (cpebc4dfb42ca53-cmbc4dfb42ca50.cpe.net.cable.rogers.com. [99.251.122.96])
 by smtp.gmail.com with ESMTPSA id m4sm10174293qtu.87.2021.12.18.18.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 18:31:19 -0800 (PST)
From: Alexander Orzechowski <orzechowski.alexander@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] ui: Revert: "fix incorrect pointer position on highdpi
 with gtk"
Date: Sat, 18 Dec 2021 21:30:05 -0500
Message-Id: <20211219023006.124530-4-orzechowski.alexander@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211219023006.124530-1-orzechowski.alexander@gmail.com>
References: <20211219023006.124530-1-orzechowski.alexander@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::836
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=orzechowski.alexander@gmail.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Alexander Orzechowski <orzechowski.alexander@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit f14aab420c58b57e07189d6d9e6d3fbfab4761a6.

This commit was originally tested on gtk/gl which corrected behavior
there. Turns out, the OpenGL texture representing the virtual console
was being rendered in the incorrect place and not that the cursor
was incorrectly being handled.

Signed-off-by: Alexander Orzechowski <orzechowski.alexander@gmail.com>
---
 ui/gtk.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index f2d74b253d..c41601f24d 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -826,7 +826,7 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
     int x, y;
     int mx, my;
     int fbh, fbw;
-    int ww, wh, ws;
+    int ww, wh;
 
     if (!vc->gfx.ds) {
         return TRUE;
@@ -837,14 +837,12 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
 
     ww = gtk_widget_get_allocated_width(vc->gfx.drawing_area);
     wh = gtk_widget_get_allocated_height(vc->gfx.drawing_area);
-    ws = gdk_window_get_scale_factor(
-            gtk_widget_get_window(vc->gfx.drawing_area));
 
     mx = (ww - fbw) / 2;
     my = (wh - fbh) / 2;
 
-    x = (motion->x - mx) / vc->gfx.scale_x * ws;
-    y = (motion->y - my) / vc->gfx.scale_y * ws;
+    x = (motion->x - mx) / vc->gfx.scale_x;
+    y = (motion->y - my) / vc->gfx.scale_y;
 
     if (qemu_input_is_absolute()) {
         if (x < 0 || y < 0 ||
-- 
2.34.1


