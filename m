Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1734C4CE51E
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 15:05:07 +0100 (CET)
Received: from localhost ([::1]:37680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQV1t-00037X-PC
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 09:05:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klange@toaruos.org>)
 id 1nQRuj-0001O0-Co
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 05:45:29 -0500
Received: from [2607:f8b0:4864:20::52f] (port=37660
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <klange@toaruos.org>)
 id 1nQRuh-0004qJ-Ml
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 05:45:29 -0500
Received: by mail-pg1-x52f.google.com with SMTP id bc27so9599146pgb.4
 for <qemu-devel@nongnu.org>; Sat, 05 Mar 2022 02:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toaruos-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+PcUBwtyLONahwm9KYX/VH157VeW5IvLAn6bEjXJ16g=;
 b=euPNrQXAbcqsc0RsNPPvDs3I5KKl0AipO3o+LBW+eG0t3GwIKV41o3F3mWC/TZ1hDH
 JkdNWjLNLADkLpkgkd/TDvH0PtszMyo6SK0JyJkj71x0ZZ9fKfAWgLlTVbuUxyHWfaGz
 9XR3D6uPb/G7+6j7Y0boN/j6IUoZFJ/+54lv7ehh1rp1dp9/RCQIw1Roc1/vnUsDWko/
 CnqFTuii7o/zugtELRQ9lF7TALBVGw+BNkd2eGUb2ffU01nqX480/pgfPIRUfYjQV/35
 26APUN2vHD6WcjDkWeYdYoE00byAEmgnbD9GTjc8IZBj8b2WSj15SJRlUhsKi2Zo1TmG
 y4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+PcUBwtyLONahwm9KYX/VH157VeW5IvLAn6bEjXJ16g=;
 b=KUp1tN7lcsK0MMIlBsIWrEjclVmm937lV9w746vfJlUsvmQ+I/t5A8dQD0I5jFJvx1
 IGY08Vti4jlrQLumXI68XJlsHsNMqY/4zGfCZSmOpnKZdlyp31Waj82gZJUQiLRTv/F3
 yLwtUdbRFeENCfnzhehehXfN4iVZ1IoZ1gmHs/jtzF3t0GKUfg37oe8G0H3xlZTxDwW7
 nVXvNhncnlWEtAAFVCPeSpKGkNFubjSfKlVYhFWMnIIiCH/bRax0NMjavzdOLg4KlkQh
 +97nI/RjdMv0jx/kplnp6B/u2BncTbS6nFhOV27nRSG8V7M76a/qTSfmxeuG3RfiIYtV
 wdWg==
X-Gm-Message-State: AOAM5312Jqtcm8/31O52t3/q1KfkUs2WuHSC2kBrHjNe7R9lenPNgm9Q
 dOKlbw/cMazMdpAVIQX03RbWayCoJ0N4+ubT
X-Google-Smtp-Source: ABdhPJzJ5BN3U3qB972qbQH9laRYH9q+D8r2GpCBU8PBIBBv4JQSHt6SkXQ5dVI8TakuV5j7uG3Vqw==
X-Received: by 2002:a05:6a00:174d:b0:4f6:67e3:965 with SMTP id
 j13-20020a056a00174d00b004f667e30965mr3200379pfc.39.1646477125605; 
 Sat, 05 Mar 2022 02:45:25 -0800 (PST)
Received: from luka.sso.indeed.net ([2405:6580:a880:4700:a153:19a4:ff82:9114])
 by smtp.gmail.com with ESMTPSA id
 on17-20020a17090b1d1100b001bf33c61444sm2546622pjb.12.2022.03.05.02.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Mar 2022 02:45:24 -0800 (PST)
From: "K. Lange" <klange@toaruos.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] ui/gtk: Ignore 2- and 3-button press events
Date: Sat,  5 Mar 2022 19:45:21 +0900
Message-Id: <20220305104521.3583703-1-klange@toaruos.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::52f;
 envelope-from=klange@toaruos.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 05 Mar 2022 09:03:29 -0500
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "K. Lange" <klange@toaruos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GTK already produces corresponding GDK_BUTTON_PRESS events
alongside 2BUTTON and 3BUTTON_PRESS events. The 2BUTTON and
3BUTTON_PRESS events were incorrectly being interpreted and
passed to guests as button release events.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/558
Signed-off-by: K. Lange <klange@toaruos.org>
---
 ui/gtk.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ui/gtk.c b/ui/gtk.c
index a8567b9ddc..8675ae76fa 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -958,6 +958,10 @@ static gboolean gd_button_event(GtkWidget *widget, GdkEventButton *button,
         return TRUE;
     }
 
+    if (button->type == GDK_2BUTTON_PRESS || button->type == GDK_3BUTTON_PRESS) {
+        return TRUE;
+    }
+
     qemu_input_queue_btn(vc->gfx.dcl.con, btn,
                          button->type == GDK_BUTTON_PRESS);
     qemu_input_event_sync();
-- 
2.25.1


