Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAAA310CBB
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 15:52:10 +0100 (CET)
Received: from localhost ([::1]:44004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82Sv-0002lZ-Dm
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 09:52:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82LR-0002j0-IX; Fri, 05 Feb 2021 09:44:26 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:33718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82LN-0002Qy-Ab; Fri, 05 Feb 2021 09:44:22 -0500
Received: by mail-ej1-x636.google.com with SMTP id sa23so12381565ejb.0;
 Fri, 05 Feb 2021 06:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xkg/zu6AKq/Ee23oMpv0PA3XN//XoILVWe2S9GBryeE=;
 b=DUzbQda1m4bnqAFLyLB6eIM8vYj/X4I0dEM5/Ae7NndZhZNO++wYpb/GsrkM9G2fdb
 ZdeE4zBDjXvdz2m8akGj5Yn4O3blQpeegw8s7cKFkwW2dxZCe1yEEF0ZHFmFNwE4WiTh
 FYRsGfxNqFIjlDK7mJH5yPmKclBvvtlGUbMpmjW7jJ95L0i50SUz6FPktQzwc5M2QUwW
 hRlosIUrdwj5wu8eRpSOBgh1/Zvhvt94LHhBxDhkbdaCRuPF9vE6OcJmZAocZpM0Q2Cb
 LQqFcH1zXbw2ipZoLIq+thGyDXa/6A2DHUSbkSQC73XfLGutXgdH6fl1jwQ0QMczt3Ow
 LQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Xkg/zu6AKq/Ee23oMpv0PA3XN//XoILVWe2S9GBryeE=;
 b=JM/4Kz7U18FXQDRjYPALPYTQx4aLMtvtTNbEqx9cwBhg2pQUJErPEKoYGLwCf8I5XK
 5e1iO6ThNedoJvYn49S/Mz42otvfBfwUBJj9RTHXxqRc54/KqTb8t3L7gu2JzqN5IuX7
 EEfri/7kxDEu6FilAA0btwkLepKE991OVkNGSwOZwdAzK7CwBWRgaUrSHsgQSpP1KQr2
 XGC6DuYw7KZpWcIA0/CFS+E81KCeS8zJMCWrmS9x5dOl4U9wyrLLn5jyRM9OWXqiWf4u
 4IIRyajvl89Hz3mFGu1UHWjsBN1WgjNZOluzC+JP15We0KfcvnAsZ6qfmU9NwYPFXAOB
 rkYg==
X-Gm-Message-State: AOAM533EVEL/vprCDyLsDyQ9+qV8klrpfFULEoqMZgezA62fBnp0I3el
 Kpqn5x1eCgq1s3x/m3oQwwPi9xiNA3U=
X-Google-Smtp-Source: ABdhPJyPOvLRzMbqEXMiNye6S+y3gEcu3PM5eYVrEVRsGsPslWOGaP7SGofKpbBnhs2bGt5IvYs4LQ==
X-Received: by 2002:a17:907:3f13:: with SMTP id
 hq19mr4391142ejc.142.1612536256133; 
 Fri, 05 Feb 2021 06:44:16 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u2sm3982732ejb.65.2021.02.05.06.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 06:44:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/9] hw/arm/virt: Improve CPU name in help message
Date: Fri,  5 Feb 2021 15:43:41 +0100
Message-Id: <20210205144345.2068758-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210205144345.2068758-1-f4bug@amsat.org>
References: <20210205144345.2068758-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When selecting an incorrect CPU, there is a mismatch between the
CPU name provided and the one displayed (which is some QEMU internal
name):

  $ qemu-system-aarch64 -M virt -cpu cortex-a8
  qemu-system-aarch64: mach-virt: CPU type cortex-a8-arm-cpu not supported

Strip the suffix to display the correct CPU name:

  $ qemu-system-aarch64 -M virt -cpu cortex-a8
  qemu-system-aarch64: mach-virt: CPU type cortex-a8-arm

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/virt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 399da734548..7802d3a66e8 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1829,7 +1829,10 @@ static void machvirt_init(MachineState *machine)
     finalize_gic_version(vms);
 
     if (!cpu_type_valid(machine->cpu_type)) {
-        error_report("mach-virt: CPU type %s not supported", machine->cpu_type);
+        int len = strlen(machine->cpu_type) - strlen(ARM_CPU_TYPE_SUFFIX);
+
+        error_report("mach-virt: CPU type %.*s not supported",
+                     len, machine->cpu_type);
         exit(1);
     }
 
-- 
2.26.2


