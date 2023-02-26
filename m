Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4EB6A345D
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 23:07:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWPAo-0002Qh-UL; Sun, 26 Feb 2023 17:07:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Ctj7YwgKCs8D79DEv0v19916z.x97Bz7F-yzGz689818F.9C1@flex--smostafa.bounces.google.com>)
 id 1pWPAj-0002Om-9u
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 17:07:10 -0500
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Ctj7YwgKCs8D79DEv0v19916z.x97Bz7F-yzGz689818F.9C1@flex--smostafa.bounces.google.com>)
 id 1pWPAh-0003uC-QS
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 17:07:09 -0500
Received: by mail-wm1-x349.google.com with SMTP id
 f14-20020a7bcc0e000000b003dd41ad974bso2105130wmh.3
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 14:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=5TC0wFDlcrEeYII5tY/AKUl2RtqT3yWH0TbfuyNXD9o=;
 b=Fy0/vgORRnReXyOSSxrZliKq5c7pm0JTu5obFxJtU6OAMT5szKIteAN+44aduytQXg
 8sm/SzWf/hnvtBingVIDsTm4onAnT9cddqOAI1ZbvqWw0L+CJh8OAU2m09hxmXr7tuvW
 jW6TEh7esdxBK0xmFxpXW3iGb3EctBJU7W/C4eMNyNZmHJBVsL81AwEckMoWOmENzKsi
 EsVNIjc/5rGMSf3A46WG13qUra7oICjB3OFrYU6/ExmTSEVYN6CJxAsJgrsyT3YzvFiL
 0u0kibzTE9tPR4x14vTt6frlGke3EKcKJIEKdvlkhF8XfnffJu+84aY09DyoUKMOWT1y
 EPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5TC0wFDlcrEeYII5tY/AKUl2RtqT3yWH0TbfuyNXD9o=;
 b=xXvDboN0B4vHjgAqcJ+vH8RAUJKZCAxya94WulwVRA63GbwWNoIpS08i9rzdZL/1n7
 gnFgm1K1GbopZtOn1h5xlDLK/yVzeXTk0uc3GRP6GVCcnz8jswUDuNdYh3wuv64kluvK
 dNchHMFeJyqOGHFBZgxsP669RF2k7EIyTYqvhMYZAiRXpY6szBJjRF0AbaTekQLvs1GH
 jNtzLCalsaARxB066jh6anlhxSfnSBTAakImKLkwHzJr/ohDE8SgDzKdUUKcH8RxEVuM
 pvPAt9qNm5dwzzO0OufsnM34qIHeZQWwbMuIqLrtuyo6AJ++w/bwRD3yJlbWoKZBwsPc
 hEtQ==
X-Gm-Message-State: AO0yUKVizkOxhDQm6FJpHbbs9JH5A2bOm0e/62Zs/7rfEjoKhKT3RYs6
 tzDjVXf5gABP13OSMl+wBNc+YitH7HrXICVqnWBSwlW5UwIGBZJFoUBTGqJ7GOay5TbVVvazx0S
 Ruj5EswNINfXcL8+BV9tac7b1ER8LjNTlyiurykOjJBONnyI6t9i/Eor7e5LstvpITg==
X-Google-Smtp-Source: AK7set/lk0BR9GV0caa9w8zB9p0UC/AMOuODD0To7wUCObauzSZqKOBA7GVa+Riv/j3YTGebPZODYbFrHqKm0Q==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:adf:d844:0:b0:2c5:52f8:59ab with SMTP id
 k4-20020adfd844000000b002c552f859abmr1812543wrl.13.1677449226015; Sun, 26 Feb
 2023 14:07:06 -0800 (PST)
Date: Sun, 26 Feb 2023 22:06:41 +0000
In-Reply-To: <20230226220650.1480786-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230226220650.1480786-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Message-ID: <20230226220650.1480786-3-smostafa@google.com>
Subject: [RFC PATCH v2 02/11] hw/arm/smmuv3: Update translation config to hold
 stage-2
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::349;
 envelope-from=3Ctj7YwgKCs8D79DEv0v19916z.x97Bz7F-yzGz689818F.9C1@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x349.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
 -tsz: Input range
 -sl0: start level of translation
 -affd: AF fault disable
 -granule_sz: Granule page shift
 -vmid: VMID
 -vttb: PA of translation table
 -oas: Output address size

They will be used in the next patches in stage-2 address translation.

No functional change intended.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
Changes in v2:
-Add oas
---
 include/hw/arm/smmu-common.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 9fcff26357..2deead08d6 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -58,6 +58,16 @@ typedef struct SMMUTLBEntry {
     uint8_t granule;
 } SMMUTLBEntry;
 
+typedef struct SMMUS2Cfg {
+    uint8_t tsz;            /* Input range */
+    uint8_t sl0;            /* Start level of translation */
+    bool affd;              /* AF Fault Disable */
+    uint8_t granule_sz;     /* Granule page shift */
+    uint8_t oas;            /* Output address size */
+    uint16_t vmid;          /* Virtual machine ID */
+    uint64_t vttb;          /* PA of translation table */
+} SMMUS2Cfg;
+
 /*
  * Generic structure populated by derived SMMU devices
  * after decoding the configuration information and used as
@@ -77,6 +87,7 @@ typedef struct SMMUTransCfg {
     SMMUTransTableInfo tt[2];
     uint32_t iotlb_hits;       /* counts IOTLB hits for this asid */
     uint32_t iotlb_misses;     /* counts IOTLB misses for this asid */
+    struct SMMUS2Cfg s2cfg;
 } SMMUTransCfg;
 
 typedef struct SMMUDevice {
-- 
2.39.2.637.g21b0678d19-goog


