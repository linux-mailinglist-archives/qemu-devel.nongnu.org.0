Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C01322F8730
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 22:08:17 +0100 (CET)
Received: from localhost ([::1]:46074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0WKO-0005TN-JZ
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 16:08:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0WHK-0003he-Qu
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:05:08 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:52829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0WHH-0004An-Gn
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:05:06 -0500
Received: by mail-pj1-x1032.google.com with SMTP id v1so5766031pjr.2
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 13:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kjjQszMfh2sEmOFcMw1xvM4LroNbp0XKPeRj6OGMI60=;
 b=yNWBNFo4UZFPapUPebYIpVdy17eU615qChbpxb5bwXNKvbOn1eC1hDEqDS1TLxpyG4
 0OHJZNh3xvM0lMq+AwnOjT8RWA3uh+PRXvExgpKE9JIvfU3X3nbLdpsdBMmreiwBSFKW
 HnbWwHlHww6WkFEuC7eOYMvshN2QWD+8I/IiuPfQYqr/nMdGi7KPbaFNZYDIVv3pkJ16
 683XZFNLaCmjNbQEnpx+ERybvKJvnFBG/mLj29irW5JnEYaaK4rAQkocXPs7vcg+CnHM
 9+UJV7h3YiAgoU+v6q6Zid73ma2rmLr2ADCBzfgMJfPZ/pc1ZWf+w5QWGF9X0krwz3cP
 y5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kjjQszMfh2sEmOFcMw1xvM4LroNbp0XKPeRj6OGMI60=;
 b=NOObv1TbtUgVQGZgDVs+5Ju/ATUN8AfRfNoUzKaE1gV8K5BxaaDgmbw7rU3XTBSbyo
 B/asWKogp6CQxrYTkC852NO/lw/ObmZkvJ0WlgjU4rjc1FmEMEYYrGJN/7OlXcGRUvU8
 PRguYDeAvkjgrapXyCW7PcR6laDVu0jnLX9L/b+hT3XawOf3yEMrnFgY0busIU7vcl0j
 XEl5dSCuSI57CrYdP/wnWJYgyaJ9qMc95ArSvKhIam/uH9XB9LKg/H5irAYiKoqPtbX3
 pMRf5rvT2Cf+T3oow7Mg52hTw/LxUuwA2xuSPBbIQeb+uae8yradIQbitXqNsICJmuCs
 UVxQ==
X-Gm-Message-State: AOAM532P8ebfBAmMjjjf4hpt4ta3YKfVAeJ1nxXukKy1XYO9ZpeKsodn
 rodY2fPhQZtlrZWoL0ls+9oB2TMFU25+G0QZ
X-Google-Smtp-Source: ABdhPJyV826elkzzpBdl64ZfOIWm7GSvQZZWESRgkM7eRjoLI/xGvy6B7j0Pwxt534X7IxjOgquojw==
X-Received: by 2002:a17:90a:c306:: with SMTP id
 g6mr12899948pjt.104.1610744699629; 
 Fri, 15 Jan 2021 13:04:59 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id h15sm8920221pfo.71.2021.01.15.13.04.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 13:04:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/22] tcg: backend constraints cleanup
Date: Fri, 15 Jan 2021 11:04:34 -1000
Message-Id: <20210115210456.1053477-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This pulls out constraints to a couple of headers, which
reduces the boilerplate just a little.

I have a longer term goal, which this aids, in which I
move some of the startup-time debug-only validation into
build/compile-time validation.  But not yet.

Changes for v2:
  * Rename "conset" -> "con-str" and "constr" -> "con-str" (pmm).
  * Fix a bunch of comment spelling mistakes.
  * Add some macro usage comments.


r~


