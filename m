Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD50F5C6F0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 04:09:36 +0200 (CEST)
Received: from localhost ([::1]:47120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hi8Eh-00088S-Mr
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 22:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55291)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hi4Lm-000469-3a
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 18:00:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hi4Lj-0008SR-P4
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 18:00:37 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]:43745)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hi4Lh-0008NC-PN
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 18:00:35 -0400
Received: by mail-wr1-f50.google.com with SMTP id p13so15404184wru.10
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 15:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KqpLKfjrgSvCjVcmL96LXqXG75GeUM+DNTc46s318rE=;
 b=VK/Q8/0LfvU8fmYJ/2BejcaK4j0cH1dTfnksW+UfwmBnzBLcfpnb4KEZIy/kWNGt/n
 MEqjRVx2I4L95cHfCzDzzY8kgn08le5J31I8ga31GuzbLIT77K3n/xi1/eezySQQMjEM
 0cfo9mWV2N8ORsZOmGeA2cn7Z6+IPJeYVYfzCy8+KnHnjKcGq9VGG974WySZuKAq+UF4
 qCeFwVkCRM5FIu5QoQVxBVzprTb8rKP46lMXUMhyi8JyiH+gIp+eru0dEtc276UKncn6
 5yWNIJN0YvjEOypRiBBEvBK1PrE9rcXANj/GLl4zYmIe8vZuQwzw6lOTyw0MDECAm9w5
 qCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KqpLKfjrgSvCjVcmL96LXqXG75GeUM+DNTc46s318rE=;
 b=N3DCs5354X2lamCKazJ8O3xQjJjbQtbqytSh7QVs+oeRkUYFtZAVTWLogayusNU9Ve
 BM2XWnCkM1tbyd1yCKDTGFJT3TMEkmcNvmVRium719Zync+wTyOtVrtbCAG1KFXTiDtY
 ETEj4aNU/MOUfZQcyZZFwoWGUT27CbxyGKdLVbYLgKfTn2eENYFdou6bg71k6gz/nCed
 s0l1t49YG/IK+4T9kuHcUIoVwstO2cUonxTfrP7lGaaeUrWt2KWE6gBkNAPNsnSRvWSx
 iHzKbUy2uw4ZAxhP9nxjyGuTTWpJanB6rb5cg5cG8upCOj5+fy7/527YnuRTqv4FtdoS
 Oqlg==
X-Gm-Message-State: APjAAAV4w2hbwIYltCNGGT4qdUw3PhxRldHdWho35MlAQY8yEk5JqdDh
 m5D1yK3ssnytKXAj6upArHwE6ti7nn8mUw==
X-Google-Smtp-Source: APXvYqx/VqneEvFcfzcF966LizdY7zagZ3Aj4lH3Ayvgb+07cEcN9PcqJEjvu8s6G3Z2nMgROySyEg==
X-Received: by 2002:a5d:42c5:: with SMTP id t5mr18846199wrr.5.1561999217125;
 Mon, 01 Jul 2019 09:40:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o6sm26573508wra.27.2019.07.01.09.40.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 09:40:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  1 Jul 2019 17:39:26 +0100
Message-Id: <20190701163943.22313-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190701163943.22313-1-peter.maydell@linaro.org>
References: <20190701163943.22313-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.50
Subject: [Qemu-devel] [PULL 29/46] target/arm: Makefile cleanup (ARM)
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Group ARM objects together, TCG related ones at the bottom.
This will help when restricting TCG-only objects.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20190701132516.26392-3-philmd@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/Makefile.objs | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 7c31fa01c1c..1cbe7cfdb47 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -4,11 +4,9 @@ obj-$(CONFIG_KVM) += kvm.o
 obj-$(call land,$(CONFIG_KVM),$(call lnot,$(TARGET_AARCH64))) += kvm32.o
 obj-$(call land,$(CONFIG_KVM),$(TARGET_AARCH64)) += kvm64.o
 obj-$(call lnot,$(CONFIG_KVM)) += kvm-stub.o
-obj-y += translate.o op_helper.o helper.o cpu.o
-obj-y += neon_helper.o iwmmxt_helper.o vec_helper.o vfp_helper.o
-obj-y += gdbstub.o
+obj-y += helper.o vfp_helper.o
+obj-y += cpu.o gdbstub.o
 obj-$(TARGET_AARCH64) += cpu64.o gdbstub64.o
-obj-y += crypto_helper.o
 obj-$(CONFIG_SOFTMMU) += arm-powerctl.o
 
 DECODETREE = $(SRC_PATH)/scripts/decodetree.py
@@ -32,6 +30,10 @@ target/arm/translate-sve.o: target/arm/decode-sve.inc.c
 target/arm/translate.o: target/arm/decode-vfp.inc.c
 target/arm/translate.o: target/arm/decode-vfp-uncond.inc.c
 
+obj-y += translate.o op_helper.o
+obj-y += crypto_helper.o
+obj-y += iwmmxt_helper.o vec_helper.o neon_helper.o
+
 obj-$(TARGET_AARCH64) += translate-a64.o helper-a64.o
 obj-$(TARGET_AARCH64) += translate-sve.o sve_helper.o
 obj-$(TARGET_AARCH64) += pauth_helper.o
-- 
2.20.1


