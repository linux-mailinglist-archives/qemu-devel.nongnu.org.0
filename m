Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FEC1EF269
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jun 2020 09:47:50 +0200 (CEST)
Received: from localhost ([::1]:51866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jh74v-0006by-E1
	for lists+qemu-devel@lfdr.de; Fri, 05 Jun 2020 03:47:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jh6yB-0003Qp-5H
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 03:40:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51801
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jh6yA-0005EN-6B
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 03:40:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591342849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KqNAKdeyZY4N/WN8/VheKglAqudMynHtJmA2N/wtx2U=;
 b=arxrnS/AmWArS249CqkaK6W0gv68addUxfIHlJRI0Bfdp4P1Rtyhk3YKawTJghN7kp8UyO
 q8dNkVABXPjRhxpwSWa5E1SXKwa34beeeEaIoA1zmuBoEUOKqnOr8SRsy2YOhtUA0ikm5m
 LzMlSwb6G1hEt33YJNA+e4h8s8LW21g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-zTfEUMX8O9Olr_g7vv4idg-1; Fri, 05 Jun 2020 03:40:47 -0400
X-MC-Unique: zTfEUMX8O9Olr_g7vv4idg-1
Received: by mail-wr1-f72.google.com with SMTP id s17so3398763wrt.7
 for <qemu-devel@nongnu.org>; Fri, 05 Jun 2020 00:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KqNAKdeyZY4N/WN8/VheKglAqudMynHtJmA2N/wtx2U=;
 b=BB1BDKJcRt9XPeZJSp2HM6cU3eN0vDfOPRXn3itLng2jL7UXXRWeBrvp8t0yMzdmzg
 7/Af5Vt+9kaunLoZnv42V2kfLfvXQRPtM3/X2zU7U6KhVl7MKFYoJW/vpFIQMuVTfSIk
 Tua5cxFIK84CnJaeaeUbAAAoF4ni4Sw49fXZ1Ksi6LDxf+TBm6khWpp0G1PJmAZ0MEC2
 z+xW4Tbjm04W/TXXpvExLr5Z5QYEvC2EffrZsAMxWsDnuheMUaflhORL3RZS7oQKcjw6
 R9HS0CsCBbNt60t8SnuRJX0phcZNrVGFihVelgz6x+/aByBRe7MjeU+svQCuapSenw1u
 2tIw==
X-Gm-Message-State: AOAM533PwiiQ8WtON5sYmkr3HvxKFoZ/0ijD/yd8x44f0fplqyzWUI6p
 VLzdqs2yHiIqaJh5qexaMgMTR7xRWTqLTQJiaR9KRfbIuqO7ERpnTZVLQiMRMr5EepT4Q12HFVc
 kMlrjM6hP4ESSwmY=
X-Received: by 2002:a7b:c842:: with SMTP id c2mr27529wml.58.1591342846477;
 Fri, 05 Jun 2020 00:40:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0HRocjeSwSn7JzlVT6ou2ScHm3/32razeRE7rw5nIck+u3lCHOiC5h4pGswBU9NBPjqY38g==
X-Received: by 2002:a7b:c842:: with SMTP id c2mr27515wml.58.1591342846310;
 Fri, 05 Jun 2020 00:40:46 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id t188sm5444384wmt.27.2020.06.05.00.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 00:40:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/11] Makefile: Allow target-specific optional Kconfig
Date: Fri,  5 Jun 2020 09:39:52 +0200
Message-Id: <20200605073953.19268-11-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200605073953.19268-1-philmd@redhat.com>
References: <20200605073953.19268-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 03:07:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow use of target-specific Kconfig file.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v3: Use base-arch() to include TARGET_BASE_ARCH/Kconfig
---
 Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index f8a45e1379..d5009cd304 100644
--- a/Makefile
+++ b/Makefile
@@ -423,11 +423,13 @@ MINIKCONF_INPUTS = $(SRC_PATH)/Kconfig.host \
                    $(SRC_PATH)/accel/Kconfig \
                    $(SRC_PATH)/hw/Kconfig
 MINIKCONF_DEPS = $(MINIKCONF_INPUTS) \
-                 $(wildcard $(SRC_PATH)/hw/*/Kconfig)
+                 $(wildcard $(SRC_PATH)/hw/*/Kconfig) \
+                 $(wildcard $(SRC_PATH)/target/*/Kconfig)
 MINIKCONF = $(PYTHON) $(SRC_PATH)/scripts/minikconf.py
 
 $(SUBDIR_DEVICES_MAK): %/config-devices.mak: default-configs/%.mak $(MINIKCONF_DEPS) $(BUILD_DIR)/config-host.mak
 	$(call quiet-command, $(MINIKCONF) $(MINIKCONF_ARGS) \
+		$(wildcard $(SRC_PATH)/target/$(call base-arch, $(firstword $(subst -, ,$@)))/Kconfig) \
 		> $@.tmp, "GEN", "$@.tmp")
 	$(call quiet-command, if test -f $@; then \
 	  if cmp -s $@.old $@; then \
-- 
2.21.3


