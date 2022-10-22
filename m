Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FDE6096F8
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 00:14:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omhJb-0006jc-Ld
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 16:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5H-0007ET-MP; Sat, 22 Oct 2022 11:06:47 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5G-0002FL-4g; Sat, 22 Oct 2022 11:06:47 -0400
Received: by mail-ed1-x536.google.com with SMTP id w8so13814923edc.1;
 Sat, 22 Oct 2022 08:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wl16VqDv6IvuOIAdJh9KzEybJStJI1TitkoYrynXms4=;
 b=S+8Ydmkc1DcLIUgY5r/j179bPu/hNu8zkL7PU+sIeDZFUUzbw1HWJtcTUhJ+ltMuu7
 Y9k8+lhuBi68ZgwCGS8pNZEDklP337Rq2Otug0wzrvNeGO45prrrUgIsDdHx+IX7tEwX
 cAlbKHWPoi2Ow/rmMdTUcDNRHmuqIEvB27W4FWT6ysmV9b1E8XXjzCkH5BLyi2rsVvOM
 ypygjoFqLoqniRalz/0sL3n4KkDE/Hq8kRl74nDUH3iT96zoXTVOZk+/0ec276i6b30X
 e6ITTjFza78+8YTc/MhGMoIy/z8MNiQRo5VWhVzxjLVV5DDh5qxwxyvlBukFEGrs5UF9
 dA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wl16VqDv6IvuOIAdJh9KzEybJStJI1TitkoYrynXms4=;
 b=46JMP13xXEgODMqfjmuWPA8QuoTnnk6x4KKrYqF2iyzSul940rAMjrP1xp08iy/Atp
 4Il0G5OlRHLWml+q62+8N1D8rY3PvGzdVZqtggzQspkY7N/H4tqPpxHhm2Sj5WUSE9i6
 hy5uRXLzbOTZqFBHoTzDQy17MTpPfoP03IQ0h/KduMacZ420uIP/82DqiWvAwlZ5hbl4
 Juy5px/yRyQTBiJwEjX2r6PraisulmtjqLfcqyvIRBupCp/lXnWuMRV8+YrYKY7Zllky
 qMt7S5o416/hlu/zypGGuT6bIjFn+oiavYrFbko+LMmGyX4MBqfksa8FmcN4e6wPrF2S
 3k1A==
X-Gm-Message-State: ACrzQf1Vj8oEGwZZLlA5qeYX7w5DrxU6SJmGcHQmoe/NpGlL3R0fRVQl
 avvufAeKeWKF5Y31J9JCIMEUIiTVYv139Q==
X-Google-Smtp-Source: AMsMyM4qQDy6IpJqCGyWXDdf8LKtKgQOfMihMhTQn0cfUnOYJtAciTn0s1FnnvUpqAtBTXQCgkVvUA==
X-Received: by 2002:a17:906:401:b0:73d:af73:b78 with SMTP id
 d1-20020a170906040100b0073daf730b78mr20691269eja.122.1666451204035; 
 Sat, 22 Oct 2022 08:06:44 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:06:43 -0700 (PDT)
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
Subject: [PATCH v2 21/43] hw/isa/piix3: Rename pci_piix3_props for sharing
 with PIIX4
Date: Sat, 22 Oct 2022 17:04:46 +0200
Message-Id: <20221022150508.26830-22-shentey@gmail.com>
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
 hw/isa/piix3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 9de7287589..8dbf22eaab 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -381,7 +381,7 @@ static void pci_piix3_init(Object *obj)
     object_initialize_child(obj, "ide", &d->ide, TYPE_PIIX3_IDE);
 }
 
-static Property pci_piix3_props[] = {
+static Property pci_piix_props[] = {
     DEFINE_PROP_UINT32("smb_io_base", PIIX3State, smb_io_base, 0),
     DEFINE_PROP_UINT8("pirqa", PIIX3State, pci_irq_reset_mappings[0], 0x80),
     DEFINE_PROP_UINT8("pirqb", PIIX3State, pci_irq_reset_mappings[1], 0x80),
@@ -412,7 +412,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
      * pc_piix.c's pc_init1()
      */
     dc->user_creatable = false;
-    device_class_set_props(dc, pci_piix3_props);
+    device_class_set_props(dc, pci_piix_props);
     adevc->build_dev_aml = build_pci_isa_aml;
 }
 
-- 
2.38.1


