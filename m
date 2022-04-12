Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C3C4FDCE7
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 13:07:16 +0200 (CEST)
Received: from localhost ([::1]:42072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neEMd-0000uR-7H
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 07:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1neEGt-0007iw-1G
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 07:01:19 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1neEGj-00042S-Ek
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 07:01:18 -0400
Received: by mail-wr1-x434.google.com with SMTP id u3so27176580wrg.3
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 04:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZMVXcyBhQ3fOCB18YZV7ZqOwoRtv4k/rTjqMPh4caqA=;
 b=YHRDp+kUhp1H20xKbu9mMWCScacLOhv8t2v8KRio1m6LetmW4hz6mNjkiFg8ulYMdG
 Py0VC/V7a51g+YsIZKvuGL/kYKSF3QfW47de/LgxWZuG0uTLXa1DcXTBFYmX29RxhbGc
 VvSMVI8EneNfcCCedIZ9BmPj9Pp70/1f+PKkBaVrrykxGJVmDey8A9sgQlM+C7Xvfe28
 YpLLzEKG0i9t1VoJ1i+D8xI8StyZjJ5uFf/zMv9SQ7mtJcogwm1p0B+0WjWB4VDzuwsX
 2nJ5ykORFJdels5Z9AYh8Z2Z7GpAQTEDZlvUWRzXfWNDq5Tx7joT49rLAV0pwMd8cIgH
 6mpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZMVXcyBhQ3fOCB18YZV7ZqOwoRtv4k/rTjqMPh4caqA=;
 b=xpK15QgYYDV9lFthaA3z1ln3QSAKqvYVw+GzEOFlhESGmuhHJ3a0izpsir8eikdwn2
 c0McI8SuRcKlwhlYgT7u2ABTNonxeoSn++n92jDMg7AGtks3ST6fLnR2VcGp4Aeb6GhJ
 r4Lc4f7pM4FuVyUkqWC/dZXoG5GuKV2NgMbd2UJcVu6YpY2ikcJr/22FyT7nkshXjKqg
 T1hIBNe+cuej1Aw6IpkD+dvOLdrJuWft92t4d0mspd/nr+MKHG20//fXMeoVSbeaE06+
 LOJ4w32o/NEvgL+4lOmIRsBk8VhFjWBXm0sshhQvZSN4XdldFKgofwkf5tO6AASJtlPD
 e+gQ==
X-Gm-Message-State: AOAM530Zx+1WzU9nnQsjoTAD1CbSu1jt8tKEnoFPBcuYkVPdW9Sr+zff
 4/WlYfJBybIAuUHdKc6dravwquiLJ75r8Q==
X-Google-Smtp-Source: ABdhPJw/MgrGfstmH/119Iasqq7jmY2ZHTXFrsgYhiivuoIZzlDPCIfBiE+158tCppaLtcSX1oNNEA==
X-Received: by 2002:a05:6000:178f:b0:207:a6d7:81b5 with SMTP id
 e15-20020a056000178f00b00207a6d781b5mr7448800wrg.322.1649761250377; 
 Tue, 12 Apr 2022 04:00:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a05600c4e4d00b0038e44e316c1sm2057058wmq.6.2022.04.12.04.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 04:00:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1] target/i386: Remove unused XMMReg,
 YMMReg types and CPUState fields
Date: Tue, 12 Apr 2022 12:00:47 +0100
Message-Id: <20220412110047.1497190-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit b7711471f5 in 2014 we refactored the handling of the x86
vector registers so that instead of separate structs XMMReg, YMMReg
and ZMMReg for representing the 16-byte, 32-byte and 64-byte width
vector registers and multiple fields in the CPU state, we have a
single type (XMMReg, later renamed to ZMMReg) and a single struct
field (xmm_regs).  However, in 2017 in commit c97d6d2cdf97ed some of
the old struct types and CPU state fields got added back, when we
merged in the hvf support (which had developed in a separate fork
that had presumably not had the refactoring of b7711471f5), as part
of code handling xsave.  Commit f585195ec07 then almost immediately
dropped that xsave code again in favour of sharing the xsave handling
with KVM, but forgot to remove the now unused CPU state fields and
struct types.

Delete the unused types and CPUState fields.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/i386/cpu.h | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 982c5323537..77b4f5696cf 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1217,20 +1217,6 @@ typedef struct SegmentCache {
         float64  _d_##n[(bits)/64]; \
     }
 
-typedef union {
-    uint8_t _b[16];
-    uint16_t _w[8];
-    uint32_t _l[4];
-    uint64_t _q[2];
-} XMMReg;
-
-typedef union {
-    uint8_t _b[32];
-    uint16_t _w[16];
-    uint32_t _l[8];
-    uint64_t _q[4];
-} YMMReg;
-
 typedef MMREG_UNION(ZMMReg, 512) ZMMReg;
 typedef MMREG_UNION(MMXReg, 64)  MMXReg;
 
@@ -1529,11 +1515,7 @@ typedef struct CPUArchState {
     ZMMReg xmm_t0;
     MMXReg mmx_t0;
 
-    XMMReg ymmh_regs[CPU_NB_REGS];
-
     uint64_t opmask_regs[NB_OPMASK_REGS];
-    YMMReg zmmh_regs[CPU_NB_REGS];
-    ZMMReg hi16_zmm_regs[CPU_NB_REGS];
 #ifdef TARGET_X86_64
     uint8_t xtilecfg[64];
     uint8_t xtiledata[8192];
-- 
2.25.1


