Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6C3981CB
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 19:53:28 +0200 (CEST)
Received: from localhost ([::1]:51372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0UnX-0005RF-0W
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 13:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40802)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jan.bobek@gmail.com>) id 1i0UR5-0000n9-RX
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:30:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1i0UR4-00079i-3W
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:30:15 -0400
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43]:45838)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1i0UR3-00079E-V1
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:30:14 -0400
Received: by mail-yw1-xc43.google.com with SMTP id n69so1221943ywd.12
 for <qemu-devel@nongnu.org>; Wed, 21 Aug 2019 10:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6m0yt4X0AzcKuAyXkMVUD4QHQI5bggYWOuwLDi6hZRQ=;
 b=K4fFfMIfXRKqmaeUnwEA3CzZjJOLx4j5pscs92ToMNf1VxANB9gHzwyfxiIuEB1JHG
 iiKnDHbTOtsxmaJvpgU4/RmAnzWm/nOhtBhWCW/92YFTjxiLXd0Gx/BPvQ+4+HhwC/KE
 LZoFVT095BA3LPjdO4TRnXGtEG9n3yFtvTGFF8eGKI4yWf6unqLmCnjeW0Jvj7rTdBXC
 Jmy35EJvcpInEWAuBmRClb0OXmHDUaKIu06o8GGwa8fy+eYF1HFrX75IxSg4VeqmwsTp
 n1Xl5CoIBUkIhcYnL1T7z/87es/jgh+fCTYXKcM6bZN00RybOT8jrkxUwQDTuDKGpORN
 eSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6m0yt4X0AzcKuAyXkMVUD4QHQI5bggYWOuwLDi6hZRQ=;
 b=hv+t8DB2a5EeEL5DeirCEgtAKM+bRA5f5UFjmvl/OxxqEfT0Pi7nVtrJ/tIe1AhSNE
 jZ6+shVH8Rg+lf+fn9a01t3JmG50/Un5kjbqR1+AacjcMKthyB1NTlYB+IEhESKUJPtI
 jfIQ6AhvueG5nugQOtph6B21RmVDFbG9/+YWLCUkLp0LLavLL5K9f4DOXqKy4wph6U+1
 +t5vzxwCxf4NPm8nO7N6bT3aDMyRgZvFr/+GzLQm9CzJY3cnh9hmLMa0NZAR9mRd2VpO
 qL/YP6dBsyVJ01PsQyIixMikf5UOTpMql6qzsRmreqlMVWpplUhYNsXXNcXjruFJZ0km
 u9ag==
X-Gm-Message-State: APjAAAVQNgnIPRyf9kCZXQeMjyC0nbR+/IY0mi0HEB/6O24TnbScXur2
 avSZWAWIvCLBc8F9g+twUY6SEBmN
X-Google-Smtp-Source: APXvYqwq78d7GpFsKOUDO96LYUBVf1XA2696hF0vYegfYZLM8jFznG33gSzekwjMLoARpqN4L1GSzg==
X-Received: by 2002:a81:6b54:: with SMTP id g81mr21944181ywc.283.1566408613101; 
 Wed, 21 Aug 2019 10:30:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:c0:c67f:e390::3])
 by smtp.gmail.com with ESMTPSA id l71sm2826167ywl.39.2019.08.21.10.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 10:30:12 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 21 Aug 2019 13:28:48 -0400
Message-Id: <20190821172951.15333-13-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821172951.15333-1-jan.bobek@gmail.com>
References: <20190821172951.15333-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c43
Subject: [Qemu-devel] [RFC PATCH v4 12/75] target/i386: introduce CASES_*
 macros in gen_sse_ng
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
Cc: Jan Bobek <jan.bobek@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In case one or more fields should be ignored during instruction
disambiguation, we need to generate multiple case labels. Introduce
CASES_* macros for this purpose.

