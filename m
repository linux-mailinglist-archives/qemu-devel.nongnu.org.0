Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CCC6D2FB6
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 12:51:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piYoF-0000lD-Fp; Sat, 01 Apr 2023 06:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3WgwoZAgKCjspjlpqXcXdlldib.Zljnbjr-absbiklkdkr.lod@flex--smostafa.bounces.google.com>)
 id 1piYo9-0000kR-Ju
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 06:50:05 -0400
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3WgwoZAgKCjspjlpqXcXdlldib.Zljnbjr-absbiklkdkr.lod@flex--smostafa.bounces.google.com>)
 id 1piYo8-0002xv-1U
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 06:50:05 -0400
Received: by mail-wm1-x34a.google.com with SMTP id
 bi7-20020a05600c3d8700b003edecc610abso13330935wmb.7
 for <qemu-devel@nongnu.org>; Sat, 01 Apr 2023 03:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680346202;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=m3aKPW4F+6gdFhjv78BmaW/XTArewSv4O4GY4HYmCCM=;
 b=d+zWAuZXIeuv0EpV4DR/puDp5OFx2GW/KbSpVJmjK4bQf11uAQeFbz3OAjgZMEyX8b
 jzrl06UZQhGf3Ws5EYENm1uoxAU0x1fEt8xZzOvBAQjGzIZyCQ0lENqwmgUZhMByPP2Y
 44rqsg3a0UAzzR4sMThvgZXX36knjpck/1d8SN2ZGZMmDlIJ+nyiV0J3q9QU7zKXXpaw
 nbmDD1DaJdRjHIOVt/gF8ci6g8gKfMoZgW9/lgN41/eRR0tUDDDuVe4LNx16oIpLnk+q
 wtGHJ1q1oRD/fAooYLrBKGGIAoqE9sINf9vwSqBNxbQMeLGxOCBxZ6H5Zb5kmZQU1ANr
 ldsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680346202;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m3aKPW4F+6gdFhjv78BmaW/XTArewSv4O4GY4HYmCCM=;
 b=SXOGw9j/hvHOWF7aTPf8wy8XpvLsTarqP2UM4KtNmLD/HLw5l3K2JMi0c4Wj7dJJ2C
 LMG+8qzni7sQQUQtng8DGJsDopv83GkEHx5vK98lJNZhyZ0Jyn3h6Daxyatr5HJZnh3G
 nbf+EOdeEX5277MkyILAiOqLAhCq0+OrFZR0g8dC/m7RG0ooAaJPH1+T3O91w/iPiI7V
 xIipwkGnmYdvLbLikNsDNGoTgXStZVnqhufMG/50ljayavHiZafqTL2y45FFQrC0BdsP
 fdMYqOG3r5ujjF06c5orJD7HZuHsa3QENn3earXOlmx+FtPW1fhZKZ4CC4uWfv8GdBcB
 5Q9Q==
X-Gm-Message-State: AO0yUKXMnXCzwEMTS5iS/2axr2R3FblP3GdPlQQcNWnTDrr6Gycztb2X
 XG71C6Ii+kMQeys2Pu8Rw02kQJy6qgK2ECM4cW2VX3BdQrwtGgBuG0PPwA1Mn7AM5T8zmjxNpE+
 5Drc91R4Fg3nbXQ2EM34N50xZ1K2XiAfQlawkwQ4CFODbRFWuInGdFMdeHpy+2Kw7TQ==
X-Google-Smtp-Source: AK7set/xduRO5Rk4nEQEE55IPeHPEQlgEYhcS3GR4h/4TEfr3NB/u9v513ChaXXc2PArtKX2/Lexfk1uw/53ug==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a7b:ce16:0:b0:3eb:5a1e:d52c with SMTP id
 m22-20020a7bce16000000b003eb5a1ed52cmr6765325wmc.2.1680346202048; Sat, 01 Apr
 2023 03:50:02 -0700 (PDT)
