Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5188758D03B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 00:38:02 +0200 (CEST)
Received: from localhost ([::1]:38728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLBNp-0005Cq-FQ
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 18:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oLBJf-0008DX-76
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 18:33:43 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:44736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oLBJd-0001C2-Iq
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 18:33:42 -0400
Received: by mail-pg1-x52d.google.com with SMTP id c24so4976508pgg.11
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 15:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc;
 bh=bpxqCm+hMKm2eokYEofsJ0Irz/l4BIy4YUTJZc+Yt+4=;
 b=TdMFh2wIUVlTOQt488mGQ7/nh7jvUVaSApdtQtAcUS9LveVPqtFTtqEXHGNpj5bGPf
 dtb3lJSVEYzcl/TT3qPMvNJhUPfJwvzYzpYQLLAbmvt4GXUm1tcVLmM/AdgUM7QK54c1
 Bz4BLJqEQSilhWfsrtqm1Q7927iWzkyAfs/zzHjrPtiL97AjML/vpSPr9QJ2ngyHqLP7
 WMYcuXVZxRQqWCeH82JPAE8qE8OBuSDjcnmQHEmRfV2A3I6PcCw3WLCaDJpaDniTCzcz
 YBxs6hZ5Uc8rVFfiMfsTieaXtd4XlBhHbfaRCeNkphslTbLyrt7bBvtrCzIMGt4Apd6o
 rCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc;
 bh=bpxqCm+hMKm2eokYEofsJ0Irz/l4BIy4YUTJZc+Yt+4=;
 b=XyY/tUK1ttX4BtMzEHLdjQV3/YVHuj6jnr+a4SyZmsXjIbGWfL4RmuQfEmJjOet7z+
 bJy5Dj/2dxBORNqtXwp6DFaGikAf9KCts1aAPhYKd+xhDCpURT9Q0budc9TjPMB0YkON
 xjfYGrByRa34+PmaZqt/IO7J3NpxjL7JFDfEqJzFeokqw5YQKGiTliBjYrWvqfb2ucsL
 /IMNgh0XKCQpCd1KSRu2JdHk0EUw7HtB1bypGnPF7SPOKpK7qDVtUPyBmI44TZqfSX/r
 aqV6ZaaMmAWna91K2V2/Qsdj3YHBkPT94b4iU3QOnEuZH88RaR1KkfExdd1XTwpX68hk
 ED2A==
X-Gm-Message-State: ACgBeo1stXILqszaUujMEMgJlDMpYtKdsCAsJyIyAMsuH460Gd8VE30E
 HSo+MpIRUGNA8crUcpDsH3YNUHTA8UZJdA==
X-Google-Smtp-Source: AA6agR41VeuMsrk6EM9BidlSmk1YbWi8pr8bxrGN/EtJAijqk3yVv1KfNeJ0r5Zx3ffpsAQIKlOSGg==
X-Received: by 2002:a62:1d86:0:b0:52d:9df0:2151 with SMTP id
 d128-20020a621d86000000b0052d9df02151mr19997787pfd.33.1659998019963; 
 Mon, 08 Aug 2022 15:33:39 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 5-20020a620605000000b0052ad6d627a6sm9160932pfg.166.2022.08.08.15.33.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 08 Aug 2022 15:33:39 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PULL 2/3] hw/mips/malta: turn off x86 specific features of PIIX4_PM
Date: Tue,  9 Aug 2022 00:33:11 +0200
Message-Id: <20220808223312.53720-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220808223312.53720-1-f4bug@amsat.org>
References: <20220808223312.53720-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

QEMU crashes trying to save VMSTATE when only MIPS target are compiled in
  $ qemu-system-mips -monitor stdio
  (qemu) migrate "exec:gzip -c > STATEFILE.gz"
  Segmentation fault (core dumped)

It happens due to PIIX4_PM trying to parse hotplug vmstate structures
which are valid only for x86 and not for MIPS (as it requires ACPI
tables support which is not existent for ithe later)

Issue was probably exposed by trying to cleanup/compile out unused
ACPI bits from MIPS target (but forgetting about migration bits).

Disable compiled out features using compat properties as the least
risky way to deal with issue.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/995
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20220728115034.1327988-1-imammedo@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/malta.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 7a0ec513b0..0e932988e0 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1442,6 +1442,14 @@ static const TypeInfo mips_malta_device = {
     .instance_init = mips_malta_instance_init,
 };
 
+GlobalProperty malta_compat[] = {
+    { "PIIX4_PM", "memory-hotplug-support", "off" },
+    { "PIIX4_PM", "acpi-pci-hotplug-with-bridge-support", "off" },
+    { "PIIX4_PM", "acpi-root-pci-hotplug", "off" },
+    { "PIIX4_PM", "x-not-migrate-acpi-index", "true" },
+};
+const size_t malta_compat_len = G_N_ELEMENTS(malta_compat);
+
 static void mips_malta_machine_init(MachineClass *mc)
 {
     mc->desc = "MIPS Malta Core LV";
@@ -1455,6 +1463,7 @@ static void mips_malta_machine_init(MachineClass *mc)
     mc->default_cpu_type = MIPS_CPU_TYPE_NAME("24Kf");
 #endif
     mc->default_ram_id = "mips_malta.ram";
+    compat_props_add(mc->compat_props, malta_compat, malta_compat_len);
 }
 
 DEFINE_MACHINE("malta", mips_malta_machine_init)
-- 
2.36.1


