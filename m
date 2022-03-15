Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4764D9BEB
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 14:13:26 +0100 (CET)
Received: from localhost ([::1]:33032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6zN-0002wV-0s
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 09:13:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6iR-0005dA-Hg
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:55:57 -0400
Received: from [2607:f8b0:4864:20::636] (port=40511
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6iM-0008Cd-Eg
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:55:51 -0400
Received: by mail-pl1-x636.google.com with SMTP id h5so14792143plf.7
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KNSrqoEq2GhUevDTVk/vUxoGKtaQfRE5FRcTgjCh7JE=;
 b=D16b8kP7WZ0UZar4yxnBdthqem5/SJs9xdC6OPinOWKfjNU7yhnKCySKQcAKVZs1DF
 9ZjSwKD0lr3N6qTAp2modP4OXYUuAkDH+dq+1sJlHmsIC2xNMcS+Vtvne5zkW7GKhKNb
 uSKbZRJY+RKEuRMn8Q7zWdkTN3I2DO4NxGxdA5OE6XMrcccgKaLPSKq0XXfrMms226eM
 a+2J25v4gFmFtZUrK6l9Gn5cLFEiJhTmXo68HdO30IYnK2SalW1n8Ke8mZ7IPAIl9rgu
 LHhC9gNFhy2Y6djnECwlOnTnCmZ4PsS7vRnAHk7gwM7QOWP8UI71hraIIr4/Y+hKuwxl
 /Ivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KNSrqoEq2GhUevDTVk/vUxoGKtaQfRE5FRcTgjCh7JE=;
 b=ldCeBDbJvdp8TsMuBwafkgecC4pRn8gyzNv5z62YWZP0GsdIXAS2bpAdP2dMpz7Y9Y
 xcB+PG6F9fPhxW8T/Mmc7CEl0yGbcm2k27PfH8oNuHbx1+tG2dqnD51bBgSwrCD/LpYb
 mYmJuw0kVjaalefV2etJfm7eTnQOshiB9Ft15h0KVhEdtP+RcNvSPEVEs7912uxvYHgO
 Mk1m4U4v+KQ2UlzocbVROEOckjki+D3dMHUSr+J1905/vEhEvRWzfnh/mrL71PqPtva7
 L379S9aBiODXrGPM7lUBhhu7xSs3LaOfpe45iRLQ6F4i5fQsiDQo5a5ePJCtrmhV6yNy
 Gd7w==
X-Gm-Message-State: AOAM53250GeiaiyLcQrMooaZKGFizBMrJ27kYzA+X8QcANGYYQy7MsCi
 WHdMVaZVK5kJ/FwIsMvg2ZUrQNQcqnY=
X-Google-Smtp-Source: ABdhPJzDuxlfZfC/cIa0mt/e6k0NVvj86L+eOm4gjjABp9ahjUdRqRo4lSJ5m312vBsgHrjBIX5eIA==
X-Received: by 2002:a17:902:d4c6:b0:151:d21c:7eb7 with SMTP id
 o6-20020a170902d4c600b00151d21c7eb7mr28120340plg.148.1647348949008; 
 Tue, 15 Mar 2022 05:55:49 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a17090ad99000b001bcbc4247a0sm3034474pjv.57.2022.03.15.05.55.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Mar 2022 05:55:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/21] meson: Resolve the entitlement.sh script once for good
Date: Tue, 15 Mar 2022 13:53:42 +0100
Message-Id: <20220315125350.82452-14-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
References: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Commit 235b523dba ("meson: Use find_program() to resolve the
entitlement.sh script") didn't correctly fixed the issue, as
the script is still resolved for each target. Move the check
earlier, before processing each target.

Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 meson.build | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 351f9f4360..6e8fa4ab31 100644
--- a/meson.build
+++ b/meson.build
@@ -3073,6 +3073,10 @@ common_all = static_library('common',
 
 feature_to_c = find_program('scripts/feature_to_c.sh')
 
+if targetos == 'darwin'
+  entitlement = find_program('scripts/entitlement.sh')
+endif
+
 emulators = {}
 foreach target : target_dirs
   config_target = config_target_mak[target]
@@ -3230,7 +3234,6 @@ foreach target : target_dirs
         install_input += meson.current_source_dir() / entitlements
       endif
 
-      entitlement = find_program('scripts/entitlement.sh')
       emulators += {exe['name'] : custom_target(exe['name'],
                    input: build_input,
                    output: exe['name'],
-- 
2.34.1


