Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD012AD4FA
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:29:02 +0100 (CET)
Received: from localhost ([::1]:50064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRpd-0005pv-Uu
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:29:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgR-0001ye-Gh
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:31 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgO-0006oT-Tu
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:31 -0500
Received: by mail-wr1-x42d.google.com with SMTP id b6so910483wrt.4
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 03:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=07wHspkIRHHvgkdEXAzCTs5Z3W2ApXwCpFVJfU27vw0=;
 b=kreWWZbx+60j1UNPkHDUGv6s0+zy4kub57qgt6lCLpL0+Vj4Lyp9+fM0Wj/gwndRz5
 /bEFNu+vpGnDJTrlcrLdGsO46BtZN3M1Zdy3HivobHjsk8TMoJDpGkGOP3xunn0eULfK
 jb1ZuBSVeWG4B4fVrEmt0NL6HGhfFbR+7t7uDUjBrr5FpONPzKoJmTyjzPh9STwsd7Q3
 EAVh/CI+vnxWdrIqUtuvXgXBBO3EMUlgaOoSD5nN0qH/NvRLvd3K6VblsQnN6mXMMQ1j
 RFExGUpoqjYMuugRnFv0jpEIbAOYzICbD5ShQew30at2IfbhsRooSJS519vXmNcRRfVG
 88lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=07wHspkIRHHvgkdEXAzCTs5Z3W2ApXwCpFVJfU27vw0=;
 b=BMS6a+jZwtcSg8nrc/VC+e9TE/NFN8WfL1F2vEYxPfhDf31Emp0718FnlzYrL/zu95
 89L7cj9s49DMfthd5GGHFfEVU2tvOIS9k7+7WdY/vTxNcWfcbASAhTDwBHthcD0bsvl9
 mhGnNTJRcY3pODcf+q4vmge7aegpRwHCg6jz/XoO70DY2CDvvZs3VlTDiFI0lVorZqrW
 OfzOqnuG6zlRz2VMFSEK0OPp19bSXvg8UsxfkX7uYbpmrnTRhlfmtqEPxsOU2C3UHQsx
 El9cTlUzoZ2rt2lEb4kSbDb5gaAKgviLbB4ATRRkc+RUDgx2J2g/HkTn7wxXI8HGUXNd
 wFdA==
X-Gm-Message-State: AOAM5305Qbxx7D2ACgq4mmiNi8HmadZZXEaEMrDQabrCx1g9aHioj7EZ
 TL5eyPH3+htrmsTbxEZG37xcbuyZD8fXlg==
X-Google-Smtp-Source: ABdhPJwTtl8CLAFkX8t5EZ6YjusDQ8qB8gOWDtJA27mZAvN/1ffD3pJEgBV5RHgrh/40jG36q9tc1g==
X-Received: by 2002:a5d:4fc1:: with SMTP id h1mr22994672wrw.226.1605007167289; 
 Tue, 10 Nov 2020 03:19:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 109sm16909498wra.29.2020.11.10.03.19.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 03:19:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/16] docs: add some notes on the sbsa-ref machine
Date: Tue, 10 Nov 2020 11:19:07 +0000
Message-Id: <20201110111917.29539-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110111917.29539-1-peter.maydell@linaro.org>
References: <20201110111917.29539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

We should at least document what this machine is about.

Reviewed-by: Graeme Gregory <graeme@nuviainc.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20201104165254.24822-1-alex.bennee@linaro.org
Cc: Leif Lindholm <leif@nuviainc.com>
Cc: Shashi Mallela <shashi.mallela@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
[PMM: fixed filename mismatch]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/sbsa.rst   | 32 ++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 docs/system/arm/sbsa.rst

diff --git a/docs/system/arm/sbsa.rst b/docs/system/arm/sbsa.rst
new file mode 100644
index 00000000000..b8ecfdb62fd
--- /dev/null
+++ b/docs/system/arm/sbsa.rst
@@ -0,0 +1,32 @@
+Arm Server Base System Architecture Reference board (``sbsa-ref``)
+==================================================================
+
+While the `virt` board is a generic board platform that doesn't match
+any real hardware the `sbsa-ref` board intends to look like real
+hardware. The `Server Base System Architecture
+<https://developer.arm.com/documentation/den0029/latest>` defines a
+minimum base line of hardware support and importantly how the firmware
+reports that to any operating system. It is a static system that
+reports a very minimal DT to the firmware for non-discoverable
+information about components affected by the qemu command line (i.e.
+cpus and memory). As a result it must have a firmware specifically
+built to expect a certain hardware layout (as you would in a real
+machine).
+
+It is intended to be a machine for developing firmware and testing
+standards compliance with operating systems.
+
+Supported devices
+"""""""""""""""""
+
+The sbsa-ref board supports:
+
+  - A configurable number of AArch64 CPUs
+  - GIC version 3
+  - System bus AHCI controller
+  - System bus EHCI controller
+  - CDROM and hard disc on AHCI bus
+  - E1000E ethernet card on PCIe bus
+  - VGA display adaptor on PCIe bus
+  - A generic SBSA watchdog device
+
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index fdcf25c2375..a0d5c57799c 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -79,6 +79,7 @@ undocumented; you can get a complete list by running
    arm/mps2
    arm/musca
    arm/realview
+   arm/sbsa
    arm/versatile
    arm/vexpress
    arm/aspeed
-- 
2.20.1


