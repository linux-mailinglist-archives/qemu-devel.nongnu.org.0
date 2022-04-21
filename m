Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5536F50A505
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:09:16 +0200 (CEST)
Received: from localhost ([::1]:57688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZMp-0003Nq-ET
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZo-0008Mu-OT
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:36 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:56291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZk-0006Mk-DX
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:36 -0400
Received: by mail-pj1-x102e.google.com with SMTP id u5so2135104pjr.5
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0EK3Litbg/R+iOy2ToK0s2extd0TPN3Lzla7IqyLnHw=;
 b=Ugf1TBiMd/z3DJy8wKTkEYQivWD79jLPPhZb38Ir/jzkn5EiyH1GU03n1c2t/Ue0yS
 t3NP+vI9l16cOYLtqrUxCm0eSO3SmJHzYCfdMBOXNv0wwwDZyAbE1EWhuWh9pXIQf2Te
 By/8nPm4WMMJYv04wUshvO8bAAU130ZfWgQE1V2Mug5oweojTDd0gMqyt7nGEWVcFHlo
 gZYRQdF+w57aPw4fObXNJWhuVe9h4KOgDP2fVQ0eOj1ahMO0cqxUDV6uLGnuq+hYrLJi
 c2kC8T+cKqHV+LWDoJ/PRV/P8HsZQA1HzoRhjSMt5/ABv8IdnowaGfjuO6UONS+0TSo1
 3a2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0EK3Litbg/R+iOy2ToK0s2extd0TPN3Lzla7IqyLnHw=;
 b=NqfMC2Xfg0fmLhG30CP5JYFJ5JRyANteglLj9pLbliCMSg0CShmET9Wrvg5qHaKmZl
 xahilexs/ecbjiHk/QicxE4IuRrtk2P9NU6YvcnPcZ/EOAoI1P5O+FVnGNSAPDI6ElOn
 H+ZXbsqJXfMD3Vk+SyXNKX4UlPKTaXHNY7r0eI5FDdjCNcRGSxYYwAWMHFNVR76gP9NB
 QtPe4Ra2vtA/n8oBx38nmHHBCEobFBR0QYMlwHdL5nUlagzzDLY2PGhXxf9M8Z/r3obG
 kjGz2yvfZk3cSUMruSWO5IEnrUmHb/tRXATYksCQ4+aLYppQfZTqBoVDdOGLT2ntheH2
 LU6Q==
X-Gm-Message-State: AOAM533D0fFyUun6JU+BzYhSLkNspzgex6RIALzAkSySxsmvotUqhmC9
 13t4KGibhC7z9SSrp10uw0if49njaydwCw==
X-Google-Smtp-Source: ABdhPJwU5x/SNU67CeoTYX+eIv9SsykP4DHFB8/EDPBL9KwznHybqw5cDJ4HJa8aEQ4/jYZpTa3ULg==
X-Received: by 2002:a17:902:c944:b0:158:de4a:6975 with SMTP id
 i4-20020a170902c94400b00158de4a6975mr25704716pla.131.1650554310842; 
 Thu, 21 Apr 2022 08:18:30 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.18.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:18:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 34/64] target/nios2: Handle EXCP_UNALIGN and EXCP_UALIGND
Date: Thu, 21 Apr 2022 08:17:05 -0700
Message-Id: <20220421151735.31996-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

While some of the plumbing for misaligned data is present, in the form
of nios2_cpu_do_unaligned_access, the hook will not be called because
TARGET_ALIGNED_ONLY is not set in configs/targets/nios2-softmmu.mak.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index c57ffd64e0..25a89724d0 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -99,6 +99,12 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         case EXCP_ILLEGAL:
             name = "ILLEGAL insn";
             break;
+        case EXCP_UNALIGN:
+            name = "Misaligned (data)";
+            break;
+        case EXCP_UNALIGND:
+            name = "Misaligned (destination)";
+            break;
         case EXCP_TRAP:
             name = "TRAP insn";
             break;
@@ -147,6 +153,8 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     case EXCP_SUPERD:
     case EXCP_ILLEGAL:
     case EXCP_TRAP:
+    case EXCP_UNALIGN:
+    case EXCP_UNALIGND:
         do_exception(cpu, cpu->exception_addr, false);
         break;
 
-- 
2.34.1


