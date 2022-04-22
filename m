Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ED150B59A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:53:46 +0200 (CEST)
Received: from localhost ([::1]:45056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqv3-0001v7-Ki
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9p-0004TQ-2i
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:57 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:51054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9n-0002cr-96
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:56 -0400
Received: by mail-wm1-x32e.google.com with SMTP id r19so4805219wmq.0
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WIST8kjiIGq+L/1mU+YgaPeTPxejflCj2X2BV/ommNc=;
 b=eUabf6FYm6XHFWyEhI8QYYDKGptEjsdraJtgoiqkwExudh04nhCbR1EONTSxQ48sHM
 bVHE+VcTvAIZTkYwFNjFED5hjND/rLbqMnMLeis12B8FQiAmJ2b7Dnku/0xXcT0hoDmD
 SFeFpYjsmd+8Bjll1mfOqJvcZTCjnPqefR8OZ3Vlvejb9rULwCiFScc+EzAXgn9JjcBF
 crycMaVvZGDepjFUereq2aKVnpzVDSajGXkHhTAnm4vMUx/Xwl8QOb2JejT49PhFAMx/
 EfxKEi+10syD2I3F9yIm3yWCxL5J31ElW24qrnn8TIcIsWKUSRPLWDrtTxKMsmqG8sx2
 /s1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WIST8kjiIGq+L/1mU+YgaPeTPxejflCj2X2BV/ommNc=;
 b=TtUXMkkhoZDgsHZxpFP3bCJMNov2JkVMoK/JbSmeVF8QUth50z7dMqdm+4nZCJdNf8
 onOvF2FwvDmfgXAz/Uiyhpa3yTDPmio2dnpVXPw3M0IBImPusmomVFG5IOEaYLvzjFqI
 +vPJLvSxNCH7e+ymxYIflbdtIWDQ79uQ0F515VtpvptJWZ9VwyVFChcmwkGcF5RLkGM7
 Py+fQRiT57a3cv97SpIEovXTbCIFmivxC2T72OaD/qAaSsCmIaxI4TgQyyyTDUe+B40Q
 Pab+Ir4OWVBXzOiQnn/Y8h425UA6DLzIAgyIActDycJ28lmgCz2qTJYGcvhfc/qbYOMt
 mgng==
X-Gm-Message-State: AOAM531WfMxDsRWXpvO4Q7hwdI3AjJtbO6PUvlI5Tiwphd0D7KeAE0H9
 yppeq1vZbx9FmYQdMXuaxHpn78WbVdvO0A==
X-Google-Smtp-Source: ABdhPJzY5fN+GqbtLXdfhpoXBjjTq3b4nXtfl5hAnApRwqASWuw06dmsJ/0/w4Z8i8JokGa8jislSQ==
X-Received: by 2002:a05:600c:1e85:b0:391:ca59:76be with SMTP id
 be5-20020a05600c1e8500b00391ca5976bemr12411734wmb.184.1650621893686; 
 Fri, 22 Apr 2022 03:04:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.04.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:04:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/61] hw/intc/arm_gicv3_its: Implement VINVALL
Date: Fri, 22 Apr 2022 11:03:52 +0100
Message-Id: <20220422100432.2288247-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The VINVALL command should cause any cached information in the
ITS or redistributor for the specified vCPU to be dropped or
otherwise made consistent with the in-memory LPI configuration
tables.

Here we implement the command and table parsing, leaving the
redistributor part as a stub for the moment, as usual.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-22-peter.maydell@linaro.org
---
 hw/intc/gicv3_internal.h   | 13 +++++++++++++
 hw/intc/arm_gicv3_its.c    | 26 ++++++++++++++++++++++++++
 hw/intc/arm_gicv3_redist.c |  5 +++++
 hw/intc/trace-events       |  1 +
 4 files changed, 45 insertions(+)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 050e19d133b..8d58d38836f 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -335,6 +335,7 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 #define GITS_CMD_VMAPP            0x29
 #define GITS_CMD_VMAPTI           0x2A
 #define GITS_CMD_VMAPI            0x2B
+#define GITS_CMD_VINVALL          0x2D
 
 /* MAPC command fields */
 #define ICID_LENGTH                  16
@@ -411,6 +412,9 @@ FIELD(VMOVI_1, VPEID, 32, 16)
 FIELD(VMOVI_2, D, 0, 1)
 FIELD(VMOVI_2, DOORBELL, 32, 32)
 
