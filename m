Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A85F55090C0
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:51:59 +0200 (CEST)
Received: from localhost ([::1]:58090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGMo-0005O8-Oz
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhFoc-00011F-RZ
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:16:39 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhFoa-000395-Us
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:16:38 -0400
Received: by mail-pl1-x636.google.com with SMTP id 12so2651347pll.12
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 12:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mft5CWT43+ev3+d1gOPu3KwTgrtVEHVBcUSBazdoU78=;
 b=UysIYwtfY/rovPtEM9P2B5ICDpGpF0wczRCafbdi0GgvujIu/rbbZ7pMfCiqpPUAoj
 M/0J1mOS9hQQpy5Env6gFmiQayTXWOCLC2o06hOWUvUO0gByW0sVDAPWf57r9KuL/Q9K
 1EYNM1NBmjF/LMVcWOBR6m2eKDlbnRD730W9H7lcLIgGfvf7cWmp1BZMPZWgc+vyK0wC
 NY62R1ucBNVp7ZHTSeS53Ymxd376bLDNXsyEXjAb0prLWHNBqn/O2DWDoldafV78YFcb
 +T52f4F8avcfoPd6U47JD/VXCHiJO2H9g8O+GuLOVjs5mAeSnBu8iV9hKYzjQfkDY26t
 rleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mft5CWT43+ev3+d1gOPu3KwTgrtVEHVBcUSBazdoU78=;
 b=4CxQYWCnF0TZ1eHCoSc9+YKNKGbLLr53u7+mn82JkFQiUnIAYhqgHtJOaJ4ZKbj/WF
 07XOK4hi12u86xe8J6+u8mKMjns2jpvehxgE1zqu1kF0PBdMYsCg/ttoW3Ll7jPS5YFW
 zDPRA+ajUcKZ4cPfdX6nyzTgHG74QgEJZ8/Y4ebFzvEbNow/R0REZsGYVFkQqscuUXHb
 tJ7sUuB2nRDGVXd4TwRZ+kRe8ivZJVuyCY3U8MWyN1S48GamVLs8nSWZnxRrWQ6YQgTM
 tZY2a7rv0hrBYcRBEsVkVAbuhN90UoAE1heq4MQ+8m/ppH8dX17TnFLz4WDOcDc8v4d8
 +dDw==
X-Gm-Message-State: AOAM530ckg0ssbvOIg0foWyPiQhNIBy8+VRVpA3vzRMUZfKlt78U6kJf
 BDeMfaLi1T3WwziscZI0oG4D+9doX8ufaw==
X-Google-Smtp-Source: ABdhPJx54TOR6Y4/OjzFXQfzKkVbOCxWelI0UiNZHZ5r4kUZejks/+Of3Ynm2gSbpeN2un/Xgy9kWg==
X-Received: by 2002:a17:902:ce0a:b0:156:72e2:f191 with SMTP id
 k10-20020a170902ce0a00b0015672e2f191mr21163352plg.76.1650482195429; 
 Wed, 20 Apr 2022 12:16:35 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 n24-20020aa79058000000b0050612d0fe01sm20599200pfo.2.2022.04.20.12.16.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 12:16:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] tcg patch queue
Date: Wed, 20 Apr 2022 12:16:30 -0700
Message-Id: <20220420191634.1402437-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

The following changes since commit 2d20a57453f6a206938cbbf77bed0b378c806c1f:

  Merge tag 'pull-fixes-for-7.1-200422-1' of https://github.com/stsquad/qemu into staging (2022-04-20 11:13:08 -0700)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20220420

for you to fetch changes up to a61532faa5a4d5e021e35b6a4a1e180c72d4a22f:

  tcg: Add tcg_constant_ptr (2022-04-20 12:12:47 -0700)

----------------------------------------------------------------
Cleanup sysemu/tcg.h usage.
Fix indirect lowering vs cond branches
Remove ATOMIC_MMU_IDX
Add tcg_constant_ptr

----------------------------------------------------------------
Richard Henderson (3):
      tcg: Fix indirect lowering vs TCG_OPF_COND_BRANCH
      accel/tcg: Remove ATOMIC_MMU_IDX
      tcg: Add tcg_constant_ptr

Thomas Huth (1):
      Don't include sysemu/tcg.h if it is not necessary

 include/tcg/tcg.h                |  4 ++++
 accel/tcg/cputlb.c               |  1 -
 accel/tcg/hmp.c                  |  1 -
 accel/tcg/tcg-accel-ops-icount.c |  1 -
 accel/tcg/user-exec.c            |  1 -
 bsd-user/main.c                  |  1 -
 hw/virtio/vhost.c                |  1 -
 linux-user/main.c                |  1 -
 monitor/misc.c                   |  1 -
 target/arm/helper.c              |  1 -
 target/s390x/cpu_models_sysemu.c |  1 -
 target/s390x/helper.c            |  1 -
 tcg/tcg.c                        | 34 +++++++++++++++++++++++++++-------
 13 files changed, 31 insertions(+), 18 deletions(-)

