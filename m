Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BF35760D3
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 13:47:51 +0200 (CEST)
Received: from localhost ([::1]:46432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCJnS-0000DY-8Q
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 07:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oCJgp-000217-G6
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 07:40:59 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:45797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oCJgn-0003kz-TK
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 07:40:59 -0400
Received: by mail-pf1-x42a.google.com with SMTP id y9so4426401pff.12
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 04:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GMoUZoKqS1w34DUOdXlyslRL0IWOuUR3SUUgT2K9JrM=;
 b=FbXHq5F5z17vD5m7BsztYwsNV8Girn80oIIC60AOGr09Y8qQELZ26KNAwnRcWnNZpV
 ykcZoOo//TY6c+UGxDT1QmII49qZ8N6tvL7Y7ScA/2cSDkPHvUoQkDx6ohcs1fdXK12c
 yzVvCeNwZdITyqeikSV5qdhkUdZpEhmeLkoc9rVbuU0k4aM8BGHRxqABSK0KZda/6Yr/
 2561D5od3C1ORwKdpFBTOO31Ai+TQOR+ruj7xkm90IZ05K3Zp6DBxglBtt5eqWfEfI13
 33RfXqI0IM3eahPkONIQF8dEO9yQJ+mlxWuoY2okPm7a/TDwZvJpboJ6JMbaORr81Qzp
 7ckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GMoUZoKqS1w34DUOdXlyslRL0IWOuUR3SUUgT2K9JrM=;
 b=8C7UEnOpIeoq4D/RG/ujZenRjUtXI4sBmUvAM1zYT/zrJw+2vDagMJHhecVon/uUeI
 L2FEWp64o+BFR0blpWA1LjeIsZ4nTU3Jan2EXPMX30+FuTUcEk7F/5bY+DN1T1y+sMtH
 txCMZiKr6K09lJA6dwAYmqRuDyBcbQudvyvKCnURDXSKUJbzA0icrE/BhHAXJ0r06iMS
 kYEY0wKaB/mV71xEexfkKPSv45Lsw9ZoNCtkRoQzdYLOlYCn22v5WoCgfMdEHs6aH7iK
 8j7WTc0skeVAlP574UdFoz5hFZ5Sbsty3DgoChLEOOIUrbKhLkt7JU5uHpZ3EaRnkQAt
 OLrw==
X-Gm-Message-State: AJIora8+MrhZDYR6tSfkf0u+vaFvtWtHQg/OldY/ZkpH3LGEmKPoEHmf
 Y+pvHNGamna0/HbY2usqgR6uh8Pw/Po=
X-Google-Smtp-Source: AGRyM1v9y++4YrTZr2FTyfuTXXN0YbuFf9EoMOsAYnxK+M4PxCFWm5fKqu8QLbapKGaMbcZtUEOkbQ==
X-Received: by 2002:a63:e457:0:b0:419:a843:5b46 with SMTP id
 i23-20020a63e457000000b00419a8435b46mr9104116pgk.287.1657885256264; 
 Fri, 15 Jul 2022 04:40:56 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d554:ffbd:f962:2efd])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a170902ca0400b0016c67a3b7d0sm3258627pld.61.2022.07.15.04.40.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 15 Jul 2022 04:40:55 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v2 3/3] meson: Allow to enable gtk and sdl while cocoa is
 enabled
Date: Fri, 15 Jul 2022 20:40:39 +0900
Message-Id: <20220715114039.59790-4-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220715114039.59790-1-akihiko.odaki@gmail.com>
References: <20220715114039.59790-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As ui/cocoa does no longer override main(), ui/gtk and ui/sdl
can be enabled even ui/cocoa is enabled.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 meson.build | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meson.build b/meson.build
index bc5569ace15..7baec7896ef 100644
--- a/meson.build
+++ b/meson.build
@@ -583,12 +583,6 @@ if get_option('attr').allowed()
 endif
 
 cocoa = dependency('appleframeworks', modules: 'Cocoa', required: get_option('cocoa'))
-if cocoa.found() and get_option('sdl').enabled()
-  error('Cocoa and SDL cannot be enabled at the same time')
-endif
-if cocoa.found() and get_option('gtk').enabled()
-  error('Cocoa and GTK+ cannot be enabled at the same time')
-endif
 
 vmnet = dependency('appleframeworks', modules: 'vmnet', required: get_option('vmnet'))
 if vmnet.found() and not cc.has_header_symbol('vmnet/vmnet.h',
@@ -915,7 +909,7 @@ if not get_option('brlapi').auto() or have_system
 endif
 
 sdl = not_found
-if not get_option('sdl').auto() or (have_system and not cocoa.found())
+if not get_option('sdl').auto() or have_system
   sdl = dependency('sdl2', required: get_option('sdl'), kwargs: static_kwargs)
   sdl_image = not_found
 endif
@@ -1181,7 +1175,7 @@ endif
 gtk = not_found
 gtkx11 = not_found
 vte = not_found
-if not get_option('gtk').auto() or (have_system and not cocoa.found())
+if not get_option('gtk').auto() or have_system
   gtk = dependency('gtk+-3.0', version: '>=3.22.0',
                    method: 'pkg-config',
                    required: get_option('gtk'),
-- 
2.32.1 (Apple Git-133)


