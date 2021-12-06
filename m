Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC264694DA
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 12:16:28 +0100 (CET)
Received: from localhost ([::1]:48530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muByt-0008Cz-Ld
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 06:16:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muBqj-00078f-DQ
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 06:08:01 -0500
Received: from [2a00:1450:4864:20::335] (port=46834
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muBqh-0003M1-Le
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 06:08:01 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso7294338wmr.5
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 03:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/DJj/gxHt6m4FCr9Z7lcL4/ZOvmbUdkOohUSBXdWb/M=;
 b=gihBjoMmWb0BRGjgXPVlYMzOUanXZ9OU6pIBOEAWIgxwTh9nKo5cR45jwRAP9X3lnL
 KJ38ANT3x6J6KaWgCq8WrfmXKcEXPlqp+Za+D58rrGWwmgGGp17ORvTN0vBJYZQw4nfP
 l3lhwKwOZAMDPYo7/GR+90yU7wY2InZU+ZQeDKhDaRtnLwPbjN31uOJEyHjCXujDEkfl
 kLIpqrvzgpmywiZKeujrfSNjR4nzRFXKph2lKnoGb5Ztbx2IvkYC3PVtu+AG8PpOQQdK
 Ee5OrNolICzgr/U10pq4BRFX+8wZA2MgEOCZ31GOlwbIqrNHspV/XFPlOHX8WW3pYcuz
 MAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/DJj/gxHt6m4FCr9Z7lcL4/ZOvmbUdkOohUSBXdWb/M=;
 b=Tq8DeHzOxbJSrm2sM1epaFdfGECRKcg0m4z63E1y3EYm8Y4p3tuIzkm2cOVuo1Ie1j
 pfnofTpNXfBFMlta9V34r2XJUox+QINAPnQI9aRWYEJHudurIMTIfr4DTo2Izi/waVXL
 QHmCfkPcdFHkgddyTImQ84Wx+y/bGmkyhKZd71kNDgcHLJmBbBb3LVXAvt/ZlqsSOGV6
 7mmF4zJPHNLoXiYexHyqS41UiqVUYarwytXUO8/eyQOR/bMoRUeT0eIlD6EKyd7Jd97P
 7c17qyBsV+9uYsmr1rv+IrsuVzE83cXt6UeHZlZcbyaGMB/WvRPWKs/koitEBplZgaV0
 SjvA==
X-Gm-Message-State: AOAM531Ola4DQpmAEaRudQN1+gbbOvlg52DCTad2OyVSTIYIt7/rJL5I
 2HaeRi9MxRZaRlGWp6q9kg7yiXf2vWk=
X-Google-Smtp-Source: ABdhPJxCBO4b54gH0DVzft2o3jY6g7d1iOtzEKmAxbQpaDWjiXzn9Cgbpi1oMkBRrJxlFB0Uaw9eMA==
X-Received: by 2002:a1c:448b:: with SMTP id r133mr38461274wma.85.1638788877970; 
 Mon, 06 Dec 2021 03:07:57 -0800 (PST)
Received: from x1w.. (82.red-83-50-95.dynamicip.rima-tde.net. [83.50.95.82])
 by smtp.gmail.com with ESMTPSA id d6sm11222010wrn.53.2021.12.06.03.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 03:07:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] hw/mips/boston: Fix load_elf() error detection
Date: Mon,  6 Dec 2021 12:07:45 +0100
Message-Id: <20211206110746.360608-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211206110746.360608-1-f4bug@amsat.org>
References: <20211206110746.360608-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paul Burton <paulburton@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

load_elf() gives negative return in case of error, not zero.

Fixes: 10e3f30ff73 ("hw/mips/boston: Allow loading elf kernel and dtb")
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211130211729.7116-3-jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/boston.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 0e3cca55118..59ca08b93a9 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -777,14 +777,15 @@ static void boston_mach_init(MachineState *machine)
             exit(1);
         }
     } else if (machine->kernel_filename) {
-        uint64_t kernel_entry, kernel_high, kernel_size;
+        uint64_t kernel_entry, kernel_high;
+        ssize_t kernel_size;
 
         kernel_size = load_elf(machine->kernel_filename, NULL,
                            cpu_mips_kseg0_to_phys, NULL,
                            &kernel_entry, NULL, &kernel_high,
                            NULL, 0, EM_MIPS, 1, 0);
 
-        if (kernel_size) {
+        if (kernel_size > 0) {
             int dt_size;
             g_autofree const void *dtb_file_data, *dtb_load_data;
             hwaddr dtb_paddr = QEMU_ALIGN_UP(kernel_high, 64 * KiB);
-- 
2.33.1


