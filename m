Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0317C606455
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:24:44 +0200 (CEST)
Received: from localhost ([::1]:59786 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXPS-0001Xb-SH
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:24:39 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXOn-00016j-JA
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olUmS-0008D1-9f
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:36:22 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:46044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olUmQ-00077v-Jq
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:36:12 -0400
Received: by mail-pg1-x533.google.com with SMTP id r18so19071242pgr.12
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JhP3V8fuNS6YIALSqLJDMdY4c06/PmVYaaaEFPf1ptc=;
 b=t/0YJQkF1woBhhmfw6hW3h++27NE/VHX0LJ8iuo9gPvqHWCS75DG4DbbaVBHokwl8x
 PZMJR2TviqUaA6msreNASZkFAJP5EoFyxLNa82pFJknteVahEY4gj3bmI0qRwZGJsRsd
 Pi484PAFqErhT3WxogDSN+hRGhTR7MmfUNB2QyhepCotsGdTWGZO8rONeKn4LW8blgvq
 FnwXcCV+EVDu7UtQ7/2uDZGi78n+G7jiVevJ79/GTQm87NeUVBIZsl3AbnZk5dRZ8fr5
 7RHgW9HOsiJ7T+8qL31ZBaoxBjYCgypFItyAPbV9kF5iSHBPMk6QSTtvbIPW68AJ3WUt
 JJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JhP3V8fuNS6YIALSqLJDMdY4c06/PmVYaaaEFPf1ptc=;
 b=jcx2tjLXVJPXf8AgtikpSd46WM7k7dhLdMxW91Kj3dA/x0yhAXsjKYkX7N1S4/Heq7
 SqgC6FlR3QkjRWC6zwSNka564petbTocybkOqXyzDSV98DOVGaSdv9nPtFTMr8NNrlfB
 fx5EwnJcss7wO5uBEPux9USY1oR9fGv+Ngkm6/otp6Bfy3MK/YQNDHKp9/pG17Ff+0vj
 0xOwxz2hmnYqn7LiNaeh92OYQj6hLmKVqNMza9SA7QQtbO7zs7+8A9THJTjBTIz2BowL
 dy4A3DnQTIOxcj/RFpnjvm782v1X3s9MN+zz0ypQta7qTmm+me2HEMVMnZ29tsDPLY0i
 tW9A==
X-Gm-Message-State: ACrzQf2G4yBTw9WA7s3U1xzfgpvQKwJkiLB8H08cPBDtuxTAyskUGtL/
 O0af1m57GUBiD7vk9aQ2wkv3IQ==
X-Google-Smtp-Source: AMsMyM5EOqAsYbcwLH5G5nRwScwmWc8RgFKJ/dR9RTn+VotKvKuhxWuLgnw2bsbn/gbtUx071txYBA==
X-Received: by 2002:a63:5243:0:b0:43c:96a:8528 with SMTP id
 s3-20020a635243000000b0043c096a8528mr11490316pgl.47.1666269368982; 
 Thu, 20 Oct 2022 05:36:08 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.212.246.137])
 by smtp.googlemail.com with ESMTPSA id
 l11-20020a170903244b00b00176b3c9693esm12794174pls.299.2022.10.20.05.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:36:08 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v6 07/10] acpi/tests/avocado/bits: add biosbits config file
 for running bios tests
Date: Thu, 20 Oct 2022 18:05:03 +0530
Message-Id: <20221020123506.26363-8-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020123506.26363-1-ani@anisinha.ca>
References: <20221020123506.26363-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::533;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x533.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

This change adds initial biosbits config file that instructs biosbits to run
bios test suits in batch mode. Additionally acpi and smbios structures are also
dumped.

Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Maydell Peter <peter.maydell@linaro.org>
Cc: John Snow <jsnow@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Michael Tsirkin <mst@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 .../avocado/acpi-bits/bits-config/bits-cfg.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 tests/avocado/acpi-bits/bits-config/bits-cfg.txt

diff --git a/tests/avocado/acpi-bits/bits-config/bits-cfg.txt b/tests/avocado/acpi-bits/bits-config/bits-cfg.txt
new file mode 100644
index 0000000000..8010804453
--- /dev/null
+++ b/tests/avocado/acpi-bits/bits-config/bits-cfg.txt
@@ -0,0 +1,18 @@
+# BITS configuration file
+[bits]
+
+# To run BITS in batch mode, set batch to a list of one or more of the
+# following keywords; BITS will then run all of the requested operations, then
+# save the log file to disk.
+#
+# test: Run the full BITS testsuite.
+# acpi: Dump all ACPI structures.
+# smbios: Dump all SMBIOS structures.
+#
+# Leave batch set to an empty string to disable batch mode.
+# batch =
+
+# Uncomment the following to run all available batch operations
+# please take a look at boot/python/init.py in bits zip file
+# to see how these options are parsed and used.
+batch = test acpi smbios
-- 
2.34.1


