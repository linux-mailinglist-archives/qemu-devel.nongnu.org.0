Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5624968C9
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 01:33:35 +0100 (CET)
Received: from localhost ([::1]:44010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB4LW-0006qY-94
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 19:33:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nB4JG-0004ZO-Aa; Fri, 21 Jan 2022 19:31:17 -0500
Received: from [2607:f8b0:4864:20::429] (port=44892
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nB4JE-0003XL-KJ; Fri, 21 Jan 2022 19:31:13 -0500
Received: by mail-pf1-x429.google.com with SMTP id n32so1208438pfv.11;
 Fri, 21 Jan 2022 16:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vNuO5GZol6MdM/lHTeInmnNUIgtKaFNI/AUp6Px479I=;
 b=fDJigeJbWEa9HiZkPN3IQ4Tm9bmOO5fyLamoXtTlRtRu4rCWwchiD2Es/zS+92Zj6J
 FeVgu0li0wj3C3pAmU1leetcd+Q8xzUDIiyvTM0mSmq8Tgg04joDFX0b89NwNhDJheJe
 khJnk6QL+ZAp5wXyXqvNY0rXkTbHn85bdGXiBM7BSvDW3v2581aZr82mTSyUXhhT4VMp
 ShwlNo6u918fUyM1IqQhn80agUmUH7ieJVGXyjVWUUgVxsWx7zfbA5ILTc30wBMW4BZA
 pEGLxfYuFFXs6SBMn8AVKG8/xy2Vst+BcIgh60eHQSVUuAe0LLuXT/pxTj7tLKeYnuHQ
 4sGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=vNuO5GZol6MdM/lHTeInmnNUIgtKaFNI/AUp6Px479I=;
 b=d8rvbVNAw/VIEibAsEXoFltxHfCG1srflVJQfDQtBYhsas6aBHAGL8VWUddwJ1U7Ys
 18ySrFwJJdY/S/ihwjE6+0o9Jod3mstOFW/SSDeyJyrfdLhAdNZ83Pk991xKVuon1F6W
 LF1shCVS7a/54Koh+31Zai4yMgvPAPRYLmTct35Trq5Z1Dw9oULsWTaHLTVENARKnxdP
 N7DZLwTgo+/gCNXIpztY5zg25gDfG5p1uEL+iOYw86YwtKciZNXFsTsVFQ+h3VSnTVSv
 EtBfk9nNgN833lUZG/1C4V3At16ldsbuvAWiA0xCF262PJUkr8bbz3z22noczoXf6q1g
 MT1w==
X-Gm-Message-State: AOAM533IMGMsS/eA3TwZs7gU1izyU4/M71kigBEp1l60rUxB3J08nVrm
 PGC5s32lprYEPHwotITN7NN+JdJtwJM=
X-Google-Smtp-Source: ABdhPJzWLF5dZPCyPGl4OC95+69S+uNH4/WYXgGZRbnk6VLRNq/2fK/UFkIZ5W9Frz0EJ/WR2eJXDQ==
X-Received: by 2002:a05:6a00:ace:b0:4c5:35c:db8 with SMTP id
 c14-20020a056a000ace00b004c5035c0db8mr5805836pfl.51.1642811470937; 
 Fri, 21 Jan 2022 16:31:10 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id nk11sm6302660pjb.55.2022.01.21.16.31.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jan 2022 16:31:10 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH] hw/ppc/vof: Add missing includes
Date: Sat, 22 Jan 2022 01:31:04 +0100
Message-Id: <20220122003104.84391-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

vof.h requires "qom/object.h" for DECLARE_CLASS_CHECKERS(),
"exec/memory.h" for address_space_read/write(),
"exec/address-spaces.h" for address_space_memory
and more importantly "cpu.h" for target_ulong.

vof.c doesn't need "exec/ram_addr.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ppc/vof.c         | 1 -
 include/hw/ppc/vof.h | 5 +++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
index 73adc44ec2..2b63a62875 100644
--- a/hw/ppc/vof.c
+++ b/hw/ppc/vof.c
@@ -16,7 +16,6 @@
 #include "qemu/units.h"
 #include "qemu/log.h"
 #include "qapi/error.h"
-#include "exec/ram_addr.h"
 #include "exec/address-spaces.h"
 #include "hw/ppc/vof.h"
 #include "hw/ppc/fdt.h"
diff --git a/include/hw/ppc/vof.h b/include/hw/ppc/vof.h
index 97fdef758b..f8c0effcaf 100644
--- a/include/hw/ppc/vof.h
+++ b/include/hw/ppc/vof.h
@@ -6,6 +6,11 @@
 #ifndef HW_VOF_H
 #define HW_VOF_H
 
+#include "qom/object.h"
+#include "exec/address-spaces.h"
+#include "exec/memory.h"
+#include "cpu.h"
+
 typedef struct Vof {
     uint64_t top_addr; /* copied from rma_size */
     GArray *claimed; /* array of SpaprOfClaimed */
-- 
2.34.1


