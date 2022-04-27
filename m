Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E79511C92
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 19:24:12 +0200 (CEST)
Received: from localhost ([::1]:40244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njlOd-0000VB-KM
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 13:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1njlMS-00062l-Ko
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 13:21:57 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:33378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1njlMP-00017M-9I
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 13:21:55 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 cu23-20020a17090afa9700b001d98d8e53b7so4387687pjb.0
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 10:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oEt8U42xdPhWb2FD7L7xBeJcGoO3HF2gspFUvfdvzKY=;
 b=fsWggRQRQhaN7XwT2M6NqzOgmC/0+j7q2xTlOohKFCFRF+0paB12Z5KxhNKSD3OrfT
 VgFWvtHIeoutrxt2T5QiLeQ3OWovAv935Wp/WxZ1Pnb07FZ8TvG2Ym/Cx1YI1KMtrafd
 BOFxntyLlcQlV78f/4pyBKSQ2csx9x1aCIkmjcqTdzrzxpI0oLclS2MwrWZh4CBQBmVA
 p1NfWQmZsqfIjl2x2UJ6JogAnKPOQjmqA8wsIsfNYVhEMQKR99laEsV7+Ajv4OlcTqxC
 EDWqknh+ifbzIR4GtaUXmcHuUCQvg9u+woCHTA8L3MgAKszRcdQaxWy+CynPfXGna5CZ
 5WjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oEt8U42xdPhWb2FD7L7xBeJcGoO3HF2gspFUvfdvzKY=;
 b=Wfg4jvQz/XdXWOq2SJaSPvxPOaqc8YsSLs6KAHMLdw22X1H2Svnr8Z2KDbA4mhHEbL
 gp5PzZoYDtSILe9KF6WNSerTkqK/z1/hr/a0rpmqjUF2xc+PSOqz3jBOEVSG/uHwzchT
 vjbDT5qbGIdpYAdsISSq7OGUbwbBIdmScC1WAgPQ7RR7hlcn2YlQ6PMWCcjrsdtVKi0y
 uEnoYSHMuEfpt3PoVabwusJRvjdbxrO9sXrobaULK5tENMtm9HOrhJTQCJIVrOIKaw0E
 d6t10Hppe5yRfZe9zeQL1n5FpjTCMfIwitUP+M3RST7B29ooEHh9owg5nNhPKirIyvCj
 f5fA==
X-Gm-Message-State: AOAM531reCd95ramjj6SMqamzLAKfGPom2YAglNQIyWEhrmz5MYwiDZY
 a7Hq4u76Rx0ycGONF/PlVJxpCGZLLIs=
X-Google-Smtp-Source: ABdhPJy0ZnaZOJuFdl12a0KYvMwzikkSL/coG4j55pe8HDuiVG87HwBnlMZuKLXGbgSMenSFsbW+Vg==
X-Received: by 2002:a17:90a:ea18:b0:1da:4630:513d with SMTP id
 w24-20020a17090aea1800b001da4630513dmr3258197pjy.237.1651080111087; 
 Wed, 27 Apr 2022 10:21:51 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:76e8:b785:3fb9:b6d6])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a056a00239000b004fa7103e13csm21202124pfc.41.2022.04.27.10.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 10:21:50 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] tests/tcg/xtensa: test fixes and improvements
Date: Wed, 27 Apr 2022 10:21:33 -0700
Message-Id: <20220427172140.1406059-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

this series fixes xtensa TCG tests so that they could be built on cores
with reduced configurations (e.g. missing windowed registers, no loop
option, single data watchpoint register) and expands test coverage to
configurations not supported earlier (e.g. MMUv3, timers at high IRQ
levels).

Max Filippov (7):
  tests/tcg/xtensa: fix build for cores without windowed registers
  tests/tcg/xtensa: restore vecbase SR after test
  tests/tcg/xtensa: fix watchpoint test
  tests/tcg/xtensa: remove dependency on the loop option
  tests/tcg/xtensa: enable autorefill phys_mem tests for MMUv3
  tests/tcg/xtensa: enable mmu tests for MMUv3
  tests/tcg/xtensa: fix vectors and checks in timer test

 tests/tcg/xtensa/crt.S           |   2 +
 tests/tcg/xtensa/test_break.S    |  86 ++++++++-------
 tests/tcg/xtensa/test_mmu.S      | 182 +++++++++++++++++--------------
 tests/tcg/xtensa/test_phys_mem.S |  10 +-
 tests/tcg/xtensa/test_sr.S       |   2 +
 tests/tcg/xtensa/test_timer.S    |  68 +++++++++---
 6 files changed, 213 insertions(+), 137 deletions(-)

-- 
2.30.2


