Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E3B496D76
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 19:57:24 +0100 (CET)
Received: from localhost ([::1]:52796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBLZi-0003h5-JL
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 13:57:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBL4x-0005m2-Eh
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 13:25:36 -0500
Received: from [2a00:1450:4864:20::336] (port=45902
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBL4u-0007hX-Kq
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 13:25:34 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 j5-20020a05600c1c0500b0034d2e956aadso24812052wms.4
 for <qemu-devel@nongnu.org>; Sat, 22 Jan 2022 10:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=43IFxuU/YGBMpyeQtij+KdO9QDh+O+m1Z7AVC7ByFvI=;
 b=F676+Ro+KqESj+RvAEUztwiT0ZOh+NPLC29tSx0aYAElia9/8fUcbN9erhEyNtLpLy
 oaMQK9bvwt6+b3vhl+XkZbHEtN4IpEncdUeVzfrq9R4UOKOlWwzw3Y8uG7gbCeJjfL3l
 4Eg/Nbqr6dSSaZlxozaHyn+Q/GYSAYPifuTdcDF3o4iPq946Q5G7aSHsWH7SvnpnRjjl
 n2X+KhgHfq+jTy2GbfLWcuzUuH8ZWOpoUWqGejA9fpeEfgOQNO/uZOLf4B0XOmR43KdB
 ppVAqwVpYi1zfOEgi96l/IHS9+rgGLnB+/oylGmo1T2rc7SgbsUQOqcr2UPo3Z1C+/On
 kAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=43IFxuU/YGBMpyeQtij+KdO9QDh+O+m1Z7AVC7ByFvI=;
 b=Ye5rz8CDJwcDoPxtW62TwQqDsFF0Ddd1VoCw7xl5g+wslsCkAf7eNS5gnmz2/6bf6/
 DXMUUEr7POLrPTqiXZcvG2gvr9l/dI5hxVHoaJwOeN9k5H9H40KqFtdqtsaicgbz++VE
 3UE02jBGlL8OVsRPSSEgTzhnDmPvHvHwqd5hEXXoTaaEZFkQWEr+XXh0nUJtYfuE6LE/
 pntI0yqACC1CG7slAuq1dZZ1F7RQAIycVAdnqo4pFyLNncyOLAlE40LPVYRve7L9FICG
 3eLeTYrflvDeviT8TjUbLorVSQi6YX04bi44WWYj4Ix6w8y2qFhud8wKBE1zxkY2Tj/f
 nxSg==
X-Gm-Message-State: AOAM533Hi/0e7ts1lMyWeTA/OooF4mOsTebrWaEYcB/2Jl9Fn8Rbkzbw
 77ykxBTNJvEpuZMtpZxS3HILkg==
X-Google-Smtp-Source: ABdhPJzOeBuh4M+E89YNgUfkjiGjIKUfxbu28J1vwIt+EdWbDUiAFuQKDAf4XFeBVrjDxvVgbhuZuQ==
X-Received: by 2002:a7b:c7d4:: with SMTP id z20mr5445178wmk.114.1642875894073; 
 Sat, 22 Jan 2022 10:24:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id 21sm8870774wmk.45.2022.01.22.10.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 10:24:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 11/14] hw/intc/arm_gicv3_its: Make GITS_BASER<n> RAZ/WI for
 unimplemented registers
Date: Sat, 22 Jan 2022 18:24:41 +0000
Message-Id: <20220122182444.724087-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220122182444.724087-1-peter.maydell@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ITS has a bank of 8 GITS_BASER<n> registers, which allow the
guest to specify the base address of various data tables.  Each
register has a read-only type field indicating which table it is for
and a read-write field where the guest can write in the base address
(among other things).  We currently allow the guest to write the
writeable fields for all eight registers, even if the type field is 0
indicating "Unimplemented".  This means the guest can provoke QEMU
into asserting by writing an address into one of these unimplemented
base registers, which bypasses the "if (!value) continue" check in
extract_table_params() and lets us hit the assertion that the type
field is one of the permitted table types.

Prevent the assertion by not allowing the guest to write to the
unimplemented base registers. This means their value will remain 0
and extract_table_params() will ignore them.


Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index b17f2631269..237198845d7 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -929,6 +929,10 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
         if (!(s->ctlr & R_GITS_CTLR_ENABLED_MASK)) {
             index = (offset - GITS_BASER) / 8;
 
+            if (s->baser[index] == 0) {
+                /* Unimplemented GITS_BASERn: RAZ/WI */
+                break;
+            }
             if (offset & 7) {
                 value <<= 32;
                 value &= ~GITS_BASER_RO_MASK;
@@ -1025,6 +1029,10 @@ static bool its_writell(GICv3ITSState *s, hwaddr offset,
          */
         if (!(s->ctlr & R_GITS_CTLR_ENABLED_MASK)) {
             index = (offset - GITS_BASER) / 8;
+            if (s->baser[index] == 0) {
+                /* Unimplemented GITS_BASERn: RAZ/WI */
+                break;
+            }
             s->baser[index] &= GITS_BASER_RO_MASK;
             s->baser[index] |= (value & ~GITS_BASER_RO_MASK);
         }
-- 
2.25.1


