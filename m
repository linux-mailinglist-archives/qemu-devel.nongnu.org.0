Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648161AF179
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Apr 2020 17:10:57 +0200 (CEST)
Received: from localhost ([::1]:58680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jPp7Q-0006d8-Ge
	for lists+qemu-devel@lfdr.de; Sat, 18 Apr 2020 11:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36895)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jPp19-0007Bs-Jq
 for qemu-devel@nongnu.org; Sat, 18 Apr 2020 11:04:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jPp18-0003gM-HD
 for qemu-devel@nongnu.org; Sat, 18 Apr 2020 11:04:27 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:50705)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jPp18-0003am-BX
 for qemu-devel@nongnu.org; Sat, 18 Apr 2020 11:04:26 -0400
Received: by mail-pj1-x1036.google.com with SMTP id t9so341391pjw.0
 for <qemu-devel@nongnu.org>; Sat, 18 Apr 2020 08:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zg6kmbV/F10qD8ScMZSnJyiRBl2OgcABfr1ZRnLbG9o=;
 b=zeLf60bF53jO7zHQIwcT/TTO5d7OXtDPeOyANNcBBPeM/DwRitPOG05u1VdhuSub7S
 c1FFC3yzt8Ktm4n+u/ayzV21vj3eq/EVQASsBOoYzEBDXQOKiP+i+eehFMyb16MG4dss
 oPd2NOHdz0bMTP8FPqpUJbbeJV27q6C5WLARZW1u1TJX8sl/T30EHyvlV4Vmj7bcWFZa
 IpNvpqTR9G4l+KlZA+0qhJOtuq1k7gjNTib40vG8EH2dOFR6KLgpuXBUWTGWwgAQxxLz
 EfWggHDBOpNlNdz1w4f1OCRB/q+9skcdi7c2arYGQD7d9zHUyWE+vBrE+tfTT3FF7FLe
 5hig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zg6kmbV/F10qD8ScMZSnJyiRBl2OgcABfr1ZRnLbG9o=;
 b=PsoOWHT3UPin6XR+SmSOk5ib46v2Dzt9nGIZvTuU1h6zqyHZdgc/+FNh9eIGHcsrM+
 tn5N61iEDEXgpq1vNibT6vSSKQLuHeUiTQ7p9JHro5gzhPxUTRKVfHGyKVUM+BJHZlKP
 HGR/tq1W6ZNKjcfGu3Piw2IAZKkLWKcdBeujdZPiRzt0bd3T7CFxdpbtYGOr+hcpNFdP
 dOfFLXZci46HRzdM2GbVORJa7PprUq+XL83avhvlhTvA7TiQotTnEQdRyDhuoGklPQSt
 TkxvYf0RaOhNzX2AgL32ad4itMoIGzY12LeMs0PD3UNNoYcAdQOWqnnCIHNwHtzFtK7o
 zXiw==
X-Gm-Message-State: AGi0PuaB0H1q6CNG+QGUQoi/9JvZqEmHIhlheNcOO+wDsaLMd8tVI4u9
 dESFpqcaycCQHFLTJwvsJyrcl9wtuz0=
X-Google-Smtp-Source: APiQypLzn+ToV7yeEmxlo+4D6XaHWfuH5DWEycsjzJERrv+n2iZ6dBkoXA+1zevHtmbLV/GOY+8xhg==
X-Received: by 2002:a17:90a:c401:: with SMTP id
 i1mr10561169pjt.131.1587222264775; 
 Sat, 18 Apr 2020 08:04:24 -0700 (PDT)
Received: from localhost.localdomain (174-21-149-226.tukw.qwest.net.
 [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id t103sm8668601pjb.46.2020.04.18.08.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 08:04:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] tcg: Add tcg_gen_gvec_dup_tl
Date: Sat, 18 Apr 2020 08:04:11 -0700
Message-Id: <20200418150411.1831-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200418150411.1831-1-richard.henderson@linaro.org>
References: <20200418150411.1831-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1036
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
Cc: peter.maydell@linaro.org, david@redhat.com, zhiwei_liu@c-sky.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For use when a target needs to pass a configure-specific
target_ulong value to duplicate.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op-gvec.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/tcg/tcg-op-gvec.h b/include/tcg/tcg-op-gvec.h
index fa8a0c8d03..d89f91f40e 100644
--- a/include/tcg/tcg-op-gvec.h
+++ b/include/tcg/tcg-op-gvec.h
@@ -320,6 +320,12 @@ void tcg_gen_gvec_dup_i32(unsigned vece, uint32_t dofs, uint32_t s,
 void tcg_gen_gvec_dup_i64(unsigned vece, uint32_t dofs, uint32_t s,
                           uint32_t m, TCGv_i64);
 
+#if TARGET_LONG_BITS == 64
+# define tcg_gen_gvec_dup_tl  tcg_gen_gvec_dup_i64
+#else
+# define tcg_gen_gvec_dup_tl  tcg_gen_gvec_dup_i32
+#endif
+
 void tcg_gen_gvec_shli(unsigned vece, uint32_t dofs, uint32_t aofs,
                        int64_t shift, uint32_t oprsz, uint32_t maxsz);
 void tcg_gen_gvec_shri(unsigned vece, uint32_t dofs, uint32_t aofs,
-- 
2.20.1


