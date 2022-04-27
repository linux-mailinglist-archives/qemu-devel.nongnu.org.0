Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB81C51103F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 06:42:27 +0200 (CEST)
Received: from localhost ([::1]:52222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njZVT-000435-1R
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 00:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njZSv-0001IB-AR
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 00:39:50 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:40935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njZSr-0007S8-C6
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 00:39:47 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 iq2-20020a17090afb4200b001d93cf33ae9so3969784pjb.5
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 21:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HW+naBqjZdn/GXJMPZXG6R8cx4JVBgAwhc3aQpkdKQE=;
 b=I3FWpPFPaMyQVNJrLO/9oLJ+f+fvjFHStlesRpI/PIsNnwR+WMG0gxlqEMmtm9TyMo
 cxcuUPmwBPG6lGT7DkYPiXkV59gEVj6lVyEG9slLbn045vI/o/tSBCd6lh/vSq213Fgd
 0iIvBc8hq4+9dAYkgD48yxdWP2goW+I1CsVBJODF5+2KWV1+vv04AirmQcLFl6iT1MKs
 lzZZdzNFILCtzTLFklfaYHmbdZeblycswbccwIdACc089zWnOTglgLedTQr3A72U0bb5
 pQJSVl7XzP+JA8EiikZzpLwM7/4qswEHhyFpOMhbZoQztKDMZ2TUEAtPS+TUdtMnKQ4v
 9PCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HW+naBqjZdn/GXJMPZXG6R8cx4JVBgAwhc3aQpkdKQE=;
 b=PjuPjt3bYq7QHFFawapqNidspLl6uxUrEVk5kLEBdqY8Y/LM9NRbG4qm6EzV/saOVM
 /+edn4udIDqjmC3A4ePh4OxWg5AERgq/VTYe9/AGD0BC+jAH8zgUXliCKYk0eCpHW/jD
 AeCMtuXCLWpyPxlRxcj21Lukz+60bFvR/tUFqfqN5zwwirSMKkqTIqBEnsatxCLD+QzA
 /Ck+5tpqva8g4pX0Djl7nBZBR4k7/2RUBpgzY9JRZVepBdMO3d7uvTv4I8hmEr3L+H47
 RkWUWO/iVgfMv4VEk9xiChjUj6pjQylTzbWtlIGAJ42MSbJcuivIo4piuucLWEAuj4QG
 cluQ==
X-Gm-Message-State: AOAM530x8nHdthLRVBHn2z7N8qNlul39ya7bKpYzhH33Y70YTmliiYsr
 TtdkNggJo129uAqT2L3LPUYVa+dogTpZbg==
X-Google-Smtp-Source: ABdhPJxku3Oz1idTo34hkPnpuc2yxu5eHeFIF+cN+tyz5j5woCKSCZbTZSjciOpc0iFUYDkygJS3aQ==
X-Received: by 2002:a17:902:c411:b0:15c:e82a:e854 with SMTP id
 k17-20020a170902c41100b0015ce82ae854mr19850280plk.18.1651034383644; 
 Tue, 26 Apr 2022 21:39:43 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 f16-20020aa78b10000000b0050a81508653sm16875632pfd.198.2022.04.26.21.39.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 21:39:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/6] Coverity patch queue
Date: Tue, 26 Apr 2022 21:39:36 -0700
Message-Id: <20220427043942.294654-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

The following changes since commit a72d9008092e39c2c37e47a91bae4e170d0f1b33:

  Merge tag 'pull-nbd-2022-04-26' of https://repo.or.cz/qemu/ericb into staging (2022-04-26 14:39:09 -0700)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20220426

for you to fetch changes up to dee3fcfbb399a0e4ccedbf737b5b0b7f56ecd398:

  softfloat: Use FloatRelation for fracN_cmp (2022-04-26 20:01:55 -0700)

----------------------------------------------------------------
Fix s390x ICMH cc computation.
Minor adjustments to satisfy Coverity.

----------------------------------------------------------------
Richard Henderson (6):
      accel/tcg: Assert mmu_idx in range before use in cputlb
      target/s390x: Fix the accumulation of ccm in op_icm
      target/i386: Suppress coverity warning on fsave/frstor
      softfloat: Fix declaration of partsN_compare
      softfloat: Use FloatRelation within partsN_compare
      softfloat: Use FloatRelation for fracN_cmp

 accel/tcg/cputlb.c           | 40 +++++++++++++++++++++++++++-------------
 fpu/softfloat.c              | 20 +++++++++++---------
 target/i386/tcg/fpu_helper.c |  4 ++--
 target/s390x/tcg/translate.c |  2 +-
 fpu/softfloat-parts.c.inc    | 11 +++++++----
 5 files changed, 48 insertions(+), 29 deletions(-)

