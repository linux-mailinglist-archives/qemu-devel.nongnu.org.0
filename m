Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC7360970E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 00:35:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omgrn-0002xP-Tr
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 15:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG4f-00074K-Nf; Sat, 22 Oct 2022 11:06:10 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG4e-00024Y-A9; Sat, 22 Oct 2022 11:06:09 -0400
Received: by mail-ed1-x52b.google.com with SMTP id e18so16102524edj.3;
 Sat, 22 Oct 2022 08:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pGBR0uW70Gj4MBPT0PqLYE43W0BADt/1wu3qTUQp2Ok=;
 b=FO2D8Gc98+0Noj0XNb/sx+4HBI3LpQuMVLYkQ7ilhJnFcw1C0NaMGojx5lFqocguYp
 OP/ipdRo4K6rRVs6thRxXrdvYRJEgxFFY7ANpQG/sVoMZ1NktZFuD9ftJR788ku1pLq3
 uuZw5PgV+S6jpVDnhPLadou5wWRm7D+sdEIl6CxJDOyJRxrlj0zr/5o5TKxbOaLC4Ios
 oFo5whdJy0nJ9xOgNTtE7kmn2/+KOc0Esmdqcedw2G3w8gUzO7uDl0bu4dcIettBO/x/
 BkeIMX8Kd91epWwVg3N0lGRV1iLVPN21p5CIUyv7NIPrS/btMQoAHe/NF6rw2gd3H9l7
 uaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pGBR0uW70Gj4MBPT0PqLYE43W0BADt/1wu3qTUQp2Ok=;
 b=xDmjBtcGzGFxhDwKXUOP7o4ooZVLvuQukJra1eWOSmSfXakWXoJGcLjzl8pbEG0bx0
 HETkdWVMYM0DDr3PMggnInICAzf0DzGaOdwcF1SwVX/w/eTNTObhodGshyeB+2wRrk6A
 MHd+ARqNH8Q7lWZYGTeOfh15vEVpWG9vDDcRK3hFSTF23XglM2U/tE0mnHOQnzHB8lIo
 8TjImvC9ZzGHb6ROqNFsyVXrkXJVd5tLHsbdz0cJkbGjpkO1Um9c+WR7yXLbc9eHymru
 VqYJRV3CZ3Yn91qPkCkwKr1xNTXnB8cIfh8EanWW4k6MeWiucduDsRKHgJwVI9jqvBds
 zLnA==
X-Gm-Message-State: ACrzQf0Fuhok4pQ7wQuoY3qXojwO2n6QyYh6iuejreEqh4N+gcyx97mz
 2gzaWAQ9kEFwB6tntAsLLgNyiT5fe2TrvQ==
X-Google-Smtp-Source: AMsMyM6xR80tNu2r6exAnMk0ECE4/rGQPgTOALlzPz66ajTiZBeFeD9u+PXAVDGvtdy3Li0v7YSUMA==
X-Received: by 2002:a17:907:3f90:b0:78d:afad:2a78 with SMTP id
 hr16-20020a1709073f9000b0078dafad2a78mr20734013ejc.68.1666451166284; 
 Sat, 22 Oct 2022 08:06:06 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:06:05 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 07/43] hw/isa/piix4: Rename wrongly named method
Date: Sat, 22 Oct 2022 17:04:32 +0200
Message-Id: <20221022150508.26830-8-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This method post-loads the southbridge, not the IDE device.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix4.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 15f344dbb7..c88d3bf3bf 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -141,7 +141,7 @@ static void piix4_isa_reset(DeviceState *dev)
     pci_conf[0xae] = 0x00;
 }
 
-static int piix4_ide_post_load(void *opaque, int version_id)
+static int piix4_post_load(void *opaque, int version_id)
 {
     PIIX4State *s = opaque;
 
@@ -156,7 +156,7 @@ static const VMStateDescription vmstate_piix4 = {
     .name = "PIIX4",
     .version_id = 3,
     .minimum_version_id = 2,
-    .post_load = piix4_ide_post_load,
+    .post_load = piix4_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_PCI_DEVICE(dev, PIIX4State),
         VMSTATE_UINT8_V(rcr, PIIX4State, 3),
-- 
2.38.1


