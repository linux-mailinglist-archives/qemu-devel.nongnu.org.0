Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA6243898A
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 16:32:54 +0200 (CEST)
Received: from localhost ([::1]:40374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meeYP-0007nv-80
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 10:32:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavlica.nikola@gmail.com>)
 id 1meeX3-00077q-RB
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 10:31:29 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pavlica.nikola@gmail.com>)
 id 1meeX1-0002ts-Tq
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 10:31:29 -0400
Received: by mail-wr1-x434.google.com with SMTP id p14so1747676wrd.10
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 07:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CTBzoqox30UwCYaP98zRplQKmIVZeMD3RlhV7gz8HWA=;
 b=hS64MdUoV6COfsWgARFU9KtqkeYDbtjDXDzjumPRACWIAdGHgROVSoXTX33Gaeauam
 Sf7NIEUvgsbEoVcTFMaLTe4j+BaCdtLHZZ6rNN7i5nWb8ipIF923zm8M3PijsPJP1Blu
 S0bXPGM3+r+2waxRaDdiNxwFCzKsIrmqcNiB74TaV9IcJe8aze74gJCSkuw6DOme0vVB
 EhhZgL23uvuEgr3ppPEJ9UI3o4lUlORHxbVQy6BsXdAX5eTdVgcKGamLNwhSk40OWmfO
 2BstvTSiTi5CnTiyJo79GlyHrVpz/RC8BUABPgMDYlqvki+QMgGPBmbpWzxhtLB9BoQM
 6ybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CTBzoqox30UwCYaP98zRplQKmIVZeMD3RlhV7gz8HWA=;
 b=Gd++ZvJIbQK9y4BqePhmB59uC24g6nnpvFSjoaJWbzMVqcDFZTU9zSnVundL0KkF/G
 QqGmMe7ClQTJd+/EaKmpcOLO3HTDErVHcOem8mdHueHkqsF1xDzT5BFtOJlbwbLNHrC0
 yBO5r/rtAOoWSKjH3Dc+hLR44z9TpLcU1rLgd6rXwn4s+HMkkGdOeHPQxSya3gGW3bbh
 3qXvBw2CKq+Km003lQkvTQCNmdAlngSFMqPLzBturyBSSgvDlfPDVKtSl8x5brtkJUZN
 47K2U/MXVyPX8PKd3admRDnhcpm1GUmblrKjVvQF2H09sCejwpFkFFo/9bT/rBLzB15q
 2sMg==
X-Gm-Message-State: AOAM530Hgha8LWwxEB+61N3NFge4BZ36+UBHYVmpUAurKNDKG62BV3k5
 hLaBKoaGPbPHYIuCjiAgD6dTYqesR5//3qIO
X-Google-Smtp-Source: ABdhPJzzvcYl02TpbxSr9pVnqED5GxLGpfd72c7Wi2fx2YxAqK9LCGPQF5/XLkHcejA9rcXN8XcrzA==
X-Received: by 2002:a05:6000:15c8:: with SMTP id
 y8mr16359402wry.345.1635085885213; 
 Sun, 24 Oct 2021 07:31:25 -0700 (PDT)
Received: from localhost.localdomain ([212.178.231.132])
 by smtp.gmail.com with ESMTPSA id y23sm5019751wmi.43.2021.10.24.07.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 07:31:24 -0700 (PDT)
From: Nikola Pavlica <pavlica.nikola@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] ui/gtk: Update the refresh rate for gl-area too
Date: Sun, 24 Oct 2021 16:31:10 +0200
Message-Id: <20211024143110.704296-1-pavlica.nikola@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=pavlica.nikola@gmail.com; helo=mail-wr1-x434.google.com
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
Cc: philmd@redhat.com, kraxel@redhat.com,
 Nikola Pavlica <pavlica.nikola@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a bugfix that stretches all the way back to January 2020,
where I initially introduced this problem and potential solutions.

A quick recap of the issue: QEMU did not sync up with the monitors
refresh rate causing the VM to render frames that were NOT displayed
to the user. That "fix" allowed QEMU to obtain the screen refreshrate
information from the system using GDK API's and was for GTK only.

Well, I'm back with the same issue again. But this time on Wayland.

And I did NOT realize there was YET another screen refresh rate
function, this time for Wayland specifically. Thankfully the fix was
simple and without much hassle.

Thanks,
Nikola

PS: It seems that my patch has gone missing from the mailing list,
hence I'm sending it again. Sorry for any inconveniences.


Signed-off-by: Nikola Pavlica <pavlica.nikola@gmail.com>
---
 ui/gtk-gl-area.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index b23523748e..afcb29f658 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -112,6 +112,9 @@ void gd_gl_area_refresh(DisplayChangeListener *dcl)
 {
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);

+    vc->gfx.dcl.update_interval = gd_monitor_update_interval(
+            vc->window ? vc->window : vc->gfx.drawing_area);
+
     if (!vc->gfx.gls) {
         if (!gtk_widget_get_realized(vc->gfx.drawing_area)) {
             return;
--
2.33.0


