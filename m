Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D903403825
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:44:50 +0200 (CEST)
Received: from localhost ([::1]:44518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNv4S-0006EC-LO
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNub6-0003fM-0f
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:14:28 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:43909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNub4-0002QY-Hp
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:14:27 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 n7-20020a05600c3b8700b002f8ca941d89so1099629wms.2
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PeFhdW3ldj9N2neDhskeRk7Vv8dHVOjd4x2dNblRlbI=;
 b=NqHmh2gGxj+++5RHT9EL8b7aJvtga7zyWU6r+6Da9NySU+v0BdR54Fvhm5taPEEPfx
 n9nFIwpr7hgLbZ62IJrUbQvuO9J8SJxy2+LYkeaOHCQhR+Ejlq0q5tTL6k51CfZZGeus
 uql++iPJZ0UTBqnQixhBlfZxZZoiER5Z0eWwQbDV9L/gWIDErDBGdQVXJD0wfbG5Wh5J
 qAoiKxFmgVLrXwJzIkBFGNEj32WLFVGHQTzYgn7I+Tu23EkKF4x+bN+jfoyQ8DTCsuay
 0kRhIRFS8gVOhe5u9rgfraXgcQyWUE6wSU704Twm7G0GXtHKtpK7BTA2vIPOBFrrY1Zl
 Ccag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=PeFhdW3ldj9N2neDhskeRk7Vv8dHVOjd4x2dNblRlbI=;
 b=bByqJ51Ifnc7XZe7/BORtWlpDKYmdQoEvrs81jdNUE1f396qQEVEHUN1hK9BSveVXb
 LskOEE3cdGlbXDHUTx8YgAk64jS90L+xylZeferGrclSm9JwidYHEMWEkFkP43yHpLo7
 xgyRGBZSIZOsUlYYTzYzuvW1/rRihZpIdvr+bnWlFLjpzMBdSBI0jHrDYleF+CsXTmy9
 I/oCldjNWsPQXhxw2A4/UB0ThjgrwViL1QvpK9yyoQ2gioGVj/F8xLla3PPYejJoFnev
 JiiigUFRTmQuX0SHdbWWT5PeyVyIF/TlrZeLbhg8p/V3eUMRy7VQtUKhRVneOGuAfGi4
 YK1A==
X-Gm-Message-State: AOAM530Wq9TaMgIufZcjrFYkwEzIVrRF2BkjK80i1NtMANYOt7iOZ/cP
 ojABx4ZUdOdJyk6QS5yWnszTzoPB/2Q=
X-Google-Smtp-Source: ABdhPJxLgcyGou+/KupKEiaNOz0SrtQful7/Gr6FCdtJpQRdaK/28FIjFhae0wf3osBa2THqdVkZ3g==
X-Received: by 2002:a1c:80d7:: with SMTP id b206mr2740952wmd.36.1631096065041; 
 Wed, 08 Sep 2021 03:14:25 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r26sm1543112wmh.27.2021.09.08.03.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:14:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: remove dead variable
Date: Wed,  8 Sep 2021 12:14:16 +0200
Message-Id: <20210908101416.273317-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 ui/meson.build | 2 --
 1 file changed, 2 deletions(-)

diff --git a/ui/meson.build b/ui/meson.build
index 7faa42eb3f..a73beb0e54 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -105,8 +105,6 @@ if config_host.has_key('CONFIG_SPICE') and config_host.has_key('CONFIG_GIO')
   ui_modules += {'spice-app': spice_ss}
 endif
 
-keymap_gen = find_program('keycodemapdb/tools/keymap-gen')
-
 keymaps = [
   ['atset1', 'qcode'],
   ['linux', 'qcode'],
-- 
2.31.1