Signed-off-by: Jan Bobek <jan.bobek@gmail.com>
---
 target/i386/translate.c | 54 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index 8045ce3ce0..661010973b 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -4513,10 +4513,64 @@ static void gen_sse_ng(CPUX86State *env, DisasContext *s, int b)
     while (1) {
         switch (p | m | w | op) {
 
+#define CASES_0(e)         case (e):
+#define CASES_1(e, A, ...) CASES_ ## A(e, 0, ## __VA_ARGS__)
+#define CASES_2(e, A, ...) CASES_ ## A(e, 1, ## __VA_ARGS__)
+#define CASES_3(e, A, ...) CASES_ ## A(e, 2, ## __VA_ARGS__)
+#define CASES_4(e, A, ...) CASES_ ## A(e, 3, ## __VA_ARGS__)
+#define CASES(e, N, ...)   CASES_ ## N(e, ## __VA_ARGS__)
+
+#define CASES_P(e, N, p, ...) CASES_P ## p(e, N, ## __VA_ARGS__)
+#define CASES_PNP(e, N, ...)  CASES_ ## N(P_NP | e, ## __VA_ARGS__)
+#define CASES_P66(e, N, ...)  CASES_ ## N(P_66 | e, ## __VA_ARGS__)
+#define CASES_PF3(e, N, ...)  CASES_ ## N(P_F3 | e, ## __VA_ARGS__)
+#define CASES_PF2(e, N, ...)  CASES_ ## N(P_F2 | e, ## __VA_ARGS__)
+#define CASES_PIG(e, N, ...)  CASES_PNP(e, N, ## __VA_ARGS__)   \
+                              CASES_P66(e, N, ## __VA_ARGS__)   \
+                              CASES_PF3(e, N, ## __VA_ARGS__)   \
+                              CASES_PF2(e, N, ## __VA_ARGS__)
+
+#define CASES_M(e, N, m, ...) CASES_ ## N(M_ ## m | e, ## __VA_ARGS__)
+
+#define CASES_W(e, N, w, ...) CASES_W ## w(e, N, ## __VA_ARGS__)
+#define CASES_W0(e, N, ...)   CASES_ ## N(W_0 | e, ## __VA_ARGS__)
+#define CASES_W1(e, N, ...)   CASES_ ## N(W_1 | e, ## __VA_ARGS__)
+#define CASES_WIG(e, N, ...)  CASES_W0(e, N, ## __VA_ARGS__)    \
+                              CASES_W1(e, N, ## __VA_ARGS__)
+
+#define CASES_VEX_L(e, N, l, ...) CASES_VEX_L ## l(e, N, ## __VA_ARGS__)
+#define CASES_VEX_L128(e, N, ...) CASES_ ## N(VEX_128 | e, ## __VA_ARGS__)
+#define CASES_VEX_L256(e, N, ...) CASES_ ## N(VEX_256 | e, ## __VA_ARGS__)
+#define CASES_VEX_LZ              CASES_VEX_L128
+#define CASES_VEX_LIG(e, N, ...)  CASES_VEX_L128(e, N, ## __VA_ARGS__)  \
+                                  CASES_VEX_L256(e, N, ## __VA_ARGS__)
+
         default: {
             gen_sse(env, s, b);
         } return;
 
+#undef CASES_0
+#undef CASES_1
+#undef CASES_2
+#undef CASES_3
+#undef CASES_4
+#undef CASES
+#undef CASES_P
+#undef CASES_PNP
+#undef CASES_P66
+#undef CASES_PF3
+#undef CASES_PF2
+#undef CASES_PIG
+#undef CASES_M
+#undef CASES_W
+#undef CASES_W0
+#undef CASES_W1
+#undef CASES_WIG
+#undef CASES_VEX_L
+#undef CASES_VEX_L128
+#undef CASES_VEX_L256
+#undef CASES_VEX_LZ
+#undef CASES_VEX_LIG
         }
     }
 }
-- 
2.20.1


