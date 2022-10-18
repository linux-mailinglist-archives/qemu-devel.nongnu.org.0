Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEA6602D8C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 15:57:38 +0200 (CEST)
Received: from localhost ([::1]:41112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okn68-00032d-NT
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 09:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmgw-0002MR-OW
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmgn-00051c-6M
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=osh32bXliqc9+xMnWun8jK/3xeIfkSUICao8CeLnwxs=;
 b=FHp1e/FWgd3FcguqxAOS4svEpoAdMWgEGXkJ6P0Vvr1ZRk1u2O3dH1aWUYsvefQ4VgGQOj
 wP/LxUL3FkL/HUUcnEtLEvv737Lm2isvSfgQDcwIp+x60Vrh/7q/2NwY5rHWuF2JivbXSe
 Y762jlbF7ZBBooS3PCPUdDbQyrBKPig=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-490-SgFASPUdNuyk9hXbI676CQ-1; Tue, 18 Oct 2022 09:31:22 -0400
X-MC-Unique: SgFASPUdNuyk9hXbI676CQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 z7-20020a05640235c700b0045d3841ccf2so8252724edc.9
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=osh32bXliqc9+xMnWun8jK/3xeIfkSUICao8CeLnwxs=;
 b=lA3snfSlbxstdhIjTXxedif4T+aDNgCtG1j8/FBBGm7jN2id3gxCul5XxsPu/1uVsK
 GXhqbkZ55+fdDSN2wqHooaU0Zvu4KnOKTqI8SiJtxfqAXX6Ayy8HaeQWNco6j52wxjQW
 6Ja1d0eLLrBj8YfcCEfsM07xt5ub5c/Ydo+e2nALzLYJfGDDzhB3at8q4cFX+7c+8brL
 DHugEeaWEJSUiasyNEvCVdkHRrHSe9b/fZAvizI254Trv6W+G2PyJT2FNouktUFWdPxt
 yh5WIQGTcGubwBl5neuKghKJnlmw1n8y4DeOcdZSaS0Y4sX47TtbzVt/X/kPDC3OnO8G
 wwww==
X-Gm-Message-State: ACrzQf3Z6gH6fE8lgrjTuQkYe2YKy8IJI8B/yvKMgNQeihv9jps/3Gat
 IuGRJj2ar0It6lpunBHVmVJNbUCneRj8YeNZKTGJsX93Bz/cCko2Te5jTkgf2xCHYc7a/uvfc6N
 dMcGI1qNGggTx1m7qy3PldOXlqBM6nLxcucMHMffT4YY8oAKSZaG3DnmYftY5AWXZW9Y=
X-Received: by 2002:a05:6402:3592:b0:45c:fb8a:c57d with SMTP id
 y18-20020a056402359200b0045cfb8ac57dmr2661382edc.290.1666099880987; 
 Tue, 18 Oct 2022 06:31:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5qaaETNP6oyLL98sLrwU/MrlHSY2Mj00/dGUAi3M34yAMAor5OfvVNK0zXxsLYwydg0V1bNA==
X-Received: by 2002:a05:6402:3592:b0:45c:fb8a:c57d with SMTP id
 y18-20020a056402359200b0045cfb8ac57dmr2661355edc.290.1666099880662; 
 Tue, 18 Oct 2022 06:31:20 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 c7-20020aa7d607000000b0045d74aa401fsm4920636edr.60.2022.10.18.06.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:31:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 10/53] target/i386: Direct call get_hphys from mmu_translate
Date: Tue, 18 Oct 2022 15:29:59 +0200
Message-Id: <20221018133042.856368-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221018133042.856368-1-pbonzini@redhat.com>
References: <20221018133042.856368-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Use a boolean to control the call to get_hphys instead
of passing a null function pointer.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221002172956.265735-3-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/sysemu/excp_helper.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index eee59aa977..c9f6afba29 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -24,14 +24,10 @@
 
 #define PG_ERROR_OK (-1)
 
-typedef hwaddr (*MMUTranslateFunc)(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
-				int *prot);
-
 #define GET_HPHYS(cs, gpa, access_type, prot)  \
-	(get_hphys_func ? get_hphys_func(cs, gpa, access_type, prot) : gpa)
+	(use_stage2 ? get_hphys(cs, gpa, access_type, prot) : gpa)
 
-static int mmu_translate(CPUState *cs, hwaddr addr,
-                         MMUTranslateFunc get_hphys_func,
+static int mmu_translate(CPUState *cs, hwaddr addr, bool use_stage2,
                          uint64_t cr3, MMUAccessType access_type,
                          int mmu_idx, int pg_mode,
                          hwaddr *xlat, int *page_size, int *prot)
@@ -329,7 +325,7 @@ hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
         return gphys;
     }
 
-    exit_info_1 = mmu_translate(cs, gphys, NULL, env->nested_cr3,
+    exit_info_1 = mmu_translate(cs, gphys, false, env->nested_cr3,
                                access_type, MMU_USER_IDX, env->nested_pg_mode,
                                &hphys, &page_size, &next_prot);
     if (exit_info_1 == PG_ERROR_OK) {
@@ -395,7 +391,7 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
             }
         }
 
-        error_code = mmu_translate(cs, addr, get_hphys, env->cr[3], access_type,
+        error_code = mmu_translate(cs, addr, true, env->cr[3], access_type,
                                    mmu_idx, pg_mode,
                                    &paddr, &page_size, &prot);
     }
-- 
2.37.3


