Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 970252EB8A2
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 04:49:40 +0100 (CET)
Received: from localhost ([::1]:52188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwzpL-0003QA-NR
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 22:49:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzeu-0005wy-F7; Tue, 05 Jan 2021 22:38:52 -0500
Received: from ozlabs.org ([203.11.71.1]:60529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzes-0006NI-O8; Tue, 05 Jan 2021 22:38:52 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D9ZpJ32jbz9sWm; Wed,  6 Jan 2021 14:38:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609904312;
 bh=TZLFjggfHBBmoGYLA9oqu79OwNrKL94/Op02peqixIg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V5m9xy1n4ABkvREbz3Apav+kYeBF5hUDJ8KnXcALLqYGgfGDrXdIWHMRV2ROIi+ZJ
 kWgSfVwonXkrXnpOKfhGN1DF0M5cnIXYFwdmT8iiX/q5DYDjeZnVRD0X7QaiuOPhOW
 4nNcVMSj0oAajx5+iSoR600G/0n4oL7J8gV6gM5U=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 19/22] sam460ex: Remove FDT_PPC dependency from KConfig
Date: Wed,  6 Jan 2021 14:38:13 +1100
Message-Id: <20210106033816.232598-20-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210106033816.232598-1-david@gibson.dropbear.id.au>
References: <20210106033816.232598-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan via <qemu-ppc@nongnu.org>

Dependency on FDT_PPC was added in commit b0048f76095
("hw/ppc/Kconfig: Only select FDT helper for machines using it") but
it does not seem to be really necessary so remove it again.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <7461a20b129a912aeacdb9ad115a55f0b84c8726.1609636173.git.balaton@eik.bme.hu>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index d2329edbab..7e267d94a1 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -64,7 +64,6 @@ config SAM460EX
     select SMBUS_EEPROM
     select USB_EHCI_SYSBUS
     select USB_OHCI
-    select FDT_PPC
 
 config PREP
     bool
-- 
2.29.2


