Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E5831E34F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 00:58:14 +0100 (CET)
Received: from localhost ([::1]:55672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWhx-0003lA-QM
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 18:58:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWS3-0001BB-Ce
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:49 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:33027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRo-0004oF-8d
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:45 -0500
Received: by mail-pf1-x430.google.com with SMTP id z6so52889pfq.0
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pub1cw4RCa7xktMR4FG9lmGr2Lg5MrccZBgr+bN6ao8=;
 b=VffgVpqMeXbBZDscd9OEHtBOv49G7KRn87PiuJKW5QtdjYeJ8X67oEEB95ZULKrSCl
 ENPrVfFrQAG4MSNrsJ6ikH0onkAtxjbVpyVlx7U+Z82brWbWn8uIP1NemdyJwncyPb/C
 KRqsjMdg/1eA8hOo4G/ftKD5/+nsFhz/W+Jd2MOsNler8YcHXheFVLbPsNQ5oKW0+PH6
 pwNnQbbqbhJXGhi7pd0hff1w2laKO8YwV/DJ09PPgh1Kaf+HEwkFEE3Pjcws/Z8fkzRa
 P4djjN8IW1Br/FL5uKQj/ksDFO8PZGngjhXDYMyQ5u4qmhFwnVQi6cnEWJ4TCwFYBPUH
 LBOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pub1cw4RCa7xktMR4FG9lmGr2Lg5MrccZBgr+bN6ao8=;
 b=NBbyBJmwD/HOLgvC8vCatP/CD41B+6ixM5CyN5jU5c5oUDFsocWdhGOJG1a3Yi6tPv
 QAbfs670BQru1lrGynptzsYr3LcuLH8g25J81KnnXFy4MO1FP75Eb3Lp7zi49D2rby3l
 mPg5LprpBJqqD8XTop4WX08soGu0jXK9U8JTBT/q4ZiyoL+n6L45RNlNsmioqsgsHWuB
 BWZiCbNaM1bWC/4s8HZWs0E0v1yZsKWkMyqj/bkoGm5skZpoOHYQ0xukPixilci1geLc
 uud3Vja3vLOSASNhREA19IYfFzlBUgYdcqftHXvYe0wGOX5HuXvqCjrFGPiAlp2xM/FO
 lZzw==
X-Gm-Message-State: AOAM530dvCt2/BH0r5OtNe7u98g4osAxorlDnAeZJtMNokfjMIi9HJq6
 cixs5pyjYydLQilog+uIFIO1Mh8mgm4lHQ==
X-Google-Smtp-Source: ABdhPJy4qiPygd9fn+cfWhfXhQheKrimVXCN9L0zDVlRvf3vlPWR1oyM6ReTWXzkdnQHY33CzKWlFw==
X-Received: by 2002:a63:fe13:: with SMTP id p19mr1569289pgh.119.1613605288795; 
 Wed, 17 Feb 2021 15:41:28 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:41:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/35] Hexagon (target/hexagon) instruction classes
Date: Wed, 17 Feb 2021 15:40:14 -0800
Message-Id: <20210217234023.1742406-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217234023.1742406-1-richard.henderson@linaro.org>
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Determine legal VLIW slots for each instruction

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1612763186-18161-26-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/iclass.h            | 50 ++++++++++++++++++++
 target/hexagon/iclass.c            | 73 ++++++++++++++++++++++++++++++
 target/hexagon/imported/iclass.def | 51 +++++++++++++++++++++
 3 files changed, 174 insertions(+)
 create mode 100644 target/hexagon/iclass.h
 create mode 100644 target/hexagon/iclass.c
 create mode 100644 target/hexagon/imported/iclass.def

