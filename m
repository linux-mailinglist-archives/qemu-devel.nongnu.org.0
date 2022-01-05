Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A3A485434
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:18:03 +0100 (CET)
Received: from localhost ([::1]:37790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5774-0003S3-CK
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:18:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56pz-0004YQ-Ia
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:00:26 -0500
Received: from [2a00:1450:4864:20::434] (port=42646
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56pv-0006R7-Vm
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:00:21 -0500
Received: by mail-wr1-x434.google.com with SMTP id w20so74212315wra.9
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 06:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GXDm8hdsExg69QasJSt8DCDNOGxsKk0YAdPNX/7etlw=;
 b=eh5CpnOQIKTCRtcZqLYTizByF5LhwF9e9fIAi+sesNJge06S/mDmmf6wZdVrPAjZ9S
 KX0dWG77llT37zFEyVYrsBNuhaJJKr+hujKRh6NXyA12ToS8D6m18rmkRI4vcpGRGMsG
 nC5RwBrSEUpGVdb3t2JWkONfr224+B4NqPR6R/sQf33Q2AJ8d0Yws/KSPvDG1RxHztA5
 3I4U2GUwln1PBpuMOoWBgU3v1zs1Jb1qFcKB9nG951ddkcDqFVV7G38D0DdqaGKpHzh3
 mnsaYWd/vZuLfiFP09FlONcr4eiKahBoXIk+hMPnSlGNCFX4fJTXaRxQDoT5qWWwwJa+
 UbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GXDm8hdsExg69QasJSt8DCDNOGxsKk0YAdPNX/7etlw=;
 b=Hkme/3yLEl9iEQTkn7KuNLw/HJMcpFn5RNS1d1gGzLx7976T+mqk4vyhPdWpctbBYP
 NOt4NwtjQSML+nrkIKpRbpe/tpbyXCf+chhRriDUP2wkJgM00lqMOzREf0Kv+XJN7URN
 jKKwqW2gTwbUpOR1KqDP1jBVcIFq10mo7crhQVo1bQCpAuQV7bUyUcw75fd/UuLU1W72
 ZEhkyJzTNNb3HhVuvFpG9H/3uvO9b1lqq/mAzkaHq3u1PpNmJaReERIyWiZMI/HKGBZZ
 hSo4mcS0y8MHbANuhvSSQrsvluF43U4AbZAoKrl93GaQ850YRLbbE4JYKNN1Hj01iBXA
 pJtg==
X-Gm-Message-State: AOAM530QoRrSVD2Cs2U2aoiSUCXwxtiwDilRMY6HThSg9kopfHJGQIyL
 DO6ureUllN4u2T5/4Be0Ln91Mw==
X-Google-Smtp-Source: ABdhPJy9xzJaXpkjcnRJltN+P75UXwKfiSXrrg0aTuj+YUYhqfakYQ4NXxYnmVamjXLwPTl3J4IMsg==
X-Received: by 2002:a05:6000:144c:: with SMTP id
 v12mr47370764wrx.62.1641391218603; 
 Wed, 05 Jan 2022 06:00:18 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f13sm41425316wri.51.2022.01.05.06.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 06:00:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5AA1C1FFD0;
 Wed,  5 Jan 2022 13:50:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 25/34] linux-user/elfload: add extra logging for hole
 finding
Date: Wed,  5 Jan 2022 13:50:00 +0000
Message-Id: <20220105135009.1584676-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220105135009.1584676-1-alex.bennee@linaro.org>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 Laurent Vivier <laurent@vivier.eu>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The various approaches to finding memory holes are quite complicated
to follow especially at a distance. Improve the logging so we can see
exactly what method found the space for the guest memory.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 linux-user/elfload.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 767f54c76d..238979b8b6 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2221,6 +2221,9 @@ static void pgb_have_guest_base(const char *image_name, abi_ulong guest_loaddr,
     if (test != addr) {
         pgb_fail_in_use(image_name);
     }
+    qemu_log_mask(CPU_LOG_PAGE,
+                  "%s: base @ %p for " TARGET_ABI_FMT_ld " bytes\n",
+                  __func__, addr, guest_hiaddr - guest_loaddr);
 }
 
 /**
@@ -2263,6 +2266,9 @@ static uintptr_t pgd_find_hole_fallback(uintptr_t guest_size, uintptr_t brk,
             if (mmap_start != MAP_FAILED) {
                 munmap(mmap_start, guest_size);
                 if (mmap_start == (void *) align_start) {
+                    qemu_log_mask(CPU_LOG_PAGE,
+                                  "%s: base @ %p for %" PRIdPTR" bytes\n",
+                                  __func__, mmap_start + offset, guest_size);
                     return (uintptr_t) mmap_start + offset;
                 }
             }
@@ -2342,6 +2348,12 @@ static uintptr_t pgb_find_hole(uintptr_t guest_loaddr, uintptr_t guest_size,
     }
     free_self_maps(maps);
 
+    if (ret != -1) {
+        qemu_log_mask(CPU_LOG_PAGE, "%s: base @ %" PRIxPTR
+                      " for %" PRIdPTR " bytes\n",
+                      __func__, ret, guest_size);
+    }
+
     return ret;
 }
 
@@ -2391,6 +2403,9 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
     }
 
     guest_base = addr;
+
+    qemu_log_mask(CPU_LOG_PAGE, "%s: base @ %"PRIxPTR" for %" PRIdPTR" bytes\n",
+                  __func__, addr, hiaddr - loaddr);
 }
 
 static void pgb_dynamic(const char *image_name, long align)
@@ -2447,6 +2462,9 @@ static void pgb_reserved_va(const char *image_name, abi_ulong guest_loaddr,
                      "using -R option)", reserved_va, test, strerror(errno));
         exit(EXIT_FAILURE);
     }
+
+    qemu_log_mask(CPU_LOG_PAGE, "%s: base @ %p for %ld bytes\n",
+                  __func__, addr, reserved_va);
 }
 
 void probe_guest_base(const char *image_name, abi_ulong guest_loaddr,
-- 
2.30.2


