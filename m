Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B1B28E505
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Oct 2020 19:06:30 +0200 (CEST)
Received: from localhost ([::1]:44448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSkEP-0005m4-Md
	for lists+qemu-devel@lfdr.de; Wed, 14 Oct 2020 13:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kSkAJ-0002kZ-GJ; Wed, 14 Oct 2020 13:02:15 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:37031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kSkAH-0000nV-FA; Wed, 14 Oct 2020 13:02:15 -0400
Received: by mail-ed1-x542.google.com with SMTP id o18so210690edq.4;
 Wed, 14 Oct 2020 10:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aJ0KQb6Ozzm+TKAEStsx77t+LpGGqIZVP5UuxdMy3MY=;
 b=XpqNSJ9ujbXfuJhTtjLOFcHXa52vlNLLRyjRy2EvXJL+QNSwZONNGN3tdQfgKZDDZ/
 8ll0PCZksSOmgrK4pb5kXdncWID3UzRtmMRG+Uz1U8lZM69o1pdynWRixKNzLPuVe1pi
 8EHh4hag+Xh27lXk6tXylovn2feSgr+iTOmfle50e1/OTUMpi4SVcIozorPhoNC2k5xX
 TOtN9WzwcozT2eoTMbeAhE/0dVNU/HPB0EizXoQF8g878BO22sGTF0l3HTR6qsbwy6B9
 rcPnRXMZMM9m4H0Ok8lVxoRVVe48lWohRaTdtAmhVUOgRF3I3hA2ac3DY613x/Eu5EZO
 YXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aJ0KQb6Ozzm+TKAEStsx77t+LpGGqIZVP5UuxdMy3MY=;
 b=cZUy5Hle4iNmIk81dnaVJ2u/Qt7e+P1sQ/wIA9vtxti3xLSLvC+H5m9eOKs+6o15jY
 fKt28OgWQSYJkJgH2/jLp2+9tV9R+kVYgjNlnFSM8aL3gLmYcAJucfv45BHUDl/rY8ob
 wOtJ4fRWuwAmDDs0c+da2VUgUcfHBwLXZcSCS+ZSL5v3IqKHTcurh7R/lBCLozREpjby
 d5ItWIduVRnzN5+NH+V34r8aW6GGi/UpeSXdCdl/hnJhuHa0BNVMg96GF1+INn11Eaka
 2e5Zx9bsGEILUZSyDftjjIEcOP/ggxN1bac6wng1opvQnA2r9KKywfPgFHjy12/eE6ul
 njWA==
X-Gm-Message-State: AOAM5316Zfxu77cLKFUVCrSk7tsFEGQAJbxMe8L2dvtCl/o1893uMwrF
 XFatyMDFv9ncazfLCGn/7gI=
X-Google-Smtp-Source: ABdhPJzMcESu5Cbx/Bm26PisXXb7ZZwoEnDbyx0Z2S+ITP+5j3TnYCXDCPVUJswl8ArWoRKXLmmuoQ==
X-Received: by 2002:aa7:c256:: with SMTP id y22mr6475707edo.324.1602694930983; 
 Wed, 14 Oct 2020 10:02:10 -0700 (PDT)
Received: from neptune.lab ([46.39.229.194])
 by smtp.googlemail.com with ESMTPSA id g3sm76012edy.12.2020.10.14.10.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 10:02:10 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Subject: [PATCH 1/5] [RISCV_PM] Add J-extension into RISC-V
Date: Wed, 14 Oct 2020 20:01:55 +0300
Message-Id: <20201014170159.26932-2-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201014170159.26932-1-space.monkey.delivers@gmail.com>
References: <20201014170159.26932-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: baturo.alexey@gmail.com,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 space.monkey.delivers@gmail.com, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
---
 target/riscv/cpu.c | 4 ++++
 target/riscv/cpu.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0bbfd7f457..fe6bab4a52 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -438,6 +438,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         if (cpu->cfg.ext_h) {
             target_misa |= RVH;
         }
+        if (cpu->cfg.ext_j) {
+            target_misa |= RVJ;
+        }
         if (cpu->cfg.ext_v) {
             target_misa |= RVV;
             if (!is_power_of_2(cpu->cfg.vlen)) {
@@ -516,6 +519,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     /* This is experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
+    DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index de275782e6..eca611a367 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -66,6 +66,7 @@
 #define RVS RV('S')
 #define RVU RV('U')
 #define RVH RV('H')
+#define RVJ RV('J')
 
 /* S extension denotes that Supervisor mode exists, however it is possible
    to have a core that support S mode but does not have an MMU and there
@@ -277,6 +278,7 @@ struct RISCVCPU {
         bool ext_s;
         bool ext_u;
         bool ext_h;
+        bool ext_j;
         bool ext_v;
         bool ext_counters;
         bool ext_ifencei;
-- 
2.20.1