diff --git a/target/hexagon/iclass.h b/target/hexagon/iclass.h
new file mode 100644
index 0000000000..78d372621a
--- /dev/null
+++ b/target/hexagon/iclass.h
@@ -0,0 +1,50 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HEXAGON_ICLASS_H
+#define HEXAGON_ICLASS_H
+
+#include "attribs.h"
+
+#define ICLASS_FROM_TYPE(TYPE) ICLASS_##TYPE
+
+enum {
+
+#define DEF_PP_ICLASS32(TYPE, SLOTS, UNITS)    ICLASS_FROM_TYPE(TYPE),
+#define DEF_EE_ICLASS32(TYPE, SLOTS, UNITS)    ICLASS_FROM_TYPE(TYPE),
+#include "imported/iclass.def"
+#undef DEF_PP_ICLASS32
+#undef DEF_EE_ICLASS32
+
+    ICLASS_FROM_TYPE(COPROC_VX),
+    ICLASS_FROM_TYPE(COPROC_VMEM),
+    NUM_ICLASSES
+};
+
+typedef enum {
+    SLOTS_0          = (1 << 0),
+    SLOTS_1          = (1 << 1),
+    SLOTS_2          = (1 << 2),
+    SLOTS_3          = (1 << 3),
+    SLOTS_01         = SLOTS_0 | SLOTS_1,
+    SLOTS_23         = SLOTS_2 | SLOTS_3,
+    SLOTS_0123       = SLOTS_0 | SLOTS_1 | SLOTS_2 | SLOTS_3,
+} SlotMask;
+
+SlotMask find_iclass_slots(Opcode opcode, int itype);
+
+#endif
diff --git a/target/hexagon/iclass.c b/target/hexagon/iclass.c
new file mode 100644
index 0000000000..378d8a6a75
--- /dev/null
+++ b/target/hexagon/iclass.c
@@ -0,0 +1,73 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "iclass.h"
+
+static const SlotMask iclass_info[] = {
+
+#define DEF_PP_ICLASS32(TYPE, SLOTS, UNITS) \
+    [ICLASS_FROM_TYPE(TYPE)] = SLOTS_##SLOTS,
+#define DEF_EE_ICLASS32(TYPE, SLOTS, UNITS) \
+    [ICLASS_FROM_TYPE(TYPE)] = SLOTS_##SLOTS,
+#include "imported/iclass.def"
+#undef DEF_PP_ICLASS32
+#undef DEF_EE_ICLASS32
+};
+
+SlotMask find_iclass_slots(Opcode opcode, int itype)
+{
+    /* There are some exceptions to what the iclass dictates */
+    if (GET_ATTRIB(opcode, A_ICOP)) {
+        return SLOTS_2;
+    } else if (GET_ATTRIB(opcode, A_RESTRICT_SLOT0ONLY)) {
+        return SLOTS_0;
+    } else if (GET_ATTRIB(opcode, A_RESTRICT_SLOT1ONLY)) {
+        return SLOTS_1;
+    } else if (GET_ATTRIB(opcode, A_RESTRICT_SLOT2ONLY)) {
+        return SLOTS_2;
+    } else if (GET_ATTRIB(opcode, A_RESTRICT_SLOT3ONLY)) {
+        return SLOTS_3;
+    } else if (GET_ATTRIB(opcode, A_COF) &&
+               GET_ATTRIB(opcode, A_INDIRECT) &&
+               !GET_ATTRIB(opcode, A_MEMLIKE) &&
+               !GET_ATTRIB(opcode, A_MEMLIKE_PACKET_RULES)) {
+        return SLOTS_2;
+    } else if (GET_ATTRIB(opcode, A_RESTRICT_NOSLOT1)) {
+        return SLOTS_0;
+    } else if ((opcode == J2_trap0) ||
+               (opcode == Y2_isync) ||
+               (opcode == J2_pause) || (opcode == J4_hintjumpr)) {
+        return SLOTS_2;
+    } else if ((itype == ICLASS_V2LDST) && (GET_ATTRIB(opcode, A_STORE))) {
+        return SLOTS_01;
+    } else if ((itype == ICLASS_V2LDST) && (!GET_ATTRIB(opcode, A_STORE))) {
+        return SLOTS_01;
+    } else if (GET_ATTRIB(opcode, A_CRSLOT23)) {
+        return SLOTS_23;
+    } else if (GET_ATTRIB(opcode, A_RESTRICT_PREFERSLOT0)) {
+        return SLOTS_0;
+    } else if (GET_ATTRIB(opcode, A_SUBINSN)) {
+        return SLOTS_01;
+    } else if (GET_ATTRIB(opcode, A_CALL)) {
+        return SLOTS_23;
+    } else if ((opcode == J4_jumpseti) || (opcode == J4_jumpsetr)) {
+        return SLOTS_23;
+    } else {
+        return iclass_info[itype];
+    }
+}
diff --git a/target/hexagon/imported/iclass.def b/target/hexagon/imported/iclass.def
new file mode 100644
index 0000000000..fb57968c6c
--- /dev/null
+++ b/target/hexagon/imported/iclass.def
@@ -0,0 +1,51 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+/* DEF_*(TYPE,SLOTS,UNITS) */
+DEF_PP_ICLASS32(EXTENDER,0123,LDST|SUNIT|MUNIT) /* 0 */
+DEF_PP_ICLASS32(CJ,0123,CTRLFLOW) /* 1 */
+DEF_PP_ICLASS32(NCJ,01,LDST|CTRLFLOW) /* 2 */
+DEF_PP_ICLASS32(V4LDST,01,LDST) /* 3 */
+DEF_PP_ICLASS32(V2LDST,01,LDST) /* 4 */
+DEF_PP_ICLASS32(J,0123,CTRLFLOW)  /* 5 */
+DEF_PP_ICLASS32(CR,3,SUNIT)     /* 6 */
+DEF_PP_ICLASS32(ALU32_2op,0123,LDST|SUNIT|MUNIT) /* 7 */
+DEF_PP_ICLASS32(S_2op,23,SUNIT|MUNIT)               /* 8 */
+DEF_PP_ICLASS32(LD,01,LDST)                    /* 9 */
+DEF_PP_ICLASS32(ST,01,LDST)                        /* 10 */
+DEF_PP_ICLASS32(ALU32_ADDI,0123,LDST|SUNIT|MUNIT) /* 11 */
+DEF_PP_ICLASS32(S_3op,23,SUNIT|MUNIT)               /* 12 */
+DEF_PP_ICLASS32(ALU64,23,SUNIT|MUNIT)             /* 13 */
+DEF_PP_ICLASS32(M,23,SUNIT|MUNIT)                 /* 14 */
+DEF_PP_ICLASS32(ALU32_3op,0123,LDST|SUNIT|MUNIT) /* 15 */
+
+DEF_EE_ICLASS32(EE0,01,INVALID) /* 0 */
+DEF_EE_ICLASS32(EE1,01,INVALID) /* 1 */
+DEF_EE_ICLASS32(EE2,01,INVALID) /* 2 */
+DEF_EE_ICLASS32(EE3,01,INVALID) /* 3 */
+DEF_EE_ICLASS32(EE4,01,INVALID) /* 4 */
+DEF_EE_ICLASS32(EE5,01,INVALID) /* 5 */
+DEF_EE_ICLASS32(EE6,01,INVALID) /* 6 */
+DEF_EE_ICLASS32(EE7,01,INVALID) /* 7 */
+DEF_EE_ICLASS32(EE8,01,INVALID) /* 8 */
+DEF_EE_ICLASS32(EE9,01,INVALID) /* 9 */
+DEF_EE_ICLASS32(EEA,01,INVALID) /* 10 */
+DEF_EE_ICLASS32(EEB,01,INVALID) /* 11 */
+DEF_EE_ICLASS32(EEC,01,INVALID) /* 12 */
+DEF_EE_ICLASS32(EED,01,INVALID) /* 13 */
+DEF_EE_ICLASS32(EEE,01,INVALID) /* 14 */
+DEF_EE_ICLASS32(EEF,01,INVALID) /* 15 */
-- 
2.25.1


