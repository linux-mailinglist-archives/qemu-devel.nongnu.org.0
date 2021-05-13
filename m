Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C895337F7E5
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 14:26:56 +0200 (CEST)
Received: from localhost ([::1]:43234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhAQZ-0005ww-PK
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 08:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhAK7-0005y3-1i
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:20:15 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:45022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhAK4-0001F2-Rt
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:20:14 -0400
Received: by mail-qk1-x731.google.com with SMTP id a2so25207800qkh.11
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 05:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g1dre5MhiuZPYnrEa2+UY6WhQG0mVZO6/7VUEL21OvI=;
 b=oo3Bj1KfNDubFhbiL3xYe4GWbZELu0F/MoTJNmBh6JtZ15+Uv8omVnT/NurjiNlcXB
 +31SU3eUXBB8TgdAGfhUQODi9k1CejdUh1V2ZVVB6Y6mJHNMLiQZMyws12FAtsaxr4k7
 LgnwyFN/avAntwvqSfV3715ySKJ5aNcHXEiht6rF7LnojqrzxySEJmS84+aL5jtvEQ6e
 CHPTKpRVAytmyIIvGRJdNlPDMzYScOd1aoNq4TotVsuogV+yPdo+eLy963iP152dhLhW
 uXUyHVbdh2csbxMawVkLvnf8Spn4cG1BUEPGnKv9ZY6k2Vb0QPPeEubCUXrfBNiyD8Fk
 LSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g1dre5MhiuZPYnrEa2+UY6WhQG0mVZO6/7VUEL21OvI=;
 b=abwbCXcMMlf3BMXIWk6OO9v3Nk3VtVlDdoPVUMpnjDqiTqMc4BHd+lTTqSa8wn8xWt
 LXMgwxoyz2PLZVylhDUjRXGJdTOfpqN78ukRd+SKRIscZUNH3lunTNGyCbEn7SqPZU5A
 OQLCGzXF+QNJaLpOX2iBDHWzZawMEcZBD6LYTkj9XcLCjqaa/SmZsrx+Lq5WRkxQYnr6
 h+jusT3gI3r1/PUej89j7rAfqkswLyppc8uta1fnZFVKHl9v2cexIIrozEeaOciIzAtZ
 fdF49ukI99DuD1dcNIYl4PXdXkk4hC7w6aiKZImkeif+LEHUGGxmlfeGCOM6IEeFlu+N
 EuTA==
X-Gm-Message-State: AOAM530aN8oJFdSWZk00sjhxdu4ezepnm9f69gRHa3jc39NDovAkVezK
 HkWAo7krVU0nh9qjlYMgYK+FzJQ1+mDS0G0iz6Q=
X-Google-Smtp-Source: ABdhPJwwcnNbQaNyizyG1/ouo1zuQ6u5ksiakx+NiZaw7lUflBPyGOeC/23Eg0IOFLCvn8yqCFJhtw==
X-Received: by 2002:a37:a751:: with SMTP id q78mr36592460qke.482.1620908410447; 
 Thu, 13 May 2021 05:20:10 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id b3sm847262qtg.55.2021.05.13.05.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 05:20:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] tcg patch queue
Date: Thu, 13 May 2021 07:20:04 -0500
Message-Id: <20210513122008.207491-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 3e9f48bcdabe57f8f90cf19f01bbbf3c86937267:

  Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20210511' into staging (2021-05-12 17:31:52 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210513

for you to fetch changes up to 9bcf4c52f801966b10f802e65c3ecc8bbbd8c660:

  tcg: Add tcg_constant_tl (2021-05-13 05:42:44 -0500)

----------------------------------------------------------------
Minor gen-icount.h fix.
BSD cpu_signal_handler fix.
Add missing tcg_constant_tl symbol.

----------------------------------------------------------------
Matheus Ferst (1):
      tcg: Add tcg_constant_tl

Philippe Mathieu-Daudé (2):
      MAINTAINERS: Add include/exec/gen-icount.h to 'Main Loop' section
      exec/gen-icount.h: Add missing "exec/exec-all.h" include

Warner Losh (1):
      tcg: Use correct trap number for page faults on *BSD systems

 include/exec/gen-icount.h |  1 +
 include/tcg/tcg-op.h      |  2 ++
 accel/tcg/user-exec.c     | 14 ++++++++++++--
 MAINTAINERS               |  1 +
 4 files changed, 16 insertions(+), 2 deletions(-)

