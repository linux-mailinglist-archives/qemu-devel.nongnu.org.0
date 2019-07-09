Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9DB6326B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 09:52:58 +0200 (CEST)
Received: from localhost ([::1]:47578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkkvp-00072c-CB
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 03:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52130)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hkktx-0005je-6b
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 03:51:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hkktw-0000zZ-4u
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 03:51:01 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:37111)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hkktv-0000sv-TV
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 03:51:00 -0400
Received: by mail-pl1-x62c.google.com with SMTP id b3so6344615plr.4
 for <qemu-devel@nongnu.org>; Tue, 09 Jul 2019 00:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=t5El953k6NH1n+xV8lDwymmaxDXjTJBkzNI+f57sIwE=;
 b=DCZtEeXrk5Bhd+8grwE5WkniMgAUoyAEiYXii5okPmBf4WOk/qPLhdZCtpS+M6Y/nx
 2C6synfxh3aFFNcz3Ih9l2iioyNrTxXnz84KxRytwA5fwDVLq/IesebObeDsMZtfo7OH
 8EXsvjPf65tvrBSvtJix73h6vsTPzERKe0LNcKPUaZHJfECJ413zxonZqlaK2lQbB+hy
 qE7RdlUVf9rYeH5RXMpSMXEjFzRJcfwnVCc+Ufv8DdEtj2SAOeW53tQ+T7ZwoqMbEai7
 zxfGDWUPI4KN8B67oqFZZLqGynNXrkKzOgns1P6Ri3YsH13VBRUtW1+ntnkTrFsLc5ur
 j1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=t5El953k6NH1n+xV8lDwymmaxDXjTJBkzNI+f57sIwE=;
 b=q0VAuNbQl18+fffQYecYcTHpmfrTCu0KtoL67N+2rKyylBFwqH5l8FGWoPOCXhweJq
 GJbdlpP9VWoA9sRx0SbD3CL6wl/7+/x42seiHtEMZq3qi7vReXgQcLrhj6S6S98ZATeq
 YD6NzdvKHbnPG5PhixiVCPd/M9hNEbRA17q2NqTXxdk1sMklcYtYnwSCpf0/WUIb312l
 NgDfGUSqG2s0rFAXOr8y9GFzZld1KZnbQbhMGc4RqLJsbHf5aXUtoa5LYGFfiSBBw9C8
 Dn1ToBpLgmG2TgtirwYtOUrbJwhtSvp3sdOKIZoORqbJFz60ki15R3LDpm/QKgH1dUVQ
 ZfIw==
X-Gm-Message-State: APjAAAUpKSZqJ6vW9FcyWX2Bzgu+Q9f1UR2V85e5sTajLWK3LZ9eJqIE
 NQRTWgnIy4DDepeuNFNesUOaYOhE3aRVLg==
X-Google-Smtp-Source: APXvYqzhPW8aF08AuDjbE+vQ1F7Ui759j7Di+2i2BxK4u/ZS6531epX9lf28MdLYTia/l/IUvebk7g==
X-Received: by 2002:a17:902:1e9:: with SMTP id
 b96mr30571700plb.277.1562658653175; 
 Tue, 09 Jul 2019 00:50:53 -0700 (PDT)
Received: from localhost.localdomain ([172.56.12.212])
 by smtp.gmail.com with ESMTPSA id y22sm28237375pfo.39.2019.07.09.00.50.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 00:50:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  9 Jul 2019 09:50:37 +0200
Message-Id: <20190709075042.13941-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::62c
Subject: [Qemu-devel] [PULL v2 for-4.1 0/2] tcg patch queue
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For v2, drop the PAGE_EXEC patch that appeared to cause
problems during Peter's testing.


r~


The following changes since commit f34edbc760b0f689deddd175fc08732ecb46665f:

  Merge remote-tracking branch 'remotes/stefanberger/tags/pull-tpm-2019-07-08-1' into staging (2019-07-08 17:40:05 +0100)

are available in the Git repository at:

  https://github.com/rth7680/qemu.git tags/pull-tcg-20190709

for you to fetch changes up to 11978f6f58f1d3d66429f7ff897524f693d823ce:

  tcg: Fix expansion of INDEX_op_not_vec (2019-07-09 08:26:11 +0200)

----------------------------------------------------------------
Minor gvec fix for as-yet uncommitted altivec host.
Build fix for riscv host.

----------------------------------------------------------------
Alistair Francis (1):
      tcg/riscv: Fix RISC-VH host build failure

Richard Henderson (1):
      tcg: Fix expansion of INDEX_op_not_vec

 tcg/riscv/tcg-target.inc.c | 4 ++--
 tcg/tcg-op-vec.c           | 6 ++++++
 2 files changed, 8 insertions(+), 2 deletions(-)

