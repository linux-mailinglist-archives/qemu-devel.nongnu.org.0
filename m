Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEC139AD0B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 23:43:15 +0200 (CEST)
Received: from localhost ([::1]:48974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lov7Q-0004ec-GF
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 17:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov5s-0001vt-Nh
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:36 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:43697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov5q-0000zT-Ni
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:36 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 l10-20020a17090a150ab0290162974722f2so4698150pja.2
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 14:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SWxT0DtcgFbLT5kNxBIJn0TGP/3pLZlrheQnk47W0Tg=;
 b=DK6LGDqdXMrBOe86+QJKSBbseoE9jLV6HoSCX1qLmobCzyD1fyZuPwN4uZcvWc5NGd
 DhZMAAfpHEn1QDmrosiahSl0CJDcWfj/pRNP7l1vCtMfO5WvPcoBhihUWtCHeU2OnWZE
 5ngca65Jz9T2hxZ+oYCnEuR0bDaIKHmLrBzxDd6Br2xBlZ64zdiRBXVuRiX5jRB7D0qS
 MuCj7JE/UUV8HAmOHbrxN3yort7yHQOIx1ZWTto5rEwbjkCC5ZaYI5BzMXXlR1mDZiV0
 DjMVpmtcQrazHViNEgU74bLe8HDTw0tIg4T8OA55AkPO8fg8F11eERfqPokll0SX4xmi
 O+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SWxT0DtcgFbLT5kNxBIJn0TGP/3pLZlrheQnk47W0Tg=;
 b=iCSFeSc1oUt/vHb4f5l1mkRxvYX816kEMVWv8ZDeF9iuMTKmRbmVSDpTRXNxT0MbXT
 M8Pr00joKSYDdoF0knCewA4NVK6/IQPPmKH2UJsWOb1+wz90ZwmlBGjP2dMwfI8NvdeW
 SuiS6v1jQkwNK7OL78VbOPtjWBa86DHxobChlokGx0L0wwDmKZ7aqSYNsf90TRhiMhJD
 r3AeVYhy/7N88asNXNyLgBah49pYLC+PgszDYdNRlQtL98FaVyK9VJW3i8wITv31P3qB
 FAbtXf9CUVDy2U0+Kp0ZImjS482qb2Tjw20knWigUb4WFpMvR9lCrQcVguViEGhzkzlP
 iT9w==
X-Gm-Message-State: AOAM533VkmeYrzpdsJ/FWKzX04KypcHavyIhHt0BC4aDKaaxwPVn7gqs
 UDQqFw+QBQ/LS4GYQ4ouHOuuQYYFVYU45A==
X-Google-Smtp-Source: ABdhPJwFf70gxHhNaYea5tFvB0WP2FCQkV8IP5c4B0tLMpI6Tr9dc3hOjf3OTyFwUVb2URgI9kXfSA==
X-Received: by 2002:a17:902:720c:b029:ee:f427:91e9 with SMTP id
 ba12-20020a170902720cb02900eef42791e9mr1198368plb.72.1622756492877; 
 Thu, 03 Jun 2021 14:41:32 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id p65sm40115pfb.62.2021.06.03.14.41.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:41:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/29] softfloat patch queue
Date: Thu,  3 Jun 2021 14:41:02 -0700
Message-Id: <20210603214131.629841-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

The following changes since commit 453d9c61dd5681159051c6e4d07e7b2633de2e70:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210603' into staging (2021-06-03 16:59:46 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-fpu-20210603

for you to fetch changes up to 5d0204b82ade0ea0630d6add894954135ee54ab1:

  softfloat: Use hard-float for {u}int64_to_float{32,64} (2021-06-03 14:09:03 -0700)

----------------------------------------------------------------
Finish conversion of float128 and floatx80 to FloatParts.
Implement float128_muladd and float128_{min,max}*.
Optimize int-to-float conversion with hard-float.

----------------------------------------------------------------
Alex Bennée (1):
      tests/fp: Enable more tests

David Hildenbrand (1):
      softfloat: Implement float128_(min|minnum|minnummag|max|maxnum|maxnummag)

Richard Henderson (27):
      softfloat: Move round_to_uint_and_pack to softfloat-parts.c.inc
      softfloat: Move int_to_float to softfloat-parts.c.inc
      softfloat: Move uint_to_float to softfloat-parts.c.inc
      softfloat: Move minmax_flags to softfloat-parts.c.inc
      softfloat: Move compare_floats to softfloat-parts.c.inc
      softfloat: Move scalbn_decomposed to softfloat-parts.c.inc
      softfloat: Move sqrt_float to softfloat-parts.c.inc
      softfloat: Split out parts_uncanon_normal
      softfloat: Reduce FloatFmt
      softfloat: Introduce Floatx80RoundPrec
      softfloat: Adjust parts_uncanon_normal for floatx80
      tests/fp/fp-test: Reverse order of floatx80 precision tests
      softfloat: Convert floatx80_add/sub to FloatParts
      softfloat: Convert floatx80_mul to FloatParts
      softfloat: Convert floatx80_div to FloatParts
      softfloat: Convert floatx80_sqrt to FloatParts
      softfloat: Convert floatx80_round to FloatParts
      softfloat: Convert floatx80_round_to_int to FloatParts
      softfloat: Convert integer to floatx80 to FloatParts
      softfloat: Convert floatx80 float conversions to FloatParts
      softfloat: Convert floatx80 to integer to FloatParts
      softfloat: Convert floatx80_scalbn to FloatParts
      softfloat: Convert floatx80 compare to FloatParts
      softfloat: Convert float32_exp2 to FloatParts
      softfloat: Move floatN_log2 to softfloat-parts.c.inc
      softfloat: Convert modrem operations to FloatParts
      softfloat: Use hard-float for {u}int64_to_float{32,64}

 include/fpu/softfloat-helpers.h |    5 +-
 include/fpu/softfloat-macros.h  |   34 +
 include/fpu/softfloat-types.h   |   10 +-
 include/fpu/softfloat.h         |   10 +-
 fpu/softfloat.c                 | 4429 ++++++++++-----------------------------
 linux-user/arm/nwfpe/fpa11.c    |   41 +-
 target/i386/tcg/fpu_helper.c    |   79 +-
 target/m68k/fpu_helper.c        |   50 +-
 target/m68k/softfloat.c         |   90 +-
 tests/fp/fp-test-log2.c         |  118 ++
 tests/fp/fp-test.c              |    9 +-
 fpu/softfloat-parts.c.inc       |  903 +++++++-
 fpu/softfloat-specialize.c.inc  |  340 ---
 tests/fp/wrap.c.inc             |    2 +-
 tests/fp/meson.build            |   27 +-
 15 files changed, 2249 insertions(+), 3898 deletions(-)
 create mode 100644 tests/fp/fp-test-log2.c

