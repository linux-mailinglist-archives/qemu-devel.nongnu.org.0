Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BC02B5210
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 21:12:07 +0100 (CET)
Received: from localhost ([::1]:45602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kekr7-0007Uc-US
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 15:12:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1kekj5-0006Zp-Hr
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 15:03:47 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:38059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1kekiz-0003qY-H0
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 15:03:47 -0500
Received: by mail-wr1-x443.google.com with SMTP id p8so20178295wrx.5
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 12:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LQ5PlTLBPaWjXBJdYVTH/A1PITEFjXh0Af0OEsuDpOY=;
 b=TbDzE1O8e6JkTTKvi0CIzHQSn6srYvNl9nJmq9+tUjC+ITIVQW1vyG4b8ggnDa5Anz
 M1++UT2bqZ3wAqpIX1bp9gCfXsrNQYpgBt2DaL9CfLqjQjYXX3nJ3rr0oqx9SfWYTnYf
 4/F3GKa/5rUVyjP56ks5uejoW2A/rXHnfk/zFW6WoJokMc6LbXMZK7DK92lDxgWTkzU/
 YcwN3FE8zHdhHzX8UfyFrkjC+8h6ulaU3/bnAXYYnI1TOqqAI2DHTRGuO49xmvdjj4kF
 LrMNjZYaQNUcvQotlbF9iUblvHj8vJpUwuro6JCTK3Uihwpxw+ZCekxu2GMB2bJRS+3m
 x5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LQ5PlTLBPaWjXBJdYVTH/A1PITEFjXh0Af0OEsuDpOY=;
 b=pw9OEIe4TClWOiSOi+g6WoCk5FQthKnq0HgxWGB4tRxwYU5MgrHQpQAoRT4eic7i3U
 s7Q8sVdVV9f8+ztgOuMULAc14HTzRaLdeVue8BQ/UxzQJy4eKZ8iYAVsYf34iFlK9Ow2
 pM2lqkCmmvkCnJWkhpg+RVFeTkVvFOWAZdOChrUSTsn/4nyL6uJqZQ6zZyF5Q/O8KrVG
 4XIenjpBKhz806IXhhdsj0mTsQh6fM6suUf7eXuIgDD51WnzYw6Cp97EiEpEUOZ0OSrn
 mFY+m2a9v50vyi4Lr5Xjb913ker1qL9G6L9/P8121eGYlVjATCiEY5t6oVXP2FpLjumM
 wm1w==
X-Gm-Message-State: AOAM531goxRcFHtdWM34Wer7FNNzynWyRQIpGOi611BNznafY3mVlTBt
 HVAYfC2syHWqyU3RaIHWG3+pYQ==
X-Google-Smtp-Source: ABdhPJysIZip0TFeFwrIXOdre1cczGpSt1InwB7uaXXWTezp2wyf7/Hk9c0zNQV1ZXMvDcMKDyIysA==
X-Received: by 2002:a5d:448a:: with SMTP id j10mr20214467wrq.33.1605557019271; 
 Mon, 16 Nov 2020 12:03:39 -0800 (PST)
Received: from Jessicas-MacBook.local (trinity-students-nat.trin.cam.ac.uk.
 [131.111.193.104])
 by smtp.gmail.com with ESMTPSA id s202sm436173wme.39.2020.11.16.12.03.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Nov 2020 12:03:38 -0800 (PST)
Received: by Jessicas-MacBook.local (Postfix, from userid 501)
 id 45D6F20985F094; Mon, 16 Nov 2020 20:03:38 +0000 (GMT)
From: Jessica Clarke <jrtc27@jrtc27.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hvf: Gate RDTSCP on CPU_BASED2_RDTSCP,
 not just CPU_BASED_TSC_OFFSET
Date: Mon, 16 Nov 2020 20:03:19 +0000
Message-Id: <20201116200319.28138-1-jrtc27@jrtc27.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=jrtc27@jrtc27.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jessica Clarke <jrtc27@jrtc27.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Buglink: https://bugs.launchpad.net/qemu/+bug/1894836
Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
---
 target/i386/hvf/x86_cpuid.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/i386/hvf/x86_cpuid.c b/target/i386/hvf/x86_cpuid.c
index 16762b6eb4..fc1f87ec57 100644
--- a/target/i386/hvf/x86_cpuid.c
+++ b/target/i386/hvf/x86_cpuid.c
@@ -122,6 +122,10 @@ uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
                 CPUID_PAT | CPUID_PSE36 | CPUID_EXT2_MMXEXT | CPUID_MMX |
                 CPUID_FXSR | CPUID_EXT2_FXSR | CPUID_EXT2_PDPE1GB | CPUID_EXT2_3DNOWEXT |
                 CPUID_EXT2_3DNOW | CPUID_EXT2_LM | CPUID_EXT2_RDTSCP | CPUID_EXT2_NX;
+        hv_vmx_read_capability(HV_VMX_CAP_PROCBASED2, &cap);
+        if (!(cap & CPU_BASED2_RDTSCP)) {
+            edx &= ~CPUID_EXT2_RDTSCP;
+        }
         hv_vmx_read_capability(HV_VMX_CAP_PROCBASED, &cap);
         if (!(cap & CPU_BASED_TSC_OFFSET)) {
             edx &= ~CPUID_EXT2_RDTSCP;
-- 
2.28.0


