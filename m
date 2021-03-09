Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7DC332FD8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:25:59 +0100 (CET)
Received: from localhost ([::1]:37402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJivW-0007VN-CV
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJhiJ-0005VX-Oc
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 14:08:15 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:35566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJhiH-0000wc-GA
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 14:08:15 -0500
Received: by mail-ej1-x62a.google.com with SMTP id dx17so30802070ejb.2
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 11:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Df42s+dJcqsddWeldvO2/Bbr7ZyB3x/PGy0fk3oNWG0=;
 b=JNFPoVpdBmNn8IH2MnTlH9Ik8hDA9yldljPO1D/t/+8URryPqvzOSjUw98rKpdG1Kz
 OzIeRaA9v0oZpMlQnUNXXyuZ+kswQ9Lr1HLoGxp9S7oXW+a60h4AjULLizffe8Od3YwX
 nwbsn+Xwf1fRfo8Uz5g0yTQQ7fueQW57J6XQF7zW/NXTAevDqREaFGMCpE8VJldBUnHz
 NmIvwNE/sSIQrrRze+uMCwc91I1wkhrB0TcyY1/Bp5Zl4jIFGAdHu8b8t03P8pAX2yOo
 AHPVZxEcAtGmrlVauHeQTahf5Vjz0WTS4jBq8EYUElAm2KMquOHV/5MceCP258QersYQ
 hASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Df42s+dJcqsddWeldvO2/Bbr7ZyB3x/PGy0fk3oNWG0=;
 b=l+JjiOf7dtleqmFuBxjJRl9WrasPQLhTt9X3rwUAevxdkOJpv/jOdrqwcJJ2rP1yZU
 DWqFq1pQao+Gb/76SPna66pvYslJIjjCFy/CIb1GSNS3zzUcnhMbYhaQtb7FZBcerpvC
 GdfqCXvMNJES2ULdR3r/aDeC2C2a9SWsKnThTtjbUXY1/RJOkD7qSu0XwI60wbtlKy9V
 CKxjJtsE7QJq2CC0BdqDaHaSj88oNAHphyxasTKLQr+Xu71dD0+n52u/hoza+AZD8TC/
 VS9SvzJoc46LlHpcwZSrhWS8IfSscmlCD5Jp9H2TVuOaTe04BxG13c8x9bSALqeaQfOV
 vMCQ==
X-Gm-Message-State: AOAM530Ko9eKjFEVRPTqlmOhZVGElOlLR/D6mqzVnuCjnOaFb8wvvryo
 yoMNSYmfmeqkaJje2RDWf87/5WXNfik=
X-Google-Smtp-Source: ABdhPJxEYxt/SOtHvIZ04jr8LALQMnD2HdqpllnpwPsiqGLuLcFtmIV5RVm+xzRaFsuIx0umH55ZRQ==
X-Received: by 2002:a17:906:30d9:: with SMTP id
 b25mr4601768ejb.348.1615316891016; 
 Tue, 09 Mar 2021 11:08:11 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a22sm9049451ejr.89.2021.03.09.11.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 11:08:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/southbridge: Add missing Kconfig dependency VT82C686
 on USB_UHCI
Date: Tue,  9 Mar 2021 20:08:00 +0100
Message-Id: <20210309190802.830969-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309190802.830969-1-f4bug@amsat.org>
References: <20210309190802.830969-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The VT82C686 south bridge provides a USB UHCI bus via a PCI function.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index c7f07854f7e..2691eae2f0c 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -47,6 +47,7 @@ config VT82C686
     select ACPI_SMBUS
     select SERIAL_ISA
     select FDC
+    select USB_UHCI
 
 config SMC37C669
     bool
-- 
2.26.2


