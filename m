Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A6A547453
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 13:41:03 +0200 (CEST)
Received: from localhost ([::1]:41252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzzUD-0002ok-Os
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 07:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyUJ-00072Y-9Q
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:37:05 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyUH-0006mS-LR
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:37:02 -0400
Received: by mail-wr1-x42b.google.com with SMTP id o8so1500251wro.3
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O2KNO1eSWOQ3ti2siYU51lQWfPlOGu3eyr5kiTAWNd8=;
 b=eDZFk8rGUV/bAEmIueW8/1nk6TrLKB9NEQuBIelXCq58qYMyE2xQHXmHJnBPLPmGAU
 ol1ZGTv61FjZUaOXb0/yXe6SLUBjHB/pkfsvQ+LvuVNl0I89UguSAE7lqKNed9gXdYIj
 mzP23Y3T2lF0t+yUlvAzkaLz/R1NsKJ22tOpSIv2PT6rJdEQHDzUOeMnLZnSERcRfJ74
 QTR70oivoAv1Sm1/eWX9y6skpV0gZ+zpMXfUcwb44ulzBh8SuKSsSVFq3hOIgU6OkSby
 bEJha2qz/YFbHOX03vDsoiPk04vamJnC80ZnW0TZ8MxvFJ4qNWAjh8UTgcl8nncFzT5t
 4qPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O2KNO1eSWOQ3ti2siYU51lQWfPlOGu3eyr5kiTAWNd8=;
 b=KB0L30x+fn2ljLFLZXZ3zKAksnadKrQyBljv6IF9ttp6u8K1WxvWR0R1739W+KKrkm
 BU0gCQtfr13kFAIyrKTyHIoS/VLmzt6g0UgD6adN8rPb8uYc290Hrf2MuNFeos7yKI4Z
 yrV+oEFJLeM3VzgM6yyDoK84noP8Vvz6kmbwQy6Ek9Iz2MRz8eWwn9bmmifnpMUffmk3
 l+CuDeqLqbSkq0WeimPjGNx6EsYJxUfLnmq53r0h9B3zn9K8V0KpAtW2qSahkBSXAR50
 CGLZp6PQqEchJDqKY6yB67c6/n35zpMD9Cwg+muD5I4gJmooCedgilfadNg82pBtvvRy
 4jlA==
X-Gm-Message-State: AOAM531BBZnvuoUmz5qDEKMLU0PT5DrJosTxmmJ+Tdmhg+dSd6ra5sBR
 SBxbPlwSKqKoXGJe+din15imyzOAOU0=
X-Google-Smtp-Source: ABdhPJytk5jNARQuF9bTC8ka6+zWB5Gc4vmsatroajoKFBgsXdamawkO7QwLnidxuD93hTZiD3z6+w==
X-Received: by 2002:a05:6000:1446:b0:218:5a5d:6cb5 with SMTP id
 v6-20020a056000144600b002185a5d6cb5mr19592132wrx.629.1654943820755; 
 Sat, 11 Jun 2022 03:37:00 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 x5-20020a5d54c5000000b002167efdd549sm2230564wrv.38.2022.06.11.03.36.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:37:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PULL 44/49] hw/i386/pc: Unexport functions used only internally
Date: Sat, 11 Jun 2022 12:33:07 +0200
Message-Id: <20220611103312.67773-45-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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

From: Bernhard Beschow <shentey@gmail.com>

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220520180109.8224-5-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/pc.c         | 4 ++--
 include/hw/i386/pc.h | 3 ---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 272d7227d5..774cb2bf07 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -572,7 +572,7 @@ static const char * const fdc_container_path[] = {
  * Locate the FDC at IO address 0x3f0, in order to configure the CMOS registers
  * and ACPI objects.
  */
-ISADevice *pc_find_fdc0(void)
+static ISADevice *pc_find_fdc0(void)
 {
     int i;
     Object *container;
@@ -716,7 +716,7 @@ static const int ne2000_io[NE2000_NB_MAX] = { 0x300, 0x320, 0x340, 0x360,
                                               0x280, 0x380 };
 static const int ne2000_irq[NE2000_NB_MAX] = { 9, 10, 11, 3, 4, 5 };
 
-void pc_init_ne2k_isa(ISABus *bus, NICInfo *nd)
+static void pc_init_ne2k_isa(ISABus *bus, NICInfo *nd)
 {
     static int nb_ne2k = 0;
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index b58ac343ba..eb3d093bca 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -167,7 +167,6 @@ void pc_basic_device_init(struct PCMachineState *pcms,
                           ISADevice **rtc_state,
                           bool create_fdctrl,
                           uint32_t hpet_irqs);
-void pc_init_ne2k_isa(ISABus *bus, NICInfo *nd);
 void pc_cmos_init(PCMachineState *pcms,
                   BusState *ide0, BusState *ide1,
                   ISADevice *s);
@@ -178,8 +177,6 @@ typedef void (*cpu_set_smm_t)(int smm, void *arg);
 
 void pc_i8259_create(ISABus *isa_bus, qemu_irq *i8259_irqs);
 
-ISADevice *pc_find_fdc0(void);
-
 /* port92.c */
 #define PORT92_A20_LINE "a20"
 
-- 
2.36.1


