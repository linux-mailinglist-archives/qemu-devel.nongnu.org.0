Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9221A60FF
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Apr 2020 00:57:13 +0200 (CEST)
Received: from localhost ([::1]:38252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jNlXM-00043A-Pt
	for lists+qemu-devel@lfdr.de; Sun, 12 Apr 2020 18:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49936)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJO-0001it-31
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 18:42:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJK-0006BJ-U3
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 18:42:44 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:54677)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJK-0006Ag-Ni; Sun, 12 Apr 2020 18:42:42 -0400
Received: by mail-wm1-x32e.google.com with SMTP id h2so7925008wmb.4;
 Sun, 12 Apr 2020 15:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bApzeehHQvaZ5RZ4EwLCFOZnVCZVtwLLMYEWft8h2tw=;
 b=YNkaV1gyW63dSllGD8BM7xLOzjMiqY1FQIy6kxkAqv4WrWFueAzPJChEPmYrWsiVuF
 iBxugnDZXthtkisdZjwJMXHO6ro/F7zpddUEWyJil8zSWaNx7GgPH6Ky4vgIRulUfvML
 LhIjk+BUQrj/O5+E72jJHawdWKuwYTVm/DBden1hghTXlndcUhRZfhnz2VZ5byw9eQZq
 KftPtGiHQR6LVEnrP1W7te8pOsxxgqtdiC5JKTrmIERb0H7mzfoTkA3uqzKLcAYJXNLj
 09749hBuiJDBYe3xkWY3CU0qAwdYSLSGT2UTpsz8zhPaIpMtCJLbKmcLQvyPU8g8AOMa
 9pJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bApzeehHQvaZ5RZ4EwLCFOZnVCZVtwLLMYEWft8h2tw=;
 b=Je/V1tEBER6M2KfgidS5TUjmzhnugmqyvf6qwB6NoEq40DCBXcqmpaVT3o5TwNCs9m
 EWZDW73rhq69z/X9xn3msDsWSMszeLnC2v6OM308mepSRHP94oKEpqKx28N6o2si5Fx7
 MsAF/VSo6t0PmtebyF0mu53/l4cA7gsCVQGlBVpylPFZbmIiXVbQpPJXKJ2blfd4vrhY
 WqT3xZWVcMi506n7r6Aul0Wn02kNddvop+I3ky0JGFafUAWh9FR/CbPsV1renH+rU9L+
 qpIdaXnluGxVWpbFrnB637OGNwDLmkto+o6AYENjuGMIGRb0cNLEUPFFIf5nWoQpsA3Q
 dwXQ==
X-Gm-Message-State: AGi0PuZdNyWwNpzHgm0pE5Iaq2BBik2XTr5f5bKNN1KLfCOFY6aGqAu2
 aJ0X2kSxxIDptPD98krnbbaksWEq+4b8Lw==
X-Google-Smtp-Source: APiQypKcJY/AnhWB3Mqh16JT0Fy/lA330YrPZhDd59/L6Rikkp+nVhNT2aYUwamA2lezPMDACXjLDw==
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr15743438wmk.158.1586731361205; 
 Sun, 12 Apr 2020 15:42:41 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f63sm12083825wma.47.2020.04.12.15.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:42:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 v3 14/23] hw/arm/bcm2835_peripherals: Add missing
 error-propagation code
Date: Mon, 13 Apr 2020 00:41:35 +0200
Message-Id: <20200412224144.12205-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412224144.12205-1-f4bug@amsat.org>
References: <20200412224144.12205-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32e
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/add-missing-error_propagate.cocci \
    --keep-comments --smpl-spacing --in-place --dir hw

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2835_peripherals.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index edcaa4916d..a111e91069 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -289,8 +289,16 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
      *   SD3.0_Host_AHB_eMMC4.4_Usersguide_ver5.9_jan11_10.pdf
      */
     object_property_set_uint(OBJECT(&s->sdhci), 3, "sd-spec-version", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_uint(OBJECT(&s->sdhci), BCM2835_SDHC_CAPAREG, "capareg",
                              &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_bool(OBJECT(&s->sdhci), true, "pending-insert-quirk",
                              &err);
     if (err) {
-- 
2.21.1


