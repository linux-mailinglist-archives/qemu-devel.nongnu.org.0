Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A47609A2F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:04:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omhQk-0007iD-3v
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 16:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5V-0007JL-GN; Sat, 22 Oct 2022 11:07:01 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5T-0002JF-PZ; Sat, 22 Oct 2022 11:07:01 -0400
Received: by mail-ed1-x536.google.com with SMTP id m15so16055352edb.13;
 Sat, 22 Oct 2022 08:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kBMXBig4HIyHAZz2Q59/QE778riCp4LtfSIp8xixZNk=;
 b=XEBKSGPsQcm68D/REGXURH4NCEol4q6Qa+SZB3i/tizPgUQVhd9FndAMqu9ZgMn4tF
 cXwdgiYfNCR6g/QpagRDe8o+/fVTWhyKEMJ9kuzEy9Ob7/uzFtMCHY1pZ0BUM0VwkBB2
 9+DMcqGGDt1PjkmP3zXZRii04ZbNmLYcUWTldme1iow/oIMOCqLbkrBMROdZ7UvrCs2T
 XiS3LjUPN/2Ycn2lAJVRyzCT4lE8zRC4kuicj7Pot57Vevj1e4a2No8mLPIuuu9Eg4gN
 LxTsirw01zgKeuXEx2IBmg25UBrfDx3f7Vm4jFo7Kp7ULWjEL713oKXy/bSEVg9lwnOj
 Kb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kBMXBig4HIyHAZz2Q59/QE778riCp4LtfSIp8xixZNk=;
 b=BknNN5RHIAGKus6efGPsSgvjnUbhOMw49Q5edBAbPfym2kDPwm5DKePjpLkrBPvkEP
 p3uh0qwyuWSZNP+avAENLxdSqi9QItGjE7GdyZEbYRkHbBbgxnrEP1JIn+Us2bPFnmft
 FS7BX23xdnub4I3ST7sx7zjpz5WiX8eOHIhxdRHU3UZRXk/UBqTijyMRVxZfw10TQVhx
 zWzqbZP3YeKrRmYQDWkxzpKLTrZ2HFvzoadBm82A06B5q3oA78oB/TY4OpWonVJ2Wcoi
 kyqNvHdc3OsBLfoAPmVEzvpbOyFeKU9pQYAV1ZEtz6nM0cMuBFnZR08vL6jiQtClx/5s
 SPkw==
X-Gm-Message-State: ACrzQf0/oJAiyDuZdd5CJy+A4H/s2xXBRJKY0VNKeYYcSKu//32QdZp0
 YyKxVSvXHyiCj+Np+OMgA7XnDQ5acLzKyg==
X-Google-Smtp-Source: AMsMyM7mc93qfJM4KgGzD1NWpwBnj8+FDKgDreBbM2INKTskSreVuTvLK2RRNNx0A3sCvvlkhkb+Yg==
X-Received: by 2002:a05:6402:5253:b0:45d:5914:245b with SMTP id
 t19-20020a056402525300b0045d5914245bmr23129479edd.227.1666451217746; 
 Sat, 22 Oct 2022 08:06:57 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:06:57 -0700 (PDT)
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
Subject: [PATCH v2 26/43] meson: Fix dependencies of piix4 southbridge
Date: Sat, 22 Oct 2022 17:04:51 +0200
Message-Id: <20221022150508.26830-27-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
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

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 configs/devices/mips-softmmu/common.mak | 1 -
 hw/isa/Kconfig                          | 6 ++++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/configs/devices/mips-softmmu/common.mak b/configs/devices/mips-softmmu/common.mak
index d2202c839e..416161f833 100644
--- a/configs/devices/mips-softmmu/common.mak
+++ b/configs/devices/mips-softmmu/common.mak
@@ -23,7 +23,6 @@ CONFIG_APM=y
 CONFIG_I8257=y
 CONFIG_PIIX4=y
 CONFIG_IDE_ISA=y
-CONFIG_IDE_PIIX=y
 CONFIG_PFLASH_CFI01=y
 CONFIG_I8259=y
 CONFIG_MC146818RTC=y
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index a021e1cbfc..1aa10f84f2 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -45,7 +45,13 @@ config PIIX4
     bool
     # For historical reasons, SuperIO devices are created in the board
     # for PIIX4.
+    select ACPI_PIIX4
+    select I8254
+    select I8257
+    select I8259
+    select IDE_PIIX
     select ISA_BUS
+    select MC146818RTC
     select USB_UHCI
 
 config VT82C686
-- 
2.38.1


