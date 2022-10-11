Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA825FB1A8
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 13:42:57 +0200 (CEST)
Received: from localhost ([::1]:58618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiDex-000082-Ll
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 07:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUu-0002n5-HL
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUs-0004fS-37
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N5pThQV+AvZ9qttyOk+iasHOEoXj0JYQzOLb7Lr/VZk=;
 b=amXkIRykIDBzCE6MFyCsHl2pFRWWCOYV7aeJMN/TsIHMPFrT3D+nRa3mAOwnGbpt+qRnjJ
 9pzE4IMc+FFJgPikdxmFEx+WKqgFewiujjVRHD+9MzbQqfnwgB96A/PQOPYqFLZIN3uv7H
 qQT0/Ror67rYDEl4WiOYU6hZrW7uGyo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-464-Qy1dy20SM0mJdbqslkBsig-1; Tue, 11 Oct 2022 06:28:24 -0400
X-MC-Unique: Qy1dy20SM0mJdbqslkBsig-1
Received: by mail-ed1-f71.google.com with SMTP id
 f18-20020a056402355200b0045c13ee57d9so4151415edd.20
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N5pThQV+AvZ9qttyOk+iasHOEoXj0JYQzOLb7Lr/VZk=;
 b=aXEB8z8bEwXol7NRgAdq2Bxcenptm9icQx5Cjz34WFVLUJWVq1qFt9W5RNbi3RQyjN
 /iI/iaWjM6lL2tQtqIRrgqDp/yQP52vAMLuPw1OiFX0fDeZ01hN0YubcV42pLh9Lhu7b
 RGIBG9rA1zAHncuqkkvdOkfhypAZIeQfy3FN6869xZIdgpOBIztMCMQr4l0DFK+P4tKG
 KS8k5n+Ja1oqOoHaC4j+r89gagheF16tKl0KaVHCgB0kXFOW+PGQ/R9Jx1MuMehkY5oU
 dCqITI3CsD+ShnfZZfbbWN7Gqm369JmFjLNjo/ptkySi7RXaHzMgiWfFxSNqD5fjJ9Gs
 dqOw==
X-Gm-Message-State: ACrzQf3M/zqwMZ/r6G5fgEPls0FXWaCwe2nowSnh5PNgvdL84Etk+bnY
 4XXDi4ePYdbXdTuUzmbRs+0nQ/QVhfyPN2WQcJBV1Zc6xyeq3WCIaivMvKiy5X5BdmzRJiHOXFn
 hpMWdH6zwi1d4vaQgyIWnghHNXzRcpFQxsh90ZKeK3g6Gy7qHCLGPql3++DEiWjdOcZs=
X-Received: by 2002:a17:907:6e9e:b0:78c:5533:4158 with SMTP id
 sh30-20020a1709076e9e00b0078c55334158mr17662740ejc.417.1665484102818; 
 Tue, 11 Oct 2022 03:28:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM71UWjCw/CrXOHFUorTW8QP3KyR0R0ScZSYxLkDWlVBsu8jWFPjGPkR+MaRT7vf1p6GXjU0wQ==
X-Received: by 2002:a17:907:6e9e:b0:78c:5533:4158 with SMTP id
 sh30-20020a1709076e9e00b0078c55334158mr17662722ejc.417.1665484102510; 
 Tue, 11 Oct 2022 03:28:22 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a1709063fc500b0077f4f63a6f4sm6694752ejj.112.2022.10.11.03.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:28:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 28/37] target/i386: Create eip_cur_tl
Date: Tue, 11 Oct 2022 12:26:51 +0200
Message-Id: <20221011102700.319178-29-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011102700.319178-1-pbonzini@redhat.com>
References: <20221011102700.319178-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221001140935.465607-24-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 2e7b94700b..5b0dab8633 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -562,6 +562,11 @@ static TCGv eip_next_tl(DisasContext *s)
     return tcg_constant_tl(s->pc - s->cs_base);
 }
 
+static TCGv eip_cur_tl(DisasContext *s)
+{
+    return tcg_constant_tl(s->base.pc_next - s->cs_base);
+}
+
 /* Compute SEG:REG into A0.  SEG is selected from the override segment
    (OVR_SEG) and the default segment (DEF_SEG).  OVR_SEG may be -1 to
    indicate no override.  */
@@ -6617,7 +6622,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                                offsetof(CPUX86State, segs[R_CS].selector));
                 tcg_gen_st16_i32(s->tmp2_i32, cpu_env,
                                  offsetof(CPUX86State, fpcs));
-                tcg_gen_st_tl(tcg_constant_tl(s->base.pc_next - s->cs_base),
+                tcg_gen_st_tl(eip_cur_tl(s),
                               cpu_env, offsetof(CPUX86State, fpip));
             }
         }
-- 
2.37.3


