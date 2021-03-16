Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7683533CFB9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 09:22:28 +0100 (CET)
Received: from localhost ([::1]:46196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM4yB-0000gY-DX
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 04:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM4pn-0002g0-O4
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:13:47 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:36838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM4pl-00080b-9e
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:13:47 -0400
Received: by mail-ed1-x529.google.com with SMTP id o19so20408679edc.3
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 01:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=Qzbudw9LUWOm1Rax1mxLCAnSCATSV/CAzdskAuhxsIw=;
 b=RgKdHBz7BRmhPjeCXQp6IDSyDjrXpQhzhoZ4oKIUEQKoSsFjaD2EwTr86EUuBUPFzs
 Zw56tXBG2HJivKwojs61E2/itsVOYfpGhwZXWYv3nHECjP573C/nqH8B82DZiByE6EH7
 inblSnVXKUdh0h3yg5n2AGADGDIdKyuGkq9dR5erMrrpa8OqmLJF6Ect+SHHj57Prg2c
 hW+Yv4OJkIyGIZeoHVPjw7kIArlisdIkiLOD0m4+ZDire/Ri7hoRl6+dZiZFLi2aUtsJ
 pYAn64UscfD/+mpcKMZnsxlHp2gx1KF/O61iA+PnyMTDEzld47fZwUgbICn7unoKxkFs
 vuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=Qzbudw9LUWOm1Rax1mxLCAnSCATSV/CAzdskAuhxsIw=;
 b=Lps/KaJj9nHdGlOiiqqHJ0rwyIJ4McmkrQXd5d0UVfDm0ELuH4eZPKa9Bm0vy1eTy4
 OEuNkd1LRBy9wiOn3qSLvI3OkNw6iYuoXEBOZnQvSLA/R+4VQ+WB/JcopFnylzZ520Fh
 WtRRrqAamgziYSLUNt9Z5gFZfTh2W5q6pV9qDMzX9BP+vWAF7jJUxWwRF7MgM15YU4Vx
 QBOOQmnj/u0vUb5DhWvM9tm+CSbxIOzcanCPafk6bYbVpAhlnxSDUXxG6uPbC7aKCm9h
 GTLVaI83ryhAr+FkFIt0zkrF5vFCLOhwBNO2aY9MAk2Xtv6momF3AC7dzUSCarToZrer
 JssA==
X-Gm-Message-State: AOAM531QIHDCM2LEMrfUNpnYugus20w2fOO7FnQ+yLLek0rKSE2yOGTd
 kQm4Wbstckc/nwrizvsZcP4vQvmiKOE=
X-Google-Smtp-Source: ABdhPJy9jr1ZpiKBA5KweV7Hhz067d3VLEPBKBbxIIVmcCEiBYOvjFWFZ9kLL3T9Riqh2RC38LNywg==
X-Received: by 2002:aa7:c654:: with SMTP id z20mr23403330edr.377.1615882424077; 
 Tue, 16 Mar 2021 01:13:44 -0700 (PDT)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id a17sm5620333ejf.20.2021.03.16.01.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 01:13:43 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v3 11/13] hw/net: rtl8139: Remove the logic of padding short
 frames in the receive path
Date: Tue, 16 Mar 2021 16:12:52 +0800
Message-Id: <20210316081254.72684-12-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210316081254.72684-1-bmeng.cn@gmail.com>
References: <20210316081254.72684-1-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x529.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

(no changes since v1)

 hw/net/rtl8139.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index 4675ac878e..cbfe29a286 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -827,7 +827,6 @@ static ssize_t rtl8139_do_receive(NetClientState *nc, const uint8_t *buf, size_t
 
     uint32_t packet_header = 0;
 
-    uint8_t buf1[MIN_BUF_SIZE + VLAN_HLEN];
     static const uint8_t broadcast_macaddr[6] =
         { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
 
@@ -939,17 +938,6 @@ static ssize_t rtl8139_do_receive(NetClientState *nc, const uint8_t *buf, size_t
         }
     }
 
-    /* if too small buffer, then expand it
-     * Include some tailroom in case a vlan tag is later removed. */
-    if (size < MIN_BUF_SIZE + VLAN_HLEN) {
-        memcpy(buf1, buf, size);
-        memset(buf1 + size, 0, MIN_BUF_SIZE + VLAN_HLEN - size);
-        buf = buf1;
-        if (size < MIN_BUF_SIZE) {
-            size = MIN_BUF_SIZE;
-        }
-    }
-
     if (rtl8139_cp_receiver_enabled(s))
     {
         if (!rtl8139_cp_rx_valid(s)) {
-- 
2.17.1