Richard Henderson (22):
  tcg/tci: Drop L and S constraints
  tcg/i386: Move constraint type check to tcg_target_const_match
  tcg/i386: Split out target constraints to tcg-target-con-str.h
  tcg/arm: Split out target constraints to tcg-target-con-str.h
  tcg/aarch64: Split out target constraints to tcg-target-con-str.h
  tcg/ppc: Split out target constraints to tcg-target-con-str.h
  tcg/tci: Split out target constraints to tcg-target-con-str.h
  tcg/mips: Split out target constraints to tcg-target-con-str.h
  tcg/riscv: Split out target constraints to tcg-target-con-str.h
  tcg/s390: Split out target constraints to tcg-target-con-str.h
  tcg/sparc: Split out target constraints to tcg-target-con-str.h
  tcg: Remove TCG_TARGET_CON_STR_H
  tcg/i386: Split out constraint sets to tcg-target-con-set.h
  tcg/aarch64: Split out constraint sets to tcg-target-con-set.h
  tcg/arm: Split out constraint sets to tcg-target-con-set.h
  tcg/mips: Split out constraint sets to tcg-target-con-set.h
  tcg/ppc: Split out constraint sets to tcg-target-con-set.h
  tcg/riscv: Split out constraint sets to tcg-target-con-set.h
  tcg/s390: Split out constraint sets to tcg-target-con-set.h
  tcg/sparc: Split out constraint sets to tcg-target-con-set.h
  tcg/tci: Split out constraint sets to tcg-target-con-set.h
  tcg: Remove TCG_TARGET_CON_SET_H

 tcg/aarch64/tcg-target-con-set.h |  36 ++++
 tcg/aarch64/tcg-target-con-str.h |  24 +++
 tcg/arm/tcg-target-con-set.h     |  35 +++
 tcg/arm/tcg-target-con-str.h     |  22 ++
 tcg/i386/tcg-target-con-set.h    |  54 +++++
 tcg/i386/tcg-target-con-str.h    |  33 +++
 tcg/mips/tcg-target-con-set.h    |  36 ++++
 tcg/mips/tcg-target-con-str.h    |  24 +++
 tcg/ppc/tcg-target-con-set.h     |  42 ++++
 tcg/ppc/tcg-target-con-str.h     |  30 +++
 tcg/riscv/tcg-target-con-set.h   |  30 +++
 tcg/riscv/tcg-target-con-str.h   |  21 ++
 tcg/s390/tcg-target-con-set.h    |  29 +++
 tcg/s390/tcg-target-con-str.h    |  23 ++
 tcg/sparc/tcg-target-con-set.h   |  32 +++
 tcg/sparc/tcg-target-con-str.h   |  22 ++
 tcg/sparc/tcg-target.h           |   4 -
 tcg/tci/tcg-target-con-set.h     |  25 +++
 tcg/tci/tcg-target-con-str.h     |  11 +
 tcg/tcg.c                        | 139 +++++++++++-
 tcg/aarch64/tcg-target.c.inc     | 137 ++++--------
 tcg/arm/tcg-target.c.inc         | 163 ++++----------
 tcg/i386/tcg-target.c.inc        | 317 +++++++++------------------
 tcg/mips/tcg-target.c.inc        | 168 ++++-----------
 tcg/ppc/tcg-target.c.inc         | 209 ++++++------------
 tcg/riscv/tcg-target.c.inc       | 133 +++---------
 tcg/s390/tcg-target.c.inc        | 161 +++++---------
 tcg/sparc/tcg-target.c.inc       | 120 +++--------
 tcg/tci/tcg-target.c.inc         | 359 +++++++++++--------------------
 29 files changed, 1190 insertions(+), 1249 deletions(-)
 create mode 100644 tcg/aarch64/tcg-target-con-set.h
 create mode 100644 tcg/aarch64/tcg-target-con-str.h
 create mode 100644 tcg/arm/tcg-target-con-set.h
 create mode 100644 tcg/arm/tcg-target-con-str.h
 create mode 100644 tcg/i386/tcg-target-con-set.h
 create mode 100644 tcg/i386/tcg-target-con-str.h
 create mode 100644 tcg/mips/tcg-target-con-set.h
 create mode 100644 tcg/mips/tcg-target-con-str.h
 create mode 100644 tcg/ppc/tcg-target-con-set.h
 create mode 100644 tcg/ppc/tcg-target-con-str.h
 create mode 100644 tcg/riscv/tcg-target-con-set.h
 create mode 100644 tcg/riscv/tcg-target-con-str.h
 create mode 100644 tcg/s390/tcg-target-con-set.h
 create mode 100644 tcg/s390/tcg-target-con-str.h
 create mode 100644 tcg/sparc/tcg-target-con-set.h
 create mode 100644 tcg/sparc/tcg-target-con-str.h
 create mode 100644 tcg/tci/tcg-target-con-set.h
 create mode 100644 tcg/tci/tcg-target-con-str.h

-- 
2.25.1


