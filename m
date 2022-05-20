Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9AA52F1FF
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 20:04:55 +0200 (CEST)
Received: from localhost ([::1]:58136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns6ze-0007bB-3g
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 14:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6wZ-0003uP-IH; Fri, 20 May 2022 14:01:43 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:45875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6wX-0004Fp-Bu; Fri, 20 May 2022 14:01:43 -0400
Received: by mail-ej1-x62d.google.com with SMTP id jx22so3547018ejb.12;
 Fri, 20 May 2022 11:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BkoLUUqOUpg64L+o/OfEbmvOBo9ja3MouuFs8JpKIj8=;
 b=BYtvYPnKYOAF1t+tyRv29oQfnkv+GPqtuiiXtB7AcbkDCskvym0OmFK+EFADax3SmM
 WlGYWbVxK9Yby6cdah2TjbnfWfR+g6ZOHrOMnYcJ+Zws1oQS74g9WEL/iS3Urz/nBklx
 MOH8yxnSRTD0fmLjpr0Ja+SxvVf+ac8w5XCdBIOhMagSysCfjSiojkgkO9IXVx+YOxGY
 SK65rNFxZ/l+O6v/jeVqEhQx2wrmeP9Ef3s73ADFLzNr3BxOm51Dh1hbRBMssium/hlE
 3xTXh6r6OuE3bhPH1ogHcPF7FazQaM3+1NGUTgnjxhzsAbS8MRqPO1YwfnHpHH3gSEkk
 uD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BkoLUUqOUpg64L+o/OfEbmvOBo9ja3MouuFs8JpKIj8=;
 b=HRwGGMXBZRK/h7Q7I03tgIOfBGTSJTLLoJIRW/8grlC2+Whw9421LorL/64FtPXeIe
 S6uwQh9dpoWwNCzLsx3kT48ZYP3/yWdfO8A5Yr+E9AczRrOCFcuk5jQrbxiIGYpltLd+
 nP3oGS/PuPi7bfvOjOe/sXjOmmIPw8L8t0tehvQv0n9q5kM42Kx47oly2L82b4Z+hSJn
 I8se+UMM1pfy5TZXowAt3zV0AmXNmNA9gXyTpY2hVu4BpfKagIssOCFkarvKUMp4eqdc
 mZBRXn2U55LV5vtVSwYjhm0L/CSso4KjM6tznkeREcegzgrDgiUTJUi36shTAPjmQuKE
 vTHQ==
X-Gm-Message-State: AOAM532vPlWkZF52smTgRsmy+mluiPwUDfjD+A//UFHB6pnYy64m8sUY
 ut+qOPbAC3xqwRaExU2fAWkiSjeDWBU=
X-Google-Smtp-Source: ABdhPJw00MGR53Z7uJLSh7wpT3r6kiRU1wEasHF3SGPdUdxIllmfISOG7hDBuXD8O6PieF+KkJ4NTg==
X-Received: by 2002:a17:907:16a2:b0:6f4:eeb1:f7de with SMTP id
 hc34-20020a17090716a200b006f4eeb1f7demr10049326ejc.446.1653069699542; 
 Fri, 20 May 2022 11:01:39 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-089-014-209-236.89.14.pool.telefonica.de. [89.14.209.236])
 by smtp.gmail.com with ESMTPSA id
 w5-20020aa7cb45000000b0042aa7e0f892sm4622029edt.15.2022.05.20.11.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 11:01:38 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 04/10] hw/i386/pc: Unexport functions used only internally
Date: Fri, 20 May 2022 20:01:03 +0200
Message-Id: <20220520180109.8224-5-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220520180109.8224-1-shentey@gmail.com>
References: <20220520180109.8224-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/pc.c         | 4 ++--
 include/hw/i386/pc.h | 3 ---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 2ffaac52fb..d7583045a0 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -570,7 +570,7 @@ static const char * const fdc_container_path[] = {
  * Locate the FDC at IO address 0x3f0, in order to configure the CMOS registers
  * and ACPI objects.
  */
-ISADevice *pc_find_fdc0(void)
+static ISADevice *pc_find_fdc0(void)
 {
     int i;
     Object *container;
@@ -714,7 +714,7 @@ static const int ne2000_io[NE2000_NB_MAX] = { 0x300, 0x320, 0x340, 0x360,
                                               0x280, 0x380 };
 static const int ne2000_irq[NE2000_NB_MAX] = { 9, 10, 11, 3, 4, 5 };
 
-void pc_init_ne2k_isa(ISABus *bus, NICInfo *nd)
+static void pc_init_ne2k_isa(ISABus *bus, NICInfo *nd)
 {
     static int nb_ne2k = 0;
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 38be346a13..cb491fc43b 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -166,7 +166,6 @@ void pc_basic_device_init(struct PCMachineState *pcms,
                           ISADevice **rtc_state,
                           bool create_fdctrl,
                           uint32_t hpet_irqs);
-void pc_init_ne2k_isa(ISABus *bus, NICInfo *nd);
 void pc_cmos_init(PCMachineState *pcms,
                   BusState *ide0, BusState *ide1,
                   ISADevice *s);
@@ -177,8 +176,6 @@ typedef void (*cpu_set_smm_t)(int smm, void *arg);
 
 void pc_i8259_create(ISABus *isa_bus, qemu_irq *i8259_irqs);
 
-ISADevice *pc_find_fdc0(void);
-
 /* port92.c */
 #define PORT92_A20_LINE "a20"
 
-- 
2.36.1


