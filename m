Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 815EF603869
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 05:08:07 +0200 (CEST)
Received: from localhost ([::1]:55734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okzR8-00077p-Ga
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 23:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okzIY-0002Iv-Pf
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 22:59:14 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:37770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okzIX-0003TA-73
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 22:59:14 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 p3-20020a17090a284300b0020a85fa3ffcso19274219pjf.2
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 19:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JhP3V8fuNS6YIALSqLJDMdY4c06/PmVYaaaEFPf1ptc=;
 b=qe8ne9/oPu6L+ECHnG4l24Ck+XIbmEs0vzTVIUYaa8ETke/ZJJ51/kBPjpJWNykaIO
 3mAE+7EbAmxe52OmevbwbXspyhNK62lgAbo4l5JztN8E4ZEmDD1SNo7YawIlFejIGiIR
 l/WVJoJMbm/B2xM1TCXjO0WqfQfv8yrkq0NX1XT7+lrh6vRjSN34miKlgGdI7dou4Wx/
 LMtCfrg+tI3iYrTgI8ptps2vuA501kB0wK0WnYTtz68HzWz1P996RyceulLiknxlDDcI
 JPkm6AjRIh/ENt4aSNjxyFNyHzINOaa8hIW8pBnxnYEwYUmtCPh77WYnMt1wUgqElZCK
 x0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JhP3V8fuNS6YIALSqLJDMdY4c06/PmVYaaaEFPf1ptc=;
 b=azrU+h8/AlrOi1ek7Vz6auCRi70Fr0uGoII6fUamTuv1Jckgj5iru/R+iVtTITEJFH
 F0T/pXh4toXIFfr+xtLr81ySSCZvE46a7y0xFimP/dFT+xr8vhfc2t0is064sjjmOxOB
 LWGJbZU1ClkxkZRNYdc19wpy4BaFRD08zpx1dldz/syzPvMfgolmxB3iQrBrWO+A2PMJ
 3kOfWYcznAXGdMXQfhAkqqjBtviNAm4UKeYdUovPOtgAP87pvaxmaxUsogzPBcF1PoNb
 +KACh/GRGW+kjlqLk0Sb31IvZckzqg42VvO8zwAnVnDMK8cHbHn1WO7YzDDRs4eK6nFc
 6sNg==
X-Gm-Message-State: ACrzQf3nUJYUTcZvGss1gCnrUWCDytR2wLHK4DiW1a2D/lCw7PzrFCWf
 ytGqZbTS7YuMYaOxgK2em+JJ6A==
X-Google-Smtp-Source: AMsMyM7VZby/CSvAio7CQJ+tHBezLKl4wl6ne5nlZZcbFVJFZrOxNqKimOMLVcLFg7kVDVAHmcDOsg==
X-Received: by 2002:a17:903:200a:b0:181:75fc:e0c6 with SMTP id
 s10-20020a170903200a00b0018175fce0c6mr6149340pla.93.1666148352197; 
 Tue, 18 Oct 2022 19:59:12 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.142.248])
 by smtp.googlemail.com with ESMTPSA id
 203-20020a6214d4000000b005626fcc32b0sm10320593pfu.175.2022.10.18.19.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 19:59:11 -0700 (PDT)
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
Subject: [PATCH v5 07/10] acpi/tests/avocado/bits: add biosbits config file
 for running bios tests
Date: Wed, 19 Oct 2022 08:28:25 +0530
Message-Id: <20221019025828.683113-8-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019025828.683113-1-ani@anisinha.ca>
References: <20221019025828.683113-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1035;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1035.google.com
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


