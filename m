Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BD917AAB6
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 17:41:43 +0100 (CET)
Received: from localhost ([::1]:52626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9tZ7-0002zV-Tx
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 11:41:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59116)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j9tOy-0003LM-UW
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 11:31:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j9tOx-0002A9-P6
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 11:31:12 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44605)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j9tOx-00028f-Iq
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 11:31:11 -0500
Received: by mail-wr1-x435.google.com with SMTP id n7so7765761wrt.11
 for <qemu-devel@nongnu.org>; Thu, 05 Mar 2020 08:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YI5GZ4epbK0QXokUOGTMGNexzluV/B8yk7q3BWioDGk=;
 b=TDN84NoGjXC5t+d7D7nIbb/WVInpK3kzG2As3XQFHfX2zdODHdGqAylKOMDChZLKQn
 RRPfQLoQr4Xg2hs+4s+K8CUOKFYQLnrx/tNjHn08cGCcVNvqRormitE4pLVxIbGBLoy0
 VmIKgm3leaCEXtsCSiIXfPGUEHLkCGShmuVgbE7q+Fb7wB4L7p/F2ImmCc4+wqkySpic
 F2zcRguAiaQfK8ZnfkHkBbeI5RtcNNyfxlITAkvEmkNoYPKHR9GPSwWEUxXG2n4T8itD
 wn0yykaUHZxoUztlXIvxxF/jEAyh1n/ysDarS8EnTdaU3HILNnZBR7RVtEe5jfelIArS
 KLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YI5GZ4epbK0QXokUOGTMGNexzluV/B8yk7q3BWioDGk=;
 b=KHdpeUZ5HnicfM84EZ7xzyz9ygsz18VYY6hoz+QOnCXi/KxEeQT0q797mmY113MIAn
 uBLKc/87GsMTzvY0j7O1a8LRrmne+Jut+X6zIcgZtmpGTnhDbABfwvN1O2ktZ8wjAmUb
 O1/bzifmYVFMZOZgKbFOf82QNvRt5fzgq0aLSw5yc5AvbIF4knfJvYPv8Sd53snoWgWw
 AGlAyse37zscKwYzW0c57NwVyBinEMzNIQPV44pqHRk2O6n5u6nLcuuidvwiH1MQmhpx
 Nb3YS1om+G5PG3cemNJq7JuA5+IkhYGEBFS/TWR/G7Pqo3k8LmPTPivXMaGIlwBAokVv
 6RnA==
X-Gm-Message-State: ANhLgQ3+1w58gMPpOltygIMi4mo8cyj0dWa4fI0WX2klpTeyu5J1uYoh
 Tl4t9gWFvkRvSxLvtUccEoPGR5ktriUwfQ==
X-Google-Smtp-Source: ADFU+vvhnX+BE0WlaEjCIuy5F9tJJ7k9yC1EPocA+gPNUWyy6X3Iqaq+qT47qdHjrx8pI100VQR4fQ==
X-Received: by 2002:adf:dd4d:: with SMTP id u13mr10989189wrm.70.1583425870318; 
 Thu, 05 Mar 2020 08:31:10 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w22sm10310729wmk.34.2020.03.05.08.31.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 08:31:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/37] hw/arm/mainstone: Simplify since the machines are
 little-endian only
Date: Thu,  5 Mar 2020 16:30:30 +0000
Message-Id: <20200305163100.22912-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200305163100.22912-1-peter.maydell@linaro.org>
References: <20200305163100.22912-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::435
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

We only build the little-endian softmmu configurations. Checking
for big endian is pointless, remove the unused code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mainstone.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index 6e64dfab506..10420170866 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -119,7 +119,6 @@ static void mainstone_common_init(MemoryRegion *address_space_mem,
     DeviceState *mst_irq;
     DriveInfo *dinfo;
     int i;
-    int be;
     MemoryRegion *rom = g_new(MemoryRegion, 1);
 
     /* Setup CPU & memory */
@@ -130,11 +129,6 @@ static void mainstone_common_init(MemoryRegion *address_space_mem,
     memory_region_set_readonly(rom, true);
     memory_region_add_subregion(address_space_mem, 0, rom);
 
-#ifdef TARGET_WORDS_BIGENDIAN
-    be = 1;
-#else
-    be = 0;
-#endif
     /* There are two 32MiB flash devices on the board */
     for (i = 0; i < 2; i ++) {
         dinfo = drive_get(IF_PFLASH, 0, i);
@@ -142,7 +136,7 @@ static void mainstone_common_init(MemoryRegion *address_space_mem,
                                    i ? "mainstone.flash1" : "mainstone.flash0",
                                    MAINSTONE_FLASH,
                                    dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                                   sector_len, 4, 0, 0, 0, 0, be)) {
+                                   sector_len, 4, 0, 0, 0, 0, 0)) {
             error_report("Error registering flash memory");
             exit(1);
         }
-- 
2.20.1