Date: Sat,  1 Apr 2023 10:49:45 +0000
In-Reply-To: <20230401104953.1325983-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230401104953.1325983-1-smostafa@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230401104953.1325983-3-smostafa@google.com>
Subject: [RFC PATCH v3 02/10] hw/arm/smmuv3: Update translation config to hold
 stage-2
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::34a;
 envelope-from=3WgwoZAgKCjspjlpqXcXdlldib.Zljnbjr-absbiklkdkr.lod@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x34a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In preparation for adding stage-2 support, add a S2 config
struct(SMMUS2Cfg), composed of the following fields and embedded in
the main SMMUTransCfg:
 -tsz: Size of IPA input region (S2T0SZ)
 -sl0: Start level of translation (S2SL0)
 -affd: AF Fault Disable (S2AFFD)
 -record_faults: Record fault events (S2R)
 -granule_sz: Granule page shift (based on S2TG)
 -vmid: Virtual Machine ID (S2VMID)
 -vttb: Address of translation table base (S2TTB)
 -eff_ps: Effective PA output range (based on S2PS)

They will be used in the next patches in stage-2 address translation.

The fields in SMMUS2Cfg, are reordered to make the shared and stage-1
fields next to each other, this reordering didn't change the struct
size (104 bytes before and after).

Stage-1 only fields: aa64, asid, tt, ttb, tbi, record_faults, oas.
oas is stage-1 output address size. However, it is used to check
input address in case stage-1 is unimplemented or bypassed according
to SMMUv3 manual IHI0070.E "3.4. Address sizes"

Shared fields: stage, disabled, bypassed, aborted, iotlb_*.

No functional change intended.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
Changes in v3:
-Add record_faults for stage-2
-Reorder and document fields in SMMUTransCfg based on stage
-Rename oas in SMMUS2Cfg to eff_ps
-Improve comments in SMMUS2Cfg
Changes in v2:
-Add oas
---
 include/hw/arm/smmu-common.h | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 9fcff26357..9cf3f37929 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -58,25 +58,41 @@ typedef struct SMMUTLBEntry {
     uint8_t granule;
 } SMMUTLBEntry;
 
+/* Stage-2 configuration. */
+typedef struct SMMUS2Cfg {
+    uint8_t tsz;            /* Size of IPA input region (S2T0SZ) */
+    uint8_t sl0;            /* Start level of translation (S2SL0) */
+    bool affd;              /* AF Fault Disable (S2AFFD) */
+    bool record_faults;     /* Record fault events (S2R) */
+    uint8_t granule_sz;     /* Granule page shift (based on S2TG) */
+    uint8_t eff_ps;         /* Effective PA output range (based on S2PS) */
+    uint16_t vmid;          /* Virtual Machine ID (S2VMID) */
+    uint64_t vttb;          /* Address of translation table base (S2TTB) */
+} SMMUS2Cfg;
+
 /*
  * Generic structure populated by derived SMMU devices
  * after decoding the configuration information and used as
  * input to the page table walk
  */
 typedef struct SMMUTransCfg {
+    /* Shared fields between stage-1 and stage-2. */
     int stage;                 /* translation stage */
-    bool aa64;                 /* arch64 or aarch32 translation table */
     bool disabled;             /* smmu is disabled */
     bool bypassed;             /* translation is bypassed */
     bool aborted;              /* translation is aborted */
+    uint32_t iotlb_hits;       /* counts IOTLB hits */
+    uint32_t iotlb_misses;     /* counts IOTLB misses*/
+    /* Used by stage-1 only. */
+    bool aa64;                 /* arch64 or aarch32 translation table */
     bool record_faults;        /* record fault events */
     uint64_t ttb;              /* TT base address */
     uint8_t oas;               /* output address width */
     uint8_t tbi;               /* Top Byte Ignore */
     uint16_t asid;
     SMMUTransTableInfo tt[2];
-    uint32_t iotlb_hits;       /* counts IOTLB hits for this asid */
-    uint32_t iotlb_misses;     /* counts IOTLB misses for this asid */
+    /* Used by stage-2 only. */
+    struct SMMUS2Cfg s2cfg;
 } SMMUTransCfg;
 
 typedef struct SMMUDevice {
-- 
2.40.0.348.gf938b09366-goog


