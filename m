Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7056430882B
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:19:28 +0100 (CET)
Received: from localhost ([::1]:35012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5RoF-00045c-Fw
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:19:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWH-0004um-BW
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:53 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:34318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RVz-00070W-3d
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:53 -0500
Received: by mail-wm1-x329.google.com with SMTP id o10so6795283wmc.1
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4xSrwZi/LBTckPDqAvRCIzHfsu5xqT3tP56Jtyc9pH4=;
 b=MnhpmToQcf4DC70KBjralQqwDnb6WT8+bb3WjOXTpDGB7OkL5Q8WuhE+Q/BrFsab3L
 xuecy7DcjEWrQ/4OyZCBF7rLbqa7K/ow5vT3ox0vhV9AqSNvI7y+2Ue4+0inyKTXVgkw
 cd4doj6XAEAHoV/gVq03tf+RBtNYkAG2EraucScNHs2dgOrdC4NR85M1w8/G4VQXWval
 99Z89P0W+4HimBnP0IVUtVX5jE9nJkld/tEA6w07D2X/Vx5wrEwV6UQSRizfGkP9Hje6
 4LnUZZuBnFFr793VENiHlzoxUZsisZ3Tf4EsgrVb5UBs20y+NRoevf6Zpj3vHbD32u89
 uQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4xSrwZi/LBTckPDqAvRCIzHfsu5xqT3tP56Jtyc9pH4=;
 b=qpOB09cy6IrQiFWRGmEPb0uV6h3Rd9s1OWQJgyZhghtC5JFQ7RA7MuSJeWDjTZaNig
 h3VDRJvCgY1pxr8OMx6GpsmztJmHXshMa7lHBU7+MlI5KQXZAo3V+e9tUIuGcqK3KobG
 7eZLq2xP/ARQf4yCHgMaBaOJbJ1VvwDHJkhrERqaImgtY+lMDy+QSK2hEvy5/CTkY3io
 Kdd46z5FIqw8/PKUo7UbrHs7kNG9PDJOvXPLx/cSZqLp4Y0aliEwqR5pgo5Bi36wrn1d
 LJJbp7vXvhQVD7pUHdxWh/LhlOWaQ2eZ+enxXJnD9D9UkuSVeOif3FVMcWajaBDAPZLz
 Uq3w==
X-Gm-Message-State: AOAM5326LW6m14HiPmX6KUKMPbXaYfXbMrfQz3oAmgNRt4QGQpNSxTx0
 Cz7YatvcgqHnn97m8XYtpv6dO+IjTcnugQ==
X-Google-Smtp-Source: ABdhPJyOCOK1QsLzbS7MpHSt6NqGNrOLWIujIbDq2SyZzFb+pyjeztuyJQnO7ny7+et3r2B8Qgj/Rg==
X-Received: by 2002:a7b:ce17:: with SMTP id m23mr3231240wmc.178.1611918033365; 
 Fri, 29 Jan 2021 03:00:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/46] pvpanic : update pvpanic spec document
Date: Fri, 29 Jan 2021 10:59:46 +0000
Message-Id: <20210129110012.8660-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Mihai Carabas <mihai.carabas@oracle.com>

Add pvpanic PCI device support details in docs/specs/pvpanic.txt.

Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/specs/pvpanic.txt | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/docs/specs/pvpanic.txt b/docs/specs/pvpanic.txt
index a90fbca72b7..8afcde11cc8 100644
--- a/docs/specs/pvpanic.txt
+++ b/docs/specs/pvpanic.txt
@@ -1,7 +1,7 @@
 PVPANIC DEVICE
 ==============
 
-pvpanic device is a simulated ISA device, through which a guest panic
+pvpanic device is a simulated device, through which a guest panic
 event is sent to qemu, and a QMP event is generated. This allows
 management apps (e.g. libvirt) to be notified and respond to the event.
 
@@ -9,6 +9,9 @@ The management app has the option of waiting for GUEST_PANICKED events,
 and/or polling for guest-panicked RunState, to learn when the pvpanic
 device has fired a panic event.
 
+The pvpanic device can be implemented as an ISA device (using IOPORT) or as a
+PCI device.
+
 ISA Interface
 -------------
 
@@ -24,6 +27,14 @@ bit 1: a guest panic has happened and will be handled by the guest;
        the host should record it or report it, but should not affect
        the execution of the guest.
 
+PCI Interface
+-------------
+
+The PCI interface is similar to the ISA interface except that it uses an MMIO
+address space provided by its BAR0, 1 byte long. Any machine with a PCI bus
+can enable a pvpanic device by adding '-device pvpanic-pci' to the command
+line.
+
 ACPI Interface
 --------------
 
-- 
2.20.1


