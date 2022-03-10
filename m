Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F824D4724
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:37:57 +0100 (CET)
Received: from localhost ([::1]:41250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSI3I-0002kR-BH
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:37:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSH0t-0002X7-5n
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:31:23 -0500
Received: from [2607:f8b0:4864:20::102d] (port=55228
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSH0r-0008Ty-FR
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:31:22 -0500
Received: by mail-pj1-x102d.google.com with SMTP id b8so4954376pjb.4
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v1XH3xOuF9Qfk4MizuEs6gkvLNvCljLe8Yi99oh17Cc=;
 b=wbkYzWORkFfhf9aL67Y6p1aACPbx+KFgYsOMUAm/Uk9oOmbXj9XxAxGLIpOlhOg4AD
 fn9pu65rRH+XWKqrzE9YQhSFYMC56hgR+Hc51r9GQrRTNaKk64hIva3JZ6m4UJeZTuTE
 h+ajaV1hnSrhBOZLCnbfRYhmJseXWv4FWL6M3vvJGBN9QJoLYxnZThTJLoYY0jQojqS1
 MX3SF2MsX35xTyFO4VQX7oag5I/Q3g+sD3+3JCu0cG8nj/i6+qdE1Tfg6j7CpyGsz0ym
 anFkhHIdW47/GYZ91l9CwYtTV+50AcnYLVZkO+TS8izugjJKkaomNkhQHEGA7NSRCgq7
 eLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v1XH3xOuF9Qfk4MizuEs6gkvLNvCljLe8Yi99oh17Cc=;
 b=olRZF9/mzCPqXuSpkSAi33u0nEaF+TDHJi4N/yJqe1h+dUOnvCcSmJI8q4wGIIWJDG
 bN3/kn9SOy8arIvKr0YYtkLC6vaxnckqxW6tJ+dptHqvBhjKnHNKXYTcfjJGWImlRLyP
 xmz7kmGKZ+QmolW0BNg+JBSMVh0TwpheWFhRrgs0cOSJ2qE+gTKd5P3L5pG8385IDoO3
 kcboH0raI3irujMoBbR0vJ1XEl8BTjOJqjIkeHckSfFTBwRZ/hSJ+Q0zBCR/2GzmfXyb
 a7w6ZXCpcjVhDg/A84mo+cKDdbAkumwcyBmIJYmsxx4TuoJYh24kN6noXjmO793FPCuJ
 qVzA==
X-Gm-Message-State: AOAM532Tx9OE3n5fUxQMF4NCcSIkF1/RYFXe1ZdKIMS03iJl+vwbjDMz
 4NpBJIStr15/+jOPSERPBObV9njVUUupDw==
X-Google-Smtp-Source: ABdhPJzNwmqdCY6sXmQ3ODhbBWB7XA0Oz6PbpMO1ZEfOyBnMAB8oAwSPiv5XR9CPJEUzQEl8d4uDkQ==
X-Received: by 2002:a17:90a:2dc6:b0:1bf:654e:e17f with SMTP id
 q6-20020a17090a2dc600b001bf654ee17fmr4511869pjm.64.1646911880118; 
 Thu, 10 Mar 2022 03:31:20 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020a056a001a8e00b004f75cf1ab6csm6011246pfv.206.2022.03.10.03.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:31:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 46/48] hw/nios2: Introduce Nios2MachineState
Date: Thu, 10 Mar 2022 03:27:23 -0800
Message-Id: <20220310112725.570053-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to move data from the heap into Nios2MachineState,
which is not possible with DEFINE_MACHINE.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/nios2/10m50_devboard.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/hw/nios2/10m50_devboard.c b/hw/nios2/10m50_devboard.c
index 3d1205b8bd..bdc3ffd50d 100644
--- a/hw/nios2/10m50_devboard.c
+++ b/hw/nios2/10m50_devboard.c
@@ -36,6 +36,13 @@
 
 #include "boot.h"
 
+struct Nios2MachineState {
+    MachineState parent_obj;
+};
+
+#define TYPE_NIOS2_MACHINE  MACHINE_TYPE_NAME("10m50-ghrd")
+OBJECT_DECLARE_TYPE(Nios2MachineState, MachineClass, NIOS2_MACHINE)
+
 #define BINARY_DEVICE_TREE_FILE    "10m50-devboard.dtb"
 
 static void nios2_10m50_ghrd_init(MachineState *machine)
@@ -105,11 +112,24 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
                       BINARY_DEVICE_TREE_FILE, NULL);
 }
 
-static void nios2_10m50_ghrd_machine_init(struct MachineClass *mc)
+static void nios2_10m50_ghrd_class_init(ObjectClass *oc, void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "Altera 10M50 GHRD Nios II design";
     mc->init = nios2_10m50_ghrd_init;
     mc->is_default = true;
 }
 
-DEFINE_MACHINE("10m50-ghrd", nios2_10m50_ghrd_machine_init);
+static const TypeInfo nios2_10m50_ghrd_type_info = {
+    .name          = TYPE_NIOS2_MACHINE,
+    .parent        = TYPE_MACHINE,
+    .instance_size = sizeof(Nios2MachineState),
+    .class_init    = nios2_10m50_ghrd_class_init,
+};
+
+static void nios2_10m50_ghrd_type_init(void)
+{
+    type_register_static(&nios2_10m50_ghrd_type_info);
+}
+type_init(nios2_10m50_ghrd_type_init);
-- 
2.25.1