+/* VINVALL command fields */
+FIELD(VINVALL_1, VPEID, 32, 16)
+
 /*
  * 12 bytes Interrupt translation Table Entry size
  * as per Table 5.3 in GICv3 spec
@@ -637,6 +641,15 @@ void gicv3_redist_movall_lpis(GICv3CPUState *src, GICv3CPUState *dest);
 void gicv3_redist_mov_vlpi(GICv3CPUState *src, uint64_t src_vptaddr,
                            GICv3CPUState *dest, uint64_t dest_vptaddr,
                            int irq, int doorbell);
+/**
+ * gicv3_redist_vinvall:
+ * @cs: GICv3CPUState
+ * @vptaddr: address of VLPI pending table
+ *
+ * On redistributor @cs, invalidate all cached information associated
+ * with the vCPU defined by @vptaddr.
+ */
+void gicv3_redist_vinvall(GICv3CPUState *cs, uint64_t vptaddr);
 
 void gicv3_redist_send_sgi(GICv3CPUState *cs, int grp, int irq, bool ns);
 void gicv3_init_cpuif(GICv3State *s);
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index c718ef2ff92..0670aca4d46 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -1163,6 +1163,29 @@ static ItsCmdResult process_vmovi(GICv3ITSState *s, const uint64_t *cmdpkt)
     return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE_OK : CMD_STALL;
 }
 
+static ItsCmdResult process_vinvall(GICv3ITSState *s, const uint64_t *cmdpkt)
+{
+    VTEntry vte;
+    uint32_t vpeid;
+    ItsCmdResult cmdres;
+
+    if (!its_feature_virtual(s)) {
+        return CMD_CONTINUE;
+    }
+
+    vpeid = FIELD_EX64(cmdpkt[1], VINVALL_1, VPEID);
+
+    trace_gicv3_its_cmd_vinvall(vpeid);
+
+    cmdres = lookup_vte(s, __func__, vpeid, &vte);
+    if (cmdres != CMD_CONTINUE_OK) {
+        return cmdres;
+    }
+
+    gicv3_redist_vinvall(&s->gicv3->cpu[vte.rdbase], vte.vptaddr << 16);
+    return CMD_CONTINUE_OK;
+}
+
 static ItsCmdResult process_inv(GICv3ITSState *s, const uint64_t *cmdpkt)
 {
     uint32_t devid, eventid;
@@ -1364,6 +1387,9 @@ static void process_cmdq(GICv3ITSState *s)
         case GITS_CMD_VMOVI:
             result = process_vmovi(s, cmdpkt);
             break;
+        case GITS_CMD_VINVALL:
+            result = process_vinvall(s, cmdpkt);
+            break;
         default:
             trace_gicv3_its_cmd_unknown(cmd);
             break;
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index dc25997d1f9..7c75dd6f072 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -818,6 +818,11 @@ void gicv3_redist_mov_vlpi(GICv3CPUState *src, uint64_t src_vptaddr,
      */
 }
 
+void gicv3_redist_vinvall(GICv3CPUState *cs, uint64_t vptaddr)
+{
+    /* The redistributor handling will be added in a subsequent commit */
+}
+
 void gicv3_redist_inv_vlpi(GICv3CPUState *cs, int irq, uint64_t vptaddr)
 {
     /*
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 9894756e55a..004a1006fb8 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -194,6 +194,7 @@ gicv3_its_cmd_vmapp(uint32_t vpeid, uint64_t rdbase, int valid, uint64_t vptaddr
 gicv3_its_cmd_vmovp(uint32_t vpeid, uint64_t rdbase) "GICv3 ITS: command VMOVP vPEID 0x%x RDbase 0x%" PRIx64
 gicv3_its_cmd_vsync(void) "GICv3 ITS: command VSYNC"
 gicv3_its_cmd_vmovi(uint32_t devid,  uint32_t eventid, uint32_t vpeid, int dbvalid, uint32_t doorbell) "GICv3 ITS: command VMOVI DeviceID 0x%x EventID 0x%x vPEID 0x%x D %d Dbell_pINTID 0x%x"
+gicv3_its_cmd_vinvall(uint32_t vpeid) "GICv3 ITS: command VINVALL vPEID 0x%x"
 gicv3_its_cmd_unknown(unsigned cmd) "GICv3 ITS: unknown command 0x%x"
 gicv3_its_cte_read(uint32_t icid, int valid, uint32_t rdbase) "GICv3 ITS: Collection Table read for ICID 0x%x: valid %d RDBase 0x%x"
 gicv3_its_cte_write(uint32_t icid, int valid, uint32_t rdbase) "GICv3 ITS: Collection Table write for ICID 0x%x: valid %d RDBase 0x%x"
-- 
2.25.1


